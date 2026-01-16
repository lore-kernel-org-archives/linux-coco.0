Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4A2741DF
	for <linux-coco@lists.linux.dev>; Fri, 16 Jan 2026 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605445; cv=none; b=Q6aM646B8PKVHY9GLwCcrsrQY0cMkhO9FKMAPrlFCpbmpvO0AAe/8l6aqUS+GxXHFuPq73NgQwABsa3khbBffXb9jblYMrQLokfO3/gNigasJTfhyggRFtdM+G0uTohmqDjzHTVJpgXNoUMmUK8hP9XENbh0eOLurEEkruQSO5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605445; c=relaxed/simple;
	bh=0qBlSbA0ChMdm/HuzI/7dU5XuaBntDrkKil/SdBVDFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qgMYoW16VIMidQAJM7PNUvvN69qbTZwSvsERqQrCc4coj5h0NBVa02Uufe/yDjK/OYz8osnMemYBHHeRqWGBzWdFZFmgnkuxcM9JAYRRpXs8Qy9QMeanXK1TlZbBpmqDqe8ID2HTz0XsDRhJepDhSKztZwC8RhxLsLAF/JRygxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MUMYEmTy; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MUMYEmTy"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso4444505a91.0
        for <linux-coco@lists.linux.dev>; Fri, 16 Jan 2026 15:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768605443; x=1769210243; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+UrL0diRZnQcyuy4C6t9WTvNDG8qIGeRluOfajJMlJk=;
        b=MUMYEmTyNaYJk7JT4TQPho8IOSRLwc26mFR2xFGtJhF225waXMiMm5dIYbgQE7zG2r
         Mku5OvOxnceLvD1IEsXtukH9JK6SayKJ3FkY068EAzvKNRcoS8p8ksj9utByMe4vbVDs
         dBtX5IAMYg3NyROPSsw/C8ccJSQS3RKZC2JAhoGEZQpp+EKnk6IlLch5l80o77qqo/ux
         npzqoYqEcsdKLK4CXsNi6bOCu9svEGKIOj7vSI8WFA3oq2kK/bfBFObOjTl0FsDiFXAF
         qlQUTWrVNKVd8mtoEVyzBh9NS8swem5jqb0FaQwoaXy655+psG8LMcPPurmmQR8daU4+
         5HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605443; x=1769210243;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UrL0diRZnQcyuy4C6t9WTvNDG8qIGeRluOfajJMlJk=;
        b=cpRgP/b/hnUGqMgiohz8DPEahrOXYL/HI7THAx3mFhJLtlhgs3ZOx90o1YEikww1/8
         wuauedKuXSoVyssEOSpilSCxw+3PY8PZwdu9pY/trqMBoX26fyhapb7XQ+rw5B5euCNA
         oFX8uRBjM9Zsypk/+xO1TP94FlRkH7qH4Ww3iq2f5wNXhakfA6waPzZbK5rlszYcpbGl
         WkT5A8orxr0q83KvndX8Wzjr5Xn4Dwk5SeC2QatVuUpP4CXs8ghvzqXCn0ZgD0FSNMi+
         RLg4+Obatm7Ayd2mcZ7vTb5HrCNVpkD/B14dDR0Zdu3dH+cmInttCSqfjiHcLGpdaS/o
         Jnaw==
X-Forwarded-Encrypted: i=1; AJvYcCVXQQhqHGTLCbLxVLFHI1wI3uWCAqQEO4HxBBBBn+QGlOhB0KX3woozl9aXWdvq6lCQ4JAPEvxls5oe@lists.linux.dev
X-Gm-Message-State: AOJu0YxjRqfXWh7X5uwmSWnLQv6qGdERgEc6lq/y3hRzaycsO8NRxNEH
	oY70Xwa2sTGf+swkmzskyD9YAt//cEe9VdbGy3cWaYITewsVoBUjxO5llF4Cr2LPJvBTLHfhm0a
	jqsMMMg==
X-Received: from pjqt4.prod.google.com ([2002:a17:90a:ae04:b0:34c:a015:9cb3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfcc:b0:340:ca7d:936a
 with SMTP id 98e67ed59e1d1-352732547e9mr3833971a91.18.1768605443403; Fri, 16
 Jan 2026 15:17:23 -0800 (PST)
Date: Fri, 16 Jan 2026 15:17:21 -0800
In-Reply-To: <20251121005125.417831-8-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com> <20251121005125.417831-8-rick.p.edgecombe@intel.com>
Message-ID: <aWrHAeMcjDpVnTBp@google.com>
Subject: Re: [PATCH v4 07/16] x86/virt/tdx: Add tdx_alloc/free_page() helpers
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, chao.gao@intel.com, dave.hansen@intel.com, 
	isaku.yamahata@intel.com, kai.huang@intel.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, pbonzini@redhat.com, tglx@linutronix.de, 
	vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com, 
	xiaoyao.li@intel.com, binbin.wu@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 20, 2025, Rick Edgecombe wrote:
> +/*
> + * Return a page that can be used as TDX private memory
> + * and obtain TDX protections.

Wrap at ~80.

This comment is also misleading, arguably wrong.  Because from KVM's perspective,
these APIs are _never_ used to back TDX private memory.  They are used only for
control pages, which yeah, I suppose might be encrypted with the guest's private
key, but most readers will interpret "used as TDX private memory" to mean that
these are _the_ source of pages for guest private memory.

> + */
> +struct page *tdx_alloc_page(void)

And in a similar vein, given terminology in other places, maybe call these
tdx_{alloc,free}_control_page()?

> +{
> +	struct page *page;
> +
> +	page = alloc_page(GFP_KERNEL);

GFP_KERNEL_ACCOUNT, all of these allocations are tied to a VM.

> +	if (!page)
> +		return NULL;
> +
> +	if (tdx_pamt_get(page)) {
> +		__free_page(page);
> +		return NULL;
> +	}
> +
> +	return page;
> +}
> +EXPORT_SYMBOL_GPL(tdx_alloc_page);

Note, these can all now be EXPORT_SYMBOL_FOR_KVM.
