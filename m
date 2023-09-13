Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC358F68
	for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 16:28:58 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5925fb6087bso75655117b3.2
        for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 09:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694622537; x=1695227337; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uTzciLAK1rHaLd0gWzMb/fWg9Lw/LcXOlDJsQ/Mdv44=;
        b=V6UPmbJk7pGldkT8DjYXSTgbqtm1c44+Avn/PpkrwBuPD2eh1NJ9cMJFhqIvgDAm/6
         9zjix5oUX/5+xVnYPwoUODlCI29YJrEwc5ZYoW0HOH6lWwk2nCtI0JpRk3Y9tzyOW8b6
         46yzVhtDncXHNjEK6ZDJWbkuycg2szoSetj/z2nW+jdVmbQ0Au/jrgCqzqHFORfaEKSC
         v2Jn0V8DzLcOPNeW+G9d2nOQIFow5Qwc8D0HIoCFnBML1/VsoZwg9JoT9smvV6ENQmui
         iPtHfP1UVSyhWq7CUgjB2dsVsHpEgBkWxxUEV9ih0iE7TUZdhH86O5iOVH8h5YHFfFFf
         utPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694622537; x=1695227337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTzciLAK1rHaLd0gWzMb/fWg9Lw/LcXOlDJsQ/Mdv44=;
        b=Jt8Y7Dqu3pdUnyhkI05BzHyK+A9tnmR8AlBKvGClMF+i35QTsIXxq4nSSKThWf72d/
         RVqz3t5Lk0jszDvsx6jauEpEuUmOHXButIZcLrRsBXWk8FqnmxKMFORz/arfZBDpxCSW
         FZEs1sYdyLBBMhvj3eAie0jf2Pce8c0lDd9WmyzPY59wuA+SXMWdwHu11cs7r/hgoWSm
         r+Rm1WmRMckKJDYmV2NWFRUv3AV4DtMQU+4EmFiw9Zfq4GOVqgx2FeBku8gC9VIZSo7N
         RGT1bJ1nStOkiBIczd3RVdP5Im7Gpj5NF8y5Ytn8V08FV5msySzaRP8qT5HV54dRRepj
         YBWA==
X-Gm-Message-State: AOJu0YyvWIHSUSY9fuzDq3kTOgPZYoMzPmVb+VqL9hPgCaB5B2pclRiT
	DEFbOnIY0upVg/P3wtfiCy4ec1v8pPI=
X-Google-Smtp-Source: AGHT+IF46GoZBpBu9T03PtWbv2UJpHn9Ww4IDx0PCBEgrZzLs7mJmzm5VD2skhuBuxBH34J0c2R8ha4gffg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:8210:0:b0:d7e:8dee:7813 with SMTP id
 q16-20020a258210000000b00d7e8dee7813mr66802ybk.8.1694622537338; Wed, 13 Sep
 2023 09:28:57 -0700 (PDT)
Date: Wed, 13 Sep 2023 09:28:55 -0700
In-Reply-To: <d6601227769ec82eed95270053ef58e13c2c0a09.1694599703.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1694599703.git.isaku.yamahata@intel.com> <d6601227769ec82eed95270053ef58e13c2c0a09.1694599703.git.isaku.yamahata@intel.com>
Message-ID: <ZQHjR8ZAwRUJGDzi@google.com>
Subject: Re: [RFC PATCH 2/6] KVM: guestmem_fd: Make error_remove_page callback
 to unmap guest memory
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 13, 2023, isaku.yamahata@intel.com wrote:
> @@ -316,26 +316,43 @@ static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
>  	end = start + thp_nr_pages(page);
>  
>  	list_for_each_entry(gmem, gmem_list, entry) {
> +		struct kvm *kvm = gmem->kvm;
> +
> +		KVM_MMU_LOCK(kvm);
> +		kvm_mmu_invalidate_begin(kvm);
> +		KVM_MMU_UNLOCK(kvm);
> +
> +		flush = false;
>  		xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> -			for (gfn = start; gfn < end; gfn++) {
> -				if (WARN_ON_ONCE(gfn < slot->base_gfn ||
> -						gfn >= slot->base_gfn + slot->npages))
> -					continue;
> -
> -				/*
> -				 * FIXME: Tell userspace that the *private*
> -				 * memory encountered an error.
> -				 */
> -				send_sig_mceerr(BUS_MCEERR_AR,
> -						(void __user *)gfn_to_hva_memslot(slot, gfn),
> -						PAGE_SHIFT, current);
> -			}
> +			pgoff_t pgoff;
> +
> +			if (WARN_ON_ONCE(end < slot->base_gfn ||
> +					 start >= slot->base_gfn + slot->npages))
> +				continue;
> +
> +			pgoff = slot->gmem.pgoff;
> +			struct kvm_gfn_range gfn_range = {
> +				.slot = slot,
> +				.start = slot->base_gfn + max(pgoff, start) - pgoff,
> +				.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
> +				.arg.page = page,
> +				.may_block = true,
> +				.memory_error = true,

Why pass arg.page and memory_error?  There's no usage in this mini-series, and no
explanation of what arch code would do the information.  And I can't think of why
arch would need to do anything but zap the SPTEs.  If the memory error is directly
related to the current instruction, the vCPU will fault on the zapped SPTE, see
-HWPOISON, and exit to userspace.  If the memory is unrelated, then the delayed
notification is less than ideal, but not fundamentally broken, e.g. it's no worse
than TDX's behavior of not signaling #MC until a poisoned cache line is actually
accessed.

I don't get arg.page in particular, because having the gfn should be enough for
arch code to take action beyond zapping SPTEs.

And _if_ we want to communicate the error to arch code, it would be much better
to add a dedicated arch hook instead of piggybacking kvm_mmu_unmap_gfn_range()
with a "memory_error" flag. 

If we just zap SPTEs, then can't this simply be?

  static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
  {
	struct list_head *gmem_list = &mapping->private_list;
	struct kvm_gmem *gmem;
	pgoff_t start, end;

	filemap_invalidate_lock_shared(mapping);

	start = page->index;
	end = start + thp_nr_pages(page);

	list_for_each_entry(gmem, gmem_list, entry)
		kvm_gmem_invalidate_begin(gmem, start, end);

	/*
	 * Do not truncate the range, what action is taken in response to the
	 * error is userspace's decision (assuming the architecture supports
	 * gracefully handling memory errors).  If/when the guest attempts to
	 * access a poisoned page, kvm_gmem_get_pfn() will return -EHWPOISON,
	 * at which point KVM can either terminate the VM or propagate the
	 * error to userspace.
	 */

	list_for_each_entry(gmem, gmem_list, entry)
		kvm_gmem_invalidate_end(gmem, start, end);

	filemap_invalidate_unlock_shared(mapping);

	return MF_DELAYED;
  }
