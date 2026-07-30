Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA73890F6
	for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 20:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785443706; cv=pass; b=n7RiRYD/Jum3IOl6YsT/S6JT7OO5nAkljcUFaFdsRTvW4xkYZ9qe879QTOYJusLa4OcoZbE7UClDH6dlssdzMUNvxOVkO0qmWV1VJKiTpZdukg5RtaGcbbWzqWMFMFvH2QJ7kzp4LMU8OZCkRIYGE3qDKElV9DvJy0FoshZhP+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785443706; c=relaxed/simple;
	bh=30g6+52vpLwa+w0jwIJQYFnjqb/F+49RsIdPCA/cCGI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buYIaJADVBgJUs4LCujoWBThy9pbagAEB+wxYc1pYEI462J0K7281K/qPAoNCDAjSI1A/YXtZ/xNRtjZq9bT+VIECIk+uU4cL/m4didBUzS//5OJ3QLLvmHfgsSfCSgcYCt2WM7tNYnG+eYehHsSOqt9soJFwPaIVyNgyxLjojY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v7cYjkUJ; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v7cYjkUJ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso272990a91.1
        for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 13:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785443699; cv=none;
        d=google.com; s=arc-20260327;
        b=lKW44+78lW1wUlDuPSNBgTcSw4RlRtjmfhahlDxbEGSLerR3gXYVXDdgklZ4leLYtm
         BcdzbuFwkYoyNizGMSbuXymVhoAMtSyl0+ea3aiRNLF3m55llV2JbFlyzV2N82duc9fQ
         MUhSLvQyM3o5ZyckYWfOrjCfqqOfRTUZ3GpGSPuwZJ0enBUeJOlFYwuIKXMavBTRMei3
         cB0y/DGhk1DQrlg83+21b+PHx7teKWyEUWO+Z5L/0nDBpwxcJZE55KgPjdjOPBpRvr8V
         46gqkpKtNMKcnnP5Qur9A/IcevZgWCdo5mknLBU5BCPpm0fGCBkA6RVVT1yxpZS/Eh1Y
         d+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        fh=rJQ3zVqX64rPQrmpXSoWHVuZVtyragEEOT99NOw5LnE=;
        b=Hf4dFwtPocRF6ncdJPhbejzgRgYg/f1m/NS4u+Dmv/j0K3LHPaTDcLZOfidA8gNnEe
         rnJ9ob+7NvfIf/0b6af89muu5C5rYiTpR1oFJlfznBfQBvnJ1AK2LmfbYjyFuMXKAu4E
         4Gg50bmmH9U2L34736H9G7uXlie4YhLM4UofQA+uBPrm/aM0/T3ZTjgtQR2cldX9IczR
         TTZKJiYTqxKkTEJKKONKS5xKPPP44iIH+Xu1g/YImpEoGgZ+Wk/76r3LDiXvkKgwakbt
         v0/odfMwqH2B0DqNCWa4O8ffVHpJTdDOpmxjNr2l4fjc5Z8zWmRYP3ya/o7NUFJAm9p5
         DDnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785443699; x=1786048499; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        b=v7cYjkUJLj9pHAgLPKwwNf5ErwUP03lzoahFWJhI+C4DVOqBnaQIeZ0fPYN0LAb7lw
         FT5pU9CU+FwMTgW4NWBAp+FOXCALhrkIWr/3yPGOOgRJKOys0ZZmDCj+oWRb34WCHvS4
         weqHLtiNuQeOWiGiTOwan7zrwDy1gRvgXsNdRNpGQymAtrXnfiTHBpCiCHbG+kbAVtNL
         7F9d5uVgoWh766zjWslkk4J3h7c1p+YOwX6J+k9Oe7KVryCulT8WykBvyvJ2M0XWu8Hs
         S1/F0JRXTrEIw+spsDuU2MfeY6JEFsqsGrVgMaHH5CU5iDX42y/E9SvcN/TROYpM/TVK
         6v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785443699; x=1786048499;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        b=H0LiPQOCscpSC4QyyL66qMwKVqnYDrxV/DV6BCunStBkAiVIIvMDzQruwu6+cGGJXT
         7St6V5qVd6ykA0BpTUKQK+Xdarbgc6mU7i3kfUmdB/5oHH6uaQAd8lN/B7bU18cu/mhN
         n72ziExesKNtMWFKrspPPSckO1z0No02MO8G+6D2rOrgww1UdIaw88A96vQHegrJpstY
         Lgcg9RF6U/CWQ5jFDOVe+G7eHmxqFKxssTQDfdSOvxYqZbv/WdGSzYs1OH1aDpBUZcjN
         bOtkBt50Dm0Icg5tAgYcdGl0DS9uLmGC/zk57RrJlLHB8bEZM6UEQXKEa9FupAoZVWSZ
         bIdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfnPgObkLmcAPfzx654i/EKwDa7cUl/GKw3u5Kffte6doFB/PwyHyAF5d+p/2LfEh07EEc2XTm/Ehy@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3IEEv/9d+CNwJut5dXe2rzgKkKh07P2+z7qDlwN7/1SlngWMa
	Oxk7WASmM3a1fuqNTk+etl4dn4jOkUkTCLTI4yrroT4VdqVBRab1qDqxvSFtueWKf4yDTnq+D4O
	z0pkt5P/QVx14SPDpFnYXyiwMFOjR6+YI8ui9efR2
X-Gm-Gg: AR+sD10DpK2/nvpbvNSoyD97dxjI5fgY2xot3CT0tMDhlCEJJIVP5z48AkI6WQFKUuo
	gNAM5ONhTcv2CvCwGNI8Lm6x+XfGPeVj3dmS9clDL3af923+bslQ2uhIprJWs8XYU8XhbokkCDS
	bceI7CWlZTJ8K7wxrNpzWTqpqKeSUP22b/WNDimNT6OvkqwF28Vxt5BLjMer08ZYmM30y14+WSv
	Ua7+BWha/cYKeQIGLX+FUNlRWE9nC7fgYqfAQ6wO5AGhpy4pImiyUq4/e02zifUk2rUmTyRtAc5
	2jYHHeXGCqMeAwnlFq1W6JA7Mgd8ONHG5GdrtHUxhdGd1ghE+2XT2PnusrKFAQOMlpB7SP99oxU
	yXsYJl3t+bm8SgXmU+Knz5nMpeBqJlbCrpdI=
X-Received: by 2002:a17:90b:2c88:b0:38e:2c8f:a01a with SMTP id
 98e67ed59e1d1-38f9bda173amr3473378a91.11.1785443697893; Thu, 30 Jul 2026
 13:34:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:34:57 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:34:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7dafaa90-f3d4-4be4-a5cc-472163f18040@intel.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-3-35f9aec2aed2@google.com> <7dafaa90-f3d4-4be4-a5cc-472163f18040@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 13:34:56 -0700
X-Gm-Features: AUfX_mzoiUtQGNkPMfuHgGb11yV4gcaKdQOzK-P2tpO8oMq-FVBJLM1nZe0Ady4
Message-ID: <CAEvNRgG3qXrG2ix2MEcyVo0GXaen-Pte4gFAwEN+9AY=VtGU5w@mail.gmail.com>
Subject: Re: [PATCH v9 03/41] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
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
>> From: Sean Christopherson <seanjc@google.com>
>
> Though the patch order and diff of this patch is adjusted to what looks
> in v7, per Sean's request [1], the changelog still looks somewhat
> confusing and part incorrect to me.
>
> [1] https://lore.kernel.org/all/akVGZOeR1ytfkamK@google.com/
>
>> Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
>> on kvm_arch_has_private_mem being #defined in anticipation of decoupling
>> kvm_supported_mem_attributes() from CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>
> As I commented in v8, the "in anticipation of" thing is not correct.
>

What I think was intended here is that in patch 20 of this series, "KVM:
Let userspace disable per-VM mem attributes, enable per-gmem
attributes", this part

  -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
  +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||	\
  +    defined(CONFIG_KVM_INTEL_TDX) ||		\
  +    defined(CONFIG_KVM_AMD_SEV)
   #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)

decouples CONFIG_KVM_VM_MEMORY_ATTRIBUTES from
kvm_arch_has_private_mem().

I get it now, so CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not actually being
decoupled from kvm_supported_mem_attributes().

>> guest_memfd support for memory attributes will be unconditional to avoid
>> yet more macros (all architectures that support guest_memfd are expected to
>> use per-gmem attributes at some point), at which point enumerating support
>> KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory attributes being
>> supported _somewhere_ would result in KVM over-reporting support on arm64.
>
> 1. I'm not sure what "memory attributes being supported somewhere" means.
>
> 2. the kvm_supported_mem_attributes() will be renamed to
> kvm_supported_vm_mem_attributes() and it's still under the guard of
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES, what's relationship with "guest_memfd
> support for memory attributes"?
>

I think another way to phrase this is that if we don't make this change,
say, on the foo architecture where there's no CoCo and no private mem
support, kvm_supported_mem_attributes() would return true for the !kvm
case, which is over-reporting.

How about this, replacing the entire changelog paragraph above:

  Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE
  based on kvm_arch_has_private_mem being #defined. This improves
  reporting accuracy by not reporting support for
  KVM_MEMORY_ATTRIBUTE_PRIVATE when kvm_supported_mem_attributes() is
  called with kvm == NULL.

  Give architectures full control over overriding the default definition
  of kvm_arch_has_private_mem() by removing the coupling with
  CONFIG_KVM_VM_MEMORY_ATTRIBUTES.

  In a later patch, kvm_arch_has_private_mem() will be defined based on
  whether architectural features are compiled in, and made orthogonal to
  CONFIG_KVM_VM_MEMORY_ATTRIBUTES.

>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>> Tested-by: Shivank Garg <shivankg@amd.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>   include/linux/kvm_host.h | 2 +-
>>   virt/kvm/kvm_main.c      | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 9f78a466c6f3e..c125d2e8155a7 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>>   }
>>   #endif
>>
>> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#ifndef kvm_arch_has_private_mem
>>   static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>>   {
>>   	return false;
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index 902aa166c9c0c..9501dd8d015d1 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -2421,8 +2421,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>>   #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>   static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>>   {
>> +#ifdef kvm_arch_has_private_mem
>>   	if (!kvm || kvm_arch_has_private_mem(kvm))
>>   		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>> +#endif
>>
>>   	return 0;
>>   }
>>
