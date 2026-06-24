Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20CB2DC350
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308680; cv=pass; b=dQ8sXopgy6RUsF7mom6melaCyUmzsDm2GDurrHQMXFvWBubHJRZ4BNVZVk9tbbapGS0j2qPxhZJA8eOfojhY2bO6c/k1vrVAaxzcvf7sf9u3TXxUccKvO75RfUsoJ7ak7/5s7A7W1yAxsRhK11OafMxvsrNxShzO9P70twjG94E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308680; c=relaxed/simple;
	bh=qwRcQ/ClJ9JG4ryGwIJuvq/o3tliB127/9EJbI1JGOU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK5Sf33WDdXMvUmJIT8axJvMoO+2o+Yka33Jdi61HqpkS84eR6KVxtEOB9jRlJbKCXGussMCvsWF+cQLkRtiakPcZSqyYTyRhuUa9/UNGJbQU90WLrXT+o0Qr1QWDrp04L88c8sgXw54SPUwWS08Kn3W12YD697j/vzro80Yzhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PdAdTKE9; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PdAdTKE9"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13981833e13so1254419c88.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 06:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782308678; cv=none;
        d=google.com; s=arc-20240605;
        b=hTOqQSSKqOlAAN+7ww0aeFO2bh3ki/3knx4CjELegTy6Hx1Pn5e5Be1F/uj8BhUIkI
         T3MVvmHqKWEM43pkyj7f76+EnSBTKK/bGRhwZpZsP0Yi3udxgBrOSilS2pk0TLe6yBAC
         KcMPRlwRl0zMp7GYKqJJwD0HN6Kf0TVNy5vfdXK+xeng3LS3mt42GiPV6NSI4B0j7Irv
         gGJJpqU8trA1wmHmjJHepz2SHvaDJ4QWEhsKeSnRR0q0Dfvs/YvIR4rRKVIduW22fMPO
         PMKV4b+eqD+rwtOP07UcSerJyn01AbPa/wZNdG1DplAgADpBsPv7fi4wa16hccipx/5x
         xsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        fh=UzDbGwTy/5jJH8wihtLKRASi29OHjLAtuvQ5bBVOSEw=;
        b=RrsmKYnII2oE69YxgNXOTQUWhRPRkvcVL14bmmOihTfoYjzco+FgyxUGllzIfC0Zq/
         ywa0LBdpyiuHLR/hw1xNWljQciRaQLFZQzUbriHQ0D2j6XLmnTBug7ejubg/XKWX55Ba
         BewS22bpsSKdzEKKh+EIEg7gqZ3duPamGNlHr44P3hlbYGP+vOFHtt8JS06vc5XR6ttk
         9LBo0CHxX7pTppcb5p4lG5WRPJm9YImBPW6X4bOWes5dmAFt3DWSFfVb6bWrB0j2K+jL
         yxnNmgdTVRyMwXmYLta57yzp4xK/5JtLBI9TQTgYKrAG5P1i45+wSu+dRHImHIsqfK0n
         h1qA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782308678; x=1782913478; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        b=PdAdTKE9ii6KLS4AgxjqIT28TUeStbkJ/TrgaorFnz/nF5RGlxPw8sSbFAVacHrdj+
         E1wghiqsKAX8iArBevh/QtzaNaCUOs0jlMsw4uKRX5aZljkGOVYxeOxocugzyj89gZvN
         waGRZ033L+hrg3lm3Kik5/hjx8TDONfQUKHaQAdVBnrwFlqOA4SwRK7ftRRFcupWEEfP
         esVb26Gkus6WQ2QtKOQWtbMtLPV/BswUBsFSPJRcMADCC9ORpa0Zt49uevHU5OrdRs1i
         MFk/qeyMdLnM8ejku4XqL4sJX7e8KzbztQ3a8la/x90lXZ/4VEdmiU8AbvwV4+sPcIvD
         TsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308678; x=1782913478;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        b=IMtZow6jUE7dhGqDCFVixA++ZsvArlfi63bYJPKa3+/ZYuvIA64m1oVoQNvKsj0V81
         MKOhSHKgIfJq/rJ2JHM5Ov5VCTKMM40+1VNRDgwnvJoY162Uz4lJgr8w5PupXxPI05fp
         Nqalv/nBjv3FUCEYLMLgchpSUmuUT8k3OAFk7/WMXUj78YGIr0gbgc3/hQIQQwmDqSDU
         ei/MFBldSQ2Z9vwqwY/EvCLPSMqXgxXJukjA5nz81wUXHil5Hw1ShqCOoOlaAPjL2+zG
         a5+uLoLwpQ+QDyz/z5gADPKNIRqkGOukXq3Jl1M7MKG/0hfNuOfZVOiTkdSnBvB0cQpn
         Bm9g==
X-Forwarded-Encrypted: i=1; AFNElJ+L9SWlm4SrtdPPB3RouiFT8ZexrjJr+0Jb80f3g30TV8AiX1IbW28ZrbwlKlhCT2DUORKn4wPKceNt@lists.linux.dev
X-Gm-Message-State: AOJu0YwCoR1i0EtIKXdjHI2kPN7VfLaZAaR09BhkF7PhZjQftpkIl0kA
	PJnYetXAvI5aWIpXQdLf+G6GlwPzBVdur7v20NvDKO7z0EmBWv0xopJXYdroYF0SJHnUF5Pl3il
	xFKRjGZMsROR2t+ibB1VMOgmP9SfJ71z9r6HNaQ5Z
X-Gm-Gg: AfdE7cl3X+C8wtzev2e0Q8Y00i/3pe50K+wIBl9kjGWWRut9ZTqpgWPhkRCwIfRydRm
	NnkH3Hdp81M/V4LLn9Ri3HtEtVGRamCsb1BpOZUQ2FVRrMSJUwJJq/NEaB12U9HGSFmB3cs5OqZ
	B+RFRopU73fheeLBXxYp/GaEqSvj4hZ/wr/l1scrhkfigmSFqBcwImgkpW/+i4/Na3p8Q1SRY1v
	reblI6BVzZvtsShE9G5uUyYS/GlCxchKpzhxUjRLmPSbO7s2BTkqlG4u1PXlH+x+jK8Y2tlpgpv
	UoiKxhk9UWVFYfNMUk5dgXpCrxb7
X-Received: by 2002:a05:7022:ec0e:b0:137:eb26:10d with SMTP id
 a92af1059eb24-139c5b99857mr4976083c88.0.1782308676421; Wed, 24 Jun 2026
 06:44:36 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:44:35 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:44:35 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <96fb369d-dbff-4ed6-b1f9-0ce63d7d4ed0@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com> <96fb369d-dbff-4ed6-b1f9-0ce63d7d4ed0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 06:44:35 -0700
X-Gm-Features: AVVi8Ce7qJauzHB_wQ4GZOmMbMs8hfgU2sTfkjTDTjUh6bKjOQAsxLqy1nK_op4
Message-ID: <CAEvNRgGbBcrX5Fw3vNTsTOBNC=Ypi=9-S07674yPxLU9i4akjA@mail.gmail.com>
Subject: Re: [PATCH v8 07/46] KVM: Rename memory attribute APIs to prepare for
 in-place gmem conversion
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

>
> [...snip...]
>
>> +static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>> +					    gfn_t end)
>> +{
>> +	return kvm_range_has_vm_memory_attributes(kvm, start, end,
>> +						  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> +						  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>>  }
>
> This function is added, but never used in this patch series.
> Is it intended to be called only when CONFIG_KVM_VM_MEMORY_ATTRIBUTES is
> enabled?
>

Thank you for catching this! I think in some earlier revision this was
meant to be used from the guest_memfd populate flow.

I think the version of kvm_gmem_range_is_private in this revision is
good because it is symmetric. If conversion is enabled, call the gmem
range-has-attributes function, and if conversion is disabled, use the VM
range-has-attributes function.

Sean, if no new revision is needed would you be able to drop
kvm_mem_range_is_private() while you're pulling it in?

>>
>> [...snip...]
>>
