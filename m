Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4659F3A4505
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946655; cv=pass; b=nxrlPsxsmxa4oPLnrzODmED7Qn7B+IvKcgPjwy3x3TS+jXqHJZjDCc3lgcR3NqNS9BdpgFQX1bl068v4JRqhvoIKKp3oQmzEOkYtkO0o+DiPkt+ZhaQ9aBgGagoSBeBQnf/xYgGQEvXe3uNVPitYA/rSwaHagAG34VNr7GTzL7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946655; c=relaxed/simple;
	bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8IL97TL2RLsapXhYwUPFJ+M1jEO6enjMQ+gA2oX53k5Ksu3QmI7ZjG9q4vLZBy2aeL29F1/qkaUCsXB3dKtNCxbnSF9yQ6/0l0aFcPr8/h3pxpvNCUZ0SyJQqopViVghTYDHUgx1PgaFrWTRGNjShI/IaQocfPAHfeVa7F14RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L/X5F4fO; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L/X5F4fO"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52faa58bff5so45821cf.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 12:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787946652; cv=none;
        d=google.com; s=arc-20260327;
        b=CokwijsZoAuXXG0q8poVi3QzRM52/eNZ/HouDzPVoFIajqA8o8H8PFXJccJH4eI2D7
         hWpoD83QXuG7OzJ10qTNb5RXCbCguBcPBpPejCkOcD5Z2FN498MB3AOr0VkWunaU/4+1
         SfOovaUf/SIhuWTSiLnodGzK5uIL6bKMYG6goUdM4E093C2hSmK/vZ+NLIU/Q8qRQaGu
         Mh9PjQ76PDIIKf5rwdkpJFLuPh8j4CcG44U2J9spvwDVEpAbaBI8gh/v9CVHiKnTrcWE
         mWs/9IJt+ubeLwJ+J5e3Trjbw6bhU7cv/mcSsgCWtIARkmWMjPwJ3CcyGkp+3clApJcE
         DyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        fh=JqQBXfx1wBrpxmGf9ETK80CpORJjWX6gOeuSoOXFUjs=;
        b=IFArntSe62nX7haNlfQ5hxhMUsxvnxippgMFqyF8sIZOYlxxT52+ydqnEk8LxWLQA/
         /xTlkIyEKGeWEhH6leraCBp6bpSPierisJdlJht1yaUp4Lc+MNpw0gXd5QCoDPPZiBWB
         Ln3MDfCkcLpEBfFLo9o80pQYHADTGzPnwZmqb6A0iBTR2pRhsdmB2UnloOMT6e0w7pvi
         WIC4KCrIPoJWrJpabJQJnkQqgUgTGimuUxUOWmlTgexsCTCqv5ykHOEIn5S7zI3wjsXT
         Twz8n9NJkbSfgpIutUcgtWFk8qtMUABBJuo5RBJRGWuQ+YWNpdJNazcTZ/6Sp6+VXyBc
         fPUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787946652; x=1788551452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        b=L/X5F4fOBxWXPmTX8Eeu0ynbXecL0XvlSVe4yeD0cOHFKk6G2toaU7k5/2F+OvPL+7
         axRZjceG6tvqDtDFfXuMckeN2Gts7qHU3rejLtw13lk6eekvIQIb0YL5R7mYr0Aow1lG
         ApKSoV8wj5eNSBQQ3OUpck9Gfke8Viy7L5+TlGpWsPUjmlL98gtjSJ1zgKycaUGmSpwQ
         la3zwu7FYsgFgy+XHo4Il0fR+GI9eW8vgYDZWmeClen3RpJsqKbg6PPXGsJY5vAW9qOd
         hd7NFg6V6rnh0OdVr5k5Oj+ga8BXFYeddFniSVAdKDw+VlgMusJSzaW1dytnD5nkpsE4
         WCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787946652; x=1788551452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        b=AaqfUOzfjGvbuKO7RboxtPGOhEzxm9sm8KCJpQJyUm94qi9FUBJ18XqLYBVVxXbv7E
         k2E9pdwt8bcDvhalYM45WXJaZt4AMReMepKzhQG6+E/N3X9HKt1A75p1QXbh2/GeP8Le
         rLo4IQP0q08ntUKdK/zdOfJ6X6CBVs33zPJKIbRqRup7jsULA0+gs9MROVIFNRUcq0u9
         y1YdZEROi+BJ8/NdOSxY67WLOkrgZjd/Kksp00HPC4K+2MTfSm0R4F0z+qpmi0gi7eiZ
         gYYGmBSWIa4adg98zAP+huLsS977tM9Tnd/svyfqkLF7t037yW3cLgLBCgf9h05hy/5N
         +xSA==
X-Forwarded-Encrypted: i=1; AHgh+Rond4TGns/PP0RLjwODvHuj/vUNGE+ZdnGKEHY66RgXK5KFTG4eWIxlfQcFwy8ZlaVIkf/XIgr/PcVi@lists.linux.dev
X-Gm-Message-State: AFuF++nnyRwE/k+DMPRhza+9y6fE/g2GI+c9D1YRyuZ4E94MK519e4+W
	+KMG4Q5h840VvHs7VBgLDMDqXIYAxedf1agfVshZjAyF4mX6QhXBhAJ12xmeoSBqFIN4lAqCiZ+
	Ik4HbCaTf6pn0jXQnoGkjj8KQXiXiCGHtR5qSO3kt
X-Gm-Gg: AR+sD125y8hvxdnyzyQuHWTO8qv8gKwlwwaO8yW48ZCZCUN3qselvLGl4t1q4ZC4f11
	of1grJu/ZXg+CQPIW5AJkRsicUBBpepO+NxpD8uVWHNgPcTTdXZEOaNcCTdp1Y47ywzWrxWNpvg
	gMnaykxOZa0Y13sDkACVTl1DX5+Of9mStKek5BLvlpZihLTTlAOjTWwGyaLY8wXZPWxPHR7o7Ka
	iXhJXs5YqtP2MVIpmDwB6alpNaQltzWO3dOFZ2n7sMQcfoaeKSUxZZKA//29TWRybJmpS98WpDG
	LgSpjP2X4NeYjAFgIBIZzjA1cGGaGcKAxy3zAkh9Wgl/CeAHZlcCBBDPEgh2GZ8TTPHqGVdIsYE
	=
X-Received: by 2002:ac8:7f51:0:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-52ff715f969mr2184691cf.7.1787946651120; Fri, 28 Aug 2026
 12:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-4-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-4-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:50:40 -0700
X-Gm-Features: AcwNN1UGA8VSxLqG_WtYxcyIroEJNe3FATQouEdY6s-KcMOngGCRN2JEgv1FXj0
Message-ID: <CAGtprH9ERb_fFG-4JYR1Bjxyyvnk3Ys4q=9ioQz0Cq6QCXtVBw@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] x86/virt/tdx: Add tdx_alloc/free_control_page() helpers
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> Add helpers to use when allocating or preparing pages that are handed to
> the TDX module for use as control/S-EPT pages, and thus need Dynamic PAMT
> adjustments.
>
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically.
>
> KVM will need to hand pages to the TDX module that it will use at 4KB
> granularity. So these pages will need Dynamic PAMT backing added before
> they are used by the TDX module, and removed afterwards.
>
> Add tdx_alloc_control_page() and tdx_free_control_page() to handle both
> page allocation and Dynamic PAMT installation. Make them behave like
> normal alloc/free functions where allocation can fail in the case of no
> memory, but free (with any necessary Dynamic PAMT release) always
> succeeds. Do this so they can support the existing TDX flows that require
> teardowns to succeed.
>
> Also create tdx_pamt_get/put() to handle installing Dynamic PAMT 4KB
> backing for pages that are already allocated (such as KVM's use of S-EPT
> page tables or guest private memory). Have them take a pfn instead of a
> struct page, as future changes will want to use these helpers for guest
> pages which are tracked by PFN.
>
> Don't CLFLUSH the Dynamic PAMT pages handed to the TDX module, as is done
> for some other SEAMCALLs, as the TDX docs specify that this is only
> needed on "TD private memory or TD control structure page".
>
> Since these allocations will be easily user triggerable, account the
> memory.
>
> Only one pair of Dynamic PAMT pages is required for each 2MB-aligned
> physical region, so multiple callers could trip over each other if they
> try to manage the shared backing for two separate 4KB pages contained in
> one. To build the logic up iteratively, don't do anything to handle pages
> from the same 2MB region yet. Functionality to handle this will be added
> before Dynamic PAMT can be enabled.
>
> AI was used under supervision to collect/apply feedback, split patches,
> review code and workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com> for the
SEAMCALLs and the get/put helpers, assuming your are still thinking to
shift things a bit between the current and the next patch.
