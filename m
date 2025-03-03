Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4321EE013
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 20:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741034990; cv=none; b=oKJTG9HrTCOnrKEDab+qAwD69k49VAS6/J73cxsv4VVtP9iyLm2RDdaSOsyXYeA2duN8lnF6w0imd9gs47bR8ikI0racWu/dhWGEgPW2G+nToPf2iEwCYnGiuuJb54hbSWzy5Lxv1o7GxXnLPaDkRF5vHPr4NncJ1Ocu8tSIHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741034990; c=relaxed/simple;
	bh=b9+l60C5FmoVBcnZ+2dbkAJ08foGGzMBuHGxYh0c6wM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FrkzDBznzFbEgO2ymBTH4erzEVXQjpdRmZ+NCoiiH6KlESw+oeOm0rl8JksEJWDStfE4hdqSeKChS6Q89m1PBridjygd8YiaExFPs/MyyNGJRm+bMDYBaq8vXwRNU93zA5i69k+2Q1HDJ4zy8UTU9JFF0XJjf6hfG9UlEQDpTXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DW5LGK12; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DW5LGK12"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2236b6fb4a6so117720265ad.2
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 12:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741034988; x=1741639788; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rX5WpwWoXZ5gyhXwc+nu9BIgzZ5Qej6ZgjHIIk8ELGc=;
        b=DW5LGK12jvSXUxvzdd0EeXn8ZEcK7fCLrlgTXXwTxXF5OodVteWH5kEXHqXkvGnKN1
         bdIVSEAbRIMVqTqdMnW5P8bbbVoe7s1Y/LaEe5YnTx42f29tSljRGO39UmwsOseei8U2
         TJAPXvC80yfGoXitrNWm0q1RE1t/daIY3i/yReNrRjH13OxuhkwR24d/0+dJGW1hRNPN
         d98atz/I3DcG1uMu6Nroooo7garqFBWBPj3EdnTargMi3WrfKBNOJm00w7+jdt/StO2r
         MaDoH5p6MkYCXJZyfGw70DMXQcW5S8izfZrhUdM/+s2tR+LHUtH+5lAc1aiKCHjEmyIY
         Zo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741034988; x=1741639788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rX5WpwWoXZ5gyhXwc+nu9BIgzZ5Qej6ZgjHIIk8ELGc=;
        b=sp4iP4o/u5JWbTZeLJEJV/v2YiF9/szjUlfMoeiVzj8fZtyZ+IfCXK+ZIEeS6AG885
         9cdtsbQsxUBgdeTtHgiryncbcqWA98O6LhuS9Ayoz8pw5Mmb9N4PNzOqZ/O++joSdtTZ
         Xwe63BrbR/jeXKDjn85nnMr5gTXp2RKR/cBZLX1Od18255pCdRVbCB161lQqhsm19uRr
         0MutTSCUYb1zUoI6j5qR8Ng2rV7upVs9XsaxLDIsggbDXzLd69dVQWTEV8XZ4LlZ+Hji
         +CZ4TIWW969tZperCkbi9UN2cjCrhZr6az2iYR7H2U0umEfsbPoUt9ayFUTsk8/Gp6Pc
         38Zg==
X-Forwarded-Encrypted: i=1; AJvYcCViNqSm/JIisS+R85Ov8JAJ6HyVDEYDtPAHnQwm3x7tsN14teL7HVQ7eukde/6j2i3tqjn8vVyXKnLH@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/id1QknBmvCJcmrSc47znpuTZzaAYEztZrstVWZDFhqi1T+Fx
	KSQefvLEwVh6kSDXyvHgTgtbqiqOp+iKNLcdnONGa3RM/QaIFS4V5XGk8Y++QLyS3C1Zh/EI0H9
	zCg==
X-Google-Smtp-Source: AGHT+IE+C6JcZdh5hffwpn3YaLy4DTdjGMQWY0Wxr9tX8RPUF4fmhR1pHZq+6TPiOW5dJqi6J/yP+vTUj+Q=
X-Received: from pjbqx5.prod.google.com ([2002:a17:90b:3e45:b0:2fa:a101:755])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc4e:b0:220:c4f0:4ed9
 with SMTP id d9443c01a7336-2236921eb6amr236795425ad.45.1741034988314; Mon, 03
 Mar 2025 12:49:48 -0800 (PST)
Date: Mon, 3 Mar 2025 12:49:47 -0800
In-Reply-To: <8dc83535-a594-4447-a112-22b25aea26f9@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1740512583.git.ashish.kalra@amd.com> <27a491ee16015824b416e72921b02a02c27433f7.1740512583.git.ashish.kalra@amd.com>
 <Z8IBHuSc3apsxePN@google.com> <cf34c479-c741-4173-8a94-b2e69e89810b@amd.com>
 <Z8I5cwDFFQZ-_wqI@google.com> <8dc83535-a594-4447-a112-22b25aea26f9@amd.com>
Message-ID: <Z8YV64JanLqzo-DS@google.com>
Subject: Re: [PATCH v5 6/7] KVM: SVM: Add support to initialize SEV/SNP
 functionality in KVM
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, herbert@gondor.apana.org.au, 
	michael.roth@amd.com, dionnaglaze@google.com, nikunj@amd.com, ardb@kernel.org, 
	kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, aik@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 03, 2025, Ashish Kalra wrote:
> On 2/28/2025 4:32 PM, Sean Christopherson wrote:
> > On Fri, Feb 28, 2025, Ashish Kalra wrote:
> >> And the other consideration is that runtime setup of especially SEV-ES VMs will not
> >> work if/when first SEV-ES VM is launched, if SEV INIT has not been issued at 
> >> KVM setup time.
> >>
> >> This is because qemu has a check for SEV INIT to have been done (via SEV platform
> >> status command) prior to launching SEV-ES VMs via KVM_SEV_INIT2 ioctl. 
> >>
> >> So effectively, __sev_guest_init() does not get invoked in case of launching 
> >> SEV_ES VMs, if sev_platform_init() has not been done to issue SEV INIT in 
> >> sev_hardware_setup().
> >>
> >> In other words the deferred initialization only works for SEV VMs and not SEV-ES VMs.
> > 
> > In that case, I vote to kill off deferred initialization entirely, and commit to
> > enabling all of SEV+ when KVM loads (which we should have done from day one).
> > Assuming we can do that in a way that's compatible with the /dev/sev ioctls.
> 
> Yes, that's what seems to be the right approach to enabling all SEV+ when KVM loads. 
> 
> For SEV firmware hotloading we will do implicit SEV Shutdown prior to DLFW_EX
> and SEV (re)INIT after that to ensure that SEV is in UNINIT state before
> DLFW_EX.
> 
> We still probably want to keep the deferred initialization for SEV in 
> __sev_guest_init() by calling sev_platform_init() to support the SEV INIT_EX
> case.

Refresh me, how does INIT_EX fit into all of this?  I.e. why does it need special
casing?
