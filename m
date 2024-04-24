Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD69415696B
	for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 20:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713992392; cv=none; b=N/kzEx5UAL+Px4VAozZxCs8gW5i3FiayUX8HmVjfRMDwLF0jePqsUnlvZwOjiu2ucB+cnJUB1hBHBxsajGwPWCBHhxQYTNq47wbCZrNPC8y8TuaAIAP8ecdcb1jPwFfAHXVOxVbtu9wtWMo+bTM2br13xU7Dc/jlk2Z0FIgVCBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713992392; c=relaxed/simple;
	bh=uoU2R06bl1D+d4rxO77OZBS6BnVKagWYLEFnEXdTDn8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dk6UfYQTgs2jDbQgE8mKBzgupdPaV1oIZ7uBOcIeYs7B9cYHxIw/R9ShTPYPFNB0D5Y2cYg1mY+m91KRtAmTgs4gy1/gTPZ6x4hn2ctBW+t/ZWsWK5sBx9n+uukVdqLPn+XlzAmfHuYpajOOum1ASD/6AVfXRSNeUZcaeUXcBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=myKdUrxa; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="myKdUrxa"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6ee0d64070aso314840b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 13:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713992390; x=1714597190; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8U1TRrKJi3x9eg5Tfok1QV3PlGCm0SDXSlp6I7iPxGE=;
        b=myKdUrxaxgbZxzZr4PfJmqIurcA9JHeut6cKtObUmObgQWhGzTS1nnugsE6DWp4Jdh
         naB9DdWCAPfZEqs9oAVMF1Zph8+muCntIVl2knEE/1fTOjrcfRxALoSR/V7tLWUZ6adv
         a+U2+3e+Axwk1hCw/lvhTYpzGFSy3hnISOJRHui+A0CsvXPo6pIOP/tzfpyeNWzRqfvz
         8jPq8cGgkzNk70ddv1kCyAHg+K/8z/la/ttTF0oPc/O8bfmCSVSaAufKZAn5A/VYoC+x
         CJ6gNm2/1eNnK534/vYPK12+eZ+sRL2wb77fHz9tWZVBfV8XsCm0rHlCjNSKBOD0wxOn
         +MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713992390; x=1714597190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8U1TRrKJi3x9eg5Tfok1QV3PlGCm0SDXSlp6I7iPxGE=;
        b=rU5k55/F9vrvVF7+zieJZL2lok/gmW8e9dYGmp7O5rW01pfP8aYQBqA+QRJWbP2GBp
         90BCh+Pp93dWUa4zBlR8vgq13PxgYc6qytlM8ERq+OKSmba/5WZ12+t/IK0XhqvYyprH
         ZKIeOHVzX71rbriky8PgQM+M+R8FsQWyh/EvxLFnMXPFX3YUUgkoLD1qvZujk4wlqXff
         /7monW4wRrTIENN6Q43Fjao5G32nll2R6TC1Ry0idadZS8tbc8Qh2ZfdbaMCNEmV/CZi
         f1z/5YeLoWCxsd4rI6LUsovEf1c4ecCwM45WtnDHbCxLOtWhtbJoUdVDZicw6j1Ujz/i
         yKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXewH5d9nMnFg+aITYkwa5GdLC9dXxXKKI5+GgnB72OCcqXgLIfLr8weymVuu8fI+x+udYu++AaakOViJ3xbqn+otvZuPo31gyfUQ==
X-Gm-Message-State: AOJu0Yz4sqkqAC5f9cgFsl2MGkaCleJnQtoTs8pTKcz+17FbHHET0mUD
	zd4+NgRdSZaD6gm59/ctaaf/WxFI/NYkj+Ps6Lo67e2gQz7j6t9aI8f4OJ3MRLP4ve1QiK9s3+S
	QaA==
X-Google-Smtp-Source: AGHT+IGmpsjpffCacAgU+oA7c6LytEyPptV84YPXAIS11abUo+sjJaZSSsVlO+4Jy+7xcfCJfVr3EYbcplE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:22c4:b0:6ec:f18a:2783 with SMTP id
 f4-20020a056a0022c400b006ecf18a2783mr446579pfj.0.1713992389985; Wed, 24 Apr
 2024 13:59:49 -0700 (PDT)
Date: Wed, 24 Apr 2024 13:59:48 -0700
In-Reply-To: <20240421180122.1650812-10-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240421180122.1650812-1-michael.roth@amd.com> <20240421180122.1650812-10-michael.roth@amd.com>
Message-ID: <ZilyxFnJvaWUJOkc@google.com>
Subject: Re: [PATCH v14 09/22] KVM: SEV: Add support to handle MSR based Page
 State Change VMGEXIT
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Sun, Apr 21, 2024, Michael Roth wrote:
> +static int snp_begin_psc_msr(struct kvm_vcpu *vcpu, u64 ghcb_msr)
> +{
> +	u64 gpa = gfn_to_gpa(GHCB_MSR_PSC_REQ_TO_GFN(ghcb_msr));
> +	u8 op = GHCB_MSR_PSC_REQ_TO_OP(ghcb_msr);
> +	struct vcpu_svm *svm = to_svm(vcpu);
> +
> +	if (op != SNP_PAGE_STATE_PRIVATE && op != SNP_PAGE_STATE_SHARED) {
> +		set_ghcb_msr(svm, GHCB_MSR_PSC_RESP_ERROR);
> +		return 1; /* resume guest */
> +	}
> +
> +	vcpu->run->exit_reason = KVM_EXIT_VMGEXIT;
> +	vcpu->run->vmgexit.type = KVM_USER_VMGEXIT_PSC_MSR;
> +	vcpu->run->vmgexit.psc_msr.gpa = gpa;
> +	vcpu->run->vmgexit.psc_msr.op = op;

Argh, no.

This is the same crud that TDX tried to push[*].  Use KVM's existing user exits,
and extend as *needed*.  There is no good reason page state change requests need
*two* exit reasons.  The *only* thing KVM supports right now is private<=>shared
conversions, and that can be handled with either KVM_HC_MAP_GPA_RANGE or
KVM_EXIT_MEMORY_FAULT.

The non-MSR flavor can batch requests, but I'm willing to bet that the overwhelming
majority of requests are contiguous, i.e. can be combined into a range by KVM,
and that handling any outliers by performing multiple exits to userspace will
provide sufficient performance.

And the non-MSR version that comes in later patch is a complete mess.  It kicks
the PSC out to userspace without *any* validation.  As I complained in the TDX
thread, that will create an unmaintable ABI for KVM.

KVM needs to have its own, well-defined ABI.  Splitting functionality between
KVM and userspace at seemingly random points is not maintainable.

E.g. if/when KVM supports UNSMASH, upgrading to the KVM would arguably break
userspace as PSC requests that previously exited would suddenly be handled by
KVM.  Maybe.  It's impossible to review this because there's no KVM ABI, KVM is
little more than a dumb pipe parroting information to userspace.

I truly do not understand why we would even consider allowing this.  We push back
on people wanting new hypercalls for some specific use case, because we already
have generic ways to achieve things, but then CoCo comes along and we apparently
throw out any thought of maintainability.  I don't get it.

[*] https://lore.kernel.org/all/Zg18ul8Q4PGQMWam@google.com
