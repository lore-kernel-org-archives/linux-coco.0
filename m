Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710436AB4F
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 22:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725406; cv=none; b=rG2U3RTXiniOtqZL+299cGRxeOetWZar1l8EwxILb0pD5RlVs0FG9c8EO+I3ODobDEvXqv8nqM6H7vGOu77WTHOIeJ51xMS+v6BnhQjr2z+zPcfncN4FXxQSa0R1j7NsnMBmh+qeJiE/YtK8i/D7ItmaHx/YE4phT85BcClHdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725406; c=relaxed/simple;
	bh=XId/psBz2B6CRgPkYn1/L0PMl47eroAR8b7KTrFAN38=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sGzLaz9g6u6R9w4tzsSWgFrIQjGW/WHqJXd5TPU8Ez1oKwPIrj81aYdWxK52cjhUkqQJWVY4iWUqbL+gk+96cXsz6FNumMMC6Znjcl3t87dkTuhzn9U5dU+Fnl3wo936iv0GkMdi8PIHjlv6VEvbaGC5vRD1Ydt6tLlwHrEOYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d9jvMwMN; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d9jvMwMN"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34c6e05af6fso1170451a91.1
        for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 14:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769725404; x=1770330204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjpoE/7MkU533iWOJXX/9jSCPi0JjIxUjWp+cR10TGk=;
        b=d9jvMwMNaAgBIsg2WXzKzmg7jgNtrhNbfhzHEsY8dKpUMObsGynu5ett7U4+MraD45
         4OYi9KXcFACLNMY7L3xDme89A+eQLMWsidRgkfaptFAB4LxW5Vn8byz1+SvbkkJQ5Gq4
         dm87BCaDvNErapwUamhBePvv075rwrKNCaIeUiTJW5jN2eSEGkG8uDVFoQUmk46zcGV0
         7niJjvpzGCZtFiMrdvhoJdCqJiEdwAcWULBHlooSFi15saHSwZCOpCSQovr+7gd3KwxN
         G4OZ4XKJd5NM7fkmrVPzTuaJdVGIYt3d+ba5cGRkzKGcfGqcunXgWZ+UYdJuwVg5l9Gx
         AGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769725404; x=1770330204;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CjpoE/7MkU533iWOJXX/9jSCPi0JjIxUjWp+cR10TGk=;
        b=SsBUT4Ci6Yj36ngfioECRDdl0K5+Bq2mQ5/6YoayrFV63NVZBMBxxXVsR8lwWX/RkR
         t5pMkjxY0+KPELU+h8ntBv21e72Ac/39jIHPyBZgp7WjTn1madyhIVSxPeWYODdwQ8Iu
         Qn5/PmNJiEV+dzHqXAKiXyXDXzUWPGDWW+SoTyu1rYLta4Dobu8ppjxKEnx1mebLnkVE
         m9uzrWnhzuOpchs7Fpq+/1w++0TlhtTB8yM8Z6PdbuxJNgkQetCKiXQEAj9RIDYIu9FJ
         Y4AkMe1aHJiJk7iEJGc7Y61nPpmWZZzPS3eejnCZw3gzDakNuOVb/HvWvzMHDmPe/pFt
         h5bA==
X-Forwarded-Encrypted: i=1; AJvYcCWotzzQV8b2Rvoi69QfPADhAY1xXX5HrWNmcWQAnKwzg4L2EQBYGpD5ZDmcg4mF5c2sy8zLKgeI6Thz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5/RIsuPlBFardGyuXOuP8KPa59ItcYQKDLXMN4JoRlJfqeNal
	McsI+QRbJZqttJV36fnXH8CzmaDMEd53jXD3ZgJ7IFgnK0ATFL2mzS8ISvCedyB2tOkKT45UP56
	JCCT0qQ==
X-Received: from pjd11.prod.google.com ([2002:a17:90b:54cb:b0:353:28b4:c297])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d445:b0:340:e8e9:cc76
 with SMTP id 98e67ed59e1d1-3543b309885mr823538a91.11.1769725404404; Thu, 29
 Jan 2026 14:23:24 -0800 (PST)
Date: Thu, 29 Jan 2026 14:23:23 -0800
In-Reply-To: <fbaeb0d2f4658efd4c7bb61ac0ba2919c8226a36.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-3-seanjc@google.com>
 <fbaeb0d2f4658efd4c7bb61ac0ba2919c8226a36.camel@intel.com>
Message-ID: <aXvd2z8HmLFd50io@google.com>
Subject: Re: [RFC PATCH v5 02/45] KVM: x86/mmu: Update iter->old_spte if
 cmpxchg64 on mirror SPTE "fails"
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"bp@alien8.de" <bp@alien8.de>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>, Kai Huang <kai.huang@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "sagis@google.com" <sagis@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-01-28 at 17:14 -0800, Sean Christopherson wrote:
> > Pass a pointer to iter->old_spte, not simply its value, when setting an
> > external SPTE in __tdp_mmu_set_spte_atomic(), so that the iterator's va=
lue
> > will be updated if the cmpxchg64 to freeze the mirror SPTE fails.
> >=20
>=20
> Might be being dense here, but is the bug that if cmpxchg64 *succeeds* an=
d
> set_external_spte() fails? Then old_spte is not updated and the local ret=
ry will
> expect the wrong old_spte.

No, the bug is if the cmpxchg64 fails.  On failure, the current mismatching=
 value
is stored in the "old" param.  KVM relies on the iter->old_spte holding the
current value when restarting an operation without re-reading the SPTE from=
 memory.

E.g. in __tdp_mmu_zap_root(), if tdp_mmu_set_spte_atomic() fails, iter->old=
_spte
*must* hold the current in-memroy value, otherwise the loop will hang becau=
se it
will re-attempt cmpxchg64 using the stale iter->old_spte.

static void __tdp_mmu_zap_root(struct kvm *kvm, struct kvm_mmu_page *root,
			       bool shared, int zap_level)
{
	struct tdp_iter iter;

	for_each_tdp_pte_min_level_all(iter, root, zap_level) {
retry:
		if (tdp_mmu_iter_cond_resched(kvm, &iter, false, shared))
			continue;

		if (!is_shadow_present_pte(iter.old_spte))
			continue;

		if (iter.level > zap_level)
			continue;

		if (!shared)
			tdp_mmu_iter_set_spte(kvm, &iter, SHADOW_NONPRESENT_VALUE);
		else if (tdp_mmu_set_spte_atomic(kvm, &iter, SHADOW_NONPRESENT_VALUE))
			goto retry;
	}
}

> > =C2=A0 The bug
> > is currently benign as TDX is mutualy exclusive with all paths that do
> > "local" retry", e.g. clear_dirty_gfn_range() and wrprot_gfn_range().
>=20
>=20
