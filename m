Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412BE312834
	for <linux-coco@lists.linux.dev>; Thu,  7 May 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178718; cv=pass; b=VELKeWPhaoc9r9NU2AQvdxikuvYFOm2FV/GiogAGrdFRWTiy73z236iub+M9qkQbla/PXlHwdWSSysG8uZDYWd4uZ9oxhXnihzeokyj8pHzA3akPDCNl77qrZaEVTbgMw8dcLYATOJ2eUB7arhMeHGS30KmqcaaFJfyTovC1WrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178718; c=relaxed/simple;
	bh=9Gtd+5W8SMTR25ZmPIeA+8FPrVOqTlN7XkJgDdQpNlk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIqW1t6ZaQme5wOUnaBm8XMglKb1JQSxQ1fA34Zx8PAC514V3PD/abk1sdBPYRuokoeCgfiZtcXK67XDR4pgdj8V101zklYGIhz3uWeiqvu2Tmtu/eG4JYuP9gSWKcOYC5ap3Emie1aaaufLOoxW2NPHm3E1a8crSAcWNllmaxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jil10XIW; arc=pass smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jil10XIW"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95d18b33f93so658210241.1
        for <linux-coco@lists.linux.dev>; Thu, 07 May 2026 11:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778178716; cv=none;
        d=google.com; s=arc-20240605;
        b=c1gghk3IaxIcIV/ErKJONPwi0RWWxzdJ+hw4LyTGyjeIedMu2U1QEMHtvuVwfGuwX4
         W7PCs7Rv7ftcgfpaU//AmxIqsg4hUPtGdNix5N/i7sTCkJoiRGMUBBeaYvmW/v95gu1U
         rsJ9WiJ7WQShdpdbMEqg2/fsUloFD9aMER01mbu9CSQaPO82BnueDqQRUHVLOWbQfJEz
         QxbRXi2mcv3FqV+RUJpYSt1dkU8JQz6x+X/Boe0urZZ2RUAga+IUlwwLuR9uXmTg+W8B
         ZpJ/KUn9Dh7/5HYqC72+jgMGFy40Qjqao+wkEqDr1cH8mPqivO4JzVLBgqIGJ04KBVCC
         DnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        fh=GUTQQT/3sK7/KONuGHhSOlRr8BzJavCnffFuXzdTsxM=;
        b=CX1phIl4ui2HJgjbrh5KDQRKHYoErvYcksFg3GY+oX83n77Ixv63N3JqpwcEegqTw+
         qtHRdbJvqfCGCNOrRdSyt+IQP22eNDHrs7wb++zGcdw9YWKl0kKvBtCkjDLnb6lTG5xy
         6FmSJur61JFiKacIsvPyN1q69KicGjeTnfHW0N7wZEF7PZSdRrln0Z7grF17H4VwjAC/
         VA0YE9s0Ci1xy0hAttPVvqnslpmrJx3CvrAa9wd5dmPMmWHi91YlvkO7ccPCfhKkHZGx
         xZjqo4BSOcmV3tF/F+odGRgb+ITXyUJQZZZi4XDun79BHzIpv5AftcRCywuOPAYaOWzb
         jrOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778178716; x=1778783516; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        b=jil10XIWAdTDjkZ3BNB8lK0NBCGYwcy9rs+abvRyn9nT4r4xqENUDnGZOom+dkImOf
         jp9LItmqLu68NXwyN1kJra0Tp62RmIH7ydJVy/T7mp3nZ1BzbH2MgCKNACJ0tLZwUK+H
         FnZOQ2bolwu6OKlVJoJwBlrTpd7PmbCiRGy74RQbFIlfXLz1mL3cfXyCwDeHyp+LTXXh
         G5Ntoz9ukjJR+0hi31xHcrxgW18VYVHoUtvtnoeu1sF+HqIB2IEDbD40O+5FYk7bZcoI
         REYmBkWCMeDCF8RFL2ago2mKsct8XwH1YUpZwhDIn2ExfmZ5po2ivgpF1dHGZU46SArM
         m2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778178716; x=1778783516;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        b=ZSvk4odpT7YDnf7qWwhrEbJpn5uoe0o1dfZbc7o4RdA/lvVXshNMkxxEbTEUBFb6aq
         h+S5z+qugU/g0idNMCANnL08FaQ2tqPma7HDrvtZbDIKJhXb4toTtpr8F6fj+KH8wDjg
         BggaJ0A+Dl+H5aP4bUGrc62cPD9HZVLlUAEX4+K8p/wHYEhKPIHgU6u4P143b9wxekMc
         enfnOZvk1FYLCIPz5ca5dKYfkwIBhfgtyACBuVraNHGBhg14KE0FvGukJCHce5xhlEQC
         cbZ8rYgAmdlGdYUYestbnu9V94dR28wcDJ2EKQ66c87RqLBKpSvdJeHh7FMjaBkKc4Ej
         lqgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GUSKrvATFxA0/ONxMcKXXdTLCKMgZ85mjAIRNity6pNNCehSKtn8vFE7+vyf0coWa6WDA2Q9uu6i3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyge35+a7QM5pqA5p0ZZdal2WPe0qANNnjxlmVxsDgiArjK9Fyf
	ZDHy1aZqHkVRvIrmCKRVxj1J9srvNuQrceHqucsg3Ua28C/d9h3uPxi7nrNkqiOzSlDDRGrbVLj
	MOtabKMEetxQSDvgpmXp0BTGtIzMU+cAxYcQUQmnq
X-Gm-Gg: AeBDietzfNzq7GhvfnRNbYZWLSAjx5WM1iuw4J2nUQalgjS3iR14ux6t8KXGhDeT2GP
	9ECWWWdZCZb6R4NK/ptVaG5dZ6FdD8huvk4Dwnu9At2BpUrSILFFtFCAUBDgae8vXFSc/8fivir
	43hCAAT03vhc+dwuCFweiPrEqlDCM1VJb0Shn4SFARdx7hnGDCCzwkSgZhW81qrSjmSk60jaFKl
	39weWQ7djCrZmJOMGm+ZhM1Y+KqNdbcnLIs10JfsjLLkNZIWWLHKzqDVMraW1eC1PxLD/6TmPYG
	U+Qm/ASanP9flSzJyXFurNV8yGX8t94m3RNDebyUEHmRTAfOV9fgFhsTQkx960eco/09jxyGLxa
	4/yc1
X-Received: by 2002:a05:6122:6304:b0:56b:a7de:7129 with SMTP id
 71dfb90a1353d-575702cc825mr1528185e0c.7.1778178715530; Thu, 07 May 2026
 11:31:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 11:31:54 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 11:31:54 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <byywwfin2aenobdwuesqihm6nzxyx6ecedwgbt7f5tvaaul6fi@u7bmexpavwdn>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <20260428-gmem-inplace-conversion-v5-1-d8608ccfca22@google.com> <byywwfin2aenobdwuesqihm6nzxyx6ecedwgbt7f5tvaaul6fi@u7bmexpavwdn>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 7 May 2026 11:31:54 -0700
X-Gm-Features: AVHnY4IrLeBlt83AneVyVg35mAkmDcan1kch_gmoyAe0Nsgg7IVb__9uDe3mtms
Message-ID: <CAEvNRgFGc7SRy_hkfSH3X=Cu00CP6wMHBJO0+55uebKTezWVnw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 01/53] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
To: "Liam R. Howlett" <liam@infradead.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Liam R. Howlett" <liam@infradead.org> writes:

>
> [...snip...]
>
>> +static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
>> +{
>> +	struct maple_tree *mt = &GMEM_I(inode)->attributes;
>> +	void *entry = mtree_load(mt, index);
>> +
>> +	/*
>> +	 * The lock _must_ be held for lookups, as some maple tree operations,
>> +	 * e.g. append, are unsafe (return inaccurate information) with respect
>> +	 * to concurrent RCU-protected lookups.
>> +	 */
>
> Can you please elaborate how you see inaccurate information and which
> information is inaccurate?
>
> Your comment is incorrect and misleading as append will not be used in
> rcu mode.  Note that you have not set this tree up in rcu mode.
>

My bad. Thanks for clarifying about usage of rcu mode.

>> +	lockdep_assert(mt_lock_is_held(mt));
>> +

In the next revision I'll remove this lockdep and use RCU mode, and
kvm_gmem_get_memory_attributes() should get a stable result.

The other lookups using mt_for_each() in kvm_gmem_range_has_attributes()
and kvm_gmem_get_invalidate_filter() retain the lockdep since those
operate over multiple ranges. Those are called from paths that require
holding the lock to exclude other operations anyway, so the lockdep
requirement does not cost anything more.

>> +	return WARN_ON_ONCE(!entry) ? 0 : xa_to_value(entry);
>> +}
>> +
>>
>> [...snip...]
>>
