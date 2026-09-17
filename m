Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795C3E9F9E
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644304; cv=none; b=Be2shB5ynIzna6hfWzW1z3HabNtcEylkRHDlk/XxCesUIO7MZjmGVto1ugqX1QVbugj+rrLczbwAM5MMePWmOrPLbZNx4/0fYdRF+yJOWnhn5BzLEoExjS5vHrIYATq6P52imBaIKrCQbXJ7ABiy0gg/K7AAj2pRH0mwsF7ll2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644304; c=relaxed/simple;
	bh=6cLtGQr3NeN6cuI+wwoUX8J3Vbq5/m8fhyoeTXSQu5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLtHl6pJhpObnOvw1Of99jVroTatLTKakC4C2uNcyacfza2v7xLRxNfeE/Gh278evJzctH5q2s39cmUhCSNqXFySC/ywOhz9Z0N1Y0RTv06e/8cMk/hi+SCeouaIb1A1O3DwPTAaKlavrvkbs79ZHsOMpjxdy0CJhx0UGAX/AkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kiRhBj40; arc=none smtp.client-ip=91.218.175.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kiRhBj40"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6cLtGQr3NeN6cuI+wwoUX8J3Vbq5/m8fhyoeTXSQu5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789644300; v=1; x=1790249100;
 b=kiRhBj40QZjU5NOvQBl+59g5T2o30sOxAfskcybhOkswf0pkcVCMpQGtKcqSvtBmh+byVN7n
 OplKtCUNzZBCISQxUsIvrSToiGbKSlqZ5bEJfa7AbXPsqkvDh/A8US3ZmeJ8z6yD8HFkzea9ofx
 07aTV1grmL+lS7e5nQkk/JiM=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 781bd06093952d06;
	Thu, 17 Sep 2026 11:25:00 +0000
X-Mizu-Trace-ID: 781bd06093952d06
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b7658501ccso894e87.0
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 04:24:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwT3hRUVRSKiW2adP/cnro0S+wVDSFEbJVQBgUKustEUFh4A2qVjtZwuxZNT99EKCPr8rCPRNkmeJic@lists.linux.dev
X-Gm-Message-State: AFuF++nbF/djihumNTsiMZPS2FaapJANwpfKqfG8X8gu1EeQfD9kedqU
	BfXypsfmWuJO5Ulc32v38UkuN1+ADXLHk81zK3UDOssNddkeVhi4TjDEL5xwCQ3DnVFMZmHWrRH
	SmvJVA+arWYqOHGvAp7HreSnjog1Y7Kj4iLp/+X2X
X-Received: by 2002:a05:6512:3054:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8bff4a5d7mr13058e87.15.1789644298430; Thu, 17 Sep 2026
 04:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-6-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-6-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 17 Sep 2026 12:24:21 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz65G0MM=tOrzmk=jMweBX1us6FqfrmSkQs4KSyAEoxhg@mail.gmail.com>
X-Gm-Features: AcwNN1VFMe-nqpetX5NFULE-T8FsNAG-h344sw-wYzui_i8Ztl6ucWB9ep0N7uI
Message-ID: <CA+EHjTz65G0MM=tOrzmk=jMweBX1us6FqfrmSkQs4KSyAEoxhg@mail.gmail.com>
Subject: Re: [PATCH v18 05/23] KVM: arm64: Track the type of VM in kvm_arch
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

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:23 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> +#define kvm_vm_hyp_is_pkvm(kvm)                (is_protected_kvm_enabled())

I'd keep is_protected_kvm_enabled() at the three call sites: this
takes a VM and ignores it, so it reads as per-VM when it's the mode,
and patch 20's comment about not being able to use the kvm_vm_ helpers
with a NULL kvm goes away too.

> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
[...]
> @@ -432,7 +432,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
>
>          hyp_vm->host_kvm = host_kvm;
>          hyp_vm->kvm.created_vcpus = nr_vcpus;
> -        hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
> +        hyp_vm->kvm.arch.vm_flavor = READ_ONCE(host_kvm->arch.vm_flavor);

Could EL2 reduce this to VM_PKVM or VM_PROTECTED_PKVM here instead of
storing what it reads? The host supplies the value, and it's now an
enum rather than a bool. Patch 12 relies on EL2 only ever seeing those
two, and with VM_REALM above the marker a host-written value passes
kvm_vm_is_protected() but not the == form, if EL2 ever adds one.

Both hunks are new since v17, which is where I gave the Reviewed-by.
Happy to keep it if you can settle these please.

Cheers,
/fuad
