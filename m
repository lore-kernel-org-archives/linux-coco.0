Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D9F59650E
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655566; cv=pass; b=mWVT0FvfES8VtpPxvsoD9ewTu7It2ZeK3sQBo4sPQZazCX8k3W73GFV70LYBQ4sIq2FET15aHsBu/LH2VE+9zuGtu1xBhcenXKrp5uBO1djGXFwUB4qwOBWRo3pWC/eRAhEPp/FMsMfmByW903n91Fh3NZj4Cp0oBiN3S1OxYq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655566; c=relaxed/simple;
	bh=e52PCCrpI/rn5l+5D4OuGimA62WJjNDBide2zC7K/fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/Zs/eRtWlZ4BmSBBiWU1vqUjWrj3bTXhFvXEKbzwEGSG2AAhrTYZvXuPKB4xjs+M0M+b8f3dlwzMxND8hqTke9T+2VB9rxgRusvFU5szmMRjm1ts3B+NBlEjwPKKmO3AyHV0aLlVUM0IgJSB6ZtkiUv9WJty2fa0lh5nrjXJ64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HEbBBOsn; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HEbBBOsn"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b7658501ccso2830e87.0
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 07:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655561; cv=none;
        d=google.com; s=arc-20260327;
        b=csXG89jk+mEH2b9pb9xIRhyY/b8q+gDAu5qXSMmoTPIS8WHmeZUqYzC73hImv9zb50
         z/jcUMJgPVWhAwIO0cTEmINjWj7XnM9VPE5avFEbg/1WZheWf7jQ5CV9hWVypNTbPwiX
         NW50xr0FCeExhTw4kQbYaBPqElY0lhOgqDDY07hi2WQNeddcyYitdhkCI37rLZz/osLI
         jFE2KiuQ1r5QpC5Xf+z/do0q9omPV1FAtj0E8QSTd0ezTgeQME+4jwWo+x/MIMUpdRoX
         QcFRDh/JUsgmiZ8cDw2R9k37ScN3aZLJ9X5opvwzr/s5WpF63EuAEFCdWsEYyCfGGJXP
         AAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        fh=tymtguxre2fFwhLSznV9xv65pnsMaRfn6adnBbPXyXs=;
        b=Ir8mKtZ+ePZMlVHhUfa//bYOwcGeu6nHuhCVI5G14pehR+b6DYj+UteJLLHZF5wYbo
         WXQXalMxoKnylVdJMO5VeB5p59O9+Gcz3iq+U45GIFgS/aGYDZRS62qkx+YU8n5ARlsk
         O48rXBuQOT10G5VG6dlNxOj6zyUhohSxQ3Vzq5PWMRT9XZw3Tb2CtiuxdapC/a5xAX9g
         TZZnZTzjSEX9nvboJDONkbLqYKgkqIhoZlmLnConMXo4mvQIlp5DJ5P5o8k32BgwHxcn
         QSF/pkkGlWmAPVPOFYwOOF9YgmmUIQpvCyNbAvsxZLfegpLIwcgEfPmdIZTeW3QLqzXf
         gCVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789655561; x=1790260361; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        b=HEbBBOsnZew3vp6NFQN2N51t3NUYUNsfqmZqdmszCRN8lCZNuodF470siCONavJPZ8
         yrg6VmhW9myGSlD8+ftzun0Sy6XgJ1DLHcvL7SJaIZT32OizWRR4CEWiB9fahtekkoHg
         Jg8ak/xi2dWezZxkU4Ol0vi11pAEgFkhwG70zrWyQqsINCs7ITl4KXweTcvJajUAWJzt
         OBNuXI8dluqnHD5MmhVBZjVDOy52lJ5NGYXXj3u0Ow5K13ZhxefUbxpcm8O/oZ2k2CYF
         KtoIUB0/pan2r1tTh/1W1oBMXqKHimqDddVE421Vaz9XuI3BBN24nTNtHouCo6WBMcWB
         F3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655561; x=1790260361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        b=eJSGyWkeRYz6GKNCl/2CUpvVegEaWbsveyG4TEQo4HBhmfAhx28siMwbiqA8KkFbkv
         XhuCZJwQ4BzS9DclElsgygRtoihw+hZIbMQBbOYZ5kEenvnfTPdoNq2VWdeiK/1wEX6Z
         qAHtzYH0BmoJDEfoJ4bDzjtMSfFNNhIRz+ufmhUBL04zj0jD+O17Vvtd2ET9abkgXUu2
         eAxrnDM2d/4k0L+TtamKV/Df5HKR2+AAcpAzqeHjiKdsnB9hYsR0Ignjd6V6UDzOzPuz
         Z5EZ7CIbw2R5o1JJAexdhbXihr4ghdSwxjp0P3Qmez6XH6yWjlsdFq3f3J9lc0h6705y
         BL1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7diKbSMo6EJrYh9ogClBAFFhdgM2KQD4WA7MUJQAial5jy/E5ZL/9NtE4hisLBtnWqjBXpnIpWG4S@lists.linux.dev
X-Gm-Message-State: AFuF++mcuq9wk5FaFsoqWAXueQak0x5syJRnLKz9f+nW1CIoyQwauR3t
	HGOgTItqLVrE6beLvdc0KHHdWloLhwBl0SA5VtCdTJi/tj45fDBTVYO1y4tUath7muujW56iX1T
	pglcifOg6BAqm4uzxuWxI/oWz6+ZV4GfYV5S2JmcS
X-Gm-Gg: AYBFou00310M+hINwbwnkjrzEG2ORWAt9lnt2SEZOGw/i4lO/bjfC3sdeUQMwecxpAR
	A4W313MxGOudT1TrrEzquNWXv2tWuxyhrgeskgpm/1lWQGrS1NhLUjzZbIDxdpMbj1IZ65wqVaY
	ooSmO7nYUfWFHn4iKc9auYAZcWq99Nj6DECn4OkU1UzEcR5VzI9CfPH4zDwP2sW8HaS0wVov5B/
	gDb0yIfqXEGlEL1yY8iDjtDpfnP/53VjRdV8OHgB+fX0y+mW4zUqZ2J8GlmrYn9IBzy9LvHgl3w
	vBylbMHUMvWeMrcwMRA1NON/w56e8f4Wu1LKdyOLF2eyGBsdLz5bFx69u984IwZGhVNJa3K5dgU
	fDNVWW2jz58Yr8FWbzq2Iy3yq
X-Received: by 2002:ac2:5688:0:b0:5a4:ec:53d9 with SMTP id 2adb3069b0e04-5b8bff1625cmr55295e87.1.1789655560856;
 Thu, 17 Sep 2026 07:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 15:32:04 +0100
X-Gm-Features: AcwNN1W_068MDIwpUtuw49Yy1PeVxQfVd9fKCVvGdj2PjeQoOQdH9b0b6js4h-g
Message-ID: <CA+EHjTzfgoZ6pxoGx-PjV5O4QfmPZrCjSrBAvoS-V2muLBVM8Q@mail.gmail.com>
Subject: Re: [PATCH v18 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 17:01, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> This series is a trimmed down version of the Arm CCA KVM support, previously
> posted here [0]. Like in the v17, we have tried to split the entire series
> into the following chunks.

FWIW, this boots and runs guests on VHE, nVHE and pKVM (protected and
non-protected) under QEMU, and on an M4; arch_timer and get-reg-list pass.
Didn't try it on FVP.

Cheers,
/fuad


>
>  1) Base RMM RMI support under drivers/firmware/arm_rmm -> [1]
>  2) Linux Host support for handling GPFs - [2]
>  3) NEW: Enlighten KVM arm64 about the different VM types and use call
>     backs for the VM type, rather than spilling the is_this_type_of_vm()
>     everywhere. Adds VCPU and Stage2 MMU related callbacks with support
>     for the existing VM types. There are other places where we may be
>     able to abstract, but those need careful performance evaluations
>     to make sure they are fit (e.g., vcpu_run)
>
>    Later in the series, we generalise the predicate "kvm_vm_is_protected()"
>    to cover all  "Confidential" VMs (which includes Protected VM and Realms),
>    which allows us to handle common themes without having to do things like :
>      if (kvm_vm_is_protected() || kvm_vm_is_realm()),
>      instead:
>      if (kvm_vm_is_confidential())
>    Also replaces the code with precise check for a given VM type to
>    avoiding combination of if (). e.g,, kvm_vm_is_unprotected_pkvm(kvm).
>    The checks under arch/arm64/kvm/{nvhe,pkvm} still retain the vm_is_protected()
>    check as pVMs are the only possible protected VMs there.
>
>  4) Bare minimal Realm VM support without the actual functionality to
>     run a Realm. This would help the maintainers to review the series in
>     smaller chunks. This doesn't depend on [1] and can be independently
>     merged, without being "functional".
>     This series includes vcpu operations and the s2 vm operations, which
>     do need the RMI driver backend to be meaningful. But the KVM handler
>     is in the right shape. The remaining changes would be added once the
>     RMI firmware library lands.
>  5) Core implementation of the RMI driver for KVM and actual enablement of the
>     Realm support. This depends on (1), (2) and the guest-memfd-in-place
>     conversion series v12 from Ackerley. This is available here at the integration
>     branch [3]
>
> This series is comprised of (3) and (4) above.
>
> The integration branch has been tested with the following components:
>   tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3 [4]
>   kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git cca/kvm-v18
>
> [0] Arm CCA KVM Support v16 : https://lore.kernel.org/all/20260803134403.80630-1-steven.price@arm.com
> [1] Linux firmware RMI https://lore.kernel.org/all/20260912083611.2513845-1-suzuki.poulose@arm.com
> [2] Linux GPF Host https://lore.kernel.org/all/20260913070459.2547407-1-suzuki.poulose@arm.com
> [3] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v18/integration
> [4] https://support.arm.com/documentation/den0137/2-0bet3/
>
> Changes since v17:
> https://lore.kernel.org/all/20260908162223.1683432-1-suzuki.poulose@arm.com
>
>  - Add a patch to fix pKVM handling of SYS_CNTVCT/CNTPCT to override the counter
>    offset (Patch1)
>  - Restrict Realms to VGIC v3 only - New patch
>  - Add kvm_vm_is_unprotected() to replace is_protected_kvm_enabled() &&
>    !kvm_vm_is_protected() - New patch
>  - Use macro to initialize the per-flavor vcpu, s2_vm ops
>  - Add a wrapper to initialise vcpu and s2_vm ops with a BUILD_BUG_ON()
>    for the array size checks against VM flavour types
>  - Drop forward decalaration of the vcpu, s2_vm operations that spoiled the
>    fun ;-)
>  - Remove irrelevant comment about the order of timer loading for !VHE
>  - Use the explicti kvm_call_hyp_nvhe for pKVM specific ops
>  - Don't call nvhe_vcpu_put from pkvm_vcpu_put, open code them
>  - Drop cpu argument for vcpu_load() callback. We set the cpu
>    before the callbacks are invoked
>  - Drop kvm_vm_is_confidential(), instead widen the scope of kvm_vm_is_protected()
>    to cover pVMs and Realms. Add an explicit helper kvm_vm_is_protected_pkvm()
>    for the cases where we need to check for a "pVM on pKVM"
>  - Add kvm_vm_hyp_is_pkvm() for checking if the VM is running on pKVM.
>    covers both unprotected and pvms. But really uses is_protected_kvm_enabled()
>    under the hood
>  - Add kvm_vm_hyp_is_distrusting() to cover pKVM guests (both protected and
>    unprotected) and Realms. Use this for preventing the vgic v2 mapping into
>    Stage2 for a guest
>  - Drop superfluous !kvm check from kvm_vm_ioctl_enable_cap() - Sashiko
>  - Drop KVM_CAP_CREATE_IRQCHIP, as we don't support VGIC_V2 for Realms
>  - Filter out the vm_ioctls that are based on blocked cap.
>  - Repurpose the pkvm plumbing for filtering the caps and ioctl to generic
>    and plumb the Realm support in
>  - s/PKVM/pKVM for the comments
>  - Drop type argument for pkvm_init_host_vm and also drop protected variable,
>    now that we have the vm_flavor to check.
>  - Use kvm_vm_hyp_is_pkvm() to replace is_protected_kvm_enabled() with valid
>    kvm instance
>  - CCA: Merge the GET/SET REG handling patches into a single patch
>  - CCA: Reword the commit description for SVE VL access handling
>  - Reordered the patches to group the Realm realted to changes to the rear end
>
> Jean-Philippe Brucker (2):
>   KVM: arm64: CCA: Expose SVE VL register before VCPU finalization
>   KVM: arm64: CCA: Control user register access for Realms
>
> Steven Price (3):
>   KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
>   KVM: arm64: CCA: Support timers in realm RECs
>   KVM: arm64: CCA: WARN on injected undef exceptions
>
> Suzuki K Poulose (18):
>   KVM: arm64: protected VM: Handle set_one_reg CNTVCT_EL0/CNTPCT_EL0
>   KVM: arm64: Disable Steal time accounting for protected guests
>   KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
>   KVM: arm64: Track the type of VM in kvm_arch
>   KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
>   KVM: arm64: Add vcpu load/put call backs for flavors
>   KVM: arm64: Reuse kvm_stage2_unmap_range in kvm_unmap_gfn_range
>   KVM: arm64: Add VM specific callback for S2 MMU operations
>   KVM: arm64: Abstract out memory abort handling
>   KVM: arm64: Use kvm_vm_is_unprotected() for !kvm_vm_is_protected()
>   KVM: arm64: Widen the scope of "protected" VMs
>   KVM: arm64: Add a helper for VMs running on hyp that don't trust the
>     host
>   KVM: arm64: CCA: Add a new mode for supporting Realm guests
>   KVM: arm64: CCA: Add VCPU load/put for Realms
>   KVM: arm64: CCA: Add bare minimal S2 operations for Realm
>   KVM: arm64: CCA: Introduce Realms
>   KVM: arm64: CCA: Mandate VGIC_V3 for Realms
>   KVM: arm64: CCA: Don't expose unsupported capabilities for realm
>     guests
>
>  .../admin-guide/kernel-parameters.txt         |   3 +
>  arch/arm64/include/asm/kvm_emulate.h          |  16 +
>  arch/arm64/include/asm/kvm_host.h             |  63 +++-
>  arch/arm64/include/asm/kvm_pgtable.h          |   6 +-
>  arch/arm64/include/asm/kvm_pkvm.h             |  25 +-
>  arch/arm64/include/asm/kvm_rmi.h              |  61 ++++
>  arch/arm64/include/asm/virt.h                 |   1 +
>  arch/arm64/kvm/Makefile                       |   2 +-
>  arch/arm64/kvm/arch_timer.c                   |  37 +-
>  arch/arm64/kvm/arm.c                          | 330 +++++++++++++++---
>  arch/arm64/kvm/guest.c                        |  73 +++-
>  arch/arm64/kvm/handle_exit.c                  |   2 +-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  28 +-
>  arch/arm64/kvm/hyp/pgtable.c                  |   1 +
>  arch/arm64/kvm/hypercalls.c                   |   4 +-
>  arch/arm64/kvm/inject_fault.c                 |   1 +
>  arch/arm64/kvm/mmu.c                          | 210 ++++++++---
>  arch/arm64/kvm/pkvm.c                         |   6 +-
>  arch/arm64/kvm/pvtime.c                       |  14 +-
>  arch/arm64/kvm/rmi.c                          |  18 +
>  arch/arm64/kvm/sys_regs.c                     |  29 +-
>  arch/arm64/kvm/vgic/vgic-init.c               |   3 +
>  include/kvm/arm_arch_timer.h                  |   3 +-
>  include/kvm/arm_psci.h                        |   2 +
>  24 files changed, 758 insertions(+), 180 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kvm_rmi.h
>  create mode 100644 arch/arm64/kvm/rmi.c
>
> --
> 2.43.0
>
