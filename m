Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748603CF695
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205165; cv=pass; b=q4g94e5Dr9gWpaoBq1jrBlXAeZuunarBVDQP46/bNueb872eKuSCcy0oV30N+5OzzCsbFM0b8aVKSQutX96touLKLxm5tDSLKvFqyEYYzooRDKoa9in3ogY5jx9hhIXLgsYGWz+0+bDg4VRRWklRhyxickcuet/071iD7jSYiuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205165; c=relaxed/simple;
	bh=UGoqUAYtBwcvOzvzqQVEOAUHdQNj4ggDmWvOp55PxNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GczKYc8R86zTtvSOn56M/NzzOC5QNYpXUV8Tuee9Buktt9IcgKTXxnK49fFU6ophHVwbZinUTPzs5IRfAO2x0OpckjrW1pPR6omS83NERMfircDlhOul7WxSTD/raO9V3gnTRnBj6P75M8hr1DezAp1oCFCluZ1LPtBzgvNgflo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cqlGz/yq; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cqlGz/yq"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-519ed52bcc6so210131cf.0
        for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 01:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782205162; cv=none;
        d=google.com; s=arc-20260327;
        b=qGQfaoD8SxalhbB9m8t6M9uNxUb+y2dcLjmkf3hpRTfFVvdf7NYayG2EC1bdr1zZNW
         8X9q52UZYfH6JLZ0CzJjpMJvWbMIRg4aIL3uP4k0ISxtPFCWVD40Qe38i5jAQzW7rAkW
         NXp4H8o6U1FswebpvX62+ZFLVWgRD/ysAhVQiQR0rA5fsTGefQlcUbB1ijZ9a/btP6pZ
         ZOqA6jlTNHcwP9ib6Hft6uuQKPqMNFhpo/uOipEh1bF0sCZctu50f51TosZDPGB59ZZF
         aZyY23UkRCpqtJb6Vs8Oy1FkMzCkYpgNBmaS1V/1q3y+jslGsoCce/oeg26CN7EAx4dC
         zNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1CwxGLz1a/U/PZjtJKb6pMN6pB5nXMPtX6D0w5J8tac=;
        fh=n8w1y7NrqYcyasH3FHEe+aeDhjm1EZCqzCL6m8VhQMA=;
        b=VQs/IopbP3pRZ1THS03bxHimLB4GzQosetuyGqI93HZPzPch29H3My/dzIsKrrMTvA
         kqrymqR8lAdjlSt6GfEaFgkuunrMPyz3GlWldgbc7CAQc1Kz3WbsdDcaSaBeVQsBwAI1
         Z+CE2pT7WIDa6/ehYLOc6QrJFRhcPyqy8rGSvXS1+BLGPd0hFaDgpf+feqpRedombIOx
         5e1Okdu7visSapLj5viIT7muOIgpN8nmSvWA9MH/AGsiW3flJ6QLmcpPM6TpfcCOu7cV
         eS2Be4fbp8gCqki865fVINqcNbQbwuPamC5z3MBMnP+5OK66zcwi3VwxWcR1GFWs8ZtS
         yutA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782205162; x=1782809962; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CwxGLz1a/U/PZjtJKb6pMN6pB5nXMPtX6D0w5J8tac=;
        b=cqlGz/yqCzt2NmRt56ibtDMlwa75wx0W8OHjHGUH8KVE0s1yWMk9RPb4mS3bSobEZq
         FTN9weurYP3aTf2dmBdaVEheIaMK7rfrhRFsZUpj5Fw884R1h+ak9idlfs2oZAv1F69L
         RGudAFpmmceN3Yrj0D22By1laWbKyekhPVbTNM32q7x5tfkRkvw60knc6qt5leS9WDz5
         U6k2No4mPBIMuL+Z6HIseMfB0L6L/Q0/2FSAFa7qBA/5suIAEe726THFXNK/k8O81+py
         0Qel54qLPmxjhhA3HBAIoIMKEbJC3IFZAU59Kq6saDnoLa0ztQG6bbNqZ9LPmiVr5IUw
         LW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205162; x=1782809962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1CwxGLz1a/U/PZjtJKb6pMN6pB5nXMPtX6D0w5J8tac=;
        b=nKJ5w8RIG+9/yBCavibcEPbl8v5kLXdmzgp/x1L2iFyTrnoMYIAG2Jpdubk3tuTYJD
         /amG0JzIPweVWqG3alucs5AXtGQ+2N66LM1mwwICxAsc3nZig056i8WdrynxxhviC0Q8
         JqG9iurtBT4c9XJY+42pv+DNlx/x6ufLkdHRqKWjxYF3ND+W5OVGIRc5uOzrdRp+NX1m
         YzK13Ait2W1dKimtqRrNFVjKYfuW2hrmEDDZo0JugO70q1i16nTfrDMgXm8mBpLr+Nzs
         TqxlpANcLHQ+u6Y8Q2r2tSRNfzUC0FAOO0HtrsS0OXNIVKlpVMJLgaPTC0W2pz3PUQ3k
         km9A==
X-Forwarded-Encrypted: i=1; AFNElJ+QCfWG5d5ZvK/NJ+sAolSy6OlyjYZvtO+F9C0XMZ64GtLXaYg5TqHQJ2Kq2D/nmwi8hZ8GbuU7X0sV@lists.linux.dev
X-Gm-Message-State: AOJu0YwW4DLIiZRwdHfaO3GCtv6eHY5Dr63RTly/Dny2wBe+L1/cSYcU
	eIvn+tFyz21QwoOwlldk+2cwJm4ozYzT2N7DUC/kpqkIq7rLSB5UUp0sKsefvysUAAiVb1lKNOA
	2oYCPfNzjkGqEv3iibTMn31H3VB9oSkuA0tBXO1Fc
X-Gm-Gg: AfdE7ckJnYymEYsPS9bWhxDx+gmuxSgyQxB3Qq72t5S3UvON15oFFdN1F56+na4ArcI
	Eem48yAtkWh8v8lLxZ6lbzxjkNVdOJ0k4NoFc2rg/OobcsZqPawSYeaED8uZi2++53TY4930Ea1
	UE+efJ2RcLYmW5Kvs5tyY9N7zTfsOuW2ANFcGW/Cecb9p5dySKuPU3GZG08jCxB9MIsXQgjG2Yi
	zbIIG5dZ+qhDrT0TPLb4u1YHqDNDOK+9BvrbUBMQDaWwyMrkclBXn+OxZ4OI7AhWCD+QrmI1A==
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-51a52188357mr9231071cf.0.1782205161783; Tue, 23 Jun 2026
 01:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-15-9d2959357853@google.com>
 <CA+EHjTx+3U++dnhGEkwh2SO82xMugAvvJ9ee1O__sxZCKL_X5A@mail.gmail.com> <ajneQVLriUshjFIO@google.com>
In-Reply-To: <ajneQVLriUshjFIO@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 23 Jun 2026 09:58:45 +0100
X-Gm-Features: AVVi8CfpDJy0J3C5-XoMAIo3UWrVbaFO5KPC7yjpf-92k1Ny5C4dioD7azy2jvM
Message-ID: <CA+EHjTx-1J0sEVxL8EB=j=y2Sd9mZ1eos1RCmAwj9eKjJsEcqQ@mail.gmail.com>
Subject: Re: [PATCH v8 15/46] KVM: guest_memfd: Call arch invalidate hooks on conversion
To: Sean Christopherson <seanjc@google.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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

Hi Sean,

On Tue, 23 Jun 2026 at 02:15, Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Jun 19, 2026, Fuad Tabba wrote:
> > On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
> > <devnull+ackerleytng.google.com@kernel.org> wrote:
> > >
> > > From: Ackerley Tng <ackerleytng@google.com>
> > >
> > > When memory in guest_memfd is converted from private to shared, the
> > > platform-specific state associated with the guest-private pages must be
> > > invalidated or cleaned up.
> > >
> > > Iterate over the folios in the affected range and call the
> > > kvm_arch_gmem_invalidate() hook for each PFN range. This allows
> > > architectures to perform necessary teardown, such as updating hardware
> > > metadata or encryption states, before the pages are transitioned to the
> > > shared state.
> > >
> > > Invoke this helper after indicating to KVM's mmu code that an invalidation
> > > is in progress to stop in-flight page faults from succeeding.
> > >
> > > Reviewed-by: Fuad Tabba <tabba@google.com>
> > > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> >
> > Coming back to this after working through the arm64/pKVM side. My
> > Reviewed-by here is from the previous round and the patch hasn't
> > changed, but I missed an implication for arm64.
> >
> > kvm_arch_gmem_invalidate() is now called from two paths with the same
> > (start, end) signature: folio teardown (kvm_gmem_free_folio) and
> > private->shared conversion (here). For SNP/TDX that's fine, conversion is
> > destructive anyway. For pKVM the two need opposite content semantics:
> > conversion must preserve the page in place (same physical page, the point
> > of in-place conversion without encryption), while teardown must scrub it
> > before returning it to the host.
> >
> > The hook gets only a pfn range with no indication of which caller it's
> > serving, so arm64 can't give the two paths the behaviour they need. It
> > would help to signal intent on the conversion path: a reason/flag, a
> > separate hook, or not routing non-destructive conversion through the
> > teardown hook.
> >
> > arm64 isn't here yet, so this isn't urgent, but the hook is gaining a
> > second caller now, and it's cheaper to leave room for the distinction
> > than to change a generic contract other arches depend on later.
>
> Crud.  It may not be urgent for arm64, but it's urgent for other reasons that
> I "can't" describe in detail at the moment, and even if that weren't the case, I
> think we should clean things up now.  More below.

No problem on the parts you can't get into. Agreed it's worth cleaning up
now, and worth doing in this round rather than landing the overloaded
hook: reworking a generic contract once SNP/TDX (and eventually arm64)
depend on it is the expensive path.

>
> > >  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index 433f79047b9d1..3c94442bc8131 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -607,6 +607,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
> > >         return safe;
> > >  }
> > >
> > > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> > > +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
>
> Not your fault, but kvm_arch_gmem_invalidate() is badly misnamed.  It's not
> "invalidating" anything, it's much more of a "free" callback, as SNP uses it to
> put physical pages back into a shared state when a maybe-private folio is freed.
>
> As Fuad points out, (ab)using that hook for the private=>shared conversion case
> "works", but not broadly.  And it makes the bad name worse, because it's called
> from code that _is_ doing true invalidations.  For pKVM, it may not even need to
> do anything invalidation-like.

Agreed on the name and the overload, and for pKVM the split is more than
cosmetic. The free/teardown path is where pKVM has to scrub a page before
it goes back to the host; conversion has to leave the page in place with
its contents intact (no encryption, same physical page in both states).
Keeping scrub on the free callback and off the conversion path is what
preserves that, so this helps us, it isn't just tidying SNP.

>
> To avoid a conflict with patches that are going to have priority over this series,
> to set the stage for arm64 support, and to avoid avoid bleeding vendor details
> into guest_memfd, as if they are core guest_memfd behavior (only SNP needs the
> "invalidation" on this specific transition), I think we should add an arch hook
> to do conversions straightaway.
>
> Unless there's a clever option I'm missing, it'll mean adding yet another
> HAVE_KVM_ARCH_GMEM_XXX flag?  Hmm, especially because IIUC, arm64/pKVM doesn't
> need a callback for this case, only the free_folio case.
>
> > > +{
> > > +       struct folio_batch fbatch;
> > > +       pgoff_t next = start;
> > > +       int i;
> > > +
> > > +       folio_batch_init(&fbatch);
> > > +       while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
> > > +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> > > +                       struct folio *folio = fbatch.folios[i];
> > > +                       pgoff_t start_index, end_index;
> > > +                       kvm_pfn_t start_pfn, end_pfn;
> > > +
> > > +                       start_index = max(start, folio->index);
> > > +                       end_index = min(end, folio_next_index(folio));
> > > +                       /*
> > > +                        * end_index is either in folio or points to
> > > +                        * the first page of the next folio. Hence,
> > > +                        * all pages in range [start_index, end_index)
> > > +                        * are contiguous.
> > > +                        */
> > > +                       start_pfn = folio_file_pfn(folio, start_index);
> > > +                       end_pfn = start_pfn + end_index - start_index;
> > > +
> > > +                       kvm_arch_gmem_invalidate(start_pfn, end_pfn);
> > > +               }
> > > +
> > > +               folio_batch_release(&fbatch);
> > > +               cond_resched();
> > > +       }
> > > +}
> > > +#else
> > > +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
> > > +#endif
> > > +
> > >  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> > >                                      size_t nr_pages, uint64_t attrs,
> > >                                      pgoff_t *err_index)
> > > @@ -647,7 +683,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> > >          */
> > >
> > >         kvm_gmem_invalidate_start(inode, start, end);
> > > +
> > > +       if (!to_private)
> > > +               kvm_gmem_invalidate(inode, start, end);
>
> E.g. instead make this something like this?
>
>         kvm_gmem_set_pfn_attributes(...)
>
> Hrm, though that wastes folio lookups in the to_private case.  So maybe just this,
> assuming pKVM doesn't need to take additional action on conversions?

You're right, and we expect it to hold for both directions, not only
private->shared. pKVM conversions are driven by the guest's
share/unshare hypercall: EL2 makes the stage-2 ownership change (grant
or remove host access) on the hypercall and exits, and the host
records it via KVM_SET_MEMORY_ATTRIBUTES2 afterwards. So by the time
guest_memfd updates attributes the EL2 side is already done in either
direction, and the ioctl is host-side bookkeeping. The only arch
callback we expect to need is the free/teardown one, nothing on
convert, and we wouldn't want a make_private hook either.

>
>         if (!to_private)
>                 kvm_gmem_make_shared(...)
>
> Actually, if we do that, then we don't need a separate arch hook, just a separate
> config.  It'll still bleed SNP details into guest_memfd, but it'll at least be
> done in a way that's more explicitly arch specific (and it's no different than
> what we already do for PREPARE...).

Doing it config-only (no separate convert hook) works for us, and nothing
about it constrains arm64. If connecting pKVM conversion to gmem later
turns up something we need, we'd add it config-gated in parallel, not by
overloading the renamed callback.

Cheers,
/fuad

>
> E.g. this?  There will still be a looming rename conflict, but that's easy enough
> to handle.
>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index 9ce5be7843f2..8aead0abd788 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -648,8 +648,8 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         return safe;
>  }
>
> -#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> -static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
> +#ifdef CONFIG_KVM_ARCH_GMEM_FREE_ON_SHARED_CONVERSION
> +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end)
>  {
>         struct folio_batch fbatch;
>         pgoff_t next = start;
> @@ -681,7 +681,7 @@ static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
>         }
>  }
>  #else
> -static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
> +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end) { }
>  #endif
>
>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> @@ -729,7 +729,7 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>         kvm_gmem_invalidate_start(inode, start, end);
>
>         if (!to_private)
> -               kvm_gmem_invalidate(inode, start, end);
> +               kvm_gmem_make_shared(inode, start, end);
>
>         mas_store_prealloc(&mas, xa_mk_value(attrs));
