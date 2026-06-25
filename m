Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ED830BF52
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 18:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411634; cv=pass; b=aLLBI3MklveWiniEQ1QQPmyt+JhE8eoI1tUt2UwtJeFYw3Xra7PmfWXipY9tMKUK0wSamAQYv7Yd+wTF6+J23keUcAhAdmL4gT/dpaAEcj2sDzaqt1tIk7eQLt19/yCBJ9SVfYFpC3LqjIloe3hryJH285N3hyVtmNbe3Ai9tsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411634; c=relaxed/simple;
	bh=9k891PwJI4EFFALDu5zQboFYTAkeFrF++j9GP6B0KQ8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFzZDhlVKqVRqzbrnlvd3znGLC6Gv1w4WiSE0NyqPURRjL9E4HPq/gTpNXm0T4/qzgrsKEL1wWUdy8mOKbacSJpbouvYD/OcYzPfoJeHiKlMQH7vHC0ynOBjsZDtuepc1oI+jkvwXsj8EPBpzC7PTeq42n0CWXbpyAhFGAhmA8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aBjxwwFL; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aBjxwwFL"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1384eb94d20so385439c88.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 11:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782411632; cv=none;
        d=google.com; s=arc-20260327;
        b=P5kP0aX4e+yvk1PI8gSjj6aF4kjv8k1kyo3Qw6uacfYVud3EaHawDmjPBE90a5lyV8
         jSpql1tX9wzN6jUeEbKqoHiUhPBGsVcJLNgzxc5wSZdXosgdAsFyO4+0BvfeMF9aqDwt
         puobJaYozb/VKTzKEIYubYTWSyZH00G9IQstb+aNPdAGFyD/1US/l7uiR8Nc/cN5J7J0
         m1A2uGo/Ge5+K9VjHyhHTak7za2r5zxB5KlrmgGz+8jsTpzqJmLnKEXdS9StT1vZEKfl
         b5HlnEjRLOzHAVTVHWuHZIFJixAwIqx5e4z6bxuD8ROSRswN6oBv0dVa+r2esU1/ISdf
         v29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Zxjcsz/dsIe56trrVdkQTSG2simPYkWb/FM1GFAid2k=;
        fh=jfn9/eefbn0jVszZYsp9SlIdpUFN9w1sZdJ446nCLHw=;
        b=FyxtHLwF9zl3QukhEkRPoK0BcjxM93eh59znkiYc2niXUZ+34Mni6yFSvhnp+p47XP
         wgnmcTUPmbQ6gc9P60cXYUrhI+cAgbXudy2MRDUxc9D/rTJzcCoQeDylTZr/iXAcRPOm
         w1dzW8NQKLwj24L/k9ccj/cnCtyioWD61Rsr5OeyuHVFEaI0BULv8NpKQ1dCAzD9xDu6
         6D60ADGkekpe/Zl5PBaZD6uSq7VTgaqOu+7kDDIypRxIyi0VQLRwjXcluvPr2ntHwdmj
         I5kv6QR2gh9sUw7qIBfwgNRJt++CNgXz6L8DFkJafrNj6Zj72lNSN2sScJUHVcCJIrpI
         5/yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411632; x=1783016432; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zxjcsz/dsIe56trrVdkQTSG2simPYkWb/FM1GFAid2k=;
        b=aBjxwwFLqC+1MnO6QPEdmc5JUiUJzIf9R56HeUUFFQNFwyp27slyx0NxJDfvGGFMIY
         99P2CP8peuy19xACde1LmwjL06hzIVgBw/qWCRotjvHUS4nKsluWW5wL9iW5OrnDqiMV
         kRs3VyF8CTxORu8Z50kqz2O3e8vA7sW4mwgsqsXrMgdWaaUvPL7aQ51bbJSdI4xMi22G
         FA2vzpyQJ/HP6+RITeRUn+eVi+TdXfhA/PrxfIgZPuGmdG/f0PvupvlY/kyFJuf3WZLx
         FU4+NrZi3/EXGuT794QcuVlLuSRfyRoLIe3Ls81FWNjZLMkmz/sPaYQAFQqtpRu0E1FS
         8ADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411632; x=1783016432;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zxjcsz/dsIe56trrVdkQTSG2simPYkWb/FM1GFAid2k=;
        b=PlTNDIKHdN/HqcvXHCneX2b/VpKbyMBZyf7kUzAxw+aXCoTk6Hrhrk+fHhsAWU573h
         j36XOODsxB5rx4r1dS/STN56IcDqM6JBlKQtz9r6Qit8aK/t+VL/xmlxJGdEfJHbOF/t
         72/pxaCHjrr4yk50wl7yYU9oFW/LIpCT0O6wXpL/XZJ1Q5ZMb1Gcb93HTPprRRjlKorc
         SoJNhyr2jDMCMgKQvfz2nJjw5SoxZT7zJou7f1bOE7VWNRZN+miFgH+q7HVOJC8FaMwo
         el0Guk47TZON1kPwAa96VWF6/4KL51aKQCjCtyGRm2yHEy2RFSf4YDganjvuVLU8uYWz
         /WnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YHqKw9+fkUcrbXM1Y3u+/sGom475q2YrkkkVLVyjWFdqilK8wG097tkCZcrfKeqp5XtYf0QFYMcBn@lists.linux.dev
X-Gm-Message-State: AOJu0YxWR3ck+EnOmquPYs9kZKNL2LpRrHZb1+vKk7Ow6ozz2a0d6wdM
	bN+63/EEX72sP16XbCcsoNIkZSK9xnrbd8w+/ymTrcUYYQ61mLi1ysMKyrU87IHNmsNFSz0VnHD
	v/j7ugCmVPcKKDmGLmlQF6/qhW2IXrKdCg3MSY7aA
X-Gm-Gg: AfdE7cmwtenewUO3vFiuMdwzHYl4j+nHgRrUjZD/q79RWXW0oYbkjqeEZHiHdc8TGN7
	ZOPERM5q8h0dULdhY8TmpgkuIxOsOe6UwSNcCRJUEYNO54m6dwrqnua8GuFQnlPhS7RG3yFrjzN
	NZeFttoC2JKga9vP9dHpm34pX69k8NGsgYzpI5TRIHvSummOP//Bw3ZPs3GUhErn/Kx3Nt893gG
	z1RubfvqFjjnRQTdHbbtNSbvYxe2SNitVhtYoVXTOJHVS5EnC+ukLEzZIDr/8NfRJSauT4cBJFN
	GVLC3P94W4INluqDMNzVbtfYm1UHl0C6t2zopk/+caqJU5TLFvGXXkEsUGs=
X-Received: by 2002:a05:7022:ebc4:b0:139:7bac:db41 with SMTP id
 a92af1059eb24-139dbb49566mr3555362c88.28.1782411631187; Thu, 25 Jun 2026
 11:20:31 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jun 2026 11:20:30 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jun 2026 11:20:30 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajyCn0PnFtQK+Nka@yzhao56-desk.sh.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com> <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
 <ajyCn0PnFtQK+Nka@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 25 Jun 2026 11:20:30 -0700
X-Gm-Features: AVVi8Cc3nGhX7fIjy0JPI276GPFCp7STu7qOIMKXGadYwwvPojaXnYff9SHGUmw
Message-ID: <CAEvNRgFfgV0FbQLzP8hhNH5hMGaQao6OFQin4cb3TAmC7SVhfA@mail.gmail.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Wed, Jun 24, 2026 at 05:05:44PM -0700, Ackerley Tng wrote:
>> Yan Zhao <yan.y.zhao@intel.com> writes:
>>
>> >
>> > [...snip...]
>> >
>> >>
>> >>  #ifdef kvm_arch_has_private_mem
>> >> -bool __ro_after_init gmem_in_place_conversion = false;
>> >> +bool __ro_after_init gmem_in_place_conversion = !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
>> >> +module_param(gmem_in_place_conversion, bool, 0444);
>> >
>> > With gmem_in_place_conversion=true, userspace can create guest_memfd without the
>> > MMAP flag. In such cases, shared memory is allocated from different backends.
>> > This means this module parameter only enables per-gmem memory attribute and does
>> > not guarantee that gmem in-place conversion will actually occur.
>> >
>> > To avoid confusion, could we rename this module parameter to something more
>> > accurate, such as gmem_memory_attribute?
>> >
>>
>> I asked Sean about this after getting some fixes off list. Sean said
>> gmem_in_place_conversion is named for a host admin to use, and something
>> like gmem_memory_attributes is too much implementation details for the
>> admin.
> Thanks for this background.
>
> Some more context on why I'm asking:
>
> Currently, I'm testing TDX huge pages with the following two gmem components:
> 1. The gmem memory attribute in this gmem in-place conversion v8.
> 2. The gmem 2MB from buddy allocator. (for development/testing only).
>
> The gmem 2MB from buddy allocator allocates 2MB folios from buddy for private
> memory, while shared memory is allocated from a different backend.
> (To avoid fragmentation, only private mappings are split during private-to-shared
> conversions. In this approach, the 2MB folios are always retained in the gmem
> inode filemap cache without splitting.)
>
> Since shared memory is not allocated from gmem, there're no in-place conversions.
> The reason I'm using "gmem memory attribute" is that the per-VM attribute is
> being deprecated, as suggested by Sean [1].
>

v8 of conversions series changed that slightly, per-VM attributes is
going to stay around (because of work on RWX attributes, coming up) and
RWX will stay tracked at the VM level.

For v8 and beyond, only tracking of private/shared in per-VM attributes
is being deprecated.

By extension the entire thing about using guest_memfd for private memory
and a different backing memory for shared memory is being deprecated.

> Besides my current usage,

I think you can set up guest_memfd+2M for private memory and shared
memory from some other source, and that's the deprecated usage pattern.

> there may be other scenarios where gmem memory
> attributes is preferred without allocating shared memory from gmem.
> (e.g., PAGE.ADD from a temp extra shared source memory).
>

Is this TDH.MEM.PAGE.ADD, used indirectly from
tdx_gmem_post_populate()? This use case isn't blocked. Even if
gmem_in_place_conversion=true, you can still set src_address to
non-guest_memfd memory and load from anywhere you like.

Please let me know if that is broken! I think I accidentally used that
setup in selftests and it worked. The selftests are now defaulting to
in-place conversion.

> For such use cases, I'm concerns that the admins may find it confusing if they
> enable gmem_in_place_conversion but still observe extra memory consumptions for
> shared memory.
>

Hmm but I guess if someone enables gmem_in_place_conversion but still
allocates from elsewhere, they'd have to figure it out?

> [1] https://lore.kernel.org/kvm/aWmEegVP_A613WIr@google.com/
>
>> Sean, would you reconsider since Yan also asked? If the admin compiled
>> the kernel knowing what CONFIG_KVM_VM_MEMORY_ATTRIBUTES means, then the
>> admin would also be able to use a param like gmem_memory_attributes?
>>
>> There's the additional benefit that the similar naming aids in
>> understanding for both the admin and software engineers.
>>
>> Either way, in the next revision, I'll also add this documentation for
>> this module_param:
>>
>>   Setting the module parameter gmem_in_place_conversion to true will
>>   enable the KVM_SET_MEMORY_ATTRIBUTES2 guest_memfd ioctl and disables
>>   the KVM_SET_MEMORY_ATTRIBUTES VM ioctl. If gmem_in_place_conversion is
>>   true, the private/shared attribute will be tracked per-guest_memfd
>>   instead of per-VM.
>>
>> Let me know what y'all think of the wording!
>>
>> >>
>> >> [...snip...]
>> >>
