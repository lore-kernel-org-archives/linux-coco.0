Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD230AD1C
	for <linux-coco@lists.linux.dev>; Fri, 12 Dec 2025 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765565815; cv=none; b=pblYHLsjx74RS97ky6sXJMdY8vGtr1yrxbW1DLjn/Gl/vlz39G+emyJMOoR6QJeQUyilfEFvR6euYMjk7x8Km/WZ6PIce0hYwavxq09J8hDf1YCo47gflnXtJRG+Sgvj6cpTgX9SflUncjnqAItGFST46P5acVzJfPUhzF40g+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765565815; c=relaxed/simple;
	bh=xYXxNc2AV3h7rbgZpayWXOomVpFD7awP3QlK1Lm5d0M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gqOK9LSPpHbNEsul41au56AsnZWsdH32IlmqFJNQB315gf9WdGE0fBpPkM8MQF0tA7/pjhIJipiy0BLjMeKHPpqwdMZ07IKkul4tZ6Q/Qv0xhufU5Xg4oNBEjWB44LS61gz9C3FPRbFoTXmroIlW9PKqqTfTdjKRs+ctz+TzkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4e5j0j3t; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4e5j0j3t"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34ac814f308so1120613a91.3
        for <linux-coco@lists.linux.dev>; Fri, 12 Dec 2025 10:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765565813; x=1766170613; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mFwoukDCJ0i1Yt2vaHXPrXSJCcZgdjE7zAPQ1w0zwTo=;
        b=4e5j0j3tMxTdmWn+KHzVfvtM5Py7smolZdUDxmFSUF7vxdGXpcJ5RTrB/U+M6fXxRE
         f3ls12S016yXyFAvZUNEiwsjiQtAWN3N4CzE2mrzI3X6ac9dZUHJ5fTnt0GxLaPGj6EG
         R6t+HtMXU2Hgg4sSG5UECIVHI0Hu/HBbDrZAH5bgQ63RLSaXMBqvnPeZLXBD6CvR9x1u
         dttfanxGh81e+v272du2zdU1bF+ocZluOA3xRghgN8UGb0Jvo/n9rsI5TRL/bPTMSK7x
         Lpd2kLwt6Fw5fUSAFNphQpk84VsA395Rf/c+ikAPs+eqibN+0bwr/6WPBED+F4jPQ5xb
         ksMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765565813; x=1766170613;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFwoukDCJ0i1Yt2vaHXPrXSJCcZgdjE7zAPQ1w0zwTo=;
        b=uxHACjDxIedymnh9LmeUZ1mgDn/Q2h5QH/irOqS5jwSxGo4S/WC750sKjFaFNwlL2T
         hnC+Fzx4pS6WyA4QSFMBZc8kNmYqXZjZqoUnO6rExTfFPc9DEljSmu5v5yuiMNzuc6BZ
         7qPMpzqZ2tYX2H36vna1do8KIM+Bzhgzkp3TcKVl7z1j+wcVYecbFXLUc656Wj3Q2EIZ
         dLSWjHgVS2bqe49SnWBYNctgmLvaq9ZmV2fucn2kX2b1lLMQ00QUnl6axUFJy5KXoj4f
         foN4wrktik/m9vTgW2gD4K18cJ/694+dGUl2mbOaXx3BbfVjbdvc9kyW06l3k+lTa2uB
         tZPw==
X-Forwarded-Encrypted: i=1; AJvYcCU4w99haTtUatwcqAN6siWgmwtUk/x1e4c1cschn567/SNRZLOfX96yrTbAbgtvcZmeXnJzSzgW1E3h@lists.linux.dev
X-Gm-Message-State: AOJu0YycMvHol8eCmbnG1orwH2Re3eq54gRMM3ce9zDAZwmLtGHROyoE
	QcfUWf3HdlzEZrbbgvkHtTrtOW4MtyTrXGmRzchY4GorFwtA+Kuj8C72ht5C7gid2ElMrCWkd7S
	B7to/Fw==
X-Google-Smtp-Source: AGHT+IFAEi7fFkbRvgT/6RcbxzALSy/ReWD7zmWx1G02iRXYNeE26LiRDzb2r0XLIAu6l30uM6JLKfwuS3g=
X-Received: from pjbcl17.prod.google.com ([2002:a17:90a:f691:b0:33b:5907:81cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5288:b0:343:5f43:933e
 with SMTP id 98e67ed59e1d1-34abd78fcaemr2987040a91.19.1765565813345; Fri, 12
 Dec 2025 10:56:53 -0800 (PST)
Date: Fri, 12 Dec 2025 10:56:51 -0800
In-Reply-To: <aTfKeNMIiF8NCRlO@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com> <20251206011054.494190-4-seanjc@google.com>
 <aTfKeNMIiF8NCRlO@intel.com>
Message-ID: <aTxlc4u5VfW8sE-2@google.com>
Subject: Re: [PATCH v2 3/7] KVM: x86/tdx: Do VMXON and TDX-Module
 initialization during subsys init
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Dec 09, 2025, Chao Gao wrote:
> On Fri, Dec 05, 2025 at 05:10:50PM -0800, Sean Christopherson wrote:
> > static int __init __tdx_bringup(void)
> > {
> > 	const struct tdx_sys_info_td_conf *td_conf;
> >@@ -3417,34 +3362,18 @@ static int __init __tdx_bringup(void)
> > 		}
> > 	}
> > 
> >-	/*
> >-	 * Enabling TDX requires enabling hardware virtualization first,
> >-	 * as making SEAMCALLs requires CPU being in post-VMXON state.
> >-	 */
> >-	r = kvm_enable_virtualization();
> >-	if (r)
> >-		return r;
> >-
> >-	cpus_read_lock();
> >-	r = __do_tdx_bringup();
> >-	cpus_read_unlock();
> >-
> >-	if (r)
> >-		goto tdx_bringup_err;
> >-
> >-	r = -EINVAL;
> > 	/* Get TDX global information for later use */
> > 	tdx_sysinfo = tdx_get_sysinfo();
> >-	if (WARN_ON_ONCE(!tdx_sysinfo))
> >-		goto get_sysinfo_err;
> >+	if (!tdx_sysinfo)
> >+		return -EINVAL;
> 
> ...
> 
> >-	/*
> >-	 * Ideally KVM should probe whether TDX module has been loaded
> >-	 * first and then try to bring it up.  But TDX needs to use SEAMCALL
> >-	 * to probe whether the module is loaded (there is no CPUID or MSR
> >-	 * for that), and making SEAMCALL requires enabling virtualization
> >-	 * first, just like the rest steps of bringing up TDX module.
> >-	 *
> >-	 * So, for simplicity do everything in __tdx_bringup(); the first
> >-	 * SEAMCALL will return -ENODEV when the module is not loaded.  The
> >-	 * only complication is having to make sure that initialization
> >-	 * SEAMCALLs don't return TDX_SEAMCALL_VMFAILINVALID in other
> >-	 * cases.
> >-	 */
> > 	r = __tdx_bringup();
> >-	if (r) {
> >-		/*
> >-		 * Disable TDX only but don't fail to load module if the TDX
> >-		 * module could not be loaded.  No need to print message saying
> >-		 * "module is not loaded" because it was printed when the first
> >-		 * SEAMCALL failed.  Don't bother unwinding the S-EPT hooks or
> >-		 * vm_size, as kvm_x86_ops have already been finalized (and are
> >-		 * intentionally not exported).  The S-EPT code is unreachable,
> >-		 * and allocating a few more bytes per VM in a should-be-rare
> >-		 * failure scenario is a non-issue.
> >-		 */
> >-		if (r == -ENODEV)
> >-			goto success_disable_tdx;
> 
> Previously, loading kvm-intel.ko (with tdx=1) would succeed even if there was
> no TDX module loaded by BIOS. IIUC, the behavior changes here; the lack of TDX
> module becomes fatal and kvm-intel.ko loading would fail.
> 
> Is this intentional?

Nope, definitely not intentional.  I think this as fixup?

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index d0161dc3d184..4e0372f12e6d 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3365,7 +3365,7 @@ static int __init __tdx_bringup(void)
        /* Get TDX global information for later use */
        tdx_sysinfo = tdx_get_sysinfo();
        if (!tdx_sysinfo)
-               return -EINVAL;
+               return -ENODEV;
 
        /* Check TDX module and KVM capabilities */
        if (!tdx_get_supported_attrs(&tdx_sysinfo->td_conf) ||
@@ -3470,8 +3470,20 @@ int __init tdx_bringup(void)
        }
 
        r = __tdx_bringup();
-       if (r)
-               enable_tdx = 0;
+       if (r) {
+               /*
+                * Disable TDX only but don't fail to load module if the TDX
+                * module could not be loaded.  No need to print message saying
+                * "module is not loaded" because it was printed when the first
+                * SEAMCALL failed.  Don't bother unwinding the S-EPT hooks or
+                * vm_size, as kvm_x86_ops have already been finalized (and are
+                * intentionally not exported).  The S-EPT code is unreachable,
+                * and allocating a few more bytes per VM in a should-be-rare
+                * failure scenario is a non-issue.
+                */
+               if (r == -ENODEV)
+                       goto success_disable_tdx;
+       }
 
        return r;
