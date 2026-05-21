Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B6A3822A6
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347648; cv=pass; b=Cxgle8W/fFPjndCKE1lov+/DpW3hxhq5aL1GrhAo8UPCZcbvff0+Ab6iOdwEuYVqRuXPQ6L8K4AKo5jKl+qrjHZRPz63P7yUXSVIRel2G0zO8hvkr3g/oF3ANkIX6ws9bk1/a9RjyGX0MQNxMI84WiCynpGigonAWzyNBWPOS+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347648; c=relaxed/simple;
	bh=FwszKxRTkU5t0/z62X07EaM8UOUdI3Szs5D9p5DC8sA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHVIRzEwJN6CUVey6GVoeUlpvirk3VzyjQvrriR2C8K22TyyUFR6OG7hsemX5lVyMIJh2ZndZbWvvb9FlLqqlUzTFFF29SmCZ9AR9DZw+sqi926lXN4wIlLDsoXf5h3RaHMOiqL0qlgMJxqhrWBY1FaML/k17PGhbPrbnBtYSwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JTaWrRLu; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JTaWrRLu"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50e61648f10so15271cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 00:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779347646; cv=none;
        d=google.com; s=arc-20240605;
        b=ISHA9a5ofzMLqEvdU7vrsa46N22ne7y0uNO6HYKsJHEqqN2N5RSJdNxUcQs5wENyfq
         0mZ1CNd4QrKWLDEl+E2BJjIZq104gXiKrlBQWQJ09oQHLdTcUY6+ei/aUAOwwyVF7Ae2
         JrMZlTN9VWzIkMFtULjqqV2BAzBJ8WwOlMXCZgyfZRtmYq65Ge+a0baLU9MGozZ9FZ6/
         KPDw356utbwRmhId0Ft2Z1imPpYWXt9QzeF1MpCp8ZBL+GPpPdoFaEOohZx7oJD2s7M1
         +ixHbgcGlBTbDcLpagcNTaH6SpLH/4EuRCHzfwRfZl2jLFH57Dw5SNGqtvGyslKMTfK0
         4JLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        fh=e8etpvZg8LrKXRMrj4B5oC5CjdhSyfYfJAV5bmstFX4=;
        b=HnsPKzVQ31KWqHg4Smxnhk9/rNiItJEBGi0o7xYpfmps+OZaErzRR75miIT1MrmG1T
         W1nv+U+SX4HxO2p9Of21ID4UgnktQ49o9zN6T09B51v2aK2jSplCDG9t+AJy8rYYlbGF
         DsL/Mprrq4ZNkUTSOCzv1SIOfBDMdquvW9ndjZH82qsuUs/svNNjh5Nuh1MeXL6558yP
         lwnVhWyyWmXT2mAFPnGl8Z3BRugI8Gn0F8cDHXRh8tJ72UqhFEcU42V/2+/NKByJ3Jbs
         EmxY1zRbykUw+3/oEG2ddSr9urAruo4HoJhnSAkkCvuY+iyApmxLYuAGAGCRygM435yT
         A9Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779347646; x=1779952446; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        b=JTaWrRLuVrA15pYFU/mcGy8saL7iaJI27/h3VfcXqYAUvP12hr7YGnmKfH9pzgG7Tb
         Ao3/Y/ZGh/0ikhU8oflgGFoFTU+W4QPKOkU5BC2hPuBykUuGWVmpYT31Ok2lmmhvNMWB
         VbFp9EXsVhPgj5NdZCB4pE0FEG37PhAA1DT9q7f5liWisrqRz+hePacabos46MT3mAMO
         dH0rYXLAw8P7C/ufkuFOlMWfUaa4Bo3U+Wv9jbVPoynbOTYogVlgig+eqDgrim2BVpNG
         PgoFF6M5WjuXpHnlX+NqmpJt8g62FxtsAS2UZFGKakiCaLICPBU+Vxu9amYkj3koGtZ6
         w0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347646; x=1779952446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        b=dxwig3XTPO2NQ3xJ6+Fispsp5/f07ho4Wz4HgSjXTj4qb6V6Vut5F6c0zqy+fiPkWc
         rVHOQzyMpXsaGhhXE8WjZdmeqvfnnFCjn0IG14VPoNx0/rQ0UBATlrjMqCrpXuiHQ88C
         IEgVl/q9yWgAtJ+uTG1uG2pEZ6xfL6EQ7UJtyerBBV2qV6v9kd2MEQMNgs/TmpKPkPhj
         9G1kT8spp4UbvVwDb7MSjd9s6E3N++n6XVPAS/F/D3lONoziwyWQgAMn41ERK/mLKrEk
         rH/VA0ogUJ+dYf6ckAdDzhRNMF8hRsLYT3jNAp1NXzY96VIZn5hrchz7Oad38O76+aJL
         KgpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YIRmFqm5r6zUZQge631dYtTjAkyjUlqYC6u/SNbX7YCRVJ1fvu6qniON4aoEsHNYKEvEsGwmXsGVT@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+HQzzE6ejHji/D73VljuicpcOCVX3ceQPrqtlBe6oLqjDB7Hs
	+4LCm3IVPqacyEPLSsZxhUd+IhEExKZb4AZveiyDD0NR1+jyZyJ6flsHg6JLWY0pDam0vGJN/sE
	CXqf50cBczyuFcs1spQDBR2xKzBINGjCKR01QAKFy
X-Gm-Gg: Acq92OH865ipGVX3lwxzfB0LtFsV/2Kyw3XsHCSWdRiRzWTL0rz3Yzkk1seVhK56sY1
	jbZKD/hfe8hi/XTm5CjzVMDfHQQ4MAdnSo88aN//Ron9Y0+kibURHbALE+jY29yTupBFYUWN7N0
	oU1KDIlNIvIwFIIBk2dEcRTFtDhddvDOi8ppRcLPAddDlGRoUyOxJvuqC4U2hSaJ90Ndvr+jw/F
	J33PZud5g1PUjaahPPsfe7DXCsRRvOgimI4OZdbsLGfVoErWCRCi6tKkmrNS754xQOGlFIUd/6/
	+hwfXUdr3gX/F28ngs2qiGF5s6x/Rg==
X-Received: by 2002:a05:622a:9d8:20b0:516:4f62:85ea with SMTP id
 d75a77b69052e-516c553b726mr5238111cf.21.1779347645271; Thu, 21 May 2026
 00:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-15-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-15-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:13:28 +0100
X-Gm-Features: AVHnY4I5mlImmNgj6VU9Np6tF4MeIY8QXPe0q5_43DkzSppchE88oaKE6aKRKpA
Message-ID: <CA+EHjTyZx88qAjKc=W1GOTMLdDFpTjuJkAPJ3W6Snnyn3ta8tg@mail.gmail.com>
Subject: Re: [PATCH v6 15/43] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When checking if a guest_memfd folio is safe for conversion, its refcount
> is examined. A folio may be present in a per-CPU lru_add fbatch, which
> temporarily increases its refcount. This can lead to a false positive,
> incorrectly indicating that the folio is in use and preventing the
> conversion, even if it is otherwise safe. The conversion process might not
> be on the same CPU that holds the folio in its fbatch, making a simple
> per-CPU check insufficient.
>
> To address this, drain all CPUs' lru_add fbatches if an unexpectedly high
> refcount is encountered during the safety check. This is performed at most
> once per conversion request. Draining only if the folio in question may be
> lru cached.
>
> guest_memfd folios are unevictable, so they can only reside in the lru_add
> fbatch. If the folio's refcount is still unsafe after draining, then the
> conversion is truly deemed unsafe.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Not an area I've worked with that much, but it seems right to me:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  mm/swap.c              |  2 ++
>  virt/kvm/guest_memfd.c | 18 ++++++++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/mm/swap.c b/mm/swap.c
> index 5cc44f0de9877..3134d9d3d7c30 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -37,6 +37,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
> +#include <linux/kvm_types.h>
>
>  #include "internal.h"
>
> @@ -904,6 +905,7 @@ void lru_add_drain_all(void)
>         lru_add_drain();
>  }
>  #endif /* CONFIG_SMP */
> +EXPORT_SYMBOL_FOR_KVM(lru_add_drain_all);
>
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 034b72b4947fb..050a8c092b1a3 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -8,6 +8,7 @@
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> +#include <linux/swap.h>
>
>  #include "kvm_mm.h"
>
> @@ -596,18 +597,27 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         const int filemap_get_folios_refcount = 1;
>         pgoff_t last = start + nr_pages - 1;
>         struct folio_batch fbatch;
> +       bool lru_drained = false;
>         bool safe = true;
>         int i;
>
>         folio_batch_init(&fbatch);
>         while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {
>
> -               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> +               for (i = 0; i < folio_batch_count(&fbatch);) {
>                         struct folio *folio = fbatch.folios[i];
>
> -                       if (folio_ref_count(folio) !=
> -                           folio_nr_pages(folio) + filemap_get_folios_refcount) {
> -                               safe = false;
> +                       safe = (folio_ref_count(folio) ==
> +                               folio_nr_pages(folio) +
> +                               filemap_get_folios_refcount);
> +
> +                       if (safe) {
> +                               ++i;
> +                       } else if (folio_may_be_lru_cached(folio) &&
> +                                  !lru_drained) {
> +                               lru_add_drain_all();
> +                               lru_drained = true;
> +                       } else {
>                                 *err_index = folio->index;
>                                 break;
>                         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
