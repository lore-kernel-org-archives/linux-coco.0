Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF59225A5A
	for <linux-coco@lists.linux.dev>; Thu, 19 Dec 2024 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734622557; cv=none; b=mczvlWRTMw46VUDrIQabVMNXCuGBfzReb/G8rnSmNubiL7xvHFpe3qVjbLDpzzlkUgEyj+0ILcxAXhmZSpX7k31PAtTJtmeK9DbBbhqwccaem9Ych6d2n0iqzHmb/2MAPFcfq+qp6hOpw9C7npIduXpueMsikk9MlYy2aB2FMyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734622557; c=relaxed/simple;
	bh=UHleueck9CKLJf8SAKd40mLejhBOJXBHztTRdmvdD7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HfUPy/xqhJSToNQ6QizQmVYht2IsfyrF3KBwcD/kvtr1K4QiZJr7xePnyyxsVtJe0mCykC5SQbLUDRKinL4F7Buu8U2GnJ0CPXzQui7IjeOBDmIOUWJopj280oWGRMOhBi9BLC9dOoiIo/coAQFXK+vC88QPDhkUagR33ZlVFoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HitqYoT7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HitqYoT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734622555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okQ1fdfaEip08JNQz75y5j89eYX/clZZBcTctSXfink=;
	b=HitqYoT77Oct0jHo6F1gMDvgjk7ZqHuUiWzQbJSm4bQG4GKrclZWKMwpT8gKM2hBEt3Rpw
	FUBEQr9eWbN7aP4o0gMq4EZF7/eC1TkqRsbbxQYpgXDFosc+EB+x7ctmsPzjbaACEss445
	VZuN8izTVK8e4NRtlpkZsj/QCt0gcHs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-THm5yEvXMsO_3mFgacWRYw-1; Thu, 19 Dec 2024 10:35:54 -0500
X-MC-Unique: THm5yEvXMsO_3mFgacWRYw-1
X-Mimecast-MFC-AGG-ID: THm5yEvXMsO_3mFgacWRYw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385ded5e92aso427721f8f.3
        for <linux-coco@lists.linux.dev>; Thu, 19 Dec 2024 07:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734622551; x=1735227351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okQ1fdfaEip08JNQz75y5j89eYX/clZZBcTctSXfink=;
        b=LDx/wxm0LmCzDdRScQs2XUv4v7rAnAJP5X8A5Rt20EAGSwcf9wdTN1wwoTyrtKWNQ6
         /ocqzr32ZlF29jcDpP0HgO/I4XTqFxKI73vfrlRqO+tIZR1XkCItb++tKfs/z6tUyeL+
         0bo3avF9IAut3Ay0ApvQKENcfseQ1xkuPMRQxoGyhE5BSLoZPJRQZKhtky5LQStQkolj
         XHodbMOMt7sOgXIVxwAqsGZ/CJjc1Fu8PiGOjNOU9IjO4GLC7/i7U3DWFM9at/Hv5ARF
         TmDemzkdQdXJNTkPivGBllfeyg1u8T86GMO/ggkVeX4Zda3pioWFCYRggahFYMrlCt22
         6jxQ==
X-Gm-Message-State: AOJu0Yy0B3y1/PcHLYjYsBDe/FMpWOD2i6/IWlboGQT/9Fv6HTs7wVjI
	VQ64Vnn0N9wCS5b5W8xwsI4OI8TWhNLjeluzH2bIFj0pKxydLp+ygiSD1C7gcp7EI6JHSv0qZar
	vjFaLZvS/I/JZFqF+HinYTDaHv35oQZaHG7oz5x4zR2MfGUTvPcA12Zdfn/yxSQga7T79Pw==
X-Gm-Gg: ASbGncvtmDVINYjmgX1tHLnBnGI5+KQZwXamAz4CEdOF4xwOYrah+D5+GoHXX1xYQqZ
	WZg0O/H3hRc61JAYiRu4JguO3e0fAl03pwe/IZak0Dll9zi435PMRYyrd0CS8hMM+nlkwuXnjQT
	XIc63IyQAh0onvm5O1cXWgRYr3xyJ8i3q78+y0dA8yvtoRp5QkBGDpG3PLqfFD05XsFNKE6S34u
	f5K4Sb1GVpxNEydnp4wuQrhf5vwQayIz8lCCggDB9MvPxq2gApaQL5rMZW48S625G1LQTvY4F4N
	WlidjMQarBYWVbZ5mZ9H9lu++KOKfeIv
X-Received: by 2002:a5d:64a3:0:b0:388:da2a:e48 with SMTP id ffacd0b85a97d-38a19ae7e68mr3863687f8f.23.1734622551234;
        Thu, 19 Dec 2024 07:35:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFamfbO9O2OJ9k/OnSfDep3NgEc1R0xrHmelVQ4sUSvht3jKmfVB25GlkMf9i6C8wcOxd+tQ==
X-Received: by 2002:a5d:64a3:0:b0:388:da2a:e48 with SMTP id ffacd0b85a97d-38a19ae7e68mr3863644f8f.23.1734622550548;
        Thu, 19 Dec 2024 07:35:50 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-100.retail.telecomitalia.it. [82.53.134.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828f5fsm1835619f8f.8.2024.12.19.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 07:35:47 -0800 (PST)
Date: Thu, 19 Dec 2024 16:35:41 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, 
	James Bottomley <james.bottomley@hansenpartnership.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, x86@kernel.org, 
	Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <CAGxU2F7QjQTnXsqYeKc0q03SQCoW+BHbej9Q2Z8gxbgu-3O2fA@mail.gmail.com>
References: <20241210143423.101774-1-sgarzare@redhat.com>
 <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca>
 <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca>
 <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241211150048.GJ1888283@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qOG-z4sXRCHwQhAsGb7Wv_3_67HWWh6_XWQkPOx0SK4_1734622552
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 11 Dec 2024 at 16:00, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Dec 11, 2024 at 09:19:04AM +0100, Stefano Garzarella wrote:
>
> > > After that, there is no meaningful shared code here, and maybe the
> > > TPM_CHIP_FLAG_IRQ hack can be avoided too.
> >
> > IIUC you are proposing the following steps:
> > - extend tpm_class_ops to add a new send_recv() op and use it in
> > tpm_try_transmit()
>
> Yes, that seems to be the majority of your shared code.
>
> > - call the code in tpm_platform_probe() directly in sev
>
> Yes

I tried this, it's not bad, but I have a problem that I'm not sure how 
to solve. Basically, the functions used in tpm_platform_probe() (e.g. 
tpmm_chip_alloc, tpm2_probe, tpm_chip_register) are all defined in 
drivers/char/tpm/tpm.h
And in fact all users are in drivers/char/tpm.

So to use them directly in sev, we would have to move these definitions 
into include/linux/tpm.h or some other file in inlcude/. Is this 
acceptable for TPM maintainers?

Otherwise we need an intermediate module in drivers/char/tpm. Here we 
have 2 options:
1. continue as James did by creating a platform_device.
2. or we could avoid this by just exposing a registration API invoked by 
sev to specify the send_recv() callback to use. I mean something like 
renaming tpm_platform_probe() in tpm_platform_register(), and call it in 
snp_init_platform_device().

WDYT?

Thanks,
Stefano

