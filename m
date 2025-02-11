Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5621C22FE13
	for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291303; cv=none; b=WFMWl2uwNURzOiS7JdFxYTmFGQsn0boSVjngbBeI40dzKgZlucAQKYmeFGZeB3B/5J81Ef7nkqf7ZBExemQdjH+jSF8taXRrfXVzUuYbqtSQ0VpJuNSF71kjXeHfMBLHPxoYHrkyL5xFyxIjjaJB0gQSTxSWz45poO/6wxz1oHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291303; c=relaxed/simple;
	bh=yilJGqWW4RYMKFOjUyyusb+5EmeDe91eA1bXhwR/YFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o6wBZJX7lk5x4BJ+lTQ6dzWGUAlAU2NodYTCyLoO4TggJXQkh677YCLx2yzuZgeXI427pqUBpSsqwrrO//6ytiRhpQ+DY0UXZ+05u3MTnc4g0Q3iLBGyoxJNvXSfYbuDYAAyq1wgPvjXE4+UFmpHpwnRkyS+gKEH6FyKuVjSvsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BV8gyqEQ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BV8gyqEQ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so11356010a91.2
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 08:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739291301; x=1739896101; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5MEK/stSb+AMRyC9Zhx6OFHXRnHPVcvklj9Pc8LhwOQ=;
        b=BV8gyqEQ8Bo/dEWAAdR3aL3XgwtOcqF7BNB7v5dn8HgnIE9gKi56z680tOVvcUJEl8
         J++kUakbd2lfLWUYWsHqqEJTjiwSFTSbNQdsjeK3IHpuUSGtYiX+CyFiRGauYZPZqyqN
         1Bp0BCRB1NHF9FALR69/4ynEpKTGBxqwUK3E2fdc8PgFD/YgL6oViU+g9Qv1cTlCzPnO
         gcnJnTLlkPOybTrb+2R0Afk3210pMHRUtlDEEXN/OQeK7DRsr9qHpvCsKNuCAfUBa6MT
         5ymvH4XwK27IGYqt0/084kzcv3qcDDYUXCeW3aOTTTnXwpLwDFX6cGfD9Su4OXXYUb0B
         a29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291301; x=1739896101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MEK/stSb+AMRyC9Zhx6OFHXRnHPVcvklj9Pc8LhwOQ=;
        b=Af1IVpPZnt3B2/NHBrrfZSubki0UbRMX7qFGuQwmEcQ8oXuxYzfpnUwaVDrMSK6zaQ
         /hGmKHLXj3jJJN0CwVIZt4e8GcU11mvf+hXStj4S4lpBazWPYs8nnb12oN13Vsa/r9NF
         K4LXCuRXfKelN4gGqEqqqbRLqWlpjFbrP2faCKosRHWbZ7/Q+IaqOQSKQoTE8++q2Uwj
         pLggA+mdf3g3Hq41b5A7ruP9zqKmeiLoaiNEAb84z5sB1Y8bsQG54U3JGeyHsr/1Pi/S
         9jxRiROKaMrvO0ZEjO75RA651xlatwvy4PSS+UZq4CfUhQ1vJxRH4bamBhbejUv1efJr
         Rm+g==
X-Forwarded-Encrypted: i=1; AJvYcCXq+OFUAkKlqd2G+Z0NdEkXVC98cnaPV3MUYhpVv5t+3nV8ZK7KCFvSS4eivvAmpNlm656wKyo5YFoR@lists.linux.dev
X-Gm-Message-State: AOJu0YwtWBEatlVg606fGNWRWjOzRuodeuzwTZJ+gz65mSjcKr6qmp9c
	2I2FJrvRAAkNu5bISqyCoLNZunOnGwUJcaCimOQ/AP2pa8q7LgnK7hNfOhPoWdpJQ06DKVZi+hD
	9cQ==
X-Google-Smtp-Source: AGHT+IEW6FT5SzWSOj0JB0UAPg+blRK0ibYMj54XT+2rd1e326WroNU4nUmkSnUDL4aqV/75Jp14hq1SYiM=
X-Received: from pfrc11.prod.google.com ([2002:aa7:8e0b:0:b0:730:7648:7a74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:188f:b0:732:2170:b69a
 with SMTP id d2e1a72fcca58-7322170b72bmr3189092b3a.18.1739291301572; Tue, 11
 Feb 2025 08:28:21 -0800 (PST)
Date: Tue, 11 Feb 2025 16:28:20 +0000
In-Reply-To: <20250211143919.GBZ6thF2Ryx-D2YpDz@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250211143919.GBZ6thF2Ryx-D2YpDz@fat_crate.local>
Message-ID: <Z6t6pMgAjHckWMs_@google.com>
Subject: Re: [PATCH 00/16] x86/tsc: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 11, 2025, Borislav Petkov wrote:
> On Fri, Jan 31, 2025 at 06:17:02PM -0800, Sean Christopherson wrote:
> > And if the host provides the core crystal frequency in CPUID.0x15, then KVM
> > guests can use that for the APIC timer period instead of manually
> > calibrating the frequency.
> 
> Hmm, so that part: what's stopping the host from faking the CPUID leaf? I.e.,
> I would think that actually doing the work to calibrate the frequency would be
> more reliable/harder to fake to a guest than the guest simply reading some
> untrusted values from CPUID...

Not really.  Crafting an attack based on timing would be far more difficult than
tricking the guest into thinking the APIC runs at the "wrong" frequency.  The
APIC timer itself is controlled by the hypervisor, e.g. the host can emulate the
timer at the "wrong" freuquency on-demand.  Detecting that the guest is post-boot
and thus done calibrating is trivial.

> Or are we saying here: oh well, there are so many ways for a normal guest to
> be lied to so that we simply do the completely different approach and trust
> the HV to be benevolent when we're not dealing with confidential guests which
> have all those other things to keep the HV honest?

This.  Outside of CoCo, the hypervisor is 100% trusted.  And there's zero reason
for the hypervisor to lie, it can simply read/write all guest state.
