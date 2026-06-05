Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E973F386552
	for <linux-coco@lists.linux.dev>; Fri,  5 Jun 2026 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780682698; cv=none; b=KnN2WjQjBMkplKLlwQx0uTAoi1irHC9T2CQP/nj438suc2JOMoRnsa4k73TdHzm6YC36twhwRcz+uylOAY1hWg8GG3aF/xR3vSFSL2VCCbDtc1mZcqiFHX8K21L2VOFB9W91W9/GHJMKa+qM0tcHGlIZJ89bclQPdSGDzN38uN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780682698; c=relaxed/simple;
	bh=fCJzrdCYp/X/mAcNv+qBAxRieEPHzWXupi+xn0HxO88=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S0bBfppunL2fcoOoxRO+jF0KfD8zEYisctXS8PeSBPBt93eVKK6SCn2M7MEvgWpHkElTrONuwsOGZY+pd7dWGrylZEh634i4yqpyFnweRWvbuoV4mx6xDpkis4aTOaOjlkYQn/C8J3zRNWFxUT35sUx2E7duPw1SyzexNw7xhQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eAk3a44z; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eAk3a44z"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8423f424d5bso1500484b3a.3
        for <linux-coco@lists.linux.dev>; Fri, 05 Jun 2026 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780682696; x=1781287496; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zOxp1hSLKBpPLL80bFuxK8SsL52R5IjTb2Bqqq35EAY=;
        b=eAk3a44zynArv/I3Ge6isrRD+V0fXYj5YolmLFDqJs4nHPcaYAB74DRaT7wKWg+6vR
         rwEWGRuZncZz/lqAR+LF9v+jW/+ITolO/oSsqSlQk7dd4NwO/9m0VT2fq6UAwoU2UBZf
         /M6FjV8xfzixg/JNfNlfxRduZmwoU526E4T+ILC25ZfVtCUcNhyaGSWWMxJg4fxT4mh9
         fXhEtGw9m0CngSMvn7BR7eHQsIBJgNt1sTGl+OUaY5eFg5S8YPBAANIlrZmdBFIsL5/m
         BJOAuVLd2/Ghgw332UQ6t5TNN3REH8hC6v0gTLTiyaBalMLWGLkiJ9weRutacwmQ+q/Y
         /XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780682696; x=1781287496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOxp1hSLKBpPLL80bFuxK8SsL52R5IjTb2Bqqq35EAY=;
        b=R5KMPlRV/DeiJofhEj8C2UlHQxIjmVIrjEf/6bNEpN772b1jIdu1qB2SY2zNLJ4j+/
         cZhM34NT0Y7sAAWJ+xBiXyX5SjUABaWTBQ+3LQ33Cd5Yub2kF16rp3qAZk4s9xTZkKOj
         N8PvLKnZSmzBTpojKDwNWTkY2HAu/JltwDp3h9N6skLCUgAu9AtgCpIPett9obbzSr0i
         r9q70hnnTJVcULHvcEIMalE6A0Us5qJKmRnOXHEmfSTAgVm6S7xt0SAKOkoCKLaCdf40
         dnE66lb409jzNLCJGznkPVVRbn99+jf9BvgnWwEOLXgbK/EMS6f+xl/DXcLF7yPnjEcN
         1RyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MlGLm5TKByk2I36rTMQsAiI3u4tDukcvi1XpY8IIjYVIW2zJ3zbiWd0qKswQ/8KN37kkfkjxToLdl@lists.linux.dev
X-Gm-Message-State: AOJu0YwBaVqGjMaAU2b/j4iA1LyN8+W4HG+rSTwr6NnKZgnLYYdocYmA
	2WreCOtDtZ6IHIYwVX/hhlhKcgGhq8j5E1uoUgYyq8GvA413/WljGJZ99IkeJZ0R9hCbZfo8/Sn
	t7XzcBQ==
X-Received: from pfjq2.prod.google.com ([2002:a05:6a00:882:b0:842:1f0e:d24c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:218e:b0:842:4e43:6f6c
 with SMTP id d2e1a72fcca58-842b0fb60bfmr4509683b3a.39.1780682695567; Fri, 05
 Jun 2026 11:04:55 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:04:54 -0700
In-Reply-To: <87fr315fq9.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com> <20260529144435.704127-2-seanjc@google.com>
 <87fr315fq9.ffs@fw13>
Message-ID: <aiMPxl5vkvJDldi9@google.com>
Subject: Re: [PATCH v4 01/47] x86/tsc: Never re-calibrate TSC frequency if its
 exact timing is known
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 05, 2026, Thomas Gleixner wrote:
> On Fri, May 29 2026 at 07:43, Sean Christopherson wrote:
> > Don't re-calibrate the TSC frequency if the TSC is known to run at a fixed
> > frequency.
> 
> That's misleading because fixed frequency means that the frequency does
> not change, i.e. X86_FEATURE_CONSTANT_TSC is set. But
> X86_FEATURE_CONSTANT_TSC does not imply that the frequency can be read
> from CPUID/MSRs.

Sorry, "if the TSC runs at a known, fixed frequency" would be a better way to
phrase this.

> > In practice, this is likely one big nop, as re-calibration is
> > used only for SMP=n kernels, and only for hardware that is 20+ years old,
> > i.e. is extremely unlikely to collide with TSC_KNOWN_FREQ.
> 
> recalibrate_cpu_khz() is only invoked from Intel P4 and AMD K7 CPU
> frequency drivers, which means that's absolutely not interesting and
> neither X86_FEATURE_CONSTANT_TSC nor X86_FEATURE_TSC_KNOWN_FREQ can be
> set on those systems.

It _shouldn't_ be set on those systems, but in the world of virtualization it's
not completely impossible.

> IOW, this patch is pointless voodoo ware.

Would y'all be opposed to adding a WARN?  I don't actually care about P4 or K7
CPUs, but without any reference to X86_FEATURE_TSC_KNOWN_FREQ in
recalibrate_cpu_khz(), the code _looks_ wrong, and so is very confusing for
readers that don't already know that in practice, it's limited to ancient CPUs.

In other words, the point is to document expectations and mutual exclusion, not
to "fix" anything.
