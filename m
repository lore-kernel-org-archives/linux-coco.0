Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7658215041
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018920; cv=none; b=fquN78Wf0xwrd8jXIEdt1go0Pme7CE01nhcdBoipVtylIu78FhFCLl9W2LC9IzDkQMxoJlgA5/wn8qeIIZ/csiMZpORA7b1fnvhKFwV7qdkLWulAWXZS41njQJzIFOAMp/MH72EmdoNN3rFtcfYYDVCfIJRrI5H8gFxtguR98a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018920; c=relaxed/simple;
	bh=LbJNoTrvq+2ziXPQ6cPoGKYMHLbQOYW28RIh2EZ+nAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Sa7VwWTwGs2fSpeCfUZJKWuPZjujbxRLxJT/In9kaiKF3lKni9yEFpJThU8QvhzBV3G1JtvC7wVDvWFfBEI9ijhcGd8jrBDSXrN+W/BYBju+D5ktwUY06OeBVeh8rz8T64+YEy+kz2puCExdGufCv64WheAAzNJUzcTGhwA+kPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LPVGhCdH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LPVGhCdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741018917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XaU2dnDpqgEzFLAHxVwOT4KJt49Y2FVgJePw+X7Ose8=;
	b=LPVGhCdHO0vuhuIYyMLbvC0JERbzKsqhW8WzA8fo/Z0itfo91uvsdxzcuwDZkr+qVuzy0n
	ar33qAsYezmbEnQAGwRURVcgW9F0tdhnn9lx3uXyVeXFSUf+xnYX8yYRGGiJsXxvEOtWUr
	RgWsX6JuDBTE5KBBVHQc2Wb+Sa1tVaE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-08yAEK1TPBG9MPhPs4KqDg-1; Mon, 03 Mar 2025 11:21:56 -0500
X-MC-Unique: 08yAEK1TPBG9MPhPs4KqDg-1
X-Mimecast-MFC-AGG-ID: 08yAEK1TPBG9MPhPs4KqDg_1741018915
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-390f11e6fdbso1353757f8f.0
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 08:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741018915; x=1741623715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaU2dnDpqgEzFLAHxVwOT4KJt49Y2FVgJePw+X7Ose8=;
        b=CVuyvNd3pSArksNIaaBMBR2TooQNhb1QCrW8dF+SXw8dfbxakJMrxA0oxfD/TKoymK
         TbfKdf3dhuzRUIsfNJ2ycJJwPZKZZ97Cky2UR3jiUM438hNeIM5TnLDEhIqYiNXe+0hX
         uBmUXX8Ieo+p0XclWPOJLtrcpnjz3QNLrp61BEvIF9HMeWSlpY/UOPjHUCziqOmHOC/P
         gZi3kFhWCkL9SVorW/7RRXBt/NlpcjF4ae2oo210kFEcY+kJTU9SS4sQrkAT5quxM79b
         mq6SoXB5PC4BrCvYYVXfztWHz788V49SaqgNSs04rZoUISVs2BIwN6NysjyQ/glMGEz2
         TG4w==
X-Forwarded-Encrypted: i=1; AJvYcCVd3SQCx2jzYeSNunbbnW1MeX2hCA+ectkPSy/qqvbfLlhclgFtdx2jRhHmsu1VEYmC05W4wz85XCv8@lists.linux.dev
X-Gm-Message-State: AOJu0Yysv3HCg7spBYt1V0Hlv7wYMhsolCe6+msaetk2JMgZXyaaQpYc
	JZpC2+SGuMJvgrxy4kZ+S029greNNNUeDFl6KqafKknpjQ3WU4A6mabmY2fxC2qk5Y5i4FLIqIr
	d6EwQdjEeUAQphDIkdvL5Dg3iVnx0QYTWTPY1EpLcaozK22F8e4CnzzSDliY=
X-Gm-Gg: ASbGnct9r8yzaA9q+WpoBTIkikU/QXmWtykZSANVPYRFhL59L7VQ01txN9mctYrrvBk
	7sp+Eskq/+Lcp8RKmcF3D+XoXfjvmqIJKzgvNaJKp3d3w/VF/rLptf28ESuAkh2l9kMSJlWz38J
	1Ars/MvPz+WyVo746tKPLdXN+MoNjZH3OCCKmqsVhTkstLu/zR4XVOUFSHBXUd3WNT5nkITHPgm
	ZrzMduHOaBL5Z2yUYPI7we4l2HcSc1UacJilZ4xg8izfbfQDUNR9BVwu+4x3ZGyTbwmJM3/m1I3
	iHjCi6JZet1luTxCQnfReSDbkeOkc2KvgwD4CXOgTNAOB26Cr9UlNmvr3GrByOKw
X-Received: by 2002:a05:6000:18ac:b0:391:454:5eb8 with SMTP id ffacd0b85a97d-3910454634cmr5710007f8f.48.1741018915178;
        Mon, 03 Mar 2025 08:21:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6QrksmkiLyGLOBejTcc1pl1o5yPlizUYl4FhTdgmEYaBVAixN64pSnMJJOGRErw/KFrdszA==
X-Received: by 2002:a05:6000:18ac:b0:391:454:5eb8 with SMTP id ffacd0b85a97d-3910454634cmr5709980f8f.48.1741018914747;
        Mon, 03 Mar 2025 08:21:54 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965f3sm14808634f8f.9.2025.03.03.08.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:21:54 -0800 (PST)
Date: Mon, 3 Mar 2025 17:21:49 +0100
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
Subject: Re: [RFC PATCH v2 3/6] tpm: add send_recv() ops in tpm_class_ops
Message-ID: <3p5erujbhxw7ozdnfpmresv3dqdh2xszolv6mh4khkagoy3wit@ow5qht4keh4h>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-4-sgarzare@redhat.com>
 <Z8Jmps6AF_geaHUw@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z8Jmps6AF_geaHUw@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nuDFn69DnfNkXFPq2x3s7ipndbyvwtgEKREhzg5azVc_1741018915
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sat, Mar 01, 2025 at 03:45:10AM +0200, Jarkko Sakkinen wrote:
>On Fri, Feb 28, 2025 at 06:07:17PM +0100, Stefano Garzarella wrote:
>> +	int (*send_recv)(struct tpm_chip *chip, u8 *buf, size_t buf_len,
>> +			 size_t to_send);
>
>Please describe the meaning and purpose of to_send.

Sure, I'll add in the commit description.

Should I add documentation in the code as well?

The other callbacks don't have that, but if you think it's useful we can 
start with that, I mean something like this:

	/**
	 * send_recv() - send the command and receive the response on the same
	 * buffer in a single call.
	 *
	 * @chip: The TPM chip
	 * @buf: A buffer used to both send the command and receive the response
	 * @buf_len: The size of the buffer
	 * @to_send: Number of bytes in the buffer to send
	 *
	 * Return: number of received bytes on success, negative error code on
	 *         failure.
	 */
	int (*send_recv)(struct tpm_chip *chip, u8 *buf, size_t buf_len,
			 size_t to_send);

Thanks,
Stefano

