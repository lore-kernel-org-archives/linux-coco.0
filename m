Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC52765EA
	for <linux-coco@lists.linux.dev>; Mon, 20 Oct 2025 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975530; cv=none; b=n3xonXTvldw/kc/KkQE0KVZ2L9gHyeKgRd69PY0gS0IcOdzDFLZrkpRr4KImRZRbnF/wba+gY67UdG0yfKB6TNuEpYECSZ8MLczaau1xIvDEmo3Q+6IJzmOab8iwo7oCxfK0hAX/ysAMNv+ZG9Y6jKyAboV/N9+6MpU9FyrAHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975530; c=relaxed/simple;
	bh=nh7KmG91llH0eTJy2kGD6whEVv3qZowTvAaONNXWCzA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mC4+SvxI8YfoQMb2t4a/8nFX4JiV8AmwrJv967ARkVkqCcSVRV0k2MYiGaeV6IiN+ZquSO/Fe8BgpE6kt70lWPTT0Uik6WlxSyDHy/7UsTx3qWp2btB3jkTSiFu1l9BJFoz8WFR+8FjRJhWPO1lhhyzsPFsuN8QDVzRDDpNjZ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DIz/BnqD; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DIz/BnqD"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33baf262850so4461660a91.0
        for <linux-coco@lists.linux.dev>; Mon, 20 Oct 2025 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760975527; x=1761580327; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUxEjev6w4f1umuBxGfAcuaZR32QUUEbuSMBs3oceNE=;
        b=DIz/BnqDI9BFiPSPW9uUmHFT9VlnSjzfK0fWvuMbistIqA6LcbuoLgEzzGChkZnLVw
         AP/uWMCJvM9pKeIJPlA5wg4YXl/DOMARgRC8/c88/e3ULMMpSNWbk76qjWNH7UHQeB1b
         4Zy1dWjcIrpNELyt+8rlUXQIhccBO6ZuludIqQjHu2U+MBTtSLOJc8K7PUXXk/WJp/9B
         ygttzIexLmeXms3NdeqjtjbDkQ6Zv1HM7UYILuc1woPxowGZ9QKOIMGOd1rtTbxw/eqZ
         HJXaN9RMzoosEwJgbP34n5XXwI6vW7X96MkXHWdXzKig+QbFdUOf8XPN1AEPfFCyhgtx
         2wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975527; x=1761580327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUxEjev6w4f1umuBxGfAcuaZR32QUUEbuSMBs3oceNE=;
        b=lCUQrzvySc/6YqfPkMNpqAaUrlukQQyEdyFMYOsAL3pqHl86cTX3zZ5VQdHpAu+78S
         xz7KKs534QY84wFsFxbfuJjzKZMGoEfkaZnTsV9JcLvd8dH2qSmOMQj0qbOiCgU4Wumf
         4COywx7GHiFrPb8Mhay5NQaQ9elHzCzB2u3FfBzJDJqqGi8fstP/e+jP7XmjrD010ZMO
         nF6ITMaNaNOhICgVvaZL2z8hUWgXnij+9vTsTyExWG8xL9kL0OReH/gqLBM4s4a84zh+
         sXcKx4DIs0ifsNg7ZPXj1r4BH0oouqgLYZBlpJrNnYwIsoEwb2WCEMLJ2hByfhjuXw6J
         Kwyg==
X-Forwarded-Encrypted: i=1; AJvYcCVFEcF4GYqhcvsp39pvcLh77yYkLgysuxfAM0nHHhaVpQCzWd6vOe/BPVjw7S5kr781TvUEPDsxzSpg@lists.linux.dev
X-Gm-Message-State: AOJu0YwvbqOL+ce95oZBfwMdGBn5B3+W3jSyjvCkVONc+I6fWdOk+QxO
	2jPdqqtCk1/m+GYWX5skHOo9IsPmSkyPumxklWyoM4jzc3hY/s0cglYhsfz5e6iwaKYRA9qC2mh
	+1Gdkyg==
X-Google-Smtp-Source: AGHT+IHcZobfkAMYLqgP+952/xufHk4lZqraqyIEs0BsZFGgLzowAsqRVArAQbVQNZgQWXn7bmNPNT9qaaI=
X-Received: from pjbds19.prod.google.com ([2002:a17:90b:8d3:b0:33b:51fe:1a84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d85:b0:330:4a1d:223c
 with SMTP id 98e67ed59e1d1-33bcf87f421mr15625676a91.15.1760975526813; Mon, 20
 Oct 2025 08:52:06 -0700 (PDT)
Date: Mon, 20 Oct 2025 08:52:05 -0700
In-Reply-To: <176055105546.1527431.3611256810380818215.b4-ty@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com> <176055105546.1527431.3611256810380818215.b4-ty@google.com>
Message-ID: <aPZapWWFGyqjA2e3@google.com>
Subject: Re: [PATCH kvm-next V11 0/7] Add NUMA mempolicy support for KVM guest-memfd
From: Sean Christopherson <seanjc@google.com>
To: willy@infradead.org, akpm@linux-foundation.org, david@redhat.com, 
	pbonzini@redhat.com, shuah@kernel.org, vbabka@suse.cz, 
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
Content-Type: text/plain; charset="us-ascii"

On Wed, Oct 15, 2025, Sean Christopherson wrote:
> On Wed, 27 Aug 2025 17:52:41 +0000, Shivank Garg wrote:
> > This series introduces NUMA-aware memory placement support for KVM guests
> > with guest_memfd memory backends. It builds upon Fuad Tabba's work (V17)
> > that enabled host-mapping for guest_memfd memory [1] and can be applied
> > directly applied on KVM tree [2] (branch kvm-next, base commit: a6ad5413,
> > Merge branch 'guest-memfd-mmap' into HEAD)
> > 
> > == Background ==
> > KVM's guest-memfd memory backend currently lacks support for NUMA policy
> > enforcement, causing guest memory allocations to be distributed across host
> > nodes  according to kernel's default behavior, irrespective of any policy
> > specified by the VMM. This limitation arises because conventional userspace
> > NUMA control mechanisms like mbind(2) don't work since the memory isn't
> > directly mapped to userspace when allocations occur.
> > Fuad's work [1] provides the necessary mmap capability, and this series
> > leverages it to enable mbind(2).
> > 
> > [...]
> 
> Applied the non-KVM change to kvm-x86 gmem.  We're still tweaking and iterating
> on the KVM changes, but I fully expect them to land in 6.19.
> 
> Holler if you object to taking these through the kvm tree.
> 
> [1/7] mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
>       https://github.com/kvm-x86/linux/commit/601aa29f762f
> [2/7] mm/filemap: Extend __filemap_get_folio() to support NUMA memory policies
>       https://github.com/kvm-x86/linux/commit/2bb25703e5bd
> [3/7] mm/mempolicy: Export memory policy symbols
>       https://github.com/kvm-x86/linux/commit/e1b4cf7d6be3

FYI, I rebased these onto 6.18-rc2 to avoid a silly merge.  New hashes:

[1/3] mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
      https://github.com/kvm-x86/linux/commit/7f3779a3ac3e
[2/3] mm/filemap: Extend __filemap_get_folio() to support NUMA memory policies
      https://github.com/kvm-x86/linux/commit/16a542e22339
[3/3] mm/mempolicy: Export memory policy symbols
      https://github.com/kvm-x86/linux/commit/f634f10809ec
