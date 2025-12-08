Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA529BD9A
	for <linux-coco@lists.linux.dev>; Mon,  8 Dec 2025 23:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765235850; cv=none; b=DIbdRBoe1XpHjMnOsILrS3jsiWM+fgBHzhmWTpogtpcOuOhRSxYCJE541mAUm5/MxcLQL6ej6TtZM/xk62UFSvCo5xFmnKp8DTOOQhRwAsMDqA1BfeoH/qFm18P7BUEoi4yJLcHZS9skgTFTmM046a7QlopMO4SiE+SYDbkDQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765235850; c=relaxed/simple;
	bh=hzoqkn8DRtGSQ9n26ZR8ioB/6vuZTI8jo81s+SZD2C4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QyLZe+hjq70pg5m3znhrDQIyeekMmoeZFNqLrx8c1NA2SPI4opGdNiF3vyPN21x9fdmVzsL1tWknZtVNWz47X9sPXzewlwMQxvuK+spjlOpEO8oqd85LpTvwxYQLwd+goWT5DH22htBSJ0nfb9dP9++Q2MsJMCp0Z7CSKOKT6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zrEEnuPy; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zrEEnuPy"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso5439197a91.3
        for <linux-coco@lists.linux.dev>; Mon, 08 Dec 2025 15:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765235846; x=1765840646; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cni1OkdWwZPVVj0qFxlPetCrrcs1VWExpXG1dqivn9Y=;
        b=zrEEnuPyoAZ3iN7lx9pjsdJOSEojladx8BnMwEmpGh5aGNDY9r5k+3Hg0BQ7v6YTvu
         2XhwsKozpN8pQMlIcIE+5LfxNZosOGPXTQLte2zoqpKRJeJTILBL4gTRTVMPD8sJyTtr
         6Fqnn4A3Vqkuv4Y9LJCJB4KlWxGYA9gFD5Hw9n3oKSKv2RscYUQusfi1v/zSQsLvsM41
         J3TskehVLaiz6hG0z/tKnJL+Na9DvlrOyIA55+5up7XttY7HpbDHvwLGjGb5Be8DUY/Z
         dDCei5edaJSzeOPQXmQg+Z1CW6kWaLBp8FhYDqsYWdiZ8S1ushD/lPy3SqlxKtl6Q9hB
         jwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765235846; x=1765840646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cni1OkdWwZPVVj0qFxlPetCrrcs1VWExpXG1dqivn9Y=;
        b=k0/boKfTTO0vtPjTs8u1A7EZPJXc6v8b8X7gXIydfJf27DWYPfalhwVSeEjggNyG47
         lbxqtvR0HJep546UrkhfQwskAmRYyprJgKoVcjRPC17En14ViU91SD7tGqi1HPDJ9tVi
         ZX8tMdkGsYdbkrLurlFkkXW+2YLKHuoL8ME2npGqCoF3ljRtiRCVxIbrwMaHl2WusPeO
         R6x5fvOUo8C/5k/RHSiJDbOVgvq+JlKmavRk2FZX0V9cN5oFRiGeb2pXvKRl6M4y7deB
         qAWL9o6+SEsCxhUUxX/sY0JJUhgC31TGhmKOCfJub4UYESptJ1XCU2oNYTw5rGvXYt7D
         PdYg==
X-Forwarded-Encrypted: i=1; AJvYcCU7+1tbLEFsRUxgaVEWz0NFUX9CoN2Jb0kmpKeQJxThQ6cLI4rKcmaRI/uFplrHDVtIS7v5nKFti2Gc@lists.linux.dev
X-Gm-Message-State: AOJu0YzStbu2ASxTPluKFPH/oiTIipEcYQdDHumlWNBf7WOEEMqrpvtO
	mOagLv6eX4ZmtSQ7BwlvQ4c2PS9UMan8nnUV8zR73ids2E9YI1ftc7u3qDFoo2MUMbYGcVYm9zg
	ruS2WFA==
X-Google-Smtp-Source: AGHT+IHYtV9vc8av3yAHVyltMiSRqwP42w4ShmJsUWRWz6grAusj1twmP1ZR9qBB2t+PhOWUdJlv/v86tXY=
X-Received: from pjbgi22.prod.google.com ([2002:a17:90b:1116:b0:34a:49b2:8d33])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:558b:b0:341:124f:474f
 with SMTP id 98e67ed59e1d1-349a26c129dmr7076756a91.32.1765235846478; Mon, 08
 Dec 2025 15:17:26 -0800 (PST)
Date: Mon, 8 Dec 2025 15:17:25 -0800
In-Reply-To: <69352bd044fdb_1b2e10033@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251206011054.494190-1-seanjc@google.com> <20251206011054.494190-4-seanjc@google.com>
 <69352bd044fdb_1b2e10033@dwillia2-mobl4.notmuch>
Message-ID: <aTdchSmOBo60vbZT@google.com>
Subject: Re: [PATCH v2 3/7] KVM: x86/tdx: Do VMXON and TDX-Module
 initialization during subsys init
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, Dec 06, 2025, dan.j.williams@intel.com wrote:
> Sean Christopherson wrote:
> Given this routine now has nothing to do...
> 
> > +	 * TDX-specific cpuhp callback to disallow offlining the last CPU in a
> > +	 * packing while KVM is running one or more TDs.  Reclaiming HKIDs
> > +	 * requires doing PAGE.WBINVD on every package, i.e. offlining all CPUs
> > +	 * of a package would prevent reclaiming the HKID.
> >  	 */
> > +	r = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "kvm/cpu/tdx:online",
> > +			      tdx_online_cpu, tdx_offline_cpu);
> 
> ...the @startup param can be NULL. That also saves some grep pain no
> more multiple implementations of a "tdx_online_cpu".
> 
> Along those lines, should tdx_offline_cpu() become
> kvm_tdx_offline_cpu()?
> 
> [..]
> >  /*
> >   * Add a memory region as a TDX memory block.  The caller must make sure
> > @@ -1156,67 +1194,50 @@ static int init_tdx_module(void)
> >  	goto out_put_tdxmem;
> >  }
> >  
> > -static int __tdx_enable(void)
> > +static int tdx_enable(void)
> 
> Almost commented about this being able to be __init now, but then I see
> you have a combo patch for that later.
> 
> With or without the additional tdx_{on,off}line_cpu fixups:

I think the fixups you're looking for are in patch 5, "/virt/tdx: KVM: Consolidate
TDX CPU hotplug handling", or did I misunderstand?
