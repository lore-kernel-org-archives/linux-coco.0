Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAC8369D7E
	for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 18:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303547; cv=none; b=f7o0OecpMUUQIhLT36UBcrpqKNJEY9m93DUmZoNTTbGYdpcME7Qx5kPnBaM0ITxzW83A91uPPi/IrOJewx4Lqn1Ulm2jkbZw8Oy6to/LWe4nSMGmF+v0r7tFNk9okJC/oO7iMPbKWao1egg5ksHrpwIh3PBuq8gnCwGrFGzjC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303547; c=relaxed/simple;
	bh=CAg8fHi2CXutX4k3jIaYo/3dkMGuQ6K17aloqCRhD8Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ltM9YC73uY51VlJ+YY3aBzeiG9Cs60T1wmsveLdjiThl8oAOwSmYe4XEpr9c9icQ9XjiqYVexcwkb0NtuEypH/fqKMVJZprKrUX5xHAgOmciALy/NI7XKBXmenKJsX79wKL6lV0jn/j3Qcl+ud5TZIdn4GIvBYj0r6Jhbce1Bak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FwfsuD4s; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FwfsuD4s"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c8279604464so7892814a12.1
        for <linux-coco@lists.linux.dev>; Wed, 20 May 2026 11:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779303546; x=1779908346; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xc+eqLu2deOuDSSfxTvMnxL/tYv4gr65bHOPW09jR0U=;
        b=FwfsuD4sUgcGuZxGDnmmyFQ0AjkEDWjFKCRmMNiL9uBd+vUIeoeQ8Lr+gWyKskGXWK
         ch3BhGPmeL9R1lxTAK+CRBVMjVWNNyGJiGvWrHC1tVRlrldbczqOAyvov4LS5ogmPyPF
         YK1MlQ8iweunCWtvKAtIHUm1soaa8pmqr80zWkmWUiNppDB1IphGH6T3dnrAgpGx6vM8
         C+seDOHHuDsN6qPmVKSz6m7r83KZ9bFtGaZqGZz3abn9cjJ4WU9ffYD3hWaueSk8o17F
         1PFOzT83dFMaaTnRe6y9MHvgHZDRfBFzljW2M4UQSSC/mKv9ARp7YBWNDINn+6+vNua9
         pTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779303546; x=1779908346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xc+eqLu2deOuDSSfxTvMnxL/tYv4gr65bHOPW09jR0U=;
        b=G8e8/ORMkz6wCfUZGFNCqMY650aRZE/KB5TfGjZoU95YSIdpkR56/RArm7wKW+r+p8
         E3CwA4zUvc0VDUt6VlLztB4VFIQw0rmEeghH7TgGGqrEu/DtwA2GVFe2sLoisVI7Fk6J
         D4X3T9/B/l8NQL/6ifvEIgcTXF/Euz/jWTaPVfybPmZE8V3JtC2aeUJqOJq9hzUwQyBL
         RikY4QXeKGBcSP0xwi57HwIRy0mKOBIkGfCT6TCwTTqTpjRLTeiZPmwSlb8w4wvKqUpm
         AiMK+NrOjpJA0i3HYgUP1tm2ZJphBFdk6pe5vk8gie4LTeXOJ2SrzH8Theazda+gTTa9
         nN3g==
X-Forwarded-Encrypted: i=1; AFNElJ/znu7JJFZTO1xEtHqHaYXxrGZEe560wgqKxXGc/vfgURgmwcLZICniHAZa2yifG3iEW9QKG+6RmfTT@lists.linux.dev
X-Gm-Message-State: AOJu0YwbmY4QDFq6sdQonZ38Uu16WWArWdVIE53ImIaDSJKUUDO9HboK
	6QbDTtuWeLGDi3gnsYAlZHw36lXPfUW6uuZrvOsLLqnTAGWkt8w6OpkZkxqfNRhbk5c3GVJkRfB
	/8X15NQ==
X-Received: from pgbcz6.prod.google.com ([2002:a05:6a02:2306:b0:c79:8756:1a98])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:734a:b0:3aa:f9cb:d43a
 with SMTP id adf61e73a8af0-3b22e67fe5emr29278600637.5.1779303545036; Wed, 20
 May 2026 11:59:05 -0700 (PDT)
Date: Wed, 20 May 2026 11:59:04 -0700
In-Reply-To: <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com> <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
Message-ID: <ag4EeByDV-OtGhlk@google.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
Content-Type: text/plain; charset="us-ascii"

On Wed, May 20, 2026, Fuad Tabba wrote:
> On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
> >
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Implement kvm_gmem_get_memory_attributes() for guest_memfd to allow the KVM
> > core and architecture code to query per-GFN memory attributes.
> >
> > kvm_gmem_get_memory_attributes() finds the memory slot for a given GFN and
> > queries the guest_memfd file's to determine if the page is marked as
> > private.
> >
> > If vm_memory_attributes is not enabled, there is no shared/private tracking
> > at the VM level. Install the guest_memfd implementation as long as
> > guest_memfd is enabled to give guest_memfd a chance to respond on
> > attributes.
> >
> > guest_memfd should look up attributes regardless of whether this memslot is
> > gmem-only since attributes are now tracked by gmem regardless of whether
> > mmap() is enabled.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > ---
> >  include/linux/kvm_host.h |  2 ++
> >  virt/kvm/guest_memfd.c   | 31 +++++++++++++++++++++++++++++++
> >  virt/kvm/kvm_main.c      |  3 +++
> >  3 files changed, 36 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index c5ba2cb34e45c..28a54298d27db 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2557,6 +2557,8 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> >                                          struct kvm_gfn_range *range);
> >  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
> >
> > +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn);
> > +
> >  #ifdef CONFIG_KVM_GUEST_MEMFD
> >  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> >                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 5011d38820d0d..f055e058a3f28 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -509,6 +509,37 @@ static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
> >         return 0;
> >  }
> >
> > +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> > +{
> > +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> > +       struct inode *inode;
> > +
> > +       /*
> > +        * If this gfn has no associated memslot, there's no chance of the gfn
> > +        * being backed by private memory, since guest_memfd must be used for
> > +        * private memory, and guest_memfd must be associated with some memslot.
> > +        */
> > +       if (!slot)
> > +               return 0;
> > +
> > +       CLASS(gmem_get_file, file)(slot);
> > +       if (!file)
> > +               return 0;
> > +
> > +       inode = file_inode(file);
> > +
> > +       /*
> > +        * Rely on the maple tree's internal RCU lock to ensure a
> > +        * stable result. This result can become stale as soon as the
> > +        * lock is dropped, so the caller _must_ still protect
> > +        * consumption of private vs. shared by checking
> > +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> > +        * against ongoing attribute updates.
> > +        */
> > +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
> > +}
> 
> Doesn't this imply that all consumers of kvm_mem_is_private() should
> validate the result using mmu_lock and the invalidation sequence?
> sev_handle_rmp_fault() calls kvm_mem_is_private() without holding
> mmu_lock and without any retry mechanism. Is that a problem?

Yes, but my understanding is that sev_handle_rmp_fault() can tolerate false
positives and false negatives.  It's not optimal, but it's "fine", and already
KVM's existing behavior, e.g. KVM gets the PFN and then smashes the RMP, without
ensuring the PFN is fresh.

Mike, is that all correct?
