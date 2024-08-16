Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A213C690
	for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723807190; cv=none; b=a5XAu1uiPn7nT06pt27OaOxvEIBeGinvp3TLyJJ+0wkCqLJMWvajR2Luajy4Zg29m718mpBFVPgq6FJc5nlKgQdYKwBlQ6Iz8djTi2Xl2ujd8CdCD4PkZdlj8uKKZp4Jn07p2HYjEyvr8Q1qor98J7LE+7OPVQJsxG1v70TK6uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723807190; c=relaxed/simple;
	bh=0YEKbCgqjCKTnqIvucJPhNpFU/zKUOwOBiiXIpasgTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWcqV2aixi7ZijsxM1TAoOGZemGS8eMgjihwyrfGeN0UjIvKRCta+kVwNkjOvZQvjb5f74WlW6p+HCqTOiA/qG3c/BqjS5qlbHbdpfE5i52SLpSTpJEO8ZUL3YOGzmhP925/q3VjLGQmcBzHBtbmWazCP1+7GenzamTA+UU/g8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fXuubfRt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fXuubfRt"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-371936541caso513457f8f.0
        for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723807187; x=1724411987; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rZ/Girz08IZmHtZsrVU+idIVHnjPppCsG5oXI3Hdtsc=;
        b=fXuubfRtCcSn77J4baoDC0Kmrndkkgnfa2ueezA+QRx4lB0w/7PIBy5VTR5A1paa1I
         3i4/WbVHTd6PQaxC237WYZOZl4aeFJ5QbfoFaX/awV55kKpfQNLyXCp2LJB6zY0z4jT+
         RPTOBmCWFKyG46fWHubla0qjq43ckwqmFGL7paWsGSqM02phToPNs9O9EkU78IpE3Xl1
         SKUgo8ofrGHro+m9pOVpKXnOZIBWfUps2FWXSP0c6jk9TALeeQ9nhAbrcNPvSPG9vw+q
         gr40G1AGTFZkK6ehp+k2bCZzN9Jrb7A9Nh2UqZ3TE+STItXcbfYXIPDRgLqOVZAgEPjO
         pa4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723807187; x=1724411987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZ/Girz08IZmHtZsrVU+idIVHnjPppCsG5oXI3Hdtsc=;
        b=oqQOa+1zkFinYR61Q7FubaWm1Wd6r9l6CQZ5CzBpbGEKvxNVrC/rExd5hhd5Xc6sKZ
         UNlLwPES9fExPNner+sEOopoUxUWrh3sxFDxrw4A16pJMdFwrHCdTnLkDxnO7FPOcU2p
         sRMo9uBqaVVHVxxwQV1eUSPn/Eq/6TCzo827fa/hx/hq/cTVtFR7r36tVU57ypMfTHkB
         9kZ0ue1Hc2dZjJ1+1nct19JtWsQNGUoAB82TVgGsWKtfLrB2x+nuRrAp7x7kLxHXOO/d
         a09u2UNr25/JRC5SmCkRBki9p6FvXkmf0OWx1Fxf+2+h1v6LOxayAwXH7WziZVihM56K
         K1DQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9VbWt0zMGQv2ni8Tl72+DTjs1FtIXGcDMOWQ1GfwM8rFdefc3TUIvJjEzOsXkNFS1N2KrS4EFt+7v@lists.linux.dev
X-Gm-Message-State: AOJu0YxJErbjQYGUK3fOQ3QWfiwln1IthKZeZbJwyE6LRj7rHFdErtKJ
	F3uMWMWjW3j2O2pG2HU8kgntTiD4DH+R5N5gjYx5oMJ+aakWLi3zdKj8kjiMfs7lLy9SJ4bFNmn
	hXvhleDTqKVJRgejstY3Nm7mwT0MQIkeRu0d4
X-Google-Smtp-Source: AGHT+IFjh0jaZHz+bXJLGOwDlxY14HFpbgg6MC9AUdExHwCz1VC6lyjw8E/zebexbyTLHtHDRbeRFor8g+UdLx/zwRY=
X-Received: by 2002:adf:e388:0:b0:368:4e28:47f7 with SMTP id
 ffacd0b85a97d-37194314f7emr1429125f8f.6.1723807186811; Fri, 16 Aug 2024
 04:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com>
 <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com> <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
 <CA+EHjTxNNinn7EzV_o1X1d0kwhEwrbj_O7H8WgDtEy2CwURZFQ@mail.gmail.com> <aa3b5be8-2c8a-4fe8-8676-a40a9886c715@redhat.com>
In-Reply-To: <aa3b5be8-2c8a-4fe8-8676-a40a9886c715@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 16 Aug 2024 12:19:09 +0100
Message-ID: <CA+EHjTz6g_0P+t3wzV99hBtf9rd2Lvn-vwYb2oKZaXxSLs5BzQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
To: David Hildenbrand <david@redhat.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Patrick Roy <roypat@amazon.co.uk>, qperret@google.com, 
	Ackerley Tng <ackerleytng@google.com>, linux-coco@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Aug 2024 at 10:48, David Hildenbrand <david@redhat.com> wrote:
>
> On 15.08.24 09:24, Fuad Tabba wrote:
> > Hi David,
>
> Hi!
>
> >
> > On Tue, 6 Aug 2024 at 14:51, David Hildenbrand <david@redhat.com> wrote:
> >>
> >>>
> >>> -     if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> >>> +     if (!ops->accessible && (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)) {
> >>>                r = guest_memfd_folio_private(folio);
> >>>                if (r)
> >>>                        goto out_err;
> >>> @@ -107,6 +109,82 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(guest_memfd_grab_folio);
> >>>
> >>> +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
> >>> +{
> >>> +     unsigned long gmem_flags = (unsigned long)file->private_data;
> >>> +     unsigned long i;
> >>> +     int r;
> >>> +
> >>> +     unmap_mapping_folio(folio);
> >>> +
> >>> +     /**
> >>> +      * We can't use the refcount. It might be elevated due to
> >>> +      * guest/vcpu trying to access same folio as another vcpu
> >>> +      * or because userspace is trying to access folio for same reason
> >>
> >> As discussed, that's insufficient. We really have to drive the refcount
> >> to 1 -- the single reference we expect.
> >>
> >> What is the exact problem you are running into here? Who can just grab a
> >> reference and maybe do nasty things with it?
> >
> > I was wondering, why do we need to check the refcount? Isn't it enough
> > to check for page_mapped() || page_maybe_dma_pinned(), while holding
> > the folio lock?
>
> (folio_mapped() + folio_maybe_dma_pinned())
>
> Not everything goes trough FOLL_PIN. vmsplice() is an example, or just
> some very simple read/write through /proc/pid/mem. Further, some
> O_DIRECT implementations still don't use FOLL_PIN.
>
> So if you see an additional folio reference, as soon as you mapped that
> thing to user space, you have to assume that it could be someone
> reading/writing that memory in possibly sane context. (vmsplice() should
> be using FOLL_PIN|FOLL_LONGTERM, but that's a longer discussion)
>
> (noting that also folio_maybe_dma_pinned() can have false positives in
> some cases due to speculative references or *many* references).

Thanks for the clarification!
/fuad

> --
> Cheers,
>
> David / dhildenb
>
