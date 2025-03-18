Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7570F2080F6
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294659; cv=none; b=oOVQ6rtTnLLi/jRlZxRsh+tq5+cjbOqqytGZTaoofgBsE7bsFEqAyCf+olga4Mf8miJm8jg8F3Y1XxBqTc8UxKCwigd6MoXNXpJiPqwKr6iheLLdGev7VsmcVX9LDSmLy+RGuTctWeN5Okk4ur+JxEQRihxmx0OiFycck/vboEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294659; c=relaxed/simple;
	bh=JjVwiG6JTed8Funsj+Yghz5UOx9ruQQVenphykw5+t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=udbElvLriYGwpnQHYtAwW+OHe5DO456c+DSp+dFHki5EHBuD5mhLFRa6YVIsMz77BAM5WY+BricXX24jBjT12DP3d6t3MTxdwVnFFEjuUJP9Kvcuutqa/l30TGQE7cz8gBLMq1olPn+WNfZlOJzoJ8ZGvNn+XVpkXs81OugyOlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fbnv7ZbE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fbnv7ZbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742294654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vODclRtlESq833QiRMA2SC9kn8teAEC7lQk1RJgpb+0=;
	b=fbnv7ZbETMPyPE7HpDWZwPtJGNFoAe4DEdXsHttDBupJ0RvUjb9IeZxKom5jy8TRtqRsDq
	/ylJ8k0IyeDsTaknupq+Jmd/H0iUQO4xfzbUEsgWlEvaf9U7wYEy7yb0Ig/xBBO9xlBcV2
	mAmTYXGPuzOfQheDcnxWinK9r3A9pj0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-Z_E02ZilPWie0b3zPATkmg-1; Tue, 18 Mar 2025 06:44:12 -0400
X-MC-Unique: Z_E02ZilPWie0b3zPATkmg-1
X-Mimecast-MFC-AGG-ID: Z_E02ZilPWie0b3zPATkmg_1742294651
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d01024089so25495815e9.1
        for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 03:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294651; x=1742899451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vODclRtlESq833QiRMA2SC9kn8teAEC7lQk1RJgpb+0=;
        b=ZtBhtPgrfolsvj4HNtQGfLbRdaAeoKLD5pouJaq0NfHqNlJ9ueLwjG8OS57PdhPEzB
         oRVR1yuETzgYc0hucQIJz+lag0hm+SHrOsxw1MNHD52zEmxVYMDSEy8lL4YW/L/2Pt3p
         no97QKMvn1CwPneH4iipbBDwcQ2xww9g0E1LKpdx2SV9oc/v+4lTEWWV+GVzYsCr5FMc
         LsB4F+Xf9+Jfhg2R3B5aoUMOLOoI8U5bqPuYqwc4fbSoqrwxJ1XYtHlMxv7yaxFLzjGM
         lVr5nJy/Guzb9/fbSUEGRhOYvB5nnU5WLlmPcxZCRZXb38WDVVG3XbITtu4i53neLfuM
         +/eA==
X-Forwarded-Encrypted: i=1; AJvYcCWKAsZwWfBqsUzKBTfBkDsjRtFPdz4fuWLyfWN1s/6DDR2XfBfDl0VX1Ke05gus/OPwNVZVEZ0L7Czj@lists.linux.dev
X-Gm-Message-State: AOJu0Yxik4hlJMJIrKJM4AYnLvdABFBzvF+X7diRAVLQp1B1Ei8WG5Jf
	esBj9JjZkDw2U9+I9KdM7MEgy6v8+bYLZhpSG5yFbn0teosmntr/L2KbjUmfJIu/hJv2ffnZHyT
	KiGulM0zDK8Akx/6V3CQsgYDPoCMaHayii8Xr/HL1jR9E90cneW0IPJfzHRU=
X-Gm-Gg: ASbGncvONmxkEJDc9KwJKyV1qw1Q8MCbpj8rXD7e4LMVR89/vKY4INnSoe/2K53TEc9
	L3kVe+xqXkDljbh/2iPreKlCzUBpqTquT4a4aSOH+DlsTaBIU1ZWdLjJDHsbbVXXB4Q4T+tCSKd
	ULp4PKBpqZAcOTwTz14fsEa7teeZbMFyj0GDPCeKGtnl/4oM3GtzzH7MupAKEpM1seVnPSuUA7e
	zLlWwSuP4qJTumthhwkb+GoasCCYS+iV9A7C7Lj0ZVDjVXzDGcbztU8G7TmFThKMfHOIMTTcC3T
	wy57CyVgQ6iVNNU3/qEPVUGFVSjRMNYlWl5nU2OLwuajQo82xvCA3TVehb8l34LC
X-Received: by 2002:a05:600c:3d14:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43d3b9b5537mr20194645e9.15.1742294651443;
        Tue, 18 Mar 2025 03:44:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc40ALDk8HYZeNcIG4ZWmui1bzdkvrY09zY+lTByGVYf7UuCwtqoNcke3O+q2K99biFiE4lQ==
X-Received: by 2002:a05:600c:3d14:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43d3b9b5537mr20194255e9.15.1742294650956;
        Tue, 18 Mar 2025 03:44:10 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe60951sm130776845e9.26.2025.03.18.03.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:44:10 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:44:05 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	linux-integrity@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	Dionna Glaze <dionnaglaze@google.com>, linux-coco@lists.linux.dev, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 4/4] x86/sev: register tpm-svsm platform device
Message-ID: <nrn4ur66lz2ocbkkjl2bgiex3xbp552szerfhalsaefunqxf7p@ki7xf66zrf6u>
References: <20250311094225.35129-1-sgarzare@redhat.com>
 <20250311094225.35129-5-sgarzare@redhat.com>
 <7c35f370-f1f2-7100-3b78-b595e977e964@amd.com>
 <Z9gk0jg1JLZY4Fk9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z9gk0jg1JLZY4Fk9@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r5uQ2AisM3sAyIKaVLrcv4fRmNFhMLR67PmKeinriYc_1742294651
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Mar 17, 2025 at 03:34:10PM +0200, Jarkko Sakkinen wrote:
>On Fri, Mar 14, 2025 at 11:56:31AM -0500, Tom Lendacky wrote:
>> On 3/11/25 04:42, Stefano Garzarella wrote:
>> > SNP platform can provide a vTPM device emulated by SVSM.
>> >
>> > The "tpm-svsm" device can be handled by the platform driver added
>> > by the previous commit in drivers/char/tpm/tpm_svsm.c
>> >
>> > The driver will call snp_svsm_vtpm_probe() to check if SVSM is
>> > present and if it's support the vTPM protocol.
>> >
>> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> > ---
>> >  arch/x86/coco/sev/core.c | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
>> > index 2166bdff88b7..a2383457889e 100644
>> > --- a/arch/x86/coco/sev/core.c
>> > +++ b/arch/x86/coco/sev/core.c
>> > @@ -2664,6 +2664,11 @@ static struct platform_device sev_guest_device = {
>> >  	.id		= -1,
>> >  };
>> >
>> > +static struct platform_device tpm_svsm_device = {
>> > +	.name		= "tpm-svsm",
>> > +	.id		= -1,
>> > +};
>> > +
>> >  static int __init snp_init_platform_device(void)
>> >  {
>> >  	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
>> > @@ -2672,6 +2677,9 @@ static int __init snp_init_platform_device(void)
>> >  	if (platform_device_register(&sev_guest_device))
>> >  		return -ENODEV;
>> >
>> > +	if (platform_device_register(&tpm_svsm_device))
>> > +		return -ENODEV;
>> > +
>>
>> You could avoid registering the device if an SVSM isn't present. Not sure
>> if that is desirable or not.
>
>Is there any use for the device if an SVSM isn't present? :-)
>
>I'd judge it based on that...

I tried to keep the logic of whether or not the driver is needed all in 
the tpm_svsm_probe()/snp_svsm_vtpm_probe() (where I check for SVSM).
If you prefer to move some pieces here, though, I'm open.

Thanks,
Stefano

