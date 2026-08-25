Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523730567F
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 04:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787631740; cv=pass; b=sLU2xNEZCNUpzVbmzXUiUeeqhUjfHOjl277KVkjPIFW2HMXuJzpT2KAdBTUA0IGqnSeJfaUtNJWVwvJUvIQ3YoHIXq0+c67iLxcxa9sbl3QixrMFntzWNbS0niqKZOixdXvEYL4huN7ZdysIbb+A9PpVVDwOr97eHVMozhqQxJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787631740; c=relaxed/simple;
	bh=5wurlj8MFbDvb5ZSMmaeAsrb3WsRNTwRnHS4VgII5LM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohN35dDyEW13Ba4+x3VxPSrcz0bp0/RjOYxBxjQj7KfxEdXa2m7TMpZMRI1/vPIxxmvY1rJ4o5uYSYV6ghpIy1kQxcY9vghlE9gB7a06KD5L8un68783U5BjD5dSCh1QaCMsgal6gTwUkpWU+ZOoRksiXeAT6NWMpHXirXs2g5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OK3vIB3S; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OK3vIB3S"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2559461a12.3
        for <linux-coco@lists.linux.dev>; Mon, 24 Aug 2026 21:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787631738; cv=none;
        d=google.com; s=arc-20260327;
        b=PeMjGVUXaB/UTXBLGGJCmy7FMACjEvUSat7AGSvqLy5B1ghE8MLPRNwSzzvhvM03ym
         g99xX4KPFWOJ+Da0MDkzYX2SDrwpAjx3T755WPbfDU2axHtzG6ekPnANwdy+r+tAQMPo
         SMauaitIHoNaLlA7FJVVHdqHDhNFiOUghBIinLAX6vy6tEZzsDet8movx1rIyZXjcxAu
         5B37gDfuaJ8F5Nudrpbta19OqUHJLQ/TzXw6XF7uEbiaNFoLAUCk9HJVmwmyoMXWthGF
         QuXbaz6jvf1iJDQEhHXzkf8/BysOI5Cz5lqO5NwCHnW4fpMceOTqhkfH8JZAhYpa0F9k
         dLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ii2UjzWdYQBWun6iRfgoLkq7AXK2AM7SF1lOo7W5lmk=;
        fh=MXQ2Mn9cLuRp5N6EJCPkojbRciQ4Id+lN5h+V1UEVYc=;
        b=agp3FFLzjluCFS2U6rd0ftPsMEi4gn5OOXRAHjeOfWgGsmX0312qXcz3hg3ismXZrG
         aV41jFjk1/Nk9JYi9Ca/YFoGR8uYj8JUs6E10ibsQf8TofmCgUa9M+qw9P1ij/mR4an4
         tibVFShKqHIZaaoROrpZFOpqjMAY7bu93FQOa/yRmCraoEhjRBqV6DeXtZO3wG9MCgHi
         QZvuuo4a8trHK4/tlmas8IaNKjo36VU+LudTMyPOoeJSDsOvKWIFtT2NFpwa8YteDI91
         dvjjSAuCC4Ac2JdFJ+4pvLXCHedyiZknl0VZtS20hZkDpfrBPPu9wezAdoHhmnY5105z
         8CYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787631738; x=1788236538; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ii2UjzWdYQBWun6iRfgoLkq7AXK2AM7SF1lOo7W5lmk=;
        b=OK3vIB3SB5YoNOCxeuGDr7dO6ajZF1UXJD92FzYtoLFQJ73ULonvmr+CYz2F83H24I
         aiLytZeW8IBVOQ93Fdz/khr7ZnwgxCfmNNqukngQaU8zILOkpIVRZ0hYSRXtDjSYouGS
         lGGUR+rCa42gm5Lw9tLjehQJauVzqQsyXsPQTFEmSJUwU4coSPtR4hJEER8EPsVw35/C
         anwyypWzIvgBAzxUvr1J4DISLM6qiKFox6onVbmiq/dOTScF0dH1C0RYwKHpklvXlNxZ
         0qIhD9w32jqoAW6OxcRUDcrJdqm0ugBefNgw5KAK5aQtvpgtqUwRATruhMKN8H2wJAlZ
         NLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787631738; x=1788236538;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ii2UjzWdYQBWun6iRfgoLkq7AXK2AM7SF1lOo7W5lmk=;
        b=PDfXCCtEuVhCf1FiS6ucgA/F8/uAKrK15+LlIqSTa3SmIKsnquRxJiuICYebsrKJYo
         OpV4zvEInHwYd9MlRTiR6U5NJ85ODSZrVyM8QkPy0aSiVb+2iyfUBl6bdsJMnC9W0DN+
         +f40ueMz+hATZhTWZ8+VVmrqFI/ugef2Pmr5gTg7cUnFnufR3SWf7zST9H2hkoLLqI1S
         ejyM0s29thnBh8sVd5upBO8Zb6zjOh7gRK0U8f9OMtYsbhcFFkAKmUEyERokt0G/SJMU
         NyApgIGVI8xp1ZWQbOTbZ/iTtTuY1shYGfK/+wwDZhiIhirP5y0CZKK9ThJMeSKizqDu
         NTZw==
X-Forwarded-Encrypted: i=1; AHgh+RqDvqBwxr4mz3VJcjWOqkkXpJV2fbtRQ4cFtUm7JjOT03goQmvcChT5FJeaeYqPUFrcusvi0GBPbdGK@lists.linux.dev
X-Gm-Message-State: AFuF++lmB0fcleN40j9LwIAMFXeg3Ff444w/DsC7lzDf9ESmMttn/ZTt
	A/C1WcJs3rKs8xyjKWJLaQkYnsI9iQZbCWYZ3t207WermHwW629xVoYc0y6113X07sOfGH84Jcd
	dqK/6v1YIJ2YjxqYhPUCw1bqTiTdU7MC/P5kueFPZ
X-Gm-Gg: AR+sD11HPyYqmQzMDFqlZ4rNwZ3ovFNnbw0jEydPpPVlTNyu4XItgKxwUIZF4FqYdsb
	/wksPaQDcwUaY1MZBIh7lmHhrheoavv1NM7sjVBDa+6cUm2N7/HrOfTCVPC9BOqQjGl5GijmB6g
	qfukgUJLZiuWDrcn+axfXKiAvvISTfmsoSI3mh/VfBJd4NFGZGdg4tXf45MI04+hl75YFHcZg5X
	CNk6/JjA1zTrsuuc/HuO2ubXKYa/oAWaygk7OyqJgKicUQlc53MUAFqyoBje39fcu82Uutz1Gtm
	l1Zhqo0sWd2g6UaKcGxj+jv/e3XRrrrcxtGJDl+lPQcKEZNDuAwfYs/QGDjo7WO1eTNRLfuIYPi
	iQRkoMvce1LeuYnB9WfsBt61EBMxdfM8=
X-Received: by 2002:a17:90b:37d0:b0:395:4de9:b30 with SMTP id
 98e67ed59e1d1-39646350ad2mr7583961a91.5.1787631737593; Mon, 24 Aug 2026
 21:22:17 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 21:22:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 21:22:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <54d1bd0e-c27a-4033-ab97-02cd9579a620@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com> <CAEvNRgGvxMus6pp=xuDYOumH3Ge4oi0=YKjTaFykFHwXuzRDwg@mail.gmail.com>
 <54d1bd0e-c27a-4033-ab97-02cd9579a620@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 21:22:15 -0700
X-Gm-Features: AcwNN1WQy8t54bcd0rpO36nvPxS3ceyAlSt6scpIWjMhQZqgzc7w7cgeUX3ASbs
Message-ID: <CAEvNRgFhjbgC9Ng1qviPx4oE=qihUwiBcsYOgJG3yOU-nLG1hQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/24/2026 10:45 PM, Ackerley Tng wrote:
>> Xiaoyao Li <xiaoyao.li@intel.com> writes:
>>
>>> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
>>>> From: Sean Christopherson <seanjc@google.com>
>>>>
>>>> Stub in global variable to enable in-place guest_memfd private<=>shared
>>>> memory conversion, which will eventually be exposed to userspace via a
>>>> module param, and wire up the __kvm_mem_is_private() static call to the
>>>> guest_memfd version when in-place conversion is enabled, i.e. when gmem is
>>>> the sole authority on private vs. shared memory.
>>>
>>> I find this patch changes the default memory type for a @gfn.
>>>
>>> - When memory attribute is tracked per-VM, the default memory type is
>>> always shared.
>>>
>>> - when gmem_in_place_conversion is true,
>>>     - if the @gfn has no memslot, or the memslot where the @gfn locates
>>>       doesn't have gmem bound, the default memory type is shared,
>>>     - otherwise, the default memory type is determined by the
>>>       GUEST_MEMFD_FLAG_INIT_SHARED flag.
>>>
>>> I think we should document this change.
>>>
>>
>> In a way it's not really a "change" since gmem_in_place_conversion is
>> set up as false in this patch.
>
> I agree. It is not this patch making the change but the patch allows
> gmem_in_place_conversion to be true.
>
>> When it is enabled in a later patch, another way to see it is that the
>> default remains "shared unless defined as private".
>>
>> Before:
>>
>> + no memslot, or memslot not bound to gmem => shared
>> + memory is shared unless VM ioctl used to make gfn private.
>>
>> After:
>>
>> + no memslot, or memslot not bound to gmem => still shared
>> + otherwise, ask gmem about status, which I think is already captured in
>>    the module param concept.
>>      + The very usage of gmem (without INIT_SHARED) is defining memory as
>>        private, I think that is already documented elsewhere when
>>        INIT_SHARED was introduced, that now the default is private.
>>
>> So in summary, I feel that this has already been documented in various
>> places. I'll also add the following in v11's "KVM: Let userspace disable
>> per-VM mem attributes, enable per-gmem attributes", in
>> Documentation/admin-guide/kernel-parameters.txt:
>>
>> 	kvm.gmem_in_place_conversion=
>> 			[KVM] Controls whether KVM enables in-place conversion
>> 			support for guest_memfd and tracks the private/shared
>> 			state of memory per guest_memfd instead of per VM.
>>
>> 			If enabled (the default), KVM enables the
>
> I think the default is disabled?
>

Ah. I'm thinking of the state in the way that we're deprecating
non-in-place-conversion. I'll drop "(the default)", since the default
depends on the CONFIG flag.

>> 			KVM_SET_MEMORY_ATTRIBUTES2 ioctl on guest_memfd file
>> 			descriptors and disables the legacy VM-scoped
>> 			KVM_SET_MEMORY_ATTRIBUTES ioctl for private memory state
>> 			tracking. Only the KVM_MEMORY_ATTRIBUTE_PRIVATE
>> 			attribute moves to per-guest_memfd tracking; other
>> 			attributes remain per-VM.
>>
>> 			This parameter toggles KVM's in-place conversion
>> 			capability support.
>
> I start to think that the term "in-place conversion" seems to read
> inaccurate. I think it is describing the shared/private conversion of a
> gfn, and in-place means when a gfn is converted between shared/private,
> the backend comes from the same gmem page, thus in-place. But KVM
> doesn't enforce the "in-place".
>
> If "in-place conversion" describes the shared/private conversion of a
> gmem page, then "in-place" is redundant because the conversion a
> specific gmem page is always in-place.
>

Hmm, a few people have raised something related to this
gmem_in_place_conversion module param's naming: Xiaoyao, Yan, David, and
Sean's response is generally that it is confusing, but can't find a
better way out. The main consideration around module param naming is
that it should be named for the benefit of the admin. We want some name
that admins can understand at a high level (for some definition of "high
level") what this does.

Do you have a proposal to resolve your concern, considering naming,
documentation, comments, code, etc?

>>                       Whether a VMM uses separate backends
>> 			or out-of-place memory management is determined by
>> 			userspace VMM design.
>>
>> 			Note, this parameter is only available when
>> 			CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y. When
>> 			CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not set, in-place
>> 			conversion is unconditionally enabled.
>>
>> 			Default is Y (on).
>
> I'm looking at the doc of KVM_SET_USER_MEMORY_REGION2, which reads
>
> # When mapping a gfn into the guest, KVM selects shared vs. private, i.e
> consumes
> # userspace_addr vs. guest_memfd, based on the gfn's
> KVM_MEMORY_ATTRIBUTE_PRIVATE
> # state.  At VM creation time, all memory is shared, i.e. the PRIVATE
> attribute
> # is '0' for all gfns.  Userspace can control whether memory is
> shared/private by
> # toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as
> needed.

I'm not sure how this snippet from the documentation connects with what
you'd like changed. Let me know your suggested changes across
naming/docs/comments/code to address your concern :)
