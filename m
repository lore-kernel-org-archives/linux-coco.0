Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B884DDB41
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 21:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286789; cv=none; b=t1vWVhj4wod8JFxJHHQAs9xnV8uzDTPYVZvZ/M/9oeR36BJseavm2MKGZcQvsTUfAm+n4YfHpCj1Mx8bm1/pkPV+7KIpWOo/9syK5NEJshnSVSi5ctkpFqF5OxqG0L0Ah0LPkSRHqd8uPMPOu9y1Oo0AWSJc/SJTfXfrZLoW8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286789; c=relaxed/simple;
	bh=d9PT2GdoWFZBMlVJHZrFv1etxubcAqj+sYkXP3zDxNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ANtZfVSBCQNYQuD1cWfcAXwTOy6tZyXQBEeuqPSNfzaGdp9OE3v6zJ9Z/GcOq5bVcS9OoxVR7clfG3v5G3xFRexVJPHAczmG188kpj7C7iYJEltUglikAuHHM1tLApem+wBtsQclAj9kG9s7IeddsgWGSIz9dFkL3mvUS1Rj3+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JqYvomQt; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JqYvomQt"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-855f662439aso390687b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286786; x=1790891586; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96howwJpIzasaCW/3Q0EcsFpl6itohsELojaGu9d8N0=;
        b=JqYvomQt+7LQiTk5gxb6KDxaWKaUFOsreYeLY+jfyu/Vi+fy5mGde71utugquvvCLf
         R5XJB2gAPoyWQZfzN7PT6FFDfA/5T4v3X7UvK0i/ise5b2bJ23aLQZqTnETJ2ERy3XAl
         e98LA8QjMBeDFfQSMraZ0i+0VrGJtLlSabP6yxs0keZDGN45zmDpmp8jw6AP8fv1Tr/g
         uuDljAep/5oIoMfyY+JLrWCrYRoPugcV7/NDMt3fCHKuzm1BrjpHnJlymGXBEuVksUGn
         Ys0M4wrkR2DhoUQFsbwDKzcHe6kgZfxZbu+ye/shr9vz6ipEgJszO3KCYhktbs9OwF7t
         rGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286786; x=1790891586;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96howwJpIzasaCW/3Q0EcsFpl6itohsELojaGu9d8N0=;
        b=Gk16IKV6cNior2/mxG3MvNl1sOlgEwD4ZWigA9dQZ9+cnzCKXijjcGTea9gInWt+Rf
         HUex3E9ba+Z6gX3bsHL/uTAg4flHwdjNjUAVeAUFhdezYDH/n6tc0iZv4ygLk8u2VpHm
         JQtxOCoiSsxj36LoBBWOch5v8WPtC6RSeusw1g96dDnbijT+BBww+yeMKEz9XjwfiMMU
         jmFULrAin5Y/YahQO/WWaWsa3PJVs217Qi5hEAOiajWuFM7cqNINVuYe8El8wcIIjP2A
         gn3+cHl6X3I87Sz2Ffy9MSGwZEqFJZKYTgDzenL0Lm77mkNoAM16FZRKUVjv0nSlawfJ
         ADnw==
X-Forwarded-Encrypted: i=1; AKwUvBxt4ir1M+6mbtPvk1dzGOg9FSl4xFVckeI2BR3xb5WREnLJ5bhU6Ta943Q8BaBrQH9MLA8n6NM01YWn@lists.linux.dev
X-Gm-Message-State: AFuF++m5r/kKCU7qgAMil5H3h0HgewPN4ExqgtGfj4mu0T6x37Y6eZzd
	9dAdoklnqwXIcgQJeSVbeKE3tDJctD+Snj2zUpBBor9pZX7kLrB5DXKj89Rx9wHGrDjL0kc9sEy
	7Zk4aNA==
X-Received: from pgbcw5.prod.google.com ([2002:a05:6a02:4285:b0:cc7:513b:37d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:439e:b0:3d3:ae50:97ce
 with SMTP id adf61e73a8af0-3de0e755869mr3534504637.27.1790286786082; Thu, 24
 Sep 2026 14:53:06 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:51:49 -0700
In-Reply-To: <20260910-gmem-inplace-conversion-v13-0-dd6fbf94f4e1@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910-gmem-inplace-conversion-v13-0-dd6fbf94f4e1@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028368162.2007072.12117327378679658047.b4-ty@b4>
Subject: Re: [PATCH v13 00/44] guest_memfd: In-place conversion support
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 10 Sep 2026 16:55:26 -0700, Ackerley Tng wrote:
> Here's v13. Thanks everyone for the comments and fast responses!
> We're now at ~3 weeks to soft-close at 7.3-rc5.
> 
> v13 is based on 7.3-rc2 and:
> 
> + Hugh's patch to export lru_cache_drain_for_folio()
> + Another series [1], which makes kvm_gmem_get_pfn() NOT return a
>   refcounted page to KVM.
> 
> [...]

Applied to kvm-x86 coco.  A *huge* thanks to everyone who helped with this!

[01/44] KVM: guest_memfd: Optimize away conversion overheads via dead-code elimination
        https://github.com/kvm-x86/linux/commit/54623a16bbdc
[02/44] KVM: guest_memfd: Use kvm_mem_is_private() when populating guest_memfd memory
        https://github.com/kvm-x86/linux/commit/fa7b8b1bb5d0
[03/44] KVM: guest_memfd: Introduce per-gmem attributes, use to guard user mappings
        https://github.com/kvm-x86/linux/commit/1ae5be958ff7
[04/44] KVM: Rename KVM_GENERIC_MEMORY_ATTRIBUTES to KVM_VM_MEMORY_ATTRIBUTES
        https://github.com/kvm-x86/linux/commit/44e17d0a3663
[05/44] KVM: Enumerate support for PRIVATE memory iff kvm_arch_has_private_mem is defined
        https://github.com/kvm-x86/linux/commit/c2ae2bc1a311
[06/44] KVM: Rename memory attribute APIs to prepare for in-place gmem conversion
        https://github.com/kvm-x86/linux/commit/a84ef89cbf91
[07/44] KVM: Rename kvm_mem_is_private() to kvm_is_private_gfn()
        https://github.com/kvm-x86/linux/commit/98fd6e30bd14
[08/44] KVM: Provide generic interface for checking memory private/shared status
        https://github.com/kvm-x86/linux/commit/8ab5719fbcdc
[09/44] KVM: guest_memfd: Stub in ability to enable in-place shared<=>private conversion
        https://github.com/kvm-x86/linux/commit/ee1168fb7313
[10/44] KVM: Consolidate private memory and guest_memfd ifdeffery in kvm_host.h
        https://github.com/kvm-x86/linux/commit/bcc640eabbb2
[11/44] KVM: guest_memfd: Invalidate both SHARED and PRIVATE mappings for in-place conversions
        https://github.com/kvm-x86/linux/commit/e088c7f86bef
[12/44] KVM: guest_memfd: Always fault from guest_memfd if in-place conversion is enabled
        https://github.com/kvm-x86/linux/commit/2e646bcfcf90
[13/44] KVM: guest_memfd: Pass mapping type filter to invalidation helper
        https://github.com/kvm-x86/linux/commit/2f7f4e102880
[14/44] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
        https://github.com/kvm-x86/linux/commit/799c9fadc639
[15/44] KVM: guest_memfd: Ensure pages are not in use before conversion
        https://github.com/kvm-x86/linux/commit/dcde2f853ff4
[16/44] KVM: guest_memfd: Call arch make_shared callback for to-shared conversion
        https://github.com/kvm-x86/linux/commit/6fa1dab756fd
[17/44] KVM: guest_memfd: Return early if range already has requested attributes
        https://github.com/kvm-x86/linux/commit/856852ef2108
[18/44] KVM: guest_memfd: Zero page while getting pfn
        https://github.com/kvm-x86/linux/commit/cb0544296a33
[19/44] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
        https://github.com/kvm-x86/linux/commit/edcc3f42981e
[20/44] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
        https://github.com/kvm-x86/linux/commit/af602a96f401
[21/44] KVM: Move KVM_VM_MEMORY_ATTRIBUTES config definition to x86
        https://github.com/kvm-x86/linux/commit/31670c382efc
[22/44] KVM: Let userspace disable per-VM mem attributes, enable per-gmem attributes
        https://github.com/kvm-x86/linux/commit/537ec2b15fdd
[23/44] KVM: guest_memfd: Enable INIT_SHARED on guest_memfd for x86 Coco VMs
        https://github.com/kvm-x86/linux/commit/b5ed1ee2a7a0
[24/44] KVM: selftests: Create gmem fd before "regular" fd when adding memslot
        https://github.com/kvm-x86/linux/commit/b312cab4e48c
[25/44] KVM: selftests: Rename guest_memfd{,_offset} to gmem_{fd,offset}
        https://github.com/kvm-x86/linux/commit/8d5f49000f8b
[26/44] KVM: selftests: Add support for mmap() on guest_memfd in core library
        https://github.com/kvm-x86/linux/commit/ee455183c92b
[27/44] KVM: selftests: Add selftests global for guest memory attributes capability
        https://github.com/kvm-x86/linux/commit/c3e48c166e35
[28/44] KVM: selftests: Add helpers for calling ioctls on guest_memfd
        https://github.com/kvm-x86/linux/commit/0bbbd2b02bf0
[29/44] KVM: selftests: Test basic single-page conversion flow
        https://github.com/kvm-x86/linux/commit/eaef4ed5fabc
[30/44] KVM: selftests: Test conversion flow when INIT_SHARED
        https://github.com/kvm-x86/linux/commit/e5fa04dc920e
[31/44] KVM: selftests: Test conversion precision in guest_memfd
        https://github.com/kvm-x86/linux/commit/492080a3d4e5
[32/44] KVM: selftests: Test conversion before allocation
        https://github.com/kvm-x86/linux/commit/97137c140360
[33/44] KVM: selftests: Convert with allocated folios in different layouts
        https://github.com/kvm-x86/linux/commit/5362c5fb88f6
[34/44] KVM: selftests: Test that truncation does not change shared/private status
        https://github.com/kvm-x86/linux/commit/bfb9b5a286ea
[35/44] KVM: selftests: Test that shared/private status is consistent across processes
        https://github.com/kvm-x86/linux/commit/8b72eaa766b6
[36/44] KVM: selftests: Add helpers to pin pages with CONFIG_GUP_TEST
        https://github.com/kvm-x86/linux/commit/e8a40b9a604e
[37/44] KVM: selftests: Test conversion with elevated page refcount
        https://github.com/kvm-x86/linux/commit/0db3f14f40c4
[38/44] KVM: selftests: Reset shared memory after hole-punching
        https://github.com/kvm-x86/linux/commit/c235250e8bc1
[39/44] KVM: selftests: Provide function to look up guest_memfd details from gpa
        https://github.com/kvm-x86/linux/commit/ee6f4c381903
[40/44] KVM: selftests: Provide common function to set memory attributes
        https://github.com/kvm-x86/linux/commit/f49dd8ba330e
[41/44] KVM: selftests: Make TEST_EXPECT_SIGBUS thread-safe
        https://github.com/kvm-x86/linux/commit/ef72e71da099
[42/44] KVM: selftests: Set up page size and alignment independently for guest_memfd
        https://github.com/kvm-x86/linux/commit/710169986d9b
[43/44] KVM: selftests: Update private_mem_conversions_test for in-place conversions
        https://github.com/kvm-x86/linux/commit/e24e534ff850
[44/44] KVM: selftests: Update private memory exits test to work with per-gmem attributes
        https://github.com/kvm-x86/linux/commit/37e0791600e5

--
https://github.com/kvm-x86/linux/tree/next
