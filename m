Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E43369219
	for <linux-coco@lists.linux.dev>; Mon, 24 Aug 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582751; cv=pass; b=E263j1PlszKGfk0SdgMaeV8BuW6zrV7MILC1ygj2d2HqEE0JhFOe7T0DIPYmv0CJ0+0Qba8Dx0t6wQdCb2z1kHtBMNoMSkEvXiS7o12fGBFMCPaHjknVxgFtCwvhDfq97pQ1slUSFhijtJRLPRdERV3ogwF9F8MwtNnI+KVyC8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582751; c=relaxed/simple;
	bh=HjYwTd5kWmHq4WzayeX05JXI6uq7QkVWkmVqyAOIZIg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzgIuSUPBA0tIdJpVj656ui2g1ta4nt/j/m8VZB8fsPe+fEmYod4+LJkCCDdwiazLtS8UUMF1JoybpjGeakwMz7Q1Us1XdiSBOUXeKLU8RmsYHxFYtRFx/HQBd83taz6eNIkFnMf9Imi+oNLSsPJlKUSG79HIrPLHeKnt+2RcEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QBtgXwGU; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QBtgXwGU"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so41047926d6.2
        for <linux-coco@lists.linux.dev>; Mon, 24 Aug 2026 07:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582748; cv=none;
        d=google.com; s=arc-20260327;
        b=GFFzOc9sTNE+2YVwDet185ZdUICAZsc153f2OeuNS9aQP0U6qw6RBdnfXOKQoIlAvu
         qvI+7q6XOvsqpx8qu+ouVHFRkngHXxKEokyqUN30wojUMUwr2q4/od+RndtR6MreZyzR
         M4bLghiqs6AhLsflEMnHAUFKcy/hAq+pLN/dEd8ttJ0AzEsjM5HDkI0Nl42u51p03ido
         dHFXqDorTSMI0OD9o6SIV9OKpyp+TUJLNYL6TCwMXOs0tZTCkt3uP90rhACZAsCZUWub
         oc5lFLZpxIcbq+AFVl2rieTHgBggwPxCDSmqo7ni3G30N3+hfqtMi1R0K2Dac5pdud31
         Jjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        fh=WB6xmFFU+6ToKuupa+IyGZOo1pbl1j2xK1L32Vwwe0o=;
        b=c87M3dhlxWSV0na9JoGCVFvbmnnonKliAH0FFgsJ3oJGWX24DwxkrOcqFDpE52YrTa
         1H59vwE6DlngbAtkrPd+QR6OTsiKqhHFG280/FTeK8AbezZVchvGaOAeyDG5TLagoiIK
         g4sexPkq5x+UauCSXBS5ApVM4GIM2OyQTQU8JdPUxfam8Vwp1mNQ3ajeEOniEgHAQu/Q
         Q5SX4IQOupT6UsDYb/Sm62myuOy6U+hAMRztAIg+2Bx/wqpL8yV3/IhWAFb421U9B0vA
         PNbK8MgqxuPxS9/pbPLJkw565l5oictzGPczS+lwNzDCTlH1+F8xtRn+gyhyScUrbgvd
         3FVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787582748; x=1788187548; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        b=QBtgXwGUW/KSne7cWu/SZWJAwLHSQ+uIO4Rlisq2FliFZULCU4Me3IemDLle2tzgI4
         zbYvdGSea+h3n/PLh2YqJAMrpeyhIomcbxTJyBH9Nbtcb7YqSjtLpzjOjQJUcfN8gn9d
         Vce2L4PdDY1Rx3+Ka3324yQbcENWI4YMU0e5YlVY6mSRojE4IfPY90TqtwVCdG/gtxbs
         FjdvHdjPXL8YM87ri/FygHbLaBt2WGh9w/HKdfz55gzF9MW2dGjV2AsfE3LzbA/0Un4E
         UEHPPim8WQ8N9ZjPv3hNhuA0FSyXdeTN4ML5d89Ag7jzC9mB2fDCuMCYdVfm4w38YQrU
         lreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582748; x=1788187548;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        b=EOhVWcwEGh8TuUZCcSh42U1TtIEYbOQ1yTn4Gm/D+ErZ8x+u7cJl0nybSA+Hufxgyy
         INTVjKVvJFIIqnMJI6LKAMrX5h+uoEs9pVfnCD5Vu6hq+rRMiCA6Rwon+ExBoZr/K20t
         UvIVjj4ebJKj/hltjTyiR6h050KVHuR27tyhZ/ihdGjg5eYH17F3CidYYJxNfCeKV/0X
         /Uc3o6PPrzmOGy0mT2eiUvRf2AE+Zfq/onHz7IUFDtRqAJkAsQQqk4W2tugnqc9o5XwD
         d9tXxp0Y9auVHhwVVDaq+mHbKI9SYhPnowisRxcPlGkF00snVSkpT1DzcGYs4glZVjWe
         j2BA==
X-Forwarded-Encrypted: i=1; AHgh+RpxXTWYQWx2SycxYRjHBRgNWRV/Dny1ZQNQGbnxP3kzkTE5iw5R1WFhGrWGgMekdj2KoWmgYeK8G2H1@lists.linux.dev
X-Gm-Message-State: AFuF++neI1nWPWXx4kTWVvr8sbgIQwzzJst/XavknTz9kgcTnQj8AmwN
	Wkj5kyzdsTjNssiyDL+ERsHhuiyvkJMaqGrwH3SoaTGyaBz1hk8Yd4q8DHFPGS6wZ/CiJ1XnnHn
	Dkyd3Sr+Evw92gndh1DaDk0/Pxynrw5wWLzrRh5cy
X-Gm-Gg: AR+sD12aMgWIm9k90lj09KBTKTbMAm9zdKfDr96ONY9uwJ+YnN8tKndG5Uv78K1MY3y
	tCdsF47v02KF1ZGPqs1CIYwlbKGA4F9klRo4WOCT2u3aEpM4k0jRzCy2DyOBZAzSpe66q/WkC3M
	E8DgYoUvul07u1KTzw4SPlDScEo6MW+2IOUtU+tuZMoaORq65BIn5ZmAtvqv9lUyj2ftvJw5q7/
	wRF4LlmQh1Po4pSAjxF3AmgjA1l7sfLFSmd+KjbuJ1ykx6tvP/Na4ZFZ6sGAaXG3M4iZQAFXyhi
	PnuUx3nirZdbpoy6aytFC/3eYg8rgsU6raLGISYVQPJOCd7D5K7COmWbD1JDLLFEmodYiD3/2qd
	yC10=
X-Received: by 2002:a05:6214:246a:b0:908:2369:df1c with SMTP id
 6a1803df08f44-90c8f9f6e2amr182627906d6.20.1787582747578; Mon, 24 Aug 2026
 07:45:47 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 07:45:46 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 07:45:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com> <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 07:45:46 -0700
X-Gm-Features: AcwNN1X5oDcPBaq55pm-MNepv-y7g9QlVSIhzW239c93dbXJQTRPUD7hBagIvPo
Message-ID: <CAEvNRgGvxMus6pp=xuDYOumH3Ge4oi0=YKjTaFykFHwXuzRDwg@mail.gmail.com>
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

> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> Stub in global variable to enable in-place guest_memfd private<=>shared
>> memory conversion, which will eventually be exposed to userspace via a
>> module param, and wire up the __kvm_mem_is_private() static call to the
>> guest_memfd version when in-place conversion is enabled, i.e. when gmem is
>> the sole authority on private vs. shared memory.
>
> I find this patch changes the default memory type for a @gfn.
>
> - When memory attribute is tracked per-VM, the default memory type is
> always shared.
>
> - when gmem_in_place_conversion is true,
>    - if the @gfn has no memslot, or the memslot where the @gfn locates
>      doesn't have gmem bound, the default memory type is shared,
>    - otherwise, the default memory type is determined by the
>      GUEST_MEMFD_FLAG_INIT_SHARED flag.
>
> I think we should document this change.
>

In a way it's not really a "change" since gmem_in_place_conversion is
set up as false in this patch.

When it is enabled in a later patch, another way to see it is that the
default remains "shared unless defined as private".

Before:

+ no memslot, or memslot not bound to gmem => shared
+ memory is shared unless VM ioctl used to make gfn private.

After:

+ no memslot, or memslot not bound to gmem => still shared
+ otherwise, ask gmem about status, which I think is already captured in
  the module param concept.
    + The very usage of gmem (without INIT_SHARED) is defining memory as
      private, I think that is already documented elsewhere when
      INIT_SHARED was introduced, that now the default is private.

So in summary, I feel that this has already been documented in various
places. I'll also add the following in v11's "KVM: Let userspace disable
per-VM mem attributes, enable per-gmem attributes", in
Documentation/admin-guide/kernel-parameters.txt:

	kvm.gmem_in_place_conversion=
			[KVM] Controls whether KVM enables in-place conversion
			support for guest_memfd and tracks the private/shared
			state of memory per guest_memfd instead of per VM.

			If enabled (the default), KVM enables the
			KVM_SET_MEMORY_ATTRIBUTES2 ioctl on guest_memfd file
			descriptors and disables the legacy VM-scoped
			KVM_SET_MEMORY_ATTRIBUTES ioctl for private memory state
			tracking. Only the KVM_MEMORY_ATTRIBUTE_PRIVATE
			attribute moves to per-guest_memfd tracking; other
			attributes remain per-VM.

			This parameter toggles KVM's in-place conversion
			capability support. Whether a VMM uses separate backends
			or out-of-place memory management is determined by
			userspace VMM design.

			Note, this parameter is only available when
			CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y. When
			CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not set, in-place
			conversion is unconditionally enabled.

			Default is Y (on).


>>
>> [...snip...]
>>
