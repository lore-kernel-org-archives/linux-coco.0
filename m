Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C19F559315
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959971; cv=pass; b=ofvUW5xhnQbWCy6nJR371i6Le31U9ZW6edH1ka4VxAjQbf/ruiFvrgPjCVvFMobgA+DcfzJt7tfjpNk2E5dDn8HTbCAjj3FHtoJiU+nTnz7lKSleEwEjorsdBb4dE569me0tH6i+Tu9FxH2wGhlQTVgM0cLR6FsyhitGXkIdp/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959971; c=relaxed/simple;
	bh=/lXKMho56Iawzotjf9gqPSSOK8+fhDi4DHNzWXgEKCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cn7JK6b+N218FL7nZ97SLDfoR73mrDQwxlSjduVW8G/OCFAxGyodz8Hwh8yO+H7otpUz1hsRmqmqgcVqbaY/MqN9u1tj4Nl/LXOwcluRMv/gUWklBJ8OLamg/G+h3/YJ4K/E8ZllXywT3U0trmqyh4tItLSFOrT1RSvsu+ks7Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lR88kbvy; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lR88kbvy"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so6952e87.0
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 06:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788959965; cv=none;
        d=google.com; s=arc-20260327;
        b=QIg15FoLovPVcPyb6yA2PqjbpTTztqFUySk6yWQaGcj62i3YrcZr6ujSeo66hoH23z
         Lh1dEWGnmb9TuXIX7tHMmUYwkTSvVvQaSxXjFfgk1d/z6XRCglJqPVmeYFdPO9iLhhGl
         h+NPxM/k/pbasKIoNqe1emj76c08pEgCQ7212q70/mnPNguX7nUD1/geVV9Qcy+ZfBDr
         9cjPfz4CR4x4/HplmiVzWEy7IfKA3tPTfpH5bscF95Zswg5gNZmDfIF+vHdGhDoyLsgK
         e2/001V2xT+9mlx9eYUbwFQ6M/pRaRzkJcTg/HgivAxQYFTy7YG47DiDNY+j83+Jhxo9
         QOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        fh=pNE8JwhRLNhWYrT/kbzZkAIQXs+U8W62oKzGypIHrNA=;
        b=e0t7IKGIOxXLF1wFVyO7QNXoLmdzLwUcCLLZjb9RSO0/0JX2fuHsd1nEIMyyzuUvjp
         bsENHaenOfs5MBnjxo7ESErtbdOPLyDOVOIl/xhB/z8TWGT7GSTDJ8J/3jQLeIiIxqS9
         SR4NmTHd3e20+BV8rLwnmSg0G6MZ2maMyed9+YkfKX/XDx+g5MFXs891Uow+xXnOQ4Ob
         MosgCJS0NE2BFJGxBWyq+WjGMCohPtq1tgXw6ZfqR3YQnxqMFtHqehcw58S5msUjnzOm
         QLNCekdR1uQD9VMIomVZwNkkN/vYkTpj99vfkcuRKFBtreORKQTQ4DX9uazmpggX+P6Q
         Xcwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788959965; x=1789564765; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        b=lR88kbvy/xMvM6qjtC5ojivt05zJeNE7ZrqxQA47dTAu7DM9PrGF5Bact19784LiVP
         xWQZQptZjvZk6UgVzgGk9rhzDJ6Hf7gaFMVR4e03m7wVW5Vi8L3Bq8pz6nEGYzY/CsXu
         lW5hdBi1M9K/M7HZRvUJIqTkVayo1msXwvsH60NS9lsxwlHoYivsGbB32MV3WaRNGjOe
         zt7rCQLNzcIlW596gXyfkwl2pXuhmKvrN8hM7zhxpKIvuZ0+nIHvMOFFQ0jOUbH1VyX3
         IU6fhKfyL91uLzLePQgQtjliHPGcGmVMN7VLbhNzvW9edgWUji1I+OExWfkzQY/yAl+A
         5h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959965; x=1789564765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        b=L5c5zI3Y3ylBNCP6YQp9bAEu09BCuBFlEkDGSSXSKISCe/HpRux9LoP1/Xfhtd20Ph
         b1Bbvo7UDG78PEfAnHJfEFtf0RvgTk/3QV6yoT/slM5zu2C2L5nEEm13cnnYdZm2oMfo
         8lmpSjZRiHQCcso6oWWQ4u/6tg9kOUyrhoDlWfVhgEHqQJHga3NcjwxoZF2WT3aiS0GZ
         /W6VKVuxAPLFGADHgYyzDF+TG+pwX7LzF3NYShmBlHnHzXB4OpgtGEGp/SwOiM51qxRR
         KeBDeg/DjyTqBuO3T+fqNCMnaEKHf+GDV7FB9Ds502q8M0nk7oAsKFDGWUzR+YWvfgEu
         hu6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxSSqupROlEMsEl0lbnwQTf0uLNw8GccKLZLaD6Gd+G94kmW8NP0hkJMurCr/FeDgFAA2jPfA3GfFmu@lists.linux.dev
X-Gm-Message-State: AFuF++kLMAPzWucEzjdQ7sHKQk+t1lrNTsJqLIX+8kE0PfLH5/t4uL6d
	A36KWCCIbZlKOhhWQ4jImSgvgbyEL3hLTHmVbaITyLsj6PpwzBVgLhAWSLjh7IRSCwGChPxtfug
	igQu4YMvWx8xpHURey+1JjuLckA7OxJu476FaUy+W
X-Gm-Gg: AYBFou0qfm1kJ6FmDtiD5XO4rabbSJFDlmC2qBdpe9n78fxRd1SNlT3YD35OycaPBr1
	keutIJz0+M4TVpDET6zvqU7WWE7cJvRwZQR71e2Kq0a7po+6PcorF/qjtPvw6jz08UYS6RqAOwM
	YqcZJelH5/ee9/rKf6dOf28mlptUwoWHkdB2CNKKiiFJQkGHV7OXb+/d6eiQpcp52O52eyLEWiy
	jmfdZfAi58A5tQQticmhosOpN9tzGeRJH5rJOfdp2mRe5vdmaMD1Q+Cd7G4ZGQPFv0ygLAs1JgH
	sz+h9oAzrcro5YOh26JTWOvgRd8pZEc/JiX2QVIjB12jhOnA3TG/VPNIuZftAXJjAJtw9FikY6i
	x4/Gfzg8q6Q==
X-Received: by 2002:a05:6512:234e:b0:5b6:bea:f091 with SMTP id
 2adb3069b0e04-5b764bba2f4mr141895e87.10.1788959964067; Wed, 09 Sep 2026
 06:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 9 Sep 2026 14:18:47 +0100
X-Gm-Features: AcwNN1W9J0hO2XvyP_iEth4oT8xwRLULtx1NyAOMY4yUoohn2-IYZWX_G_vBhiM
Message-ID: <CA+EHjTzr-r1FRuJ-X3E38_SSHsNSz_vdO-8sFOtBdsiB3V_x=g@mail.gmail.com>
Subject: Re: [PATCH v17 00/20] KVM: arm64: CCA: Add basic plumbing for Realms
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

On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
...
>  3) NEW: Enlighten KVM arm64 about the different VM types and use call backs for
>    the VM type, rather than spilling the is_this_type_of_vm() everywhere. This is
>    not complete yet, but it is largely functional. Adds VCPU and Stage2 MMU related
>    callbacks with support for the existing VM types.

A design thought on the vm_flavor dispatch tables. They're
hand-maintained arrays indexed by enum, and a gap fails silently at
runtime, not at build: arm64_vm_s2_ops[] has no VM_REALM row, so a
realm VM would get NULL ops.

How about something like declaring it unsized with
BUILD_BUG_ON(ARRAY_SIZE(arm64_vm_s2_ops) != VM_FLAVOR_MAX), as
host_hcall does? A non-NULL check of the selected ops' mandatory
callbacks at VM init would catch the s2_ops naming typo Sashiko
caught, where the rows point at zeroed forward-declared structs.

Cheers,
/fuad
