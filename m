Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0174C40EB81
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645808; cv=pass; b=n5uLU2wG8GimpN+yoMKmjatTsuTntxNaIUk2n6OFf18YKyyFs4SX76ghjUqkp5o789QsSijW2lCWvJ51SN5iuBepav2j5Tu8Z9Yd8LSbtIyIke9SqfiW0ZHbC/9wONWwAmBOPlBLrP1B0B31qvhgrjVD8m4/BI9l+pOhb9IAis0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645808; c=relaxed/simple;
	bh=Ska3VU67p+Zg8LuYPgjyex6VZBA8Ya8GmJinliOkbPU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHL2Vl8WOGypXvTf7QXP8H9EjvS/f7dev93lfSL/S/gIWpEZq9mWFkWlEtcHC87koZzsjTyndErmmS0KOot5neZymFo2yfegAs/vVbOB0H771hYTywaxtto16SApGR5vM2Hmq9GEByZEr3Tze53gW2aGRqbwSGAWCl+xclBGgfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmN9Yqdn; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmN9Yqdn"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1001685a12.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 11:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786645806; cv=none;
        d=google.com; s=arc-20260327;
        b=RqBuNOT6hUt+qD3gdrDkl6YvlynRiaUJt1FNZe/s2+vG56a4k/siZ41z7wYv9RNbuT
         FfeF22ke//KITPeLvGTiqSh/OaeRH17Mk7dZipJ9A878V7K1iMIM7yctdXiwnU7RtEvE
         YT5CDzgB2qi7NSrS7WNn19krh9Uxd1ZrJ7pJpcaP8MLCZMpMvfT8hxsZxOW4YvZMac0A
         WKtE50KWyFQYwsl6+1inBhNfVr3V/G7crvQxZ6XkVhJZCcKSOgJ1aJqWMHhNYIbWZJBz
         qyi40LX1f3vs4uMSSEREW+UxT1Yzo+YFZ+5b20GAekE2RX3SyODDS+6NoC1ty1PzC6Vg
         +rNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        fh=xxUtqW9CYlmbwvjC6epLd1/tDMyqc3iJKZ3HZrdsaBc=;
        b=e2KuKT43e7xFHgiAwEMt/XcQW8CGeDLd+HcIiCANSgq9h9S0z9bbo9+U+xxam9RqE6
         GnDmEuRGbTWmkI7iKAp6ThMERQ1wKPvMX8Tr1BdNl8jQE85CPa66nMDqLOlc4fH+/zK/
         1V5u5BaFLcaCGfoDEcTAlrw/ko+zTDoHXY333zKCneT9Jd8jWFfquV/pYHNIhEXkQMUK
         ooGuvOZoLIqa+Lxx3g8nLUp81pCRYVH7bOlVrR3C+fiGT4L64+Cpru4fmaSJPI79Ojs/
         ZsfjVJIFeHivgcRz6U8EULAvtx9z7R0U9zWMOW8j23KDHO6NiNTnFxCOZtYTSpV+k4/U
         BXnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786645806; x=1787250606; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        b=XmN9YqdnB68jtXSkbrzMYKgRT3Olf6xI/MjRyQc24tYwQtoa5tWFY/NrW06Q3CRXg3
         0zfu/Y4/8rsigCRi2Kznu+zFPxfS+bchms100XTXD1pVCjDo1tJ9I3FnetdgHr2+yrX1
         ZVddPCjAqvQyT5S3Ehgia6BPr8MsXQoScJ2OTPYXs8qio4aQCBJfZRDtHRnkKZwfaGMs
         LpV+Ctbr6tfbwAupdiAs1VzMZj9V57q10M/7Cs4hKvFwP5d9FqTbJbPZWC9LXkPPwccm
         T7mb6BmnlPMoI1kDfEsMLEz17cPkdWUHvIvOkHb8hMBbbi58hDE84FSkD/KtMqdGDAfO
         4yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786645806; x=1787250606;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        b=swvFPrIyFQTab/5Pd8NISQUOEHPPuDozcWIC1qw2jfzvG6sdSo5gihBw8mJwBR35Ai
         vR+Jzf8/s8xf3+923rrkME+ERvt+ARiZy7POtR3CZrGuPeyauI2wttGF9GwRJ5il16Q0
         2MRtMNCLJKRJ1f2q+3UuNJnlBf4prvquu3sI7ZA4Uym1cs+cVpCCeZshBTSQNEabrFr8
         CEcGiac7U3dYSS9haPhjR82DP7J88j0ZyKOQo366WIMvpallVHSCnG9s2tEn+W8Z5+U5
         6nMCSJ6MnHFlAFLBIxchg74aaa35EKLqBveuh5yJd+9ERVmNXxAuYxeHQgQKwECIV8Ty
         FyXg==
X-Forwarded-Encrypted: i=1; AHgh+RqdX0rxBk5pKM0RPqXpRcg+Get5enLisIASQZc5GxMjtcKhoD3Wfft9jstyKYY/NNwHT9zCDlt4oGW5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8L9glr54uEvUIypkr3mc72ZGQzse6uOQf9Xh6NS8RQ/vf9AkM
	DM6c8FxDO4K0EIZnEObSaxahI+YiaKAIzZqKou2ilWVn3RhaYxRTPK7arnTZBmiSohjh9sgHL2E
	wDRj4aEAiF+CVX+7tRTBG5cGHVnf7rcxvkNuqZ2ei
X-Gm-Gg: AR+sD12THax7WiNNLu6ybA6rOv+8n61F2samVNR3eNIb98MdETy1GlYMbmJp3zVHmSP
	uTZJbOYVlyOGNKEtVUSGIcfM4EkQvifyeTm61cvPIV6hh7wuTrFn8RcRZwNGk6Nm7U0VMxx1i7Z
	Uud7YrRq5tbIDgGRp2AAB6zikp6isYybS/6116p8LzshGZ6RIXyHcf5gJ0jrrAJ3ygAbP1KI1Uh
	A+sZ9zM0rNJL1hoIErHSn+JbOVdIQEm8Yo0KydSEvT6ETYZHUfs56zugbQiqTA8AyLLt3nTtYXG
	t6IK9j8MwdR0ddz538IZ0OKuzN+sLLwK2yZ1XN2nV0Jl7R8uQUwU65xJ/j57t9zTOfcU+0jah47
	8Lwzie4/2ze+2BjZE7dJWsEXPB7I9fVY=
X-Received: by 2002:a05:6a20:3949:b0:3b3:3506:cf3f with SMTP id
 adf61e73a8af0-3cc572e1e2emr8851350637.1.1786645805191; Thu, 13 Aug 2026
 11:30:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:30:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:30:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <anzm_YLft-J7pxiy@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <ed483d25-d908-4248-b8c7-862dd35dc6d4@kernel.org> <annnrGR1noVuBkCc@google.com>
 <69c86172-9175-46cc-895e-9ecd449332cd@kernel.org> <anzm_YLft-J7pxiy@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 11:30:04 -0700
X-Gm-Features: AUfX_myERGap35A1bA3IvemF8mP2h9L2MeL4s3gAw6GC_Dq7e6Qb6MukNKA94AI
Message-ID: <CAEvNRgFGt2Unre=iuXhdg+ZFjWQcewObA54h-R4mBcpfksXdKQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Sean Christopherson <seanjc@google.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Aug 12, 2026, David Hildenbrand (Arm) wrote:
>> On 8/10/26 17:01, Sean Christopherson wrote:
>> > On Mon, Aug 10, 2026, David Hildenbrand (Arm) wrote:
>> >> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> >>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> >>> index 65fbce46b63f4..9477ecebbbced 100644
>> >>> --- a/include/linux/kvm_host.h
>> >>> +++ b/include/linux/kvm_host.h
>> >>> @@ -2580,6 +2580,8 @@ static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>> >>>  #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>> >>>
>> >>>  #ifdef kvm_arch_has_private_mem
>> >>> +extern bool gmem_in_place_conversion;
>> >>
>> >> Is there a "supports/has/enable" in there? And should we call it "kvm_gmem" for
>> >> completeness?
>> >
>> > It's kinda stupid and definitely more than a bit inconsistent, but overall I think
>> > I actually like "gmem_in_place_conversion" the best.
>> >
>> > gmem_has_in_place_conversion and gmem_supports_in_place_conversion are misleading
>> > because it's not just that guest_memfd has/supports in-place conversion, it's that
>> > that KVM is tracking PRIVATE in guest_memfd and so in-place conversion is the only
>> > option.
>> >
>> > On the other hand, while gmem_in_place_conversion_enabled is better, it's not
>> > quite accurate either because userspace isn't strictly required to do in-place
>> > conversion.
>> >
>> > As for a kvm_ prefix, IMO gmem_ is sufficient for a namespace, and not having kvm_
>> > is consistent with most module params in KVM.
>>
>> Maybe we should have a helper function instead of accessing the module parameter
>> directly, then the gmem_in_place_conversion could just stay file-local and
>> kvm_gmem_in_place_conversion() would be used by other code that wants to obtain
>> the value.
>>
>> Instead of the
>>
>> #define mem_in_place_conversion false
>>
>> We'd have
>>
>> #define kvm_gmem_in_place_conversion()	false
>>
>> just a thought ...
>
> FWIW, I'd rather prefix kvm_ than add a wrapper to get a boolean.

Could you elaborate on the rationale for a wrapper? I don't really see a
reason to encapsulate this boolean since this flag should be global to
KVM, it toggles between tracking shared/private status at the VM or
guest_memfd level. Since KVM is a module I guess it's already global
just to KVM?

On the naming, Sashiko did point out somewhere that
gmem_in_place_conversion as a global might end up shadowing or being
shadowed by something else.

Prefixing kvm_ was one of Sashiko's suggestions too.

I don't really have a strong opinion on this but I'd like to know what
to put in v11.

Will using

  module_param_named(gmem_in_place_conversion,
kvm_gmem_in_place_conversion, bool, 0444);

help? The module param doesn't have the kvm prefix but the variable
does.
