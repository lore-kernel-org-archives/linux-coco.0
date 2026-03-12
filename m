Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EAA33263F
	for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329177; cv=pass; b=FwpvGcSs1GFpxb8lMkNA7W8LqGaYWhO/QY4DwyUs77bF/ISHIh3Mt6Pqabku0UGnLSHhxBaBWR43Xo1wf2wCd528dgjDpmGBknGAaODeGyaz2Wsyb4yV12GiFU8BpknlK72eWC5NebWL+tHiuZRnHy8lY9MRWtOxF0fcBQ/w4uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329177; c=relaxed/simple;
	bh=NLjwGsHlk+dRfPl5Lz1YqZqOgqwc9hRYCnD+KjfOKTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpQxq/138EOXrQhGm3gI1l9YbFgKGIt0uIslIL4TFxDfx1BaG0D+9IZXMpd11WgEftT6Y3YRp6V1Gm6OW0/Ryj9ZsyrAMtFGMMRxxdHt6/hg49Eca3lQ6aRV5YB0LZeJxcCuqPETj955RraP086ISW8l057MgfQ/WkSXMd5pK4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=at18X6q1; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="at18X6q1"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1270fc2bdf2so12371c88.0
        for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 08:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773329174; cv=none;
        d=google.com; s=arc-20240605;
        b=QGMkq6Orumd+cM00MnjbJxS+ftg+BbCjl+Ai4HcC98mh5MnJWA75nuR/jVP2YrztDz
         oinbeaxeV0eLsW6sGCc2aJn439MBCcVBiyR5+0xqndCjhwvP/vFvafEm669w8h/6gl3b
         6lsSRoZyn8TPPRRjbh1t2tuRxmWGQq06b+myxFPatzNKUmcH71rSZEtw5Yo87utw663s
         0E0/Wxxjr8woT8sYzvJ1i9fIAOx4XqHneN0/BdoDXJZ9EKfegcEYDvOEacfqOK9jya+Z
         WZrK3Lk9nJZupcl5i5N8b1Fi6qrbwO7IDUEPKBGscJK+D50NePvr3BwFIABMGBCz4FEC
         KH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+tX46ywRQrGiR+sEEMLYlISgAc/P64iJUL6bhRRSjrw=;
        fh=JnEYGIySehJ+zMU42bQrocYPtvYSV7BtJG6itqmccc8=;
        b=TwfJIFfKbnh8M0Lu6wBORX66gK0Dr/vnY/Eg7ez+SlPbZUWF9Brb514qBj8mPBOpIf
         GEPZQv6eeRgHKJ7FennaKsE81uHmo02NBeRskoxb61oTQ7ZmHU5biYXQ+yrfvovYF5XU
         dyDghyvRfYZVagpr1uhmuDy3uagt/aj4zanZh4avEB96gaPBx8d0WJ8VSkjVswV5BYit
         xSh1YICRZhyeRRl/X/74LCC/lmXgWlL2vLGRUXryiHFy2frIWzBJS9K2k+E8jPHqen+f
         uzyuwCdm8e6EQk4RNS9smjQGWB5flGocVF+t+ssGmLDa2KoCUxeze9p1YLqo7NzoF+JO
         Y7IA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773329174; x=1773933974; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tX46ywRQrGiR+sEEMLYlISgAc/P64iJUL6bhRRSjrw=;
        b=at18X6q1KyaZmaZoI9BRC+FJ/aI4Jn0VqSdIHNp0ySwg5uv8isX9UL6HR4C9hoQJNz
         pxuPeLXiJ3OajvRtPbXZ/a4BdVeYKc51OaUdAr05+4VyTW0aalK3CRtMEUE9DE+bdDY5
         3DU14lSyJMeEVuTTeEtEp3rXJaFj2eO5bSZAt/6HsU82i6hg9Obz6jRWwpMFWhKOexiB
         ulJ28fMkD8Cd1Q/XMKLYBASLLVcrKExXtq5aFBIsR2lMNWpBtG/F51mL/ctkCOrRLtOx
         8UnGT2TvM3Sce5CBRCqdQXlLph1gcTUvlFRNIN/6hXpP239/dkvBZxRpEJ1+HltwTHIP
         GF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329174; x=1773933974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+tX46ywRQrGiR+sEEMLYlISgAc/P64iJUL6bhRRSjrw=;
        b=gUGvPJdHjxj+q5T2lTVZLNZjzmKr2gEUowtTXinVKJDEh18lIt9B38eVxKISJ7tegl
         aN04O3DkITGMYoJ7xEpD+XudKMIqMkjOalnojKRQvWwfl1vjv5kxDADe6+3Uo2ITSMTM
         Zbm4SupOwDHdhYrxgC6tYPAg939VpzuP3z0mngFOOQ20smJNXdei6Zeon81/EsglLVph
         XD3XuHCOxO7ZGlbeoWRt6aKPxkr1RXmZVhZaO7Tppq638feQYU+jR7q2RR3+eEdkpEF2
         rIrz9Xj04tUTnJA+acm/LeFTDcn6C++42ddxd4bbJWlBz7kxfUkNUgfun1Rc4y9nztXE
         wE2A==
X-Forwarded-Encrypted: i=1; AJvYcCUYs8y3TF2hjmCUxaOvB+N7A9o0EDj0NoIyJ+EkOHVZ6BQOe2G76J/b9Vf91B1TiRezIgk3q92tZuG7@lists.linux.dev
X-Gm-Message-State: AOJu0YwyVPVDDnAcuzv/OSnY63t1cU2oaSoPoh26WeprTlpW2qvysVw3
	sU9dTRn2zIGYz8eVY9tjHMzXWZ+bAE5EnLzTmxIcU+RMABbOkAE9epVSP+MYFgiPiaH+wOJ8du3
	2nEH1VTWOk6p0BtWlitMpbsfSVnS0TOSws40gSh8y
X-Gm-Gg: ATEYQzyOR60vJTn2GvNeg8939QVyP8X2P8wEfsGzPXRpOWIL/9pVdLK9OqfMs/umBQe
	ZanSt8zDS4bu3zagqC5UyB1QtVYrTz+2m8VEJ4gUdoDUpoQNqQ2pMh/B+kOCnenYT4VeWmQIyva
	Ei0/Q9SkG2lM6YbEy37SGBy6/BSPADUCABlp0Q6xaQBT+C+XY3yLiT/pgwT8kEbeUM4TmluAqYR
	3kGBf3mHjqg4b9HyiJXbKQyT82HmRZtzF+v4rikT883uvYk5dp7zMd7VP3AUCIpYZx+vWFWpFma
	hNk+3snnlE30bBEYGL/ZZm5uBiq1LchfXWpU95pD
X-Received: by 2002:a05:701b:4243:20b0:119:e55a:808a with SMTP id
 a92af1059eb24-128edc2f354mr113223c88.7.1773329173422; Thu, 12 Mar 2026
 08:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212143606.534586-1-chao.gao@intel.com> <20260212143606.534586-25-chao.gao@intel.com>
 <abFlCkNd7tqaUyAP@intel.com> <d664ac9445b1c7cc864dead103086341c374b094.camel@intel.com>
 <abJ90EMUnEAy763n@intel.com>
In-Reply-To: <abJ90EMUnEAy763n@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 12 Mar 2026 08:26:01 -0700
X-Gm-Features: AaiRm503LUBcief4sac2Y1wxyiNh-NpP2rk1C1kobpRnod9RsgX__R95s5kuIco
Message-ID: <CAGtprH-tAohbEuQ=BBx=MeUv_hcWmbTADcLMfyi7cVHGo+0ukA@mail.gmail.com>
Subject: Re: [PATCH v4 24/24] [NOT-FOR-REVIEW] x86/virt/seamldr: Save and
 restore current VMCS
To: Chao Gao <chao.gao@intel.com>
Cc: "Huang, Kai" <kai.huang@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"kas@kernel.org" <kas@kernel.org>, "Chatre, Reinette" <reinette.chatre@intel.com>, 
	"Verma, Vishal L" <vishal.l.verma@intel.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "Weiny, Ira" <ira.weiny@intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"sagis@google.com" <sagis@google.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"tglx@kernel.org" <tglx@kernel.org>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"Williams, Dan J" <dan.j.williams@intel.com>, "bp@alien8.de" <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 1:48=E2=80=AFAM Chao Gao <chao.gao@intel.com> wrote=
:
> But I agree that following the X86_BUG_TDX_PW_MCE is better in consistenc=
y
> and extensibility. So, here is the refined patch:
>
>
> From 46e89a50803d6568eb60bd8ec866ac3fd9f6e6da Mon Sep 17 00:00:00 2001
> From: Chao Gao <chao.gao@intel.com>
> Date: Tue, 10 Mar 2026 18:49:41 -0700
> Subject: [PATCH] coco/tdx-host: Don't expose P-SEAMLDR features on CPUs w=
ith
>  erratum
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Some TDX-capable CPUs have an erratum, as documented in Intel=C2=AE Trust
> Domain CPU Architectural Extensions (May 2021 edition) Chapter 2.3:
>
>   SEAMRET from the P-SEAMLDR clears the current VMCS structure pointed
>   to by the current-VMCS pointer. A VMM that invokes the P-SEAMLDR using
>   SEAMCALL must reload the current-VMCS, if required, using the VMPTRLD
>   instruction.
>
> Clearing the current VMCS behind KVM's back will break KVM.
>
> This erratum is not present when IA32_VMX_BASIC[60] is set. Add a CPU
> bug bit for this erratum and refuse to expose P-SEAMLDR features (e.g.,
> TDX module updates) on affected CPUs. Also, emit a message to clarify
> why P-SEAMLDR features are disabled for affected CPUs.
>
> =3D=3D Alternatives =3D=3D
> Two workarounds were considered but both were rejected:
>
> 1. Save/restore the current VMCS around P-SEAMLDR calls. This produces ug=
ly
>    assembly code [1] and doesn't play well with #MCE or #NMI if they
>    need to use the current VMCS.

I see that significant discussion has already occurred regarding this.

My question intends to better understand the current state, Do we have
a known scenario today in upstream implementation where #MCE/#NMI need
to use the current VMCS?

>
> 2. Move KVM's VMCS tracking logic to the TDX core code, which would break
>    the boundary between KVM and the TDX core code [2].
>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Link: https://lore.kernel.org/kvm/fedb3192-e68c-423c-93b2-a4dc2f964148@in=
tel.com/ # [1]
> Link: https://lore.kernel.org/kvm/aYIXFmT-676oN6j0@google.com/ # [2]
> ---
>  arch/x86/include/asm/cpufeatures.h    |  1 +
>  arch/x86/include/asm/vmx.h            |  1 +
>  arch/x86/virt/vmx/tdx/tdx.c           | 12 ++++++++++++
>  drivers/virt/coco/tdx-host/tdx-host.c |  5 +++++
>  4 files changed, 19 insertions(+)
>
