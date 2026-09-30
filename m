Received: from mail-lr2-f40.google.com (mail-lr2-f40.google.com [74.125.230.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A851123D
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779663; cv=none; b=OA9x5nVopOvS2/lPgY+n7sfP5cjsiQ0v6URx+/afYjeBeVZOrtlQroCLLzY336xSfhzGMCnCA98g0k2o2s4paZRiGMUSl3WNszQ/lwLgwmVTypzimfKonRS6JeYEuLH/0NUhi2zooSAIDKbHLJNBPm1NKiojwLGEML3t4tXpgYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779663; c=relaxed/simple;
	bh=2bJatBzAYcCk1VuDyjZ7beVPB8aZyCvTIcDIZIN7xlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNEVsqI1mGHQ1da7jrMkW2Xw4408tuWBe4JBlSJ+rL3a9LpMBQRr7ieH19gGQByCuzklVqXSf6kSdtifNnnt9TaEKFf/3kEcua89ZI+PRqW5tvDEKZqHpZfpDSQgAMwFtnBhmWFEma46ghax2k9Y0m8l8Ha2K6KmwOpKFf/IQgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=uhofek1a; arc=none smtp.client-ip=74.125.230.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="uhofek1a"
Received: by mail-lr2-f40.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so46427091fa.2
        for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1790779648; x=1791384448; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aY70AEYx6MIgqGoDnlt8OAOLQ4i8odTt91o9/5DhGSA=;
        b=uhofek1a17aBDOA8MLgOnLMNeGiXCNia/3RqZBSeVSqTytTqOlNqZJDF6TGCm82Vc+
         mmeqcrWpdKHugyBT5E6XFSzW0WQZN7SQejMqFlM1Rl7gSryLHRVwC4NFS7rkeDY1CG5T
         uIaM16z2FRRaDK8i7pf6n10k0rNG2YPJy8K1rS5lkMAmOTCdySWqKPVBFxGTrtEzq4Cw
         VqenhIyyFHOchOJixERfb/OYTMxhREkkKiJVt0xaMpBdOsHpq/Y1CwjCdFdyclzRcblw
         ajxtCa+I7z+WEVonqWKep6noFB6OttIX3pOtCZeQcFUFefDPC9lIkz1DR95ZQSoDUxC0
         /LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779648; x=1791384448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aY70AEYx6MIgqGoDnlt8OAOLQ4i8odTt91o9/5DhGSA=;
        b=rPBiFU0IBQ5WCHuOjazNSiAO8QZ0zBLD+UOILqhmlHmyPbuiF2ADwByty3bh1oiyTJ
         DUL3Q3s5LGmtD6ZOaygdbPgaDTct3RBHGkgwFXNS7eF6llEVj2IUcrJ+Gffy6BDYCBbs
         8F29UBQmcwhWZqyxY8QW4uo0dv6q9EWWn4y4g7J7h64Me9ezb8px+PuEvgh4ERi6hyFM
         RytodoS7a2vRd1IbyqQfpeM0ml3r8lkvdNhVdA7feI7WDKQSIE3fF07ZynR5sJRVW2Nu
         hQzN8faS732ADGtlwb6gFWl2ThOgf3i14mxsgs/rg/Ell6J74WpcCtxuQ1ztkPA3sJL3
         N+nA==
X-Gm-Message-State: AFq9FYKEKcDBcILnLoa7+q0cZBbQ/EtA5BR9qhzhiaJFkx05fbiKIXfC
	8xx1JDm5z42K3PoNRj14lt3k3ACMlYHTGnCCjAg1P9qrmRoS/fkygbFfV1AgWKbznGA=
X-Gm-Gg: AYBFou2egfI4RIGbPA0va7GgquDWBCk9VGo+VXUEL3mtKzQc0h0hIcmKfRZRA5sDxn+
	zaHYZhb5vwhaOAr37BXJUSv5AQj89sIGfmwjYpHp3J6k7ucCP/hmw8zWob7s31/IeCJ4xQPOK06
	abL7i0ZW4vdjFj7VdKoOdbNOw3v/bt+seZpHCfYsUlePqYmHnWuYALuFfXkAEZgmMWf51tp+L5T
	H6uFK1qPwHqvwtmt7Wq+vS9WM2HzmPqDtnu/Yej3TSZhgVrD5k2z9QyJUUvwJF98Imbw9wzf6yM
	E+j2fpenSlVXFeanAU+1gEaufgvPLtiwJgglLfvqdE1YJrUdFXu89EiOjhtY0xrWEcjjyCZ+0Ik
	HYvoBewZmnBjuYSmAD9W8Z1/HjJRSe3Tc6GA+IHEgtYt41k6Y3UhEHwu5cw+5psaBrimfYzFODk
	9NdCbOWvJ8BhlnHX1q3rFlFmKDoVlbpm40wKGED+vGy4mUsnKBM3bztwPZ4YU/7ShVJdf0TpHRr
	4lfrl4ow/o=
X-Received: by 2002:a05:651c:a10e:10b0:3a6:4c3d:978c with SMTP id 38308e7fff4ca-3a7791afe63mr4436211fa.16.1790779647918;
        Wed, 30 Sep 2026 07:47:27 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77192c19csm8140371fa.29.2026.09.30.07.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:47:27 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:47:21 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Quigley, David" <david.quigley@intel.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, 
	driver-core@lists.linux.dev
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <ar0gagYLbCbxT2Ay@FV6GYCPJ69>
References: <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
 <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
 <20260902150125.GD2890729@ziepe.ca>
 <apl39vOiMPP7VloW@wunner.de>
 <apqSAQykEK3MF9AO@FV6GYCPJ69>
 <arzr32ZDComnfmny@FV6GYCPJ69>
 <b32438d2-4470-44b6-aa62-b691f93a2b9c@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b32438d2-4470-44b6-aa62-b691f93a2b9c@intel.com>

Wed, Sep 30, 2026 at 04:14:00PM +0200, david.quigley@intel.com wrote:
>Is there a way for this to be posted as its own patch set so we can provide
>feedback inline? Also do we have any other potential uses for your proposed
>ctlv mechanism or is attestation the only user at the moment?

Will do that, still need to do some work on it before though.
So far I focus on attestation with ctlv, as that is my immediate target.
But the mechanism is quite generic, easy to be used by anyone.


>
>On 9/30/2026 5:22 AM, Jiri Pirko wrote:
>> Fri, Sep 04, 2026 at 11:52:12AM +0200, jiri@resnulli.us wrote:
>> > Thu, Sep 03, 2026 at 03:36:54PM +0200, lukas@wunner.de wrote:
>> > > [+cc Jonathan, start of thread is here:
>> > > https://lore.kernel.org/all/20260902150125.GD2890729@ziepe.ca/
>> > > ]
>> > > 
>> > > On Wed, Sep 02, 2026 at 12:01:25PM -0300, Jason Gunthorpe wrote:
>> > 
>> > [..]
>> > 
>> > 
>> > > > I've asked Jiri Pirko to work on
>> > > > the PCI evidence uAPI based on his deep netlink experience
>> > > netlink isn't well suited to transport large blobs because the nlattr
>> > > len is u16.  (The len of the enclosing nlmsg is u32, which is sufficient.)
>> > > 
>> > > Previous approaches, including the one proposed by Dan in this series,
>> > > work around the problem by splitting the blob into a sequence of nlattrs.
>> > > I think we should instead extend the netlink protocol with 32-bit "jumbo"
>> > > attributes.
>> > > 
>> > > I suggest we reserve bit 13 of nla_type as NLA_F_JUMBO and use the
>> > > the first 4 bytes after the struct nlattr header as length (if the
>> > > jumbo flag is set).
>> > > 
>> > > 
>> > > A second problem is that the size of a socket buffer's linear data
>> > > is limited.  Also, copying the blob into the nlmsg is a bit wasteful
>> > > and we'd want zero copy instead.  The solution I've come up with is
>> > > to attach the pages backing the blob as fragments to the skb.
>> > > It's very simple, overcomes the skb size limitation and allows for
>> > > zero-copy:
>> > > 
>> > > https://github.com/l1k/linux/commit/6e73bb999128
>> > > 
>> > > That commit is from January and the time I've been able to devote
>> > > to this has since been limited as my employer prioritized various
>> > > AER feature gaps and fixes.
>> > > 
>> > > I worked on this for native PCI device authentication, which faces
>> > > the same netlink blob issue as TSM-mediated authentication.
>> > > Both should use the same uABI for evidence exposure.  Additionally,
>> > > native device authentication may be used by non-PCI buses such as
>> > > ATA or SCSI.  The uABI should work for those use cases as well.
>> > Not sure if netlink as actually the best fit for this purpose,
>> > for large blob transfers ioctl-based iface is probably much more
>> > convenient. I'm working on a uapi framework that make the best of
>> > netlink and takes it over to a fd-based ioctl. I call it CTLV, here's
>> > a link to an early pre-RFC draft:
>> > 
>> > https://github.com/jpirko/linux_mlxsw/commits/wip_ctlv_pre_rfc_draft1/
>> > 
>> [..]
>> 
>> Following up on this, I have a very early draft of an attestation
>> framework here:
>> 
>> https://github.com/jpirko/linux_mlxsw/commits/wip_attestation_pre_rfc_draft1/
>> 
>> It introduces a provider-neutral, fd-based interface for evidence
>> retrieval, userspace verdicts tied to exact device/evidence generations,
>> measurement registers and their journal, events, and device-security
>> state transitions. Large evidence is written directly to referenced
>> buffers instead of being split across Netlink messages.
>> 
>> For this series, the intent is to replace the device-evidence
>> Generic Netlink UAPI and the draft PCI/TSM evidence-accept UAPI.
>> It does not replace PCI/TSM connect/disconnect or lock/unlock,
>> nor the underlying device-trust, SPDM/IDE/TDISP, MMIO, or
>> DMA machinery.
>> 
>> The branch currently contains the core, a simulation provider with
>> tests, and a TDX provider demonstrating the provider boundary.
>> The PCI/TSM provider is not implemented yet.
