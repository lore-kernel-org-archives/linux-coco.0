Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE15A3EA972
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287493; cv=pass; b=cxcC6umxkY66e/gGbje6+pR++7u7YcGSk4qF8RPEPkCG2qDxMe4Ya93YvcOve+TyRr6eEjmqeGu8e+n1DH20YNIelw9jr1TbbiarOI/2vdK/nGvwMCVOiV7uY63J0NkGixMAF3UCRt6sANpAZ2aD0+n0AaqNDE4KVe5etc0oaUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287493; c=relaxed/simple;
	bh=X/hV5ljxWA12U5TVhXUBeSsDz7VPis8ajbh1wO1J3cQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raqbaaBOEy+0y2FAsHePt1hoGJt72gbuUk2ZKCSZkMGSKGrYrvhoEo2U8G33yLUJPd5EfJe+xwwzsrphugFZxkxoMaZnJrpaWWa9ZlgltY9gTUt546YmBXuD9n3szi4B7fJcn0LQ5vfNcQZ0HwkztFx3Pf3En2hXsVO1yFtsu68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=npJTpuhq; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="npJTpuhq"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d6b393d60so9591cf.0
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 07:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779287491; cv=none;
        d=google.com; s=arc-20240605;
        b=YSnaX7O5OCVWTKQ5JuMkVzkLRenI6drJy3TALG7TzCG7rLP6CIb9diJFB/ZU0Ee3gu
         7TlngmKqHO2N/BUjm6FI1iKrP3TgWOsrXjzEnkkTMFhEy3uts1LMghEME8zSPMr/UDp5
         d71GOQPrw++Sci9YSfJpxijRt6fPrOBTsA12OjgvQuVj9nagsdXZR6gZPRZEmn7Vki/O
         NiQunnYQUbCcDv4jWe6JMCpo3/26BNVc3zua4t1vhOy23jswFaw95QiPBaF5tVpBS7s0
         B8Y/VmpQx0VA0CF2F2qc/VjNcMUvN0NWxDubmQKnj5kqJtZlo5oN4Ka3O1H+yLsXslTH
         Bryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7N5NasgJypbMdlNYb/j7e6t6w9YfyUO25pmJjvirfi4=;
        fh=XxgaRdbkleIIPMYzRVGkIweD9vZWlPG+0sCi6IkWVhA=;
        b=B2CHa05Mp5likP+40lDgxef0nETOWKpYZCKbMGNi5qIT0qXJM0xfMP24v2feEAYPXD
         cXhygHoGD0Ph5Gw5f2gfk4NZ+qjX6Gr+W0Sr5oVnB7ieq6LZAk4sprNlCZmxFGuZhAM5
         5Lgn1RCBmfj47O2iFqiv5EkOn9YFSG1vZCNPO9IIci3An8g0v6MJ9EZiB9P85OLStpmH
         bEOJRJPgsif8uuusMzmlzKy66oroleTzDPCW6iRf2RvTKNvYipBR0Od+22dOnTWa0A4X
         Vmh02ng1xktTjK+mcpZV/7hgYV1jhCpHbu3BuiUFWtstDjs2vSjHqpO0gsdj8r4jMhoj
         rxNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779287491; x=1779892291; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7N5NasgJypbMdlNYb/j7e6t6w9YfyUO25pmJjvirfi4=;
        b=npJTpuhqT+/r5rnnvA4NgzfgREj7kruz7yM2jfdU4AipvDHXYGt4xgJ+xZB8sdUa25
         xdayIM6/pEWm2gkxUs45DpkaHJ+oa8L8SUfCO415Fm5HrfVD1aSokk2Yftbc3B0jp62W
         f9cbVmTBx4z9PMYPyvCZRQIbXGNeiqihALEJRzvmIB407U0SWEci8m42/aX36EUH+UlP
         xiO/5TZu/5+BPebZ3fzki3f7QfS2+f2uJvVGcVsXBzDuY3ec4A3L2IPHFlLI0P+BkJGA
         uxSgfNBJY0UlQ/BJgri28D2h9M3FsbuGCrRtBCyJTG07uwl8f0cfKXGv3mlGCevp5PnD
         xtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287491; x=1779892291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7N5NasgJypbMdlNYb/j7e6t6w9YfyUO25pmJjvirfi4=;
        b=HiESZ55XPc/oVPbqeuHWkw621qHkBNugSJccUTVptASuCJzkNCg//aFxL9TKw1EXKS
         RebCqSIMD6WNISYzkCHSaT0JgEZ9z6aLyXTsyt3n+i6WYlJVYqiTr7aVEOwJ8imgYvSt
         MjyU9XF1oYVJpKYokbgO3ThbfBJ5ZGZTclNhuDpbVI7ZWxNM+4hZ+oD4XrDbj/6jz4Es
         fwnRzsJE7NnqZrVA4OhsXqPvqmvY/WiqTcbQtC3GSjsXTTmRgkcvbOPlGq1CK2OMWxFu
         9LKd5n5oQt0via+2WDWZnNzFiWWSVNClP/HkxfjhQTJ8jvYSdEcS/uTYs1iP8ZTe1KXx
         YRmw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZMdk0xzkAS5+w8056tS3zwRUzWbBkWikLwphKD4Sbj//vY0BaUBI7K+aemyOXKaMZT+GNhRot4ZUH@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe2l94Ze7s3v/TQH3zta6em8WpIGYCtcQCoO9y4/W+sRusUjew
	PhqhOTqOrA43FPglIhNHUgKCc/+dho1fnOo+toc6bkanKJahMen4a2A9HaGrO1PEkL2eX1MFWZL
	OM1L6urjEmevOiKvtOY+rdz8QSoJy6USjKgUJwyy2
X-Gm-Gg: Acq92OH9oTOvK+nou/VJ94xYSfUTh7mRbvndLw5sG940KXbOqFPPqIPA5H2Smdu+qnC
	mIfPlV/cmg8gRXFONe7IY+qKyRUDrDoE2+AjOW0umAUeP2gonTubqSz+gODPUW1o0UnXURU5daX
	VtFJLOb49MXjOldnlzWVlgFrKH0TqkVSlw2OI21sh86AHNN6VNHzK8unjbf3kD2k8oiqdGKryAl
	HJ5Rn8z4o8TUG4Exj9KB/oGqNl6x4pkOrcRvCOjxdQv05lTSi804Slp0BeITO+y6rIHSQ12NXHq
	knaaWEVzse1jIF0hV+I=
X-Received: by 2002:a05:622a:989:b0:50e:6360:96e with SMTP id
 d75a77b69052e-516791fe73cmr46959761cf.0.1779287488674; Wed, 20 May 2026
 07:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-12-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-12-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 15:30:51 +0100
X-Gm-Features: AVHnY4Lo4l5leoGwp4MOUhUOXd-ZR6_GPypj6bN4fnpU5Ptxtsw2Fzt5rIYMAIk
Message-ID: <CA+EHjTwOfJ=nCRoX3m5uDt=CcF_zrqGsZVBBmo4MscmPqrBxOA@mail.gmail.com>
Subject: Re: [PATCH v6 12/43] KVM: guest_memfd: Call arch invalidate hooks on conversion
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
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Minor nit below, but lgtm.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 9d82642a025e9..baf4b88dead1f 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -603,6 +603,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
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
> @@ -643,7 +679,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>          */
>
>         kvm_gmem_invalidate_begin(inode, start, end);
> +
> +       if (!to_private)
> +               kvm_gmem_invalidate(inode, start, end);
> +
>         mas_store_prealloc(&mas, xa_mk_value(attrs));
> +

Why the unrelated extra space?

>         kvm_gmem_invalidate_end(inode, start, end);
>  out:
>         filemap_invalidate_unlock(mapping);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
