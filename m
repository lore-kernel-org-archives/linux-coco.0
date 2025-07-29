Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1456629A30E
	for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753810970; cv=none; b=dUMJSmAM1IURsSA9e96+yCwrNXZQwSPOausjvOQvGnJ1wHUrZKvOqGts2CnizeP4y0HG5poz5eieLqcnoTBSbxMkOI+nAZRkzfWYVGYhQk6szSWI17gbn8SGkjaujGMEKENtzsrr6JdPhtCYNsKLo85asYjoBs2iXa8J9D0rSOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753810970; c=relaxed/simple;
	bh=UYBEIMyzSrNEBgHDKHOOrkv/8nq3K58nn32I5bNBWRA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jb5hASRBPqR2SGN0eFLlXD68t8XZOIJUXgsxQ4rnNx7/WMnGm8QoXAdKwEgXoYzoCsmsl9FAblERZsExOfGOfjuYS7rJ0cxCgTKpoCRNOS+P1CtMPpXEiNjb3S0YCyWGvr/6lBlXEd91NaZc98YRc1r/5ahk3ZUY46yaTp7B65w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a0ZAoT96; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a0ZAoT96"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31eac278794so3294131a91.3
        for <linux-coco@lists.linux.dev>; Tue, 29 Jul 2025 10:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753810968; x=1754415768; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0cDIK6qF6nWwCr2NoTbZWaYG+2Frltnz2b6AbcPAKOQ=;
        b=a0ZAoT96Wh2aXHK5quHrm1O8kJi5dt4aX4VlL89jNiqd6D3XHf+GgXuAMM9aSQqcqm
         5YvC3a7/jURjO31c4qxsdGvhuKALV7lw6wNcqSFrbiQHy5wfp112Q2T04BLwesCxv1Wh
         Mep0E6kX5TuC0fOAGBsKoh3ZydpRSlVWA+Ej46Mo9Y1YihzJm077UDF+hhaYmpK0bnJb
         W+TLcHQ424OOYnDLBlbYxDQgDuSDxZLAjHL1T009smqgoeKHpSdMA1QnhoYIZF9ob/B9
         OZ45nFvqaLYeq2JPHlixH+27fYXZ3jAiq645r9xEMHV+EQnXVgQRzVviX9L0fXOUaXpR
         zReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810968; x=1754415768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cDIK6qF6nWwCr2NoTbZWaYG+2Frltnz2b6AbcPAKOQ=;
        b=fW7Drpwbx4cFVzpUIY1ogWyk9iZ8ZG/C7lexdGKzlF/Qu+TVxT39X62l6PptL5FLZ/
         GTCmTfrSNbsF02VfB+5beYIEMH+UBhUzv9imrow7HB1DpMGpDkAr518ZA6s0iD/Rr5sT
         qWhLsGare7Mmiqokg7mmiIVxCatmEdH84SCiwTpT6mTF80KuAGUqbqJUDKFkgIKrxyG1
         uiXYSG0/nzpAUdm9SRzemTHgpY+LBjwbzuoGiJmY7wBDbSRBA9tcjq+pgDIsfCLVsQrP
         7dm2JOjFyo+mPRgwpNDXkDm53cN5Gl2X0l0ySTSK6KCXL1UWb/AxjNTudEazoon9L67/
         24Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVxM1jfBAAfHTZHScarC6tHafZuYE8lBwuxgXgUig8D9EgepnokpV5Sru7AQGSsxWEuzmNuz9OiPVbr@lists.linux.dev
X-Gm-Message-State: AOJu0YxRqXFLHSjKADMdRSyIw1ZD/sj7QtBnm5PyszhKsYbd0+kT6PLs
	1RNdOgp1jQ5woGtlRn/w28lNVtWHXlM4c48P00Ig/GQIcaW3OnrLOTeycrFQnGvIiuLlAM5DVa0
	phm++Pg==
X-Google-Smtp-Source: AGHT+IEy2tKRxEDM0MA44Vkr5JiteWyEFEnQvVSVGFQxO5N3upFR7JMnSmnNBB5kB8Ubw1uZp7pGKyP+A6w=
X-Received: from pjsc24.prod.google.com ([2002:a17:90a:bf18:b0:31f:3029:884a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:47:b0:31f:42cd:690d
 with SMTP id 98e67ed59e1d1-31f5dd9e0d8mr540145a91.13.1753810968559; Tue, 29
 Jul 2025 10:42:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Jul 2025 10:42:36 -0700
In-Reply-To: <20250729174238.593070-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250729174238.593070-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729174238.593070-5-seanjc@google.com>
Subject: [PATCH 4/6] KVM: x86: Drop pointless exports of kvm_arch_xxx() hooks
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-sgx@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Drop the exporting of several kvm_arch_xxx() hooks that are only called
from arch-neutral code, i.e. that are only called from kvm.ko.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a1c49bc681c4..14c0e03b48ae 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13492,14 +13492,12 @@ void kvm_arch_register_noncoherent_dma(struct kvm *kvm)
 	if (atomic_inc_return(&kvm->arch.noncoherent_dma_count) == 1)
 		kvm_noncoherent_dma_assignment_start_or_stop(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_arch_register_noncoherent_dma);
 
 void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm)
 {
 	if (!atomic_dec_return(&kvm->arch.noncoherent_dma_count))
 		kvm_noncoherent_dma_assignment_start_or_stop(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_arch_unregister_noncoherent_dma);
 
 bool kvm_arch_has_noncoherent_dma(struct kvm *kvm)
 {
@@ -13516,7 +13514,6 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 {
 	return (vcpu->arch.msr_kvm_poll_control & 1) == 0;
 }
-EXPORT_SYMBOL_GPL(kvm_arch_no_poll);
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
 int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_order)
-- 
2.50.1.552.g942d659e1b-goog

