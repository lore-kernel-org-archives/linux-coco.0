Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE02738C401
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333855; cv=pass; b=jqZqz1JE6Ey9a2Z52DyXv5u5QFTZeG3iL80eOmX2dQgKFzi522TGLz1cyP0fkrFAgOBvipPlaabCGfs7agG2jyeH7siGG5cSJrRjBKTBWLhA9Y/MQc+MNhFEZMFijcFBcr0tHpjJsktySeCNUQmiQS11MxFnYr5AcXNl8WCjL4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333855; c=relaxed/simple;
	bh=QyhcqbadZWN+AG6WcwYfzT9ILGIvGzGDjWcEDHa8YsM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2ZmTN96EQh+J7woIXXgJZUGeZHlxrwm15y3H2+mkPBsuBmJx7AxhYvp5K7vgn0hMEf4FTSeLbr6gWjUkTDkYdzqTH4DjX11zJrmEat7L1FFqiF7mE9Bg8j/nW51ZYZxXu0vtIH1u9+avzvupgN4GxZSZhmbMnml1RhmNzvI0K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ag7F8Lzw; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ag7F8Lzw"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13986d61b4eso593271c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 13:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782333852; cv=none;
        d=google.com; s=arc-20240605;
        b=jjDk0bMwB8UjDmEF5TWGsLqpNaOMdnY32qvjmNJ7tOtXI/QkD5QKXxo1l0sPsSuOkQ
         mNTlimUHIMnL9bdrkDxyaZXzadVtnSyMtIxLpmJ1A5Victw050icIJgdr+iZRn3YIkf0
         6XCtkEWvRpHl+tPH2a8SHkVgBsO/ut+Y44Wi9TUkREb521ZKz/AAR6Hw2Fut/Hw84/Hj
         9ymqmS4sgYbtmu+iYrWe76ZpxDl/DLr8pDlgjMELNKoI+QAJ/X/0PQ0ehLzWOSxK3nqo
         40/7DHoorkUKRV3MjMymSdw1vBKupxrKHa2VmW0NUOehvtfdZ1ysXtZkZCxvK9inq3nR
         7tAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        fh=YwfWIF1d0RrUyDOdDUKOlQQAYge77ulQXZ9e79xpGUE=;
        b=IKENkH5D1wROLZDm8KNfU8+30LP7tWveKtSpdWnLgFrTv8sRh9a0zdCe63k8ZrzNr7
         kG0Aecn8iCNMabj/8Bu1rMgkMrZ9FmxWCh7sezK7NIjNkIdXUuRn8JwFuK0iGNTG4bSn
         yVeC3/9uXzmHkUnYB+O92zbL/3M+BCKeITeD7qzNT2oSTsn/DQNuSYETCag3B+bZz2Bt
         r46f4BMNj32oYJHORh0oWdP+Sd1qFC8QMbO/f6BgbFbT31hyFhHTg7hLhEg53FsZkuKz
         cV4+fveHC7+buY7iLMvuCQg1MmjXubTe2XStHDBrO8Ne6FQqgx0imVB3V9N9g8OLWSSg
         I92g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782333852; x=1782938652; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        b=ag7F8LzwxQFCynWOlsk+JQoyNN/mLmKnYABntP0wJT0Z3qRHaYY78IHQFFD57o1alQ
         KWFvwYwVvwMipGTiDc6N4rywxH+NZ1t3i0lWYbI/EYGAcqmWxwgfJRj6xCzn6xY5YLe/
         N/gNCVZ8mKOmzbgJ/xlwuvbpDrY8U6rYiJsfGkG27y2oAaRU9//xiTVDf9F3VOfrMi63
         jlIyDF2lM9HUn/C0BWon+e6vfmUvQwr/92tag1H33remvn4+dJbmq4E2SPrjGX+5rQa6
         s7w62y79k0sfH/Ot5L0+7Q46JGbJCDcS+75bkcYt2CKNrIXebhV1AgkqEkI48uFTJdmv
         o+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782333852; x=1782938652;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        b=Fl7s+jnFDU6A/ntPgeoScdtqDcg2tJlAD3z/NRTgYnruZXqfVXz6aW6t0kKQl/BZyM
         Ei9VRxEFjC8Re2T3uw23DzjgItmnM/D7Rr4OIzgs9LnJT6n0Uxm2NOz9hGP+KnNY+qTd
         R546xIiOyhnRzBRaX61WedSQh8x+yWDSUnnySHHZ+I0K4ArUO8l9pg5zr4HAZqdGYZyW
         ZWTby6CUwCQO6JI6sl+q9abrDG0AEtXaj+PFV3RSLFHXf4rRV+drqJsOvIaeF4C5x9kC
         da+P9nvmD7IrsFq5AH3yojwomLQM2ZptdiH8RrMlOmKlptU9PT9z2LAgHfolYShzd3xw
         OeOw==
X-Forwarded-Encrypted: i=1; AFNElJ964ayd4z8otVPSJ6qJDOLp8vyIEFO+tsQXvm71I4QPWNqNvY12jnZmS0sozDZ314x5b3vCjA0kveb1@lists.linux.dev
X-Gm-Message-State: AOJu0Yws4YBX23Pqd+zYdp8+6xKfM6ztGfT9o5/qA3bk49Vu50sWEYC0
	HrsXq+Az6xr9zrkGgvc830l39ZB2L+tXUawOrvJv3bmpuJQbMouT7hXIu04n6fuecX0I0bETiJv
	KAD5m9gt1eoGcvapiGu2DSa5x3f5aDS2nG9rufghx
X-Gm-Gg: AfdE7cmiZBOBgZzx0WjAc0ltLwe8TOXlM0aq0VL0i2XcVQIbKnNXyaBb+JGEQbMJQZU
	JFjwVkseRNjXg1P+m9vqJS3pccqjhck5x7boRlEEw2l2EgTdpDM4TDthU9uWrd4kSnxsdbQ8fBY
	GipeYyr7trzKfe55eqrUVyjfGsFGKKLkIqjQZgOkfEGR5LEsPLvIYNd8tkt3pBKsSs+nrzNJHkj
	79OgeuaOBxj6DV+jstaofgVg0GJrVj4S2TsZcl9FnFfYT8IAbpkgQVyLjzUx+W41joZ4a07IR4r
	1vd5/ggz5ALC4yz7TiQSSiYxDh3OAaDF5WS32QRwbka0I3Ok+hyGeUXrmKI=
X-Received: by 2002:a05:7022:e995:b0:137:eda3:e5a9 with SMTP id
 a92af1059eb24-139ad711637mr14297421c88.28.1782333850616; Wed, 24 Jun 2026
 13:44:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 13:44:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 13:44:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <2ef455c3-a3f5-4ba1-86ea-b96416d163ce@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-10-9d2959357853@google.com> <2ef455c3-a3f5-4ba1-86ea-b96416d163ce@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 13:44:09 -0700
X-Gm-Features: AVVi8Cc-v85YTGgbOrOpBNr09aOMCIpUVvlduJvADSpw08YaAcwUxrqW73F-Zbs
Message-ID: <CAEvNRgFYpTAi+F8iF_m3mQnP_hB+DWN1oTnhEQ5WWxduX2D5MQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/46] KVM: guest_memfd: Wire up core private/shared
 attribute interfaces
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
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

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>
> [...]
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index bca912db5be6e..e0e544ef47d69 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -926,6 +926,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>>
>>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
>> +static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
>> +				      size_t nr_pages, struct kvm *kvm, gfn_t gfn)
>> +{
>> +	struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
>> +	pgoff_t end = index + nr_pages - 1;
>> +	void *entry;
>> +
>> +	if (!gmem_in_place_conversion)
>> +		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +
>> +	mt_for_each(mt, entry, index, end) {
>> +		if (xa_to_value(entry) != KVM_MEMORY_ATTRIBUTE_PRIVATE)
>> +			return false;
>> +	}
>
> Patch 1 noted that "Ensuring every index is represented in the maple tree at all times".
> So I think the queried range should not be a hole in the maple tree.
> However, there is a inconsistency: in patch 1 kvm_gmem_get_attributes() explicitly
> checks for holes, but this patch does not.
>
>> +	return true;
>> +}
>>

With Sean's suggestion for patch 1, I'll update this one to default to
the "init" state if xa_to_value(entry) is NULL.

Thanks!
