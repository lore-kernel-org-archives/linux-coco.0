Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67539E9D6
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350277; cv=pass; b=TwdzOmbrK9n3Ev4Df1Ux0HPC+2ZPJQ0POalVU6UykUuv1kEfUs4pQuPtc1T5jWL0nkTUnLTB3VcZwyyYTI2HcElJ2AdN5YpJWw6q2Qmswgm4rnQl0fQkVT9By7PASzC1uG154wR61O17zjRTG0r/PjG3hXmYs9lFXPn2/P9zIk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350277; c=relaxed/simple;
	bh=4KcT8rdA6d07iJNq3wBXNazPyISKqsHOcKPYno1GuIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpzyq2fZHrhS6A5mq1bxd6hgm/BGb0XwMh/FvwWtek168bwVA7bSm++6Lgx6DlKJilfH+0IodUHoIJwhb5ae370rpQn2O7yJ6uU0NcSrv75xgyqQGXelqXjGTOZIUZOOg0LCUB6FReXwaWXKZImpyO9IBGOsr05nSX1vVtLml7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AVlU+6J4; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AVlU+6J4"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-515548f390fso821cf.0
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 00:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779350261; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBTPezH7JHuKa1zic2GuHMNcdOcGqigsGGDHfFHpFNdR7r1rxRjwWSVP5mokISxnyl
         1/oWuXsHm7VMcmlUc9LICK8mG7Uza6hUUa28WHJg+vqF+xPk95x8N9HRR0AMzchP8PiN
         1wTnx2clTY2NQ42S7MhgngWUjA2WvJ3euvufuraUHDPTQShuYomGdxS+XOZCXG71WLXT
         hR2QhxDXnho7+kAVvE6x5rq3CREE9dtcKSl+tFTxuyKIiGOONXu2Cx//1CKeYXwuwZhe
         LgVCnHsFBSyhSp58EMS/HSqKTZ5b+e7VBzF15RFSwsKRs4xcOKabtWc5iU3X8H6z2AtP
         K32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tSn2g3kUTBO9UyvrMevDMplllFpiZxqy7FxTUXL/Xlw=;
        fh=edva3v3Rt418G3aj2ARJ1UVMvDiH4PMhJhEYj922GiE=;
        b=lozWYjCsxbVLrBblhuvPlZ4MwUmW69wR8Un1pTujC9YX8d7YNd/jGS9JcAQWZtc463
         6bcwFC/A1vSFxOfAj9UpUXvkcbuSrI8/uAdBTJkVY5Ho1GNzr0vUEJzZvLqIeDu09QUP
         OBWlZgVhtTXQT6zvPlE8+GW4xB1rIaD8gzZ1DrAw7JwKrF/N/JLHXsHB6KJJAHSY/gip
         U6UBvgP/VQPLvEV3c96G9NrJq9DWeEAivzaBvs6pbfkYBeMQSBGyRyM8npUH5jgg1ju1
         C+h0Cgtf/FH1LYHH9SswN8QE9rSBUImsOBRGtgJO9jqaFBuQxr3y+w7txUEYWKiSdgZ0
         EeLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779350261; x=1779955061; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tSn2g3kUTBO9UyvrMevDMplllFpiZxqy7FxTUXL/Xlw=;
        b=AVlU+6J4oGhCMEEpK5Xcn5fhhawqDJ5Xn3lZ3W0/DHtY1HuPI5SxqIPyx7H8pmr4BF
         JkNfN3hq9Zbddc7bUuOrbx2PQdtseAC/utoSk7PMgG0K6Ld71suLNaYU3inPP5uvOudS
         6L/KKqccgHGlwgZLWsfbvjyvOutKjwuQ0Ndn8IjQiJmgP+uMGtYvh/JvoAO+JYcy796Q
         v8/njMvgzPHuD1/FbI0+vS7cARwZfE84somWUnwONk0ab8iO911Gtp1+L77YUS13c9EP
         gNObFJJFZJCUO8erPSwJRJ1TnuBT8FjGbeIqzUxJr4T5G+Ai3K97iu429aY7UHtnSbOS
         FB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350261; x=1779955061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSn2g3kUTBO9UyvrMevDMplllFpiZxqy7FxTUXL/Xlw=;
        b=RFmuKAUlmILxz1Qnt4SWUeLT6eM+l80XwuUmwe+T0o2LC+i7hnc3gNPiea9VJzTvW9
         VTAXM8f8OKjFFwptClnhn+tWo4Ewlc15CWFmgJQb4zBAfTE6Q1JiBCSOr6Y0A0JkLTMS
         s1JrSC8sr6nM15RLLOmQHqlGtbEbMrITVpSpyuZ7I9g2QZnn6ixEaeIbYKTq7FCHyiHt
         i3LP5dIRkdlV7YwxDoEVbKx9Iskj9z24HWD255wp5Tkf0WmxAPIY6JDtsBswJp9Mvdzq
         6Ecei0/2/jaV9Xx22TdDySqCE+dfUaQgOiY8aqHc9YVClRmOsHceWLkVa4dYM5SlGpdA
         QiCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9z3aF4Qor8AN/EjvZYWOKhdETEoord3pYaZZ4OItML4Vvjnv4J1oG32QmXOS+Em0KABTlZD+lHftkJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzDGZaCvB14DC+MROmtxVoBrkUsOm2CVwrl6/rbADfNN81/67UI
	vCXG6gzfdgSn8bzXX9R7Cm2MBSq3Z+Pv7N11JnoXRxZRfNFQerZE55/hBC3g0rWKY0uGz6ur8dO
	rlGCTDmyHfvVr0lxgjPHGS2YFDX0EKz54MiB2Rxat
X-Gm-Gg: Acq92OHxsLmduTxUmEiz+oMPzAE6E8QSoYtqChPZ+qUMADQDu0hV15E5ldyZnRW8SKH
	aEEnbOigZ7gegOjPIKsHQQ7k/zY4dt1ler09S8qUTYLEr0cTd7D6192/5bijobFHfM1SLVtsj6r
	OEovW3KmR2WTnRkvGH0kol6LfQXGwU9if/pTFfTqy69at7oeeQ+fi8UqR4oJ1/cWJelJIoKZ953
	nwHo0sFVDvSBsCHEilnMFtLh08Ay3OMq2dVMzzvrOkF1YYzvdczJTlFwvA+oCAsUkqraaBtilFk
	9keYq7Onj2jjnVX8ni/Qtayjm/pH0Q==
X-Received: by 2002:a05:622a:9005:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-516c53118ecmr5321871cf.1.1779350260836; Thu, 21 May 2026
 00:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-17-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-17-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:56:00 +0100
X-Gm-Features: AVHnY4ISxUZam6iBDjV_4hOaNzbNB8xZ_iFXhRAdE4nHy2L3vqI7KoUo1cTBaB4
Message-ID: <CA+EHjTyArkNd7cWC+OAkvkcPyM9=XUxzjg1fxFFV4GSP4wLALQ@mail.gmail.com>
Subject: Re: [PATCH v6 17/43] KVM: guest_memfd: Determine invalidation filter
 from memory attributes
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
> Before conversion, the range filter doesn't really matter:
>
> + For non-CoCo VMs that use guest_memfd, they have no mirrored tdp, so
>   KVM_DIRECT_ROOTS would have been invalidated anyway.
> + CoCo VMs could not use INIT_SHARED, and there's no conversion support, so
>   always using KVM_FILTER_PRIVATE would have worked.
>
> Now with conversion support, update kvm_gmem_get_invalidate_filter to
> inspect the memory attributes maple tree for a given range.
>
> Instead of determining the invalidation filter based on static inode
> flags, iterate through the attributes maple tree for the specific range
> being invalidated. This allows KVM to identify if the range contains
> private pages, shared pages, or both, and set the filter bits
> accordingly.
>
> Update kvm_gmem_invalidate_begin and kvm_gmem_release to pass the range
> parameters to the filter helper to ensure invalidation accurately
> targets the memory types present in the affected range.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 9f6eebfb68f6b..c9f155c2dc5c5 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -193,12 +193,24 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>         return folio;
>  }
>
> -static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
> +static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(
> +               struct inode *inode, pgoff_t start, pgoff_t end)
>  {
> -       if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
> -               return KVM_FILTER_SHARED;
> +       struct gmem_inode *gi = GMEM_I(inode);
> +       enum kvm_gfn_range_filter filter = 0;
> +       void *entry;
> +
> +       lockdep_assert(mt_lock_is_held(&gi->attributes));
> +
> +       mt_for_each(&gi->attributes, entry, start, end - 1) {
> +               filter |= (xa_to_value(entry) & KVM_MEMORY_ATTRIBUTE_PRIVATE) ?
> +                         KVM_FILTER_PRIVATE : KVM_FILTER_SHARED;
> +
> +               if (filter == (KVM_FILTER_PRIVATE | KVM_FILTER_SHARED))
> +                       break;
> +       }
>
> -       return KVM_FILTER_PRIVATE;
> +       return filter;
>  }
>
>  static void __kvm_gmem_invalidate_begin(struct gmem_file *f, pgoff_t start,
> @@ -244,7 +256,7 @@ static void kvm_gmem_invalidate_begin(struct inode *inode, pgoff_t start,
>         enum kvm_gfn_range_filter attr_filter;
>         struct gmem_file *f;
>
> -       attr_filter = kvm_gmem_get_invalidate_filter(inode);
> +       attr_filter = kvm_gmem_get_invalidate_filter(inode, start, end);
>
>         kvm_gmem_for_each_file(f, inode)
>                 __kvm_gmem_invalidate_begin(f, start, end, attr_filter);
> @@ -367,6 +379,7 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>  static int kvm_gmem_release(struct inode *inode, struct file *file)
>  {
>         struct gmem_file *f = file->private_data;
> +       enum kvm_gfn_range_filter filter;
>         struct kvm_memory_slot *slot;
>         struct kvm *kvm = f->kvm;
>         unsigned long index;
> @@ -398,8 +411,8 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
>         end = i_size_read(inode) >> PAGE_SHIFT;
> -       __kvm_gmem_invalidate_begin(f, 0, end,
> -                                   kvm_gmem_get_invalidate_filter(inode));
> +       filter = kvm_gmem_get_invalidate_filter(inode, 0, end);
> +       __kvm_gmem_invalidate_begin(f, 0, end, filter);
>         __kvm_gmem_invalidate_end(f, 0, end);
>
>         list_del(&f->entry);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
