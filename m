Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B769568FB4
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964586; cv=pass; b=Szht8AY8+AaiHQvpAQywahHZwkf1PgyS728z1K45y/11YnAKieA1JWkERqML2z1iZQzHgC5CnyMRwOM4hao1zM44O6pEI2mzZr3p/vGVdgTY+vGepUeCuH1BG6DoASMoRiqiXy6VfxTsnoodr+XjPhg+x9wwlQa3Yo6bqHYj6sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964586; c=relaxed/simple;
	bh=7AyHAWTKyqNTciVM9XLOxi3jtsvJfGFJongziGZ+beM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8D9OCL3AAxQ0Dgx/gxIOepHhY/WTeyB+u9iTWUXUfXJIKpmHFlGmj4R9TYT6e4DHwbBPZbGaWvyMfX+VwfOtq1IrRoI2ghfXritQGPFdDMpbkQZCsuwcwYIC9/svDRl7VvCNF68pXV1EgPk0UVTkrlf78HRpkkTVADHuGqdpbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B3Up0+1y; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B3Up0+1y"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso51086356d6.3
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 07:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964582; cv=none;
        d=google.com; s=arc-20260327;
        b=lc0JIOIaiNCaTQPQa3+HDOJzDYKqtr4v4pDsAsBrd9cttpiOsIc+AYDL4nHpPTjEqO
         HJY7sl/pPNhUYEqUuckxGxgYBaOrIAvYQSLogGBG4c1vhsDJlqfHc3AahQ0YsLwjzDMf
         mdn2TtYcrF4vumZYqL8WRTK9QSD63ZehJxntLIJN/wCLHup9hwMBboYENwT185NOIpfl
         cG3NMsc6M24QCPaHjFAStEG+MFY4gkSFokQGLvvCwrUip2zo1Ec5Lwc0Wl8L4ZV83AQm
         Llm7K4gikyWYqUhA4LmvQr2WguvM1FFW3zjKrK3BspkBiqnlW6Si4e9Uo60p4bSovTfh
         S9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        fh=23x0WavGlssfWDWpNJ63AanIt43wSrBia3tSeRzSAXI=;
        b=nba/KJBde0sPQuStgbfXYsLdTjB1xaBllqP3RY0ggZh+WRBMzjOo+d5s5u+lIKvand
         ujJLEOMWnKA7Jolievso3hPfq3uUxz3MxicF6ugbMj3GNGfWp/buohfrif8OFaVVGvkA
         2ZUDA4H33HdCxMgWln/2NCb/Iye+Znp4AlHxpgVuJ9gH0EenoG+lmQTmIyFjdyepWT0N
         mYTNLLxBvgOEWtm0uzm5a6n0NjjRIa16RTM62XmzWIlYZHxv2kk0HLw3OmUOX7dr/77A
         JNHcmKLH1JiZ239HKMPx9/nLENl/j58w1uE+Vz8ey6cCbSwXhq38ZWrXhst82H3RfFQm
         PdKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788964582; x=1789569382; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        b=B3Up0+1yEnScaEJ4i6EmGQ1kqQBT6/ipaCMWHzV/Qp1ilp7xD5vVhjRr4DoDwNdGff
         EhZchFwTGhcuqdWXEPhHPUp4oXZNPo7bpZW2FTMgvd/zn07DGFx8oNPJcL0retD7OpSc
         BHZxf/a38sLUGzRDsbVkGi4jGXKwgg/7KUgRqOPmbp1k/HdGeuQTin42Pzhrq/88hmas
         +09gUVjI+HKrgll6zhqmh2+BJwv06le6JK6KM9aUarxg0dKYHjwT4ooZd/i5OhrgzRwX
         sSKNkw5yhWih4iQchbZER0sLYLcU1czqXyh2teFy3V99hM8UusDOAkKPXh1kMJdCz4uu
         HueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964582; x=1789569382;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        b=WyAtEZtsNJbwoU+kcGfS7+Y56bs7rApv4aCGcZWPKwJA4CYEjyy89sbjyjQotl2tNs
         QtxF9qNDRouCZGZtjnuEb9cSiRCeFGra1m3f6M1fajsVgzgCYHPL3QvfNCj4wwgMtwrM
         e32a4+TvXIsfo/MfEJy0mINKIN7oRuzoAqhkOGMiJMfpGS8bSJjj+78zZnZ1LkmxBXmq
         bZHIXcxYGvKLM4GBIUR1QImHTNcEP8+YZDt6lkhXnQxXnF1I64AxU9iLaFGiND9fsz7q
         H+ek9BeCRxUEVN58IM6r3lhOapxF38yWHvdaMJe8ahlKq1HdqwoAYP6gEXjp4r23uwXy
         GwHw==
X-Forwarded-Encrypted: i=1; AKwUvBz/fdNlfl366w5IEu8CY3DEQH/bkTGnwstJlsIsnTJV+Nk+DN/tYQ9gtkN05ojg5jCKDLY5IvVGZ/8s@lists.linux.dev
X-Gm-Message-State: AFuF++kjRHweuNUHopQOLekghHdpuNa0gHKiSjOKIdn1QI2/T/wkuk3R
	x7gZ8Zk51mQPuuP9PLg3SITn22K4NfEmMlLgBONahj5vnCIUnsv6IrHe4Tl08Cw4no7XuJAJ2Ot
	TWmk6//JmEM3HXB7UiTuCui0egcp5S+jcDJdHtAbe
X-Gm-Gg: AYBFou2CvuKyaVM3pVpMGa20/FMz9m4O9KZzq+p0roEGt//9hS6QdWiltIu4rLFesgK
	r4G4qPMcqO2iE1fXW3vEU5PoV8tL1OHvS0HfcHk3615IHpX0vZHq9b5CNSxM4is3IywCEbo0Gl8
	AOHOSChK+t3iW1tKxqncH/pRfaAMehabbWv3/Bhd5HR6aQTGy2qoF+nS21SUN8mdqyFDpTRZe8o
	JG+sTE21wbkpQcblYeIbQdEzalo8xmmqFaskZbxfU6sj9lcRXehPp93bz7fu1fyei/fDzhVH9dQ
	3pGuaplLOeD3YBaM67bwBbgzoE9bKn9s2TSDvWGxX9+nTlmQT3D1LI7KluWhcE4lnc47MaJxv4+
	LZFRN06984bU=
X-Received: by 2002:a05:6214:2f8c:b0:910:3451:341 with SMTP id
 6a1803df08f44-9103efb48afmr490270826d6.32.1788964580576; Wed, 09 Sep 2026
 07:36:20 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:36:19 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:36:19 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <apetw3aqXSawLBt0@yzhao56-desk.sh.intel.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-12-85e5fd25252a@google.com> <apetw3aqXSawLBt0@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 07:36:19 -0700
X-Gm-Features: AcwNN1VdQII_SBwvozqnLJxonm84Qmsr9AHJ5M73oMtr5q_ETKWllQrAhks6iFI
Message-ID: <CAEvNRgEmO-R35susJd+U+k-nB_yFE_gfh+ACrnaOR=ECJdWGuA@mail.gmail.com>
Subject: Re: [PATCH v12 12/45] KVM: guest_memfd: Always fault from guest_memfd
 if in-place conversion is enabled
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Sun, Aug 30, 2026 at 05:25:13PM -0700, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> If a guest_memfd memslot is created but the guest_memfd does not have the
>> GUEST_MEMFD_FLAG_MMAP set, KVM still fulfils guest faults by looking up the
>> memslot's userspace_addr.
>>
>> Set KVM_MEMSLOT_GMEM_ONLY if in-place conversion is enabled so that the
>> guest_memfd's memory will be used for both shared and private memory. With
>> in-place conversion, guest_memfd will be the only backing memory for the
>> memslot.
>>
>> No validation is performed to require userspace_addr to be a mapping from
>> the associated guest_memfd because even after validation, userspace is free
>> to remap something else at the provided userspace_addr.
>>
>> userspace_addr will still be used by functions like kvm_read_guest(), and
>> if userspace_addr does not match up with the corresponding memory in the
>> memslot's guest_memfd (whether userspace_addr points to the wrong offset or
>> some non-guest_memfd memory, etc), that is a user error.
>>
>> Requiring both shared and private memory to come from the only associated
>> guest_memfd simplifies invalidation in stage 2 page tables. On a PUNCH_HOLE
>> operation on a guest_memfd, the invalidation is now guaranteed to be
>> invalidating only memory mapped from the given guest_memfd.
>>
>> Suggested-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  Documentation/virt/kvm/api.rst | 22 ++++++++++++++--------
>>  virt/kvm/guest_memfd.c         |  2 +-
>>  2 files changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 90a29424c54c8..668886f50024d 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -6381,10 +6381,16 @@ mapping for userspace_addr is not required to be valid/populated at the time of
>>  KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
>>  on-demand.
>>
>> -When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
>> -userspace_addr vs. guest_memfd, based on the state in guest_memfd, which is the
>> -sole authority on private vs. shared memory.  See :ref:`KVM_CREATE_GUEST_MEMFD`
>> -to find out more about the creation-time shared/private status.
>> +When mapping a gfn into the guest, guest faults are always serviced from
>> +guest_memfd regardless of whether memory is shared or private.  KVM determines
>> +shared vs. private based on the state in guest_memfd, which is the sole
>> +authority on private vs. shared memory.  See :ref:`KVM_CREATE_GUEST_MEMFD` to
>> +find out more about the creation-time shared/private status.
>> +
>> +userspace_addr is expected to be the mmap()-ed address corresponding to the
>> +right offset within the guest_memfd. Any mismatch between userspace_addr and
>> +guest_memfd is not validated and is a user error. userspace_addr is only used
>> +for host-side guest accesses such as kvm_read_guest().
>>
>>  If in-place conversion is disabled, KVM selects shared vs. private, i.e consumes
>>  userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
>> @@ -6490,10 +6496,10 @@ specified via KVM_CREATE_GUEST_MEMFD.  Currently defined flags:
>>                                 page tables. Private memory cannot.
>>    ============================ ================================================
>>
>> -When the KVM MMU performs a PFN lookup to service a guest fault and the backing
>> -guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
>> -consumed from guest_memfd, regardless of whether it is a shared or a private
>> -fault.
>> +When the KVM MMU performs a PFN lookup to service a guest fault, the fault will
>> +always be consumed from guest_memfd, regardless of whether it is a shared or a
>> +private fault (unless in-place conversion is disabled and the backing
>> +guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set).
>>
>>  See KVM_SET_USER_MEMORY_REGION2 for additional details.
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 0afe1468d2d9d..e41802944756b 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -746,7 +746,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	 */
>>  	WRITE_ONCE(slot->gmem.file, file);
>>  	slot->gmem.pgoff = start;
>> -	if (kvm_gmem_supports_mmap(inode))
>> +	if (gmem_in_place_conversion || kvm_gmem_supports_mmap(inode))
>>  		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
> I like this change, which actually enforces in-place conversion -- when
> gmem_in_place_conversion is true, if userspace sets slot->userspace_addr to a
> different backend, the host and guest will no longer be able to access the same
> backend.
>
> However, since gmem_in_place_conversion is globally and statically specified, it
> essentially disables the coexistence of VMs using out-of-place conversions when
> gmem_in_place_conversion is true. Previously, VMs using out-of-place conversions
> could still boot successfully as long as they switched to using per-gmem memory
> attributes. Is this change intended?
>

Yes, this is intended. gmem_in_place_conversion is intended to be global
for the entire host.

> On a separate note, is kvm_gmem_supports_mmap() still a necessary requirement
> for setting KVM_MEMSLOT_GMEM_ONLY? When gmem_in_place_conversion is false, if
> userspace mmap()s the gmem but sets slot->userspace_addr to a different backend,
> should the KVM_MEMSLOT_GMEM_ONLY flag still be set?
>

Before this patch, requesting an MMAP-able gmem will set
KVM_MEMSLOT_GMEM_ONLY, so if we change that behavior, we'd be breaking
the existing contract.

If userspace requests an MMAP-able gmem and then sets up
slot->userspace_addr to something else, I think that should be
considered user error? MMAP-able => use gmem for all faults has been a
thing since before this patch.

Just like how there's no good way to check and maintain the validity of
the mapped memory behind slot->userspace_addr in relation to the
provided guest_memfd, the mapping can't be used to determine whether to
set KVM_MEMSLOT_GMEM_ONLY either.

>>
>>  	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>>
>> --
>> 2.55.0.897.gb25b4bd76c-goog
>>
>>
