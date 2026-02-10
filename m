Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666373EBF16
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 00:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681839; cv=none; b=l2dEETcuTOjsYXP1KAqgbnv3UUF8yVa7eH67L+urDfNs98jv21ZDQ/AoK4ZF3Itf83S8SetbgZlxa/OgWpJcY3y+hpSgJ8GXaV3lDu92KeBD2Ei5sBfolvB1hqk4Fk09l9VEA4rRplT1Qc7nTlBpQgWOJ36oWLwaFBATCZaZM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681839; c=relaxed/simple;
	bh=gjWOfh2oXqfUpw2wDeimGs6kjBD+x4vrWr1zYXsf3kY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rx+r/R2ejNrjWL7E8Q+y38WEmfFPswmEZsxCUjWhbano1XmU6+pjilL1+ywI++bZYxXn2KCjcgNpA9YUghUR4v++2OSCXtjyMFDZGNoFctvXR+ET3QtoRuZ7IGX5IhCRM22t6VFAR3lMrNdMRUMKmM+0oFm/BgR8qLLNgasplp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=36m8nAu0; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="36m8nAu0"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354bc535546so3157540a91.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Feb 2026 16:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770681837; x=1771286637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8D+wnxBr88OFAdWjFQqFAuUdOy/p9oRL4Mq3hgfPxZ0=;
        b=36m8nAu05tni2BRGWrjaiyf2Zw6qcOmRhNWFgx5Fc0r7Gb7z9OJVwWUmrAxc21mydQ
         Y5X3WnlnpyASuU5718MQZMw0mqisvsv3TjF9KvEE4yL5oB4hCc7lUZPj3pWc7uEgFOc1
         wYt/pVW59/9RKfsJwKR7ZiLh9WrsGZu1QTahXVgpunRfzCKWx5NFWMkhfHLklG9Ux9em
         //hlQVIxTMhFy0+MzKB0NfT34bGBtDGz851MxOsC3IKAvGz2/VUobkoDMDDt6Wg5TIEm
         rCJ9T7ltGKtdsquXAUlHukXgpD/7VRWr8ulvE5FiBhpbVDnHHvyxo15+B6Vj1V7gQquk
         KIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681837; x=1771286637;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8D+wnxBr88OFAdWjFQqFAuUdOy/p9oRL4Mq3hgfPxZ0=;
        b=S1SkIfYr0TMqTLeghTDc+P696WMlQOUfMhijOG+iqVGH0E9/t5VHCmZuLNqrgQiph7
         Ggepy9oZRm22ih3LKkVV1l0+pZMtBjQfIsnaBweQp+zc4jJEpITOXchurabRnZeykL27
         K42FPzpzTF8SgOC5YGxh2J0bS6yVfr85iD4n0oJETOTMGbUQbHHs+Pi0woyLwKJgpMgf
         EfdvfowXp5Jh26XBq5fvt+XHXzpAKs/htYpHCrMej07YLmQCvLlqh0h5lAA9Voau38xO
         JzofTPvoSzhIXHkYnZbCAROdLRVfTEkJzpuVlUTZkI8DkA8sUndBXWmuTBjoD6F8zu1I
         Nlfw==
X-Forwarded-Encrypted: i=1; AJvYcCXytfMXoI2vJa5nlf/Si8xvji7yXQSr5TI6GLRQtDQuP2OsXTRQoT/vKqxIAzkKm6AoLeIhXFDVbkHM@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0LfHKbvHVwSxVkfyybt8nhDso3ZRLcCT6Ox4k+JCnmqCrOUgj
	RL/etnU5IkXRdaypLwQDQJsfXlCQFUgbnbf08Lj5kAY9kJ9H1DwTOXnLV+nXlkr4YI/k+2zs0cG
	xUS+0kA==
X-Received: from pjbse14.prod.google.com ([2002:a17:90b:518e:b0:356:3562:569c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:58cb:b0:340:b572:3b7d
 with SMTP id 98e67ed59e1d1-354b3e2b23amr11589908a91.19.1770681836655; Mon, 09
 Feb 2026 16:03:56 -0800 (PST)
Date: Mon, 9 Feb 2026 16:03:54 -0800
In-Reply-To: <e81151ce-6e67-48e8-a722-da9ff03d686b@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-21-seanjc@google.com>
 <aYW5CbUvZrLogsWF@yzhao56-desk.sh.intel.com> <aYYCOiMvWfSJR1AL@google.com> <e81151ce-6e67-48e8-a722-da9ff03d686b@intel.com>
Message-ID: <aYp16kCxBSthwtjf@google.com>
Subject: Re: [RFC PATCH v5 20/45] KVM: x86/mmu: Allocate/free S-EPT pages
 using tdx_{alloc,free}_control_page()
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2026, Dave Hansen wrote:
> On 2/6/26 07:01, Sean Christopherson wrote:
> >  /* Bump PAMT refcount for the given page and allocate PAMT memory if n=
eeded */
> >  int __tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache)
> > @@ -2272,7 +2272,7 @@ int __tdx_pamt_get(u64 pfn, struct tdx_pamt_cache=
 *cache)
> >         if (ret)
> >                 goto out_free;
> > =20
> > -       scoped_guard(spinlock, &pamt_lock) {
> > +       scoped_guard(raw_spinlock_irqsave, &pamt_lock) {
> >                 /*
> >                  * Lost race to other tdx_pamt_add(). Other task has al=
ready allocated
> >                  * PAMT memory for the HPA.
> > @@ -2348,7 +2348,7 @@ void __tdx_pamt_put(u64 pfn)
>=20
> Why does this need to be a raw spinlock? irqsave, sure, but raw?

Huh, TIL.  (And just when I thought I finally had my head wrapped around RT=
 "spinlocks"):

  The hard interrupt related suffixes for spin_lock / spin_unlock operation=
s
  (_irq, _irqsave / _irqrestore) do not affect the CPU=E2=80=99s interrupt =
disabled state.

Ah, and running RCU callbacks from soft IRQ context is straight up disallow=
ed for
PREEMPT_RT.

  /* By default, use RCU_SOFTIRQ instead of rcuc kthreads. */
  static bool use_softirq =3D !IS_ENABLED(CONFIG_PREEMPT_RT);
  #ifndef CONFIG_PREEMPT_RT
  module_param(use_softirq, bool, 0444);
  #endif

So yeah, just spinlock_irqsave should be fine.  Though the way things are t=
rending,
it'll be a moot point if KVM ends up freeing S-EPT page tables from task co=
ntext.

> The page allocator locks are used in this context and aren't raw.


