Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022A492529
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922171; cv=none; b=QvUX5NxHVMhJDOUWAxnfC/LMlfXL2QID0IEnaTRdwvtjiVBmCGwbykYXtQ2fqbK0+LsNkBKUMas3u4uA/cRbpF72pkluyNV1v+8BwdCfFfVPWJbGm2JiIxJu3Ou4GazCHFexPuNly93alCvvfv7v39D0XpjVvDZlmULGqxYrw9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922171; c=relaxed/simple;
	bh=PZdjWM7sO+nieQyt0RiywxeCxZBtDRu0HUNeH72ZpVs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oPXTbYr0knxOkmnubmQ5IpUXOTaAbYJgia/eiLRxyUqv0u6wq9wJLHJXiSn5VI8EV8nH3vVoOoS/uvUTeCFAqSJEUjcubYO0PtMWIWw/d8CNOw5N5HogO+wpe2JYuqCzyuabwfT4ekUbbMgA6p67EbsQeUsShPXm/8jORMit5e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eOEpTP/T; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eOEpTP/T"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-38096457d3aso983744a91.2
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782922170; x=1783526970; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fb46jkRTl6zwGFz7DUfAUgbXgotI+sXKJjyrZvcz3JQ=;
        b=eOEpTP/TFHJgnbM/Zg2qS+IZOD0raD4rW38eTO96OUyhElgSdGer3oTsksF/oyTtl8
         YwtTdHQMtSE4xR/Fo7gYyItGqnWXStHp+XAaH3Ic5snqvTabCDfEThblGwOkRbg6rJeX
         9S9cA7Zy8PifLwffeJE8UBEXjTRBIcsT4AGAtaQF36x/72quy+2ryMXF9bMiKjsdyZbU
         EKXcfR7+WIGiWxwA7j8EC4P/FoyATlnYyP1xjK23QC+TcwapbscovN34QwEw0a57mn4f
         z2Hj9jTumVSIRncLCx6SGKrJbQCFj/Nu3vRu+GZk+AxGUU1VQmgrrcx+xwNcNyev80Rs
         0mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922170; x=1783526970;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fb46jkRTl6zwGFz7DUfAUgbXgotI+sXKJjyrZvcz3JQ=;
        b=o7TOrsnYDrhAJRrxlbpByUttnBWVWl7nOF3S9IqFvXl2Y3OkszKtZ3Td/1hrr0popJ
         cKH6hXhxce5naO5AG1w8Yi349JfTivzXNWn8llrnjv7HROLgtkkKcGsNHWP8YaX/JPdk
         8vnG2q/tGxrnIRCfTwIlhaWhu2BZwo4fLp/mh47+OryaMxBC1Ej0WEk899iGIFmEdxFp
         ZeYGY4mfog48wpA1HTcYhThKFaRw4u15o5X3AZSkErqKjb19Ur1OfffiDzolCd8kW7R4
         P0ecancGSmz9MXyp/qTFDafbievgBWD5Es36TpjtCdTcepIRl9PrKjjReYtx9TXAbCa/
         WS6g==
X-Forwarded-Encrypted: i=1; AHgh+RpEPPwTbscYuFIITPEUtWj7O7jYuR3MBuYmLL30tFoK0SPga2Y//s7//Z41CJlHuWgrBJvzVCeuo3m1@lists.linux.dev
X-Gm-Message-State: AOJu0YxpO88wcf27X2NACy/YzoeNc6H+QQNqi6C6ZlM/TzP0tAKaLEH3
	4culraF6LOAdzV4+VAxnb14P5CDgx89b3O7ZNHr7ZOlpdPc35a+EJqCPi2fU4rmIHHD3Nw91C9n
	ZAqUAmA==
X-Received: from pjbnl12.prod.google.com ([2002:a17:90b:384c:b0:380:8669:e33b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c03:b0:37f:9ce3:ca96
 with SMTP id 98e67ed59e1d1-380aa20dab8mr1881109a91.31.1782922169200; Wed, 01
 Jul 2026 09:09:29 -0700 (PDT)
Date: Wed, 1 Jul 2026 09:09:28 -0700
In-Reply-To: <584a8f9a-1538-4f8b-b576-75ef0fa961c7@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-17-9d2959357853@google.com> <584a8f9a-1538-4f8b-b576-75ef0fa961c7@intel.com>
Message-ID: <akU7uAKb5E_Tklx-@google.com>
Subject: Re: [PATCH v8 17/46] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2
 ioctl
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Xiaoyao Li wrote:
> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> > @@ -4969,6 +4973,11 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> >   		return 1;
> >   	case KVM_CAP_GUEST_MEMFD_FLAGS:
> >   		return kvm_gmem_get_supported_flags(kvm);
> > +	case KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES:
> > +		if (!gmem_in_place_conversion || !kvm_supports_private_mem(kvm))
> > +			return 0;
> > +
> > +		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> >   #endif
> >   	default:
> >   		break;
> 
> this looks inconsistent with the
> 
> 	case KVM_SET_MEMORY_ATTRIBUTES2:
> 		if (!gmem_in_place_conversion)
> 			return -ENOTTY;
> 
> Well, the check of
> 
> 	if (!kvm_arch_has_private_mem(f->kvm))
> 		return -EINVAL;
> 
> is buried in the following kvm_gmem_set_attributes(). How about moving of
> kvm_arch_has_private_mem() check to put it along with
> gmem_in_place_conversion check in kvm_gmem_ioctl() in Patch 13?

Me confused, patch 13 already adds the kvm_arch_has_private_mem() in
kvm_gmem_set_attributes().

That said, the ordering here is wonky and misleading.  A cursory read of the series
would make one think that waiting to advertise KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
makes it safe/ok for KVM to plumb in support for KVM_SET_MEMORY_ATTRIBUTES2 over
multiple patches.  But that's not actually true, because the ioctl becomes live
the instant the code exists, userspace doesn't need to wait for KVM to formally
advertise support.

To further confuse matters, it is actually safe/ok to iteratively add support,
because it's all effectively dead code until "Let userspace disable per-VM mem
attributes, enable per-gmem attributes".

So, I think we should go a step further than what I think Xiaoyao is suggesting,
and fully squash patch 17 into patch 13.  That way the reader doesn't have to jump
through as many mental hoops to piece together what is happening.  It'll obviously
be a bigger patch, but should be easier to review/understand overall.

Oh, and that combined patch should carve out error_offset straightaway, so that
the full uAPI can be reviewed in a single patch.
