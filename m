Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357841D2B1C
	for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931527; cv=none; b=gTGtucNbygXCMv8kUIKCgn5ZYRMRsRcxwKi8X5v0hwFQKcpzV/scnuqrJK++2+lwdk/8hFjHd7j87mmQoxa1i02n3ttJsB9IwV33ja5Ns6L5A/SPJRR2Z41sMtvqVL7qK2fGzpOAH+6j3/7ehI/+b5x966U34OrMvaosrlIAR0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931527; c=relaxed/simple;
	bh=a0hv9mFPITU2NDP0pqXzJbW7Mb2xRwyfM5fwAm1ROFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWssHqL8tf7BHVGTPOu0lSFeyp2djZVJC3yHxBYlNhI3nIU8J3/O9tSCdWVxVSrA2dIe+H93UnOOicqh1HhsW6Bsyw9JpSiPudzaG5ywa9wzBMA9qidiKohDkomVVGaD+E87b1mVRUbbvhYWoo88uLtN0AvXW7ImAx76/jP2cPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=daHChDPp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="daHChDPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733931525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0hv9mFPITU2NDP0pqXzJbW7Mb2xRwyfM5fwAm1ROFg=;
	b=daHChDPpXdCnmIlqwV5cNdaV6Ch+r9dQAFd9rl1jQUZHzqhvsLYKz5TWCYpxnyNdPNWUu8
	hjZj8CYTEs1gYyl1+P6vSiriM/3bi/aJkgAYpKL9VwxGrzmsioTqIJqBzqvD255LM4NAD3
	imEZoaI8rWv833tMtq5wdZnTMA3OSgY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-v2ryhwoRNkKsoc8S7Izs5g-1; Wed, 11 Dec 2024 10:38:42 -0500
X-MC-Unique: v2ryhwoRNkKsoc8S7Izs5g-1
X-Mimecast-MFC-AGG-ID: v2ryhwoRNkKsoc8S7Izs5g
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e399457a216so8891401276.3
        for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 07:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931521; x=1734536321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0hv9mFPITU2NDP0pqXzJbW7Mb2xRwyfM5fwAm1ROFg=;
        b=NIlNmGSBWtGSKXnGN55WodwFtVj0cDb25VztcRYNYtOW2GJ/Q8o0hG6h5BGCf6LDg6
         ejob09MgCVh0Sd6sbXpkICC6zvraLcizV3Y3Q2+VN8R4AoaLO6DHgRpUvs8Qi4sa2NVW
         PMoD6Imb/zQ8tXuqErexwpx8U5Z1wa50mtPsJLUzFnzu/zw58Mxzroeio0hys4tZs9h1
         pkdC+FeOOeFBmZmp4t+g4t8OkzL30VgI62K3tSGQL29ysHPlszy9+0wGKdFl6Byvum7S
         vtwsZZjXDedxkqRATLjsne8MVqUAPB2Hhw9J+Sgi0eFhUdAUY9N+WeMneM8ZxOFFqhr+
         cgaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMMskGy3CPJIMx3cME24NBLcNYQ8zgdOWC98N+T4EImrIUOCFtlmxOYqw3VMx9z1D1MibAy6sP6I8F@lists.linux.dev
X-Gm-Message-State: AOJu0YxdJ+qh1Z8QyXTO3Sb6PI8vdokaRXeoT2b3x9gEMSlCnU1zZg/A
	3XxCXpf/IxQzmnP/7McRJNSPGuRJoqC/bkw2+Drq9tpa27JpYM8kSiXDrkYxek6ZIcv5bXxwxx3
	S35dNhLKms1hJsDHdySa9s4hW9b4zSA3dlQxFgfd8GXX6Bb7EKo4qNZUhCawY6g5P4vqEaZANKP
	hDM41F6pIblatTrKN+HD7Jm4ZPuRh0Cv2AOw==
X-Gm-Gg: ASbGncviCFJPU8Vo7zbHraUOGJl1qo2ENugHrnJN0BNsiKYjWY7X+5iUXjKL+NuRXxX
	CTFrWSXjE/1EtXo4km1NzOLq8gHlBvY6vUQ==
X-Received: by 2002:a05:6902:100b:b0:e39:95e8:31be with SMTP id 3f1490d57ef6-e3c8e4249f0mr2855074276.8.1733931521384;
        Wed, 11 Dec 2024 07:38:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE394UlHqCYe1P7sHFdWBBxDdJetIc75Ei4upOeKARHA2ACI/wc9W2mPBcu4AH1Pm2Pwz68qrAYfHGPQSHdD8g=
X-Received: by 2002:a05:6902:100b:b0:e39:95e8:31be with SMTP id
 3f1490d57ef6-e3c8e4249f0mr2855042276.8.1733931521054; Wed, 11 Dec 2024
 07:38:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210143423.101774-1-sgarzare@redhat.com> <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca> <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca> <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca>
In-Reply-To: <20241211150048.GJ1888283@ziepe.ca>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 11 Dec 2024 16:38:29 +0100
Message-ID: <CAGxU2F5NSqMbA1Lep3+16GoZXR23q0OP8dFVVRJ6DG5sF20R3Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, linux-coco@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, 
	x86@kernel.org, Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U8PzETP-FIi3x13MBMWcuR-Nuld17mzjzwpX150HVxw_1733931521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 4:00=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
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

Thanks for confirming!

>
> > This would remove the intermediate driver, but at this point is it
> > worth keeping tpm_platform_send() and tpm_platform_recv() in a header
> > or module, since these are not related to sev, but to MSSIM?
>
> Reuse *what* exactly? These are 10 both line funtions that just call
> another function pointer. Where exactly is this common MSSIM stuff?

Except for the call to pops->sendrcv(buffer) the rest depends on how
the TCG TPM reference implementation [1] expects the request/response
to be formatted (we refer to this protocol with MSSIM).

This format doesn't depend on sev, and as James said, OpenHCL for
example will have to use the same format (e.g. buffer defined by
struct tpm_send_cmd_req, filled with TPM_SEND_COMMAND, etc.), so
basically rewrite a similar function, because it also emulates the
vTPM using the TCG TPM reference implementation.

Now, I understand it's only 10 lines of code, but that code is
strictly TCG TPM dependent, so it might make sense to avoid having to
rewrite it for every implementation where the device is emulated by
TCG TPM.

>
> Stated another way, by adding send_Recv() op to tpm_class_ops you have
> already allowed reuse of all the code in tpm_platform_send/recv().

Partially, I mean the buffer format will always be the same for all
platforms (e.g. sev, OpenHCL, etc.), but how we read/write will be
different.
That is why I was saying to create a header with helpers that create
the request/parse the response as TCG TPM expects.

Thanks,
Stefano

[1] https://github.com/TrustedComputingGroup/TPM

