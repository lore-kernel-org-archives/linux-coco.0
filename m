Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EAB267F5B
	for <linux-coco@lists.linux.dev>; Tue,  8 Apr 2025 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110528; cv=none; b=PIFkLLqbn1rdFQBWTwAnJdN6o2fYHJUcg9LHK3rYVIt/uD7pUVgYlr0iiqCqIbL7zG7e8fezxc9m98TnzK24sBX5Nz5cG9pgH8C7u1kSh1/S9THXntDcAaPLGshZm4X3e4iP5+/3mYG8XNhJJNA9LQ47RdvqIIXLdZvwHem14ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110528; c=relaxed/simple;
	bh=pNXa2XEAZKwmP0PbFXg1zjrzFXFnWgnsxFsJ8P7Mpk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GkhRnebtYKO/4zqBmVt49H3E65hzDdBcuh1N5ETIPChsFccVnMUhGBECzxP+d+ApStokVIKMeoskYGgE+OwS+qwe2pKf6isT+rLmDtY7rejCAhOUwMrH22O2w1V1dknV2WRaXwaR69xfvWfPxPvJAsUaSbXz14UOWP00LfrzJeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VS0DV42e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VS0DV42e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744110524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CiWKsYWjlXVdW0Vl66KeGe+yfVSaUjilRJLGAs2qAqY=;
	b=VS0DV42eGfm7pCS+Gqk7f4J0wMO9jYZxVlUCF3jl8Kpamsj8eBNoAXsLC5r0+tN3gLpKp1
	vbDPlzLebci3u5UETGJdzHs4vdSGKNvzFgmLXED+iSFFMU38VBRwZ6PAR8l2saW3Fh/1j9
	GmBB+9pco4u45Hkyx4soCOLv9JxglEU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-HllcVz_JPLq5-3ZZvu-plA-1; Tue, 08 Apr 2025 07:08:43 -0400
X-MC-Unique: HllcVz_JPLq5-3ZZvu-plA-1
X-Mimecast-MFC-AGG-ID: HllcVz_JPLq5-3ZZvu-plA_1744110522
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so44880685e9.1
        for <linux-coco@lists.linux.dev>; Tue, 08 Apr 2025 04:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744110522; x=1744715322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiWKsYWjlXVdW0Vl66KeGe+yfVSaUjilRJLGAs2qAqY=;
        b=teccBvt7T0/p8jkt1crguxgFpvPE6rLT0ucIkq3L/QrS2EBEfRAIiI1c7Mb1dH3ZN9
         XfZMcFVuCpRG7YC1rizlyfy0PaDhBbwWhi5E7xs38YCUyAyW8bFxGbVIQhggtwHzYdA0
         +2f+wrnarneS5Lp+ZG6AYTH9y7OOi6M0SAdRg0rxCmynu/6xoe+UoP/46u1UoGpvRKAd
         3uKXSn/j3VkMvtN6lel6LYeAAjBhy84sOnDjbuFnlDjXDtqeOChOFW7bhEjnmBkzKlLA
         QfLVHJYiWZGRaRtfZ5sVFp2sqaGdCQEyJDsIInFmyYQ/+ayCQ3pFItAgm2OUcmWOsHEZ
         dDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6M33JUuFPPhV7D+arXl8Rca5eqKDmP4q/BpTw9HJRqVqITH8j3V58IYmoH3ywMF1CSjFeXv0MIY7y@lists.linux.dev
X-Gm-Message-State: AOJu0YxHDDDW6gomAhQ2MJ/4JSYz9+NpojuooH1jpl+w6IP5AFSWhlOG
	rfA1D0po7qceYdZHx3y4BqCk0X8DiswN4T1Jv2TdnOsPj9T7yha2sgO/p0/OerRyun7bggWm8JQ
	e0WoZyH4G2EgshpgqdzhtLtaDpSKYgf+I0CgnFydZ7LZG7D5bIeRBqPy9U6w=
X-Gm-Gg: ASbGnctIYt9FkPUN9iccxO7zfoe4c2j3LJoZQOubXJedjQKPLwG5MRve+mfBRaKLoIC
	dXyiz5Qil53Bn63L8hMKSxWcRmccBDOFegN/BTDh9630dcFiRn9nqg0jwjcFC9lohO+haCYPAIf
	J9xYxA4B6vqzOZxU1xaH6EdXq0DOPmM/mi3oqSFwDFqCqUFMj1rXt8bJmnQPsdw5FbLExAAhjfI
	GxitPTGjngQOG5GXR7Xr3CXaRAvxqseketKcEruPwMFQ5QqE+AsZovzWw7ysslT8w+HcptT/SkV
	8Hf3P668rUAq63g9Z36/N+UDkg4tXWIWEvPZMByFrJrKUeK5lJrVdYo4Mnaf9lEg
X-Received: by 2002:a05:600c:1c17:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43ee063fbc7mr118525045e9.8.1744110522175;
        Tue, 08 Apr 2025 04:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWienIwYQBLsRDfxpLTrW6mxw6sjcpGYF27rjIKiWUTsuRHwg0Muagv8RixgT6kwQsR+HJNg==
X-Received: by 2002:a05:600c:1c17:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43ee063fbc7mr118524765e9.8.1744110521621;
        Tue, 08 Apr 2025 04:08:41 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1f27a55sm160617895e9.2.2025.04.08.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:08:40 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:08:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, Dionna Glaze <dionnaglaze@google.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
Message-ID: <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
References: <20250403100943.120738-1-sgarzare@redhat.com>
 <20250403100943.120738-5-sgarzare@redhat.com>
 <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: agIUppNOF3dxjRAPZ_ongqoeGS5t7CnB8x20b8HAwVM_1744110522
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Apr 08, 2025 at 01:00:12PM +0200, Borislav Petkov wrote:
>On Thu, Apr 03, 2025 at 12:09:42PM +0200, Stefano Garzarella wrote:
>> @@ -2697,6 +2702,9 @@ static int __init snp_init_platform_device(void)
>>  	if (platform_device_register(&sev_guest_device))
>>  		return -ENODEV;
>>
>> +	if (platform_device_register(&tpm_svsm_device))
>> +		return -ENODEV;
>
>So I don't understand the design here:
>
>You've exported the probe function - snp_svsm_vtpm_probe() - and you're
>calling it in tpm_svsm_probe().
>
>So why aren't you registering the platform device there too but are doing this
>unconditional strange thing here?

We discussed a bit on v3, but I'm open to change it:
https://lore.kernel.org/linux-integrity/nrn4ur66lz2ocbkkjl2bgiex3xbp552szerfhalsaefunqxf7p@ki7xf66zrf6u/

  I tried to keep the logic of whether or not the driver is needed all in 
  the tpm_svsm_probe()/snp_svsm_vtpm_probe() (where I check for SVSM).
  If you prefer to move some pieces here, though, I'm open.

Thanks,
Stefano

