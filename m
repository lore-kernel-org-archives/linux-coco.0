Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8FE18AE3
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782345949; cv=pass; b=KkMo2IxNuC8kCjjbKN59FJ0OkTL62CKAVqxFClgxG8ZQZWkm49jui6SYlkxwfl2CHvhS8Cg9x1VzfYvhsPiwmDxelid3qjJ51HciubrfVKBCCxWsv19xgwLw7wjbfPH/f5PL/i4a6Ik1FXfjfPAYFjcmEx5eKTJnRS1e5+VU3EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782345949; c=relaxed/simple;
	bh=Vhp59FnIevSXEEdWsugGzaR2Idu0ffRc20bSQFGQLZc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bhsp5U/5bZjdWrsdhzBo7N6+uTy09WRpAC2HTgmUGwNjTN6BPD4+PUT4m4FUl1/t5blsZtBElTy5iHHkwAw0YPlWnAKNecX4yd10exP51u7mC9skwkv6xaypTJksT8hZvegimEZCL177nFBt2YWavwfyMZ8Hj0u4WdZu5VTCTSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h4N3ra0m; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h4N3ra0m"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-139a71baa35so4316972c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 17:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782345947; cv=none;
        d=google.com; s=arc-20260327;
        b=TalrcVEIpkjde2CqhJWNPd8fsVOuRsOBN3QpMFAdPbnJD+gAL2RtvEbdfX2ciEnjdX
         XdFzbEQ+58RPpQeSwvt6vAQTAUkLjEEAiuOO5wGMJ1As+kzr7dzXk1haMQTWdXwKZUEi
         vYwb0bc3neJGTEg9/XrX+WzIZdAP0bFxbWt77NIshNb+YN6hlxuoz4zRy13hLFANt7Ry
         eX7nCRZGeTnx7wZ0W8TPFrRm2PSHILikDVrnfimlhVmPZsioM3IlcT+tHevtpZ6nkxE0
         hObRYSQyz4v2kT3XM/E30tNtv4Y2deey0mX2Z6Bq81tWCUCIp6o2kJ405T3rKuL7Aviw
         hPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        fh=vvQYfgXMDloLZXnlWnN+I6RQopZ164TiSzFejWotAEk=;
        b=QSv99OlP5RQnRVY40FENOEZ27Hptj1aKTj63QKHaXicOg6LcdYfoUjDgJlL/X3f91o
         NzPHD1QyezPUb/f11T1tk3pnGUKtegC348FHioSVX8v214Rvu+8bDdH8QjJeyspSjKjo
         6tyUluzqxLjkXhwE1Fw3ybDF6dr8hDEwVKXmmtOJxcMrUhqmDB17lavMcZ+mTK0fh02c
         1ZA+RDVr/6zSa/savm3ZUoExAqn1j64APgMoQ5YXV6GpB0NZ7KI9ye5MQj8jpmgAsLN6
         oezlrI7xCjc260KvOobwNHucyVlN0w3/U5/nQvH2C57b1geK+S742a8ZP9t5RkeU5OKq
         abOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782345947; x=1782950747; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        b=h4N3ra0mFGdyxJc5zd2axhH4i2gLLZpaGD8JURhvVTYQDj+A/UPp1zPZW7QZBbebC3
         dqTHP8lSHKDPdSd0JyXltDfc7+IGw6DqcQmFxpty3wVZH6nJC9xUuXT36/5IHLNvh9jZ
         9Ls5Javv48Dsyx2Ng6aGQb+3SC3eS2OdM7Eqb8jJONLB9PmiTRuv5x4DFDT5iGZj4JoI
         AkufLQeog2+ot6eSkJnq2mrsgl8AJWo3y7Qr3j0ZyZVt00fyEomk6QTstppiXPS8hedN
         o1g7CXxUyFv/EmqEqnI13ZfOHqbNajTktzJtrNiy4jgUD4iUi6G5snI8X+kE+w6s0/vD
         ABhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782345947; x=1782950747;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        b=JfRh2vZhAmTuRBU3NFXNdBwjutngoi5agO0vzGK+rB0lsFzfyok/Z0ywUemG+RjSR6
         oOg1pehpM6RFDpM8XhAs6uCsWW7CJXqhjKEwSxaWeSlUZJ0ZLiUNW8fdtZ6vgI9LOhFm
         suoBTkWpY3ZcDmRAz11S+Vuq49YdCFrrQbk7K0nTdtKKWZ8WScsY0H7X39S3qE38yAUK
         5+I+PicuU1AeWNSwd4wcQNYKzigQTNy0ZXyma3ZbSJg+vI7fIuERvxaFyMYkwpY6TeCW
         kfIJdCarteP1haYFUNvsoyQH35KRPxkzg7hARU2ERaSmjB4iu5E5d+0kLZKWgTLtV/Cc
         Q2yg==
X-Forwarded-Encrypted: i=1; AFNElJ9spxjHSpqwyRhq+VyBFu2DlQr5Fi5Ky/22Dm+UX71T7LO4q4tHE2/em2ZB6WPVNjKASVs6g+toWCDb@lists.linux.dev
X-Gm-Message-State: AOJu0YxOu/DtoQBkvh5SpuLWHNj1UgiGsgDkJ9itiGUCAUoLeTzcPkpn
	009w6ZTRIcJeCaHLWj6c24TGyi2fSLexXMVcHgk9D5PFQ3YicVrwtSHxX6+lIUJvkH5jqytdSbF
	oy+9lBgCJdvjvmphlkqfsjjuMOpzpCGTpqzVL3fTd
X-Gm-Gg: AfdE7cmEr6+6YAYflfMOfUO5nW8aEAsS4askNOxCfNY9Ske3ARmPaSSzBv49G37WIr0
	UcZgOiBihrH17dQxnjBjhK94UmdfJzZsRevxVklz2PzvuQOQuSUGKlwkLOs0MFoAdl461NdwKML
	/Owhx8Kl5oRR92jBmfsV6tQxQMw6qln7jdVSDyMUvPZ/AAu852FEnBZRcQUYcDSHPA1UOeOLmTO
	gRPUhDEjdzqYG2LdN1rj92NTBVRc8ur+dcIqCC3dAUZhLLSpJoEefDPH/eaU7TFBWqYZj0wZAim
	LUbPYUqr4VOt7x5VKPaLfSExHT5ixCk+CraJAIm3dlAyl25SXnn4PYy414g=
X-Received: by 2002:a05:7022:e01:b0:138:49ea:f463 with SMTP id
 a92af1059eb24-139dba54880mr251235c88.16.1782345945708; Wed, 24 Jun 2026
 17:05:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:05:44 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:05:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com> <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:05:44 -0700
X-Gm-Features: AVVi8CctoVihMuJ7SOXsg73Uq4ZLzDcGYZqps3qpfVHZ_IQN9jIN9AXdoFf5CH4
Message-ID: <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
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

>
> [...snip...]
>
>>
>>  #ifdef kvm_arch_has_private_mem
>> -bool __ro_after_init gmem_in_place_conversion = false;
>> +bool __ro_after_init gmem_in_place_conversion = !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
>> +module_param(gmem_in_place_conversion, bool, 0444);
>
> With gmem_in_place_conversion=true, userspace can create guest_memfd without the
> MMAP flag. In such cases, shared memory is allocated from different backends.
> This means this module parameter only enables per-gmem memory attribute and does
> not guarantee that gmem in-place conversion will actually occur.
>
> To avoid confusion, could we rename this module parameter to something more
> accurate, such as gmem_memory_attribute?
>

I asked Sean about this after getting some fixes off list. Sean said
gmem_in_place_conversion is named for a host admin to use, and something
like gmem_memory_attributes is too much implementation details for the
admin.

Sean, would you reconsider since Yan also asked? If the admin compiled
the kernel knowing what CONFIG_KVM_VM_MEMORY_ATTRIBUTES means, then the
admin would also be able to use a param like gmem_memory_attributes?

There's the additional benefit that the similar naming aids in
understanding for both the admin and software engineers.

Either way, in the next revision, I'll also add this documentation for
this module_param:

  Setting the module parameter gmem_in_place_conversion to true will
  enable the KVM_SET_MEMORY_ATTRIBUTES2 guest_memfd ioctl and disables
  the KVM_SET_MEMORY_ATTRIBUTES VM ioctl. If gmem_in_place_conversion is
  true, the private/shared attribute will be tracked per-guest_memfd
  instead of per-VM.

Let me know what y'all think of the wording!

>>
>> [...snip...]
>>
