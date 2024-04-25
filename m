Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A23A35
	for <linux-coco@lists.linux.dev>; Thu, 25 Apr 2024 00:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714005921; cv=none; b=HDk5m5UT4watIYYx180E+ZJbecc3/nesMpGNETHPZJw/y2Hd678gjm2e191+Tcwvj+yxbgnPtuYar+wgGluPvxGLLvS0+sXDCvhbWgUNA57Q0M5H2zD0AMhyhJ485G4BIRK6IA62zebMyK+bDp1ahftA1JmsKNMzx0Cy1i+01fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714005921; c=relaxed/simple;
	bh=C9Y7sI7S2lG7PgZ43yy72fujrqM9J0v4uwf6k/xCgvE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o7aCFc9kPuoX5qaCyjSQ1wXzYKxySWU8QrGSMVUhXPYloWpRXNNlJl1CnaAU2x/dQ+N3TJvMu7kEz0ul26YnA2FCxtAmJ/0XB9fbNnqjFo06u34a1IbpoYhfUzT0lrBq0SGwlYx5eNMKdR9ofKRnyLWk51R/io+myld9mgW9ltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mRRyYiPz; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mRRyYiPz"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1e422d89ec9so5516425ad.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 17:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714005920; x=1714610720; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehGLjycYzRvV+RegBC+30jOD4jldKpLBzIes+g3Te5M=;
        b=mRRyYiPzgpO+jcKJIcC6Hjrtls/g2s3rPL/D6fmxiWPcgs/kShnAnFOK+XMLuWN06L
         16tzkKI11cBx1hvrEE9ld9PYaFAg3YDpOlYgFWWYp9yVXL25CIyIexrtDrbQN8xLt6S/
         eMmm8+EeaOlKSqVfhLAFHLWBNZSoXbZNKQGu+8AlndmGTXIgzBIG6CtpP44xy3qRm5uR
         3x0GOUSF+/7CMKPqzBn/OFVwKHHJfVcCnAbN9QyyqXPRy6fztak5MtceteS9qYZmkams
         gmT0xaeeP0LCdAgE6hilQ6i1ROdmx/a0FuETNnxMFFOW+h0du4Stwy8VwV0LRlhpg248
         7szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714005920; x=1714610720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehGLjycYzRvV+RegBC+30jOD4jldKpLBzIes+g3Te5M=;
        b=ixmQwBI5q8fxF9c6w0m7pcTtYwO4oELXmghfj313gnDWwZGnjURDQqpzX+JNsaDc3/
         Z3/fIdkOgGLhIJ5Kr5fCb5oN41JW8eyslykuXCASlGrTStV/I6QYOQbjf7sKg+HzCTlL
         1oC7XeRm6WqLYYdms9oqwDoDe8tVbGTbM1twvjKnzGIloSoPhqBGELOGLg9gVqjlBSwf
         Vxxf3teFqUZfOLYVf2K9dL/uq5gzcEkNB4RmPvQVJbzUS1rQyT9fDa14b+h/dyMqSmjU
         MCTY9JbIz65Qn/qbGSoA7DNTPrTJymWsrusKOPgUkIb1u4dqa0ejdv3NC9B5WWntn9bW
         af3A==
X-Forwarded-Encrypted: i=1; AJvYcCUFD+gUfIVeFEu41vMtYq1gLfNBn1NBCfilX4TG3Bef9ALr8vJZmRWM9zJKk/Xpbygc4HbOIMTvBRQTT5+rD2eJU72+1T+x3AOBsA==
X-Gm-Message-State: AOJu0YxXsXxlCFzblGOuzWFthY0SQfaL6QiuEhHT6DsOgT3AVVCl0SJE
	OHYaJQv/iGhc5d79ZCVQKFENqnpjG0KuFrUDtrp+GFkIe/oF28noMiyS2ek1zQQHrGXxxvGqfaO
	Jkw==
X-Google-Smtp-Source: AGHT+IFR9HYBLarlt9ZsOvhUbV8OSiFHhgh7AV7IIXgugq1S0Quy5L1i73/i89wy47ffAjGpD3+fDEtcXsg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:244e:b0:1e3:e6cb:a06e with SMTP id
 l14-20020a170903244e00b001e3e6cba06emr344607pls.5.1714005919640; Wed, 24 Apr
 2024 17:45:19 -0700 (PDT)
Date: Wed, 24 Apr 2024 17:45:18 -0700
In-Reply-To: <20240421180122.1650812-17-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240421180122.1650812-1-michael.roth@amd.com> <20240421180122.1650812-17-michael.roth@amd.com>
Message-ID: <ZimnngU7hn7sKoSc@google.com>
Subject: Re: [PATCH v14 16/22] KVM: x86: Implement gmem hook for determining
 max NPT mapping level
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
	pankaj.gupta@amd.com, liam.merwick@oracle.com
Content-Type: text/plain; charset="us-ascii"

On Sun, Apr 21, 2024, Michael Roth wrote:
> ---
>  arch/x86/kvm/svm/sev.c | 32 ++++++++++++++++++++++++++++++++
>  arch/x86/kvm/svm/svm.c |  1 +
>  arch/x86/kvm/svm/svm.h |  7 +++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index ff9b8c68ae56..243369e302f4 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -4528,3 +4528,35 @@ void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
>  		cond_resched();
>  	}
>  }
> +
> +/*
> + * Re-check whether an #NPF for a private/gmem page can still be serviced, and
> + * adjust maximum mapping level if needed.
> + */
> +int sev_gmem_validate_fault(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, bool is_private,

This is a misleading name.  The primary purpose is not to validate the fault, the
primary purpose is to get the max mapping level.  The fact that this can fail
should not dictate the name.

I also think we should skip the call if the max level is already PG_LEVEL_4K.
Something _could_ race and invalidate the RMP, but that's _exactly_ why KVM
guards the page fault path with mmu_invalidate_seq.

Actually, is returning an error in this case even correct?  Me thinks no.  If
something invalidates the RMP between kvm_gmem_get_pfn() and getting the mapping
level, then KVM should retry, which mmu_invalidate_seq handles.  Returning
-EINVAL and killing the VM is wrong.

And IMO, "gmem" shouldn't be in the name, this is not a hook from guest_memfd,
it's a hook for mapping private memory.  And as someone called out somwhere else,
the "private" parameters is pointless.  And for that matter, so is the gfn.

And even _if_ we want to return an error, we could even overload the return code
to handle this, e.g. in the caller:
	 
	r = static_call(kvm_x86_max_private_mapping_level)(vcpu->kvm, fault->pfn);
	if (r < 0) {
		kvm_release_pfn_clean(fault->pfn);
		return r;
	}

	fault->max_level = min(fault->max_level, r);

but what I think we want is:

---
int sev_snp_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
{
	int level, rc;
	bool assigned;

	if (!sev_snp_guest(kvm))
		return 0;

	rc = snp_lookup_rmpentry(pfn, &assigned, &level);
	if (rc || !assigned)
		return PG_LEVEL_4K;

	return level;
}

static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
					u8 max_level, int gmem_order)
{
	if (max_level == PG_LEVEL_4K)
		return PG_LEVEL_4K;

	max_level = min(kvm_max_level_for_order(gmem_order),max_level);
	if (max_level == PG_LEVEL_4K)
		return PG_LEVEL_4K;

	return min(max_level,
		   static_call(kvm_x86_private_max_mapping_level)(kvm, pfn);
}

static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
				   struct kvm_page_fault *fault)
{
	struct kvm *kvm = vcpu->kvm;
	int max_order, r;

	if (!kvm_slot_can_be_private(fault->slot)) {
		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
		return -EFAULT;
	}

	r = kvm_gmem_get_pfn(kvm, fault->slot, fault->gfn, &fault->pfn, &max_order);
	if (r) {
		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
		return r;
	}

	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
	fault->max_level = kvm_max_private_mapping_level(kvm, fault->pfn,
							 fault->max_level, order);
	return RET_PF_CONTINUE;
}

---

Side topic, the KVM_MEM_READONLY check is unnecessary, KVM doesn't allow RO memslots
to coincide with guest_memfd.  I missed that in commit e563592224e0 ("KVM: Make
KVM_MEM_GUEST_MEMFD mutually exclusive with KVM_MEM_READONLY").
