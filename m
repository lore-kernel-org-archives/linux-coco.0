Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2693B20296C
	for <linux-coco@lists.linux.dev>; Wed,  5 Mar 2025 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741165662; cv=none; b=kiFfa2pyCW1S7QbJ3x0eLWNKoS6+T2hVKpsw4uCWMcOOxagaBm6XWu0uHZw3Zr4nZnJJ77+mmNFvr2RFYCN9A/k5BrDCHSnnxQKl96sPkXG9ZTdyTy/I3cuoMlQuDyTJ2DBlucf273D/cNPGH6il3vzfRkMSHCf+8E5MlGzldDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741165662; c=relaxed/simple;
	bh=uEYVEqCtoYbzYquK/VaMlg3Ti7944pqijjFq53C1gDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OvE8+lG3KTDtjqaL3bkhwkK0zSgRRJPCX8TlF1CaIn/BIbAFanhPpAJ0tbStD4EslrwFkVV6ZaB+HJfAkCSTS7HJMK/94C3NOOoyY3B842RCEyxBBtvq6rRtmc+iAo8rxLJTKBYT5HBZXJgJ2CPLY/oDx5EQPGa2dSbBSk/nFpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YafUrL3U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YafUrL3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741165659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uEYVEqCtoYbzYquK/VaMlg3Ti7944pqijjFq53C1gDQ=;
	b=YafUrL3Uw3nD2RE1qKGNvt3v9/0OzgVmy6S5/31q7wWBvb/lIkbahBYX0dNp0LvzDJk0kL
	5ZN6veapBs93vCVWezhYU4HzR2UTpgbBtSr7Of5rxhIbX4DxchTJy58OcRpxC43VmfoDeA
	3UJjCZK0LWGoOWwvAsppc2UJJzdvRNM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-gwlQxJT9OV2hYSn6SB2JPA-1; Wed, 05 Mar 2025 04:07:36 -0500
X-MC-Unique: gwlQxJT9OV2hYSn6SB2JPA-1
X-Mimecast-MFC-AGG-ID: gwlQxJT9OV2hYSn6SB2JPA_1741165655
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-abf46dba035so85614766b.0
        for <linux-coco@lists.linux.dev>; Wed, 05 Mar 2025 01:07:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165655; x=1741770455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEYVEqCtoYbzYquK/VaMlg3Ti7944pqijjFq53C1gDQ=;
        b=oxtHnE9zhj3WgOhqVHG1phcxv4wakO2GPPmijmmzxnCAYG4ypc4foa0YQ0dGCXPzyp
         Rh6v+DxACxLYM2reeumpbdy8UERJbNyRXmiW1v4X5l24lljDq4bhlrK3P56JTNPKe/Fd
         KNWTpj3REg1EXm+8ssPnX75JEIEdJihTwfuAgPq21YiRCqmDzFo0MYw1UOF4+1UMGdVL
         RIzJurifnLJmOQP4VPVuvPlfRFofWTbFDiOfEp/UcDQuMadTlNMZ3bqRtUO1FpAjuGbU
         8Mlu0Z2z/0E3WoawvOd0UAh2w+IxJmQ13M+1hO6MR8/QT6KnG+S4xqNGe48V1DOn7/LS
         fbtg==
X-Forwarded-Encrypted: i=1; AJvYcCUBtg0EzJJqMZf+BiAcDShMoPg8UituT3MFMjLgzN8SohY68ltJhf5+RZvahZpeVhyQHt3c2UkfkSFF@lists.linux.dev
X-Gm-Message-State: AOJu0YyHF7K18iqvucPcA+W6LzA7RSHWlCtiiMDIoeaR+/V8s4xNxjsy
	a/7ZusPNhCvvVzxEiVfb441raGfikwngFhCat0uZ7gccwiVZWVF4DNCuvnDj6bh0Imk6rA5g9Si
	z7d6qh8L1sfwWAtQ1QfIe/0BRRw1yNhjFaRLvn10/rnTwf76Oxb+FRzVd6W8=
X-Gm-Gg: ASbGncukmBJG/tudPGYjPPKZB7Yge23sgFnxQSyUv+MOB/7kfgFc3vUGCOKGDP9E3G5
	G3OSy9umplZc+d/vO+Zmq/KPDaRPw2ttP6gSSpPpeGqzlGTSSoldd+f2VpJ0JcpT6/GHuD8Q5fp
	q8PrOLk5LrByylPRfFKF1Z9m0/LicenSw5G0jsQePJNJqktkoqbJtm1QAT7jtZ2C2vJjsEA+myv
	yfR0H+MWMCksOAXBo95NIxbNEmjZdXrdbGq8ay0LPmBiDwKYlTuBpqro/M4C/y102ADvlfzNkmV
	CPxe+nJBEDmTYLtmH98pKncUzcTra+QUW6/7WoUOj7LLIhuBPx8RIl5d1S+UyACK
X-Received: by 2002:a17:907:1c18:b0:abf:44b1:22e4 with SMTP id a640c23a62f3a-ac20d8459e6mr251660866b.11.1741165655283;
        Wed, 05 Mar 2025 01:07:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3mtYAsZxhVAJSSQRaDW6E8YonUSexggQDnhx967E+2X1tR/N3HMP/nk3AgqXd36cQEhZhUw==
X-Received: by 2002:a17:907:1c18:b0:abf:44b1:22e4 with SMTP id a640c23a62f3a-ac20d8459e6mr251655966b.11.1741165654712;
        Wed, 05 Mar 2025 01:07:34 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf7931de88sm476985366b.185.2025.03.05.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 01:07:33 -0800 (PST)
Date: Wed, 5 Mar 2025 10:07:03 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 5/6] tpm: add SNP SVSM vTPM driver
Message-ID: <u3hnfqimgnavrhy4wxa63zorvbjomj5ptoqrn4aqnr5wlnjtxs@xyy6d4merpvy>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-6-sgarzare@redhat.com>
 <Z8JoMrUm9Dnoqgoi@kernel.org>
 <tpi74sl22zqngutzbqp7ajz7khwom2fgth2n3i77houwdqc3gl@obkhgfcagubh>
 <Z8c4Avw2y7k4JODe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z8c4Avw2y7k4JODe@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D7A9L0vM2Uceh3R4xNSRqAAGENlOKcNivLhnyJTRCVk_1741165655
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Mar 04, 2025 at 07:27:30PM +0200, Jarkko Sakkinen wrote:
>On Mon, Mar 03, 2025 at 05:46:16PM +0100, Stefano Garzarella wrote:
>> On Sat, Mar 01, 2025 at 03:51:46AM +0200, Jarkko Sakkinen wrote:
>> > On Fri, Feb 28, 2025 at 06:07:19PM +0100, Stefano Garzarella wrote:
>> > > Add driver for the vTPM defined by the AMD SVSM spec [1].
>> > >
>> > > The specification defines a protocol that a SEV-SNP guest OS can use to
>> > > discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
>> > > in the guest context, but at a more privileged level (VMPL0).
>> > >
>> > > The new tpm-svsm platform driver uses two functions exposed by x86/sev
>> > > to verify that the device is actually emulated by the platform and to
>> > > send commands and receive responses.
>> > >
>> > > The vTPM is emulated through the TCG reference implementation, so this
>> > > driver leverages tpm_tcgsim.h to fill commands and parse responses.
>> >
>> > Why? Please don't.
>>
>> You mean it's better not to have the external header and have all the
>> functions here to prepare commands and parse responses?
>>
>> As I mentioned, I did this because there may be other future drivers that
>> could use it to talk to emulated devices in the same way, that is, through
>> the TCG TPM reference implementation,
>
>Sorry about harsh comment. I think we discussed this (MS simulator
>caused confusion). Anchor this to SVSM spec and we're fine.

Yeah, I think we are now aligned, I will try to fix in the next version!

Thanks,
Stefano

