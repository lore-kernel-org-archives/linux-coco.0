Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794924487;
	b=SWC6Ve87EyAQMB8Q61gt6DLfHtNBzvfReMPo7gyzv5pjmi2uyS8oDTpCkVy+UOfe6Wgy
	 LWlfTgPcxMsJrjAR5DuYdCQ4VSQNvQo+MqSM7/pqwxHbnyXZUEId6GGPaYbxPRM9xwdhv
	 F1qKDtifC5NX5uuDf0u5wW/CEj4eNkYdKaoGDaZ8vPpTTBzPnbHvQLCLlNAuS/FYJy8Uh
	 /YsVnH2rhRnIs4S+MUst7Qucak7lOnl2i8hKJGbFJ0rp7PzPoKMOmii8jIC6OSwty4LuW
	 cuISmuLW94KSkEnIag0sU+JrsINigfbfiTDZ/PrmugEubA3xgn9iGQz8G0kB+OUay7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
	b=HbL4+vkk6bLvMgxfB8eRSXSpnHqgBG2TEWZe+l52iTNfd/J2adlBZ12cKo0MTZsO5jez
	 4HaQ2wG1yU6Wj5ypeMerB6lsvFxfbkkXXzdDrJsnE5+OtpvPBEhCrutRIRY8MIQi0Ngzw
	 zYurEFg6ORrxrT4+zApm69GcuU9nx0Jz5cbDuEW4F5s/87oTIqJJBdOIByK7bh0Kytxoe
	 4SbvKAD05dq/FqSzleg6qlzs3DJYv7zmi9xOTwO35JcGKDmFCARPruoheI0diznJC99VL
	 yUG8JLYT/tPw3ytq/OVe/SkXrwSWbmYNcZeilst+JGCRewzs2LJOzRQK7j8C9iSMvKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bra1Tfpg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E75606A31C
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 14:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bra1Tfpg
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9366e87.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 06:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924485; cv=none;
        d=google.com; s=arc-20260327;
        b=XWkP7czTz2vIATmxE6CFnyDcFNkmEHioNFYCux4Qqduz4iH7exqt/2DDQMyKleToMS
         FKS7UwWMHuOvFmIJP+pD8detkQLyp3jCz52X/2WVjRsZYC3lYWOmvL0Mi1JSMVq3P6P6
         i39tYqv9SbhFPS9R4Y6WR332YmQf6VSWTTVwZ48gVtkEC7vPDunVGWjSD5lUUBeXW42P
         eoUIQpN/QYJDDrMqZqpnk+9Z1hth9O4zVCCqbA2UesmFsXL/zM3DDhVxjBLcC6zb8QKb
         1e5yArT1NGut9+ZXAVQkfeY/HGomEyLs2nGwvg2THNBHrjNf5bB5EyOfKfp48qKKj6NE
         K/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        fh=sVFjIpstke1lLZOFCPxmzoVcuW2tCsAtxJoI62qch20=;
        b=rHnvFTmavqkO3G5SUgJEG4VFcNytGnPb0AJFWmf/VWinuGNF+X+yXTSoeGx2RulXfa
         P7cRnQwXt2g4BZBClYUyH4M4R9MdLCanbaptyLz2NMDsowP7J8vjN3lZMXB7BmTa7dA8
         l2Sugawea3vlFKVlNXF1e7dZheyEckUe7CpUkpHwjdwBe2oX+uFBFP0WaIJyoJtcqGZh
         XY9Ta450ZCOaqaS7GvsGX9tOKZewfJIaJyx96WvJdfypDG4iQmjh7ea95Yk9w8qfJjx2
         jo2kNoNAVkXGfvYYB3GvusPFzegzHGR58WPmMH6aG4JajIkB+MABJDmeNQjVuBzx2vgS
         +qtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794924485; x=1795529285; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        b=Bra1TfpgF/h3uAt1nHVn0ghhaCuosHaQ14sCr0/E316wmmiMRzkc8Iqy0D5+RPQ7su
         00kG04zYfn872fBEY3vVZs2boAzMkygKk2isk+hYf/tg5V0xFJbpo3Ha2iPA/5auLzNq
         ythJWiw+IiKH4Be7/7WDcd+uWN1VxbPHjk3vAKKckrpo2BSPzMMkTFZuZfWFpTM06WBv
         4q9xkMadLycDiCt1L8CF3e5GoCaDCP8niGS1TIOLMVNuoV0AK/B/+jyJ9huuecVpMyT7
         I0uV2TRQBL7TDt8qrd7+HwKPcwnmga6B0mOA40Hzx8F7qeZ37DWMDIa882rw8xS1B9KG
         cplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924485; x=1795529285;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        b=IgRynbKJiEgrmdUcuN33bfoolRF7OmTiwtV2p2m81YXZlGrjaGMyPGRo1rNMqyVEEv
         AP/hwuznH/cfrdy7c1wiXzJ4FQrHF1Cjw+7qwkNWHOV90zmqFkhNHdmFBVnrevbNHGJm
         hxd4NjeJRH0h1aBJ/Xw0/nKQoLovdZQEdDEzUX+DW/o0eXJacgwepQJAkjgadDJO2QXH
         uDSew/24WiF4n08tf0pxfV4xyFrZ5qlzixG4Os37uKRTvxyAHLKWMUc5AlfCNXPzi0Dp
         +Ijq6dVUZrZDOBKocjdNJAU6gGhTNMCUaEQcXhWIEHES39t2t+aA26nV7jqpQJ7ATVst
         PSkw==
X-Forwarded-Encrypted: i=1; AL+hErEtYoYKbOfv0M22krwAVcTQ4qSicDIuoYBCuAwi4fn8YFds8QSqsLAwCLIO6u/cFRNs8fjh0yoCV0n+@lists.linux.dev
X-Gm-Message-State: APuU4Z+PHEMKkOzwbw4ovgcYB9PEFktVltPFOWdy2AQsOF+qQebWmcwd
	7iHBelgJJ8Bz42sH0juUI4kjiYbrAyy/sEyYdhR9eAQIIxnlEBIRL/ze6duqDxJG2/KhJ/WOiDZ
	bfS6e+2f40O/MFCdRDjwgklZ7JlBsGI7pq+jreaNu
X-Gm-Gg: AYBFou3czl9BgKwtpIGopMVN1s43h2rdf2VeitTKWO+StzXW2MfzFyNQi7Bzd+dxXWh
	4DAmMjuUfu3D3zcK6sSmJtyYVZcqA4CEn7yK3w2t/3jU1tbVgg1Ru0ajS12LwH02Hnvk4EN6u2J
	xIoAD90vHOo6darvfHd7F3h5IyLAHZvX/W3Z9nYZcOA1BQTK3cLWAZZE6vCA0KOIVvcxiMcHY4r
	ItpEBagQX0IOrx4as+95lndEovbSsJBQRCwv1YXY2JcOUvndOsYkP9xiQE0qqvp8bOn8NJ5whv7
	4EqOmd5bkA4z1WZaCgervgyhcldWRrslPtY5eHA/ssu1mmIntEgkiGhiVAESFuPVRZGUYuvacPW
	cbNcaInO3lPNRAfWLGCqifffCsZs4h8DnVl4Vq1WgQzvqJqdrNwUeHG/hVKAoy5/kjCJIWoYCr6
	HcGlDq2HMBCJxh+6pb/7BUZfI=
X-Received: by 2002:ac2:4e07:0:b0:5bf:f84f:1d74 with SMTP id
 2adb3069b0e04-5c1a2185fadmr137629e87.13.1794924484857; Tue, 17 Nov 2026
 06:08:04 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-3-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-3-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:07:28 +0000
X-Gm-Features: AclHuK_JC9RetKL5Q3HHKVX6R6ajyHm2xDLO6StGpKQMwUtLiIUPvzFbgoEna3U
Message-ID: <CA+EHjTwfp8p7uwP2LXEqSmTwL6ZHuDCYbvMie_Wr_30xJwfO6A@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] KVM: arm64: CCA: Introduce Realms
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 16:43:48 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> @@ -1571,31 +1576,39 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>
> -#ifdef __KVM_NVHE_HYPERVISOR__
> +#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
>
> -#define kvm_vm_is_protected(kvm)                        \
> -        (is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
> +#ifdef __KVM_NVHE_HYPERVISOR__
>  /*
>   * Accessing vcpu->kvm from nVHE hyp stub is tricky, as we need to convert the
>   * pointer to the hyp VA. With pKVM, the nVHE code runs with the hyp_vcpu,
> - * which is populated correctly and is gated on is_protected_kvm_enabled().
> + * which is populated correctly. Always vcpu_is_protected_pkvm(), which is
> + * gated on is_protected_kvm_enabled().
>   */
> -#define vcpu_is_protected(vcpu)                                                \
> +#define vcpu_is_protected(vcpu)                BUILD_BUG_ON(1)
> +#else
> +#define vcpu_is_protected(vcpu)                kvm_vm_is_protected((vcpu)->kvm)
> +#endif
> +
> +#define kvm_vm_is_protected_pkvm(kvm)                                        \
> +        (is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
> +
> +/*
> + * Rely on is_protected_kvm_enabled() check in kvm_vm_is_protected_pkvm() to
> + * make sure the vcpu->kvm is always valid VA in the context
> + */
> +#define vcpu_is_protected_pkvm(vcpu)                                        \
>          ({                                                                \
>                  struct kvm *__kvm = READ_ONCE((vcpu)->kvm);                \
>                                                                          \
> -                (__kvm && kvm_vm_is_protected(__kvm));                        \
> +                (__kvm && kvm_vm_is_protected_pkvm(__kvm));                \
>          })
>
> -#else
> -
> -#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
> -#define vcpu_is_protected(vcpu)                kvm_vm_is_protected((vcpu)->kvm)

This brings back the _pkvm variants that Marc asked to drop in the
plumbing series [1]. In the nVHE hyp code, kvm_vm_is_protected() and
vcpu_is_protected() already mean pKVM-protected, so I think the hyp
side can stay as it is.

At EL1, the pKVM-only checks that a Realm vCPU also reaches are in
kvm_arm_vcpu_power_off() and kvm_psci_vcpu_on(). Could they check
vm_flavor == VM_PROTECTED_PKVM directly?

> +#define kvm_vm_is_realm(kvm)                ((kvm)->arch.vm_flavor == VM_REALM)
> +#define vcpu_is_rec(vcpu)                kvm_vm_is_realm((vcpu)->kvm)

vcpu_is_rec() isn't used anywhere in this series. Could it be dropped?

[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> @@ -906,7 +907,8 @@ static bool kvm_arm_vcpu_suspended(struct kvm_vcpu *vcpu)
>  /* Only the guest's CPU_ON may start a vCPU EL2 holds powered off. */
>  bool kvm_pkvm_vcpu_is_powered_off(struct kvm_vcpu *vcpu)
>  {
> -        return READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;
> +        return vcpu_is_protected_pkvm(vcpu) &&
> +                READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;

Only a pVM's vCPU can be in KVM_MP_STATE_UNINITIALIZED, so is this needed?

Cheers,
/fuad

[1] https://lore.kernel.org/all/86pkxs2npx.wl-maz@kernel.org/
