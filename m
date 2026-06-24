Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171B30D3EA
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782260018; cv=pass; b=gSnC+XWormP6YBEkRK8WOP21uS3zWudq4jFm9tI98HlyYOvdildCyeTgeh1vDrtKZUmL6W/v6HBTEZ/UQxn8dAUaTJT5hvv0BzQ9P6MiNjXpp2TIQl3dIiiZxjerk+yzEfb8ZSOKtNSh95I6wLI1Tmgt7C08YYcH7uP3VviSHio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782260018; c=relaxed/simple;
	bh=RYAvvdGH//Kw5GkREKpzN/KALBoM5gNnUxyEPrhaWUg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkyfUB7IfMypbak1Ep6S2ypzivHGPWmM6q2WQQCG3f/2KwzoiwEl+aULTpk1wnd6HAs2mvmSn5X0cGt/IZAzNEHldQr820/T1UTyocz/trfP49nC39BLAKD3UHo+wuLNrijNXmVKe4/Vlc5ic19ymF7rrgLwqkT/OAzDbgBUVaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HE5MOApP; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HE5MOApP"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137dd4cc208so678567c88.1
        for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 17:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782260016; cv=none;
        d=google.com; s=arc-20260327;
        b=ClWo3MN9DyZXUOFHVeDIFqkCHucYIC7DZRlv1cqGhS2KdFCEyn4/s+6Sf1OlOaSs8h
         UHasbn7RLEpRShBnBVlScnZ8r5bWgd2BMJMWFv6fnflat0fRPa0fy8ICPcHCqlmyOn4N
         QWa9s4dpS4WRGtqSEnqPnnAMjPPXoZXidAlIzSD80yZQy/NBre3KPXOTnBxSxv88Vmeg
         B4qbS37Rngr1449P5ZbUFKBNwoAWES0ZyPJRK7PqZjkL+6fJCxVaLX58dXARl4nimgO0
         olPXddkgEpCqMLjiIx2R15KQ5Lq9dO5sDS8XT/N+wz2fODtC4qWp08GoeY6ysY9pobdk
         gJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        fh=ZJyY+Q1QT4eV7qfJI87zcM1N4IwLzmtrZ42qfdZA2Uc=;
        b=boExkKiVWdSxHQ88LIYlcEvT9hzg19rKCyUNeuuyyNNjdX5pnCz1Gh3PKxRzePKKGU
         rGLqIw5xMEG66vBut/tvHUydfPXHydTD/SqnhrKlZg+R+/th/yLgGVBAZ4UWP8I+wMBn
         HD4oFyx5uC0eXF/dIIBxzthS0e1WKDS6PaI2fRTIbQp8l4NKy/IPukn5vWIB1bf9Ki6h
         J0AiZXtYTuD96B8KbsSaV9D+L5ORW+rXxKzOw9n6Plc2GKS1UgtM3QwKgCjVHWh4lk7J
         ER+WholRe+jEoFcMVOm/2u7pJWS9zeaBwdnIRNvrmrtcL51c6gYeko1vlTCIIqjbWfC0
         ibGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782260016; x=1782864816; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        b=HE5MOApPLB49udzx1Fjudh4GpBadOIy1xvA9SawgyTGaN9ZSqV/uLQh/ZgOm6072Ao
         HZuFc1Ag1u2sGkgGxCtDo2ITbWpQEfdolykEmx/X182eMkoL9HUM7wB0ox+rjQgHLS4P
         qGqkKXkgguGnwGYt3xtPu9lDsgnrc0IPMNzmKScIcjrbr5D1C5drFfGVJoPii52B4n9v
         DTeFPy3ejZk7jxnnY9ox4YPeY+N6HkiOkCj4J6pnlAkMxeJYJRsfstdvv6GRU2vfW2Es
         r6khV5rCXGfXy/giBM9F4p7qSnP7zq0Z5n8Ir2ImtQAHkLK+p6TdcDR6sQHJIVfmZtN+
         AhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782260016; x=1782864816;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        b=OdBzVtZVGKIE/wQ8jJ/cvmaxFcFk1GBkSsAyVbflZqKrU1Gy45NrtnWgieN21eXJxE
         SZC5iWOZLlNJSCNiNmOVMEPPUAd5qmNAQCo3OVg1v9MbHzLXYIwjyHeAXem7KyHHGRU+
         TxxLsr+ui+LtYWXQEJ3xjFIeqpEIZPDdKJFlbHVXumLuCamRkOcmgFhXhaYvRO3j2WrL
         EvK6mBYAURY8Dy7J5Y8TGcu8C3v/wKzDEJkcHgClYGcy/hDQNLqh2VPxGMEzPEXJxanE
         TWf1lCu/IfvGyanOlnsTubg5JK5jXAmOZUkN89Y0294UE+bB/gr9ym12DEqFbFhbW2SG
         yuGA==
X-Forwarded-Encrypted: i=1; AFNElJ/UAn5dwv5q1fcuOSIAaIK9LnLp8Hw9v0c4HvyxL10pfIoMtKR0t3OFtI0pCfcxLV84J9lHyRqjfa1H@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb1q2GSf/ChHKlG1q6kCn/uK0jz0sdDpeiMvInd58qsS+RsrWP
	WI9EY22LXEoQ30mTaIYRkzmJLHhRum6VwRBqRokc6KqfoJbkj+OafxyoX873YeyBqoJi6zYEwhO
	XeICNyedCnXyfCWaT/AkASllu9gqs/J4idbubE9yq
X-Gm-Gg: AfdE7cks/7B/INyfZ1uPvytVC6sdGUf8hFAbb0F4NhkcrgsOH9lIAUwaiNxPemSiEQo
	w6Io53NsJnBeYm11Dj43MFDgllrPOi5/9Jqbi+O/EEDjfKhKoVDyIVNlxwL1Fh6PJ8qP98orHCJ
	QeaBAtWn/6lT9aTn7SDtmWMIb8aNHQ+ioAhfwIwwk49S9qcxAu9Sp0fZ9J686k9EZmD87bL6SC6
	jlXxCHuwWwquruNA4dJGHCD6++bqXqbr+Ag4/fBV9iCDO/AdHCUXHnE5y52JSpo1usNno4/Xhgq
	sFfG0+XqyB4ogp4RvM9rlFNPbTLOJWL6nK69bdbBuNGuYHrVEXdpfD5th4I=
X-Received: by 2002:a05:7022:fe05:b0:12d:c3d8:1f95 with SMTP id
 a92af1059eb24-139c3c12ca8mr4394599c88.4.1782260014848; Tue, 23 Jun 2026
 17:13:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:13:34 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:13:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a21bfc05-787e-4cd8-89af-8579357e6a12@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-4-9d2959357853@google.com> <a21bfc05-787e-4cd8-89af-8579357e6a12@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:13:33 -0700
X-Gm-Features: AVVi8Cdxrjo0g3tR27IbX_VUitZ5rT0F_mHH6JHHegralypGAFX77zV4x7wFDNs
Message-ID: <CAEvNRgGF+O7r-YHqcLp-ZgoXTCbqjuUhpOdD5eE5w2wu3YYYpw@mail.gmail.com>
Subject: Re: [PATCH v8 04/46] KVM: Decouple kvm_has_arch_private_mem from CONFIG_KVM_VM_MEMORY_ATTRIBUTES
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

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> When memory attributes become trackable in guest_memfd, the concept of
>> having private memory is no longer dependent on
>> CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>>
>> With this, on x86, kvm_arch_has_private_mem() is defined if some CoCo
>> platform support (or the testing CONFIG_KVM_SW_PROTECTED_VM) is compiled
>> in.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>
> One nit below.
>
>> ---
>>  arch/x86/include/asm/kvm_host.h | 4 +++-
>>  include/linux/kvm_host.h        | 2 +-
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>> index 8e8eb8a5e8a6b..1bde67cf6eb0e 100644
>> --- a/arch/x86/include/asm/kvm_host.h
>> +++ b/arch/x86/include/asm/kvm_host.h
>> @@ -2394,7 +2394,9 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
>>  		       int tdp_max_root_level, int tdp_huge_page_level);
>>
>>
>> -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||	\
>> +	defined(CONFIG_KVM_INTEL_TDX) ||	\
>> +	defined(CONFIG_KVM_AMD_SEV)
>
> Nit:
> Vertically align the defined(XXX) statements for better readability?
>

Sean had this aligned with spaces, and checkpatch complained about
having no spaces before tabs, so I switched it to tabs instead since I
don't think alignment like that is officially documented either way.

Either way is fine :)

>>  #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
>>  #endif
>>
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 201d0f2143976..d370e834d619e 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>>  }
>>  #endif
>>
>> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#ifndef kvm_arch_has_private_mem
>>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>>  {
>>  	return false;
>>
