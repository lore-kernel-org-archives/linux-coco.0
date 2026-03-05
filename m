Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2516E3DBD6F
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730663; cv=none; b=T6R+rolVOGCvQTxn4g4r2kaMTy+poe3LfdBkWEuZM452Hz7fEJPVmW5MmQzyOlhZ9jlQxLFey8+LxkC51Gly+kS5E6r1VeIQ3Mm553bV959QuhjFm/spgclkq0v5XEzs1LvpHn0mOGoAzio39/cnTFB6x/5zVqQXuqkqZyetNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730663; c=relaxed/simple;
	bh=vwgoh1YpPCNmEVw+tt+RGy4f+rv+AHH7GLlM+0zF37Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dUetmJhHsETSWK6+7WkNwHUNeaNYiKT6Df3spRoO4T6j9oLrQIVROOaPof8PgOGksr/4VTSuF0dekX+BEfufRyVsFB/CvkZmyfEZwHICwWCm/uhVytnRtm/NAWcx/52EyqAwiEiOK489Lee1dURUGy1BrPn8Q9KaHb4yJer63iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KO1XCAee; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KO1XCAee"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c44bf176so7710304a91.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 09:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772730661; x=1773335461; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wjP5vV9RH9OSKAjVvneHEnYGM5u56iDo3DZIIc/IaHE=;
        b=KO1XCAeeMo3veVMrFivHsRjCLHbQB2iTl9k4yywahx+oRt5sUh9YF2A0T9rmFrRYtF
         sm4cmE9aI9Va0sDVZpIvJ6Z0LctBJl0Ff6vVB5KnzAT/ytT5Haeko/4OPoUQjnKOomi6
         lfbpuBpTmCdVdyp+dFkbfJ65HJSWt/sFkNMfVPFr5fZp6bNMkYzUI/HVZsAtT7s9Y8yY
         GVmhBdRG355cBVHFbZPLYE+sFWQJ1CTJ/RCxCt2PHqcC+XqcFWzDiswJab+v7JjYWVKo
         bwDs270q+7iK7LLnGfsO6QmZWy5QG8qY2I1YMKF6kbXwevHTM7oj9maO/flAPe4EfJx3
         O6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730661; x=1773335461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjP5vV9RH9OSKAjVvneHEnYGM5u56iDo3DZIIc/IaHE=;
        b=JXj26UXvZwUnF7Sh+C92RoZFeASHgV4pMnGC849yQnskTXfThFXxzpxKzvEhs1qHW4
         XXyyyS/gjhxGHp7KwjzUMbUbpVaOx0TefdOmMIMpJyGQA3SKuh6B6fse6YOzTKNJtf/X
         FLRpr3GHVM9yWK+0i66s8ttWcKsyAAwFPpvU0eS4UMKm+tPLiJO9iuyr0/IDdG4N8HPI
         5pJ0djLgFAuozKsucYW8rNNcczzcpfHbm4a6YABNdJUXJdUfibx3l3t12fIv+935eCAY
         5sHMfA0T4B4WIsDCCWrKjZBpkBkM5jZpKiUti7z7cxW6r2ae1ih/1WWqgsOMSOyUTqQ3
         Iyog==
X-Forwarded-Encrypted: i=1; AJvYcCUENXRl7RRgVVzGbqT63mYHFah3/ki4riwulONZTVJ9m5nouqJRQHjCv4+YFbKVz/JKSVtCn/f7Y0JZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwGs+/LicsT1Nbkju/x5WcOayfp6+1y2K6T0NQhRjHkhk5oeEbH
	SzQYSc0n6PtKzfp4jCbFVSBFYaSQ5VDC8YPeysK6NEwSPj31CpnQZnYg1rB4Eykn8F0EGLP2er9
	LqgKdnQ==
X-Received: from pjj5.prod.google.com ([2002:a17:90b:5545:b0:359:974a:3d42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:510f:b0:32e:528c:60ee
 with SMTP id 98e67ed59e1d1-359a6a52fb0mr6143772a91.24.1772730661449; Thu, 05
 Mar 2026 09:11:01 -0800 (PST)
Date: Thu,  5 Mar 2026 09:07:57 -0800
In-Reply-To: <20260225012049.920665-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <177272739326.1549300.4569691006460007231.b4-ty@google.com>
Subject: Re: [PATCH 00/14] KVM: x86: Emulator MMIO fix and cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yashu Zhang <zhangjiaji1@huawei.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="utf-8"

On Tue, 24 Feb 2026 17:20:35 -0800, Sean Christopherson wrote:
> Fix a UAF stack bug where KVM references a stack pointer around an exit to
> userspace, and then clean up the related code to try to make it easier to
> maintain (not necessarily "easy", but "easier").
> 
> The SEV-ES and TDX changes are compile-tested only.
> 
> Sean Christopherson (14):
>   KVM: x86: Use scratch field in MMIO fragment to hold small write
>     values
>   KVM: x86: Open code handling of completed MMIO reads in
>     emulator_read_write()
>   KVM: x86: Trace unsatisfied MMIO reads on a per-page basis
>   KVM: x86: Use local MMIO fragment variable to clean up
>     emulator_read_write()
>   KVM: x86: Open code read vs. write userspace MMIO exits in
>     emulator_read_write()
>   KVM: x86: Move MMIO write tracing into vcpu_mmio_write()
>   KVM: x86: Harden SEV-ES MMIO against on-stack use-after-free
>   KVM: x86: Dedup kvm_sev_es_mmio_{read,write}()
>   KVM: x86: Consolidate SEV-ES MMIO emulation into a single public API
>   KVM: x86: Bury emulator read/write ops in
>     emulator_{read,write}_emulated()
>   KVM: x86: Fold emulator_write_phys() into write_emulate()
>   KVM: x86: Rename .read_write_emulate() to .read_write_guest()
>   KVM: x86: Don't panic the kernel if completing userspace I/O / MMIO
>     goes sideways
>   KVM: x86: Add helpers to prepare kvm_run for userspace MMIO exit
> 
> [...]

Applied to kvm-x86 mmio, with the hardened version of the helper in patch 14.
Thanks for the testing!

[01/14] KVM: x86: Use scratch field in MMIO fragment to hold small write values
        https://github.com/kvm-x86/linux/commit/0b16e69d17d8
[02/14] KVM: x86: Open code handling of completed MMIO reads in emulator_read_write()
        https://github.com/kvm-x86/linux/commit/4046823e78b0
[03/14] KVM: x86: Trace unsatisfied MMIO reads on a per-page basis
        https://github.com/kvm-x86/linux/commit/4f11fded5381
[04/14] KVM: x86: Use local MMIO fragment variable to clean up emulator_read_write()
        https://github.com/kvm-x86/linux/commit/523b6269f700
[05/14] KVM: x86: Open code read vs. write userspace MMIO exits in emulator_read_write()
        https://github.com/kvm-x86/linux/commit/cbbf8228c071
[06/14] KVM: x86: Move MMIO write tracing into vcpu_mmio_write()
        https://github.com/kvm-x86/linux/commit/72f36f99072c
[07/14] KVM: x86: Harden SEV-ES MMIO against on-stack use-after-free
        https://github.com/kvm-x86/linux/commit/144089f5c394
[08/14] KVM: x86: Dedup kvm_sev_es_mmio_{read,write}()
        https://github.com/kvm-x86/linux/commit/33e09e2f9735
[09/14] KVM: x86: Consolidate SEV-ES MMIO emulation into a single public API
        https://github.com/kvm-x86/linux/commit/326e810eaaa5
[10/14] KVM: x86: Bury emulator read/write ops in emulator_{read,write}_emulated()
        https://github.com/kvm-x86/linux/commit/3517193ef9c2
[11/14] KVM: x86: Fold emulator_write_phys() into write_emulate()
        https://github.com/kvm-x86/linux/commit/929613b3cd1a
[12/14] KVM: x86: Rename .read_write_emulate() to .read_write_guest()
        https://github.com/kvm-x86/linux/commit/216729846603
[13/14] KVM: x86: Don't panic the kernel if completing userspace I/O / MMIO goes sideways
        https://github.com/kvm-x86/linux/commit/4f09e62afcd6
[14/14] KVM: x86: Add helpers to prepare kvm_run for userspace MMIO exit
        https://github.com/kvm-x86/linux/commit/e2138c4a5be1

--
https://github.com/kvm-x86/linux/tree/next
