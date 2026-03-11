Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373943314D0
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238522; cv=none; b=VYgrj5oT1MKUlRDU25VnI8q7VVLzdW+FJzp/e7nIHUOBDml93lRj64qgbsRxR8a2CysEAIgOxhTXHNnnphdQGAx0VANHNXRh/C1buRKFd8IskmK/4jx+TDb1qEDDbpG62yJGlLywi8Qfr1u/9w1uqAStIwdARcdO0CQV26OGAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238522; c=relaxed/simple;
	bh=IRdQHaIGsdSoCBH5B0OHZNEfWZFitkLqXLSqpnGZeHg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RhN/NBASG86zWb5Wyqz4PY5XP5iBKAGpeRI8O3OsXF/5m4HJTcLpgahiL421TB44Y8lQWRW+klFRbw20WrAsVAgRA9h6Bfuxp8ddDg/ekp6mZl5gKFtTiCjyeBb6LDh0jHkDYVQtW0Q6hWYiR6woOe3/G+b7LDZJLr5nQUBSC+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j6MuX/rf; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j6MuX/rf"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae4e9577ceso537537475ad.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773238519; x=1773843319; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=32AGf21pa1XHN25iothH4Nfw6LkakhGMZaNhl2RKfBU=;
        b=j6MuX/rfeLktSTIWwIPc/jtow7iw1YRiSEjsqtOzWBTDsb/BhB3DjIy8frb1ysDwQN
         2NPHhb5RFYtEU1TJrAgg5u2lowfIXhzSbgkTfUi44dDRyvFSgmiIQNgBDW/fWbcfW0H1
         Mybr8PSxNOIUMHJUzTEt+7M8/Si3BDLftfxOWgQMTHGZJMOWPHVLoSm7OwW9WeiRLDiT
         UWTCh9lU7/V/YttXyWvkRqa1ey2X3XMjxXctQNMqjGgxJxkZjM2ZzszyZy9nAd5OVGs5
         mHHldS5+KStNfrLEIYkK0IMDKmpqHHCzuE0Wlk2nj9ZC4wyZx3JTZLawSqfmfrF6IxtM
         RVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238519; x=1773843319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32AGf21pa1XHN25iothH4Nfw6LkakhGMZaNhl2RKfBU=;
        b=JA1yVzu9UtK4zhPbY2wx+nqj1eUt4I0sp2HL0yzi2TCXt+T5PcooXUxas7pd9iewUx
         Tpfblwbeu3hdqAkUfxdRTEUKyQr0NzPkUxS25iUEivX03486AKoAGnzAjgN5ERZlIUNs
         /6pyl1pUnGkyDV6N/S6QUELvrHPG5blaxMGKMy+zFd82yG4n3GF9+RHc0kOPdI9mBCW9
         SR/NDpwXh1mXXovB9LJY+T2KaAKS4VRKS9kBclmZSBekTBWPUuDswXjnpo+0Qf6x618L
         RjaHtPA4BGMPrDjo3Ce4bfxCt37NyT7uisoirNiHCngZAonZ+WnhiHNT/QWRuzb5qN7q
         eBlg==
X-Forwarded-Encrypted: i=1; AJvYcCUkW85WLNRsn7I+2sBwxvaL11Cs/mYxycrWv913eQcSghO8GObkfdvq52C/DpEmnSwCJJ+rkGw68S+t@lists.linux.dev
X-Gm-Message-State: AOJu0YzswLdo97SCUWAHM/8Cl93dKtePRqjMBUpwSILKFKmhsgWTro9/
	oEWmrKGqaM2IisFl6d6iA9eljhjeaoEZNne1bDprStBESBrooAzLTN/EVZv1mixSYQX0Ol4DS/A
	6dH3nsA==
X-Received: from plbld3.prod.google.com ([2002:a17:902:fac3:b0:2ae:4b5c:a2a0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2a86:b0:2ae:7fbd:3dcd
 with SMTP id d9443c01a7336-2aeae8ffae8mr30306955ad.52.1773238519493; Wed, 11
 Mar 2026 07:15:19 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:15:18 -0700
In-Reply-To: <20260311130611.2201214-4-kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311130611.2201214-1-kim.phillips@amd.com> <20260311130611.2201214-4-kim.phillips@amd.com>
Message-ID: <abF49hzCdFsMNJNs@google.com>
Subject: Re: [PATCH v2 3/3] KVM: SEV: Add support for SNP BTB Isolation
From: Sean Christopherson <seanjc@google.com>
To: Kim Phillips <kim.phillips@amd.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Borislav Petkov <borislav.petkov@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Naveen Rao <naveen.rao@amd.com>, David Kaplan <david.kaplan@amd.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 11, 2026, Kim Phillips wrote:
> This feature ensures SNP guest Branch Target Buffers (BTBs) are not
> affected by context outside that guest.  CPU hardware tracks each
> guest's BTB entries and can flush the BTB if it has been determined
> to be contaminated with any prediction information originating outside
> the particular guest's context.
> 
> To mitigate possible performance penalties incurred by these flushes,
> it is recommended that the hypervisor run with SPEC_CTRL[IBRS] set.
> Note that using Automatic IBRS is not an equivalent option here, since
> it behaves differently when SEV-SNP is active.  See commit acaa4b5c4c85
> ("x86/speculation: Do not enable Automatic IBRS if SEV-SNP is enabled")
> for more details.
> 
> Indicate support for BTB Isolation in sev_supported_vmsa_features,
> bit 7.

This isn't very useful for the changelog.  I can read the patch quite easily.

What would be useful is a description of the change in conversational language,
and an explanation of why it is the correct change.  E.g. (not really, but you
get the idea)

  Advertise support for BTB Ioslation via SEV_VMSA_FEATURES when SNP is
  enabled, as all hardware that supports SNP also support BTB Isolation.
  BTB Isolation is an optional feature that can be enabled by the guest to
  sprinkle fairy dust on the CPU to completely prevent all speculative
  execution attacks.

> SNP-active guests can enable (BTB) Isolation through SEV_Status
> bit 9 (SNPBTBIsolation).

That's not what the doc says:

  SNP-active guests may choose to enable the Branch Target Buffer Isolation
  mode through SEV_FEATURES bit 7 (BTBIsolation).

> For more info,> refer to page 615, Section 15.36.17 "Side-Channel
> Protection", AMD64 Architecture Programmer's Manual Volume 2: System
> Programming Part 2, Pub. 24593 Rev. 3.42 - March 2024 (see Link).
> 
> Link: https://bugzilla.kernel.org/attachment.cgi?id=306250
> Signed-off-by: Kim Phillips <kim.phillips@amd.com>
> ---
> v2: No changes
> v1: https://lore.kernel.org/kvm/20260224180157.725159-4-kim.phillips@amd.com/
> 
>  arch/x86/include/asm/svm.h | 1 +
>  arch/x86/kvm/svm/sev.c     | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
> index edde36097ddc..2038461c1316 100644
> --- a/arch/x86/include/asm/svm.h
> +++ b/arch/x86/include/asm/svm.h
> @@ -305,6 +305,7 @@ static_assert((X2AVIC_4K_MAX_PHYSICAL_ID & AVIC_PHYSICAL_MAX_INDEX_MASK) == X2AV
>  #define SVM_SEV_FEAT_RESTRICTED_INJECTION		BIT(3)
>  #define SVM_SEV_FEAT_ALTERNATE_INJECTION		BIT(4)
>  #define SVM_SEV_FEAT_DEBUG_SWAP				BIT(5)
> +#define SVM_SEV_FEAT_BTB_ISOLATION			BIT(7)
>  #define SVM_SEV_FEAT_SECURE_TSC				BIT(9)
>  
>  #define VMCB_ALLOWED_SEV_FEATURES_VALID			BIT_ULL(63)
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 3f9c1aa39a0a..ac29cf47dd08 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -3167,6 +3167,9 @@ void __init sev_hardware_setup(void)
>  
>  	if (sev_snp_enabled && tsc_khz && cpu_feature_enabled(X86_FEATURE_SNP_SECURE_TSC))
>  		sev_supported_vmsa_features |= SVM_SEV_FEAT_SECURE_TSC;
> +
> +	if (sev_snp_enabled)

If BTB_ISOLATION is actually supported on *all* SNP hardware, then that needs to
be called out.  Please also separate this from the core kernel changes, unless
there is some dependency on them.  And if there _is_ a dependency, call that out.

Ugh, I'm getting deja vu.  I suspect I had a long response typed out for v1 of
this patch, and rebooted my system before actually sending it.

Oh wait, no, you just made the same mistakes in two different patches.  Please
revist https://lore.kernel.org/all/aaWog_UjW-M3412C@google.com.

In general, spamming patches without internalizing the feedback makes for grumpy
maintainers.
