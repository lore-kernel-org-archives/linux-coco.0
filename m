Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4623C8C4
	for <linux-coco@lists.linux.dev>; Fri,  7 Feb 2025 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943582; cv=none; b=AVYEM//5cdVgy3v2vn23FfZc4z7AdeTixp9TwGLIqDDgcE6fr48EjKJdlzLLIGn8S4y5ygLdAxeGyU869U0rO1eq3lEV7DbJ3eaKTAX2IPUk64sd2rMdb6ouknvne7DiIkhU2ExwaqtbTIXXKYMlwsjR+A8pNuxN5HWbP6/ikH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943582; c=relaxed/simple;
	bh=X4FyYyM76uPhPu1hVXeJMPGMeE4u2JXxuI63wEfoZW4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L8Tc50JC+gY/eLnqRcYBzZZT8lqM8mnVyYFdM8K83ihrs85t6IetF7bCkcN2UKe4+L20Lwn72QVk86k7X0Ggo5+0jzNcTpQsvkBOqzwBs/reMmMQHKFpUUD91Q30LvFIcMj4fd8XGY30MIPy5+jYFSh+bCzfnhEUnaKPe1usKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=niieJVWX; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="niieJVWX"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2161d5b3eb5so48323155ad.3
        for <linux-coco@lists.linux.dev>; Fri, 07 Feb 2025 07:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738943580; x=1739548380; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ty/lYVQe0xeM+ZUp5PGdxNRQlc6F6zefI3WalpOLCeU=;
        b=niieJVWXWWkqk41HY1/RVqTofDLv1CAY5pwwStpOec9aB/IiHqIGuZuQCgnG0UT8d0
         pgfV8m+49fRQ+05H2cIUyuO0QMnPZR7YUNeLlQSgWDCvbPyID+DZJGA2rgOWsizPFPEy
         y/edIr27yOmbfOsq9t7hV5GgEDslLopJApe1yM3yUXTtZ2jVRat4fLMZvoOF7+QQp+zF
         9E+yjQTaPpSoCVux0pVjF/3IiF5aZ/xdUvoW+ua4C4KRfhFMvrdZwf9yo1LoXQT1J0yO
         8tFOOxpiQRLNTzBTGTedlggH/3774obAGcPEnj7pxNnntsiqBEP/qK4Hot28GP+liK19
         ZSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943580; x=1739548380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ty/lYVQe0xeM+ZUp5PGdxNRQlc6F6zefI3WalpOLCeU=;
        b=XytNrI2e9caZwMOwwRRG85E872lBZvNLm9vsq/+m+EwTlZjhxt2t6Zn5eQruluF7xF
         qDohdjaQBl6O/Mz1X8AhD2pC8NZ2j3kCaQ0F0JNaIAAkiB0dS7L5WuUSX8g6LAopWv2l
         tYa+fsewavKT1EsxYdeuolQUQ+pkO3ErgYhfBeU7bIlivCDfVjgO0RD3lFE7qZfZLvW4
         wTfVIPYY50OPZbs0+WqxPH7GWOwy3RFfC1zXjHbx5aLHiZNRokYGb/NJAiVEJIIOfEr9
         lCQlRaLcjuzof7JsM6LcVMEzEgtMoB7sgHWy+NDBeayBKdyDOfTnKf4rJiCvSjxi5Ihb
         95yQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3/WsB+JanJLFngBlaxYketwBk3Ij10OJ2RD++0yu7gKmtwjDlkbf7c6Qz7FKw+0x1EdyanKwPTLcf@lists.linux.dev
X-Gm-Message-State: AOJu0YxqUBNldqOpy9cVSO+j2C79dZwjfStk/Su3RFvIhNXmb/STAyw1
	aDkZMXh5ER9uzzeV7fuSBBUzmnIZrIAx0dzn6bVvEk3WAF6r5/+4GxLO6SyO5MlyvLRrn1Yz70H
	4Sg==
X-Google-Smtp-Source: AGHT+IE34s79rxFs1yVfbXs6jbXDDVmdSyAet3NGVEZa2V1uZSj8KivTD1QL8oytIt0boZSaiqIBiOwN7L0=
X-Received: from pgbcp9.prod.google.com ([2002:a05:6a02:4009:b0:ad5:1ef8:7643])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9011:b0:1db:e536:158e
 with SMTP id adf61e73a8af0-1ee03a8f46fmr7541650637.22.1738943579930; Fri, 07
 Feb 2025 07:52:59 -0800 (PST)
Date: Fri, 7 Feb 2025 07:52:58 -0800
In-Reply-To: <d27f91a9-0dff-4445-8d2f-9db862acd1d0@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1738618801.git.ashish.kalra@amd.com> <e9f542b9f96a3de5bb7983245fa94f293ef96c9f.1738618801.git.ashish.kalra@amd.com>
 <62b643dd-36d9-4b8d-bed6-189d84eeab59@amd.com> <Z6OA9OhxBgsTY2ni@google.com>
 <8f7822df-466d-497c-9c41-77524b2870b6@amd.com> <Z6O8p96ExhWFEn_9@google.com> <d27f91a9-0dff-4445-8d2f-9db862acd1d0@amd.com>
Message-ID: <Z6YsWiTGM___898F@google.com>
Subject: Re: [PATCH v3 3/3] x86/sev: Fix broken SNP support with KVM module built-in
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, joro@8bytes.org, 
	suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com, 
	michael.roth@amd.com, dionnaglaze@google.com, nikunj@amd.com, ardb@kernel.org, 
	kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-coco@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 05, 2025, Ashish Kalra wrote:
> On 2/5/2025 1:31 PM, Sean Christopherson wrote:
> > On Wed, Feb 05, 2025, Vasant Hegde wrote:
> >> So we don't want to clear  CC_ATTR_HOST_SEV_SNP after RMP initialization -OR-
> >> clear for all failures?
> > 
> > I honestly don't know, because the answer largely depends on what happens with
> > hardware.  I asked in an earlier version of this series if IOMMU initialization
> > failure after the RMP is configured is even survivable.
> > 
> 
> As i mentioned earlier and as part of this series and summarizing this again here:

Thanks!

> - snp_rmptable_init() enables SNP support system-wide and that means the HW starts
> doing RMP checks for memory accesses, but as RMP table is zeroed out initially, 
> all memory is configured to be host/HV owned. 
> 
> It is only after SNP_INIT(_EX) that RMP table is configured and initialized with
> HV_Fixed, firmware pages and stuff like IOMMU RMP enforcement is enabled. 
> 
> If the IOMMU initialization fails after IOMMU support on SNP check is completed
> and host SNP is enabled, then SNP_INIT(_EX) will fail as IOMMUs need to be enabled
> for SNP_INIT to succeed.
> 
> > For this series, I think it makes sense to match the existing behavior, unless
> > someone from AMD can definitively state that we should do something different.
> > And the existing behavior is that amd_iommu_snp_en and CC_ATTR_HOST_SEV_SNP will
> > be left set if the IOMMU completes iommu_snp_enable(), and the kernel completes
> > RMP setup.
> 
> Yes, that is true and this behavior is still consistent with this series.
> 
> Again to reiterate, if iommu_snp_enable() and host SNP enablement is successful,
> any late IOMMU initialization failures should cause SNP_INIT to fail and that means
> IOMMU RMP enforcement will never get enabled and RMP table will remain configured
> for all memory marked as HV/host owned. 

So the kernel should be able to limp along, but CC_ATTR_HOST_SEV_SNP will be in
a half-baked state.

Would it make sense to WARN if the RMP has been configured?  E.g. as a follow-up
change:

	/*
	 * SNP platform initilazation requires IOMMUs to be fully configured.
	 * If the RMP has NOT been configured, simply mark SNP as unsupported.
	 * If the RMP is configured, but RMP enforcement has not been enabled
	 * in IOMMUs, then the system is in a half-baked state, but can limp
	 * along as all memory should be Hypervisor-Owned in the RMP.   WARN,
	 * but leave SNP as "supported" to avoid confusing the kernel.
	 */
	if (ret && cc_platform_has(CC_ATTR_HOST_SEV_SNP) &&
	    !WARN_ON_ONCE(amd_iommu_snp_en))
		cc_platform_clear(CC_ATTR_HOST_SEV_SNP);
