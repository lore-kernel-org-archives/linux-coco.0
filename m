Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C352DB798
	for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959889; cv=none; b=bB0Oa3bh6L0GDqk/5s/lwGqXhGtObsw3e69AoD3i8mwA6Z7ug+BTK/FM4I2aIOuL1b/VZ4RUyxkeoUhdWbIWHTy1J69yy17QpYB5J+1EFDyZwsVT48n+uSTN2+QjFug5yjuqQWh5mFOPAsp4RUuKNtUAcfTOVzR4Sf90hvu5LZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959889; c=relaxed/simple;
	bh=qB84I5PLMqppF3pGBBFSGnCXPwBNXGSe+RrAN3wymw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAv5BEpMmrByEnnDb4/eeD2EG430yPHoQP6YlRgwEZ08/l1VnPtsnH/BmcX8mZZWq6LQGf/o4f1nRN1VGUF+f07mWuc8M1gLYjWEt2DDMbLGj/h19VVrhBabMBRXPTRi0IuEZ7+j9bFwXD+HKJ2OlnVRZv1TUW11+qwlF+q+atM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Xp/P3IcP; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Xp/P3IcP"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89545bd3324so73293716d6.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 11:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1771959887; x=1772564687; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FrFsN3h74aSMBKIOJ1HcZrCNEQY8luWcshhq585BEE4=;
        b=Xp/P3IcP80JnehU6lVnK0AaSjLvOiZzrLYiX7wIqatIOkIIbY+oBQCJnp4kDsGC2a0
         OV211dOBvX8MV+g2/yo1jXeDjIlhEwsZiACylgXzGT6jaYQ4UHFHGA+By8a6ku7tavBq
         sw0JLUfUxWsTFj6tMALy0skpmUTvB5eNfWZaVmSTJj0RP+eVSLB7imUVn5iLGRtenprc
         BukPW/LVcjHCFYPFZiCL5f6LK/nPRqElV85kCFiN7QYhzA/n0b3i6cCM+dHxwt9cvamX
         fvkrYlv1xO31rocV4j8XThj9rW8smOETjEvI0jKQcXUPAGtbngO41TXrX2N062JAoYjE
         JB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959887; x=1772564687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrFsN3h74aSMBKIOJ1HcZrCNEQY8luWcshhq585BEE4=;
        b=QZdEz5yda48IgC8fQsXwKKR2/0IndG5hMeJyJFGSM61gypbGtjYSelC3rM4mAqQngA
         OQ4tbj825LDQUz7vEvVjTIT28WWdR0RnPShxrgRztkhiIcOsW8/BLFCrsP96Q0Lp94Ly
         29NJin0MW/R+2hrbiUeyP1/EVoeZkBoWZpjvJieCMr/TQRglzbLEifUgktII40exxEbo
         KmquH6r/NzWwGOhyrvSxK/hZ5qnSOCl7SDNwJ3X2XlLPbbI/vFCBvqS2TIAxgXCyuMxQ
         pq/2sh/x7AbdAzcSn/8eQLeiMp0F6L4dJV1ypHUgNLtVxxzYS97/68cjd4SXUa9bABQA
         4Kzg==
X-Forwarded-Encrypted: i=1; AJvYcCUtmc/8F6R+DoV1lmheDvXrmLf87pWaVAiT3CfgfixPW5Z7svLgudJbKoBuGW3iaM1SBPhn/bYb0MHB@lists.linux.dev
X-Gm-Message-State: AOJu0YwISs9v28lrwMl9aQpiuRCU8sk3xLhSWrhf0zi9Pdb/tPg2ceXV
	X+i7w3ludbD5AnLNjzUU9+eeO5S9Z1o7YALY/bpjLqvBI9GmqdPOclSWrrpe+mYNRbY=
X-Gm-Gg: ATEYQzy/xLgc/+5dKj+RPmaN7eARPl2FcZSAlgZ19RiXFdHdHUiwyT3zFOGixttv7j9
	tMTTCiIwzlMOcX+hGpeuhmaidXfzZXnebVZfyr+ZC9rZMvqvm7jGR9EPEMCnywhW/Mu3x/QqGND
	sRRqTVOupRbxO1Hbc9jcrBR/hP9DpKqvARZQaEH60TCgfApq9a5WHhh5hUtxjC5o/FyiMXk1OdD
	7371iBcH5o4hrrmTqfEBP7egjVuWUVUmAii0zJX6DDABFqIVIgET/F1Omk+zFxxZkcdewQ7J3RU
	rhAShWujmGuwav4cGSy2VcSN2Gn67QlVPq+ijKEzfzLjdpkAFwdX5yLcKx/8GSKGMGg/AyHJZVs
	QgCgfqspMdbvvlbVC+QlG7JIgQkYBXGFCW5m8OTklWwi4pgR1OUWPOMP9zYQ2wbi28buUt8qfkD
	I=
X-Received: by 2002:ad4:5cea:0:b0:895:46e:e8a3 with SMTP id 6a1803df08f44-89979c3c12cmr199567356d6.4.1771959886898;
        Tue, 24 Feb 2026 11:04:46 -0800 (PST)
Received: from ziepe.ca ([173.231.112.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d103084sm1292269385a.33.2026.02.24.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:46 -0800 (PST)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1vuxi9-0009D4-Vg;
	Tue, 24 Feb 2026 15:04:45 -0400
Date: Tue, 24 Feb 2026 15:04:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
Message-ID: <aZ32TUEy9CB6rs2d@ziepe.ca>
References: <20260223095136.225277-1-jiri@resnulli.us>
 <20260223095136.225277-3-jiri@resnulli.us>
 <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
 <5z6d2etfr24oscoxhk3samf2bbhtcz6hymf65cow76omagsplf@6gdaev2perkk>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5z6d2etfr24oscoxhk3samf2bbhtcz6hymf65cow76omagsplf@6gdaev2perkk>

On Tue, Feb 24, 2026 at 09:32:01AM +0100, Jiri Pirko wrote:

> >Should there be some global list of leaked decrypted pages such that
> >the mm subsystem could try again later to recover these?
> 
> swiotlb does the same non-recovery leakage. I belive is it not worth
> implementing this at this time,

Yeah, I agree

Looking at the callers the purpose of the return code is to trigger
the memory leak because there is no way to recover from this. We have
no idea when in future the hypervisor might permit the operation and
we have no way to keep track of the memory until it does.

It is not a great API design at all, it only makes sense from the
hypervisor perspective where it can run out of memory trying to do
these changes..

Jason
