Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E47503BED
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649846; cv=pass; b=Jb6XZ0S1o/wsfYEX9Ibig2TfSd1exOcLQxOCiCnwPXJ8HYWyE2TywdwA/sRpdPcRXzYcuUffjJa/+avfXlkQdxs4XBLu3B+N/qB34kgp2wkVBRt5WJyA7RoIGzEErdEp4s7xdX8jtP/0KR0kzmzK+X3WzlMs6B0OvJFaMqDeu3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649846; c=relaxed/simple;
	bh=yjGleyBftL4mc4+T7OaOkxuKfXAcAseCzpwWbCEkYR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHP4xPObtpu///SDzcJU1xfqpM7eONIVqQ08yFW6ceOmsOWfvJ/j5tG1P7VhCUUgWsfh9XenF0s2Oj1NCiRsAsJIkkGYBXq/AKhIPmyhAmHx+xUS2sMrAWjldNWfVaU+8WHCJ7bAxZOTtIzOjUC9V5Z9QUomN5P+s+3xOfqbLkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rlcACcQu; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rlcACcQu"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso1629e87.1
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 05:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789649840; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCHxMFHAfQLRVmM2GTzHpYKmbovcECOT4xvQgPJ5YvipcM+hWwg7hKArWQM9tyhkUP
         c7FRt+UVlTOaRmFQgxrqhvmeQaKVfgiGGWY6CHUzyYzVa79l0XBkMvf3uhtIHfMof9EL
         qKfI83NjTi7cfAmk9j2Ra74BjWaI4qfbA9/rrpVFuln5P3gdrcJh6WQKO3k5h/sjAp84
         eYSUqdlBQnij1WgXCL6AwxaCkrbuBav11jErX3rMgAhqaJIpNCnvME0s/W3l4l1JtQFq
         CoMLQWKhYeSgWpV6SPeWVvjKTVFzPpeCkUZjq3EInniij3k8946bfOH3Pk2BfWDv+LTc
         uiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        fh=6bgxzaiOXpOEv6vGg6LEOxwIewSofOQj7HS5s8cOrZw=;
        b=RslrVHAINRnpj6kQhb7o0KCgA2qgt1ltfPI5BDNU+ofiK5awdCJW6nmlARxHh/nr+5
         5ecz2oUub317mKyvCF3GzIXoZxf2b1vzGqWQKcVayCh19P7G4Cy97mLiHpinAiaioLEu
         dAqIqa8Q7IOt4lsvDSStrw5y5mTRa0w+7ftiAhUxylLQhAHaAOvq76UkcnTbnYJdFuSC
         I0QK3sn2ybidd09CVAmTQ/kwsloD/XOOh024RA7VfX3dWdetyqg6ovNkZkdCjcHPwVJ3
         8LJKVHJFk/3LjgFIjSDf32Wj1DnSZ0ve39+cM7MNVPF2/lY2FdDX8qpzbk3y+2Jpol+r
         nqIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789649840; x=1790254640; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        b=rlcACcQuIZURHu+UgUXo15rg6D4xY4BtfJNAii0A7W6jN/HXlq5rMNoVyH6xNrM0ci
         16rVthC7T204OzNOBcrudWll3GDLEN8Y4Y1vMpV30V7fz6SjXEZyGI+yTmgeHKcYALDC
         VDh4h6QIBBSjeJu5APurH0rhoGW427ZB1smBUgS2ciCCQviIYji7Q1ZnVdSpevSbz1e9
         NqV+sy0Z0qlph+Q/0Vb0SmyqrhXrcr49gL8xYRcu7c+LSVBXPNQ8n8X4nCtraueMR3c6
         S4CEt8B5XPxPbz6m6oeubnMPETPx0wScFIZNGd2G2BVQLFlRWVADTtnTQEVEeAo4DIeV
         cspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649840; x=1790254640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        b=2fjBjBv4yEFIIcpAw08h9kTwbqts0vUsorQXxtXFcwwutKY02KzctC8YVsVX/8HblS
         GkYB2yAtq6E7BDkEsM3Pz5d/ouSEFZfcuR5NURvILT7B4GQp9CoNZsWyWlYtKFHWyio9
         vQVkdq1fbzNE2+/NmTz5Vzw/Tw2gbu5THfKO0If4eW+X5BWPBbn4AJLFkZIEphNoIGzO
         OhPwuSemvTect791hXaZDpQQ/FcJtTByS3Cd4nFyPdHZWCwohH1MuuY+/2VM7hRor1jV
         9hvtneO5FbthNG32oellMC97Tmb8YWpIFmmsYt05Gt92c4T0R6h0Ww7FSQR/F7VGVVLU
         /CCg==
X-Forwarded-Encrypted: i=1; AKwUvBylPMxjH+ZMs601VRJNRQpzIvSU2k4z0STiN9gpAS+3sqw5T/I+L9PiWoTXtHePtcmHiiI75GItwwsn@lists.linux.dev
X-Gm-Message-State: AFuF++m/iXyYa0KQh2vxDtt0AIG8yY4e/Zi9Fm0jd0MA/KvrbiR8UK5k
	ptQaG9hhdx4W7p7OEXnyf+rTSLBzyMEff0uH8RvmYbVvNf2JqFF1ENINg76obFp2TXTfMlhEb2u
	qYcQoyN2/aoXmgQBiboRAkvfsC9uWwaAKyiFFfFap
X-Gm-Gg: AYBFou3Dxvr7M7nMRgy5Hee1TsqmdkzDZIyHVuYJ95GvbGNEaftldxsstACbVxqrloV
	XPHmrpJJ2Rqy1f+paV6O+8S4iDyh3iifPF2QXofSRnihedQ32ItTeElZZnCYmZuTShg56hTmJjs
	pVIlHxgcU9gDW/B0NUVdAK7yNaM9KUtmDuMj7hbm4Nh8rTwP93ya7vtEvdcvAkwz3hAZBOrMlK1
	k1bUTsjPi7btyoDhvjP/hB4ofOSssx/mVd27H/N+TAqhmYYSoQoiS28C44SdPmYAnyzh1xJQssf
	MxWG/u7EkVCqX9/ep297N4ruwVYH2iIWmfP/vGSMNSyrRV1rA/r12yz8/UnLguQvOaBvACTqnj9
	4rb70E4VsBCzR1Q==
X-Received: by 2002:a05:6512:b97:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b8bff16793mr25923e87.3.1789649839151; Thu, 17 Sep 2026
 05:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-19-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-19-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 13:57:00 +0100
X-Gm-Features: AcwNN1X3rwZaClpg5QtpbmDuAi81nkVt-NA4XEMnqdzMUr4WqSiJJDooQvLcWZ4
Message-ID: <CA+EHjTzKjjEuAuoOuzGG0uKyVZE-r+CEreca2H2kEQYuRPpgUw@mail.gmail.com>
Subject: Re: [PATCH v18 18/23] KVM: arm64: CCA: Mandate VGIC_V3 for Realms
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

On Tue, 15 Sep 2026 17:01:36 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
[...]
> @@ -84,6 +84,9 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>                  !kvm_vgic_global_state.can_emulate_gicv2)
>                  return -ENODEV;
>
> +        /* Realms only support VGIC_V3 */
> +        if (kvm_vm_is_realm(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
> +                return -ENODEV;

Could this be kvm_vm_hyp_is_distrusting(kvm) (with patch 13's compare
as >=) rather than a Realm-only check? A GICv2 isn't possible under
pKVM either, but there the v2 mapping is only rejected later, in
kvm_vgic_map_resources() at the first run; this would give both the
same -ENODEV at KVM_CREATE_DEVICE.

Cheers,
/fuad
