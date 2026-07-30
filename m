Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91923B776F
	for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785444161; cv=pass; b=JpnbeQgkmonRuqKwjo1QgrP2KjdeQAJ/X7Ftof9lZ0pnIuXsFUyPUXxLp5mDNCgArb+fRE1F1SfAfz5lw/rrj1owb/5przW3JWgl76FDJVoDHbYENS9sivMRWjDruwlrbdHLhD4Vu+vFw0aPpqLWJSlIgcm4kUbiTN/8Ej4wIds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785444161; c=relaxed/simple;
	bh=1jiZYsqBtrcmi7eIwfzyaU0PYhHwikLTB018QmEsrns=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rscvkEnAQutu0Wh/cr65K4/VhJ6Fq1+UVrX/cniAeuZKahKOEUytcSBSddUSZaOaxR0yOcQLywXr6KFYjDzML/Za2KQkMRVly341psoMvKijRFKQK7qrXmM/m+CRB2Ecz4chY5LEiAiiH1LBhNE844Br48/iSxxgkHIxvNeC0x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oGlMw4LA; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oGlMw4LA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38deea72eebso315755a91.1
        for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 13:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785444154; cv=none;
        d=google.com; s=arc-20260327;
        b=s87ChiRRw7iaIIguMG9wfZbGAmLTC1nLLbaPwjgW/SoUhwC4plwmgy4jMHQzSLafei
         zKHaLwAbr+5dIBJc9ow/BE6Pi5RcBuYlq4zlngk4dRkLrl/IOfsxnBc2+9FSg/n4dfwP
         92CeRaHVlq7yE23IwEoZDqYMWAlZnb3PKhQxgP9l5SGvhbLXDSvv/Py04zHU9KArMjgn
         uo1pWnAgR3jkKc9FP82h2tBShklzEEhw9xbGtgAKlObs+WQVy6FzSOaMbFaeYoaZzx5b
         CHv7mJqBlEwGchdVLP6fYH0WHCQNQIE8jlzYZEu3Tz7t4m3qDTv9ZJByRnz/KmgFgR75
         jjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=tzyXsfKQYVbe7kXvY8Z4tL4HbFmN3e4/nufnZYtx15c=;
        fh=ocq+ExwrCobhfBYKq7oBFcc0hcZAPGMLQSvQO49y1eE=;
        b=e9C84qCCqB5pbVkvdhGfFTCZcbcv6KeubqZbUA5C0hf34db3VTJh0hM6yksIUYUUfS
         2je4Ef5Rmi3lCYrJU0xiCnW1N2WHP8RbKIdGx7E+dOIQCHmYLSCjH0l7bltHn5k+u7va
         AF12Uq6COTWP/LGCpg2jTxli7KXf9aJOYPMifTG/9N8v8Ub+cgnm0JkPmBxI0KXdr4Ag
         HOp8l32z0hfMAtl8VZY8mF8Z1thv2Ln7dyJiGEfeJ18nZ+E1NoSXF2jv6F6iNIuwJMUd
         FuJRwrfCpYtRPVVbtSTU8hM9NIo94BQF1kvNfhlEmUpl4KS8LURZMQn3gD1utVgcSord
         7/pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785444154; x=1786048954; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzyXsfKQYVbe7kXvY8Z4tL4HbFmN3e4/nufnZYtx15c=;
        b=oGlMw4LAPjxk8LLZ3TsAd3ljkCj52jRbvZt1PYruXAlbfrQDv/JLXXrM2AS841dkYx
         qeZriFp0ZfV2HFK6fdh5TcToBUtv8w11Vg9UIy9DViNVIHd+P7wTWV0CX4ZMwcxukblU
         bnK0YFhyJrHU9rdZVxp5/HJA8K6j3wTuLE16xbtvHBKI9GI614U/enaKZMjU6a5bx2Nw
         AzpfgPQNUDIj41EDu4Afb+P/sPUBya5zxC5mmEboUh5x4rGEmO97KHKlO2Ep0hlgJSLj
         mYPPdLNiOboUekpUSHF+et8XfSTXjnqOwtWpnquy8+Rk+9Wx8Tu1WlmORXQ5lzbIhDgA
         VKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785444154; x=1786048954;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzyXsfKQYVbe7kXvY8Z4tL4HbFmN3e4/nufnZYtx15c=;
        b=GPpFHKLhtApg2kjzP2ZKuyk1wPUWehwtCv1pert/Ne3tz4lNuh2o+LDtt11T2CI+pr
         uXkhgsF65vUDg/kvFMiI7pJtaSrFJjIk1YCwleb8ZRFOjpfmqEUJNSt+GdWugaRZE6jD
         7v5+kT4o2lYT7RKQXajK1FZHHq1Tt+RHPKHNWvU+AUMHNBXx0n4eiUKeAxeJ+rxLEW18
         JD/ArMUzOS+5cjRoRu/3fQOuiQmoOl+5OOmcI60sg5Rxd7PVwCKhCI65sFSoB4LowOOV
         MmEAT1sGfyyKjG5s5n4mSmzzvMOVMacR+XyCPwuszpFkLDKi2e87bxu6JJJOMXIuCyHS
         r67g==
X-Forwarded-Encrypted: i=1; AHgh+Rps0+6KX2nZ5BsB8aXx2bD7F3cO5EcjgNMRbtCLyzZLan5aWlEvLxmqDCRafqrBe+y021MyUmJ3tkdo@lists.linux.dev
X-Gm-Message-State: AOJu0YzINpehbaPU9UFCayV71+htvRps/X4Q40G4hUaeEsaCKGKxFvXj
	qBKvRltrKcwCOEtJUvVYcVHjQbslEYU98EUdrYyH1ptvMqE8nVnoKZE4zGp8aQDgd1X1JFadBwb
	s8kvNpbBMoKBuSfvzOosK6DeIiTzc6in6XO2yYZ2s
X-Gm-Gg: AR+sD13Z8e+D3LdxoSicgy5fuqQMTdcuxM1JbEBxvg+ao4R2XuEwsHgLB1gJ3UoU8+c
	+Wg3yhfqHd28MAp1cdN0mwUB3/uwYVlnrz4lNp4+/U4ge8b5kgvR8+AqZIHbuXpO+3BtTQYTsTl
	bexECX2IKPo/JhziNKRhDDSjRteG2uK2WfCqaGG2jYundN+vUOEdxLVqlswnwFp/3btbyRBH+nr
	9kTNBL29T654gYFEVtQyxYj0wHFtMUIxCKzyol/ZDmgi/EZ58h27bBJmhZgX1O5PswP/vVN0WWx
	4q28XAzxMPfh+bEjZeyA0p4w1MqLdirlRwwZlOFbjCuMmgH75xVyQNgJXkgk/3/kB0XBCyQp4r5
	Njq+niFiljEjopHBt0LhXMUY3UMApxeu+NzY=
X-Received: by 2002:a17:90a:d88d:b0:36b:bec8:94c5 with SMTP id
 98e67ed59e1d1-38f9bd790e8mr3699903a91.10.1785444153113; Thu, 30 Jul 2026
 13:42:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:42:32 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:42:32 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <60d19013-d6d7-4eec-827a-2622e22cec98@intel.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-7-35f9aec2aed2@google.com> <60d19013-d6d7-4eec-827a-2622e22cec98@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 13:42:32 -0700
X-Gm-Features: AUfX_mz2wy3LvLLQqF5XvT23FybAB1M_PJOCVj4Bbwu3P1vsWolBi1Qny-gSolY
Message-ID: <CAEvNRgF0SxmoMtqq69tUih54A9K7j_wcMFRrq=r9w6TnAGAUQQ@mail.gmail.com>
Subject: Re: [PATCH v9 07/41] KVM: guest_memfd: Wire up core private/shared
 attribute interfaces
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 33c9830190e2e..89cf922232920 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -893,6 +893,27 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>>
>>   #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
>> +static bool kvm_range_is_private(struct file *file, pgoff_t index,
>> +				 size_t nr_pages, struct kvm *kvm, gfn_t gfn)
>> +{
>> +	struct inode *inode = file_inode(file);
>> +	pgoff_t last = index + nr_pages - 1;
>> +	struct maple_tree *mt;
>> +	void *entry;
>> +
>> +	if (!gmem_in_place_conversion)
>> +		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +
>> +	mt = &GMEM_I(inode)->attributes;
>> +	mt_for_each(mt, entry, index, last) {
>> +		if (kvm_gmem_interpret_entry(inode, entry) !=
>> +		    KVM_MEMORY_ATTRIBUTE_PRIVATE)
>> +			return false;
>> +	}
>> +	return true;
>> +}
>>
>>   static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>>   				struct file *file, gfn_t gfn, struct page *src_page,
>> @@ -913,9 +934,7 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>>
>>   	folio_unlock(folio);
>>
>> -	if (!kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + 1,
>> -						KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> -						KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
>> +	if (!kvm_range_is_private(file, index, 1, kvm, gfn)) {
>
> It's checking if a single gfn is private.
>

But with huge page support we'd need to check a range of gfns... I guess
there's the argument of not keeping complexity for the future, but in
this case it's undoing functionality for this series and probably adding
it back later.

> We can just use kvm_mem_is_private()? And it seems can be a separate patch.
>

Do you mean that this refactoring could be a separate patch? I could
refactor out kvm_range_is_private() in a separate patch, then put in the
mt_for_each() check in this patch together as part of all the rest of
the "wiring".

I considered that but it seemed like the refactoring was too small to
separate out into another patch when the mt_for_each() part is going to
be in this patch anyway.

Or, I could add an earlier patch to first replace the call to
kvm_range_has_vm_memory_attributes() with a call to check just 1 gfn,
then this wiring patch would be simpler.

Let me know what y'all think is best. Thanks!

>>   		ret = -EINVAL;
>>   		goto out_put_folio;
>>   	}
