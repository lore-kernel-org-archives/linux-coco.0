Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B978151FCD4
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651046; cv=pass; b=hIreUbQsKdkhfgMk9cjV7o5jZgsgtymhDHlFMAAjg7Ek3J6036riQh1MAxU8QFo32pQbcMdN9uPkwgd2GI1mnCmvIakWNQ5jtSs5wA9tvx7Qxf5zOO1afcsMKbaorTGs7t1dSByhz4gM5dZCFnyBIcQTQ8qoaoWSq9V5hy8G070=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651046; c=relaxed/simple;
	bh=kO4HLKikSv+g/tlkono8w2r9mfJw0DOnYzMEnSqFOZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXi0ZN/RP/LNRKCvm8gwa3+35U7cGSa3rhZ8XeF0ml7WLK/eMiy+YIhurFzTOg0viG4ZvOxHk5pU0qc5isINw62YDDSfpL14NeRjbqMT6px1CDnjuDe9w5/lsMPgVg89AvITmvlXrSJ2EK31hd9TcFKGOPztSGFtvMarrqazLdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M1ttT79+; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M1ttT79+"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso1852e87.1
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 06:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789651042; cv=none;
        d=google.com; s=arc-20260327;
        b=c7YCS6aPCMp2iehVflVEpwuUwV7iVxEH5rFA7gVEQtsGkpycEHT1EfYFiXiAmJkl7f
         jeIpZF0pbweLbZArBCFZ4h0RpuGVdlq4IdLy7zcEYHFgifUxseySUkEViD/trv76+9Tt
         f2J+LE3YbE7Lq0yVC1PuNuEN1Olbj9BfU877EiBVmjRG9LPJ4DW6TKK/MJ1hd2x0E8gv
         cYe8zogmq3keHam7wPs0b4r56iypzCmd/JG0THfrqIrfWupfZIORy3xhD1Dtc4ohUrMI
         I5rFlhnT/u82kkKtbAiZ/1Bp+go2GYhKFNd26duAKb0QuWoa6R6pGLejGKsJE434hTsQ
         e9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        fh=Jj0pjE0Wxkf2erOcbq2uRCi8QdkVDcTq9Wm+C61rbFw=;
        b=RgXqYr2iglRy8vTsTt1ihqfz5/W5eNOZ+RuPRlKzAByXWlmjb2Qo52F3rantkLEerI
         ge2KKdEbgWIz78R+hJ1aGcDktFDb9YFPqZdPjYb/Q5tI2gM/7HKoH5Zy9pk1VomQmjC+
         OV9IkqzcHcc8PISSb7kDpvxTfAZ3W5aeAzAgPsoyk3IAZLXuztM3B0mNZDD7Y3a9gdtr
         nQzDsMrQEHrJTg+9PBQNwonrgIW2DhOEzGRwcCYfZb0jWVb15DUDbt3fe05QpFpLWQwc
         IUVmbBcmCtygjL2merWcb7a3LTee2z9x2BKSgjZX44Ps+BQe+1/tBZYEHYkNMmexcPB3
         ONmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789651042; x=1790255842; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        b=M1ttT79+L5OHqipV5A/SVZBeZwxINuz0MShBgki6MtoauOuuni2ywaRoQq5Bx0Kc10
         KKb6KmxvIY4tbPSF/8zR4xI1/jmgGh8rlTw0cGgoCZqWWCqOkgYXBSOZYseN44OOPfiL
         mUss3DmTadB8ZkrCIZq8DYlZX3uwxLzz9Wx+Wy/oyePSjVMcc663Lu682mqKVzXB8toF
         Vq8Cv8W/N/4dmEq4il/Aa22Rdly6qq1VWZbDYRhQrxI1RItgzrF26+NGZTOnt8v4h/+u
         jaeS25LPr8iPGhuJKSjsb+bonWP/ECNK2LpwP6Q3XtYLXe1VLR2/2F+gsAxVguKpPueR
         snJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651042; x=1790255842;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        b=lfNh9l3ePQT5hiwHUZdWWmHtBWqQNMkQQcK5/uhdRYPzVkO4haj0ss1zgOBWk/Gxap
         dqwA7SaXk+SbI32NaxyCDPefGucNwACf/ycg6to11K5N8Iw9dW7zjr3hbr5BBSF4/23p
         3Ld42/TnGPsaMndXb9C7ONQzkJ9HCxLDVGjEc3C61R54tSdU341cVqs9H/OSfD3vzYxM
         UZzguGA7qmHZ2dfBbkTiBf2Sv9DRslaSgyc84hh6rLWsT6YkDi0ZaZseLk2cxU08Fgue
         yYgdqy/xfuS3BHd6646FXCSkb0SeHcasTenY/36QDe52QhOfJOUe8YM+9g0d9Gdo+zSy
         RjwA==
X-Forwarded-Encrypted: i=1; AKwUvBzKUBB35xtRpjQidx/iFNwi+gqujhqAopAiIK4GSANTDyymHb0AsCWGZvryZqJ5N3BiD6TMl3AGQ3Ft@lists.linux.dev
X-Gm-Message-State: AFuF++moJw9XFiQ/EX1P7CbLbEyaXUBcsl1Rztd+gWQGdqEOp6NpAAfR
	HLieL/jvlmvLu+xvsbXHcE9Gl56he1sVvhwxawkA6iv04MAIRcn8uAsFr+M7pqUtQDH2lD1ske6
	6+eInOcsMiTOvPb6lffXeCEp4x2y1SBYkF1oPL2wf
X-Gm-Gg: AYBFou077vrai2krv/sP2M664LtAZTKLtZxBxZ4MVwQ8TnIv79hD2GIJTfx5rwFt3bZ
	7UTdrmCV7fKbduGCZNfmzcENJ5uH3hINVEj2M+X1Imnu2atcnYSqsagwT/Z0SrDPcIXKGbhOgrm
	KBzEIUKg7lmtA6TRvN/+lcxNpEBQcSBo4QpWE50DNhecJmp7skuMCpamAbB1hYYx5h+4YoX33fM
	vPTz8cHtMORxEUCwyg5XcZfyKjVweWB2i5i0lDi5cz+aF1HCDJSVbZTYqwPJIkct9ypYk8v/gBn
	5+gods1VoPCYB3XDKInLZVZafO9yRUjwC8tcbknn9vl1k2f0LMJqSfHV4e5oRkJ6fI6if+GWHXw
	m8PB2oeOCY/Q9kA==
X-Received: by 2002:ac2:4c50:0:b0:5b2:8963:e5d4 with SMTP id
 2adb3069b0e04-5b8bff1d051mr39681e87.5.1789651041084; Thu, 17 Sep 2026
 06:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-21-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-21-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 14:16:44 +0100
X-Gm-Features: AcwNN1VtWWKyrr6h6sFHMUccgZH0Chs5OMidTNSOoiZ_fDx_6ZmQhtU1SR2DO2Y
Message-ID: <CA+EHjTwYqTFzGdNPproWW5L6j5pNqmuWeFuu9HbHa8LBLPvY2A@mail.gmail.com>
Subject: Re: [PATCH v18 20/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
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

On Tue, 15 Sep 2026 17:01:38 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> +static inline bool kvm_realm_ext_allowed(long ext)
> +{
> +        switch (ext) {
> +        case KVM_CAP_ARM_PSCI:
> +        case KVM_CAP_ARM_PSCI_0_2:
> +        case KVM_CAP_NR_VCPUS:
> +        case KVM_CAP_MAX_VCPUS:
> +        case KVM_CAP_MAX_VCPU_ID:
> +        case KVM_CAP_MSI_DEVID:
> +        case KVM_CAP_ARM_VM_IPA_SIZE:
> +        case KVM_CAP_ARM_SVE:
> +        case KVM_CAP_ONE_REG:
> +        case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> +        case KVM_CAP_ARM_PTRAUTH_GENERIC:
> +        case KVM_CAP_SYNC_MMU:
> +                return true;
> +        }
> +        return false;
> +}

I'd keep KVM_CAP_IRQCHIP in this list. api.rst has it advertising
KVM_IRQ_LINE as well as KVM_CREATE_IRQCHIP, so the cap means in-kernel
irqchip rather than GICv2, and the GICv2 case is already rejected by
patch 18 in kvm_vgic_create(). It also keeps the two protected lists
the same where the support is the same. And could this live in
kvm_rmi.h, next to where kvm_pkvm_ext_allowed() lives in kvm_pkvm.h,
rather than in arm.c?

[...]
> +static inline bool kvm_arch_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +        long ext;
> +        int r;
> +
> +        r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +        if (WARN_ON_ONCE(r < 0))
> +                return false;

You told Sashiko my fix covers this one [1], but that fix changes
kvm_pkvm_ioctl_allowed(), which this patch deletes, so the `if (r <
0)` has to go into this copy too. The guard you posted for the second
finding still leaves the WARN reachable on pKVM and Realm hosts, which
is the case the fix removed.

nit: kvm_arch_ is the prefix generic KVM uses for the hooks it calls
into the arch. For two static helpers in arm.c, kvm_vm_ext_allowed()
and kvm_vm_ioctl_allowed() would avoid the collision, and the same for
kvm_arch_vm_ext_allowed() above.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev/
