Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67990188A0F
	for <linux-coco@lists.linux.dev>; Wed,  4 Sep 2024 22:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725488584; cv=none; b=h7Sd3/iB/Cm2h+PORy4SHP/3M+FzD3RLGxiAjE37wV2Geqz1yuwalHPJvdN4GJBl5HnCf+u/HvGzvJWM7bRJf4Pytie601WcWXusDClqJOrjwZPTTfcJEwyuaYqHj88bO9IREFfwENbDD4S2ua+Mp1UK7jh39Fz87s3CGWYeky8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725488584; c=relaxed/simple;
	bh=s5xmMC/cnwws6ZlQFHDlWeIFR1CUFKwSJ6PBP2ziMGM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LL43pvQU5d5yEJt7ro9/03jLvh3vaB7aj0zXjKUUy0/GHv/o1vgobYDUoCKLVI6RLpwoMDyuElVn7xSdim2fEtZ+leCxzcox1CLe92ZGD4NNKiCLDd/RvKQxrloxbcmD58yuDj8JoLlNIkWYqyXWoP5Jrp624Supzig/KmDqrro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u+mdFmew; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u+mdFmew"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d5fccc3548so2486217b3.1
        for <linux-coco@lists.linux.dev>; Wed, 04 Sep 2024 15:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725488581; x=1726093381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IcbwmmlOLf0klhujBPied779n3Fl3qlNEilivTVgvc=;
        b=u+mdFmewJBzEzEER34FTxBMsdT/abMYWCGshmO+L+dOalH89/HjbJtpqQR/Sz6fTbI
         HEH8rX9gMTEQOQExIY6TwlvUHsW3dpPdvsMtxX5xf1dQHfjXwaKJrYCjrCnjrPbTw9vK
         /Q+Hm9VNspd2PDV0r7EuMJNHm/d3txz9NF8EG6J1SbhfwiQxuGUZJswWf8KAkE0pulxK
         v6NfaPO5JksPstBfCBK9tvAOy1vamMsGpwyZoScThspU/yTnUHd7AjmHZFDc2meVe08g
         eBnFp0R15RRmuLoZyuuIlw6Ff48SPT2yYyqeGVqyxgDPHgMpt8lyTx4q6y7MS0Io2aJy
         T3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725488581; x=1726093381;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4IcbwmmlOLf0klhujBPied779n3Fl3qlNEilivTVgvc=;
        b=mIxpzAag93MZCsgouV1nNNzUg6rq6XivRA/sVjxyePylmVIrtS1rS7JBG1hafmWDHD
         LpHRTg6uiUn1JZB82UHRbdd8G223AsoEJnGJLF61U+lrykg1ekvLeTxz0YZtuhk6xScc
         FTfMZBoZiXYA6UwUNb6GQqfh9IQbjr8mR4vpSQqP12/9PCnvAZiqHIOTlto6tUGRBlet
         N9ECVQAnJtMrPDFomYYNdj1mKXwBvSUGtTb/W2Ll6YXgOHMpys/dbt+kVQjt4oPKHGpY
         5C8mHiCaE3eghVjOHKe2DioYghsC4iNXrXSl2V7a2VFSDx93Yg8BkYFga1S9amDQY2Hl
         IkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFJKBGVEIGLSpcadzwunV5Upyo8VJkxaT7Ph6NsluF0gUGHR0Q6hyQVo0OaxR5isTeaylt7awDLIiz@lists.linux.dev
X-Gm-Message-State: AOJu0YyOTdsOOFXNUQxxPZ7YKdZr53NoGb9bpFFvaZl4Fv1lK3mhFSzs
	QHzc4NVCZwkp6D5bYa/lKgsOoOy9FQLTY/RnaKK94vaBygFslvVq0+si48m/pRKxy/nw3AZAHhL
	Z2w==
X-Google-Smtp-Source: AGHT+IGYeTai88fqs4PTMdPKSg8MaUYgkkisjxloKq27r7jXpBOr3zwINpKcQRS2VjU6U9JC53KdXYeYceY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2009:b0:6be:523:af53 with SMTP id
 00721157ae682-6db26026aaamr1583987b3.3.1725488581437; Wed, 04 Sep 2024
 15:23:01 -0700 (PDT)
Date: Wed, 4 Sep 2024 15:23:00 -0700
In-Reply-To: <c24deb49-4369-4dcf-bb71-3160f2466ac3@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240903191033.28365-1-Ashish.Kalra@amd.com> <ZtdpDwT8S_llR9Zn@google.com>
 <fbde9567-d235-459b-a80b-b2dbaf9d1acb@amd.com> <25ca73c9-e4ba-4a95-82c8-0d6cf8d0ff78@redhat.com>
 <14b0bc83-f645-408f-b8af-13f49fe6155d@amd.com> <20240904195408.wfaukcphpw5iwjcg@amd.com>
 <c24deb49-4369-4dcf-bb71-3160f2466ac3@amd.com>
Message-ID: <ZtjdxNTBJymcx2Lq@google.com>
Subject: Re: [PATCH v2] x86/sev: Fix host kdump support for SNP
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	dave.hansen@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, x86@kernel.org, hpa@zytor.com, peterz@infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, thomas.lendacky@amd.com, 
	kexec@lists.infradead.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2024, Ashish Kalra wrote:
> On 9/4/2024 2:54 PM, Michael Roth wrote:
> >   - Sean inquired about making the target kdump kernel more agnostic to
> >     whether or not SNP_SHUTDOWN was done properly, since that might
> >     allow for capturing state even for edge cases where we can't go
> >     through the normal cleanup path. I mentioned we'd tried this to som=
e
> >     degree but hit issues with the IOMMU, and when working around that
> >     there was another issue but I don't quite recall the specifics.
> >     Can you post a quick recap of what the issues are with that approac=
h
> >     so we can determine whether or not this is still an option?
>=20
> Yes, i believe without SNP_SHUTDOWN, early_enable_iommus() configure the
> IOMMUs into an IRQ remapping configuration causing the crash in
> io_apic.c::check_timer().
>=20
> It looks like in this case, we enable IRQ remapping configuration *earlie=
r*
> than when it needs to be enabled and which causes the panic as indicated:
>=20
> EMERGENCY [=C2=A0=C2=A0=C2=A0 1.376701] Kernel panic - not syncing: timer=
 doesn't work
> through Interrupt-remapped IO-APIC

I assume the problem is that IOMMU setup fails in the kdump kernel, not tha=
t it
does the setup earlier.  That's that part I want to understand.

Based on the SNP ABI:

  The firmware initializes the IOMMU to perform RMP enforcement. The firmwa=
re also
  transitions the event log, PPR log, and completion wait buffers of the IO=
MMU to
  an RMP page state that is read only to the hypervisor and cannot be assig=
ned to
  guests.

and commit f366a8dac1b8 ("iommu/amd: Clean up RMP entries for IOMMU pages d=
uring
SNP shutdown"), my understanding is that the pages used for the IOMMU logs =
are
forced to read-only for the IOMMU, and so attempting to access those pages =
in the
kdump kernel will result in an RMP #PF.

That's quite unfortunate, as it means my idea of eating RMP #PFs doesn't re=
ally
work, because that idea is based on the assumption that only guest private =
memory
would generate unexpected RMP #PFs  :-(

> Next, we tried with amd_iommu=3Doff, with that we don't get the irq remap=
ping
> panic during crashkernel boot, but boot still hangs before starting kdump
> tools.
>=20
> So eventually we discovered that irqremapping is required for x2apic and =
with
> amd_iommu=3Doff we don't enable irqremapping at all.

Yeah, that makes sense, as does failing to boot if the system isn't configu=
red
properly, i.e. can't send interrupts to all CPUs.
