Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C036AB56
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308755; cv=pass; b=BVIrvVO9bldBe4AVhtrMDMGrtkOawVL1JBBy1iFjaki5XTASIsUUypbMq7QDbvqM3s+i6HgFt1oGuxjOtxAE6OOYmvAz+GWcRlrnW13VFNbD0F8uhaDbXwY4TpfddjkKuscDjBAVJ+AMAqZW85Bj5T6vn9ri2rO3QoL27I8BQj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308755; c=relaxed/simple;
	bh=0y54nFg7E7TaoQP1DdnZ3Kd8izilERRAcK4RB5V7BZY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzdHZ3O/kETjA4cXMPnzbvVKC3bNRYYKNWNHYbV7dZcCJPpD4aPycKPLNmhYsfrdOodFzebchRvb6aKb0123bMhIk5qJDNRkVbiiWfkbP67rqTvvtjSBIpElEJ4LT13lQ+vcGf3SFpjrP/twsSxyAn4zBwZjHGuMo+gJsJmxgTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QfAYdA6O; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QfAYdA6O"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-636970cf66cso4020089137.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 13:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779308752; cv=none;
        d=google.com; s=arc-20240605;
        b=ib6ijja7OgyFiXUT1Ssw3rpSIE2MaOU9HyELwekFQXLKJp9rI87c73PVIjmvdIx68s
         MwwDrING+24JfTLLkSoyPOWwa1g6KfDS2NgMs9RQHKZ2hHwsl0W/Xfx+elOICva/OXxt
         oR2w8D3quPlbGba3LF4/NOIP60jIcN4bvWToHEMng6mVJJcMtx0m07+oLBe56c2Nb612
         GQveuU46VWQ5Cs2vl5mE6Wf3Ae/cCCxhqqevpH3kxJpC4MuFVWuJ8IZD9rXd5o43o/I9
         N3gTn3g2V+k5z4ne4LrAOIMtYmC+fk4R8EgrRbT3J1Qsv2Qb+xFn4w2JrUH2PhEzZ+Pd
         d34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        fh=n6rnNxogmEFzkDpAuCJCPLboam2mUH+oPWdUGi+i3Dg=;
        b=CZ60pnHl9eGXlWftCghxGekm6oQjQq8BXi42pYGhioLFaibeofvOKHVbn4G9/b6u5r
         uM0ZXYXrx2F5s4eOYRd4Fn2TNGBs711hSkjqmR/TU//VyRPUCevLtyoQpyFCF2I095gf
         W9sy1vQuvqohnIsVUiVvoWhmI8oNImDNiwRygCPfdGN79J4AgKWHZ9ATFNphPsGMLNCH
         Vy5poFP/6N4TJDTNnJxg7DpfRk0Boq7sZeY5p+6pF1uszDhrgSpdGjo4qOQ6syw8fTAk
         /RKezlRiAorZk18XgTZy7Qvw1e4xTtshF/U6zizT/WWpdHhlEBgsKTSEDOqhgfXYGSc2
         eRjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779308752; x=1779913552; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        b=QfAYdA6OLJLyQHiWrS5tqLuq44purwjBDq7aFO0xVsPItGfe7e62ViokIa2dB7uMw+
         8TyO++iBHoChb9tFfTtHAbT1Ti7uQbOgGYQwA7sx9YgWf4tJc1HkixisBz5kVj3HkN1I
         eOPY1YtrZX/pzkpZ/MKJoObsLuvLnxA3gRRS8q5JwRyizhkhnUvBNyL4yc2/n+DAhpkw
         B9alyr/NBhroCw33q2KQqo2gjujkYVrNHZ3Nc3+SZJ7euBVMcWAiFVnPWcyyocTKGya1
         6lX9xXKF5OBHWw/UbL3SKW0ugjc6zXW/lYKRhIv0wop7EA26FC8OVfJNc/3HheCR4JRD
         na1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779308752; x=1779913552;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        b=UXFvSJVTZiahrkC8puIoLsLSGnR93Mpn2ra1mV0qpTyEoxCQ6FH9Ixq/odj2G9+lyl
         7+VsdcJ7DhU6CTyyKrj18geO6G+yLHXFNIfDaK7mEejFYsvgtKSg8+haucIXbduPnbdU
         y8jbik5tMe8cZUA94gKNTRQdi0rRyX/S++BT6RHunvkIB7d8yyYJvxLxQlS1V7WLnVa3
         zJ1BWm3arUT1nwkJPhsmHPSgdWAcUqbiC1P9xR4B3w0NoV8wmLc/whmQ5BlccykqNqPu
         U4p+Kjsl09obXnlOxF09VtSPA+pVWI+m051kD7M7vsiDasJepKMokPfJ9/qPQcaS2lxb
         qViw==
X-Forwarded-Encrypted: i=1; AFNElJ/kgdjpFsqI/B2wjuS3Zn+j37y3wjIuYe5ips53v6hORZZM+0bXWhNGY8tpvlPDkLZ8oJ7HGfxTgrI3@lists.linux.dev
X-Gm-Message-State: AOJu0YwD3EFzkzO+a1ZU/batVUiMSXryLd9yRjY27/7XiHzJT+mTokUd
	nFN7zbJilgTk7fzeb8BzGdq+syqdqqz/p/6wTs3Q3tTI2Z0/E9e1e9uDkN5fedkragLPNLGVwjP
	+FDZ7GI8Ue35QC/XqueP2mcuYfEPYa72pUGxCIGnE
X-Gm-Gg: Acq92OGkDeB+zUVN7BfVYdyIreM87Jt2Tjt8ZqpKbKqS6ewgwizT8EoSHyRhkapo3IT
	Cr+9Y0g8kZJrV85mOaKrRFasJAw7tuBWErWUjTPJyWEgRKkcWWLJFhFwyRBRfQYNKV7Pcj6XfoB
	bBSxPKPUk3aPM+IDfH8bWlz4ydE38YNPCdLd+aZAEakym1cQNdYvRHZHOOBEDqnanDB23d5TdmX
	0BXU/kUdYRsB6uJMt4w9PO844D+2pjNB2V5hc7AYxX2T+Y+DWKhGF9SjqKBeHrcTn4KqRJeFeh+
	MBj/4RuiNCe22iQbRp76/aEIYjmCkqLnsKUy0MYo+9QyhFm6049JSulcPR/fd4Bw4KvighnUPuv
	pK7un
X-Received: by 2002:a05:6102:2583:10b0:631:a34d:b671 with SMTP id
 ada2fe7eead31-673bf885fcfmr10043137.5.1779308751281; Wed, 20 May 2026
 13:25:51 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:25:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:25:50 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag3DawWCcrpCkD0e@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
 <CA+EHjTxvLU4XDPXDXYXXWJES1OFQgN8VTRLMgCCNMwBE6Hk8tQ@mail.gmail.com> <ag3DawWCcrpCkD0e@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 20 May 2026 13:25:50 -0700
X-Gm-Features: AVHnY4IBlIN9DzOr96NZ1ZZdFo1tnLv8pC5ZAKQh-hjUOng4U7q5IXabnxVwwpI
Message-ID: <CAEvNRgGHHkvfJ-mn9rfDvS+_1ht08YatFWo-Swt+5wFSPnC9Nw@mail.gmail.com>
Subject: Re: [PATCH v6 06/43] KVM: x86/mmu: Bug the VM if gmem attributes are
 queried to determine max mapping level
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

>
> [...snip...]
>
>> > @@ -3357,6 +3357,15 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>> >                 max_level = fault->max_level;
>> >                 is_private = fault->is_private;
>> >         } else {
>> > +               /*
>> > +                * Memory attributes cannot be obtained from guest_memfd while
>> > +                * the MMU lock is held.
>> > +                */
>> > +               if (KVM_BUG_ON(static_call_query(__kvm_get_memory_attributes) ==
>> > +                              kvm_gmem_get_memory_attributes, kvm)) {
>> > +                       return 0;
>> > +               }
>> > +
>>
>> This directly takes the address of kvm_gmem_get_memory_attributes,
>> which is only compiled if CONFIG_KVM_GUEST_MEMFD=y. This breaks
>> ARCH=i386.
>
> And this bleeds guest_memfd implementation details into places they don't belong.
> The right way to deal with this is to use lockdep_assert_not_held() in whatever
> code mustn't run with mmu_lock held.  E.g.
>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index c9f155c2dc5c..3bea9c1137ef 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -547,6 +547,9 @@ unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>         struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>         struct inode *inode;
>
> +       /* Comment goes here. */
> +       lockdep_assert_not_held(&kvm->mmu_lock);
> +
>         /*
>          * If this gfn has no associated memslot, there's no chance of the gfn
>          * being backed by private memory, since guest_memfd must be used for
>
> But I'm confused, because kvm_gmem_get_memory_attributes() doesn't actually take
> filemap_invalidate_lock(), so what exactly is the problem?
>

Ahh I can drop this patch now. kvm_gmem_get_memory_attributes() used to
take the filemap_invalidate_lock(), but after Liam pointed out that
the attributes maple tree should be using MT_FLAGS_USE_RCU, I stopped
taking filemap_invalidate_lock() and forgot to undo this.

I'll wait a bit for more reviews and then put out another revision
without this patch.

>> >                 max_level = PG_LEVEL_NUM;
>> >                 is_private = kvm_mem_is_private(kvm, gfn);
>> >         }
>> >
>> > --
>> > 2.54.0.563.g4f69b47b94-goog
>> >
>> >
