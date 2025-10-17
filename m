Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98612FE56A
	for <linux-coco@lists.linux.dev>; Fri, 17 Oct 2025 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760721020; cv=none; b=ukYwRB6l1KL6a0b7T+g/gItFI1gHUHJcX/pr5s/Gk/ZDO/FCw0JqvgR/gcv+4+63mGuN50/Kx0CDwp+XAA7DtcGDk2M1/Ef2GSJzsya1ugQidyP+MkZd+ddE7TT5HDFDjBQSxcfW8o5H2AcKMH7bzkmcuZKobLjkAf/eLquUkRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760721020; c=relaxed/simple;
	bh=BCRpauX8EGhu4tSnjwT10f6Zoi0e1G8sa0Y+n+4d9jU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eUxNMsY1C+n9ujacooG4LAnd1/BWZsF9BZ0BM1y8hOTecZoZlUWkKETaXcaplfrYztsMiyqS/Ayr/tp+t6lNXivDFdgZeEmJd0mWOr2fhovV3DURChlX8Mw1M56CNNOl9B0snm4g5L44eScgKsdUtvCnWUXD43JOLeyG27+fRWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q+4Im4t8; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q+4Im4t8"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33428befbbaso2644527a91.0
        for <linux-coco@lists.linux.dev>; Fri, 17 Oct 2025 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760721017; x=1761325817; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifJ61lnza1eEGqNIU2Rf5rvGvVu/vXThPUsXhboidrg=;
        b=q+4Im4t80UI0gwPxvez1xTU4FC+CBzxyiXX4SHSQy0YIqa+fLY3OKWYDnXJ8UGxgKU
         6wS7N88lykcdQlQ0eeVSVWi0UMN90hCMQRRVXmHdtxJHGDzEpaYj7FIrZ2B4DnEWjrHf
         pFuH2W44Bl8dLbiNTxhcYmj/qfU0Ns/G+u7yF4vRVOvSvFv+rhBDzmj3YOoo+wc8HXAY
         wlRi/7n54TTappNK9g72WKBIBz93fRWJeh9PIwZ+Dq0YJYI72EFp+G+19FiuC+DWBYqp
         xfktBSmRIpHtF3+rffBuoI+gnqmxCXckqW4CzwmI29LWJzN4a/OpRgeZpRYc3a/ASVnO
         MeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760721017; x=1761325817;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifJ61lnza1eEGqNIU2Rf5rvGvVu/vXThPUsXhboidrg=;
        b=Y5XWeSq/V6GKuvlTsO8vQLWBXz+wpbykWm+Cixw/SfQ6zu5WB8GqohESqqr48Xkjzz
         c9XZPTuS2RD/D7GdAcW3zUfo2AcHXujavc+I7+6RANTJxFOl9Nyrcn1o5tcxZm8imi4F
         3rCz+96TSAgvtriMTWgOe0TXn5yonGtKqx9eX2G1QwTTkSBenEzpPbAabCBb6oWwrZN8
         5S7+Lgdrlc7EYvbalT66HDWaAssgsWo9Yqk9x7nca5Pm0h4XP/h8VBpHva8p5rF1jnqJ
         qh2ghM4cqSlIsTOe1vUotYdW89TZCztLJvqY92ppGQrf2/cqIACeAhb8dQoMEV6Q9KWR
         3vbA==
X-Forwarded-Encrypted: i=1; AJvYcCUdRb7vBjAe8gre9x3xEoBDaa7FjH6rfKTFjZO2EYt8N8ZXL6HLhywDFfRJd2GETLG5BQoh9JBE+9YM@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2hV2LJ1pmRO7mkVU4SHfOVZ6fq7zVtHkgVC/ZaSHV0968iFmY
	7yGJjnX/2+v1cdv/GBCMAhwlpUR9xt5jxPGxaU6SWSpWyEdL35hHfuDHDCEvcCXLxJgax34y9qs
	TUAgaMg==
X-Google-Smtp-Source: AGHT+IEUYB0R7dtvKf9oX+a/EZzYYKzh3p3ExodHlnWKuRtJXwDliYrt7t1caDRrBgIsgz5MAIKuOjmjxVk=
X-Received: from pjbgz13.prod.google.com ([2002:a17:90b:ecd:b0:33b:51fe:1a72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c0e:b0:33b:c5de:6a4e
 with SMTP id 98e67ed59e1d1-33bcf853711mr5333787a91.5.1760721017415; Fri, 17
 Oct 2025 10:10:17 -0700 (PDT)
Date: Fri, 17 Oct 2025 10:10:15 -0700
In-Reply-To: <aPICkLKEMFI2OouB@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010220403.987927-1-seanjc@google.com> <20251010220403.987927-3-seanjc@google.com>
 <aPICkLKEMFI2OouB@intel.com>
Message-ID: <aPJ4d3frVpRA7WKG@google.com>
Subject: Re: [RFC PATCH 2/4] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Dan Williams <dan.j.williams@intel.com>, Xin Li <xin@zytor.com>, 
	Kai Huang <kai.huang@intel.com>, Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 17, 2025, Chao Gao wrote:
> > void vmx_emergency_disable_virtualization_cpu(void)
> > {
> > 	int cpu = raw_smp_processor_id();
> > 	struct loaded_vmcs *v;
> > 
> >-	kvm_rebooting = true;
> >-
> >-	/*
> >-	 * Note, CR4.VMXE can be _cleared_ in NMI context, but it can only be
> >-	 * set in task context.  If this races with VMX is disabled by an NMI,
> >-	 * VMCLEAR and VMXOFF may #UD, but KVM will eat those faults due to
> >-	 * kvm_rebooting set.
> >-	 */
> >-	if (!(__read_cr4() & X86_CR4_VMXE))
> >-		return;
> >+	WARN_ON_ONCE(!virt_rebooting);
> >+	virt_rebooting = true;
> 
> This is unnecessary as virt_rebooting has been set to true ...
> 
> >+static void x86_vmx_emergency_disable_virtualization_cpu(void)
> >+{
> >+	virt_rebooting = true;
> 
> ... here.
> 
> and ditto for SVM.

Yeah, I wasn't sure what to do.  I agree it's redundant, but it's harmless,
whereas not having virt_rebooting set would be Very Bad (TM).  I think you're
probably right, and we should just assume we aren't terrible at programming.
Setting the flag in KVM could even hide latent bugs, e.g. if code runs before
x86_virt_invoke_kvm_emergency_callback().

> >+	/*
> >+	 * Note, CR4.VMXE can be _cleared_ in NMI context, but it can only be
> >+	 * set in task context.  If this races with VMX being disabled via NMI,
> >+	 * VMCLEAR and VMXOFF may #UD, but the kernel will eat those faults due
> >+	 * to virt_rebooting being set.
> >+	 */
> >+	if (!(__read_cr4() & X86_CR4_VMXE))
> >+		return;
> >+
> >+	x86_virt_invoke_kvm_emergency_callback();
> >+
> >+	x86_vmx_cpu_vmxoff();
> >+}
> >+
> 
> <snip>
> 
> >+void x86_virt_put_cpu(int feat)
> >+{
> >+	if (WARN_ON_ONCE(!this_cpu_read(virtualization_nr_users)))
> >+		return;
> >+
> >+	if (this_cpu_dec_return(virtualization_nr_users) && !virt_rebooting)
> >+		return;
> 
> any reason to check virt_rebooting here?
> 
> It seems unnecessary because both the emergency reboot case and shutdown case
> work fine without it, and keeping it might prevent us from discovering real
> bugs, e.g., KVM or TDX failing to decrease the refcount.

*sigh*

I simply misread my own code (and I suspect I pivoted on what I was doing).  I
just spent ~10 minutes typing up various responses about how the emergency code
needs to _force_ VMX/SVM off, but I kept overlooking the fact that the emergency
hooks bypass the refcounting (which is obviously very intentional).  /facepalm

So yeah, I agree that exempting the refcount on virt_rebooting is bad here.
E.g. if kvm_shutdown() runs before tdx_shutdown(), then KVM will pull the rug
out from under TDX, and hw/virt.c will attempt to disable virtualization twice.
Which is "fine" thanks to the hardening, but gross and unnecessary.

Thanks so much!

> >+
> >+	if (x86_virt_is_vmx() && feat == X86_FEATURE_VMX)
> >+		x86_vmx_put_cpu();
> >+	else if (x86_virt_is_svm() && feat == X86_FEATURE_SVM)
> >+		x86_svm_put_cpu();
> >+	else
> >+		WARN_ON_ONCE(1);
> >+}
> >+EXPORT_SYMBOL_GPL(x86_virt_put_cpu);
