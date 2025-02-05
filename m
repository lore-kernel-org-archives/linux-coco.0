Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC872201032
	for <linux-coco@lists.linux.dev>; Wed,  5 Feb 2025 19:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783919; cv=none; b=klB6dfYnvHIbxUoEWtbcDu0H4UoGYEtsHmMu491TRmgSoBkQXIMFURyydhHJ9+EZz2rteV6hBaN3g9Qat2+l5cyRH8sGTuXWwl95swWVqNdjGG+Jucg5Xk8hy+jzFhh7mHVsIPY74yFbq62IlG0Npb8QR47kG3u6jMFFtG+S1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783919; c=relaxed/simple;
	bh=2rxoVBPGkYRdke7t02zWdPgQ6HfJzuAcVvL+PkSrGoc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=USb0mwepXtOKW3dqiEH42QxxmBKNQbmetsYkvoNJ7EAR91XyDKIuu2FEZGQUIXr/s/qg/5jXoK5c4WeEAAae+SB+vOIBlhuQNt4lIoNjqYFUS26CHF4qOdOxH5h74D13+c17FbE6OoL8RcFLWP1PU84xSqEVXvWpxaBwjlCgBxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3U65+wq8; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3U65+wq8"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso109905a91.3
        for <linux-coco@lists.linux.dev>; Wed, 05 Feb 2025 11:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738783917; x=1739388717; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ityHFYbQHjCJ1n0TCLpdhG0BGuuO1UwpdTT8iBBDxQE=;
        b=3U65+wq88sSYll8tX5YcgTSthuIPWCP3/hnEN5aqaYTYfzN/EaZd2gSceYUDidDKm+
         2jje+5ccJpLwkdD85mvUv8BrgeNq9b3kcgQIDo3mDwr3ex+JYy3tx30maG36DQDrbCRz
         YjxkSgLA2A9tEpfNBAZ5a7b6kck9adyJKvXhMO2fGkX8rP/RNKSgdyV+4IIXKYQ79bTc
         yk02CEoniQIE0Cz7PH0xG5OE28XA7/ghKBiIBs1wBR4LaTI+BskHiDQbuVGpBvPhMRuk
         POA5bc8xw3MPxBDbC9OZnvi1ri36XRKXR0iIs2d4wFkMhemI+A7tGydVqhSZGfAK2If9
         fT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783917; x=1739388717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ityHFYbQHjCJ1n0TCLpdhG0BGuuO1UwpdTT8iBBDxQE=;
        b=cB5hIXUfu3IvqVJZ3Q56o0h8IbLGuJ0TudElYXnrf6B8T9BN1HEONzH6auXsJHqKWG
         EBzkmrdhy4iqgkPMdPiItehHAeCd+jq+AbIAMy07DLLrtRioxNFDfEKScs4e4TahgOKE
         hjp3NsX0i5mTwrNjA0bpnMzyFE+FbGNKslDbv+q6b3t0UB6gVRnfVxd5GFWsL++9Aznw
         6Shwq0UUf14mcFB4QVoOsFXkv2ql4s1FTfok1/iJkFvtCWlNgI1d8R1/l71xFfSU21OO
         ZsspLUrvwL+l4P0Hz9pyuO3wXkvmJcRV0ErSn2qcR1dOKVkoqJ1uU1c22yV8Xm4vJW44
         SABQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpS3Lx7W6l80SjuLfDRiHRaQkQxUHO04NoOugEyomgKzg6CC50y5xbq+YuXwK08e65k1BAkAMhXBlc@lists.linux.dev
X-Gm-Message-State: AOJu0Yw77L/toU5qxqzU6c577ZG/JYYlznBwCIM/EIOp3Lwa6w4LEXzu
	qiCYDwDnrrIMVPrqQ3il7WAaNo6cYhkVyZYa7jR0NvpsAqIy1KJweWAZk4dLd3xFXXJawsNx210
	mNQ==
X-Google-Smtp-Source: AGHT+IGYpR9H2o7CsrEfJdhduqV6CItDd+RRnz38obHEp/U4zWkL8bbKIHK5OX1zzdtql3FDGJLnjb3ZcYY=
X-Received: from pfwy2.prod.google.com ([2002:a05:6a00:1c82:b0:72f:f548:3e09])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:28cc:b0:725:f1b1:cbc5
 with SMTP id d2e1a72fcca58-730350f96demr7928023b3a.3.1738783917255; Wed, 05
 Feb 2025 11:31:57 -0800 (PST)
Date: Wed, 5 Feb 2025 11:31:51 -0800
In-Reply-To: <8f7822df-466d-497c-9c41-77524b2870b6@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1738618801.git.ashish.kalra@amd.com> <e9f542b9f96a3de5bb7983245fa94f293ef96c9f.1738618801.git.ashish.kalra@amd.com>
 <62b643dd-36d9-4b8d-bed6-189d84eeab59@amd.com> <Z6OA9OhxBgsTY2ni@google.com> <8f7822df-466d-497c-9c41-77524b2870b6@amd.com>
Message-ID: <Z6O8p96ExhWFEn_9@google.com>
Subject: Re: [PATCH v3 3/3] x86/sev: Fix broken SNP support with KVM module built-in
From: Sean Christopherson <seanjc@google.com>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: Ashish Kalra <Ashish.Kalra@amd.com>, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, joro@8bytes.org, 
	suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com, 
	michael.roth@amd.com, dionnaglaze@google.com, nikunj@amd.com, ardb@kernel.org, 
	kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-coco@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 05, 2025, Vasant Hegde wrote:
> On 2/5/2025 8:47 PM, Sean Christopherson wrote:
> > On Wed, Feb 05, 2025, Vasant Hegde wrote:
> >>> @@ -3318,6 +3326,9 @@ static int __init iommu_go_to_state(enum iommu_init_state state)
> >>>  		ret = state_next();
> >>>  	}
> >>>  
> >>> +	if (ret && !amd_iommu_snp_en && cc_platform_has(CC_ATTR_HOST_SEV_SNP))
> >>
> >>
> >> I think we should clear when `amd_iommu_snp_en` is true.
> > 
> > That doesn't address the case where amd_iommu_prepare() fails, because amd_iommu_snp_en
> > will be %false (its init value) and the RMP will be uninitialized, i.e.
> > CC_ATTR_HOST_SEV_SNP will be incorrectly left set.
> 
> You are right. I missed early failure scenarios :-(
> 
> > 
> > And conversely, IMO clearing CC_ATTR_HOST_SEV_SNP after initializing the IOMMU
> > and RMP is wrong as well.  Such a host is probably hosed regardless, but from
> > the CPU's perspective, SNP is supported and enabled.
> 
> So we don't want to clear  CC_ATTR_HOST_SEV_SNP after RMP initialization -OR-
> clear for all failures?

I honestly don't know, because the answer largely depends on what happens with
hardware.  I asked in an earlier version of this series if IOMMU initialization
failure after the RMP is configured is even survivable.

For this series, I think it makes sense to match the existing behavior, unless
someone from AMD can definitively state that we should do something different.
And the existing behavior is that amd_iommu_snp_en and CC_ATTR_HOST_SEV_SNP will
be left set if the IOMMU completes iommu_snp_enable(), and the kernel completes
RMP setup.
