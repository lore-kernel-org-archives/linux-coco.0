Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F82D77F7
	for <linux-coco@lists.linux.dev>; Fri, 11 Jul 2025 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242361; cv=none; b=WPaO4vwPTQzAefvRPzMNE3qrd/WK8eXqDaAHpX0riil19/G+uDG0V3GKwyI0DsIUrSekSsHnhirCGj9GvdXNOjPZMyfh1wxv7Kon0atrpZUKTRFO1aqrXfeB4749Uw1nx/gCN+soFZx+Jcs6QxWI4OcPjAFEjdxKbx07BfEpxVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242361; c=relaxed/simple;
	bh=Dt4qn9phenTKjNb8Z3vhHvDiiEzvHwV7n7x/RITTuLI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rumjJuF6wC31AP0C9WqKabHqIA33+I2PUDA4C9SkTz+C894Bmo/JW1RF4r1F+2ZwfuqDGRJ4hfyiCgQ0aiayMdAbsBUnrDeGQE6DBrG/9Gt4GqxXwYopRoAJXJ+ylU8ySB3lMLPLbX3SfXlxLxAaHHsmJc2pTDJB/r9y+ViSYjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Der5n+w9; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Der5n+w9"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b3642ab4429so1668783a12.0
        for <linux-coco@lists.linux.dev>; Fri, 11 Jul 2025 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752242358; x=1752847158; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7a5a3fErkgge97zEu8ffiiTzf/WljRZ6mWF9WxIyy9g=;
        b=Der5n+w97e6SuOHK4XpL8azP63ReCiQx8VbWQ6f1DbuDhJEGGwH3WLZaZSeENoFP+C
         Gc79M2KSvTTsvU4KxDnGxXNiK6OKDMKjMejI22eo5s+mE84+uaflR2/vkgq5zBfQtQ2R
         pVbO4Ee/m0jJnXlogSgM/waH8famW0RDnAOPmm1ynX5Bcz2f2ZiAYgsPa3Aq42zQ1LUY
         sMf3hle7lbYbWz/OdauqevI61lrg0AvRQEpp4sSRbip0ewvtOW/8zuzg5m3/zbwSNk4y
         6e4R8REMBc4QgbjNJbBFoOXwUezU9Ft44ViruhxbgGZ5thKVwNR8znpJQSPqB1Htb/fI
         8Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242358; x=1752847158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7a5a3fErkgge97zEu8ffiiTzf/WljRZ6mWF9WxIyy9g=;
        b=E0mBj3Zt/oAq0VWEUb9b35F6dQYK6SOHPxNF/UHbLfiwPQEntsxg/f2aVyY49w9Cbk
         Nrnnj9VPmfsj/McAy9cSG/Q2LTFm39naGYHf1K14BWgoP4ywdFKv8xJinLulc0j4MRFC
         KMf/v5ze6eKItwVw9DnJOQ2D8FmM4TLL2iIbYCde9r359J3TityGQ4CesKEMHuU+19Fw
         agf4ud1VLjBUi8SheXLgqjmIfKsJlbsEXnMBBpFeTiIWKV2kTDafIGWIEMVPnVcD7tAc
         YtyxJRifDl+YQdZHGrfN8CYssxErEeqUsIX04rf0q0Edsy/EoNLy0KEVNGAyOxJ9xHpa
         ioIA==
X-Gm-Message-State: AOJu0Ywtgsuig+Q+PJnKvXIkvZTVXMGmnwZEipmqF1o47izIyeYfLL3e
	BsdlcRkNAbroncmHUzM8ADNa3leFhcYQyPyCe2pO5BYgbFz0cSFJJEWzKt9g5sSZApHvMZjVDrE
	Fnsh3bA==
X-Google-Smtp-Source: AGHT+IGraauLonvEm6JYMaaX15jKkM3IWDCaMsfevV3/3SZnj3Sw/6tDdfnBW1eWZbmSwzgbxYHhyST7ug0=
X-Received: from pjxx11.prod.google.com ([2002:a17:90b:58cb:b0:308:6685:55e6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5645:b0:312:26d9:d5b2
 with SMTP id 98e67ed59e1d1-31c4c972577mr5840590a91.0.1752242358156; Fri, 11
 Jul 2025 06:59:18 -0700 (PDT)
Date: Fri, 11 Jul 2025 06:59:16 -0700
In-Reply-To: <20250523095322.88774-4-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250523095322.88774-1-chao.gao@intel.com> <20250523095322.88774-4-chao.gao@intel.com>
Message-ID: <aHEYtGgA3aIQ7A3y@google.com>
Subject: Re: [RFC PATCH 03/20] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org, 
	pbonzini@redhat.com, eddie.dong@intel.com, kirill.shutemov@intel.com, 
	dave.hansen@intel.com, dan.j.williams@intel.com, kai.huang@intel.com, 
	isaku.yamahata@intel.com, elena.reshetova@intel.com, 
	rick.p.edgecombe@intel.com, Farrah Chen <farrah.chen@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 23, 2025, Chao Gao wrote:
> +static __maybe_unused int seamldr_call(u64 fn, struct tdx_module_args *args)
> +{
> +	u64 vmcs;
> +	int ret;
> +
> +	if (!is_seamldr_call(fn))
> +		return -EINVAL;
> +
> +	/*
> +	 * SEAMRET from P-SEAMLDR invalidates the current-VMCS pointer.

I'd rather this use human-friendly language as opposed to the SDM's pedantic
terminology, e.g. just "current VMCS".

> +	 * Save/restore current-VMCS pointer across P-SEAMLDR SEAMCALLs so
> +	 * that VMX instructions won't fail due to an invalid current-VMCS.
> +	 *
> +	 * Disable interrupt to prevent SMP call functions from seeing the

I would rather we establish a rule that KVM is allowed to do VMREAD/VMWRITE in
IRQ context, i.e. don't single out SMP function calls.

> +	 * invalid current-VMCS.
> +	 */
> +	guard(irqsave)();
> +
> +	ret = cpu_vmcs_store(&vmcs);
> +	if (ret)
> +		return ret;
> +
> +	ret = seamldr_prerr(fn, args);
> +
> +	/* Restore current-VMCS pointer */
> +#define INVALID_VMCS   -1ULL
> +	if (vmcs != INVALID_VMCS)
> +	       WARN_ON_ONCE(cpu_vmcs_load(vmcs));
> +
> +	return ret;
> +}
> diff --git a/arch/x86/virt/vmx/vmx.h b/arch/x86/virt/vmx/vmx.h
> new file mode 100644
> index 000000000000..51e6460fd1fd
> --- /dev/null
> +++ b/arch/x86/virt/vmx/vmx.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef ARCH_X86_VIRT_VMX_H
> +#define ARCH_X86_VIRT_VMX_H
> +
> +#include <linux/printk.h>
> +
> +static inline int cpu_vmcs_load(u64 vmcs_pa)
> +{
> +	asm goto("1: vmptrld %0\n\t"
> +			  ".byte 0x2e\n\t" /* branch not taken hint */


Heh, don't copy paste the crappy indentation, that was a result of Linus' tree-wide
changes from 4356e9f841f7 ("work around gcc bugs with 'asm goto' with outputs"),
i.e. not intentional.

Regarding question #3 from the cover letter:

  3. Two helpers, cpu_vmcs_load() and cpu_vmcs_store(), are added in patch 3
     to save and restore the current VMCS. KVM has a variant of cpu_vmcs_load(),
     i.e., vmcs_load(). Extracting KVM's version would cause a lot of code
     churn, and I don't think that can be justified for reducing ~16 LoC
     duplication. Please let me know if you disagree.

I'm fine with the SEAMLDR code having its own code, because I agree it's not worth
extracting KVM's macro maze just to get at VMPTRLD.  But I'm not fine with creating
a new, inferior framework.  So if we elect to leave KVM alone for the time being,
I would prefer to simply open code VMPTRST and VMPTRLD in seamldr.c, e.g.

static inline int seamldr_call(u64 fn, struct tdx_module_args *args)
{
	u64 vmcs;
	int ret;

	if (!is_seamldr_call(fn))
		return -EINVAL;

	/*
	 * SEAMRET from P-SEAMLDR invalidates the current VMCS.  Save/restore
	 * the VMCS across P-SEAMLDR SEAMCALLs to avoid clobbering KVM state.
	 * Disable interrupts as KVM is allowed to do VMREAD/VMWRITE in IRQ
	 * context (but not NMI context).
	 */
	guard(irqsave)();

	asm goto("1: vmptrst %0\n\t"
		 _ASM_EXTABLE(1b, %l[error])
		 : "=m" (&vmcs) : "cc" : error);

	ret = seamldr_prerr(fn, args);

	/*
	 * Restore the current VMCS pointer.  VMPTSTR "returns" all ones if the
	 * current VMCS is invalid.
	 */
	if (vmcs != -1ULL) {
		asm goto("1: vmptrld %0\n\t"
			 "jna %l[error]\n\t"
			 _ASM_EXTABLE(1b, %l[error])
			 : : "m" (&vmcs) : "cc" : error);
	}

	return ret;

error:
	WARN_ONCE(1, "Failed to save/restore the current VMCS");
	return -EIO;
}
