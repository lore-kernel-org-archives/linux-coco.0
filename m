Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EBF27C868
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104971; cv=none; b=TYKxwb/ok5M0QFnbBO3b0Q1ic6W7kpaoJvBRCna2ssQtusq67Dh0nbeRZBKCe/pVnfg8o3HyE+XkuyNeU+mCfhUQ7afEqqcA0MhzGE2cAO8sxeaBWAPVPeCLzAioQRDjM6ahkhGwWH3Y6uXKBa5DukmaJVS4uzWonIos7BTgBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104971; c=relaxed/simple;
	bh=ei1atgXGeYYTuLt5guFpMJeVzRYzeQDXd3FashRnRG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bv+xCTJ8mnerG0mLmF3Y+ni6uywznwKt/SkkRsGfBUmgvYgRABk8ONgZJhZJ6w+KKWV9f1nIbkoqRh58Cbzc/mrlJLVqtT8F8cs6dSKYeNZoFW4R14aFD38hfqhv3LSXMRG+ctsLNqD55+MZSUpfvu8SRSbWn6Heb5TiKMKMms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J1pWPtDc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J1pWPtDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741104968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=eqsXsyxO1KVsnnLWSz+A1YdPbG1qCjXfcy058K8vyIA=;
	b=J1pWPtDcvQScI7XOKlpMU9/eLNhkFtfAxMnwhUiJYTfzhK2A68r6T6fQBf81/D5uziIrmV
	p2woFb5+HjzGNF5MJ3KJuWAHrMeuCLkK+MSyMv926nPq4LYiuyUbgRaTjwmKDBdxS+ODvB
	UlgFMpOS4t2BPGTYhC0fb2R9y0R1DcM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-SoXId_HYPyeEfRy_CzZfXA-1; Tue, 04 Mar 2025 11:16:07 -0500
X-MC-Unique: SoXId_HYPyeEfRy_CzZfXA-1
X-Mimecast-MFC-AGG-ID: SoXId_HYPyeEfRy_CzZfXA_1741104966
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394c489babso31995595e9.1
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 08:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104966; x=1741709766;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqsXsyxO1KVsnnLWSz+A1YdPbG1qCjXfcy058K8vyIA=;
        b=p+mEmEM5VPckHLKi3InUNp1T/2/3XqUgwem+XEHcsVCBf3tutcZF95Sm6nr6aoRXFH
         H5DJvnqGggapirlImopMZber5MPYtrpUOA+l8FA1b15GICGc0gUnFRxl/BG1MD6kzpeK
         PBcVGvDgMcjIgaFmqm6/VJbnQkbOf7y0gW0Bnuo5ADYtktF8ZIWmRHSAKlIsR3MDWb/j
         E2Hy+pX8sR8SnLLpxLuzBSkgCiFDPf3y2E9p1t6WdXYblqs1yqsiBppXh+tdq8OxpHPd
         FhjtozMFchypzFaO51EmDcMwzIggNZCFVjPgzQ8MAgy/MUItJhlI1RuUeOrOFx2jXiBq
         MODA==
X-Forwarded-Encrypted: i=1; AJvYcCWkMbl0YfdTUFZTEmkHbTcnoT5FfmdDaDM/NBY1mTIXuSo7k2LezYcr2IiSCfROO9MGc15DBAGk7stf@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9UpWA5datM2KNK93kMAiKBrobh0PnlLdapHLIWMzYjPvsFdtT
	c7RVeHRSOovGoSRvTLiiCBpyxEW6meykSHsZ3PsVggApCp3a9wSHNu+WGeUuhTeBVykI2d7Hlmv
	NLwjtJR8hmYRresjlP0SKlDbseIR0TI2m7C1t9q1wo57LKgbrY07dnyMkkxhUqiD5i6g=
X-Gm-Gg: ASbGncu/IpU4asnnFTyJMqWWftRDnDuJZIlx4fjgYZqOx2F+VEMhKvmkwDGNgCWcB7j
	srMeRTAGP5nRpwlc81zhwoGUxGS5cUZYwE7nUDzEC0u47f2dbmFHf9pDsknHZnoQnW54wCW+zgv
	oV3bTFb6EqJ577m01b7b+lISwXgQ+mDqfl2NnsECb0L14RMxnLy84afaKlafIbNgmx1SxiEb90q
	yQBpsYXiuadB2+33BSpWfQyoat622x8zbWWGQuYyiBO5es4rQPiMzAhBebSz/sy95rSBgrLWDlL
	nVKWGv9NxKYTcyE82ifMJywA/PJMMjAzcuOgAOwo3L8JoBL0B32BIAv8CxXGMQ5X
X-Received: by 2002:a05:600c:3ca3:b0:439:930a:58aa with SMTP id 5b1f17b1804b1-43ba665e31dmr167597685e9.0.1741104965945;
        Tue, 04 Mar 2025 08:16:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGMLW+IQf5vUMjDJYIFiNZkehtlY6JpXLehiUwbPpYYUonprT8sGLr+GR9PNBcKoio1DDnGw==
X-Received: by 2002:a05:600c:3ca3:b0:439:930a:58aa with SMTP id 5b1f17b1804b1-43ba665e31dmr167597115e9.0.1741104965500;
        Tue, 04 Mar 2025 08:16:05 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5329besm228465585e9.15.2025.03.04.08.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:16:04 -0800 (PST)
Date: Tue, 4 Mar 2025 17:16:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>, svsm-devel@coconut-svsm.dev, 
	linux-coco@lists.linux.dev
Subject: SVSM_VTPM_CMD Call question
Message-ID: <CAGxU2F55-JDYqt62rg6HUVEZo4voHrsuPizYxv7mWO+PE0fM-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QbaTxHdD4Ayu6zNrP_PaEjxWIQSHTvPodAFQ5Yj0yEA_1741104966
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom, James,
working on the SVSM side of the vTPM emulation, I'm a bit lost on `8.2 
SVSM_VTPM_CMD Call` section.

In the SVSM code [1] we are assuming that the driver is always using a 
PAGE_SIZE buffer for TPM_SEND_COMMAND request/response, but I can't find 
anything in the spec apart from this:

   It is expected that the request/response structure is large
   enough to hold the expected output of the vTPM request. The vTPM
   request/response buffer will be treated as physically contiguous in
   the guest address space.

IIUC from `Table 16: TPM_SEND_COMMAND Request Structure` the 3rd field 
`TPM Command size (in bytes)` is just the amount of bytes filled with 
the request.

How does SVSM know the total buffer size it can use for response?

Claudio mentioned that in an old discussion, we were thinking of adding 
in the specification that the buffer should always be PAGE_SIZE. This 
would explain the assumption we make in SVSM and also the driver that 
always allocates a page.

If there are any changes already planned for the specification, 
apologies in advance for my confusion.

Thanks,
Stefano

[1] https://github.com/coconut-svsm/svsm/blob/376e4571099ee5e9aab8343c137600e97ebe1b4b/kernel/src/protocols/vtpm.rs#L67

