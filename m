Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133803BFAEB
	for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 21:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001047; cv=pass; b=qNVtkOFyiWELOtXQHcWuKTIM6vaHgfqu5nsXhIBlcXBrwiBCDFHIYzDmFPKito+3aknOssbe9/cJ24Y1ULeRqtYC1eAmdvFkO2N4AoptSjVGsNZV5wy3nB8zKWwXyBKX3FX+63L/6VgkGv0KwUFD3JluI6csevcoNvvbGwyuOOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001047; c=relaxed/simple;
	bh=QAx+8stP7eWiwXcVtZ6oQcPc/yneHJUDQ532rBo3tmo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elxj+HKe3iSIYATD2r161GKWi1Qk8SjEtklIVdH/HFvtj9BafgU3rsrPd7nn+wT25cdZusUCJL1xge0KYR/8LwUEjN69NRn4cCS1ELNAwnxoQ32nx2m0jXAJSoPyHgIRMXo8W31RaADJyLt4/QilLQSe+c+lPoK05LAjEPCaX2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d3nEvwvY; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d3nEvwvY"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso4022410b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 17 Aug 2026 14:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787001045; cv=none;
        d=google.com; s=arc-20260327;
        b=ekTGQCEeFGrF1/+VsrfJx74fZWljSZsb5Pw+bx1GNRi3XUjR0ByCplggcWnWQQKnwH
         ky9ovhce2jpWWzqiuIvcx7g4Ej/ZJmDN6c70KXjfQoTgeS1Qha5Ylzlniv+YeUVouFdJ
         cO/ltF41rC6IxMQkKbTYTTjAw5AWwgNnKraqEjdMyI0PgUCuEws/ph+QYNU43rCsXeAI
         BH1Tcq9zcQe71SxU6KY6wN0JWFKSt5jsAB/2Hb4E66ZABmc0B37h61nbO6fCOBzdmn45
         vlsv5xXbbB2F20DjOG19dq1DGn0q1lRwANgZmZpF+Vn6AmCyOYelaRPDAsnAcJB8/E4J
         31vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fXsAYGWxJyVowLSo+okTw01FCA+GPEAZRUERjwSXi8s=;
        fh=Upct/Xi0zxsdzMPp3ePUPgCWP2mKDowwMQMe1neJ6oA=;
        b=mws7r5GYEIG1Coqa/dGZPOIHQmrL6fKEGaoTtBB8RZOI/NqcmagO2TD/Na4THk9dir
         aDoqeBBqyzQxG1cpho17JtiHyY3hiopWx4xfX8OSuR71hhfCsLy01sjt//F0yDOugGwO
         dAZtBRSmJcd9l+E+WyEcq2eWo9hmEld8jFxFsk1n10Jo+OAuIrGOMBwbCBxlFjfZ4DtA
         xFw2U89DnUKT0JTL2MskR/DvikB1krvB8WryMy96e1Mkp3kHg8NVXFUPf5g9z0rJo9b+
         RFPCZhH4eDdh+JBd5WawGaAwugtP6em1J/6MeMw5JJsKQUEnQvuDqmYuU4eLecn+EoA4
         DxAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787001045; x=1787605845; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXsAYGWxJyVowLSo+okTw01FCA+GPEAZRUERjwSXi8s=;
        b=d3nEvwvY4KvXNsgw8Pud2KLljy5AIh38+Ots93K/fiDw+b8h7+/W5/TzcLcUz1lyGc
         Q30cDWWKs6tuDD6iC8JES+7Dtob24TnzZ+yuqTgnUjs38rrtqELhL58GrAAvP4ptpsx/
         73rV96Vo4RID25e9UkbHSfa7JKuU5zwwtgbf/2gsDGKzqw7EZZsLiXYZxFciK4RX/qkz
         WZK5RZXigbCy+tx2yuR17Dy/2JbbBDRrYxrRMtooZpX/bTFYSO2Ta3k8OnqRZiReNrkl
         6QJuhC0tMvR+krmt/GfZpxfdGVt97zQea/+8lOVJqJb33hPgLEZzQ/hMeoF51r9TrCex
         s5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001045; x=1787605845;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXsAYGWxJyVowLSo+okTw01FCA+GPEAZRUERjwSXi8s=;
        b=aRwT0/V8jpciHe1BqTsUQx0NhP/zURbDNAksIAAnCVCKi8aqYXmypxvOiFpMjyyZ0x
         IJpO4Wy90hCYA3F92/xsK4NkF2NRLPtdhdH7jRJ3KflA0cYpC8yghDoTendkxckBgxnC
         hHOwzLbg8DF8CfINKWUIcQUzz8GDkWPj2oX05yqigbD0s3gZaS9yScPf6Ddjvanur7M3
         IPU4gxfLWPe1AI09Ty7Nh8Wea8IeujJsXgivVhZb/PptmsrMVDtvs/gI91vo4AJXy5kb
         JbLM1Q07wGAQmcsqLPazl8Wego171xPnQJGaUMkGM9oCjQCcwiKUtXWGbXIWGn7knjUX
         FwTg==
X-Forwarded-Encrypted: i=1; AHgh+RqDByOaFLjFa8rwh1BYPA4ThKNCPciZr3XYPzgISiYz7SQcb5gOGO/j7BmPP66xhbzInFsJdU0NZj1S@lists.linux.dev
X-Gm-Message-State: AOJu0YzSYTkeD5F6qSMPQMJJashENa4HAqckKQOp047i+g1toxh4qUb0
	ge1OfGhTg8maeCm2gS/q+O6TcqopYitmnb7+Bg3iR4lHIHKzm7npToL5O3BDiV6OfDeygHepfDr
	RlORcg8SdEio56dp/N4PbUaGsC94P/jxL3lYkNgHv
X-Gm-Gg: AR+sD13ePxho7BoCEj4YTiSPdUlT8goEv4EhrkvxdBIGgIac0z5kCU0YUnP8MaPgCBX
	sTzpySobXt+OZ/6yiyJGGhHrTuLs4HS/lSwcRnw99qhlBco/RGUMZ9UuvrzVybKnpSFBFxEvVr7
	2So+CjkrVI4fkLbtShjaGftjf+PCH5ppURTI/qMwfUjkb15i7wX9HHLBj5Gcjj3LRYpt5HLCDfK
	9eY3e3LRojmQ9QVzWRAcB90ZQ11BGn7EVZ8L73Oq57WOblJ8emo8EBqfSeq6XWJ6IzFsBdQg3yP
	Xrx3+Bzd9RoK4vZvMIesuiS7OnLYIBfiZCeVo92sHYvbTYLfa1G8e08vXj4oyC1K4y9Mgi/5qQd
	uxg==
X-Received: by 2002:a05:6a21:3398:b0:3bc:5284:5445 with SMTP id
 adf61e73a8af0-3cc71d53eacmr29096172637.21.1787001044531; Mon, 17 Aug 2026
 14:10:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 14:10:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 14:10:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aoNlZRb5SV7hyNuk@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-12-2fc18ee6d3ba@google.com>
 <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com> <an3o4h-E8mj6CUaM@google.com>
 <CAEvNRgGpCVCGVjc9jCt9Yr+XypF=71h6eBahkXNkrXhfrtGY+g@mail.gmail.com>
 <an5AcEG9mqDgnBYk@google.com> <CAEvNRgE+05c9U8C=Zkm1S9hLw3Lw6YMmijZhEe7J4rYQAuNyEw@mail.gmail.com>
 <an8umm0qisEidt4n@google.com> <CAEvNRgFNCDDSeuvbwj7pD_d18o1TBXo4TNR2dXHxpm18KPfR5A@mail.gmail.com>
 <aoNlZRb5SV7hyNuk@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 14:10:41 -0700
X-Gm-Features: AcwNN1XkDnEKM5GNqm9LOem-ACT2KBKH21AQXps-0CKMqEJi94nO9ANnicdLg5A
Message-ID: <CAEvNRgEojt8Kpot9VaFUyVbVH5QVEdW-TgQUbVnpVCNzFtdVag@mail.gmail.com>
Subject: Re: [PATCH v10 12/41] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
To: Sean Christopherson <seanjc@google.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Sun, Aug 16, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>> > On Thu, Aug 13, 2026, Ackerley Tng wrote:
>> >> Sean Christopherson <seanjc@google.com> writes:
>> >> > That's why I think it's worth analyzing the cost: if it's in the
>> >> > noise, leave it alone.  If it's meaningful, figure out a not-too-gross way to skip
>> >> > the entire thing if kvm_arch_gmem_make_shared() is a glorified nop in the end.
>> >>
>> >> Is noise defined relative to the entire conversion process? Would this
>> >> benchmark look like
>> >>
>> >> 1. Convert 4G to shared on TDX with CONFIG_AMD_SEV defined
>> >> 2. Convert 4G to shared on TDX without CONFIG_AMD_SEV defined
>> >>
>> >> and then compare the difference in time taken?
>> >
>> > That'd work, though I was envisioning something even simpler: use rdtsc() to
>> > count the cycles it takes to iterate over various ranges of memory.  Do whatever
>> > is easiest for you though.
>>
>> I made some changes to add rdtsc() for the conversion process as Sean
>> suggested [1], and exercised conversion like this [2]:
>>
>> 1. Initialize some memory as private
>> 2. Get the guest to fault them into Secure EPTs
>> 3. Converts the memory to shared <<== this is being benchmarked
>> 4. Converts memory back to private
>>
>> I made it build the VM once and convert 5 times:
>>
>> ./gmem_benchmark_tdx_convert --iterations=5 --size=1g
>
> ...
>
>> And here's the above, tabulated:
>>
>>   nr_pages      make_shared            total    percentage
>> ----------  ---------------  ---------------  ------------
>>          1              930            39278       2.3677%
>>          1              252            28060       0.8981%
>>          1              176            26952       0.6530%
>>          1              176            27038       0.6509%
>>          1              176            26980       0.6523%
>>          1             1072            37236       2.8789%
>>          1              316            28338       1.1151%
>>          1              176            27182       0.6475%
>>          1              176            26972       0.6525%
>>          1              176            26886       0.6546%
>>     262144         15041018       6616067680       0.2273%
>>     262144         14937462       6608542680       0.2260%
>>     262144         15138858       6599494898       0.2294%
>>     262144         15721972       6610219850       0.2378%
>>     262144         15000406       6615114540       0.2268%
>>    1048576         61902982      26400884028       0.2345%
>>    1048576         61746114      26401170984       0.2339%
>>    1048576         61096794      26404409058       0.2314%
>>    1048576         61446290      26447461896       0.2323%
>>    1048576         61774646      26444608360       0.2336%
>>
>> Looks to me it is within noise.
>>
>> I also actually tried measuring the conversion time from userspace with
>> CONFIG_AMD_SEV enabled and disabled. Converting a 1G-sized TD was faster
>> by 0.2%, which is in line with the above table. Interestingly, when
>> converting a 4G-sized TD, skipping kvm_gmem_make_shared() was _slower_
>> over 2 runs. I don't have an explanation for that.
>
> Might be some cache/memory locality benefits?  Though with a conversion that big,
> it could also be nothing more than bad luck.
>
>> I think the code was correct. (If it makes a difference, I skipped
>> kvm_gmem_make_shared() using a custom guest_memfd creation time flag and
>> skipped make_shared if the flag was set on the inode.)
>>
>> I thought adding a kvm_arch_has_gmem_make_shared(), defaulting it to
>
> I would do kvm_arch_has_gmem_convert() for consistency with the Kconfigs, and
> because the cost of the reclaim invocation is a non-issue.
>
>> false for all archs and having x86 override with
>> !!kvm_x86_ops.gmem_make_shared is not too bad either:
>> + doesn't leak anything, since the function being called is
>>   kvm_arch_gmem_make_shared and the accompanying function is
>>   kvm_arch_has_gmem_make_shared. Or maybe just a little, since all the
>>   other ops don't have the accompanying _has_ function
>> + it's a kernel-internal thing
>> + not too many lines of code, not too complex
>
> It also provides a good excuse to kill off the #idfefs in guest_memfd.c.
> Compile tested only, but I'm thinking this?
>
> From: Sean Christopherson <seanjc@google.com>
> Date: Mon, 17 Aug 2026 12:31:50 -0700
> Subject: [PATCH] KVM: guest_memfd: Optimize away conversion overheads via
>  dead-code elimination
>
> Add and use kvm_arch_has_gmem_convert() to guard guest_memfd's invocation
> of arch hooks related to converting memory between private and shared, as
> only one half of the x86 CoCo duo needs the runtime hooks (any pre-work is
> pure overhead for TDX).  At this exact moment, the overhead is negligible,
> but that will change when in-place conversion comes along, at which point
> to-shared conversions will "need" to find all affected folios prior to
> calling into arch code.  In quotes because very technically that work could
> be pushed to arch code, but that would bleed guest_memfd details into arch
> code and would be far worse than adding yet another kvm_arch_has... hook.
>
> Opportunistically provide the kvm_arch_gmem_make_private() declaration, and
> rely on dead-code elimination to eliminate the call to non-existent code
> when CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT=n.
>
> Reported-by: Binbin Wu <binbin.wu@linux.intel.com>
> Closes: https://lore.kernel.org/all/1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com
> Suggested-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 3 +++
>  include/linux/kvm_host.h        | 3 ++-
>  virt/kvm/guest_memfd.c          | 5 ++---
>  3 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 283847619ff8..5d5a7723abb6 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1854,6 +1854,9 @@ enum kvm_intr_type {
>  #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
>  #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
>  #endif
> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
> +#define kvm_arch_has_gmem_convert() (!!kvm_x86_ops.gmem_make_private)
> +#endif
>
>  #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 03bfc92864b6..e824ba59c60c 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2599,9 +2599,10 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_GUEST_MEMFD */
>
> -#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>  int kvm_arch_gmem_make_private(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  			       kvm_pfn_t nr_pages);
> +#ifndef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
> +#define kvm_arch_has_gmem_convert() false
>  #endif
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b596486d184c..39d94938b5f6 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -773,11 +773,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  		folio_mark_uptodate(folio);
>  	}
>
> -#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
> -	if (kvm_gmem_is_private_mem(file_inode(file), index))
> +	if (kvm_arch_has_gmem_convert() &&
> +	    kvm_gmem_is_private_mem(file_inode(file), index))
>  		r = kvm_arch_gmem_make_private(kvm, gfn, *pfn,
>  					       (kvm_pfn_t)1 << *max_order);
> -#endif
>
>  	folio_unlock(folio);
>
>
> base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
> --

I'll inserted this as the first patch for v11.

Then, the later patch "Call arch make_shared callback for to-shared
conversion" is now:

	if (!to_private && kvm_arch_has_gmem_convert())
		kvm_gmem_make_shared(inode, start, end);

kvm_gmem_make_shared()'s definition is still guarded by #ifdef
CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT, and there's still a stub for
kvm_gmem_make_shared() since kvm_gmem_make_shared() is defined and used
in the same file and the optimizing out only happens later.
