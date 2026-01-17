Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146EF2C86D
	for <linux-coco@lists.linux.dev>; Sat, 17 Jan 2026 00:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768611240; cv=none; b=arlByXvY31OWYiaD+nHtHP4X1WB7a1o2i4IN6KdshcqHOa8703ZwqwrMKMD2lyh0KdgIo5+49j5WzZEh3OKJ7j1uVYAgebY1kqzGulTcSgN0onvHn0ybFQ7GO9AjSmVhjRgG6RVPl7UUqzO/LsVUChXIwYtiidlGIec44fJ3Jio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768611240; c=relaxed/simple;
	bh=KtQbBtkkDfMz+T6TV6Z43Sh0FYs4DtN2nG5zD6O9acc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OjlHCsL41BwG+ANBPcOlLAJUJka5FES9Z8gMCcP7S61fwPLqTw2YmAAi3nllb6u294HBPN46eCE98nyKgH5RfVAkPi1Z0QR+uWKCmi8EMVBmtW5THacoKMDAC/zvQk6SJB/G1Ga6cT7+b7DZopsMa2Qa1LmAmcepbrGQ1LZIHZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yW2bn0kD; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yW2bn0kD"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso4931043a91.1
        for <linux-coco@lists.linux.dev>; Fri, 16 Jan 2026 16:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768611238; x=1769216038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbXKaJ28UXi7TW5JydnHYQgt5Nu+JSM6PpzNbxX5B/o=;
        b=yW2bn0kDtaZ3xZDHDwjMwDor4cda/n6IXaMvE1qlWWOz3su98hyHyDH4XplAOncCte
         p3mjm337ZA+sFo9pWn+/tkrWzYQUHw9lnPBKtqFlRWcY2UPVcJUB7ZJxUvko1kK0IHwT
         wvLCJH9/Uv2MMtvpi/F8zZ83N6LtegklK4529cgU/DXZYy+Zb//+wWy1cMk3npzmTdKk
         pvcGQP3JNU5kYifmOHxSEgLu3PMo/ehuFFSdVJ423yreqfuGjxD7TfCmmYtdYhzy8oKx
         FaB5iA5CoEyUTfImB7FUxei7lfHsxUBv/YzH+AYjirRiCBmicDU6KtH77AMud+bd2aUO
         abkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768611238; x=1769216038;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hbXKaJ28UXi7TW5JydnHYQgt5Nu+JSM6PpzNbxX5B/o=;
        b=X402xy1IoPF+D6w+ltWXoJTPnr/fW7XSaHKC4j8oqW/63Lu6ddo2XHhUr/Ck9zB5AT
         3o/bMyIn8WwujB5A1vN750KIujPul87sNJmBzlO4qv0Zc6v4g6xqdEOFqBQUlIzm1VtA
         OCjD9sL8Xu+cM585isKjd2J+HCdQ7WxgJSrhSFdxreYgpagNgK41DPOD5ou/004j16Lx
         YTui5U8tFq3uKhmZEhFuc32JDNoqNCSDGeSIz2jn5jstoEeXVk/Hi08Yu/aAFkojXUar
         ZBCQOKNF3+nB/5nIawHn+EcThsVijasWaj/UHGVhAodxAAQ3ykRaSlXL4NqXspfBre3l
         +z2w==
X-Forwarded-Encrypted: i=1; AJvYcCXRsUSGIsixMzTmDwAGo2yJg2uYIIF+6Ue2e85arPawD/YRus9QeOp9aBg6AnjUHGE+8QA5/oTuypB9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzl6NbJWK93vt8CTv/TjfSfw26EcopMDDCkDCDe3olWJEqgLKu
	V5iMnDHMiChk6+qx/XNob+H3pWPxJk4pB1aBX84IvuMYjcIhc6UfDDqi9nHezBRwsVjJRUhCuPi
	qxI5sHQ==
X-Received: from pjsi5.prod.google.com ([2002:a17:90a:65c5:b0:34f:6b95:ea39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d647:b0:34c:2db6:57d5
 with SMTP id 98e67ed59e1d1-35272d76fafmr3909741a91.0.1768611238388; Fri, 16
 Jan 2026 16:53:58 -0800 (PST)
Date: Fri, 16 Jan 2026 16:53:57 -0800
In-Reply-To: <20251121005125.417831-12-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com> <20251121005125.417831-12-rick.p.edgecombe@intel.com>
Message-ID: <aWrdpZCCDDAffZRM@google.com>
Subject: Re: [PATCH v4 11/16] KVM: TDX: Add x86 ops for external spt cache
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, chao.gao@intel.com, dave.hansen@intel.com, 
	isaku.yamahata@intel.com, kai.huang@intel.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, pbonzini@redhat.com, tglx@linutronix.de, 
	vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com, 
	xiaoyao.li@intel.com, binbin.wu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025, Rick Edgecombe wrote:
> Move mmu_external_spt_cache behind x86 ops.
>=20
> In the mirror/external MMU concept, the KVM MMU manages a non-active EPT
> tree for private memory (the mirror). The actual active EPT tree the
> private memory is protected inside the TDX module. Whenever the mirror EP=
T
> is changed, it needs to call out into one of a set of x86 opts that
> implement various update operation with TDX specific SEAMCALLs and other
> tricks. These implementations operate on the TDX S-EPT (the external).
>=20
> In reality these external operations are designed narrowly with respect t=
o
> TDX particulars. On the surface, what TDX specific things are happening t=
o
> fulfill these update operations are mostly hidden from the MMU, but there
> is one particular area of interest where some details leak through.
>=20
> The S-EPT needs pages to use for the S-EPT page tables. These page tables
> need to be allocated before taking the mmu lock, like all the rest. So th=
e
> KVM MMU pre-allocates pages for TDX to use for the S-EPT in the same plac=
e
> where it pre-allocates the other page tables. It=E2=80=99s not too bad an=
d fits
> nicely with the others.
>=20
> However, Dynamic PAMT will need even more pages for the same operations.
> Further, these pages will need to be handed to the arch/x86 side which us=
ed
> them for DPAMT updates, which is hard for the existing KVM based cache.
> The details living in core MMU code start to add up.
>=20
> So in preparation to make it more complicated, move the external page
> table cache into TDX code by putting it behind some x86 ops. Have one for
> topping up and one for allocation. Don=E2=80=99t go so far to try to hide=
 the
> existence of external page tables completely from the generic MMU, as the=
y
> are currently stored in their mirror struct kvm_mmu_page and it=E2=80=99s=
 quite
> handy.
>=20
> To plumb the memory cache operations through tdx.c, export some of
> the functions temporarily. This will be removed in future changes.
>=20
> Acked-by: Kiryl Shutsemau <kas@kernel.org>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---

NAK.  I kinda sorta get why you did this?  But the pages KVM uses for page =
tables
are KVM's, not to be mixed with PAMT pages.

Eww.  Definitely a hard "no".  In tdp_mmu_alloc_sp_for_split(), the allocat=
ion
comes from KVM:

	if (mirror) {
		sp->external_spt =3D (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
		if (!sp->external_spt) {
			free_page((unsigned long)sp->spt);
			kmem_cache_free(mmu_page_header_cache, sp);
			return NULL;
		}
	}

But then in kvm_tdp_mmu_map(), via kvm_mmu_alloc_external_spt(), the alloca=
tion
comes from get_tdx_prealloc_page()

  static void *tdx_alloc_external_fault_cache(struct kvm_vcpu *vcpu)
  {
	struct page *page =3D get_tdx_prealloc_page(&to_tdx(vcpu)->prealloc);

	if (WARN_ON_ONCE(!page))
		return (void *)__get_free_page(GFP_ATOMIC | __GFP_ACCOUNT);

	return page_address(page);
  }

But then regardles of where the page came from, KVM frees it.  Seriously.

  static void tdp_mmu_free_sp(struct kvm_mmu_page *sp)
  {
	free_page((unsigned long)sp->external_spt);  <=3D=3D=3D=3D=3D
	free_page((unsigned long)sp->spt);
	kmem_cache_free(mmu_page_header_cache, sp);
  }

Oh, and the hugepage series also fumbles its topup (why there's yet another
topup API, I have no idea).

  static int tdx_topup_vm_split_cache(struct kvm *kvm, enum pg_level level)
  {
	struct kvm_tdx *kvm_tdx =3D to_kvm_tdx(kvm);
	struct tdx_prealloc *prealloc =3D &kvm_tdx->prealloc_split_cache;
	int cnt =3D tdx_min_split_cache_sz(kvm, level);

	while (READ_ONCE(prealloc->cnt) < cnt) {
		struct page *page =3D alloc_page(GFP_KERNEL);  <=3D=3D=3D=3D GFP_KERNEL_A=
CCOUNT

		if (!page)
			return -ENOMEM;

		spin_lock(&kvm_tdx->prealloc_split_cache_lock);
		list_add(&page->lru, &prealloc->page_list);
		prealloc->cnt++;
		spin_unlock(&kvm_tdx->prealloc_split_cache_lock);
	}

	return 0;
  }
