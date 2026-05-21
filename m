Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3177827FD4B
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779398829; cv=pass; b=g2a7YILONDYKPskXKLtigD73MjmY1L64iMGYMr+UIGmwxwxaTUmwcoURH7rL8rEO9Y/NKGmLXeNMNIt/sodUF/PUmwgd5x6f5mrSxTCqK+f9Ud1f9EBNx+/sQ32nzTMuY0uGTbNkbGWJiumioqvt0K7rlWxZumQtLIret5wJKkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779398829; c=relaxed/simple;
	bh=+LPjIhTg4BXMNC3SwV5cz0pp6+I5UIaFhnvuSezWq/s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOzy3vOq1Gq6ODN8GcbiX2lZN+0a/SMdzrKS5imRihT6roJbYhwT2eAPZFY59uRPgUm8j3hHpcvTVIwZTXRiFg10MZXHtGpze86AbBup/fj79l2UQqrS3JCSJ1nLdRnpWCbjnqE94YyrTW/Ey9IMzP1kZKZp5hc6YSmnf9PPkIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNgkqs/F; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNgkqs/F"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6312a0d556cso3075587137.3
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 14:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779398826; cv=none;
        d=google.com; s=arc-20240605;
        b=IUBYi0jaH5Qepa9sVCz2XA6y+56VhkwBSBSWO+yBEmAgwd4MBFOnR5zWH0mXckPROK
         2rTafQoNge6dq7HLqcQx0HkUvENiF8qsnRWDDUzJdREVLMl+nCJjyMYrLHprZry7Zo12
         qIwye33I3+cMIj1Hc0L35S9ajxIgJseUY3NazC4xnIDaWI7j6miU+inNq4CklzJVWv7a
         RFHx0QDVXsLUi9WQ/Quiyf5Ry5gqTY/jmbbbr9IrF8T3FF/YcHzMjd7Hf1MHaPBuO+b+
         z6nmifZ9qMULXEkjz5U2lreSyxkUGEaKTMURg4ZUSlORHLc8SfOF3gscQnnkdB/l5NyG
         wWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jpWgFYhhbnAeBja5/b81jA1gJjkVzB/mfvPZ3ghPp+g=;
        fh=8kAisFx9rhkz8RoJUUg1rS/xEehTy/BsQCJe4G5j/B4=;
        b=hEXrlRcX8jyF+/QClli38olGEQbXcHv7C4RhNEJ1xBAmh98ZzoCbtpMVBf68IHLyQj
         1/R6O2ykqD4YoZlA9WIgASw+XTMXQbwPL0XAqB/Q+PGsdOv0giy4TuVY4NHS6rdNu+45
         fr3lGwKWnkCTL87t5vFoAb48PBcI2WIfW/rH7xRwJ/7EjW2A40oDxHm0rKfQU2PD3Mkw
         gABLo5sbyeLLncSyiE3hzf7E5WEiNR1D0XVQxmSQMHRtexbpKdt4fLxM4plRtgC5o3kl
         QHfH7sWiUhi3pmgyxVlLiBL7tI/Jb1HzgSErhH1cEQqxQ7r2euzADHk5faKFQ3vW7yK6
         7vPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779398826; x=1780003626; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpWgFYhhbnAeBja5/b81jA1gJjkVzB/mfvPZ3ghPp+g=;
        b=SNgkqs/FSjAiC7h2T2An1B9dqx3TPqE0ezPA181qEkQgt4P/6+R5CsG+uPqBr9deOz
         OXUYGoWJ451IZo/0OQcAoTonS/Yc3T2gjX7mUHfJ8Iec0TBDDMRi4B6uRASwvFQg4PPI
         BeppmTym3nD1g27MhHwpDDfIdggugU9cueZaLim3OIZYtRB3bCvKcjOoU54WmeVDgEFT
         4YxwT4rS6ZThN9y2HDLbzUiqP55ztUfYADLQwK4ING844vYf8qfAXYAclZb+rF54MBgM
         SZRwda9KfWiBw8CHdyeVadEX4M2Kl6vF2UidwVF/Ds9Iy3Ulnr6dZ7YlWbt2MaV3doD4
         xljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779398826; x=1780003626;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpWgFYhhbnAeBja5/b81jA1gJjkVzB/mfvPZ3ghPp+g=;
        b=YeIIyOwCDV5vO30zW6pNogn+p0uk6JAGRdrpPUwugukrfK1WF+YlFiefnU9KfGsupI
         ZZLW1H9E3vVm1vUK1bqBjv5yW7TMFLUbKv0vZl61rHK+f+8rzKVh6rUOpt0dytjhKsZA
         v9LoFWrN++bUPjFDiVOBXRLhuCQQN8GhP0tJLCYD6fu47kSBs+pI2TQ65f/kdKlpa8Cd
         efVQP5ieI0b+gwJFTIovBM+4yQJ5ffBkyp5IJa+iER3s1tVh72AicCa7nI2VDCCjEuk8
         COM6kJ7jzMMNzxcTYD0yYKaezp5P+/JdY36X2prKEcr4C5kcraZ3WEyuUPK3Q93crIqQ
         n5qQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oJzC+Fy/jnu+mUNEygM/rJJWO7/JupUZLmDXsSTrRFAlB3m48BuzfD+bFqI6lyN48/C5L8AyOrSwO@lists.linux.dev
X-Gm-Message-State: AOJu0YxeboSO7gYBVv/ZaaW3iD8BhHDZb7XxosUtrdRKYEPIlHVDitXw
	Fzm70a6uE5q7gGp6lsoMY39qf6SwBFHzggz6gJkGoMI83l0/Mg9BSv82Sx8+/2INwQ2iAV1Gkeg
	bIDkX2QqQwcrX2+TrYrrnC32TS05pgOPObO93QT32
X-Gm-Gg: Acq92OGaILftTwuhpzTXjMrMk2tTzMMUyB7AwzdWCcvFEcKUSIn3kMaGdQ5p9cCd32a
	tdsPOC9a+QKu8/I9pNn9ctCz8R0dnQlaLQJYGcczQD31wqrPhTluIHUBpLm/t4vyQe5ppiOfZw3
	kWgubifOwNufM7if5ynrpACY7gfIUUYhUZYMUcdtWAwo98SIlTjScrTjw0Y63bpVAy4o+1TXOC2
	wlscm5Leg607E3SSscIOWS4fUFxFbFYf9Qv+WPEFMfsqJ8Wkn68eYJxG4BPwNxGDGtRPOgpiuDM
	Cdq3DYbLAn1D/Zwr/RTT225XEkqddQ1d8YK94plvTsruuSlsXFADfGDr98Ks8302sfqsSQl0wsn
	dN9/h
X-Received: by 2002:a67:e7cb:0:b0:605:6773:611d with SMTP id
 ada2fe7eead31-67c7405f583mr398913137.1.1779398825479; Thu, 21 May 2026
 14:27:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 14:27:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 14:27:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag8G7Wq5PbEdKloG@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-21-91ab5a8b19a4@google.com>
 <CA+EHjTwrygfMrZZSw4y7-ry8fidW2x0C7iuF2Q=dnPNHUmNtUg@mail.gmail.com> <ag8G7Wq5PbEdKloG@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 21 May 2026 14:27:04 -0700
X-Gm-Features: AVHnY4JKrLHcWBnwxG_jlJLfen-f7c-olGgUCItaPr4oaASPSS6SIhxF205tXG4
Message-ID: <CAEvNRgFB8ydih9JTmsH06H32j38tH-iViZqN_eZ_gQAmXpw+Dw@mail.gmail.com>
Subject: Re: [PATCH v6 21/43] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, May 21, 2026, Fuad Tabba wrote:
>> Hi,
>>
>> On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
>> <devnull+ackerleytng.google.com@kernel.org> wrote:
>> >
>> > From: Michael Roth <michael.roth@amd.com>
>> >
>> > For vm_memory_attributes=1, in-place conversion/population is not
>> > supported, so the initial contents necessarily must need to come
>> > from a separate src address, which is enforced by the current
>> > implementation. However, for vm_memory_attributes=0, it is possible for
>> > guest memory to be initialized directly from userspace by mmap()'ing the
>> > guest_memfd and writing to it while the corresponding GPA ranges are in
>> > a 'shared' state before converting them to the 'private' state expected
>> > by KVM_SEV_SNP_LAUNCH_UPDATE.
>> >
>> > Update the handling/documentation for KVM_SEV_SNP_LAUNCH_UPDATE to allow
>> > for 'uaddr' to be set to NULL when vm_memory_attributes=0, which
>> > SNP_LAUNCH_UPDATE will then use to determine when it should/shouldn't
>> > copy in data from a separate memory location. Continue to enforce
>> > non-NULL for the original vm_memory_attributes=1 case.
>> >
>> > Signed-off-by: Michael Roth <michael.roth@amd.com>
>> > [Added src_page check in error handling path when the firmware command fails]
>> > [Dropped ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES]
>> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>>
>> I'm not very familiar with the SEV-SNP populate flows, but it looks
>> like Sashiko is on to something:
>> https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=21
>>
>> - a potential read-only page overwrite, because src_page is acquired
>> via get_user_pages_fast() without the FOLL_WRITE flag, but is then
>> overwritten via memcpy
>
> Oof, yeah, that's bad.  Adding FOLL_WRITE to kvm_gmem_populate() feels wrong, and
> could break uABI, but doing gup() in SNP code would reintroduce the AB-BA issue
> with filemap_invalidate_lock().
>
> Aha!  Not if we use get_user_page_fast_only().  Ugh, but then we'd have to plumb
> the userspace address into the post-populated callback.
>
> Hrm.  Given that no one has yelled about overwriting their CPUID page, and given
> that the CPUID page is likely dynamically created and thus is unlikely to be a
> read-only mapping (e.g. versus the initial image), maybe this?
>

Overwriting the CPUID page is by design, I think. IIUC if the SNP
firmware doesn't like something about the CPUID page, it can update
src_page and then return an error to userspace.

Userspace should then check if it agrees with the updated CPUID contents
and then retry if it agrees.

> diff --git arch/x86/kvm/svm/sev.c arch/x86/kvm/svm/sev.c
> index 37d4cfa5d980..c73c028d72c1 100644
> --- arch/x86/kvm/svm/sev.c
> +++ arch/x86/kvm/svm/sev.c
> @@ -2456,6 +2456,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>         sev_populate_args.type = params.type;
>
>         count = kvm_gmem_populate(kvm, params.gfn_start, src, npages,
> +                                 params.type == KVM_SEV_SNP_PAGE_TYPE_CPUID,

I think this makes sense given that writing to src_page can only happen
when params.type == KVM_SEV_SNP_PAGE_TYPE_CPUID (this is explicitly one
of the guards in sev_gmem_post_populate()):

	/*
	 * If the firmware command failed handle the reclaim and cleanup of that
	 * PFN before reporting an error.
	 *
	 * Additionally, when invalid CPUID function entries are detected,
	 * firmware writes the expected values into the page and leaves it
	 * unencrypted so it can be used for debugging and error-reporting.
	 *
	 * Copy this page back into the source buffer so userspace can use this
	 * information to provide information on which CPUID leaves/fields
	 * failed CPUID validation.
	 */
	if (ret && !snp_page_reclaim(kvm, pfn) &&
	    sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_CPUID &&
	    sev_populate_args->fw_error == SEV_RET_INVALID_PARAM && src_page) {
		void *src_vaddr = kmap_local_page(src_page);
		void *dst_vaddr = kmap_local_pfn(pfn);

		memcpy(src_vaddr, dst_vaddr, PAGE_SIZE);

		kunmap_local(src_vaddr);
		kunmap_local(dst_vaddr);
	}

>                                   sev_gmem_post_populate, &sev_populate_args);
>         if (count < 0) {
>                 argp->error = sev_populate_args.fw_error;
> diff --git arch/x86/kvm/vmx/tdx.c arch/x86/kvm/vmx/tdx.c
> index f97bcf580e6d..33f35be4455b 100644
> --- arch/x86/kvm/vmx/tdx.c
> +++ arch/x86/kvm/vmx/tdx.c
> @@ -3188,7 +3188,7 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>                 };
>                 gmem_ret = kvm_gmem_populate(kvm, gpa_to_gfn(region.gpa),
>                                              u64_to_user_ptr(region.source_addr),
> -                                            1, tdx_gmem_post_populate, &arg);
> +                                            1, false, tdx_gmem_post_populate, &arg);

And TDX doesn't try to write src_page, so this is good too.

>                 if (gmem_ret < 0) {
>                         ret = gmem_ret;
>                         break;
> diff --git include/linux/kvm_host.h include/linux/kvm_host.h
> index 61a3430957f2..b83cda2870ba 100644
> --- include/linux/kvm_host.h
> +++ include/linux/kvm_host.h
> @@ -2596,7 +2596,8 @@ int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_ord
>  typedef int (*kvm_gmem_populate_cb)(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>                                     struct page *page, void *opaque);
>
> -long kvm_gmem_populate(struct kvm *kvm, gfn_t gfn, void __user *src, long npages,
> +long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src,
> +                      long npages, bool writable,

What do you think of need_writable_src instead of just writable for the
variable name?

>                        kvm_gmem_populate_cb post_populate, void *opaque);
>  #endif
>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index a35a55571a2d..6553d4e032ce 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -858,7 +858,8 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>         return ret;
>  }
>
> -long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long npages,
> +long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src,
> +                      long npages, bool writable,
>                        kvm_gmem_populate_cb post_populate, void *opaque)
>  {
>         struct kvm_memory_slot *slot;
> @@ -892,8 +893,9 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
>
>                 if (src) {
>                         unsigned long uaddr = (unsigned long)src + i * PAGE_SIZE;
> +                       unsigned int flags = writable ? FOLL_WRITE : 0;

How about using FOLL_WRITE | FOLL_NOFAULT so if it weren't writable to
start with, don't CoW, just error out?

Like you said above the CPUID page provided as src_page would have been
written to before, so it should have been mapped as writable.

>
> -                       ret = get_user_pages_fast(uaddr, 1, 0, &src_page);
> +                       ret = get_user_pages_fast(uaddr, 1, flags, &src_page);

If we stick with FOLL_WRITE, this also solves the case where a read-only
mapping or global zero page are provided as src_page, since
get_user_pages_fast() will do a copy-on-write if those were the inputs,
making it writable before the write happens (on failure) in
sev_gmem_post_populate().

>                         if (ret < 0)
>                                 break;
>                         if (ret != 1) {
>
>> - an ordering violation with the kunmap_local() calls
>
> Yeesh, that's a new one for me.  Thankfully this is 64-bit only, so it's not an
> issue.
>
>> These predate this patch series and are just being touched by the
>> 'src_page' addition, but if Sashiko's right, these should probably be
>> fixed sooner rather than later.
>
> Yeah, ditto with the offset wrapping case.
