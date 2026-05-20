Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D5F395D8F
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779313458; cv=pass; b=eqbcpGLGHOhGu1DvkBBcSbJ+4Qwcv87z7nCPQxKxgS9cM9PAAfzFDBcqwzzuU8LW7PM2rFv62HfyFe5oQADXPPg6M6MnohAVzObL2uYhzJI7ZaHku/YPC/NqVa4DNdIAnP8Km0fCWqJmJee8ZGlmflbXmt05CI1yBL5x3qYeJ5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779313458; c=relaxed/simple;
	bh=5vwh4tcfC1LD9NZjL0ZwGpI66Tl15UeToPVcfgSGyVE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4gSJ65/MzO/I3Vcg7mjStZL3lzp+y++UEzcGQr98DhJQDbbtFxcajmqI68KhHIeAZ/0Q27ELUt6CRWnYR0EsJozY3nnxUBTq+2+pDNoVk1pPIlESkJCNPFSGhatgOJWVsbfs6dfRJIQ2mQdV9bjIKT2wjg4tQ+4DVhmw3e6ytE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xh/mtOHl; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xh/mtOHl"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95f61c1ace0so3345967241.2
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 14:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779313455; cv=none;
        d=google.com; s=arc-20240605;
        b=SVz9DiM/xCE9j1P3dM9IGU6ZWKcs3Wh0968Mh/CkgRaPCvN47VHrDjqhkEzwqaRpp4
         7IxlSf7ZTqn5IRu1Ce29yl7igxbISi0L6P0tdq+ye4JHJmXAwLa/6NJeJPS8e5BNhytB
         SjyBtKCwgbiliySHpOZ+H7bE1Apl6ZRofoakss4yhG9yKfdBgXkJZAY47EiND3fx3EKe
         5nz2Tg/1OQjiZNmqBKoo/f2JOnWjMkuLQ9r0/I+LzGq9VN7K/frq7rFycBVcfGt92kM/
         S3nsMU9UBSWd4lXMI6VK5YckzQ0NlRid9tm5Me36zxYKQVLddLHLY409t1uin4ihBUDb
         uCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lzeZHICde6LC2KLtrV1UyrIn4vikEEbCZhRCg7feJeA=;
        fh=E/QnW1WXISzRX8OhVSTfK5aeFH8YqwdFkSy209E+Itw=;
        b=GgsSy/eHpWG32J6DaWPP3h/F6846bp0Y6W8Kb8kwbIXkqfPIvqrDTyDDwOhbWrKXLD
         XH4qIec1ALxBdOHZPhnaqyXBGTKTCyEZS0sejaw4yxkfkPU2swd1MUjp21JRZ/Kf807E
         mT+9QrAI2AVLRMh8KGXLU3ct2dWgsthigeQkyKvbZ8aDE4edQ5Fd6kP4RAL2/hlZYA8R
         4BG1H6wNevpueYqo/F4SjTqtzf4+hkUHcLQhqtJaj9WR+4PSR4prwMDUxUdvuYaIku1M
         nnHpt181seG5Xb67xOq2qeLQTzucfAUrQHE0YSz7F1nFXSjRnFzotvlIOLzMy0ceYIqr
         ujNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779313455; x=1779918255; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzeZHICde6LC2KLtrV1UyrIn4vikEEbCZhRCg7feJeA=;
        b=Xh/mtOHlP9I9TW15uECmk1Qb5znZQ46W5PwJAI1VeLqhOt+5Sa+ED9XY5vBp41jUYb
         iK3aELIbUJHXThfqSH0xhs60FE/RI98VkeeMcA2q8/rYh3pheRkWDxFm6Kw5X8Cb+b/P
         FQBuQLSzanv4/+i0KmFcDXOGoZwzZKF3tzjTzF+IA/YjyCLHfpcTDkgFkAP9t0QAGa5S
         GnSER8TFTj0jG28dwBVuEruKNWeiZ2OcGUu7SAIdFAWdS2tO6NewNszNdhcwDVAmNfs7
         s3R2Kvs7qhml++bHeHes0OEAPXnmcErTyt1y48nRn4+X8OWVBs7p43FrZ0Qp+Wjz1a3v
         raaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779313455; x=1779918255;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzeZHICde6LC2KLtrV1UyrIn4vikEEbCZhRCg7feJeA=;
        b=YJRlSbL13sJpFT6mM50j9/bPgWfwoQtzQZXtBYxU1I0ZjLO9vSVItxQnJPF5QVp3/f
         AAd5Z+PkZRtV5i7PsvRIYRbmNdRRe6Gn63iK+IvAzmzob5FtZH2pSS0tqxm1O9ATxGxd
         0IdEsFZ4/zpuZ86WQKd+jbezC8IqpJES1OVtRqkxQWTkdx9ZcIjuW6rap17jcBqm4bEj
         x3yWKAI8/S4bhWzoMa94KT3IauJbZdGTNIG5bczLG6SUaj/vqh3U7FuZB6QIW5wnl8Wl
         UeCIL0jTu5m7Eg1w33kbdybRCkz+nYA+ndzNze9qThqISHwtPjiY0XpWXdzNMYZLA1xD
         ce6w==
X-Forwarded-Encrypted: i=1; AFNElJ+0MKJTueyWP43IeaESE8ENlT4+poomirIYhFeVMnRKu2gqldbO834RerEYei2LU9zazX5I4LtYOlde@lists.linux.dev
X-Gm-Message-State: AOJu0YwXbwgYTuRz/tkx+sRQh6MG75tIYSSndBJmJWq4oqULtVeD9/l1
	YgWK3k4nZUV3++Dmtas9FpGb4itlgPUig0dLtCtnkjHO8gBIsbXmYqXf1LL+YfSLYEFUgGHon2k
	0hyH0i5jC7dWw64JNOTHAeAzaXVfWeCdHocnGfUr+
X-Gm-Gg: Acq92OEJS+UxiKXVfd8ZhOlPqu9JVDmxwDIkONu1c/mK0NfD7Zl1mm+2NF7ra+WznDt
	8fAeo/U2h7NdzIQxpqx6Uqv68bz17ma4eL/FZ5Gk0Ah+YQP+RwUj77yTTOtoe7dfva/xH/Ct7jJ
	o4QEeueamFrTSKfgYr4SQbqbB+6hVnvHgZgZx9HSbZx+Q0CXz9LelZnGh4YHn9YKul4wAsFNbnw
	e7p08UtpERq+jJ8tWKJjcDK5GYLaRmW8Tbdz13p02FfPy2GSTkwBdOzG4UZNUZGiPLHSZaswk7C
	6rKr1s/UOmfcQSYgte5krt5RU6lOWycIdd+P27giCljt0BSUzjubnGhUxB82j9MRGc5wfeuzbDK
	uM0uP
X-Received: by 2002:a05:6102:32ca:b0:631:8665:3510 with SMTP id
 ada2fe7eead31-6739e54982dmr235113137.31.1779313454629; Wed, 20 May 2026
 14:44:14 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 14:44:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 14:44:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com> <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 20 May 2026 14:44:13 -0700
X-Gm-Features: AVHnY4KMeQgcJsvqoO4sP8lu-TRiPVeIaM4bWX0cqtV0EsssjCZBV_2_Gq2a7HM
Message-ID: <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Fuad Tabba <tabba@google.com>
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

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>> +{
>> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>> +       struct inode *inode;
>> +
>> +       /*
>> +        * If this gfn has no associated memslot, there's no chance of the gfn
>> +        * being backed by private memory, since guest_memfd must be used for
>> +        * private memory, and guest_memfd must be associated with some memslot.
>> +        */
>> +       if (!slot)
>> +               return 0;
>> +
>> +       CLASS(gmem_get_file, file)(slot);
>> +       if (!file)
>> +               return 0;
>> +
>> +       inode = file_inode(file);
>> +
>> +       /*
>> +        * Rely on the maple tree's internal RCU lock to ensure a
>> +        * stable result. This result can become stale as soon as the
>> +        * lock is dropped, so the caller _must_ still protect
>> +        * consumption of private vs. shared by checking
>> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
>> +        * against ongoing attribute updates.
>> +        */
>> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
>> +}
>
> Doesn't this imply that all consumers of kvm_mem_is_private() should
> validate the result using mmu_lock and the invalidation sequence?

Let me know how I can improve the comment.

I think the "consumption" of private vs shared here actually means
something like "don't commit a page being faulted into page tables based
on the result of kvm_gmem_get_memory_attributes() without checking
kvm->mmu_invalidate_in_progress.", since a racing conversion may
complete before you commit.

kvm_mem_is_private() is used from these places:

1. Fault handling in KVM, like page_fault_can_be_fast(),
   kvm_mmu_faultin_pfn(), kvm_mmu_page_fault(): this already handles the
   entire mmu_lock and invalidation dance. No fault will be committed if
   a racing conversion happened after kvm_mem_is_private() but before
   the commit.

2. kvm_mmu_max_mapping_level() from recovering huge pages after
   disabling dirty logging: Other than that it can't be used with
   guest_memfd now since dirty logging can't be used with guest_memfd
   and guest_memfd memslots are not updatable, this holds mmu_lock
   throughout until the huge page recovery is done. invalidate_begin
   also involves zapping the pages in the range, so if the order of
   events is

   | Thread A                     | Thread B          |
   |------------------------------|-------------------|
   | invalidate_begin + zap       |                   |
   | update attributes maple_tree | recover huge page |
   | invalidate_end               |                   |

   Then recovering will never see the zapped pages, nothing to
   recover, no kvm_mem_is_private() lookup.

3. kvm_arch_vcpu_pre_fault_memory()

   This eventually calls kvm_tdp_mmu_page_fault(), which checks
   is_page_fault_stale(), so it does check before committing.

Were there any other calls I missed?

> sev_handle_rmp_fault() calls kvm_mem_is_private() without holding
> mmu_lock and without any retry mechanism. Is that a problem?
>

Sean already replied on your actual question separately :)

> Cheers,
> /fuad
>
>
>>
>> [...snip...]
>>
