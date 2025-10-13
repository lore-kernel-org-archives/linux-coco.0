Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059C23D7EF
	for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760365414; cv=none; b=JXpbmHtnL7GeErqydAc3MEbw0MI4bQqyvMHvoj6liYCCfSknv49aZY/DScgtC+70ffn7zUzDdQVuEiDxSGc0OlgSpAGOwQOzXlmx/on8215wuLIyrgrqVGZ9s7wapdW1hrcokAxayC+uPzWDWxiwzStHa0kp2ivQUp7O9LRvfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760365414; c=relaxed/simple;
	bh=dJqtEcjgvo9hPngB+YtUypzu7HzbSy5gU34M7TIkozU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qbUnVHRojx7EDpAE/1X0GpcKgdQjBHz9KM/fDbbJNHkDVJQWzTCzfMpZEooAhqs/LIY9jfI6PhvvEJt3WxmwRakpIG35Ho86ComhTi6Jt3xhdzkjRlHZL/1pfo91bXiusSO30fpFFc6JUmskvhKeLZc6Uh/PKn9cFdqKOdjhPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=18Mc6K9k; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="18Mc6K9k"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso12924926a91.2
        for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760365412; x=1760970212; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/IA0q+BCGyp+0QkRiU+mRotiQ2wwtZhT82w0C29Tzhk=;
        b=18Mc6K9kO7y0hHoTcSPJOt0JvkWNbk+gxsjGvwe4VBjNFUpbPr40xzdHEu4VjS81R4
         qp+sy6AOvPk2jkGEqg/Q2u15wrRW2+v77SEhQEATA2UFJkpXrNwTrFjpRYx58EBqlvtq
         8slg3vL5EPj7mXNW+5XQkDIuQKZxdIX8CwljGIeDImrJG8UrhWIBfyapmYO/RJZXUdRK
         OnLHld4qI0v4mFdLR7WLsALOYdIo5S6CBT1ppFRjC2NkRZiPVFe5HLpIcz+OFDcyhVkl
         VyKX+N7qC1jAeEgaEFNUcaTjV1XcYTLysstFaFXzyXLeN5159CzWtpr6FsUdj8g+YK/k
         5eGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760365412; x=1760970212;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IA0q+BCGyp+0QkRiU+mRotiQ2wwtZhT82w0C29Tzhk=;
        b=Gf95TeIDwJsAgXsc2mQVR+584lGFFglDs03uJZP7PB0OQlbNGY9Aj80DbvTXjSCjU0
         8A8/Nk+ZUutwyzEJ2teWoFm3xQmGSRKmEy4Q0x9q14/t52IQz7qLzef+8cT7dxNLaahN
         w1fi1kdZNtRWHlTWPu3yehpGzrLeO3MwZ4+2vDYuBDgWFvgeA1rBOTZwp3saKoOVaAc1
         uqCtUzQZ7zhLHR84FgAJVi7pUAC2qPgVfY+3vVfgt7FHmoTsVpxw3tGy61gbHIzdCnY4
         GWSgl8dHwxyGq0K0LwozrHJZRXjvEHxpDGiXg425vJovrJq9xRn/B3MYafPyPFLm2o1s
         2GRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJj71guCncNJAtUGrLNpjtIjx4lRvJnUM1YkLjGEtWkEWtsnZ7GgI8TQIhV9jYkRTMiQCqkJmKvW2G@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6UsVwleK1GBFSPgpqP0+Rn1UpfpprUGX6vF+lUmwMGSFIeig1
	IjP62X43yqqUAITFsFakPDPlQNi87S8c2RtZwgVAMdwiHNdWnRqYsrPsaf2DJfcbXWVnMXA/kY/
	swN7RHQ==
X-Google-Smtp-Source: AGHT+IEtt/r42k36nNjq1mgNkzGtA8MgFLr+mcoAjoS9JXR/HT4Da0zxS7NKvGB/ApBa7EI/8Iui2bia50k=
X-Received: from pjrx21.prod.google.com ([2002:a17:90a:bc95:b0:33b:51fe:1a81])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d89:b0:32e:c649:e583
 with SMTP id 98e67ed59e1d1-33b513b3e14mr24273677a91.22.1760365411945; Mon, 13
 Oct 2025 07:23:31 -0700 (PDT)
Date: Mon, 13 Oct 2025 07:23:30 -0700
In-Reply-To: <aOz1X4ywkG3nG2Up@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010220403.987927-1-seanjc@google.com> <20251010220403.987927-4-seanjc@google.com>
 <aOz1X4ywkG3nG2Up@intel.com>
Message-ID: <aO0LYuzdRHsB7aPj@google.com>
Subject: Re: [RFC PATCH 3/4] KVM: x86/tdx: Do VMXON and TDX-Module
 initialization during tdx_init()
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Dan Williams <dan.j.williams@intel.com>, Xin Li <xin@zytor.com>, 
	Kai Huang <kai.huang@intel.com>, Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 13, 2025, Chao Gao wrote:
> >-static int __tdx_enable(void)
> >+static __init int tdx_enable(void)
> > {
> >+	enum cpuhp_state state;
> > 	int ret;
> > 
> >+	if (!cpu_feature_enabled(X86_FEATURE_XSAVE)) {
> >+		pr_err("XSAVE is required for TDX\n");
> >+		return -EINVAL;
> >+	}
> >+
> >+	if (!cpu_feature_enabled(X86_FEATURE_MOVDIR64B)) {
> >+		pr_err("MOVDIR64B is required for TDX\n");
> >+		return -EINVAL;
> >+	}
> >+
> >+	if (!cpu_feature_enabled(X86_FEATURE_SELFSNOOP)) {
> >+		pr_err("Self-snoop is required for TDX\n");
> >+		return -ENODEV;
> >+	}
> >+
> >+	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "virt/tdx:online",
> >+				  tdx_online_cpu, tdx_offline_cpu);
> >+	if (state < 0)
> >+		return state;
> >+
> > 	ret = init_tdx_module();
> 
> ...
> 
> >@@ -1445,11 +1462,6 @@ void __init tdx_init(void)
> > 		return;
> > 	}
> > 
> >-#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
> >-	pr_info("Disable ACPI S3. Turn off TDX in the BIOS to use ACPI S3.\n");
> >-	acpi_suspend_lowlevel = NULL;
> >-#endif
> >-
> > 	/*
> > 	 * Just use the first TDX KeyID as the 'global KeyID' and
> > 	 * leave the rest for TDX guests.
> >@@ -1458,22 +1470,30 @@ void __init tdx_init(void)
> > 	tdx_guest_keyid_start = tdx_keyid_start + 1;
> > 	tdx_nr_guest_keyids = nr_tdx_keyids - 1;
> > 
> >+	err = tdx_enable();
> >+	if (err)
> >+		goto err_enable;
> 
> IIRC, existing TDX modules require all CPUs to have completed per-CPU
> initialization before TDMR/PAMT initialization.
> 
> But at this point, APs are not online, so tdx_enable() will fail here.

Ah.  Maybe invoke tdx_enable() through a subsys_initcall() then?
