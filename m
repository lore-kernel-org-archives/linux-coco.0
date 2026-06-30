Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A03B3DEAC9
	for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 18:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843498; cv=pass; b=vAyVCLJoN6yRpEodMgxKYqPCs0OKhnj7QgbCGH8T9WiKrOHzItncYMyMUswcUQd74xrpp0LOeKVcxuDnN6D1jUFGSGOudHVPnp+mr8qLzoSNZa3f/OAWIR2OhqXLk6BJciR556pUnFEEkWMKGIU6rDaL87J50W7Ubssrit86ih0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843498; c=relaxed/simple;
	bh=uyUPA3g5JaVFIdW6+eNaI4XKeB9g+sCUKwxpwq7LcqY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7KgSMaIjC23TQHHmgjzCQNcTymFCuGSwKp1adZHGvyo1FjyCv37Oj/HX/nc8YYVHZPdboTH3ajjcWLjrU7GgF5BhQOuPCBKJkRIndeZ6FYcBxzonDxA7jpcrdHc0dWgxXbh3C9P0CaHiiGnH51KqR7TuRuJaUcO3uepQOHlCCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wjNKNavx; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wjNKNavx"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137dd4cc208so975316c88.1
        for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 11:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782843496; cv=none;
        d=google.com; s=arc-20260327;
        b=Y6CdD3UQ4zESGyb/FVXGOr2bagCvFdBPh78qZud2AN8BGNnNfKGaczXqnE3R9GMhAT
         ysahFe2jXZlR9ibdYMoJJ7uioNh7MuSfUd+Sg4Xr4vMz2C7xUKhGkNiUk0AumxSyaKs3
         zyICWpMUGdcg6ljwci1oE+TU5/PZvGoTSEGhgo6oRmt6WXDtN1dy+olZQuyk2V741pSB
         2zY4MaRx/QmZyMjUZpnTB/DcdhE7j8jzcdR8it3nlNxyMpUIAzQ2A4Mf8zdcHouORPx5
         3MIR7jGSbtnddZImYV2fidfu4ZBfNPEhHtT6jav/QUFyYIZRszU06HdRy3GN+nHUzwZX
         AA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=70nUlSqxu0vMKYHD8svN4B2jvX9LwngvnuRYACmSwYQ=;
        fh=KBPZDPZmWMGflCLBImxjaU0rdrpQVfAluzLuSojt4Ks=;
        b=VlxQf/xfoE4mPUx22jVFUnGkdV8flBI48G83deM2biuyzrWGQPFJw6Jnhg/h1m7RBA
         RHNMuvcGgx8JwbiZqnov8k4o78EvdawCaId7iNrg3aZuKjqc+asuxSE/Tvgw/de3KQBo
         bFM7HrAXfyNP+jQ7s77i++F5m3Cs3maWOHfzSfagW6pYSbXjakmEmgtK26il2L0fmnwe
         QK8Xo5UZ955CW8qq5vkbLULCR+3vHh8tFdG8nCfATbMXplJUrArnDyjnfmxjpLQ+EUKH
         mTnZh66wfv5DZ/T1aBCxHmWve1xEx8E4a9+BVV1mO3EMqJmpCgOgyj9Eq/26s/tvt/Oo
         7eNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782843496; x=1783448296; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=70nUlSqxu0vMKYHD8svN4B2jvX9LwngvnuRYACmSwYQ=;
        b=wjNKNavxhnvyKPC/qUyZvbUHWrBLh8MXfbTCrVM/VZK349ucDj4Fmkj31ww4pMDy6/
         CH5vUAZ8Q0O8Q2p3eqsceeVC+uNks7/255dUbmJAGZh9mmAX2nzK5Yausiy3+KPy/kEo
         dzJv1HDGxfgDbI/AFiCQwBI+LWopLmMrrwDYumu/FF5xaW3vWqoRrZBbEOdZ2powI9IH
         icAUugWUshPvtWRtTzjOtA9i8ZMvT2E9gf/cVlYZ6ITkvS0lfUmIJzFmlDtWv/CGseVv
         BURMTb3yaab1TnYSK+Tby7suJ1jqTp872EoX7duu06xiweB23o8E60mGpl5Ho/70Dxt2
         XS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843496; x=1783448296;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70nUlSqxu0vMKYHD8svN4B2jvX9LwngvnuRYACmSwYQ=;
        b=ER2fm7jdKOIscYD1wh53qA7RcVrlzGEdDIjB3eVIbN5zb2clqgzXOpardd03K18JPp
         O/ilzA/4OD44X/uyHi8ZRS2Ex1RGxzWPgRvzclu+YqiDlIKevqGSzMRVMW0upyWCGDOU
         oPu9Ogt4N3ZvQNzYLuLgWRrnSjMeeysbDv0qVOTEz/5QDvdEKrRjjGW1sNeKerdXeaq8
         +/LBaH5xea8ter6zcd5CLTzms8z9hTZ0El78PTVLVvf3R8yRBh8LW6NmjMKPcom40nRR
         ig91SU9k4IwCXJzEIuabRghtJVREcMtHCFJFwfwXgO+V008X54O7o5xx64KqUteX5ONh
         lHlA==
X-Forwarded-Encrypted: i=1; AFNElJ/OdPZG+ILYiG0yV9fSsAQZmq7j8WVcKmL4QiWgJM2wCcg10jH7CUompgtYSaZh+XAarYRIwHFgY2xY@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3BV4G4ZYkWjJOsrU0wXqxG4hDORCoyknKzOmsGn8Pnlox3ftl
	wUw61oj4OGGXjqJrtYzm/Xade+LTTNzD8UwG6813M6J7vPZo7LkRe4v2Bh0CmzF01JrPyW39tV8
	JwAnz//v3+TxNg6BCrEbUTSnPhyD5RCZ2hE+h1eT3
X-Gm-Gg: AfdE7clWX+n+8GiQO7gVkErdmiIeeQmpYtfZTXQzvbgbQz82V0kinimA9UqQTp9/XqX
	3Kn+qa6orkb6j/WX1bgSlZVkiYgAd3uP1rEum+cmi4/G1kueFyU5/qL+ZXJyONOHYr/o53lzJse
	MdWJh2bHXnu3maq6SHUI3oQh+uweKapmtKBB//10/aWIIMckDjQZRTzcmu4P/v6Oo00q/1NJETy
	e0nE6bhclZKbTW3xR3jEgV2DDj8Fi5cdivoWkTWDQYVSQOhBAw0uCk2tqWsMsRG7nDCn/fVw0EH
	BjmLRAyi7vHwIVp90zQZYHkuRhe6EuJwyzIS23Jv3mZ6bXMel8nobiOeuw0=
X-Received: by 2002:a05:7022:69a8:b0:134:d3bc:b4b4 with SMTP id
 a92af1059eb24-13b2e297d9cmr2024216c88.4.1782843495523; Tue, 30 Jun 2026
 11:18:15 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 11:18:14 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 11:18:14 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <f8937d16-4aed-44d9-a058-beff56eac4ad@intel.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
 <CAEvNRgEBiivp9tOHZnFmWvF6ek-Ar-m2B+hb=-H0dgAcM2=z8Q@mail.gmail.com> <f8937d16-4aed-44d9-a058-beff56eac4ad@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 30 Jun 2026 11:18:14 -0700
X-Gm-Features: AVVi8Cem8-UowhLlk7c1ovclqrg2M3qRhpAj-mMpux06fGqtT2DmMJG-urIjBYo
Message-ID: <CAEvNRgFLjt+-cO-XT0s8uW2xXgyd+VVZ0g0Os6V0+LBFQzx8cQ@mail.gmail.com>
Subject: Re: [PATCH v13 13/22] KVM: selftests: Set first memory region as
 shared if guest_memfd
To: Xiaoyao Li <xiaoyao.li@intel.com>, Lisa Wang <wyihan@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 6/16/2026 7:46 AM, Ackerley Tng wrote:
>> Lisa Wang <wyihan@google.com> writes:
>>
>>> Set the initial state of the first memory region as shared if it is
>>> backed by guest_memfd, so that the KVM selftest framework functions can
>>> populate mmap()-ed guest_memfd memory the same way memory from other
>>> memory providers are populated.
>>>
>>> For CoCo VMs, pages that need to be private are explicitly set to
>>> private before executing the VM.
>>>
>>>
>>> [...snip...]
>>>
>>> @@ -495,14 +497,16 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
>>>   	vm = ____vm_create(shape);
>>>
>>>   	/*
>>> -	 * Force GUEST_MEMFD for the primary memory region if necessary, e.g.
>>> -	 * for CoCo VMs that require GUEST_MEMFD backed private memory.
>>> +	 * Force GUEST_MEMFD for the primary memory region if necessary, and
>>> +	 * initialize it as shared so the selftest framework can populate it
>>> +	 * exactly like other memory providers.
>>>   	 */
>>> -	flags = 0;
>>> -	if (is_guest_memfd_required(shape))
>>> +	if (is_guest_memfd_required(shape)) {
>>>   		flags |= KVM_MEM_GUEST_MEMFD;
>>> +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
>>> +	}
>>>
>>
>> Just noticed this while hacking some SNP tests.
>>
>>> -	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
>>> +	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
>>>   	for (i = 0; i < NR_MEM_REGIONS; i++)
>>>   		vm->memslots[i] = 0;
>>>
>>>
>>> --
>>> 2.54.0.746.g67dd491aae-goog
>>
>> I think this patch should fully buy into in-place conversions, so we
>> need to also set GUEST_MEMFD_FLAG_MMAP:
>>
>> @@ -483,6 +483,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape,
>> u32 nr_runnable_vcpus,
>>   {
>>   	u64 nr_pages = vm_nr_pages_required(shape.mode, nr_runnable_vcpus,
>>   						 nr_extra_pages);
>> +	enum vm_mem_backing_src_type src_type = VM_MEM_SRC_ANONYMOUS;
>>   	struct userspace_mem_region *slot0;
>>   	u64 gmem_flags = 0;
>>   	struct kvm_vm *vm;
>> @@ -503,10 +504,16 @@ struct kvm_vm *__vm_create(struct vm_shape
>> shape, u32 nr_runnable_vcpus,
>>   	 */
>>   	if (is_guest_memfd_required(shape)) {
>>   		flags |= KVM_MEM_GUEST_MEMFD;
>> -		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
>> +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
>
> GUEST_MEMFD_FLAG_INIT_SHARED is valid only when the memory attributes is
> per-gmem.
>

GUEST_MEMFD_FLAG_INIT_SHARED was introduced before guest_memfd in-place
conversions, so I think it's orthogonal to whether memory attributes is
per-gmem.

> we need to check KVM_CAP_GUEST_MEMFD_FLAGS or kvm_has_gmem_attributes.

I think we do want to deprecate the non-in-place-conversions setup, so
how about inserting a TEST_REQIRE(kvm_has_gmem_attributes) here?
