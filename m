Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8924921C170
	for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272947; cv=none; b=k1HlxpoRIsex/7qJB9Jhf/Ft6YSZZcO34oT6yV1c0zaICJQ0Kb4nyChh8ogcNoZFdNlHiSZYR/8TMGg7MP8UUozUWsrmVkW3kTPZGBBSpNAuu/D1hnIE6jmZCy36eE1aT4dBpqNxD/G4Dw36LsDukWnpE7P9ECXVXwfWRaASvQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272947; c=relaxed/simple;
	bh=mg9TTr2igANmwpfSP2Bjaog3EnCruAP6eGH7IneMLUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pfvSNYUasnoxEuOLVXbZPoHMdcKPtkQoKskiwA7B4iHV36r6DQCCjj25ffRyN7Nlifvp8EwcoddZN9II29TbAWlnOk/hYWj5qgatdDmHHC1g6X48Yvrggg93MBOgCE6yionaS1dOheooDWzSO3ICYE4rLp3Vxa/nRQa3NJsNAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJqTYPJr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJqTYPJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744272944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWDzicHLsBgJ4w8qzf+KZj6VBuv5e32hgZSRqmxhhdU=;
	b=QJqTYPJr5mTr+PmxrkTLaesL8NiELQ0FDVxT9ErJbS4BoO5SN/n2pKa+ObnCk8o80ciY9/
	zAVnjYkzkBzykTm+ZByimpuvO90osQ9R0zO2NKxHdOePrE6kILulwE8/Mvn5w6sgOXsCgE
	Cp5RNj7lSgPqFXfedZeaCwVXZgft85E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-xPus9ck9P6yqXr3C3mO4Ng-1; Thu, 10 Apr 2025 04:15:40 -0400
X-MC-Unique: xPus9ck9P6yqXr3C3mO4Ng-1
X-Mimecast-MFC-AGG-ID: xPus9ck9P6yqXr3C3mO4Ng_1744272940
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac6ebab17d8so56499366b.1
        for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 01:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744272940; x=1744877740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWDzicHLsBgJ4w8qzf+KZj6VBuv5e32hgZSRqmxhhdU=;
        b=qgAV9G1BjtTWPmJli6ei8IqSjktr7AMcCUQhTKMHMYYWH3o3f/RPe9TukgmiB1KlLn
         MCVnWFzCYYNzUTiO3SklkEzs662EyVCIuD8+h6Z55UxuEmF6CYhfr3i8shkHJKpGQGnG
         a5ytdpLk5IM3xc+5044sBUP8mxXo0ax3AUKK2cJHFK3TF1hbN2WL9OR1I/CMBkdyx843
         DjCE8UvUdWdtPXsPXMzxtSjarGLYl4NtbCPpyrDe5efoz5g9D+zcbvxgL9FhbiaIWBgg
         7fS7TRivmlbYXtwgfMUSU+Vo4tQxtyR3Df8nd+onjd52pLr9LkPQ9LzDYRdVlF9Nh+uE
         j9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFzTCoxRWh4IfHDLjKd6I8qRRmajVAJaCbCX++/zJaARszqO+mSQBeHg+OmwLAek+lmh8fOQ23NSHC@lists.linux.dev
X-Gm-Message-State: AOJu0YxKXmpdgd9DAnlbHxUUSHQNDvWRQgkRiOeXWJf6KHimwtAdSFkJ
	qM7QfIOZhkyOn9C5599mJv34FzkcZFEIXHo0hX1nz494NQozIR+sohdEwcHskDCvMzvM33kamr3
	KHKDmxLXucqQEvQRomy/aCc75JUGIU5s2Qd4JjkZfrsUFKAYfgAbGOxF55B4=
X-Gm-Gg: ASbGncsyUQu885Zt0lWgUD773rMeSiKQT6xa1nBeQ1Gla5Q8AwdMHGmRjP79/o0v3FQ
	6GuN6FqTbTGNLeK+tT98YXXqXJlH77/S8TwaUqwIUSwYyUZ1hO9lXFaAzaoczvad0umfcjNFHfH
	y/SoURY/ZbKUgfvZXQ6Pg3DxZgbnCkLzbC6GfYU9eZIxKCBmoc1sG0/Dm9vgieFeAwpqxBEHrfS
	PwcrGvs1wsx29o1x/+KeSM6JwAIeFsJskJOb92LWyhOm5g/4dE7e8leeRCEnanoTwHMQVeFEGi6
	Ox+4MZ/UOji2r8BVZV72z8PWBzrSFvX5/3k7aUZfz7nSUpYp375+F+SCs3Av
X-Received: by 2002:a17:907:e989:b0:ac3:d54:d825 with SMTP id a640c23a62f3a-acabd3d802cmr206595766b.56.1744272939745;
        Thu, 10 Apr 2025 01:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKuq1jrLQYQCt2MWuX/DTVpWgnqHWa2JwTl4MRzpVmRvMRnfirH5uXIuSine+27SzbE/Kw2Q==
X-Received: by 2002:a17:907:e989:b0:ac3:d54:d825 with SMTP id a640c23a62f3a-acabd3d802cmr206591166b.56.1744272939208;
        Thu, 10 Apr 2025 01:15:39 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4142sm229097166b.101.2025.04.10.01.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:15:37 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:15:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Joerg Roedel <jroedel@suse.de>, 
	Dionna Glaze <dionnaglaze@google.com>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
Message-ID: <xfwwxtkphwlkrpemprdyju6zahwh43tijdlbzivtokqtcfvvxw@a4ujdfs744tm>
References: <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local>
 <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
 <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local>
 <o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl>
 <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local>
 <CAGxU2F7r_fWgr2YRmCvh2iQ1vPg30f-+W6FXyuidbakZkwhw2w@mail.gmail.com>
 <20250409113154.GGZ_ZaqgfRrrMij_Zm@fat_crate.local>
 <6e5bf479-ee95-a996-5845-1f76730e2488@amd.com>
 <20250409184507.GLZ_bAM8LCPXKn9xU1@fat_crate.local>
 <bf8b7522-f34b-f7bf-11a5-5f6a223129eb@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <bf8b7522-f34b-f7bf-11a5-5f6a223129eb@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MAEweSu4W_8SzGR3ATL08LFyP2LwxoIzgd2eJdg5XC4_1744272940
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Apr 09, 2025 at 02:16:40PM -0500, Tom Lendacky wrote:
>On 4/9/25 13:45, Borislav Petkov wrote:
>> On Wed, Apr 09, 2025 at 11:07:49AM -0500, Tom Lendacky wrote:
>>> So the vTPM driver wouldn't change, just snp_init_platform_device():
>>>
>>> 	if (snp_vmpl && platform_device_register(&tpm_svsm_device))
>>
>> So this basically says that the SVSM is always sporting a vTPM emulation. But
>> you can build the cocont-svsm thing without it AFAICT.
>>
>> So I'm guessing Stefano's suggestion here might make more sense:
>>
>> https://lore.kernel.org/r/o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl
>>
>> considering it all...
>
>That way works for me, too.

Okay, it looks like we have an agreement! I'll apply that and send v7.

Thanks,
Stefano

