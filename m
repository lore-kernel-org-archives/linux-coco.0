Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BA21DDCB
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yx5Y2d+T"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c9d4e38f79so8013165ad.2
        for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697815927; x=1698420727; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X28nqJeYL84cwkoy9Ukz+291k+i+3AkqmrCU0I6FmGI=;
        b=Yx5Y2d+TZSUia4CIdSCRpRl+C0RYGr+CExJD6O3J64xcjBQIoJGfwfuAx62sEZIn+G
         veweAWpJ8i9bi7vJ/Ntzedn8VN5nr12NPF2eW4Zpl0T98NRg1IW08wOK0mPvij5XI/5q
         Xk0pccgnCco9bN3fd4kWMFMdBPGwnrkGpGI/wT1VXJS9Hv6X5Vrkgh9cJFaw1bw2V1fF
         7sNDp1jzy05Tl2ekmpzhA9SY6K5fdVWKmL5s5V1Q9UHIv9ffQodEJGLMmRPLnoFR8t32
         lUVnNoD3Dv6hWk2VMiX62s3kRWUzwrlZjOWXhpNVg5lKkplyWLGaigYk3ZizCzJnRuax
         i8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697815927; x=1698420727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X28nqJeYL84cwkoy9Ukz+291k+i+3AkqmrCU0I6FmGI=;
        b=X6abHdVi9AaBfo1lbc3EscJRHFtdKBe5BxlrXDsY24kpHA9CBC7hO68xMj61YIHicm
         8AylIOq3TYCEqXoZDCpooydb+dPjSW4csdpmQim68qc9Arb8VMYIgJQEG+yinlvDgPOd
         TLwkfuUZYc0J1+QpU+fRCqb3jpXO7XYF/vTKYB35XRtMv4CGPUkbUNMjP2gf1rEoDgJC
         +3kHWY2SpxBxVIlQpZTLOIPF1g3vq7m7BBcyoE1kAsof0msnzvUpbXLMFNQ6UxCdOWXl
         vnY2QsiKNjgqaNQv0VWWCykVTY2VGKFNK5ctIT1n22gZP2XeXYJXpMYm+41jgSdK1Ef+
         /+ag==
X-Gm-Message-State: AOJu0Yw+PvBGJNPoFOfrPjj7MijylgJcDSmFDAoySwJZMp/u7EXCppy8
	Y998gbre1DSbVhvdW/RsGf0PePl3ZnM=
X-Google-Smtp-Source: AGHT+IH2aSPsxsO7CwyUlO4VocEfaDkvgJ7FypQ7zwjBiO8wnvZig7O+kXIj+6lirvDOUIZvueCzOsujUuo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e214:b0:1c9:db23:706e with SMTP id
 u20-20020a170902e21400b001c9db23706emr38706plb.5.1697815926809; Fri, 20 Oct
 2023 08:32:06 -0700 (PDT)
Date: Fri, 20 Oct 2023 08:32:05 -0700
In-Reply-To: <20231020151242.1814-5-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com> <20231020151242.1814-5-kirill.shutemov@linux.intel.com>
Message-ID: <ZTKddZEUyL3QQB6_@google.com>
Subject: Re: [PATCHv2 04/13] x86/kvm: Do not try to disable kvmclock if it was
 not enabled
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Kai Huang <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 20, 2023, Kirill A. Shutemov wrote:
> kvm_guest_cpu_offline() tries to disable kvmclock regardless if it is
> present in the VM. It leads to write to a MSR that doesn't exist on some
> configurations, namely in TDX guest:
> 
> 	unchecked MSR access error: WRMSR to 0x12 (tried to write 0x0000000000000000)
> 	at rIP: 0xffffffff8110687c (kvmclock_disable+0x1c/0x30)
> 
> kvmclock enabling is gated by CLOCKSOURCE and CLOCKSOURCE2 KVM paravirt
> features.
> 
> Do not disable kvmclock if it was not enabled.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Wanpeng Li <wanpengli@tencent.com>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
