Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4413DFC67
	for <linux-coco@lists.linux.dev>; Wed,  8 Jul 2026 21:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546678; cv=none; b=j1zNKzNaYsYN85R7N76+ggGg7FZmjP6kBA4QHP6OyvoC4uE5KPA55k0nN+yjoR9t2Ue+GBqffft2FqDoGHD3FFrJn9ttu/RxtireqpbwUqcqVAi67k3OP9nT4/HbMOtHfTOBFd8z7AwVPJoofceGMhJzift/2YX/i/hAzF8usjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546678; c=relaxed/simple;
	bh=oNlrIZHtI+fOCrtjA7kzhADNoKX+kegB62oKlMlJ36c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BBwrMRFK11EGO829K9VrEBcK5LkBP3Tw6wo0mM6qDIiud25M8rVxcisSVg1iugVumCpkElwyOJx+dQqNx9/RLrFCKuixSUr4aKIjU6wwAPeC6VAvjCPGGsK4y0f8hl4f8zmu7daTqbnE0WcGcqjp7S7iGT0buojRZm4gi1aNEE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sFIRAiQT; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sFIRAiQT"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8484123e7c9so1293742b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 08 Jul 2026 14:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783546676; x=1784151476; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+ih+gkmNfMBYrEi1/0uawSdekgkxwJZiIjENB0lVHA=;
        b=sFIRAiQTWpkXPG6ECSzZbtqznOWKBFMQcRXfxm0pTyDD0MoLqYcLw2nA6gvXNrUMvS
         OO5VBXxyDP0b9WzyHURdYKsGoAdQTS2RmQ3GzDclhaqx1zdN4vLwtqK893v0GuxvTzPH
         W9nmTPvaspWHJghLvQLNFLDE+Z/Nqz2j/bcatF1YfdqnM4CqDtlMZ6avQvj5pkywUmAV
         jIH0kbvDL5zJfnJj8CAuuDymCinx7KT4yDuk8kdXNSpJHlkVfsGmsQ5NR33pk6WfAxZz
         N4DlYR7MJ90OjVTlVV3mnjaKiUzPzN6RlExlwwfJTUN9KfQQEPiBC7huEwrcxgdg/2JI
         hfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783546676; x=1784151476;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+ih+gkmNfMBYrEi1/0uawSdekgkxwJZiIjENB0lVHA=;
        b=KWHZFAiNCeInxxQ7jOWJp4aAuSibWoK2ctHxiwerrtSAbtY+v3uYGYltJmoez2P/2l
         ZVtkST2BqKytSwXXEY8nqQ1CItbQxmGYbn79pWUPPBPAemQsJ1KwJ1MAj67zWwNSwIyG
         BI2isFykIwpjkq9T3xxgzYoLMZ3iMC+e7SBSmriDOxnk1WFZ0rFFZ830ZO5mfompQ2J7
         BIQOl3uTLQyrT+VhE3iSb8mjGOiUJnSpNgyHBt4YpOzmVt6AozTlMvf88kQCL1fqAqPn
         a+Aa3GoKgPdLXC6sjwjzIt7rmtNs9aFauNrRZgaCGLaVUr3tzdgME+b5WZ+lo8Juht4r
         bILQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrmc3sO7yWg4Qob3J3hoRN1cTPuVg4+3lh7bE7An4pJnFOvK/Z1PBYoMAemF9dWAHjGzCkXAdAGw/JP@lists.linux.dev
X-Gm-Message-State: AOJu0YwtIEInlAfRvKsbPBWLv5f6utj5XQDBfs2MlG+g0uDqSEUqcJL8
	6u0GtVbGEk//4g+DsE0oVtSBiOwQMdAbIFGe8LeDXIiFKgyx6+qNdboXHmkG/R8BdWEPcCDoJTi
	pR9NAlA==
X-Received: from pfcf12.prod.google.com ([2002:a05:6a00:238c:b0:845:f28c:430e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:39a8:b0:845:d285:3b6e
 with SMTP id d2e1a72fcca58-84842fce41amr3639665b3a.58.1783546675996; Wed, 08
 Jul 2026 14:37:55 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:37:55 -0700
In-Reply-To: <20260618081355.3253581-17-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com> <20260618081355.3253581-17-yilun.xu@linux.intel.com>
Message-ID: <ak7DMwbF4viiVoO5@google.com>
Subject: Re: [PATCH v2 16/17] KVM: TDX: Add in-kernel Quote generation
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, djbw@kernel.org, kas@kernel.org, 
	rick.p.edgecombe@intel.com, yilun.xu@intel.com, xiaoyao.li@intel.com, 
	sohil.mehta@intel.com, adrian.hunter@intel.com, kishen.maloor@intel.com, 
	tony.lindgren@linux.intel.com, peter.fang@intel.com, baolu.lu@linux.intel.com, 
	zhenzhong.duan@intel.com, dave.hansen@intel.com, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 18, 2026, Xu Yilun wrote:
>  void __init tdx_early_init(void);
> diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
> index ac8323a68b16..5e4b3aee0577 100644
> --- a/arch/x86/kvm/vmx/tdx.h
> +++ b/arch/x86/kvm/vmx/tdx.h
> @@ -47,6 +47,12 @@ struct kvm_tdx {
>  	 * Set/unset is protected with kvm->mmu_lock.
>  	 */
>  	bool wait_for_sept_zap;
> +
> +	/*
> +	 * Whether to get the quote directly in kernel, without exiting to
> +	 * userspace.
> +	 */
> +	bool get_quote_in_kernel;

Why is this cached per-VM?  IIUC, tdx_quote_enabled() is constant after initial
TDX bringup.

And is keying off tdx_quote_enabled() and only tdx_quote_enabled() backwards
compatible?  How do we know that cutting userspace out of the loop wont' break
anything?


>  };
>  
>  /* TDX module vCPU states */
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 9f7c39e0d4b5..20558b0185b6 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1538,11 +1538,133 @@ static int tdx_get_quote_user(struct kvm_vcpu *vcpu, u64 gpa, u64 size)
>  	return 0;
>  }
>  
> +static bool write_quote_status_to_guest(struct kvm_vcpu *vcpu, u64 status,
> +					gpa_t gpa)
> +{
> +	if (kvm_vcpu_write_guest(vcpu,
> +				 gpa + offsetof(struct tdx_quote_req, status),
> +				 &status, sizeof(status)))
> +		return false;
> +
> +	return true;
> +}

This is a completely useless wrapper.  Actually, it's worse than useless, as it
inverts the return value from the widely used kvm_vcpu_write_guest() API.

> +
> +static bool write_quote_to_guest(struct kvm_vcpu *vcpu, void *quote_data,
> +				 u32 quote_len, gpa_t gpa)
> +{
> +	if (kvm_vcpu_write_guest(vcpu,
> +				 gpa + TDX_QUOTE_REQ_HDR_SIZE,

This is unnecessarily confusing.  I had to look at the definition of
TDX_QUOTE_REQ_HDR_SIZE to understand that this just writing to tdx_quote_req.data.
I might not care if this was the only write, but then the very next statement
writes to a field that isn't obviously in the header.

> +				 quote_data, quote_len))
> +		return false;
> +
> +	if (kvm_vcpu_write_guest(vcpu,
> +				 gpa + offsetof(struct tdx_quote_req, out_len),
> +				 &quote_len, sizeof(quote_len)))
> +		return false;
> +
> +	return true;
> +}

So is this.  There's literally one caller.

> +
> +static u64 get_quote_kernel(struct kvm_vcpu *vcpu, struct tdx_quote_req *req,
> +			    gpa_t req_gpa, size_t total_len)
> +{
> +	struct tdx_td *td = &to_kvm_tdx(vcpu->kvm)->td;
> +
> +	/* Only support version 1 as defined in the GHCI spec */
> +	if (req->version != 1)
> +		return TDX_QUOTE_STATUS_ERROR;
> +
> +	/* Header + input data must fit in the page read from guest memory */
> +	if ((size_t)req->in_len + TDX_QUOTE_REQ_HDR_SIZE > PAGE_SIZE)
> +		return TDX_QUOTE_STATUS_ERROR;
> +
> +	/* Caller owns the requested quote */
> +	void *quote_data __free(kvfree) =
> +		tdx_quote_generate(td, req->data, req->in_len, &req->out_len);

Am I the only person that finds the __free() stuff to be difficult to follow?
I'm sure there are flows where it's a big net positive, but IMO this isn't one.
If the *unnecesary* layers of single-use helpers are stripped away, I suspect
we'll naturally end up with a goto sequence that is more obvious that using __free().

> +
> +	if (!quote_data)
> +		return TDX_QUOTE_STATUS_UNAVAILABLE;
> +
> +	if ((size_t)req->out_len + TDX_QUOTE_REQ_HDR_SIZE > total_len)

Can we really not pre-check the size?

> +		return TDX_QUOTE_STATUS_ERROR;
> +
> +	if (!write_quote_to_guest(vcpu, quote_data, req->out_len, req_gpa))
> +		return TDX_QUOTE_STATUS_ERROR;
> +
> +	return TDX_QUOTE_STATUS_SUCCESS;
> +}
> +
> +static u64 tdx_get_quote_check_args(struct kvm_vcpu *vcpu, u64 gpa, u64 size)

Adding single use helpers does not make the code easier to read.

> +{
> +	gfn_t gfn_start, gfn_end;
> +	u64 end;
> +
> +	if (!size)
> +		return TDVMCALL_STATUS_INVALID_OPERAND;
> +
> +	if (!PAGE_ALIGNED(gpa) || !PAGE_ALIGNED(size))
> +		return TDVMCALL_STATUS_ALIGN_ERROR;
> +
> +	if (check_add_overflow(gpa, size, &end))
> +		return TDVMCALL_STATUS_INVALID_OPERAND;
> +
> +	gfn_start = gpa_to_gfn(gpa);
> +	gfn_end = gpa_to_gfn(end);
> +
> +	/*
> +	 * Reject if the guest didn't explicitly convert its quote pages to
> +	 * shared.
> +	 */
> +	if (!kvm_range_has_memory_attributes(vcpu->kvm, gfn_start, gfn_end,
> +					     KVM_MEMORY_ATTRIBUTE_PRIVATE, 0))

TOCTOU?

> +		return TDVMCALL_STATUS_INVALID_OPERAND;
> +
> +	return TDVMCALL_STATUS_SUCCESS;
> +}
