Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C91226BD8E
	for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294751; cv=none; b=OzSrdrm2JPmZ5FmtOqH1y7pu6XmtNGHqdLIh5O19cY1es4JjrUnM6HGPA17SYMF94gBFUgLf5oShldEIj7vXrsf18Dv05PtfT2mpei6BA/CN7g1MmqxieNpqGDMamT4q/S9jK/zVys8Bwt67x6H56iTHWxbttCtK3iUDaEWJ30Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294751; c=relaxed/simple;
	bh=yIyg4O5yYiMN7oIJCMQaW69afuHiK1Kltro4y0FMxoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WtLZf4W5KkjZZzLdRh3MoS8sasbF1TQ9SclesBYk7EKvOrl6+SoFNIkqL8KrPEcbyQYRQPLZs5F+P29nnCljDXP2ma6Pq4a99fDM0kReYhSG8Kt1yGYSTk63x/jJKxdKuol+9zRJmgHEDb4v7yqsJAiDvOlzysZGgVHnwR4A13I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wLFhnszD; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wLFhnszD"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa6409c0baso8008879a91.1
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 09:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739294748; x=1739899548; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fehn8/FKPdzBZiJ7SaATTiqPDXAlgIYGKuuyWYqseyE=;
        b=wLFhnszDRaMgAJH1f9bnylsQjBK17rx3PVDoY17cvvg42vnV1dgOQ8Ks838pFARoZr
         4DE5ixx5f9WwIRzksVXQPAWUizPB2ncwdZCYRQElRHhkCP7g7dTK5mLRcHxMuLdEMjTw
         uK5prPf/tiHVgbCLn55WrMixFCjtW/hWFfq6LEqIUaK2fjW9nsmJts6/8FQfM21rmUHN
         6u85F+9KjfkVcpjtyLKQBf+wcs1/DH4OKnNfFx8m/uwcNOerjTxRl5V+p1Ffe9Bs3IB4
         3RBQZUAnZvUYaFrI9vOCXOxqbSwprLtP18v4jNIRteolwqc/DmRH3ewzp2mMgcRc6szV
         EoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294748; x=1739899548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fehn8/FKPdzBZiJ7SaATTiqPDXAlgIYGKuuyWYqseyE=;
        b=DzaivyH5t/7sE7qs895qlSDOexeVaplbUgd8n9x05COZsLM5tPoft8fKNaVocm6hXk
         DxQl2zHDe2j4219at8dH7Qpn71kKcrgmzDpiSpZg4NsthNvkw6zZ9BrkJC4Rffpxz9Ep
         MkTVwSsR+6GDKxBNs/GMOJrOhTuSNHeoyPVrq4UELh3tPbQT8JqZ8/8TecxjSvP12yBo
         5KPTlbln4y07R8EVz3xfxXgttrkVihr914nZu72i/ZjuKY50+bhA3CmQxp8pKaKcA1qW
         E5Irv12OqVxQPiqBenM2jaAJDqYd2klQPUZ/sSnY4+ETwAcbeORx5lmtBXxfzV/8BnIm
         S8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCV6QYPQhufK20vm+PjbBmM6ejzKUQdliqKct3OYNCNPAazdvJgLhnF92WSs93qrfiTzaWZ8EanMYPu6@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdbbl/I2Af867ua48yWRujizBcokeVNqadzR5zAbZ8fYIvJNo7
	iEVR3k/jHgoOuqhcT9tXDgNUt5jppLLsXqRj9b7bz9FITE4soAvi+0ddwAY9Zztn2iHT2QZ1OOb
	pqA==
X-Google-Smtp-Source: AGHT+IFueIXltnSm3F29jVZndsq5T+j40lmj4UcIsQhmLdRSEShGqUPy9fjOgqE9JAinoOmES588AgdHP5k=
X-Received: from pjyf5.prod.google.com ([2002:a17:90a:ec85:b0:2fa:1481:81f5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:184d:b0:2ea:4c8d:c7a2
 with SMTP id 98e67ed59e1d1-2fa243db893mr28913562a91.24.1739294748442; Tue, 11
 Feb 2025 09:25:48 -0800 (PST)
Date: Tue, 11 Feb 2025 09:25:47 -0800
In-Reply-To: <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
 <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local>
Message-ID: <Z6uIGwxx9HzZQ-N7@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
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
> On Fri, Jan 31, 2025 at 06:17:03PM -0800, Sean Christopherson wrote:
> > Extract retrieval of TSC frequency information from CPUID into standalone
> > helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
> > a version that includes the multiplier math as TDX in particular does NOT
> > want to use native_calibrate_tsc()'s fallback logic that derives the TSC
> > frequency based on CPUID.0x16 when the core crystal frequency isn't known.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/tsc.h | 41 ++++++++++++++++++++++++++++++++++++++
> >  arch/x86/kernel/tsc.c      | 14 ++-----------
> >  2 files changed, 43 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
> > index 94408a784c8e..14a81a66b37c 100644
> > --- a/arch/x86/include/asm/tsc.h
> > +++ b/arch/x86/include/asm/tsc.h
> 
> Bah, why in the header as inlines?

Because obviously optimizing code that's called once during boot is super
critical?

> Just leave them in tsc.c and call them...
> 
> > @@ -28,6 +28,47 @@ static inline cycles_t get_cycles(void)
> >  }
> >  #define get_cycles get_cycles
> >  
> > +static inline int cpuid_get_tsc_info(unsigned int *crystal_khz,
> > +				     unsigned int *denominator,
> > +				     unsigned int *numerator)
> 
> Can we pls do a
> 
> struct cpuid_tsc_info {
> 	unsigned int denominator;
> 	unsigned int numerator;
> 	unsigned int crystal_khz;
> 	unsigned int tsc_khz;
> }
> 
> and hand that around instead of those I/O pointers?

Ah, yeah, that's way better.
