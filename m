Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D979280A4B
	for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 22:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747348856; cv=none; b=fub9Xi99KpwwPfteYpYcpTdiT7/qEoS+9LtszmgBPVxrWyz0RG3ZmXJd7yD7yQ2xarOy6hGUCmyng50McbTKrUYiUFgupS0NasP9d/xIl+iX92uE890xEVj/kDRQUNENtRHzucxgjJZ4wwuus5arB6+elJTdoxbgvy8aJDcvJ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747348856; c=relaxed/simple;
	bh=gAwcrn7C3OtzQnccbEtzwNEUv9I14BWeIkkCpTqjRkU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oq9/nxcJUHpxMjb3kGKKStJOHzr6w5W9acj4q3prl899wQyOKGY+WgP626SSPRf6N89j8xzK9GPa/fQvSm0qyCuOQymeFwXDHY9kgA1btGxiPNQJ+HW+KwMeDO9YuzDd6tuFX/hGlCAnZ5Bs5COI1wqN6SLXqcz9T2hsbJCTZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3BCVdXgb; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3BCVdXgb"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30c371c34e7so1643549a91.1
        for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 15:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747348854; x=1747953654; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QzbQSdflaHCK3ugNtNk4sqO5eX+TPn6H7YDD2IwnvfQ=;
        b=3BCVdXgbnSm2++02JvpbVUIicHoh0kuSG5w4YgACvDcM0c/xFqliwjvAF5lBpmsK3m
         eeDKcs3oob0C8a87Zcfcn+uKaK6pMLQAYbDY0u0k7HCbcE+/sr2aF++kbsQX70TwQxN7
         68gsin3Qj+lRz8nfVH/sqgE1lyYbLUgOw2PtGrvvaoRvGY29qW+FQXn2Ivgxclb6QPyx
         5X8nLvUt99y6uKYSvz25t91NEIpxbGjM4njF1NZDkhbzHcp/i7f303ubjZAdRM0DqI5G
         cAeOAZG43zuZAuuW/mkwCCJVxUmJm9C1drxkpwyiECwwsmwlhhLZ+RaoEM2QkxygznA9
         vkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747348854; x=1747953654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzbQSdflaHCK3ugNtNk4sqO5eX+TPn6H7YDD2IwnvfQ=;
        b=KMYnNNCHvq4e7DtxCStWbto3DgBFvA00GUB+dTNSgxkAVFZ47ZtgacBSaXZmjygNbg
         sbOEvbSXcV2oMWtctlPHa9SDtXze+PYY98s4kAkRY7K4kr6HvXnaiSX5C7mGZXAjgVcf
         246+u/1OuVtN0BHNXBAEw+t+WyHEdBtYzffSnr9VjWmoilRmtgAVc9uP2EWtGKdVnIMx
         3hmKafvug64Cqy81aezR5nNCwbAZnDLC58EOIFhS9GD3arSj8p7p/2hspdcx3FY9OAZD
         rnaRos7t7FFIssQVudeaw9HPbUNVpzkKF3JC9FAF1gk+I9NQ4IH4oMKq1E78Q2J4KG83
         31Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXJrozOrB3KYcFaLc8Q42YRon9ckiuCAQJOPj1SyeQ6xtCPcAgR2fyDgMD4SSrMhCfDBCKD7OYx7WIG@lists.linux.dev
X-Gm-Message-State: AOJu0YzjoetnLp9TDMOP/7/I3WH/RZbIOA2ybYaJXFNl8wdtxR2aRCl+
	6jmjPVathDfCJYbHKkTQ8b6+asR2gN6UJRrSKJoEfCz7YKuRvdxI6kp8TNFYCgE9gqPekrkQwJV
	8NdgnYw==
X-Google-Smtp-Source: AGHT+IHhpbVQYCulfsGsx71Tw2jSSQWwT4/3osOtwdZFSgnfe66APRY0T7q2w4vwHNkAbfsnzNQMQ2bPnv4=
X-Received: from pja11.prod.google.com ([2002:a17:90b:548b:b0:30e:65cf:2614])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8b:b0:30a:2007:65b6
 with SMTP id 98e67ed59e1d1-30e83235af7mr236409a91.34.1747348854468; Thu, 15
 May 2025 15:40:54 -0700 (PDT)
Date: Thu, 15 May 2025 15:40:52 -0700
In-Reply-To: <20250515220400.1096945-2-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com> <20250515220400.1096945-2-dionnaglaze@google.com>
Message-ID: <aCZtdN0LhkRqm1Vn@google.com>
Subject: Re: [PATCH v5 1/2] kvm: sev: Add SEV-SNP guest request throttling
From: Sean Christopherson <seanjc@google.com>
To: Dionna Glaze <dionnaglaze@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="us-ascii"

On Thu, May 15, 2025, Dionna Glaze wrote:
> The AMD-SP is a precious resource that doesn't have a scheduler other
> than a mutex lock queue. To avoid customers from causing a DoS, a
> mem_enc_ioctl command for rate limiting guest requests is added.
> 
> Recommended values are {.interval_ms = 1000, .burst = 1} or
> {.interval_ms = 2000, .burst = 2} to average 1 request every second.
> You may need to allow 2 requests back to back to allow for the guest
> to query the certificate length in an extended guest request without
> a pause. The 1 second average is our target for quality of service
> since empirical tests show that 64 VMs can concurrently request an
> attestation report with a maximum latency of 1 second. We don't

Who is we?

> anticipate more concurrency than that for a seldom used request for
> a majority well-behaved set of VMs. The majority point is decided as
> >64 VMs given the assumed 128 VM count for "extreme load".
> 
> Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: Peter Gonda <pgonda@google.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Sean Christopherson <seanjc@google.com>
> 
> Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
> ---
>  .../virt/kvm/x86/amd-memory-encryption.rst    | 23 +++++++++++++
>  arch/x86/include/uapi/asm/kvm.h               |  7 ++++
>  arch/x86/kvm/svm/sev.c                        | 33 +++++++++++++++++++
>  arch/x86/kvm/svm/svm.h                        |  3 ++
>  4 files changed, 66 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> index 1ddb6a86ce7f..1b5b4fc35aac 100644
> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> @@ -572,6 +572,29 @@ Returns: 0 on success, -negative on error
>  See SNP_LAUNCH_FINISH in the SEV-SNP specification [snp-fw-abi]_ for further
>  details on the input parameters in ``struct kvm_sev_snp_launch_finish``.
>  
> +21. KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE
> +-----------------------------------------
> +
> +The KVM_SEV_SNP_SET_REQUEST_THROTTLE_RATE command is used to set a per-VM rate
> +limit on responding to requests for AMD-SP to process a guest request.
> +The AMD-SP is a global resource with limited capacity, so to avoid noisy
> +neighbor effects, the host may set a request rate for guests.
> +
> +Parameters (in): struct kvm_sev_snp_set_request_throttle_rate
> +
> +Returns: 0 on success, -negative on error
> +
> +::
> +
> +	struct kvm_sev_snp_set_request_throttle_rate {
> +		__u32 interval_ms;
> +		__u32 burst;
> +	};
> +
> +The interval will be translated into jiffies, so if it after transformation

I assume this is a limitation of the __ratelimit() interface?

> +the interval is 0, the command will return ``-EINVAL``. The ``burst`` value
> +must be greater than 0.

Ugh, whose terribly idea was a per-VM capability?  Oh, mine[*].  *sigh*

Looking at this again, a per-VM capability doesn't change anything.  In fact,
it's far, far worse.  At least with a module param there's guaranteed to be some
amount of ratelimiting.  Relying on the VMM to opt-in to ratelimiting its VM if
userspace is compromised is completely nonsensical.

Unless someone has a better idea, let's just go with a module param.  

[*] https://lore.kernel.org/all/Y8rEFpbMV58yJIKy@google.com

> @@ -4015,6 +4042,12 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
>  
>  	mutex_lock(&sev->guest_req_mutex);
>  
> +	if (!__ratelimit(&sev->snp_guest_msg_rs)) {
> +		svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, 0));
> +		ret = 1;
> +		goto out_unlock;

Can you (or anyone) explain what a well-behaved guest will do in in response to
BUSY?  And/or explain why KVM injecting an error into the guest is better than
exiting to userspace.
