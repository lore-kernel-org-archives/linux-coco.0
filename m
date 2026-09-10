Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E8129B20A
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 22:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080647; cv=none; b=uzmM9NAzgxMTrkBJmZWzbxdHGwR4DrKYTTz7a8u1jCrv0EFwzKEK/uXbPM5oEf85QZGQO/igvi1CIh89mNYhktv8WsnO3XBR5ZwMJK3I2lmvMSAhlg4PEkgWvQhXEBzrXrvoBID2x8ARrVcjeWSDFEo7AtqdycWWccwqWbHwa+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080647; c=relaxed/simple;
	bh=C7V7Fqm2GnPpsjDlmS5uYNFCxnY5rCJDt1LyTBKpO3g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MyV6vYxWQFEz7Gjh3lWdqeQ/kiJdrlwhsI04z2OXhmgW4EvmFBDuV/6gV0y0EeDq6op3fk/HpWhVF9Wm/xRBJUyNjkTHEBCpcJE5Wcx+Rg8vzUxbuUPlGb1cz9jTnBf1iUCP0t1j9qE08Kl8ePeZEgPNreaD8CcSK/RyO6S2Kmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TOpK8nSI; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TOpK8nSI"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso438354a91.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 15:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789080646; x=1789685446; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CLmrfb7NXI5qaK2erHQxMEAI4CCcSkomEkbhr63psE=;
        b=TOpK8nSIVFPXNNNPkOYc6bzIohgHo0Q+ytOCROOoykg71qWiRgBaDnQ9lixxJHA6et
         JAEbPej8zVjwecitf3OMMncFiPjdOcYMhB8shXQBX5lnI7NerJhVncz/mTdVfv/Emhfn
         Fpoz/bAcYCpfkl7nb8mIZbBB954NDBVIkZAD5uB0ZcVn9Y7imBQ1xYHpefhSkGpRmdBT
         JY9EpP0OWAhJuqEQG3Rmp87HVK3/Zb8IvW/OTkoKdU40OJNvwY7+Qw3iCp4gIMKK7r5w
         5ozyPieaENYzpVcxBZ4frbEGOoJHwfCKQzFVdX2zlXaVLYX6bSM+wVkixE2jJT7R+8P7
         X5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080646; x=1789685446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CLmrfb7NXI5qaK2erHQxMEAI4CCcSkomEkbhr63psE=;
        b=K5cnUudUSu+ZDDOotXPGa0VdNQcRF74K5+08JoJ22CzSuDEwr0Z99kBuc9ab7MynyF
         azzlqJ+x7UuK2z2ObYYpe0hAveTd/NLifsJDtvydixWk0iVUUq+av4gmfwZCK8+vp9t5
         AmH0RV+5Q24RGMjI7VlhyF2Qct+gXtQG+RN0NKfCEuVFGq0SmEPZMl/EBPSekLFh+KA3
         sUJh3gu8tPe4t/9cuKwVsTMAAVi604qpxnTPVkWBtwlXl8/vntZWjESUAF5BR+fdMAqD
         eRX9c41PHpfILG5iGfBFfC9s7kTydwKHKueNIraBVJqA6m3te3mIt+ZnspJIILSaqfEI
         a4iQ==
X-Forwarded-Encrypted: i=1; AKwUvByUrr4/oY1D1Dkt9mPhrHwrNmtjjhcrKRDo5vlpxGM1cTk/YPl4hMiSphjCCgvKh0lCiNHdXg4FOs5b@lists.linux.dev
X-Gm-Message-State: AFuF++nugstmxZpzYkb6t1GGeDxHdcXgMQjDbO5PwIP8ot6+tBDHZ+Z0
	o2Bk1ctspH5llLHB1HxNMoTcCgREwmXnevftW1xDR2ZMuYDuwnrqU0+pt5C+LvvBdm8+ZqCIJNI
	ugtNk4Q==
X-Received: from pjqo12.prod.google.com ([2002:a17:90a:ac0c:b0:39b:9ef7:a6f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:574c:b0:38e:9045:babe
 with SMTP id 98e67ed59e1d1-39d9bd99cb7mr1730684a91.7.1789080645505; Thu, 10
 Sep 2026 15:50:45 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:50:44 -0700
In-Reply-To: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
Message-ID: <aqM0RIiLVqvwit-w@google.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
From: Sean Christopherson <seanjc@google.com>
To: Jacky Li <jackyli@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, Jacky Li wrote:
> Currently, snp_handle_(ext_)guest_req() returns -EIO when
> kvm_{read/write/clear}_guest() fails while accessing guest-provided
> buffers. Returning -EIO causes KVM_RUN to exit to userspace, likely
> killing the VM.
> 
> Fix this by returning GHCB_HV_RESP_MALFORMED_INPUT with sub-error code
> GHCB_ERR_INVALID_INPUT to the guest and resuming the vCPU.
> 
> Per the GHCB specification, guest-provided GPA buffers that cannot
> be accessed by the hypervisor (e.g. private pages) should be treated
> as guest input errors. Because kvm_{read/write/clear}_guest() only
> returns -EFAULT on failure, treating this failure as an invalid input
> aligns with the definition of -EFAULT ("Bad address").
> 
> Returning GHCB_ERR_INVALID_INPUT also matches existing SNP handling
> in KVM, which already returns this error code for unaligned or
> overlapping buffers. It also aligns with other hypercall implementations
> in KVM (e.g. Hyper-V returning INVALID_HYPERCALL_INPUT on
> kvm_read_guest() failures in kvm_hv_flush_tlb()).
> 
> Performing upfront validation (e.g. via kvm_mem_is_private()) is
> avoided because it is prone to TOCTOU races with concurrent Page State
> Changes.

When stating what a patch does (or doesn't) do, phrase everything as commands.
Passively describing the patch, as done above, is problematic as it's not clear
if the changelog is talking about what the patch itself is (not) doing, or if
it's talking about the side effects of the changes.  Whereas this:

  Don't try to validate guest-provide ahead of time, as such checks are prone
  to TOCTOU races, e.g. with Page State Changes, memslot updates, etc.

is more obviously talking about the patch.

> Fixes: 88caf544c930 ("KVM: SEV: Provide support for SNP_GUEST_REQUEST NAE event")
> Fixes: 74458e4859d8 ("KVM: SEV: Provide support for SNP_EXTENDED_GUEST_REQUEST NAE event")
> Signed-off-by: Jacky Li <jackyli@google.com>
> ---
>  arch/x86/kvm/svm/sev.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 5705723f1f41..d07562310519 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -4228,8 +4228,10 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
>  
>  	guard(mutex)(&sev->guest_req_mutex);
>  
> -	if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE))
> -		return -EIO;
> +	if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE)) {

I don't love that userspace VMM goofs will bleed into the guest, but on the other
hand, KVM already uses this pattern for Hyper-V hypercalls (and worse patterns
for KVM-defined PV features), and practically speaking this is better behavior
than returning -EIO.  So I'm good with this.
