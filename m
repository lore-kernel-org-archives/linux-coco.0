Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEEF37FF42
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779396820; cv=none; b=HwEWbsRYh6AenpExUt+3Zsc4lNPQxowt+6GHB0Fm9vTzVss+zbsd38gZAqFXnbJ/TsFTvBgNAxPd+7RzbG7FkXqDNhaSuoNPVbwrnxQlkhZhCbFhZTBVfHnyjxoBpuATZtvn7Nax60GG4nARhbswk3YEDW6EsCdpyRe75BkuM7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779396820; c=relaxed/simple;
	bh=fLtEKBB9bXOUmjY2enVlgjls3t7C38yhOeuHPIwcPQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZXTeuMLFgcmgSLvL2CHDgY6nZnomd2CoqEcejNzwL2ItHoPgAYXIJ46a0djHetURZH4O2E3kV21aoA4XEK4hLfblMV569GlZEA/7kbMyfdXoGzpigqmBqgHuDlC+EQrDekF8Y/kEnU3w/a8gJvCMFaPYu/pEwhOE4fBsBwOWVHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i5iN/MEJ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i5iN/MEJ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so3705117a12.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779396817; x=1780001617; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtuSO9Df1yE7JlouGMlcWCEpEnvAH6qlC/HYl6ROkD4=;
        b=i5iN/MEJcfyIQcYUxt4SU1qFPwNxZr3me8gaXIiRucYgTCy45XsLy1mW7KyvgTeKNz
         8iQ6BgcFYGaLvrOQO62WjoJLkDjNMKihPAC2UR6/zcXdddVs0qNvSHkwRQoeYg59TaGj
         o9vKWxx9nh0OY7z6g2sPLn4GmeIfsu8f82GBXzmCIv+uCG+rPptCMQgbV7JsDlo0HPjy
         ysc/+o7CBzS8xM3GhvTZ8XQ4rf0hBAZ1JYOGbLljuKQA4URdrzd+GW3uJUW37vus6BYe
         XsQSfFW5TvBFzhFt3quJ6q28Wn9MHLShdrr/846VUWoYpbNnphbdb6JUKr+PkYEf1KQZ
         TDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779396817; x=1780001617;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mtuSO9Df1yE7JlouGMlcWCEpEnvAH6qlC/HYl6ROkD4=;
        b=NT9gubFvBiEqkj2Z1mt2HFFT1PawnSbQoygusjZ9vsPpjq5AJErOEYXDTXNFPlDCT+
         1FavkMt3rhd+QVYa5RnsaC4H6y74f5RdJydNQxuqs7a5Rl04V374H2mpX8Pm9F6mYAqZ
         l3ZkqAOsojpyaAdXorddxR6E5X1ZuZ++gt725cRz/5umnGQorUJHn+vcv2djDXS4jiOf
         BNQOuvlFzHEzzgh1LWwoUrZal9y3/OP5l6JUP6mHUb0Fdpr3ZHbAUkBp1sMtJi47VHhB
         YJf0ml2zbltrTOTFPPkq1lNI6SKtd/MuE1dMKxLhKvHAqYfzl/awSmZiLPVXV0JPQnsr
         FcNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PWzR0eGq0VvvkCtg6wvdiKpGpQ4TFvvUCVQ1ZEJ9dzF4gtn46IXVACEAR0Cr/B74e+pvQT5Oaed+u@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4nzIbxI+Qja+67lidZ0xKI2d/5jaUB6AWscWfLr97OCaKsHtG
	/PRWu6o+um7K9kg1o7yDy7NsXMViNDaM5kSz4LGO2Y1LZrUZ5c/FKzJ8J4sF6RMsiNaayDtarGR
	QHfxPVw==
X-Received: from pfbg21.prod.google.com ([2002:a05:6a00:ae15:b0:82f:915e:291f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e06:b0:837:b97d:2fe
 with SMTP id d2e1a72fcca58-8415f18b012mr734843b3a.18.1779396816710; Thu, 21
 May 2026 13:53:36 -0700 (PDT)
Date: Thu, 21 May 2026 13:53:35 -0700
In-Reply-To: <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-3-seanjc@google.com>
 <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
Message-ID: <ag9wz3RiJOtVZrK0@google.com>
Subject: Re: [PATCH v3 02/41] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > Add a helper to register non-native, i.e. PV and CoCo, CPU and TSC
> > frequency calibration routines.=C2=A0 This will allow consolidating han=
dling
> > of common TSC properties that are forced by hypervisor (PV routines),
> > and will also allow adding sanity checks to guard against overriding a
> > TSC calibration routine with a routine that is less robust/trusted.
> >=20
> > Make the CPU calibration routine optional, as Xen (very sanely) doesn't
> > assume the CPU runs as the same frequency as the TSC.
> >=20
> > Wrap the helper in an #ifdef to document that the kernel overrides
> > the native routines when running as a VM, and to guard against unwanted
> > usage.=C2=A0 Add a TODO to call out that AMD_MEM_ENCRYPT is a mess and =
doesn't
> > depend on HYPERVISOR_GUEST because it gates both guest and host code.
> >=20
> > No functional change intended.
> >=20
> > Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> > Tested-by: Michael Kelley <mhklinux@outlook.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Mildly concerned that we might want to support multiple options =E2=80=94=
 does
> it have CPUID 0x15? Does it have 0x40000x10? Does it have a pvclock?
> There are various permutations of those which are perhaps best handled
> by *trying* each one, in some order, and populating a struct with the
> answers?
>=20
> But on the basis that perfect is the enemy of good,

This has been bothering me too.

Aha!  AHA!  Idea.

... 4 hours later ...

Mhahahaahah, victory is mine!!!!

TL;DR: Overriding x86_platform_ops hooks is dumb.

To your point about making an informed decision, that's essentialy what thi=
s series
is already doing, just in a very roundabout way:

  1. x86_platform.calibrate_{cpu,tsc}() are initialized to "native" version=
s
  2. Hypervisor init code runs and conditionally overrides calibrate_{cpu,t=
sc}()
  3. CoCo init code runs and conditionally overrides calibrate_{cpu,tsc}()

So the ordering you want is already there, as is "trying" each source to so=
me
extent, in the form of steps #2 and #3 overriding the hooks if and only if =
their
source of information is valid.  For all intents and purposes, the hardenin=
g I
was adding by formalizing the calibration overrides was to enforce the abov=
e ordering.

But that's obviously all but impossible to follow, _and_ it's pointless.

For every PV case, including TDX and SNP, "calibration" is simply informati=
on
retrieval, i.e. it never changes (barring broken hypervisors/firmware), and=
 the
information is always available during early boot.

Contrast that with the pre-CPUID CPU frequency calibration, where the frequ=
ency
might change, the kernel is making a best guest based on other timekeeping =
sources,
and not all timekeeping sources are available during early boot.

And so overriding x86_platform.calibrate_{cpu,tsc}() for PV code is complet=
ely
unecessary, because steps #2 and #3 already know the frequency when they ov=
erride
the hooks, and "success" is guaranteed, i.e. the kernel won't have to switc=
h to a
"late" calibration flow.

If we provide x86_hyper_init hooks:

	unsigned int (*get_tsc_khz)(void);
	unsigned int (*get_cpu_khz)(void);

then we can kill off x86_platform.calibrate_{cpu,tsc}() entirely, explicitl=
y
define the preferred ordering (user-forced =3D> CoCo =3D> Hypervisor =3D> n=
ative), and
depup some of the hypervisor code.

E.g. this is what I've got for the early flow.  Testing now.=20

  void __init tsc_early_init(void)
  {
	unsigned int known_cpu_khz =3D 0, known_tsc_khz =3D 0;

	if (!boot_cpu_has(X86_FEATURE_TSC))
		return;
	/* Don't change UV TSC multi-chassis synchronization */
	if (is_early_uv_system())
		return;

	if (x86_init.hyper.get_cpu_khz)
		known_cpu_khz =3D x86_init.hyper.get_cpu_khz();

	if (tsc_early_khz)
		known_tsc_khz =3D tsc_early_khz;
	else if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
		known_tsc_khz =3D snp_secure_tsc_init();
	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
		known_tsc_khz =3D tdx_tsc_init();

	/*
	 * If the TSC frequency is still unknown, i.e. not provided by the user
	 * or by trusted firmware, try to get it from the hypervisor (which is
	 * untrusted when running as a CoCo guest).
	 */
	if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
		known_tsc_khz =3D x86_init.hyper.get_tsc_khz();

	if (known_tsc_khz)
		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);

	if (!determine_cpu_tsc_frequencies(true, known_cpu_khz, known_tsc_khz))
		return;
	tsc_enable_sched_clock();
  }
