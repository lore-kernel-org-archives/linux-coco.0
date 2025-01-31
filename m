Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814821F1533
	for <linux-coco@lists.linux.dev>; Fri, 31 Jan 2025 18:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738348497; cv=none; b=BkUB0MnLIi/J5+HJOw0nly0YxE2iJggFGgo5mU6Dt+da7PiO6hcWNId06WyqdvzyhlY+j6ABKS4V9k6zyW98Ns4eKey4+W/eBhe5ImFIYR9lWTWMFlrfG76HqO1XJUcHHTxOyNfyIvWovgs4eqjyqdymy7AspmttkXAJIvTVw6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738348497; c=relaxed/simple;
	bh=fNWXKiXO2P8ivV5RaHwtYShP97cRJPV2kvBURFYp/aA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I5wXcqGZoA5kp5cqZ5IeHAWK2NmydgbgjvDRg/Px5QIeCWdolXmD96jmvGfgRBkJCZZTQik50kqd5wZZNtiG2Pqh/HBXsh3PWHPv0oo2Fk6jfJuJCdfepTRhQ4ibd7D9VB9rcrtg2sSR0I1QZrS91ZHoZftVzOAx3ImeLjkp8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QqOaWg/g; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QqOaWg/g"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso4481023a91.0
        for <linux-coco@lists.linux.dev>; Fri, 31 Jan 2025 10:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738348495; x=1738953295; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OHvxpFXR5lAEIxk+o3Hek4ypvpPcHmc+gKmCjQ+uPaM=;
        b=QqOaWg/gJQmwHTA8JPopgh8S724qLSXorHdBcYJCMqLmoT+G2aYiC4xZGkYEhQw8gY
         XngagPNYnkH5adnMCjAYGFzKhu292YweEWNvbME6ooiyyZQX6tfrd1EuxXyl8h67LO8+
         vHFv4RnSAT7UzLqeRe5hTnAAyBep4F/+IU6KFq3u9Msk4DjCqvpIXIRPTd471G2bPGgG
         Q3bacsuUg94lPKeIntE/94mZfEabzf1xTuKn84qdZKOlAh9hgVSa+QNPde5kXgWDPZWt
         PITuAZ+W861B7AOOm3Li30mJCCt4XL/dwp/X+Z3+v9MR56vDnn8zvSoFa+4ty7G7LSQx
         FcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738348495; x=1738953295;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHvxpFXR5lAEIxk+o3Hek4ypvpPcHmc+gKmCjQ+uPaM=;
        b=r+sw+f88OKEujKsSB7pcBK5EnTEmQMY83NSjZNWHG1Hi/RSosDEvNNkEAjY5ddPO45
         blsaxRbcjDx8ufZi+VVWlJyZ3t63YCqfMAAkNHsS75axKBrO8+MvSnZXRNPlbklaHB0Y
         0lq5AzdnjAOOEuLS4O5s94Or8t/zimIRJdNqjlgDhEG0vXr3djJLwmFVGoQpkmMAsiir
         JmKhzDRz0q5b1ZNYKMKjDFuSZLwrZXWH8RWMQwNXQcWTr0nKwBRH6ISqT5xFx74UeWgP
         V0KE7OggJQklDhD8PKFh9BxOiq/YJH6j+R10La52+ydfz/+5PAyuNduGK88RqexF2WLP
         +iFg==
X-Forwarded-Encrypted: i=1; AJvYcCUt/WXtM2lTfAbG7c9c7GiNdkYUprY4VUATv5Il+sbp9YaudRbvb2AwOdMNWyKybNGaAiFwzN8aKAym@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5RX9YnScjt4C2rLL67LxyOTv8805qIEJNucFRETbRc3yzEARj
	WpvJtgLVFHQNziZ+xB2bKPz5vloqZ89+Fng0iq30ZumyCdJyBTSUh5LytgWqf54tgzY+739FMn9
	t4A==
X-Google-Smtp-Source: AGHT+IE/oZCUZdCZRJTGm8rMH0vhTkQhVXUs+8QMDWccMmAQAm7pMQvcBwS4gYOfo5ygWQzF5ovfuAe5ry0=
X-Received: from pfaq15.prod.google.com ([2002:a05:6a00:a88f:b0:725:eeaa:65e2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6f54:b0:730:1db:80b2
 with SMTP id d2e1a72fcca58-73001db80e2mr418968b3a.17.1738348494797; Fri, 31
 Jan 2025 10:34:54 -0800 (PST)
Date: Fri, 31 Jan 2025 10:34:47 -0800
In-Reply-To: <93e8a84a-d4cc-4dbc-a593-99995b000947@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1738274758.git.ashish.kalra@amd.com> <8f73fc5a68f6713ba7ae1cbdbb7418145c4bd190.1738274758.git.ashish.kalra@amd.com>
 <Z5wqN5WSCpJ3OB0A@google.com> <93e8a84a-d4cc-4dbc-a593-99995b000947@amd.com>
Message-ID: <Z50IQyFzuMQRihhF@google.com>
Subject: Re: [PATCH v2 3/4] x86/sev: Fix broken SNP support with KVM module built-in
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, joro@8bytes.org, suravee.suthikulpanit@amd.com, 
	will@kernel.org, robin.murphy@arm.com, michael.roth@amd.com, 
	dionnaglaze@google.com, nikunj@amd.com, ardb@kernel.org, 
	kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-coco@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 30, 2025, Ashish Kalra wrote:
> On 1/30/2025 7:41 PM, Sean Christopherson wrote:
> > On Fri, Jan 31, 2025, Ashish Kalra wrote:
> >> -nosnp:
> >> -	cc_platform_clear(CC_ATTR_HOST_SEV_SNP);
> >> -	return -ENOSYS;
> >>  }
> >>  
> >> -/*
> >> - * This must be called after the IOMMU has been initialized.
> >> - */
> >> -device_initcall(snp_rmptable_init);
> > 
> > There's the wee little problem that snp_rmptable_init() is never called as of
> > this patch.  Dropping the device_initcall() needs to happen in the same patch
> > that wires up the IOMMU code to invoke snp_rmptable_init().
> 
> The issue with that is the IOMMU and x86 maintainers are different, so i
> believe that we will need to split the dropping of device_initcall() in
> platform code and the code to wire up the IOMMU driver to invoke
> snp_rmptable_init(), to get the patch merged in different trees ?

No, that's pure insanity and not how patches that touch multiple subsystems are
handled.  This all goes through one tree, with Acks from the necessary parties.
