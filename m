Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A091D2820AC
	for <linux-coco@lists.linux.dev>; Tue, 30 Dec 2025 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135594; cv=none; b=uRQm8Lo1asG4/pCQHANjw2BXgxcr6TGss5uac3+yfT2DI2c1T9hEUHwaWPgtOLC0OvWve3+CBs5GXjvhLMcF+b5KbPbtjyi4SiiUJ5XY6x7QyoNIwpD/xeXSnQNxd1JIn3h26vDsZjN5PzgIPAUWtsOLJ9Jqtj4zcj3mF9kw9M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135594; c=relaxed/simple;
	bh=yojfISBOIFSpXcr5+NNlskwwpGIiPkNElaXPFYmcfyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mu49PU12+k+gPooKHGb33gpSoZasdN3lkCO/ll46zK1kLinOwaBp+lU6oLbmY9EqzAPCMX9wwLJmYkFTuXxmx54uJA5GsDz+nmtdTtx5G+htzvRnqrl6Y+3s2yspKA+76pGmbJAlHd4t+Fli6G3zih51KvNdpOAf+is6XIuUR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WIbf5L+C; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WIbf5L+C"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so114536285ad.0
        for <linux-coco@lists.linux.dev>; Tue, 30 Dec 2025 14:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135592; x=1767740392; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBDadXmXw1V+5U8Oi2GEcCZPNX2euffTMHG2vLf3Jyo=;
        b=WIbf5L+CDKd1473qqnW7anOgDgyLPvJRID1Yp+/xC0PKcfyTXUIH6aUFzUWqaciwkC
         vOB4UcIv7nXNXB3CgJCyu0QtP/BM5vVq4as7/5fvdktGjk5IZJv/7Vhpgzvm8YZwmJWI
         ghzaKpBV/CLWD94kFHlini0OBQVExbGZpkK1lDZS769e7Wh4cRwcOcVMPu7/LqaS2MyT
         gfqjvpNWc1fNzpOLzPDZFGjiyXTaPG/vZwRK3Ib+M4Jmahuu6fk559P4FGpmGs4JcI0V
         fYhyiPK6je9UEmxMf0WNsg0ubAuqVhphZt8kkGUKAwBUczrT83I7ajI1jI2nRLYWoiqD
         pdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135592; x=1767740392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBDadXmXw1V+5U8Oi2GEcCZPNX2euffTMHG2vLf3Jyo=;
        b=VffihxHEhPEF9VtjOKcxT/RngPQI4E3NDY3iBFmhN6O2tQviijWYbyb1bxBlMqnRUU
         ytjPjttymGTKWdvvt1BF70s0/XDIvBc45Oqt5La3dgEb3KY0MX0PKauUFkCEb40o+dso
         AePSWJDtfu3cT7WfZm03Ou+AKJOgtI/WpOSW1wc6Gc6ShXuy2Y4HKCjD0WQKSGhxukpl
         UcwQpQUmtkrKICCE7RRZRFsga+rk8GPlgihvQBZBCH4xlhAiBr7vbBvx2K1R+yEEhySw
         ZaOvFFE4aw1dKTeMRCLhVRnEnK8FT46ziCSdMgAaFVmg8oQOyUBToTC4in5152qsIaPk
         j/bg==
X-Forwarded-Encrypted: i=1; AJvYcCU9rfDX6sDeYgEdRFxi/rzsR71i0ytvUdDX3ZcGgiDEjNHmipadmusG9DcZmdpGJZxy2wfF1kcPMAJA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1PbMZ87L+2xRKobuBuoMv5jawTRT3B/smFZX8i/A0aQACW+xD
	dji2E1Q5dBQykSPfoaLK67QfQ2k8irYXaxQAqOnOk5VHEdjMohhKLN2GaUAN+7kNMkmYaDd+x1w
	ihyJL9w==
X-Google-Smtp-Source: AGHT+IFeD+h6n1YidrAbsE5HiAota6bVKAwW35UPDKlcY0mTqb6cSWAiLyOFKPv8tt+wNUg2L4+hFSIa5lY=
X-Received: from pjzz4.prod.google.com ([2002:a17:90b:58e4:b0:34a:b8aa:69d8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d48e:b0:29e:fc06:b8a5
 with SMTP id d9443c01a7336-2a2cab16368mr405899135ad.18.1767135591960; Tue, 30
 Dec 2025 14:59:51 -0800 (PST)
Date: Tue, 30 Dec 2025 14:59:50 -0800
In-Reply-To: <aUvJWmZP5wLpvhnw@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com> <20251206011054.494190-3-seanjc@google.com>
 <69352b2239a33_1b2e100d2@dwillia2-mobl4.notmuch> <aTiAKG4TlKcZnJnn@google.com>
 <6939242dcfff1_20cb5100c3@dwillia2-mobl4.notmuch> <aTmBobJJo_sFbre9@google.com>
 <aUvJWmZP5wLpvhnw@yilunxu-OptiPlex-7050>
Message-ID: <aVRZZkAgmdLfudJc@google.com>
Subject: Re: [PATCH v2 2/7] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: dan.j.williams@intel.com, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Dec 24, 2025, Xu Yilun wrote:
> On Wed, Dec 10, 2025 at 06:20:17AM -0800, Sean Christopherson wrote:
> > On Wed, Dec 10, 2025, dan.j.williams@intel.com wrote:
> > > Sean Christopherson wrote:
> > > > On Sat, Dec 06, 2025, dan.j.williams@intel.com wrote:
> > > > I don't think we need anything at this time.  INTEL_TDX_HOST depends on KVM_INTEL,
> > > > and so without a user that needs VMXON without KVM_INTEL, I think we're good as-is.
> > > > 
> > > >  config INTEL_TDX_HOST
> > > > 	bool "Intel Trust Domain Extensions (TDX) host support"
> > > > 	depends on CPU_SUP_INTEL
> > > > 	depends on X86_64
> > > > 	depends on KVM_INTEL
> > > 
> > > ...but INTEL_TDX_HOST, it turns out, does not have any functional
> > > dependencies on KVM_INTEL. At least, not since I last checked. Yes, it
> > > would be silly and result in dead code today to do a build with:
> > > 
> > > CONFIG_INTEL_TDX_HOST=y
> > > CONFIG_KVM_INTEL=n
> > > 
> > > However, when the TDX Connect support arrives you could have:
> > > 
> > > CONFIG_INTEL_TDX_HOST=y
> > > CONFIG_KVM_INTEL=n
> > > CONFIG_TDX_HOST_SERVICES=y
> > > 
> > > Where "TDX Host Services" is a driver for PCIe Link Encryption and TDX
> > > Module update. Whether such configuration freedom has any practical
> > > value is a separate question.
> > > 
> > > I am ok if the answer is, "wait until someone shows up who really wants
> > > PCIe Link Encryption without KVM".
> > 
> > Ya, that's my answer.  At the very least, wait until TDX_HOST_SERVICES comes
> > along.
> 
> I've tested the PCIe Link Encryption without KVM, with the kernel
> config:
> 
>   CONFIG_INTEL_TDX_HOST=y
>   CONFIG_KVM_INTEL=n
>   CONFIG_TDX_HOST_SERVICES=y
> 
> and
> 
> --- /dev/null
> +++ b/drivers/virt/coco/tdx-host/Kconfig
> @@ -0,0 +1,10 @@
> +config TDX_HOST_SERVICES
> +       tristate "TDX Host Services Driver"
> +       depends on INTEL_TDX_HOST
> +       default m
> 
> Finally I enabled the combination successfully with a patch below, do we
> need the change when TDX_HOST_SERVICES comes?

Ya, we'll need something along those lines.  What exactly we want the Kconfig
soup to look like is TBD though, e.g. it may or may not make sense to have a
common config that says "I want virtualization!"?
