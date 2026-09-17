Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC74D6C2A
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645917; cv=pass; b=nVLJQB2Chs899XXRuxH07k0wpc7fZf/nSdmKDlkRBW0CA/mAEg/loJx+3MxYlvaJ3XEOgsk/mN3+jARWpYLOQU9FUGFIi5NH+Yk2o6tlXhQYmfkWkdRDS5LJAf2h4kYgEFhU3E965nmFDgV0PPFcjB3JwfTUDer24RckWeo5Loc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645917; c=relaxed/simple;
	bh=nOYhv3codkqkgw3J82tO/HjCMv9eP9bGCd7SuCfawsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDrQK9DoHZq39DQ1YENxaWF0NvhF02r5Y9WngLxoAc8J0cVZyK8D+rXniMtn8Op7Gp9qXsPgRi9vwapv52heJyTsea76SeC9uxjs41SsEjh1fhXIreRVhbH7LbHaWVN4Tq63WhwnsU04D3QWlKx/OcrxI55SkqVlwwyZPku/F0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C+apKge3; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C+apKge3"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so1051e87.1
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 04:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645909; cv=none;
        d=google.com; s=arc-20260327;
        b=GXUWWlsNoaePiPKjrtbnnre+fNVRqLry1p7izwbABYLA0siHdZZhKV/UJv5W/zzeNc
         UFcuEPeNQVkB7ue9emiwnAtfUPbyd8sjp70anfauYENRkPs/oB99FES6Nc8liPBQro0X
         9gCTj2C358XsIKmlYWWnKLo6J0Pwrfq393cXreC6zBaqD8fvcUGpEGMmtZX/N8ByFLPC
         2xyKpaodRIxAmDEqkIS59OCUW0WDLxfaCeYpAastAiR16nEHN/RnDlkAtBqBU4Oez/dE
         ZVVY0euOup9rYmqaODPcPTLKiCj3hTl24WGaYeYNyYHEKCjAdV36J5vaRiIzmR4obbug
         nJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        fh=U7dEKbqr05jGAQcsZ3+IKVR8m5paOcoT0Wi546AbNkw=;
        b=MERU4nXZT++kr80don/OOqpLiVeNtoX8eFVdU9Vfq0SmIDxXzpUZDT3Pyenw1VLYi3
         AmtI8tMT92PI8JF3okOwe4OoykGOy2RkbfvLABeIT2APxkej3LjHoalZw6sSsSGf3w0p
         Lgitesfi2HHGfh/ReMmAmnC7oLWw92/3bLqDUg/yqz3O5qu2bWMtyooW5cYOPY++IXtD
         kI7gxNY/qVyVxLQjfwfDvdOFrrxMEMNmPQt1YSGhou2JEUedBD0xfUN8Rg6dZo/Drlwx
         SIbXkWubceYIzMJ0bbhvWuemguI9V4P1zGeJjH8R1kGYEkv5EckYETdaJ+RbK3hzhunI
         hO5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789645909; x=1790250709; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        b=C+apKge3yhajv1PVAy5GxKYLPg7Cbcge6i9zCVYWx9UzWijVRLP3xal9cdVAKh5BcK
         EW1ef0BNeDmHiztwyv3pu+92HbfIfxmOfb1E4JzKBXKRWgFA5mGl0G82CEayXLb/+3F8
         yDqBfr2noKQ4/gKC+n4oY3dBiUlgREEbcJKLalkAFekZDLx7b/Tg6JyXsCvDyo6lEGpu
         hwCLttbMIdXL8PvEWzzGsauYRZ8Bl+lnFhC4896EiIyGd+fOFQGsBiZY9zamHSJhbhVr
         wKGhXERbzoHgzL1T7F3afPyw5slKKVN8hY/6moPJ5eKu7yKmlgjVQmtHKWyzTA2+EMcy
         WzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645909; x=1790250709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AdIwW+5qYXXR92NXdwAH/Idy+Qhx8FbslhR3tYZnWQg=;
        b=rX8IMTv7VZnq+DNr+L0knlBB5hyvv63xGklAat9E8XwsbfzWQiX8HVrG7eveefE6hk
         9Ie1ZmV6lo3XrTGn8YlVxBBE+yOTU1eZnZzchkq7iUuLbGfYUfuqyh0aodFpbTezWQjT
         s1y9nZYNFUNrNjkzSIRMolBVCS0ezn06yEalFctF+O/aOJL654LuW2SGF2t7ck+vc04h
         6biUKH6w8l2V+7ebe5lXQm2DNUdry0gyLlsmbmwFilPGLlNmsZ+abeBV6f5H0QyFeP3q
         jb29ZJwz3UX8g+4e55L6LFKpSwCkYaZ8FMkJR6ucRWFHpmQ8gOj1eAY3cxkFMNUX6/o4
         mYMw==
X-Forwarded-Encrypted: i=1; AKwUvByUYUkH+g4tj1c5Jwqs72CS7Iwb4GDKjQ/dxnKvFXSuzFsVF3PZn971hMABv3JcnAsU8AA5ctichU9U@lists.linux.dev
X-Gm-Message-State: AFuF++mNlDsmBaYvHvah+FFWqk2sb/sdTlpECFMt8Vbn+ZECvAfYJn3e
	K0EGoLlYuw/vcHutoaIG5uIePBO+QpYAaOKCDBKRwxQwaKw64ds+oFuzeg/qg6HbdtNm1QqOdEF
	4lF9SUzROP8l8DXAYojcHzbn0H0dbDHL5Ebenc9fw
X-Gm-Gg: AYBFou2O/l7t/ZNpklYpk2naURbIcu+o2gRJTOnCZLm4VbZoYp5uuHKn9+FHoVGKZ2C
	w+v7VWbUR0ymL+D/cbFpj7AQRHqd+k2HAsEEHSHgQBtTRThjouTuXoNBS09UzDxfJbjgVWuI2Rd
	cLoX1RYIWgkMug1Xiyb2BOrM0t+iRiLALVktedZggCS+thnruhHWGK9/3HPagxQJ4KQLrFVjBpy
	1tjfbsSva9z2wNuC+M0IWvy4ydLIKeVY7bJvAPYhVaPXV+6vu/6ZBOqtjXd5W6OMKaviciODBAZ
	YT9miY74DwGYdPzirRRlJGF/3JSvNT0zTTtNtaz8A/v+MjYAVhpfewgrDRKhrnJjx1Dz4Ny9bmp
	xfJOJxhKYdJtdCg==
X-Received: by 2002:a05:6512:33d5:b0:5b1:5e30:ab4d with SMTP id
 2adb3069b0e04-5b8bff20394mr25749e87.5.1789645908458; Thu, 17 Sep 2026
 04:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-13-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-13-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:51:12 +0100
X-Gm-Features: AcwNN1X5WP4Na_O-dNFd8fWbgG-HeOkWBxaHeAYarJjcpr1hEP0fkdn3TrX09z4
Message-ID: <CA+EHjTxfbG6-LPjJVoErQ3iJk4vAvhVO=Qv6hjcxDXL0yByiQA@mail.gmail.com>
Subject: Re: [PATCH v18 12/23] KVM: arm64: Widen the scope of "protected" VMs
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

On Tue, 15 Sep 2026 17:01:30 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> -#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
> +#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
> +#define kvm_vm_is_protected_pkvm(kvm)        ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
>  #define kvm_vm_is_unprotected_pkvm(kvm)        ((kvm)->arch.vm_flavor == VM_PKVM)

Agree with Marc that this belongs in patch 5. When it moves, could you
add vcpu_is_protected_pkvm() next to vcpu_is_protected()? The pKVM
host-side series [1] has vcpu_is_protected() checks that are pKVM
mechanism (the vCPU feature allowlist, CPU_ON against the pKVM
power-off state, the ONE_REG rejection after the first run), and with
the wider predicate those have to carry a pKVM-specific name.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914113338.159227-1-fuad.tabba@linux.dev/
