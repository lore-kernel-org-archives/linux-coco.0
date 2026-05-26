Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF5D38D3E4
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810817; cv=none; b=bUnRrUmKG1HiIQuK6gPN4viKv2ZGCLu/N+FnmHu+FlkFbJbchXsvZ9l/fFtcAOQf5zo0ARvw/ou9R8xRkI8iZ1W1QmGYdG+/C3niNLdL+XAsOq0hufZ5Ehodq2iWuduFrpXOUF3D6MRi/kZm5R9gSdO0+9TkVJaB28Pp9fCCDuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810817; c=relaxed/simple;
	bh=mBfUP0yVPjk2NwcZtGJBC+WG51c9+q2CFtrlyo+9fNY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YzhOV4C6RDWSXpgwqgragYiMkIg7Q4Cyy6dvDl4D7gtCuFmlg7KTqMvW4CQYNyi/9MtSIccw4Sy+s6E5JDgVNCYiApR8dtC4osPPNzn4MvX/0FfT7/Fc2yNyMmpH+WCv6scDxBa9MNT9mvh9dy58oByohIVrqW3zZ0kUI10cduk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sqTZkQkP; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sqTZkQkP"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so10872164a91.1
        for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779810816; x=1780415616; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJNCogH4Zbu4XOm/ShCIueHOInBR+JpKq+7IbtHCuDM=;
        b=sqTZkQkPQtUuAo4riNkWm2jWpPnweKF2E4pPWYNh8HnDHPwN3zaxUkjUv1v38MrVjv
         wYoWuXC+C8btjNUnkliyUf95Vi17wbAzolhmE4LA9iisU5sobVCf0LizGl6ldkM1fTiX
         YIa8y9YBxZRf0I+JrEJVouY/NqqMhqG5qwxT/Z/kklATVTHg4zQJ/Z5tPQ/8mUsTHUzr
         VT2+v8FyEkQN5b7JJZHNf2HBZ0GBB5mHw3d3V5tKiz1oV9EjoQuxlrvMyRz9hRbU5wxr
         DddkegXISnfoWhBK2KiPewZKkThJ1EwfHNp/naXei2vpFjigYFClZc4+fnIB3n8Y+QH5
         KjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779810816; x=1780415616;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJNCogH4Zbu4XOm/ShCIueHOInBR+JpKq+7IbtHCuDM=;
        b=dPwZmCXMOzkcKjOxh52oREHNMuNcg+zU3UNQCwQec4974xSh1pTSddlw6h4y2eeUVC
         XiUB2xX3aXLLzWty+cVL3FTXojGmYeUUhEeEtKdJsM/TDIs5atxR3h5NA01lSylLFN7n
         28ctd6+wnVoqXrM8eB1UglBrIvP+8d1QbDynySBYkHMvBlOpnUTrHULVJdI4+Rqqddup
         PI/DDI39/GTeseJlxO8wFtHm3hTKwKhLKKY1zIR02U/tKdmbYU0vLZZ/q6EfoBdxjDh4
         gCxo5tpKcKBRi4uZHEaejgi9OewOqqTD4IcwlwN9GjmgT+922HyKCOqS2YGm6W3h6+lW
         chEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sKdMH1JBWO4spMXstIL32qPYXgCExFHa0GQjLXsAlnD9qTGvFgdG4JHDM3Jo5DnvGhuznNjkNmSyp@lists.linux.dev
X-Gm-Message-State: AOJu0YwdKQE4MZTtOzP2KkyGsb6ibXGuBhVcAT2OsN2dXjExDyFyxHGS
	cnJTWsc3h0mBdwmegTkzrvQmiFD6/nty4zQFpBCosqrcEa9G5uDXXWNijbNx0dbXAwcei/N4lf6
	ihDajsg==
X-Received: from pgmm13.prod.google.com ([2002:a05:6a02:550d:b0:c82:2dd8:9d48])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a8e:b0:368:78da:803
 with SMTP id 98e67ed59e1d1-36a674f81fbmr19324004a91.12.1779810815253; Tue, 26
 May 2026 08:53:35 -0700 (PDT)
Date: Tue, 26 May 2026 08:53:34 -0700
In-Reply-To: <20260522-fix-sev-gmem-post-populate-v2-2-3f196bfad5a1@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com> <20260522-fix-sev-gmem-post-populate-v2-2-3f196bfad5a1@google.com>
Message-ID: <ahXB_tBWakUUjt6q@google.com>
Subject: Re: [PATCH v2 2/5] KVM: guest_memfd: Fix possible signed integer overflow
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Zongyao Chen <ZongYao.Chen@linux.alibaba.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

For shortlogs (and changeloges), when possible, describe the _change_ itself, not
its impact is.	Sometimes "Fix xyz" is the best shortlog, e.g. when fixing build
failures, but here, I would go with:

  KVM: guest_memfd: Treat memslot binding offset+size as unsigned values

for two reasons.  First, it provides a lot more context for future readers, versus 
"Fix possible signed integer overflow" which doesn't even capture what flow is
affected, how the overflow is being fixed, etc.  Second, if the fix is wrong,
incomplete, etc., we don't end up with a follow-up patch that start with "Really
fix ...".

Oh, actually, three reasons.  This doesn't only affect the overflow check.  The
check on a negative offset is flawed, as it means KVM would incorrectly reject
bindings with (comically) large offsets.

LOL, four.  There is no bug.  The size of the memslot is ((1UL << 31) - 1)
pages, i.e. 0x7FF_FFFFF000:

	if (id < KVM_USER_MEM_SLOTS &&
	    (mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
		return -EINVAL;

and so "loff_t size" can never be negative.

As for the offset, the negative check is intentional, because KVM_CREATE_GUEST_MEMFD
takes loff_t for the size, and so an offset that is negative would also be larger
than the size of the file.

I still think it's worth taking unsigned values, because teasing out all of that
information wasn't exactly easy.

On Fri, May 22, 2026, Ackerley Tng wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> The caller, kvm_set_memory_region(), checks for an overflow in an unsigned
> u64 guest_memfd_offset. When guest_memfd_offset is passed to kvm_gmem_bind,
> it is cast into a signed 64-bit integer.
> 
> Hence, a large 64-bit offset could result in a negative loff_t, which could
> result in the overflow checks failing.
> 
> Make kvm_gmem_bind() take u64 instead of loff_t to consistently deal with
> unsigned values to avoid this issue.
> 
> Fixes: a7800aa80ea4d ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [Use size_t for size instead of u64]

Why?  Oh, right, because kvm_memory_slot.npages is an "unsigned long".  The
discrepancy between a u64 for the offset and a size_t for the size is confusing,
as they are both conceptually in the same "domain".

Rather than u64 and size_t, we should use pgoff_t, which is what KVM already uses
as the storage for kvm_memory_slot.gmem.pgoff.

I'll send a new version as a standalone patch.
