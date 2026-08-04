Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF8745DF41
	for <linux-coco@lists.linux.dev>; Tue,  4 Aug 2026 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855424; cv=none; b=nmeYH87W9xQwfn63w4RQnnlgOHZVDp9o1KecvaaKlI/mvzuJ6QXP4bPA8KEU5d3zZoL7wztwjdL5I3Ge0AEC8iz6LVohnrn/MSSPD8N75H1Uf30Pc+npKF0g8WWIqg2CHUeCx5lZGc/1V+63FXlyW4aguNZZcBXJw0j6tueDMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855424; c=relaxed/simple;
	bh=vIsKKUspVkh1Yk6MG57gcAaCiHxGgisqW2I0em35+o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoppvfquW0oo2pDnaNwy2Mgom/oY2L1UvlEfUvXWSfVfWnsCEXHfgcmjqRRKXWPQKjp0QNojcZ9LXq+BVuoj7/SoeVj3/rPQbJLRGwQJlvyMbBvpSqVP0TQJhnhE+EKDoDtTDaXQAXjbT5oRBJJdnZYFcB37ZLXQhuVO/Ywoyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=emTRYhPO; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="emTRYhPO"
X-Forwarded-Encrypted: i=1; AHgh+RrxdJyjFuuSYy3/D1r/JGrEvFeuv4UOOoqapdXTORicOMOBimJgcuMmtH4V0S0yIF6KXMMbIh+N4A7I@lists.linux.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785855417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+CI/fiKR8UbES4usBJXq0bFK0RfGs3CooWjyfR2Xxg=;
	b=emTRYhPOMfMMAA4eXgWPxDOh972pupMsR/6tEhdolHspfottxaaMv3ZlWduCnpaB8QUw/Y
	GY9ECDfTDk4WUJac/vZTIKAe5PAex5yE91zJceSx4gukDTUIoun482mbbGavU+j9BWA7PU
	uQoyOIMltDIO7q7nP4Ij7YBGZsCLtM4=
X-Gm-Message-State: AOJu0YzPonD96fxWCDI4btmDtJtsyDaiFIXWMjecQKXZvFiHpnfcaHOQ
	oBJ9hYF8XmXWSYfUceMlxD4SM7ruXIDHMalVHOyOAvtgOgF/X+WjN0Md+1RUVZgJsv0zVa01Aja
	OuQ9m6ZBXfWu1KA+O/vH1rDOfQoz058esf3to2Oa7
X-Received: by 2002:a05:622a:3d2:b0:52c:d3a1:358b with SMTP id
 d75a77b69052e-52ce406d4b0mr1971571cf.15.1785855378038; Tue, 04 Aug 2026
 07:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803134403.80630-1-steven.price@arm.com> <20260803134403.80630-12-steven.price@arm.com>
In-Reply-To: <20260803134403.80630-12-steven.price@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 4 Aug 2026 15:55:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwoKj+c-ZS7W4fCAMYWSgrc+15QWBxu_sE-PMECr+8zpA@mail.gmail.com>
X-Gm-Features: AUfX_mwVon9UhNhtZaAxA5CLmO2nrzb-pG_WAF1Cw8J3ja7b3uGJ4EsCUXl9vU4
Message-ID: <CA+EHjTwoKj+c-ZS7W4fCAMYWSgrc+15QWBxu_sE-PMECr+8zpA@mail.gmail.com>
Subject: Re: [PATCH v16 11/45] KVM: arm64: CCA: Check for RMI support at KVM init
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

Hi Steven,

On Mon, 3 Aug 2026 at 14:45, Steven Price <steven.price@arm.com> wrote:
...
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bae2c4f92ef5..1a5e15040111 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -27,6 +27,7 @@
>  #include <asm/fpsimd.h>
>  #include <asm/kvm.h>
>  #include <asm/kvm_asm.h>
> +#include <asm/kvm_rmi.h>
>  #include <asm/vncr_mapping.h>
>
>  #define __KVM_HAVE_ARCH_INTC_INITIALIZED
> @@ -424,6 +425,9 @@ struct kvm_arch {
>         /* Nested virtualization info */
>         struct dentry *debugfs_nv_dentry;
>  #endif
> +
> +       bool is_realm;
> +       struct realm realm;
>  };

Marc suggested at v10 making the pKVM and CCA state here a union,
given the two are exclusive, and I believe you acked it [1]. Was there
an issue with it, or did it just get lost across the respins?

Cheers,
/fuad

[1] https://lore.kernel.org/all/86ms6azxt5.wl-maz@kernel.org/



>
>  struct kvm_vcpu_fault_info {
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> new file mode 100644
> index 000000000000..57d24b244c95
> --- /dev/null
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023-2026 ARM Ltd.
> + */
> +
> +#ifndef __ASM_KVM_RMI_H
> +#define __ASM_KVM_RMI_H
> +
> +/**
> + * struct realm - Additional per VM data for a Realm
> + */
> +struct realm {
> +};
> +
> +void kvm_init_rmi(void);
> +
> +#endif /* __ASM_KVM_RMI_H */
> diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
> index b546703c3ab9..92cec42952f4 100644
> --- a/arch/arm64/include/asm/virt.h
> +++ b/arch/arm64/include/asm/virt.h
> @@ -87,6 +87,7 @@ void __hyp_reset_vectors(void);
>  bool is_kvm_arm_initialised(void);
>
>  DECLARE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
> +DECLARE_STATIC_KEY_FALSE(kvm_rmi_is_available);
>
>  static inline bool is_pkvm_initialized(void)
>  {
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 449154f9a485..189e8ad78b22 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -37,6 +37,7 @@ menuconfig KVM
>         select SCHED_INFO
>         select GUEST_PERF_EVENTS if PERF_EVENTS
>         select KVM_GUEST_MEMFD
> +       select ARM_RMM
>         help
>           Support hosting virtualized guest machines.
>
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 59612d2f277c..ed3cf30eb06e 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -16,7 +16,7 @@ CFLAGS_handle_exit.o += -Wno-override-init
>  kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>          inject_fault.o va_layout.o handle_exit.o config.o \
>          guest.o debug.o reset.o sys_regs.o stacktrace.o \
> -        vgic-sys-reg-v3.o fpsimd.o pkvm.o \
> +        vgic-sys-reg-v3.o fpsimd.o pkvm.o rmi.o \
>          arch_timer.o trng.o vmid.o emulate-nested.o nested.o at.o \
>          vgic/vgic.o vgic/vgic-init.o \
>          vgic/vgic-irqfd.o vgic/vgic-v2.o \
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 50adfff75be8..b961c22fce3d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -42,6 +42,7 @@
>  #include <asm/kvm_nested.h>
>  #include <asm/kvm_pkvm.h>
>  #include <asm/kvm_ptrauth.h>
> +#include <asm/kvm_rmi.h>
>  #include <asm/sections.h>
>  #include <asm/stacktrace/nvhe.h>
>
> @@ -111,6 +112,8 @@ long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext)
>         return -EINVAL;
>  }
>
> +DEFINE_STATIC_KEY_FALSE(kvm_rmi_is_available);
> +
>  DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
>
>  DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
> @@ -3019,6 +3022,8 @@ static __init int kvm_arm_init(void)
>
>         in_hyp_mode = is_kernel_in_hyp_mode();
>
> +       kvm_init_rmi();
> +
>         if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
>             cpus_have_final_cap(ARM64_WORKAROUND_1508412))
>                 kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> new file mode 100644
> index 000000000000..384991d69f78
> --- /dev/null
> +++ b/arch/arm64/kvm/rmi.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2026 ARM Ltd.
> + */
> +
> +#include <linux/kvm_host.h>
> +
> +#include <asm/rmi_cmds.h>
> +#include <asm/virt.h>
> +
> +void kvm_init_rmi(void)
> +{
> +       /*
> +        * TODO: Support Realm guests in nVHE mode, this will require adding
> +        * EL2 stub(s) for REC entry and possibly other things.
> +        */
> +       if (!is_kernel_in_hyp_mode())
> +               return;
> +
> +       if (!is_rmi_available())
> +               return;
> +
> +       /* Future patch will enable static branch kvm_rmi_is_available */
> +}
> --
> 2.43.0
>
