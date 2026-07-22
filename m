Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CA63B6C1E
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749232; cv=none; b=pQIFZuqGsa8zGTwc14x1eEM8JGhuHqxns2prknEoKfqEy/X+r7movvEUzOLQuoSToGTYf3ArIIyv6mfRmUd57xTAKlRFkMtO3yUBRVTLHT9zpgtKMsQuxYkcB3glP/tF5pjondbann4jamB1mPuW4AShzO6fdqOv6Hs31Kpm/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749232; c=relaxed/simple;
	bh=nyBkYgKwOn4jVc5C8Fouc1FeTmY3h02EMe0OQ5ytqsI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XuyQ6tRRRVdp95sE0WsJVsKCUovYhdTLU8DX5kqAWBdP/O7TWbGw1rTozZrXEn2Z2Ks9SfuDKNJPAhSCJ7QsCdocmTBlFxPsWkYSqNidAcatBJSw9FYm4+MHB3Z2ri7lWpPGDYFJ7YGOuPmIUHELeJcOhxnAerUqW3ZSvW8n4eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dq47rcDK; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dq47rcDK"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84885a4fcabso10548654b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784749229; x=1785354029; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ptao9s40NBhMm9qoNoLOa2VZyEW6G4SG8hWVVOs/sao=;
        b=dq47rcDK1z/NiL3TPq14vl1pk5eCxGnyPnq4CidLeyvC3QkuZ6ymQk+VsppOnjbCQc
         ROPkvXFTqQiqleROyoK3f4tX1kGqQ/g1bpHl8i+85PNeb6htQHQ4fLqebLW1YFXlA+dY
         EYkf5qpwXebQkIBEdXKsF12xrRDECiMluL9rLQUG6uAPGUGNV/IfcIaqJHrILB4tpkyS
         kaBJ8AtDLD/QFsEmST/XUhrc81nwpN05GfpeKfoZVve8+Kk7UyMRpLGwgQ7eeeBFaDt+
         yW3vCZY0VRnXRsbTL90ZphhDzoumkG3jw51hcjPLo7Fcd3VRl7MyKQktdsWhvxdk0rdT
         kVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749229; x=1785354029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ptao9s40NBhMm9qoNoLOa2VZyEW6G4SG8hWVVOs/sao=;
        b=m6rVqxCatOT5HdZLsTkLKhxicu1n7rNZtx/iTtIUs0VhXtnKcuDloUySsZQXoHs3c+
         g1iyhtHSpwD/wywtruOUNKEEeOPntlyNLD7RlglnAE7gol0weefwTRDssDBWTONvYb9l
         jUfaNcAebx6NCYjfiGd90+ZliCiTUg7iZUKssSkcyXSXDpNyuq0srKJfbGNWTE0+RknQ
         ANEH5fIgEoQLHk5NWmccMFnioIqrhLMPsHb3QA15jocwVDt9McyxTLVOOFEmA8Qx916F
         NwjlYnIrwghjx/ag6QOpAwRBniTWTTkQRFgnK5vxm6U2yEID4DFUUpiEDA2jHb0Dem/n
         eZnA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+o9fMRTSnV3Auum0UJ5WgjMt75T3wy8Tu0+HBaDSLVjjTyadI5wJew7T97n9xJFNZ9IXE2K/gVhtQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyFTt6eDZo3Sqd3ZUPdVEVz4fS2zkG6XJzoEM5Nny9KsCbA4PTo
	hd0To5nfYFBT4pQN6h7Ums+KY5ZE8Wj5u36e9QNUE14FeBha/vMcmSbKD7j6ZOcE1UlEPz8cGYP
	MOLDTWA==
X-Received: from pfbhj6.prod.google.com ([2002:a05:6a00:8706:b0:847:840c:ba17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:299a:b0:845:c6fc:2821
 with SMTP id d2e1a72fcca58-84e2b8a6521mr317062b3a.22.1784749228959; Wed, 22
 Jul 2026 12:40:28 -0700 (PDT)
Date: Wed, 22 Jul 2026 12:40:28 -0700
In-Reply-To: <20260718014500.2231262-7-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com> <20260718014500.2231262-7-rick.p.edgecombe@intel.com>
Message-ID: <amEcrPzZELfQ4jU9@google.com>
Subject: Re: [PATCH v7 06/11] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 17, 2026, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Use control page helpers for allocating and freeing TD control structures,
> such that these operations can work for Dynamic PAMT.
> 
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically. So the kernel must ensure PAMT backing is installed
> for any 4KB page being gifted to the TDX module, and must tear down the
> backing when all associated gifted pages are reclaimed.
> 
> TD scoped control pages (TDR, TDCS) and vCPU scoped control pages (TDVPR,
> TDCX) are all handed to the TDX module at 4KB page size and are therefore
> subject to this requirement. Replace the raw alloc_page()/__free_page()
> calls for these pages with tdx_alloc/free_control_page().
> 
> Switching between special Dynamic PAMT operations or normal page
> alloc/free operations is handled internally in
> tdx_alloc/free_control_page(). So don't check for Dynamic PAMT around these
> calls. Just call them unconditionally. Similarly, drop the NULL checks
> before freeing, as tdx_free_control_page() handles NULL internally.
> 
> No functional change intended when Dynamic PAMT is not in use.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [sean: handle alloc+free+reclaim in one patch]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>
