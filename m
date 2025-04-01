Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB6A1EB9EF
	for <linux-coco@lists.linux.dev>; Tue,  1 Apr 2025 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497938; cv=none; b=M7OtiCu2Do9vLb3XUS6VubjYZPXK7F/7DJAdtS60GUY+/sq5q9qbkR5V8iHyq4Si+hRBJj5S8ZhZKlpXamda2ygfAdYzWqAAU8DRp1oPruYFaX3n52HteGmq2/pMXXaTPkTXY+PsxLuKG71I3A9rYtXZvUuOp1LAP/lPiSZo838=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497938; c=relaxed/simple;
	bh=Cbpy21Pj/PV3ox21YZxNBKmn0C1URS9/DxwZPfFmLPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=I9ADDVV440yoPEJXcFtpz69S+6jM4kQbkBm1YcXn1dE3rj7gcteuK9h0v7bWYGGgzTRr89XR/rwiGl9aZGS/tvncEiLzuaYCTd7/krPUQy2N6EJWlOCfvqwIeicfj4oPz8ACSPxlKAJodw3ZS53Pw+NG7tg8t7sXlH84fbvUBHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EH+xlJuY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EH+xlJuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743497936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIf9d4LKwWJlU65MePabyEnw5zIkoOcPcSvDhqLnyRI=;
	b=EH+xlJuYOtkzmhVBfZvOQ/Q8U9fMPRP5voh0Nn+W6McnRijWJdPCac/fiBo2sS2XSxjoh2
	976eGeJr5I8i652KNLYp7HVfC2yAKLNfPnGo1leb3ipwrnp1mF1iqLoM+Y9d8CDL3mFv6G
	rwi+c9pp+GFxuWYanfF3RMoMfQD/otA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-f8Ys5IQbOEe5lZbSE1glRA-1; Tue, 01 Apr 2025 04:58:52 -0400
X-MC-Unique: f8Ys5IQbOEe5lZbSE1glRA-1
X-Mimecast-MFC-AGG-ID: f8Ys5IQbOEe5lZbSE1glRA_1743497931
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so41848055e9.2
        for <linux-coco@lists.linux.dev>; Tue, 01 Apr 2025 01:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497931; x=1744102731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIf9d4LKwWJlU65MePabyEnw5zIkoOcPcSvDhqLnyRI=;
        b=Ls07VVKmmCjIJtqUaS4Ts2iryg/xrL1sFdoVidKygBJrcv60LIcmxwcruAOnexKtI3
         8N8+Iw5VfX8sXlYuUuopNvYfxYFnjCAsDeN2dBDgwt7UoVYn5iSdLVg+i7DV7qX9xAER
         k91hqka6dzvbs4NOfkGjhMfrL65S8//a/LvKSLZto2rPl1tGpK8KDzGN7/S7LBt8wEK7
         SaQSRxWEcIdXe2SdW8FXiPNZ5yLU4TTw1SdrLspqWvMl9LUJf3k43/YUXyWxiPcCr7AX
         vlT1fCOz547T5J92COHY/tVJBdHny+3kTQKY52+8PiJr9fPC0jy4qlut5LoeWoKIICji
         OUyA==
X-Forwarded-Encrypted: i=1; AJvYcCUPp1AGv0dOcf73DfwkPddd/4hUn2ItT25nqVvJOozQIw8x/XxeRyr23133bhklroyBll8HRm+HJmnR@lists.linux.dev
X-Gm-Message-State: AOJu0YxtyFuT5MHOvMXJkB1HgHWa4QxzE0CW7uCQpxhQHTjkxHbHilGf
	P69gSGI9twKvXwLmetUOtstEqiKAkPbuUJjUksosny3GpM/J9VMTnjkWMB2t7n4R7/oq89XZH+n
	U35JykQQHortBIExIrMUYBKW/FjRVgyBfpu8GZjHI0wxF3SGdtQH0sUIbPLI=
X-Gm-Gg: ASbGncua11KQD5MNDD0vd2y4L6FeWv2rh4kj2WJwjHfIe1tzufKR5gUKqip1ixSKWf3
	wna35bb/vt/XfBe5eurlH/fGJdga8GTkRCiYYo0XAzyN74dK11klf+2xzX40HmUMrC5VtsnUDzA
	bf6UcCwpEfplTzGyXFfcHXd1cHqe0j51U31b4dk/HkV2Pcsb34qx1RaTC4Sgzpf2PIpSLVthZHa
	QSrb/906uoHopnaApksYdaxOtlAmG+PdEL2rPDgZuNVprmMeFC2xHSsxVPguZHqb/NRKZiUcAeC
	9fQly0Ah8nx358jwbHzqd101kGr0FO5NXDFJjkQ2w6oyWNCly0EnPIr/Ce4=
X-Received: by 2002:a05:6000:2b03:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39c12118f9fmr6752845f8f.37.1743497931565;
        Tue, 01 Apr 2025 01:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWnEs6xzLDc1YxYeDtY269xDpZqA1RPcUk8inouSBTPsWMS3grkQL5iiqBKXY3nyZb9YG6vg==
X-Received: by 2002:a05:6000:2b03:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39c12118f9fmr6752823f8f.37.1743497931082;
        Tue, 01 Apr 2025 01:58:51 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e097sm13323779f8f.80.2025.04.01.01.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:58:50 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:58:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, linux-coco@lists.linux.dev, Dov Murik <dovmurik@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <jroedel@suse.de>, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v5 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <CAGxU2F5WtVZWEgJNwzoWUX0gcq8fe6evnU026R1hHXqCfG2v9w@mail.gmail.com>
References: <20250331103900.92701-1-sgarzare@redhat.com>
 <20250331103900.92701-4-sgarzare@redhat.com>
 <Z-rSMi2uCvShLbLS@kernel.org>
 <CAAH4kHY-Orjr_+rcYNemuWrAOOtyrCMD5s6KsOrkX740AARXiA@mail.gmail.com>
 <02190762dd82104070ff1a2942a7be703f4ff53d.camel@HansenPartnership.com>
 <CAAH4kHYwDgnYsMhJ8zZWn1uU4tqqnSXOLKEJNMb-3OCNrM7Z9A@mail.gmail.com>
 <e2db0cef00e9ad6061af8256c71d0198b15a5ddc.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e2db0cef00e9ad6061af8256c71d0198b15a5ddc.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zb1c3a1hCWgDkW6w8imdcW8R3Ydp1O3XnbY4dzb-H2s_1743497931
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, 1 Apr 2025 at 00:59, James Bottomley <James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2025-03-31 at 15:23 -0700, Dionna Amalie Glaze wrote:
> > On Mon, Mar 31, 2025 at 2:26 PM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > >
> > > On Mon, 2025-03-31 at 13:56 -0700, Dionna Amalie Glaze wrote:
> > > [...]
> > > > I might be unclear on how I should be testing this, but I do see
> > > > /dev/tpm0 and /dev/tpmrm0 when I build with CONFIG_TCG_SVSM=y,
> > > > but I don't see the event log in securityfs. What am I missing?
> > >
> > > The vtpm driver for EDK2/OVMF I suspect ... without that the UEFI
> > > won't lay down and event log for the kernel to pick up.
> >
> > This test is with Oliver's PR
> > https://github.com/tianocore/edk2/pull/6527
>
> Well, since the event log is searched for in tpm_chip_register(), I
> really don't think it can be the kernel driver.  Best guess is there's
> something wrong with that patch set (or the vTPM didn't activate in
> OVMF for some reason).

Yep, I also think it should be something in edk2.

I'm using edk2 from https://github.com/coconut-svsm/edk2/pull/62 which 
should contain the commits from that PR + a fix not yet merged upstream.

I'm building it with:
build -a X64 -b DEBUG -t GCC5 -DTPM2_ENABLE \
  --pcd PcdUninstallMemAttrProtocol=TRUE -p OvmfPkg/OvmfPkgX64.dsc

And in Linux I see the devices and the event log:

# ls /dev/tpm*
/dev/tpm0  /dev/tpmrm0

# ls /sys/kernel/security/tpm0/
binary_bios_measurements

# tpm2_eventlog /sys/kernel/security/tpm0/binary_bios_measurements
---
version: 1
events:
- EventNum: 0
  PCRIndex: 0
  EventType: EV_NO_ACTION
  Digest: "0000000000000000000000000000000000000000"
  EventSize: 37
...

If I remove `-DTPM2_ENABLE` when building edk2, I can still see the 
/dev/tpm* devices (of course), but I can't see the event log anymore.
And also most PCRs are 0 (unlike when I have tpm driver enabled in 
edk2).

Thanks,
Stefano

