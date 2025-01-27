Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF7D1946BC
	for <linux-coco@lists.linux.dev>; Mon, 27 Jan 2025 21:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738012339; cv=none; b=TsyzM8/cpkG+gzd7TsMkrfehBnKO88XWGMoakx4ENCPu9kmx+BtEcQO9ZzQ4C8ZGYc5ULSBMhzAvLwuKML7TTlzF+pri2OrBozvthW/+AqtKvDBz7KVPiPrSyN+ygXnZYR985LklyDIUmrn6c+imRTqGIRnHzpXM0E6D4vA1TFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738012339; c=relaxed/simple;
	bh=QIUlCdDDgNKC8e57Y3+feDkX5uLyeyfTJ0A0n34JkIU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K1LxB2nDJO6N/AhT20O5BFW4r63P/iZ2hczHvjvPEPzHaGQVNQBnkobFnC3JQ+twd2tUNNEcFHMfzgBCgMQtcagvf5qYxfsgPSq4LwXn4KSuvAXJKaBn0dLlbeDdgr5iyoQNRVR0k+hKmjr3VTgdSB7OqGkmsrlBvBTL5dQhc/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lhgoeO+l; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lhgoeO+l"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso9778271a91.1
        for <linux-coco@lists.linux.dev>; Mon, 27 Jan 2025 13:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738012336; x=1738617136; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6hZefyXL2l96pWmeGJw77FS+9rwDaTak9GYI9pCtzA=;
        b=lhgoeO+l4iGCizGj970OA73V7S5A9LfpkY3VZqTYDm73oonVxZEbownRbALloPodkB
         AozxNYgQWwi9UxtrlgVUsd7ZyY5uPZvmV7F9rFOiktl5R1TCR++Hr6WdYLpxHYMwLT8q
         7GHcEIIxvKMs6mOiFI67i6IgVAYQGLG2vqT3QhMijjd1BvZSjXXDdeXvvEm9qkZ87ml3
         aBXrLvu/qO9SlCCCFCOWFH+wN8EiIwu9SdvLvus3Fm4mF4kq1bRPg+QuRnpz6WmFKhWe
         +WtyIvOIzOgGG4et2yIeOnqMCWsUawsAYqGqgIxk4EzypcDIjOJQva2XhCh1bL6PqSPC
         8SuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738012336; x=1738617136;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6hZefyXL2l96pWmeGJw77FS+9rwDaTak9GYI9pCtzA=;
        b=GFZ/oPWeWJt+yHuLK7+/KOfGQx0xNb9VpFaHttze/3MlhOTBtekQKuxVRYLTiENxMH
         VELSNf4fqmBiUkRpu3asb/cC+PzZeZDSOI6dI2QSS8+N4n3JieoGPJzqW8wO1PNSM8Dx
         yWgcfJ66tS11rYQvlenlTwCOv+HDb3GD/GjpEffM2EoTEglwJucGt2u2uLsm8523uKHF
         lMnT7puoEr9ixcce35KRAvwT368qY7pv+8KlNAg03c0dFy+z+SBxmPQkw5X/80dzPmXD
         7cvVjPK+s+CBLnVUpJzm7uxJ1sS+3PjUPHE449BuWJyP+R8ABB2hgRdKMqxjrpVM4E5X
         0b/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEhANsgTJUgeckIVu5k32yWEhJApIwIBFa9vPtf/HI0Kz1mDSrN4dJY2pDSnJbDfq3HqWJGWpi2c+f@lists.linux.dev
X-Gm-Message-State: AOJu0YxuIJpNaBg5X+4LhSEeM5gn4uFnzJN5t/e208tjWAHeVFfA90yB
	Qe4StT3G0EX01sT3o8XGwVzAdcgBejkl9qa9OZm59jzpIjh0rplQigfT6fr4NEiJU4Loep5M4oV
	MMA==
X-Google-Smtp-Source: AGHT+IEwgayOURYSvjY7e6XLYoI71UjcKramt48qbeELOlKyudPYpVmcvakyD5Op74xYsySjMiHHABxL/+s=
X-Received: from pfbcb5.prod.google.com ([2002:a05:6a00:4305:b0:725:936f:c305])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8d1:b0:725:f153:22d5
 with SMTP id d2e1a72fcca58-72dafb9e674mr61995080b3a.18.1738012335920; Mon, 27
 Jan 2025 13:12:15 -0800 (PST)
Date: Mon, 27 Jan 2025 13:12:14 -0800
In-Reply-To: <e23a94f0-c35f-4d50-b348-4cd64b5ebb67@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1737505394.git.ashish.kalra@amd.com> <0b74c3fce90ea464621c0be1dbf681bf46f1aadd.1737505394.git.ashish.kalra@amd.com>
 <c310e42d-d8a8-4ca0-f308-e5bb4e978002@amd.com> <5df43bd9-e154-4227-9202-bd72b794fdfb@amd.com>
 <5af2cc74-c56d-4bcf-870e-afa98d6456b3@amd.com> <Z5QyybbSk4NeroyZ@google.com> <e23a94f0-c35f-4d50-b348-4cd64b5ebb67@amd.com>
Message-ID: <Z5f2rnMyBAjK88dP@google.com>
Subject: Re: [PATCH 1/4] iommu/amd: Check SNP support before enabling IOMMU
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, pbonzini@redhat.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	john.allen@amd.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	joro@8bytes.org, suravee.suthikulpanit@amd.com, will@kernel.org, 
	robin.murphy@arm.com, michael.roth@amd.com, dionnaglaze@google.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 27, 2025, Ashish Kalra wrote:
> Hello Sean,
> 
> On 1/24/2025 6:39 PM, Sean Christopherson wrote:
> > On Fri, Jan 24, 2025, Ashish Kalra wrote:
> >> With discussions with the AMD IOMMU team, here is the AMD IOMMU
> >> initialization flow:
> > 
> > ..
> > 
> >> IOMMU SNP check
> >>   Core IOMMU subsystem init is done during iommu_subsys_init() via
> >>   subsys_initcall.  This function does change the DMA mode depending on
> >>   kernel config.  Hence, SNP check should be done after subsys_initcall.
> >>   That's why its done currently during IOMMU PCI init (IOMMU_PCI_INIT stage).
> >>   And for that reason snp_rmptable_init() is currently invoked via
> >>   device_initcall().
> >>  
> >> The summary is that we cannot move snp_rmptable_init() to subsys_initcall as
> >> core IOMMU subsystem gets initialized via subsys_initcall.
> > 
> > Just explicitly invoke RMP initialization during IOMMU SNP setup.  Pretending
> > there's no connection when snp_rmptable_init() checks amd_iommu_snp_en and has
> > a comment saying it needs to come after IOMMU SNP setup is ridiculous.
> > 
> 
> Thanks for the suggestion and the patch, i have tested it works for all cases
> and scenarios. I will post the next version of the patch-set based on this
> patch.

One thing I didn't account for: if IOMMU initialization fails and iommu_snp_enable()
is never reached, CC_ATTR_HOST_SEV_SNP will be left set.

I don't see any great options.  Something like the below might work?  And maybe
keep a device_initcall() in arch/x86/virt/svm/sev.c that sanity checks that SNP
really is fully enabled?  Dunno, hopefully someone has a better idea.

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 0e0a531042ac..6d62ee8e0055 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -3295,6 +3295,9 @@ static int __init iommu_go_to_state(enum iommu_init_state state)
                ret = state_next();
        }
 
+       if (ret && !amd_iommu_snp_en)
+               cc_platform_clear(CC_ATTR_HOST_SEV_SNP);
+
        return ret;
 }
