Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B91E883E
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741035194; cv=none; b=YxzzDnPKLNJQCNPrMzPUt38bok7V4dXt3d8z7+hS3qB2vg8EcsUdOH1K/+3MB8josJ8cJIWPCx0TR/wFqhxGEfEV10gg10d2gFBxNvYhr1792gpwKMe5RH5VkWkLOn5Bkn+AX2o61wdYWhAobK6/4nP75kH4fX8nlWXWafP8PqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741035194; c=relaxed/simple;
	bh=lYiwGGpy+jObEGmZeK6fiOPc7idRqjoFD+d0OH5vfY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kp5bRbKxH/bHjjzCRZrjHO2vh98SHAtmubzYoZOgEugt7Wdjhri3ucNGEx9nr3+aClFTR79wPEiGsOSmIaRiF2JVu48ciTIqeGBwi8lCahhN7AATj9jjhiJLXTr+8GeXjztUp5GwGZ1pmp0M6nmoZdMuPh5mHIPlGGSoVJ8eQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cLURY1tq; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cLURY1tq"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fe8c5dbdb0so9529758a91.3
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 12:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741035192; x=1741639992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sN1tRRXOdkRuhSE1RMnqdPqM5oFgXi6jywzgZSSDWUM=;
        b=cLURY1tqol0/xSmR70zqjS8Jprzn+jkcf7bhGWq2RajxQNDRAEBS5Zv/C7I5QVXGEs
         NcyhtxD36qHvGz7PNGEhne52XLj8+QaSZtN5lB/TlF+LKtCXJvhlKqfgKACVHrVTYR/z
         O0ULpxpZNGwsY6J3le7Q6ARgUC98N1jB3XzLMOtOcoKVNEdc1qfOjEhJ/mb6JDhvUSJJ
         jEQK8gPw4AkFPyzhzBUCK2K7m8z1nxNRXRtmfZFNb18JC9+0xkFOImb4DRH95DpXY/K0
         AtnFT3Sf9yUoLRYUJ9QipvK59x91FT1BqayZT19xU9B0tt67ebxI+sL+acgCD4wZzKAL
         gpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035192; x=1741639992;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sN1tRRXOdkRuhSE1RMnqdPqM5oFgXi6jywzgZSSDWUM=;
        b=vkYfpQimVyce/IJM3I5oPSp8lQSxsK4+FrGschfl3ya//IkLJUm7bAUxiFAuEfH6hF
         GQuWA0xnmSLgine8/6tF2ayLolXfzqobkCri77KCv5WVizMGAECJr5NArmlkGofUHftX
         IJh0fQYU7LWSwCOCFc8mAl239VizyiYjrYWFDRK6DUXDL57XUrmBlwqkdVbLkMSEleps
         /OserJCY10HkSJn+SK3yNA4TOOopBfDtkL04oTkJOTsKXK5hP1ne8AmQKRa+lm9ixlAx
         QLAlH8TEYp42oX9TGChhBcPRxEijxwGdBtGTF3CZ4Qk8y/bjm98Vmd3bEbnnWRPJNd0r
         EQCg==
X-Forwarded-Encrypted: i=1; AJvYcCV4VxveT2sfj6KHI2aujChi7YDMx8m9kUEEKqI7v7t+1OBhavtC64lb3V2c3o3jtRfbqXt0ZrrRUJq7@lists.linux.dev
X-Gm-Message-State: AOJu0YylKTcQ+TwJXDslRcLOML6Nsx7F61DUyG/jqkHlM6M5A1HXXmW/
	zYQQerO3mGtQYUJoB3cNKs/QMnNogHHGLC61tjfIB/3RFokHM0aG6kBqa7cgjFkt9Ekkl3LGVbJ
	dTQ==
X-Google-Smtp-Source: AGHT+IGvAbM1SbEAkwQZlxQS7zV3KYE59+INXt1p2VCN8UPIm/E/EWQNfbPJi6CZOYL8GIUxW/fPR5QROP8=
X-Received: from pjn11.prod.google.com ([2002:a17:90b:570b:b0:2f5:4762:e778])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a86:b0:2ee:ab29:1a63
 with SMTP id 98e67ed59e1d1-2febab30c7amr20186639a91.3.1741035192190; Mon, 03
 Mar 2025 12:53:12 -0800 (PST)
Date: Mon, 3 Mar 2025 12:53:10 -0800
In-Reply-To: <5bdb92ab83269b49ad8fbbe8f54df01f6b98ea8f.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com> <5bdb92ab83269b49ad8fbbe8f54df01f6b98ea8f.camel@infradead.org>
Message-ID: <Z8YWttWDtvkyCtdJ@google.com>
Subject: Re: [PATCH v2 00/38] x86: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Juergen Gross <jgross@suse.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025, David Woodhouse wrote:
> On Wed, 2025-02-26 at 18:18 -0800, Sean Christopherson wrote:
> > This... snowballed a bit.
> >=20
> > The bulk of the changes are in kvmclock and TSC, but pretty much every
> > hypervisor's guest-side code gets touched at some point.=C2=A0 I am rea=
onsably
> > confident in the correctness of the KVM changes.=C2=A0 For all other hy=
pervisors,
> > assume it's completely broken until proven otherwise.
> >
> > Note, I deliberately omitted:
> >=20
> > =C2=A0 Alexey Makhalov <alexey.amakhalov@broadcom.com>
> > =C2=A0 jailhouse-dev@googlegroups.com
> >=20
> > from the To/Cc, as those emails bounced on the last version, and I have=
 zero
> > desire to get 38*2 emails telling me an email couldn't be delivered.
> >=20
> > The primary goal of this series is (or at least was, when I started) to
> > fix flaws with SNP and TDX guests where a PV clock provided by the untr=
usted
> > hypervisor is used instead of the secure/trusted TSC that is controlled=
 by
> > trusted firmware.
> >=20
> > The secondary goal is to draft off of the SNP and TDX changes to slight=
ly
> > modernize running under KVM.=C2=A0 Currently, KVM guests will use TSC f=
or
> > clocksource, but not sched_clock.=C2=A0 And they ignore Intel's CPUID-b=
ased TSC
> > and CPU frequency enumeration, even when using the TSC instead of kvmcl=
ock.
> > And if the host provides the core crystal frequency in CPUID.0x15, then=
 KVM
> > guests can use that for the APIC timer period instead of manually calib=
rating
> > the frequency.
> >=20
> > Lots more background on the SNP/TDX motiviation:
> > https://lore.kernel.org/all/20250106124633.1418972-13-nikunj@amd.com
>=20
> Looks good; thanks for tackling this.
>=20
> I think there are still some things from my older series at
> https://lore.kernel.org/all/20240522001817.619072-1-dwmw2@infradead.org/
> which this doesn't address.

Most definitely.  I was/am assuming you're going to send a v4 at some point=
?
