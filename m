Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D924BC09
	for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753442540; cv=none; b=tGqtORTl4uh1S0CLCSIGYyElppQ+vq4dNNP4s9VbGDpdF/2Xkzncf1yZnDTnm0Uf0VB3rI8PjNtUbitbT2JJdMYHk13zpDyfGhMEL1NxK+EG+BtGE8ifPacDzr6Oei2NE3fX2qBFtSQG7eioqij1i8BiEd5OyBZFHBzUWc5IiCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753442540; c=relaxed/simple;
	bh=fZuK3vdmjJWaBTc7PamARiPpTkZpxcdOqQIZTB73QlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohoYG5rEjNoeVjOb+fX70c6JwW5p140lnnxArtyQD240o4vOGfwnHBDAxAl2IlAIz7M0BDk5oVpg0vYRLVKLKcRIyy44Vnv4+oykfISMF6xdXRsPxlvYRO2QeqH2QagJ2hFYBvD1z3IsHsJ1HqvsRzh96p7V7mifI+suWgJ7SDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm6qz7Ox; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm6qz7Ox"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234b440afa7so18056695ad.0
        for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 04:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753442538; x=1754047338; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADeETAaHqfwPNv47VY+2a6NqZqg/PEaiSFoloJQbRjk=;
        b=Cm6qz7OxvcLn2raVrQZmxRGjVPTNDOJe+qo6Qc28q48lAre26/QMF8q62/YfcokY2W
         7pH6HhYaj9IWE+Tk9nevWFD5lMLLVJFQc+9PHiDEVxr35YQeGXu/elW3c6QcIqzz1wpC
         x0n6XM+92o3U71OfNW5TSEW9ePHqgLyz6B0awS2BpHsSF67TeQuif17hOmsIqrTWcgkn
         0XU/7QKym8wUoZARxRfX2iekmaNQ/+BUTLfNmjNptHBbmUMYmGq7F5R50TU7Y77mjOvN
         x873w6F03/JQ2aHu7l7ZCcMzd3ut+oIF7LUTnNRMR7E/WtKWsuwmSKZy3GuIugrXDImx
         D4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753442538; x=1754047338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADeETAaHqfwPNv47VY+2a6NqZqg/PEaiSFoloJQbRjk=;
        b=wUP46Wvtr9S8dkXKCg8FTajaZZar7mqvyilD8f46rqcC1blB1bPIcTVLxCiCaOhNlf
         BaN4jr4P/8z2bkSBhEdjELyKV2cBPmViSTlZiajknQtR2LWid7yx32oNCJrRh++P8rYY
         fschR/jwyY25cj/OlRZX8nU4mt8u0fu48hnggTJigvph6mvfVtUVUUkvrGBBt42nvdTP
         55TzbiPj4XNwiRSmgaWiqOxag+p/UuYHLqyTA0PPFQC7q+szi9gexvGteWfWJc1rSK4V
         PsvXKKVRCGGzqaMMOPBa0RXqzEXdBlp6mDHxcDr3lSQMJKmBumWwVLpCawXrLOYl0oGO
         PMgw==
X-Forwarded-Encrypted: i=1; AJvYcCWLwCyWYGUu7c9L/jaCcuabi0b9LHz8A8Muw443k0fDaedhvFsoUjCispODjBpVNhhv39BlI2xHseHB@lists.linux.dev
X-Gm-Message-State: AOJu0YxdFhwSfo3yvDx+oItW9lGOjFeC1wp8ayp1HHUiNoUuNMePbIfj
	lOLWLwho2NYDc2XxXN8fhJZ5fqsVIjI1Mccl+TW2ui0BgI3lw6W79vSDKPXjcqFIPAoumJWtorg
	NP2McwM2XRIdo7zScLZQXv4nvtXs6TR8=
X-Gm-Gg: ASbGnctLO1SdaBiGdn03sneNEfqqpeZwIOX6tKLj3V+mr3EnThYBbgA1jJrCvRZGaW4
	mxeRbTfJ2dC6qKSE3XfjPkeiilDE5Pm2GKrECcKZ408NEUPtt0p18hEDI5JXXA/16FaUFbVa5Sm
	OKYeN+UP9DF7DyiB1mtFBeGaWHAKuWOYe1eEAUoeRubmELIiaC4lEO8K301/5auoQ8YJEyI8gkC
	fpf
X-Google-Smtp-Source: AGHT+IFm+YK+Y2hJQQ1hmtCwNSUBVL0UvD5jayHigUFo6GG8rs5V2CGFs8VME+5GxbAPEVs93coICnPBamAwKQyY/yk=
X-Received: by 2002:a17:902:ccc4:b0:234:e8db:432d with SMTP id
 d9443c01a7336-23fb3166c33mr22847705ad.39.1753442538032; Fri, 25 Jul 2025
 04:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714221545.5615-1-romank@linux.microsoft.com> <20250714221545.5615-11-romank@linux.microsoft.com>
In-Reply-To: <20250714221545.5615-11-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 25 Jul 2025 19:21:42 +0800
X-Gm-Features: Ac12FXyz3bssr1OLL9BFtYmc0Edy0F9YKk5P-0fTYGoeZUcLahAw8xTcKbOlq4Q
Message-ID: <CAMvTesADrxV4vwU_mqYygm1bE39PKLZaaL-wLPT8snATRVkwNg@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v4 10/16] Drivers: hv: Rename the SynIC enable
 and disable routines
To: Roman Kisel <romank@linux.microsoft.com>
Cc: alok.a.tiwari@oracle.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, 
	dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, 
	hpa@zytor.com, kys@microsoft.com, mhklinux@outlook.com, mingo@redhat.com, 
	rdunlap@infradead.org, tglx@linutronix.de, Tianyu.Lan@microsoft.com, 
	wei.liu@kernel.org, linux-arch@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, apais@microsoft.com, 
	benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:16=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> The confidential VMBus requires support for the both hypervisor
> facing SynIC and the paravisor one.
>
> Rename the functions that enable and disable SynIC with the
> hypervisor. No functional changes.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  drivers/hv/channel_mgmt.c |  2 +-
>  drivers/hv/hv.c           | 11 ++++++-----
>  drivers/hv/hyperv_vmbus.h |  4 ++--
>  drivers/hv/vmbus_drv.c    |  6 +++---
>  4 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
> index 6f87220e2ca3..ca2fe10c110a 100644
> --- a/drivers/hv/channel_mgmt.c
> +++ b/drivers/hv/channel_mgmt.c
> @@ -845,7 +845,7 @@ static void vmbus_wait_for_unload(void)
>                         /*
>                          * In a CoCo VM the hyp_synic_message_page is not=
 allocated
>                          * in hv_synic_alloc(). Instead it is set/cleared=
 in
> -                        * hv_synic_enable_regs() and hv_synic_disable_re=
gs()
> +                        * hv_hyp_synic_enable_regs() and hv_hyp_synic_di=
sable_regs()
>                          * such that it is set only when the CPU is onlin=
e. If
>                          * not all present CPUs are online, the message p=
age
>                          * might be NULL, so skip such CPUs.
> diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
> index a8669843c56e..94a81bb3c8c7 100644
> --- a/drivers/hv/hv.c
> +++ b/drivers/hv/hv.c
> @@ -266,9 +266,10 @@ void hv_synic_free(void)
>  }
>
>  /*
> - * hv_synic_enable_regs - Initialize the Synthetic Interrupt Controller.
> + * hv_hyp_synic_enable_regs - Initialize the Synthetic Interrupt Control=
ler
> + * with the hypervisor.
>   */
> -void hv_synic_enable_regs(unsigned int cpu)
> +void hv_hyp_synic_enable_regs(unsigned int cpu)
>  {
>         struct hv_per_cpu_context *hv_cpu =3D
>                 per_cpu_ptr(hv_context.cpu_context, cpu);
> @@ -334,14 +335,14 @@ void hv_synic_enable_regs(unsigned int cpu)
>
>  int hv_synic_init(unsigned int cpu)
>  {
> -       hv_synic_enable_regs(cpu);
> +       hv_hyp_synic_enable_regs(cpu);
>
>         hv_stimer_legacy_init(cpu, VMBUS_MESSAGE_SINT);
>
>         return 0;
>  }
>
> -void hv_synic_disable_regs(unsigned int cpu)
> +void hv_hyp_synic_disable_regs(unsigned int cpu)
>  {
>         struct hv_per_cpu_context *hv_cpu =3D
>                 per_cpu_ptr(hv_context.cpu_context, cpu);
> @@ -528,7 +529,7 @@ int hv_synic_cleanup(unsigned int cpu)
>  always_cleanup:
>         hv_stimer_legacy_cleanup(cpu);
>
> -       hv_synic_disable_regs(cpu);
> +       hv_hyp_synic_disable_regs(cpu);
>
>         return ret;
>  }
> diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
> index 16b5cf1bca19..2873703d08a9 100644
> --- a/drivers/hv/hyperv_vmbus.h
> +++ b/drivers/hv/hyperv_vmbus.h
> @@ -189,10 +189,10 @@ extern int hv_synic_alloc(void);
>
>  extern void hv_synic_free(void);
>
> -extern void hv_synic_enable_regs(unsigned int cpu);
> +extern void hv_hyp_synic_enable_regs(unsigned int cpu);
>  extern int hv_synic_init(unsigned int cpu);
>
> -extern void hv_synic_disable_regs(unsigned int cpu);
> +extern void hv_hyp_synic_disable_regs(unsigned int cpu);
>  extern int hv_synic_cleanup(unsigned int cpu);
>
>  /* Interface */
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 72940a64b0b6..13aca5abc7d8 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -2809,7 +2809,7 @@ static void hv_crash_handler(struct pt_regs *regs)
>          */
>         cpu =3D smp_processor_id();
>         hv_stimer_cleanup(cpu);
> -       hv_synic_disable_regs(cpu);
> +       hv_hyp_synic_disable_regs(cpu);
>  };
>
>  static int hv_synic_suspend(void)
> @@ -2834,14 +2834,14 @@ static int hv_synic_suspend(void)
>          * interrupts-disabled context.
>          */
>
> -       hv_synic_disable_regs(0);
> +       hv_hyp_synic_disable_regs(0);
>
>         return 0;
>  }
>
>  static void hv_synic_resume(void)
>  {
> -       hv_synic_enable_regs(0);
> +       hv_hyp_synic_enable_regs(0);
>
>         /*
>          * Note: we don't need to call hv_stimer_init(0), because the tim=
er
> --
> 2.43.0
>
>

Reviewed-by: Tianyu Lan <tiala@microsoft.com>
--=20
Thanks
Tianyu Lan
