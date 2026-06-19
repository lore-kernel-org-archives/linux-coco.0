Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AEC370AE6
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863843; cv=pass; b=O0c6D38qyFhmj+WKen2/Y15VIuKtCn+3WCX3gosUItC1S9+31eAbdJqUCG3g0iLFz1tX9kjQaDQ6avJAV6v9M/NFSir9fwBw4gaCluBBOuY/3LgFa1K1D+UwhhPUyFb5GCR+Vh3Q1sydQIfms4CHuw1tUl/ocWmR5IS7WVe1cKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863843; c=relaxed/simple;
	bh=BV+WJdPUZX7SWJL6VMcYgh6IoDynAjqVpnJR9RDV5JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvO6RcISa8AuTl7qWKZwNz+inga9z7qSqCyTIVDDnaRDfBtwPjoSlwW4vm4nKDMJ6AhaFbk9nitjvrnNZpaR3bYIULa+TEPAhcQvyrmFxYVG37wAvLVXy70u1GC0eqhsJKalyRn6N0x7Yw8ekEjkTTKdp+FUk1xEonOwxU2J6tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OEbk5Sga; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OEbk5Sga"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51765531803so224341cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 03:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781863838; cv=none;
        d=google.com; s=arc-20260327;
        b=sc3XqaucSpaLbACZZStRyYLV3YfZzbFo+S30sP9nzWAvu2+vWLNBoYza7/cHOnwaYk
         5ZUOJpYWsNqIr5jnUhBagNU5wH+ZXbji4VELP919uQoc67/pVOk20SCd3l4QYFDTw7D5
         VBZ1Va+R2BAJreo3ltXQMJvRN9Ssh9PuBD2mWbSWAE6VJmJb+smlScUqF5sJRlO2GT3B
         yJd6qMgFLcgUJTsd7OkgkEpyDWof2lLqwZ7lUDdxgVcuqStEhd7w2UTelZirNWfir8gE
         aFdOPzt9cNqnMzZKX3i+nNXe2DBt/87W6wAslRnq/GICA/DI/1TKP7Ef1U6D0kfskz5W
         2MhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        fh=MILmgCF4RWIGrBkplpf8Jh82SOwHfvL8x0xHzJ5YjFg=;
        b=cVKX9HRvqLwVvgYy5Y2DZbYiyfBlSXR4lIyhgUHvB+ylN7VgmnadNjxHYeupu/SFsh
         z/+zkohxiZXltgrRVrxET0QbXTwxKW6rJHCcRezg7kl0rY150lPc2p+yXANmrKYSH+i3
         HEIHFcamdBQDa6GA3XiBmmbR2Nu55A9qNAINj41R3chUIFbBl94LhN4Qbz6a9hzJVySp
         9Q06C3cana/iCBMV/lT9QiXxlyT0VLn1Dac9Ok9fdAsYB1we620xACSeZE4HgE7NUUrx
         zbj/Ea9t5AhJEpnHflbNdLFfhqDC5zEFSi8slDH2UNw0AzM/J8OLaPEZqDMzswlrIEdW
         0BCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781863838; x=1782468638; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        b=OEbk5SgaEoZDbNeGgmfLJXhGVwI0e4LwKS8GpxGE7V+Plfft6AmrnJEUZWx5jUFoqp
         aloP3fWtK//e9nk/Xww48rQcbLQgE4Suumh8zdw9VtCL+GxI/ZtCEDvuL6HbEYiQBnod
         uPpoa6fQCjydr7Y2j0FL20TXLFYSz/m73rdB5RU1I3iCkyXtxieY/42k4jBuULRCZe2i
         7ybs9xxEsFLR3X+bH2UB3eqGJxlV3fl3gQGx3XO1NdqFJ6DvQ3oVvGfk6CUwBv5NVb/J
         oEF1fRNMpUCbL33vNBQnFdxdnC6Ii2HeP2MDpS0jc76UXcvkT+lEWnzEszK6FLdTurAd
         DKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863838; x=1782468638;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        b=DvMoU4z1PClvWfE8vDSwLP47CuDi6mZHddzrVt1rjNPr8eIhuf8kfREOc/K25v+TqS
         xqARYT950+s8XUtGOBBzCh24escD8cBUMVnpmAld0J97kjlFNSeexHu2nwuF2XyXTh+1
         unisXSbjhZFDMX8ia52MwdXBzUhn8NVbuhLaKxQMtsBCcYucg4K4HiGcW2Q2ZueLJ+gH
         BQ2qdS+ncl8BENw/8bT29VtTP9SBT5fSUcAHhsEhngXhDEF69dFdgwnM5utgI3oWJ6g2
         HI84qKcGQ6fZC7myU4v40igL3ZQ0QUFQ+T3T7b5XhfzhdhO/QaCYaLXAYAxgGE0278yE
         sw5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Dad82EIg12CjgX1aX3WUKwNMsx0AMVIMtbMsid0LFcUWdZOOL5Qr6vr5If7tC7/802XE3r8UI7y/u@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0od0BwGq2Lfvphd1wZ2ghsQx/3Qoa/smHcAx7XKji6blevvtX
	i3TKF6HdEcUyfhQF2V0Wk4EEk/oYEYQXuE7f4LJ+CaUbnVyKaAEqh30ZonOEn8ukIfS58Ad5qEz
	KQTdjVVrXS+hxSRUGtSVCjN3SgMMo95IR/fHygdBt
X-Gm-Gg: AfdE7ckQtjGRYUqHE/SBcLpTEFuknz2V1U35NbetGCXluE6jYGgHN+GyBmv+/AxTFc8
	DDBm+qLeasMxgLajhd1cUtaBeuN/5GlUwOjghypvFDCygUQOOfSumwQpEAtyXJ+FcOHopv4340y
	QIBMnWE1lzriKRaP0MjlscoC+tuouwAUXYZB7NQGLrqoP/BvjD7xadX18H2g8x7gGh8g1WXm0Ah
	DTSf0drXpdx0yJEzoTr7Zuk+JjJYckAChM1X6IchL5P+SdPyzo9uiFNC2i57QVFpDty8bq61A==
X-Received: by 2002:a05:622a:353:b0:517:99ea:ab79 with SMTP id
 d75a77b69052e-519e8e7516bmr5933751cf.25.1781863836675; Fri, 19 Jun 2026
 03:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-15-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-15-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:09:59 +0100
X-Gm-Features: AVVi8Ce16E31U-w4-XubBsflwMOtK_nv4nwaxzfJhxldigbujwW2ZBTzRORImb0
Message-ID: <CA+EHjTx+3U++dnhGEkwh2SO82xMugAvvJ9ee1O__sxZCKL_X5A@mail.gmail.com>
Subject: Re: [PATCH v8 15/46] KVM: guest_memfd: Call arch invalidate hooks on conversion
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When memory in guest_memfd is converted from private to shared, the
> platform-specific state associated with the guest-private pages must be
> invalidated or cleaned up.
>
> Iterate over the folios in the affected range and call the
> kvm_arch_gmem_invalidate() hook for each PFN range. This allows
> architectures to perform necessary teardown, such as updating hardware
> metadata or encryption states, before the pages are transitioned to the
> shared state.
>
> Invoke this helper after indicating to KVM's mmu code that an invalidation
> is in progress to stop in-flight page faults from succeeding.
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Coming back to this after working through the arm64/pKVM side. My
Reviewed-by here is from the previous round and the patch hasn't
changed, but I missed an implication for arm64.

kvm_arch_gmem_invalidate() is now called from two paths with the same
(start, end) signature: folio teardown (kvm_gmem_free_folio) and
private->shared conversion (here). For SNP/TDX that's fine, conversion is
destructive anyway. For pKVM the two need opposite content semantics:
conversion must preserve the page in place (same physical page, the point
of in-place conversion without encryption), while teardown must scrub it
before returning it to the host.

The hook gets only a pfn range with no indication of which caller it's
serving, so arm64 can't give the two paths the behaviour they need. It
would help to signal intent on the conversion path: a reason/flag, a
separate hook, or not routing non-destructive conversion through the
teardown hook.

arm64 isn't here yet, so this isn't urgent, but the hook is gaining a
second caller now, and it's cheaper to leave room for the distinction
than to change a generic contract other arches depend on later.

Cheers,
/fuad


> ---
>  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 433f79047b9d1..3c94442bc8131 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -607,6 +607,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         return safe;
>  }
>
> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
> +{
> +       struct folio_batch fbatch;
> +       pgoff_t next = start;
> +       int i;
> +
> +       folio_batch_init(&fbatch);
> +       while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> +                       struct folio *folio = fbatch.folios[i];
> +                       pgoff_t start_index, end_index;
> +                       kvm_pfn_t start_pfn, end_pfn;
> +
> +                       start_index = max(start, folio->index);
> +                       end_index = min(end, folio_next_index(folio));
> +                       /*
> +                        * end_index is either in folio or points to
> +                        * the first page of the next folio. Hence,
> +                        * all pages in range [start_index, end_index)
> +                        * are contiguous.
> +                        */
> +                       start_pfn = folio_file_pfn(folio, start_index);
> +                       end_pfn = start_pfn + end_index - start_index;
> +
> +                       kvm_arch_gmem_invalidate(start_pfn, end_pfn);
> +               }
> +
> +               folio_batch_release(&fbatch);
> +               cond_resched();
> +       }
> +}
> +#else
> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
> +#endif
> +
>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>                                      size_t nr_pages, uint64_t attrs,
>                                      pgoff_t *err_index)
> @@ -647,7 +683,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>          */
>
>         kvm_gmem_invalidate_start(inode, start, end);
> +
> +       if (!to_private)
> +               kvm_gmem_invalidate(inode, start, end);
> +
>         mas_store_prealloc(&mas, xa_mk_value(attrs));
> +
>         kvm_gmem_invalidate_end(inode, start, end);
>  out:
>         filemap_invalidate_unlock(mapping);
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
