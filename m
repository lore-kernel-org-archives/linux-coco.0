Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666479;
	b=HkKrN9Un/BcsrLKyiFeYDbHwCi2+NOtXbhd5PRXAenTLPGlFJ68jEIfjUr2U2g5HGeC1
	 lDkE8pB4X/gKffzEI9NUrZuogBvlW+CJI23rzmgF5ntqrO1A/XjDFOYBQtVazL0DFUthx
	 Aw5TPcS3bwHG7mDp2O6r+vAvfRf0P/Wm5jfXVpWEXilI8nJLQsBbI36jA4I6IZcRJpgEG
	 6OK071SqoEPUGrZ4FkA74h5SdwysXj7sFn5BHE4rV+vdtHTcoKHWJmjjSZAYCBCD6tYw1
	 jGiy/7A3eWQNk1JE22GQ74PwE12QJKQmjK3h1q3Py6uFwNCbHE2xXA+fk+PjIHb+eUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wsdeMYd/7eLXCr9Ufg4dZ6+EW6LYxWJjZpkMLdZ1OLI=;
	b=jfZ8CqUTQJV3MEJ2+Pl+tP2RylgrLirdMcULd8Dw+6pgVKev71bsSoAkLEKRsVVqqiks
	 Nj0c4etb8b82aE8Pz08zpZlPlZrB0ClvCUJwCQi7Tm+kgug5R0h74PptThzfKwWG6avCx
	 LZmn0TX2V91D3fE7q2P+OeFZOJTElhA1QssGFdN8xZe/MvQdwiaZnejyYL6L32YbFQ6Nk
	 T8skszhiNOv6sWMYoZjPIHwbgH3mLR/Yr2EjL1N5LR8VcgTW0DB69TATMJ77oTLjzboEb
	 101lbUJPR1bO9o17YDdRE1E6n3gtjq8Hk1U+ahro5LwmHYSsJFsYEVAzPFQUEAdROug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=VvGEcboY;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD19606A31A
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD19606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=VvGEcboY
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1647727f8f.3
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792666476; x=1793271276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wsdeMYd/7eLXCr9Ufg4dZ6+EW6LYxWJjZpkMLdZ1OLI=;
        b=VvGEcboYMg/AmhQ6EihKs5CC1Uj0Wf0I4YfYzc0FPBNLkP1GwNG2vaRIZOBwUAFUEQ
         TubDLJ5yAaAqHpQsjHq6KgXSJ/0pCHtWQcJ8pV+xVIv2OAlY5TICyp1wZwKwKGT7cPC9
         SU/ABwO4KlDjZewps7cV/YdggEW1RGHM91XoKBuYTR6uzlMN0YtyxA2+xf3Bi0kKN49h
         JSxlAZy9aaqcDc7l4R5Noo8NCiUJX9O2gNu52CQbqIx/ulvoUAdgb2PuAfjSsm3fVNSy
         UM5LDSYL9jc6lSkALHD9icBnMal6bQ/xj43f6ZAiMaIoj19+pJpalZ5Qj2FB4b6Ha7db
         IE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666476; x=1793271276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsdeMYd/7eLXCr9Ufg4dZ6+EW6LYxWJjZpkMLdZ1OLI=;
        b=Elv1NONIu0MaG+8w3md+OLZlkUAtO0dgjmG6NHXBaOss8kAtj1kBrL1FzdOBT+QcOo
         evWgPCEBH3luW3yWIHR7fgeZTz0VNnuLfzvTv0s56n/b5zHsa/lFnA2VX+jHkDJ6MBki
         RGXWKjeZQo5jWCtVwXM1F2IAVqLvSq5d/slz5uoYXCrxv8PM6Ot4RNWnST3ZcsfYxR4B
         dfon2P2TndCJdlw93tfUHMYyYqgV+Uq7VFTAsCy6GJmccIovqFAizp4wOGobb5BLxigf
         a6vHoQcqi3PdYEeubmkC9pmODGHbm5+7fv2lR2cE0BiXpdDzeXNWttQU7TQlZN/ok7kW
         H9tA==
X-Forwarded-Encrypted: i=1; AKwUvByHWHOoqDd9Gv41/+qQ+QEh9DgAaUkHqLfi2Rz+iSAnLLeY94Yhkgqyg5w3sojF6VuE6OV3z1yV8wCg@lists.linux.dev
X-Gm-Message-State: AFq9FYJJkDDd15/sdMuIeVry0yz3NtFc8yeSpp2wf5KjfltduXsJ5mJM
	mSprvnGHDtlU0Qclxc19ZqOeEA67JTBzk4q3uM1KlcGr+WjBn7U/j+kFzpoV6+TENzU=
X-Gm-Gg: AYBFou3pFrBTHbiAoAulnoKspKa89aTLfoRIO5veJRuROfozgd1WsuoGWvL75Kp7//n
	eiIfJbIHqx3L2AWMCl2WhsYWfb9DBpEA9SUwit9Tv2onEWKqMxmjdx1zsEWPVvBm4FoMoeVj/Vq
	kmyexq/dRnNYSiU7bQteIEsHCXoQXhi9JYFLS32aztZUvv639xiDVFDPHHiYYu/sbqkrsf5vJ6K
	sKnmNqG2n5mcGRVzKV8rJtxuLZxHlYQjw/kDy9knp4pLBswAr4N1mLyJr9oWvSxDaKiyqvql7gt
	WwJ80NncVfYAzxiv1BGNpjoHFJ/zEr/Cd8WmL18aNxdksH/HQOUpSiNZkTpqn54AjrzosNuvDRa
	btunBw3Xi/gRDKEpF6WjF18uwcjae1reiZ0shOnqPQw481khG3V54UIOcTAUusWZ7eQy6GeLIs+
	PUdoISu8XcUFeevizxCDVjQMpZqfL9Aw/69cRXGu1gk3MohutQiApMfn3s4MVvRs1oA1MRSWW4b
	zOW7tTfAqLarOqSqbelNPgfpVmpSuBTZeDc1KDa13KOnFXrK/LM15Y9d82hDEh/tVc=
X-Received: by 2002:a05:6000:288e:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-48e264a1f81mr10449260f8f.42.1792666476063;
        Thu, 22 Oct 2026 03:54:36 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583522esm11890881f8f.35.2026.10.22.03.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:54:35 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:54:30 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Dionna Glaze <drdeeglaze@gmail.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, roberto.sassu@huawei.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <atnqmDhgaJycTf_Q@FV6GYCPJ69>
References: <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
 <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
 <20261019225658.GS13920@nvidia.com>
 <ath4vwt7KGyDXKVJ@FV6GYCPJ69>
 <103486a4a29ecc7b72940dd051c00ae59266bd05.camel@linux.ibm.com>
 <20261021143529.GP3008132@nvidia.com>
 <8d8833fac61558a94af415143530884349584a2f.camel@linux.ibm.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d8833fac61558a94af415143530884349584a2f.camel@linux.ibm.com>

Wed, Oct 21, 2026 at 09:05:09PM +0200, zohar@linux.ibm.com wrote:
>On Wed, 2026-10-21 at 11:35 -0300, Jason Gunthorpe wrote:
>> On Wed, Oct 21, 2026 at 10:12:34AM -0400, Mimi Zohar wrote:
>> > > > I think for now we should not include a new dynamic log here, the uAPI
>> > > > around this Jiri drafted can remain a future step. I don't want to
>> > > > open complicated discussions about new functionality at this
>> > > > stage. The whole CTLV idea in general is a big enough thing to bite
>> > > > off for this series.
>> > > 
>> > > Okay, dropping the log from this set.
>> > 
>> > Thank you.  Please keep in mind going forward, that the scarce hardware register
>> > limitation (like the 4 TDX RTMRs) should be resolved (e.g. by multiplexing the
>> > extension path), not by combining distinct measurement lists.
>> 
>> I'm not sure what you mean?
>> 
>> Since the HW doesn't support sealing the only *technical* requirement
>> is the verifier can reproduce the measurement register hash. So long
>> as we can get there we can do whatever.
>> 
>> Multiplexing extension alone isn't enough. We need some scheme to
>> reconstruct interleaved logs too.
>> 
>> For example we could add an atomic sequence number for each
>> extend. Every log sharing a register can report the sequence
>> number. The verifier would have to globally sort all logs to confirm
>> the hash.
>> 
>> Hopefully we don't have to tackle this problem. I hope that 4
>> registers is enough for Linux. One for IMA, one for systemd, one for
>> user? Plus a spare!
>
>Agreed, I hope you don't have to tackle it either.
>
>> 
>> Maybe we can build a multiplexed scheme on the spare? I don't know.
>
>To avoid interleaving the logs, AI had suggested multiplexing or virtualization
>of the RTMRs.  Whether is has any merit, I'll leave to you.  Here's the very
>short AI explanation:
>
>"Instead of allowing external drivers or subsystems to execute a direct, raw
>extend command to a specific hardware register index, the new attestation
>subsystem should act as a Hypervisor for Registers."

Isn't the hypervisor what we are doing now? I mean multiple extension
originators share the same register and eventually the same log. Or do
you suggest to go even further having a "generic_registerX" exposed for
every hw implementation allowing the user to have full abstraction?
The "generic_registerX" would be always alias to something hw specific,
like RTMR2 for example of TDX.


>
>> 
>> But we almost certainly need to have logs sequentially created in time
>> occupying the same register. Ie IMA may take over the register from
>> UEFI logging. Here we'd want to report the start/end hash values of
>> the logs back to userspace so the verifier can stitch the order back
>> together.
>> 
>> It would also be nice to think about a way to restrict the registers
>> to help avoid multi-user conflicts from misconfiguration.
>
>That would definitely be a plus.
>
>Mimi
