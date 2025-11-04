Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6110329C54
	for <linux-coco@lists.linux.dev>; Tue,  4 Nov 2025 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279353; cv=none; b=ovaJ8j98XlNCPkZK1doM8aE1MqrAxmcQocv1dvGXg5ef7Q7mwa9JGKS6X0q6c689ITw2FyCCl8o3j9cRBfkvagWd2zBg6n/iVO8ZaEDnmqbQq/J9z88T/BNHMeg4DQXwPd4mmIJ3+sp00IDnh0iFkF3L5qETdztrJn5g9bBX/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279353; c=relaxed/simple;
	bh=OF+yEyqL038M/7cjkLTDiCOgvMsbpIL4Y8u0B391S+g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VPY5BvrHpqYdzw62xcVneZ0yhxtKzkuy5yDAxfvORwY3iJXDYNglMlTXSVaP38VsP5jQqQt/xUvWLlD9OsiKyJGtephWba9MUbW2frUiVECsedy5mqy4JvpIGvgDsSF1P4Vzdqzc6rIqOCSaVVh4IJ2uRFSUF/IlEsaIWdPaXcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BERk9xVE; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BERk9xVE"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-ba433d88288so296783a12.2
        for <linux-coco@lists.linux.dev>; Tue, 04 Nov 2025 10:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279351; x=1762884151; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z7TAMX5tgRxcaQgmnIz2dr5/J34h/wClq0GmkAjx/eU=;
        b=BERk9xVEveeaRp80+Pz+WHJt8gdW3jHtSVcr54LiWRrBTjmM95IngnS/fMFYRCubG5
         rzkhptbS7BW/blEzwoGoZ+X9bCVkFnij2Op9/QQSkX8dWRr+O3qr80eAW+eY2+1NmJL3
         ym1JQMQ3aMDKI3N4p/G84AAqF+3Ug88yeWhTAhZtDqSo6fc1AGEj9BuWqvuejoVHWuiE
         axevlqPFTEueB/wn14S7TCmHNaPxTAAi0p23AyTIw1ARTKYTFwIMBihTHemkvidxyg51
         djfWhuNZnUl/L7QytuF78rpHge4Pv+Y761mty8ajK0xxht0sqL/fTp6lbstTSIb3X88b
         6LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279351; x=1762884151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7TAMX5tgRxcaQgmnIz2dr5/J34h/wClq0GmkAjx/eU=;
        b=aVvD9dUTxHVQy8LOtx4S6woq9jwZ1c2P8UTvCjRb9dKewIGgHRaoUrSXgP7hqM6CoM
         4yp0CCuOLRZ9YuCdYAUOqKbR9QOAr0GKXMr1FIstPfG6QS4kVs14td8A/ydmmrh8niqh
         xIkZ66zYM8enoVJkWWbwjVnBO7f7MOiEAaPdRT46N5jxbLeKR0aWmP+LtNNjPPyn1uIi
         yjtWlljh9VW9ouVf60Uss2e1Jou3TOzguCirxvrVc1+8I1fs4X3bxoI7udeumqbGC3Nn
         qaw0N1DvTqlCnl5Fq0/LtTGngcugR1eUyThpM+6CFI92mKU/YvHf1Os0HAf8Vh5X+b2G
         X2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8J/yipTZW6uxHSe306BXQg7QhLH0AajpUyVDJ9nRrNwZwCrHLbMA/+d4TwlI54qOUsu2/DBmjueok@lists.linux.dev
X-Gm-Message-State: AOJu0YzzLFjIVIChJ2RSbstLniznACRw2SCRJtjBpoZPrLISyXyqhWSC
	p1veg7L7sq1O469nS84Dqp9VbisnYUH6VTwIwu2FaDhxh8q0k7xEMdW+3uuCMmgenzHEJTP0HXh
	hOYLPTw==
X-Google-Smtp-Source: AGHT+IEToeihVC8rNRp4WXHuCXbja7cJV9DF8/gVM9lRFkFysIMA8abH+TqAL0waWRxDGRap6/agKlo3e+8=
X-Received: from pjbmv10.prod.google.com ([2002:a17:90b:198a:b0:340:d512:22dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d92:b0:32b:7222:7459
 with SMTP id adf61e73a8af0-34f8591c355mr151990637.34.1762279351036; Tue, 04
 Nov 2025 10:02:31 -0800 (PST)
Date: Tue, 4 Nov 2025 10:02:26 -0800
In-Reply-To: <31da959f-d004-4ae0-a6a7-d5d31b646b70@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-28-seanjc@google.com>
 <31da959f-d004-4ae0-a6a7-d5d31b646b70@linux.intel.com>
Message-ID: <aQo_spywQuek7fUi@google.com>
Subject: Re: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 04, 2025, Binbin Wu wrote:
> 
> 
> On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> > WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> > measurement should fail if and only if there is a KVM bug, or if the S-EPT
> > mapping is invalid.  Now that KVM makes all state transitions mutually
> > exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
> > mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
> > tdh_mr_extend().
> > 
> > Holding slots_lock prevents zaps due to memslot updates,
> > filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> > vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
> > VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
> > usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
> > can be used for the initial image.
> > 
> > For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
> > exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
> > for kvm_noncoherent_dma_assignment_start_or_stop(), and
> > __kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
> > VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot
> 
> Nit:
> It sounds like TDX is using the memslot for the APIC page, but for a TD, the
> memslot for the APIC page is never initialized or used?

Oh!  Good point.  I'll tweak that snippet when applying.
