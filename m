Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8DD42589C
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667609; cv=pass; b=V585DX0fjLb5NwDdQJd8OdiNKX6YWWCIldRmI7sa2Vf2iutP9HP1ddnFuFA55Jo/cHdNAa4CXZgmopTihPV7HlHK7OsA+MjveFIw6DUmM+VIXLsf/e31HPXkhFACfkFsOV70PknCUBCPUSQawVWaoaH+t2rPhmhj429RuVoUlnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667609; c=relaxed/simple;
	bh=2ZRWAWAxzrX6845mpmgaNcKHNz38OJ7/zMOFY8iInqY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0OG5j7oprPX51rjkD+tKmWJukeUkGzPj3Ms7jdR0YMv/sF6Z/v/10DiZHOawhkQvyROb/w+Bn0KNfLsHJo6jusbD0iv90wdLbUOrIm92yCr3rq5qNN+/n1UINnQgxJzRZZneLBvLC8B2z6qQHqWTgHwktgPA/oK6hipebVFiBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kl6Ipk2t; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kl6Ipk2t"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90c776f6c13so43001086d6.1
        for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 07:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787667606; cv=none;
        d=google.com; s=arc-20260327;
        b=a2nW9ond7Y94PRUmTj/FJyncXwgGI+MYqj5SopgVvkMHmG9nDYUVEoCUWroQrVJN9N
         5LsIpb61LJ/IWs9ROuu5HsKpxziQmP7fmTJJWTkanbI7vOFuarxO7dp4xLSKBCN+iU5u
         a7o4Lm3DNpOQzQzotE/eFqBgA+j8XwSVWkdwxYZ1gL6i01cNJKYukPqHKd724SvskB2V
         XXaA0GtxZ2Roc1N1afQAUPpOu9gPNa5YwR03BJOfv3NdsoLl3bvMXvIKsrkTzwqlE0QA
         5waDhkg92oD/OhiShsOWxI6P9JYZAJX1p4iUlURleiXat5X1eShCMja/7BvX6GiuxW84
         lZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=t88jbvctONs+qHXsNnGi7BlHTFxQ0QLhoZsqurw8Hko=;
        fh=5amNHYnlyy/Qx4sOydDlkdtE7OHdAQGnFy7EiKoUjFo=;
        b=o8d35YTNtFmK2bZ2ndxezfzEMfplOFi0pWZkvIfk/noxzjY8773OB06Nsrlx5Ewe5e
         npuQZW9EPoNxaO83fJwOZuqXNX04nd0jnNc2I4w1wBnWKcVU8QfmE5mP7lXlW4LNfiI+
         AFJLZkvNoPuGwJknjFy2SbniKqVJfMbac1Q4Lc8dJV1e1OWYEgUWSnAo3A4ftyEKGJtC
         C4Zor2e/GRilD8MVA7+dSC8E7OMtuN4QEJB+8pOrJF9jtPkCQTTIREEDGckzP+jRnc1p
         MJOaixD0ZNr1WNiUNBueo2z4yjGn5+E6OhgrrSbM35LTBE+2R55Cr0QOFmyvBNVEidZS
         /WhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787667606; x=1788272406; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t88jbvctONs+qHXsNnGi7BlHTFxQ0QLhoZsqurw8Hko=;
        b=Kl6Ipk2tkpEZADcDB/25SZCWbNkf00xrUgRLlg3UprJ5aw4kl+0ZNzoUAobiN4lb6Y
         ceuyoBsitMn1AswYV7ZJzKBz7TXnN/xRifVPO7gVWYBKmsJtHc3/0qAFIALR+ufFlGT6
         i3+PFAFFan2GkbSETMueCYEx8m4r5KjlXi9hKQOD/KYBXDpLQ3V74XfEfQ56608ew2hk
         4rp1dZZhlgrAZKYG0B4xoaXWwgddIEOZnCMhYQtZxPfTd8r4zZ4R2f9+fA/oFm3Z/ZqP
         QUO9FfZaTDn99v7lEXOVUvfCljpA/I2ts1do+za+wxODk45EZpsRpJd/+Q4Otx6DriTX
         Xu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787667606; x=1788272406;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t88jbvctONs+qHXsNnGi7BlHTFxQ0QLhoZsqurw8Hko=;
        b=MPXjOqwQa1xwnzieAiCPTQcS39Rn5tnW9+bFCEUTGfT+NZcpqD9NKc4/Yp/1C80LyZ
         JtdTzBb9mOdgOj3NH06sG8H4NesvBakx0xnhu397rCn2cCwvOxqj5vJL2I/56thha0xr
         ik9taTkKZVPyE6o8WWgddf/mzXgOcGDapCTJWCzXxrZSWEBIP2sDCsItquom8p18Xp1w
         Z1OK3h/OIyPvAIQpUvokdA/n/PIqnuraqnZ7kZ7lwa9NEOYD/JTnUmoRbXOeY+dxClH8
         6aXIFGQfVk0dzaIElDyWO+m66v3Vv5zGEu2lUftHrXHSjf79LvKy+b0o9Y4gPnFdlIvr
         oNaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCz3w5YGcGnNno9hZL84ssPoFD79bSGGETNLCfmTRjIPAAHNVPmrAQvFMlSpwF/odATn9CDBTJBg63@lists.linux.dev
X-Gm-Message-State: AFuF++mv32Nw4sc7IGq1pVcMgrjp1GpZGydvt57QBzEDQ8YWJTagX/FQ
	/hBXoJ+CVgzU+mL3KAa+AxLfA/zS7xcK4JGalTUvWfMu2jf5G7in8TYIaRSk/sBvdTwjD6+6stN
	XY2tQbYixi9mXSktNya7AeLelw4n80g3xY3+alZeZ
X-Gm-Gg: AR+sD12D0hZRJuT2wEQBji0clh27pA2H112t508FOZeS/npnpCc8F4ejV0zdFb0iIrZ
	+CJDp9u8ziH22uW8TUMCwHTcO0Mk7rGGQwMt3PHUP6KBqktRXqLLlRKrLxDjE13PDI/QOXBELeu
	DwOGWdX1ser3odVCKd67+/ScF8PegpdJKNYMixNY/U4Pq4zfM1vGRsbOpdFQAWHypmRsCuKnhny
	wbH0o721kblVxLKybRfwI4a1GBlpinjmqZ1cHw0J2xXB3J8fnXJC8Z2V0SW+gnaRWqghZ+4sC6c
	VbCWLD7vVwcewFYZ7t48HF5nsoPmJLa++g1FCIXHIIaCiu9CxmUa2Y3cg/+a0I2+tWyJ24JGh7z
	dEgA=
X-Received: by 2002:a05:6214:5089:b0:8f3:e0ce:611e with SMTP id
 6a1803df08f44-90cb7907bb1mr71992716d6.19.1787667604682; Tue, 25 Aug 2026
 07:20:04 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 07:20:03 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 07:20:03 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <9feadfea-c41c-4105-963a-a3d98421e1c3@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-40-2fc18ee6d3ba@google.com>
 <fe1c6359-7371-4ccd-9807-1d81c160d12b@intel.com> <aohEz_1JFVDtlSnE@google.com>
 <CAEvNRgF8XE2Xsn-g3qzPxcdfLdvJEc1FZw9LQ+deeXsFpdZsOg@mail.gmail.com> <9feadfea-c41c-4105-963a-a3d98421e1c3@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 07:20:03 -0700
X-Gm-Features: AcwNN1UOU0Yq3Ra3mNR1CZsf74y81KeNAw_IC0Ss9JrlNXktfVmaAyZWIEWXWx4
Message-ID: <CAEvNRgGz4OD8J1OeVzAK9kmgEyQsBSMn1ncuEaTbGHesUc-Gsw@mail.gmail.com>
Subject: Re: [PATCH v10 40/41] KVM: selftests: Update private_mem_conversions_test
 to mmap() guest_memfd
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
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
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/25/2026 5:32 PM, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>>> On Fri, Aug 21, 2026, Xiaoyao Li wrote:
>>>> On 8/8/2026 5:53 AM, Ackerley Tng via B4 Relay wrote:
>>>>> From: Ackerley Tng<ackerleytng@google.com>
>>>>>
>>>>> Update the private memory conversions selftest to also test conversions
>>>>> that are done "in-place" via per-guest_memfd memory attributes. In-place
>>>>> conversions require the host to be able to mmap() the guest_memfd so that
>>>>> the host and guest can share the same backing physical memory.
>>>>>
>>>>> This includes several updates, that are conditioned on the system
>>>>> supporting per-guest_memfd attributes (kvm_has_gmem_attributes):
>>>>>
>>>>> 1. Set up guest_memfd requesting MMAP and INIT_SHARED.
>>>>
>>>> If I understand correctly, even with in-place gmem, the model that shared
>>>> memory comes from the userspace_addr and private memory comes from gmem can
>>>> still work without passing GUEST_MEMFD_FLAG_MMAP flag.
>>>>
>>>> Since this model is not prohibited by KVM. I think we should keep the
>>>> testcase for this model to ensure test coverage?
>>>
>>> +1.  Deprecated doesn't mean unsupported.
>>
>> The original test case was for non-in-place conversion, which wasn't
>> removed, it still passes.
>
> It only passes when
>
>    /sys/module/kvm/parameters/gmem_in_place_conversion=n
>
> It fails as below when gmem_in_place_conversion=y
>
> ./tools/testing/selftests/kvm/x86/private_mem_conversions_test
> Random seed: 0x7eace343
>
> ==== Test Assertion Failure ====
>    x86/private_mem_conversions_test.c:46: mem[i] == pattern
>    pid=288745 tid=288747 errno=4 - Interrupted system call
>       1	0x000000000040426a: memcmp_h at private_mem_conversions_test.c:46
>       2	 (inlined by) __test_mem_conversions at
> private_mem_conversions_test.c:356
>       3	0x00007f2ea2c89c01: ?? ??:0
>       4	0x00007f2ea2d0ec3f: ?? ??:0
>    Host expected 0xaa at gpa 0x100000000, got 0x0
>
>> Is the ask to also test, under kvm_has_gmem_attributes aka
>> gmem_in_place_conversion, to have guest_memfd used as purely for private
>> memory and have shared memory taken from somewhere else completely?
>>
>> I can rephrase the changelog and change the code to clarify that this
>> patch is meant to specifically test in-place conversion with MMAP, the
>> intended usage of in-place conversions.
>>
>> The ask to test gmem for private and something else for shared seems
>> like a different test that can be added separately, perhaps in a
>> follow-up series?
>
> I see it as the fix for existing testcase, not another new test. And the
> fix is simple:
> 1. change to use vm_mem_set_memory_attributes() to set memory attribute.
> 2. pass GUEST_MEMFD_FLAG_INIT_SHARED to create the gmem because this
> test expects the initial state of the gfn is shared.
>

I understand now. I worked it out, I should be able to post v11
tomorrow, just need a little bit more testing.

> ---8<----
> diff --git
> a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> index cf50e9a332c5..fbd6c63d21cf 100644
> --- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> @@ -307,7 +307,7 @@ static void handle_exit_hypercall(struct kvm_vcpu *vcpu)
>                  vm_guest_mem_fallocate(vm, gpa, size, map_shared);
>
>          if (set_attributes)
> -               vm_set_memory_attributes(vm, gpa, size,
> +               vm_mem_set_memory_attributes(vm, gpa, size,
>                                           map_shared ? 0 :
> KVM_MEMORY_ATTRIBUTE_PRIVATE);
>          run->hypercall.ret = 0;
>   }
> @@ -382,6 +382,7 @@ static void test_mem_conversions(enum
> vm_mem_backing_src_type src_type, u32 nr_v
>          const size_t slot_size = memfd_size / nr_memslots;
>          struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
>          pthread_t threads[KVM_MAX_VCPUS];
> +       u64 gmem_flags = 0;
>          struct kvm_vm *vm;
>          int memfd, i;
>
> @@ -397,7 +398,10 @@ static void test_mem_conversions(enum
> vm_mem_backing_src_type src_type, u32 nr_v
>
>          vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 <<
> KVM_HC_MAP_GPA_RANGE));
>
> -       memfd = vm_create_guest_memfd(vm, memfd_size, 0);
> +       if (kvm_has_gmem_attributes)
> +               gmem_flags = GUEST_MEMFD_FLAG_INIT_SHARED;
> +
> +       memfd = vm_create_guest_memfd(vm, memfd_size, gmem_flags);
>
>          for (i = 0; i < nr_memslots; i++)
>                  vm_mem_add(vm, src_type, BASE_DATA_GPA + slot_size * i,
