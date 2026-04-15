Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD933845CE
	for <linux-coco@lists.linux.dev>; Wed, 15 Apr 2026 23:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295644; cv=pass; b=MJgZ5yQ+bGOMoidwZDIlRvAbfCyIcj6BxBWAiDBH3dHNtx1GBX0XztuATozt17I+Vz+T1mNcqaiVC70ebvbFxwQfNMgBhk1/Hf3S2vwxv4htbkN+EPQyFvkZG1efGXU2yCipsBLGvQqorI+A7olzNix4TEI4LhsiiDMul/1XHio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295644; c=relaxed/simple;
	bh=x+QG3xhCQwRR1qC6hXy7NcWy7080+KY3YK+kXqaECJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMOHoS0dx6M54MY+3VpdjW8ST0yJdEmmTRDCKYHctwy2bExlVzIXnY4ha+JrQNdlxBBklrBrHwDgY8TMoNNmZEM38+OD5UsLKIdH+Gk/FEffL7YDRz6w1H3nZmFT7AHVqwLcDIknajb8QN6yb+HxW62cDrU/pdat1YLQnL/LC7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WaSOiQTl; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WaSOiQTl"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a58057d7baso79521026d6.1
        for <linux-coco@lists.linux.dev>; Wed, 15 Apr 2026 16:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776295641; cv=none;
        d=google.com; s=arc-20240605;
        b=kVu3459JvU1fjTtlp4MTbZHtkfd7OCyvHf1Z6J4ZAL8qAB+2ISV+zrd9nK34ri9Uhz
         ofSLpk29FL40m1Znggfsqixd3gJiK9udKHKAiM/614eGsQFz8elDtEqrOW1o9gGjfONK
         py/G+yqUl949df67X+85Z9/AwM5JZ0e/RcwALLlKV/nnvfEQ0/aC/pNhlr89f0cFePZL
         4EfZubW7iNCiGba7/d0CmkxGWbCwk0WC+Y4KTzWW6o8v19QlYuQ/ZKBMq2hs/d4WCd12
         Gx9nmTWiMaW05jmpn0+IYJTm1Xr1FdcCEy3v8s9rJVMxr7UmT+fgm4atZ6aqWn3jIwGv
         SSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x+QG3xhCQwRR1qC6hXy7NcWy7080+KY3YK+kXqaECJ0=;
        fh=KJm9M+gR83pCtNVuV9veRGvukINjlfQ8nc57Rpwj4M8=;
        b=XGB8F+v4irPgLRK08yA5Ip4yMzWfZThzT9Ph5XnDZClkhVtr1CzCSq0G3j6Nt16dae
         +AxexpoFARWtbRosuWHQ8OSj9JNQ6sdwpoYYIhW3q08RIv/PgtoLXS718yWSIA51jbVJ
         wiHf9a1EBk2ro7hS3unhn6A7t3Fjm0kJwX3dMBSQFDOTadEiNrl6U///q+cJiI5FwODq
         6KlmMsJ9U512iDQHR9x0PNepfEGAI84gnbM0DZPVofSHDaBIOhZW/rJ0Kjwn1elIrqF8
         tDo3DfQEItR0+qONQDaOtLAun7KJtbTQm91/yacNqEoHTsztK7OAxOjb/N4olEE2oWWP
         hJ5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776295641; x=1776900441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+QG3xhCQwRR1qC6hXy7NcWy7080+KY3YK+kXqaECJ0=;
        b=WaSOiQTl2gWozybJPf8Ak+z1qb4lOfpqnVhFi5p2Z72zeeHwV+ymJPRerr+QeqnAKq
         rNHT1x3QSaTAbsVKjnnhYNwUayJc/bGJ3IgY7zDy+6bRaVu6oWcSuLIcEx8MObT60GWh
         PoTAu8ukSMP0oQQoorRBtxckV6vK3ejqpSgleFzXdCnxATFGNjBx5+1ekcjWXdBBBDSS
         2VS/XdJB7syBGqeIfegbsEB6TIrI9hPxHaENmLPGNQbY/dbSfGVqbOLtJDo29zLgkPNq
         +3ve/YPTgrVL9QNF9CIl20O0ZZtZcJfSsG14aFjRSkzd2m4+5uTS/Yn+fZIk5o44haCd
         Uubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295641; x=1776900441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+QG3xhCQwRR1qC6hXy7NcWy7080+KY3YK+kXqaECJ0=;
        b=SSossi3pqyyAtrm+UoXsdN3quj0h/8EK9KlJpO6CYlUU5ojiNF+Oo/mJeWLU3RHUb/
         WiPA1fwdsYg1FX3I+aeQjNKlrG12PIaZsl+gAn7Ng/8fo7jTY9TETk572st53X1Fek8P
         dirchw0iw8D93onutrWen/y4zWTAzGYmcK6k96MV8exXOxfJByRakgg7bdZvUUM0tSoU
         p8j6HLsJxSuVsdJ3rFTefpQE0Wa0rKDB5fNtC38jDIraXJCR3/57eZ8R50hj6sV00QD+
         2kF5IvZtpi7M2e2Jp0W/XDdKjGyGfLw+IqR5E8DN1dUTxpP0i1m19wOAIhcLLcQ3iSBe
         dw/w==
X-Forwarded-Encrypted: i=1; AFNElJ83IBb8tQqSZOl//HhcNP/DyqWa7AfNOM8jk+ExTs/Y1lZLtAFjdWf1Ai1oaBb74KTDZ0XckhMYwMn3@lists.linux.dev
X-Gm-Message-State: AOJu0YzKWs9tX92AoqB+byTR4Pq2wE4mOOfJzPQVv4rD2SMx1k2UEkfv
	pCf8AG2v6c7SHLJheLLLl3Py4q0GKmvntmzEBwjrD4SJ9mmyb+MrpH3D6EPcSeAnj1qkbd82R+i
	zWidWTto6GlkK1qbPkGxSloPfd1zksqIDE+T5xb8D
X-Gm-Gg: AeBDiesQF5ie5Tsz+gSPCd+pCHGtSlENWgpyk/GhzD5I+cU7s15rk9tzDigUKlwWORI
	ItsqrbNAU0IGBeHwqeOlz1B6SRkSKdz8hI8rA8HTpYlOa6FU6X9L/+xQSlr3dkks48xvf5LG59b
	nINrFevwomqLqK9Lr3WMFB2GvQiW9IYl+8obO3fVKFmKv75tlLT3QpuMqFcjl8bP/7fNhfcJFBH
	adBuojG2M78sh6SENkbktXZaWQjElb8iRCziKpd2XpZ6was7W67el2cYTKF98LsGGXpqvSMgoAk
	T/iVbCKo5FQLaMt2mOHijCTbMA7X19HOjmo4aEuGlQAJA8BOb/fOvnWf+0w=
X-Received: by 2002:ad4:5baf:0:b0:8ac:ab13:8f15 with SMTP id
 6a1803df08f44-8acab1391c9mr232004096d6.7.1776295640870; Wed, 15 Apr 2026
 16:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318155413.793430-1-steven.price@arm.com> <CABpDEukEO4Y_fg8fv5Nr1_Pw_qOK=2UmioXk=WyPEzoEprPcGA@mail.gmail.com>
 <d661a24c-6619-4734-96bd-075d3416e809@arm.com>
In-Reply-To: <d661a24c-6619-4734-96bd-075d3416e809@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Wed, 15 Apr 2026 16:27:08 -0700
X-Gm-Features: AQROBzCS-xITaK7ztBjux37Usj-fD7VQebkqcRVamG9jxnrdFdKeF2d2D3KViso
Message-ID: <CABpDEumAVf02uOS5Bj07EDyuU=z9FV-iocQU1j7gFM5z0BeV_w@mail.gmail.com>
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 4:01=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> On 14/04/2026 22:40, Alper Gun wrote:
> > On Wed, Mar 18, 2026 at 8:54=E2=80=AFAM Steven Price <steven.price@arm.=
com> wrote:
> >>
> >> This series adds support for running protected VMs using KVM under the
> >> Arm Confidential Compute Architecture (CCA).
> >>
> >> New major version number! This now targets RMM v2.0-bet0[1]. And unlik=
e
> >> for Linux this represents a significant change.
> >>
> >> RMM v2.0 brings with it the ability to configure the RMM to have the
> >> same page size as the host (so no more RMM_PAGE_SIZE and dealing with
> >> granules being different from host pages). It also introduces range
> >> based APIs for many operations which should be more efficient and
> >> simplifies the code in places.
> >>
> >> The handling of the GIC has changed, so the system registers are used =
to
> >> pass the GIC state rather than memory. This means fewer changes to the
> >> KVM code as it looks much like a normal VM in this respect.
> >>
> >> And of course the new uAPI introduced in the previous v12 posting is
> >> retained so that also remains simplified compared to earlier postings.
> >>
> >> The RMM support for v2.0 is still early and so this series includes a
> >> few hacks to ease the integration. Of note are that there are some RMM
> >> v1.0 SMCs added to paper over areas where the RMM implementation isn't
> >> quite ready for v2.0, and "SROs" (see below) are deferred to the final
> >> patch in the series.
> >>
> >> The PMU in RMM v2.0 requires more handling on the RMM-side (and
> >> therefore simplifies the implementation on Linux), but this isn't quit=
e
> >> ready yet. The Linux side is implemented (but untested).
> >>
> >> PSCI still requires the VMM to provide the "target" REC for operations
> >> that affect another vCPU. This is likely to change in a future version
> >> of the specification. There's also a desire to force PSCI to be handle=
d
> >> in the VMM for realm guests - this isn't implemented yet as I'm waitin=
g
> >> for the dust to settle on the RMM interface first.
> >>
> >> Stateful RMI Operations
> >> -----------------------
> >>
> >> The RMM v2.0 spec brings a new concept of Stateful RMI Operations (SRO=
s)
> >> which allow the RMM to complete an operation over several SMC calls an=
d
> >> requesting/returning memory to the host. This has the benefit of
> >> allowing interrupts to be handled in the middle of an operation (by
> >> returning to the host to handle the interrupt without completing the
> >> operation) and enables the RMM to dynamically allocate memory for
> >> internal tracking purposes. One example of this is RMI_REC_CREATE no
> >> longer needs "auxiliary granules" provided upfront but can request the
> >> memory needed during the RMI_REC_CREATE operation.
> >>
> >> There are a fairly large number of operations that are defined as SROs
> >> in the specification, but current both Linux and RMM only have support
> >> for RMI_REC_CREATE and RMI_REC_DESTROY. There a number of TODOs/FIXMEs
> >> in the code where support is missing.
> >>
> >> Given the early stage support for this, the SRO handling is all confin=
ed
> >> to the final patch. This patch can be dropped to return to a pre-SRO
> >> state (albeit a mixture of RMM v1.0 and v2.0 APIs) for testing purpose=
s.
> >>
> >> A future posting will reorder the series to move the generic SRO suppo=
rt
> >> to an early patch and will implement the proper support for this in al=
l
> >> RMI SMCs.
> >>
> >> One aspect of SROs which is not yet well captured is that in some
> >> circumstances the Linux kernel will need to call an SRO call in a
> >> context where memory allocation is restricted (e.g. because a spinlock
> >> is held). In this case the intention is that the SRO will be cancelled=
,
> >> the spinlock dropped so the memory allocation can be completed, and th=
en
> >> the SRO restarted (obviously after rechecking the state that the
> >> spinlock was protecting). For this reason the code stores the memory
> >> allocations within a struct rmi_sro_state object - see the final patch
> >> for more details.
> >>
> >> This series is based on v7.0-rc1. It is also available as a git
> >> repository:
> >>
> >> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
> >>
> >>
> >
> > Hi Steven,
> >
> > I have a question regarding host kexec and kdump scenarios, and
> > whether there is any plan to make them work in this initial series.
> >
> > Intel TDX and AMD SEV-SNP both have a firmware shutdown command that
> > is invoked during the kexec or panic code paths to safely bypass
> > hardware memory protections and boot into the new kernel. As far as
> > I know, there is no similar global teardown command available for
> > the RMM.
>
> Correct, the RMM specification as it stands doesn't provide a mechanism
> for the host to do this. The host would have to identify all the realm
> guests in the system: specifically the address of the RDs (Realm
> Descriptors) and RECs (Realm Execution Contexts). It needs this to tear
> down the guests and be able to undelegate the memory.
>
> It's an interesting point and I'll raise the idea of a "firmware
> shutdown command" to make this more possible.
>
> > What is the roadmap for supporting both general kexec and
> > more specifically kdump (panic) scenarios with CCA?
>
> I don't have a roadmap I'm afraid for these. kexec in theory would be
> possible with KVM gracefully terminating all realms. For kdump/panic
> that sort of graceful shutdown isn't really appropriate (or likely to
> succeed).
>

Thanks Steven for the clarification.

For us, kdump is highly critical as it is our primary diagnostic tool
for host crashes. Without it, monitoring and debugging at fleet scale
would become unmanageable.

To confirm my understanding of the current architecture: if a host
panics while no Realms are actively running (and therefore no pages
are currently in the delegated state), the standard kdump extraction
should work perfectly fine without any modifications, correct?

Regarding the KVM tracking structures (RDs, RECs, RTTs, etc.) when VMs
are running, perhaps we could use `vmcoreinfo` to export the physical
addresses of these delegated pages. This would allow tools like
`makedumpfile` to explicitly filter them out. I assume these pages must
remain hardware-locked while the VMs are active.

Long-term, having an architectural shutdown command - similar to the
TDH.SYS.DISABLE command in Intel TDX - would be incredibly useful. It
would allow the kdump kernel to safely bypass these hardware security
checks, especially when extracting host-side KVM state.

As for the protected realm memory, I assume that is an easier problem.
We naturally want to exclude guest pages from a host dump regardless
of whether they are Realm pages or not. However, accidental touches
are still fatal.

> There is also some RMM configuration which cannot be repeated (see
> RMI_RMM_CONFIG_SET) - which implies that the kexec kernel must be
> similar to the first kernel (i.e. same page size).
>
> Thanks,
> Steve
