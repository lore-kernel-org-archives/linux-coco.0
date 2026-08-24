Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C234750F
	for <linux-coco@lists.linux.dev>; Mon, 24 Aug 2026 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601641; cv=none; b=lCjp64/b7quEbSWBnVWw9p+MXWuIiEyIEmVHV6w7RwzM5GqCrdjJAUTk8afl3d0/F/FazN+5Np9F+g7/Wv3ny5t2IYygGcC81K8Gx6/HTirztIlkZYMs6Xfg63BNXLRbEzQK3znYCBfy8lbaKOILS8or8xYlpMDq1FOjMsn42B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601641; c=relaxed/simple;
	bh=yKqr4rll6bzas6x0ynIYlF0Yoo5Hs/p9ffSJkJp8kLM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R3NN/VlLKpysl0QODVGf2nW8srEO5aHE4ycW14aMFsKKM5u3hcasjUGos2JHMDn+X7WcqcQlL2PJfPngt/LQ/YmUiSsd0FypAzEOAYekO5KVKU53cH3i1Ad+ejfo9MncHbKvZVvm3Fwe598vRbSyMpYnLzz69kjxyobFBa3zdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wccbqboQ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wccbqboQ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63c48886bso67490045ad.0
        for <linux-coco@lists.linux.dev>; Mon, 24 Aug 2026 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787601639; x=1788206439; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDEc8axkmwKNZfRqGfAwwl+ClhSaXYBthD1BGclIUyc=;
        b=wccbqboQTb1up+6RYKEb2yg/Uwka9MUcW7aQfJWMHn12RpjqqBMC0cmY0PT55CixsV
         HXGvR+Vrps1l2oyjLVomNlIU/jwd+VHFBz5oVVDCNpk3JDQZdEywN8dluMb1f/ZRHmRt
         4MVSdFDS5wK6OaUWpxpsOAz3HzHzTc2LMjbobvGlKKiE9F5ySSCQZEgX9L12M5urvhxT
         +pNbF4P14h9xyxZn2mSbo9eQ1NQqhqwvTSvUdeQKi3BUG4uLoUkzs2tz4gHe9o/Kl/Q0
         H+Y+hMy0G0m0gQBq1qpVXo+D3eyTDE9+leLKy/XO7jfsFFdEM2cuoNZyh0S0MEeRNgf3
         Oitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601639; x=1788206439;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDEc8axkmwKNZfRqGfAwwl+ClhSaXYBthD1BGclIUyc=;
        b=LEjZgX2oc2kH9ej6mHupAPTFYI7jsy5STjP5mLF3srZuFYBPc49Dy68JI5Bx1eZqwS
         NWsznZ4yt/p4R1TI/eFLw324/79FbePVfLRk1JWjCsevjQ73EC9V9TxRi9O4LxmbVIgg
         nZFwAj8FjVESkOVnPtftOUCzEWlHVpbDkKrxXIIm5n5L3s5Urwkh26o6GaTt4s6XfEo+
         GPFIbyG45C64mFw8Jqap7rGm3RwncCh8oGWf/F1mUBt0i7A28LkWbaZFfSHcPnd4szX6
         iWDY+Z/Sh5zWHMxNPoyKmdchrDMoLZIqMto9ZkkpAyLqVB2tg+rZpQ7UEz4/pxCRJBRM
         xxMw==
X-Forwarded-Encrypted: i=1; AHgh+RpgjiJsMJWicMW+Leb6yLZFXr939n/eYa9FNOQ1hNYpeWfTBOe9LJzv9j7FraasoKZlksWwHZFQYJj6@lists.linux.dev
X-Gm-Message-State: AFuF++nL9H65TMkwSSHGFEiHLcLp/NylDuoq17KciMUeAEXsXYemQmT5
	3qs6mtXbACo3g+29ZIUwBwFBENmVnqWLHgWeOAPFjIhgYZR1u5pgcZnKUxCEsjX0fhJdwfVBB8k
	wm5EKMQ==
X-Received: from plrx13.prod.google.com ([2002:a17:902:b40d:b0:2ca:ef0c:f8b2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2407:b0:2d1:1d3d:97b2
 with SMTP id d9443c01a7336-2d64b1464dbmr571439765ad.11.1787601635474; Mon, 24
 Aug 2026 13:00:35 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:00:34 -0700
In-Reply-To: <20260824192702.GA3694338@pedri>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-10-15ad654a50db@google.com> <20260824192702.GA3694338@pedri>
Message-ID: <aoyi4nhWkhFrlIfs@google.com>
Subject: Re: [PATCH v14 10/22] KVM: selftests: Set up TDX boot code region
From: Sean Christopherson <seanjc@google.com>
To: Peter Fang <peter.fang@intel.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 24, 2026, Peter Fang wrote:
> On Wed, Jul 22, 2026 at 11:13:15PM +0000, Lisa Wang wrote:
> > +void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
> > +{
> > +	size_t total_code_size = TD_BOOT_CODE_SIZE + X86_RESET_VECTOR_SIZE;
> > +	gpa_t boot_code_gpa = X86_RESET_VECTOR - TD_BOOT_CODE_SIZE;
> > +	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
> > +	size_t nr_pages = DIV_ROUND_UP(total_code_size, PAGE_SIZE);
> > +	const u64 gmem_flags = 0;
> > +	gpa_t gpa;
> > +	u8 *hva;
> > +
> > +	vm_mem_add(vm, VM_MEM_SRC_SHMEM, alloc_gpa, TD_BOOT_CODE_SLOT,
> > +		   nr_pages, KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
> > +
> > +	gpa = vm_phy_pages_alloc(vm, nr_pages, alloc_gpa, TD_BOOT_CODE_SLOT);
> > +	TEST_ASSERT(gpa == alloc_gpa, "Failed vm_phy_pages_alloc\n");
> > +
> > +	virt_map(vm, alloc_gpa, alloc_gpa, nr_pages);
> > +	hva = addr_gpa2hva(vm, boot_code_gpa);
> > +	memcpy(hva, td_boot, TD_BOOT_CODE_SIZE);
> > +
> > +	hva += TD_BOOT_CODE_SIZE;
> > +	TEST_ASSERT(hva == addr_gpa2hva(vm, X86_RESET_VECTOR),
> > +		    "Expected RESET vector at hva 0x%lx, got %lx",
> > +		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);
> > +
> > +	/*
> > +	 * Handcode "JMP rel8" at the RESET vector to jump back to the TD boot
> > +	 * code, as there are only 16 bytes at the RESET vector before RIP will
> > +	 * wrap back to zero. Insert a trailing int3 so that the vCPU crashes in
> > +	 * case the JMP somehow falls through. Note! The target address is
> > +	 * relative to the end of the instruction!
> > +	 */
> > +	TEST_ASSERT(TD_BOOT_CODE_SIZE + 2 <= 128,
> > +		    "TD boot code not addressable by 'JMP rel8'");
> > +	hva[0] = 0xeb;
> > +	hva[1] = 256 - 2 - TD_BOOT_CODE_SIZE;
> > +	hva[2] = 0xcc;
> 
> This handcoding has persisted for several versions (since v9) so I only
> want to comment gently... The current code looks correct but I think
> this could be simpler. But feel free to keep the current implementation.
> 
> I can see handcoding "JMP rel8" generates a jump instruction
> predictably. But having to calculate and sanity check the boot code
> offset by hand seems quite painful. And the math is quite tricky. I was
> thinking the assembler could do a lot more heavy lifting here.
> 
> A nice property of this boot code is the fact that it's executed in
> 32-bit mode from the get go. So there's no need for 16-bit programming
> and "JMP rel32" is readily available. I.e. a "jmp td_boot" in td_boot.S
> should suffice and the assembler screams if td_boot isn't reachable. And
> the int3's after the jump can probably go away as well since the jump is
> now very, very likely to succeed.
> 
> There shouldn't be a need to "pad reset_vector to its full size of 16
> bytes" as stated in v8 [1]. The exported "reset_vector" symbol in v8,
> plus the boot code start & end markers, should be enough to help
> tdx_vm_setup_boot_code_region() put this boot blob in the right place.

Ya, looking at this with fresh eyes, AFAICT there's no reason to handcode anything,
it's just basic arithmetic.

Side topic, this series doesn't compile for me, so the below isn't even properly
compile-tested (I hacked in arbitrary literals to get past the undefined references).

/usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:26:(.text+0xf): undefined reference to `TD_BOOT_PARAMETERS_PER_VCPU'
/usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:30:(.text+0x17): undefined reference to `TD_PER_VCPU_PARAMETERS_ESP_GVA'
/usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:33:(.text+0x1d): undefined reference to `TD_BOOT_PARAMETERS_GDT'
/usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:37:(.text+0x26): undefined reference to `TD_BOOT_PARAMETERS_IDT'
/usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:44:(.text+0x2f): undefined reference to `TD_BOOT_PARAMETERS_CR4'
/usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:46:(.text+0x38): undefined reference to `TD_BOOT_PARAMETERS_CR3'
/usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:48:(.text+0x41): undefined reference to `TD_BOOT_PARAMETERS_CR0'
/usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:54:(.text+0x51): undefined reference to `TD_PER_VCPU_PARAMETERS_GUEST_CODE'


diff --git a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
index 89cf6c3485be..439d6f10489e 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/td_boot.h
@@ -73,10 +73,9 @@ struct td_boot_parameters {
 };
 
 void td_boot(void);
+void td_boot_reset_vector_trampoline(void);
 void td_boot_code_end(void);
 
-#define TD_BOOT_CODE_SIZE (td_boot_code_end - td_boot)
-
 #endif /* !defined(__ASSEMBLY__) && !defined(__ASSEMBLER__) */
 
 #endif /* SELFTEST_TDX_TD_BOOT_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
index bca9a4c3d8f8..2882fb2ea43e 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S
@@ -52,6 +52,12 @@ td_boot:
 	ljmp $(KERNEL_CS),$1f
 1:
 	jmp *TD_PER_VCPU_PARAMETERS_GUEST_CODE(%eax)
+	int3
+
+.globl td_boot_reset_vector_trampoline
+td_boot_reset_vector_trampoline:
+	jmp td_boot
+	int3
 
 /* Leave marker so size of td_boot code can be computed. */
 .globl td_boot_code_end
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 831b0e5160df..170354dcdb66 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -15,10 +15,11 @@
 
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
 {
-	size_t total_code_size = TD_BOOT_CODE_SIZE + X86_RESET_VECTOR_SIZE;
-	gpa_t boot_code_gpa = X86_RESET_VECTOR - TD_BOOT_CODE_SIZE;
+	const size_t total_size = td_boot_code_end - td_boot;
+	const size_t boot_code_size = td_boot_reset_vector_trampoline - td_boot;
+	const gpa_t boot_code_gpa = X86_RESET_VECTOR - boot_code_size;
 	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
-	size_t nr_pages = DIV_ROUND_UP(total_code_size, PAGE_SIZE);
+	size_t nr_pages = DIV_ROUND_UP(total_size, PAGE_SIZE);
 	u64 gmem_flags = 0;
 	gpa_t gpa;
 	u8 *hva;
@@ -33,25 +34,12 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
 
 	virt_map(vm, alloc_gpa, alloc_gpa, nr_pages);
 	hva = addr_gpa2hva(vm, boot_code_gpa);
-	memcpy(hva, td_boot, TD_BOOT_CODE_SIZE);
+	memcpy(hva, td_boot, total_size);
 
-	hva += TD_BOOT_CODE_SIZE;
+	hva += boot_code_size;
 	TEST_ASSERT(hva == addr_gpa2hva(vm, X86_RESET_VECTOR),
 		    "Expected RESET vector at hva 0x%lx, got %lx",
 		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);
-
-	/*
-	 * Handcode "JMP rel8" at the RESET vector to jump back to the TD boot
-	 * code, as there are only 16 bytes at the RESET vector before RIP will
-	 * wrap back to zero. Insert a trailing int3 so that the vCPU crashes in
-	 * case the JMP somehow falls through. Note! The target address is
-	 * relative to the end of the instruction!
-	 */
-	TEST_ASSERT(TD_BOOT_CODE_SIZE + 2 <= 128,
-		    "TD boot code not addressable by 'JMP rel8'");
-	hva[0] = 0xeb;
-	hva[1] = 256 - 2 - TD_BOOT_CODE_SIZE;
-	hva[2] = 0xcc;
 }
 
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus)

