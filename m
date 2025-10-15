Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757DE30103D
	for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760551559; cv=none; b=eo3Q0BRQE2IqtkmJnXmWVCRTNZzwtJphsGrVF2/In2lGVk1MR69Ktj636Ztbdhpm/VOblwRb42xqWPOz6phMwtsiUck64V5POCwOGYzVJALk0FVcz7VuZoCQexFXygZqq6gnF1liKe37nKPnJVW69QKomt+r4LWg1IqXxZHoNag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760551559; c=relaxed/simple;
	bh=ozdKul5OP276A3h3Wjm2x2XarpQcUWp1UVCAyeuTdSY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EY13QlapK3FKUhoa5euOvRGUiGbofUOcgj8rI1Ct69pZ6WHh/25lWa5ZEjOYfj3hOFx2Y3NL/8WDuhdmzsuHDluoqwFeMy+VU3/3jLID1e2Fq3JO6VOd8gjGkHJXXM4nERVu8XWnEnpJu0El9uAlXUfNkguxowOSSLokEe08fAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HdmjJfrR; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HdmjJfrR"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-277f0ea6fc6so233368125ad.2
        for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760551557; x=1761156357; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wj/ujD0eXtGvKYdVuuqLrx+hKA4SG0aPTcTudPvMU20=;
        b=HdmjJfrRFUcR/YacCnxjLA5l17zxhCYp/3FhvUVtyDXwCgCR56Udm3NuPO7fkySdjq
         5qfGw60ARo70Pq8rYptOF+XDK0CbyYDsbJrehtpoTKLWcEQgfhaTXNj33PZGFCJBEFJb
         1KOEc/hXM4y58G1PYbDHEdtQhjfLcRLsP+TlmnnKr3sX0lG2aTAcW5ELWXsa44h63gm1
         YSPX+IMrSdTP9w/xzp+6v1bFK6+Ld5Wio6Og5R3knviuHrBm9V9D7EJkXXfVUTsX/vge
         hPwkCsMeawOdujATtFFE6Htq7yOPZnL+xLhfljMZ5LhCD0bzsUeuBxu7t+8v4mmyITWI
         2mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760551557; x=1761156357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wj/ujD0eXtGvKYdVuuqLrx+hKA4SG0aPTcTudPvMU20=;
        b=IMLqdaxfoNL0yFbVQ0FVmrH4lpbYKBUnL4eLRpFNVNAYNWclXHuaAHQoMIROl5uUYp
         EUTQOCy8nWd11tT1BqfneU1jx0jGWMZOrz2cNNyEG9giGKCYYqUw3jAEJAxSaU1QJwvK
         Fs4se4i2VEUIYtmbug1uUV5Kbw5Z2QMYtZXTLHvA7CIdoOPnAKCtKWa12W+bZ+u1hIoW
         1uOqiGPl8zLvkbc5aiB8rQ6Je5B1AudXLi+PEFfQG0p9C2S5TZCmSAVBuk8AqJuF9YoO
         K/tZq61TcqKuLOAmC+xdR1Q0oh8bZ+iXOVdjDthii35rz5jjtGwd1ZjKtyAS56dObm69
         XRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFpNpYREey0lD5P9kfWRUN87EvQaxyXpUIztztVRFGuyiw9kQyg4MAWuKyeys7ZVmlwrLvofm7HVqC@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm05eH1+04Ru38tKsrbyKKKDcVlQKaFYnZrikuOzFQANHa+FrE
	HAHuYFZxxiEWoaPuBUEYGMlGS2NozaMIDOGdDvt3obBKe+iHgJj2EiNFzu37/RygPETpMRcQH6E
	t0c6Vxg==
X-Google-Smtp-Source: AGHT+IH/Mc5bux0nHPu+CkauZuwZIYiV046udmQ4p4yB6kgoXdVfplmR64sQJckJg1s2r9B+yaVqVDHEGb8=
X-Received: from pjrv8.prod.google.com ([2002:a17:90a:bb88:b0:32e:b34b:92eb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d05:b0:26e:49e3:55f1
 with SMTP id d9443c01a7336-29027373d9amr366930845ad.18.1760551555936; Wed, 15
 Oct 2025 11:05:55 -0700 (PDT)
Date: Wed, 15 Oct 2025 11:02:44 -0700
In-Reply-To: <20250827175247.83322-2-shivankg@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <176055105546.1527431.3611256810380818215.b4-ty@google.com>
Subject: Re: [PATCH kvm-next V11 0/7] Add NUMA mempolicy support for KVM guest-memfd
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, willy@infradead.org, akpm@linux-foundation.org, 
	david@redhat.com, pbonzini@redhat.com, shuah@kernel.org, vbabka@suse.cz, 
	Shivank Garg <shivankg@amd.com>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com, 
	xiang@kernel.org, chao@kernel.org, jaegeuk@kernel.org, clm@fb.com, 
	josef@toxicpanda.com, kent.overstreet@linux.dev, zbestahu@gmail.com, 
	jefflexu@linux.alibaba.com, dhavale@google.com, lihongbo22@huawei.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	tabba@google.com, ackerleytng@google.com, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, pvorel@suse.cz, bfoster@redhat.com, 
	vannapurve@google.com, chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, 
	michael.day@amd.com, shdhiman@amd.com, yan.y.zhao@intel.com, 
	Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, michael.roth@amd.com, 
	aik@amd.com, kalyazin@amazon.com, peterx@redhat.com, jack@suse.cz, 
	hch@infradead.org, cgzones@googlemail.com, ira.weiny@intel.com, 
	rientjes@google.com, roypat@amazon.co.uk, chao.p.peng@intel.com, 
	amit@infradead.org, ddutile@redhat.com, dan.j.williams@intel.com, 
	ashish.kalra@amd.com, gshan@redhat.com, jgowans@amazon.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, yuzhao@google.com, 
	suzuki.poulose@arm.com, quic_eberman@quicinc.com, 
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-coco@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="utf-8"

On Wed, 27 Aug 2025 17:52:41 +0000, Shivank Garg wrote:
> This series introduces NUMA-aware memory placement support for KVM guests
> with guest_memfd memory backends. It builds upon Fuad Tabba's work (V17)
> that enabled host-mapping for guest_memfd memory [1] and can be applied
> directly applied on KVM tree [2] (branch kvm-next, base commit: a6ad5413,
> Merge branch 'guest-memfd-mmap' into HEAD)
> 
> == Background ==
> KVM's guest-memfd memory backend currently lacks support for NUMA policy
> enforcement, causing guest memory allocations to be distributed across host
> nodes  according to kernel's default behavior, irrespective of any policy
> specified by the VMM. This limitation arises because conventional userspace
> NUMA control mechanisms like mbind(2) don't work since the memory isn't
> directly mapped to userspace when allocations occur.
> Fuad's work [1] provides the necessary mmap capability, and this series
> leverages it to enable mbind(2).
> 
> [...]

Applied the non-KVM change to kvm-x86 gmem.  We're still tweaking and iterating
on the KVM changes, but I fully expect them to land in 6.19.

Holler if you object to taking these through the kvm tree.

[1/7] mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
      https://github.com/kvm-x86/linux/commit/601aa29f762f
[2/7] mm/filemap: Extend __filemap_get_folio() to support NUMA memory policies
      https://github.com/kvm-x86/linux/commit/2bb25703e5bd
[3/7] mm/mempolicy: Export memory policy symbols
      https://github.com/kvm-x86/linux/commit/e1b4cf7d6be3

--
https://github.com/kvm-x86/linux/tree/next
