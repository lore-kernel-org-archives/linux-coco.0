Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B614D5961
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645673; cv=pass; b=VfRDE5lbc1GYAOTPmdADroOsB9TBqZU0RFJjj0+0/y2WQm416gnJwrQI38b49y++rLO2mip+4JgNUalw/FpH3kPTmKGePe7U/KyezmSh7lF+pG8sYKPwuKIF1haN4LKju5hSjYfVofAKEmAt+LUSYAZ3REEkCyoF1/M3mRR7bWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645673; c=relaxed/simple;
	bh=FzFQy2j7fd5eTJJCXIk006/qLEE8a/Xai2F79n9BXDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3rHdkvUVxSB+9dssgPxbBqsRjGHn4mXpx7B81Tx9ry2UZQ0H5nCbxKjoa++G/U2qymVB5z2XlU+D2/Oet8PT8tCH1PTArNWbsXVPbkWTLH2y+3MYEXt3iscm6MCfl5JlsZJ9jfI3kWW07goY3tLQFWFYWNsoYwbLqlW5AnY5PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DkAzJqLx; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DkAzJqLx"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so1001e87.1
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 04:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645669; cv=none;
        d=google.com; s=arc-20260327;
        b=SJ+s8B3+v4FFLxaJmjirZS0b+LD7165qSvkdE9u+f0WPhGg+0Ie5414MI9BgXMdBkD
         rTyiaQfagTsQoRXVKUldyXwTZQC3Jd2WQHVL4JXah/Q/MEzfc890JQODkbUeOpIIYptS
         HsZmZHcKrC0VMItrq+a1Pb+tC3LD1d82eHrLPMl2oOLoQHSwZU6gInBR1aQdnVU2xaAV
         eCWzj2UMrfgxsSpQjnoNkiG3LkOCVp5WpifatxdSaB3R7YCov/HhnOWGeRpCGlS8xllX
         4YC6Ov8thOSeB8o/yTGHxFOqrKeQREvq1H2E50MOUc4nkLPmUGELW3yAb4I1aAiv52tn
         EwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        fh=Uk30YP1jYDNOpH5qMlw+7Q3IU0k08mZJ3TcJnwjGqhM=;
        b=FXfN9Q8fRAN/4PSDPIgA3ve5kjzqGd+DNyjeMfu83lKaf1TYRXRlAbMt61k7Td0nLP
         UkBAKSUkUWrciHAnA8C1l8Gm4n4xC/gBSY3VyBxWUQwoARiCg24TkBsEGeW7Tb+adPnU
         CUYcqvJQKTyNkTuowjkiduqe+fzSnDu7PaPhSASlxS08oekdC/R9A5BN7Y+tShBtgGxS
         Th8tPCmSaR/EuF7p/zR01Iat5t6BIFrWSsscZKqaJSwfNt2VJis7RzTMHKvpu2wa+FBa
         0yhg5Z0OD4MDyIUqa0JvNL4W0Dj37AIaz5g7Hvio8eIBQPNaK/2jawJ/yDgrOJ+Y64JT
         UXmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789645669; x=1790250469; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        b=DkAzJqLx5PBxOVP+7z9Onvf3mow5z+g+aEhrzJ7uhKLefOIieou8rauw1QkzndNxKZ
         peCJcEAXKJgOBiIylTYGp/5HuPgrHoVvBUNJjLxU4P59VDZP1NJR++DZUf+Q6IOkNVxS
         AWbOjIcqdnnjI8h/sSUuHYkg6cUHdUD21UwjC/a/JWqqwFXQImEq1QCgvWKEkEPqe/fn
         5dIZpVIXHBDFECdMouYrw8CXuQhcDJ47LyH6amwu9hqIzoxpPwt7SXerbjU5SieVyQex
         iD0c024igF9c9fsNaOzJHk+LlAW+Ose31fx6qny88g1rMpsjA5hK2XRfTDWP5J0yKI33
         CHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645669; x=1790250469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        b=QlHYVJLLeI+wICicFjncAFL4NN7Ei+xkByYu/WwP6vCXGmxTXtAcUQ1AqvKJz4Nd3v
         sSSVcVp3q9aOFz+af2LYfKQcUtESQzj9tKF0EtBdm9zbcIJf/Kx23/N0VmWBPtTkq/Wi
         ZPoCc4o5kjRGQdJ7gfV94/MPxBxaRnQF4+zPlSucu3qMJ8aPeESPq6NpVTzwH1oNOrLj
         ma4jbTwQgZJPf3fOXZB/rKbDneScm4FoxOEpajcfuIzf07huIYOKQH2IObYhVg4Iw92Z
         ToNu9YU73EpCQM6k0fczXjAOG1h81fb3oOqdRR7puXbCrecy1Wwo3ncbcZ//bBsjgiBs
         anGw==
X-Forwarded-Encrypted: i=1; AKwUvBz1yeuAYQ4lsMTfXafF8CxEXp4IZirjCP9otnL6YO9Z1eQXOa+vFHvRu1bJzWu0VoiHbQgXPg04VhLP@lists.linux.dev
X-Gm-Message-State: AFuF++nz8/xC7HySSY6WdCYlmyiO8n0jzYzP6dS3eVoRpvd4YDtuDf8/
	4a/zJMl7pu/Hi9Tre44PLZ9yWXHUZYzLRxgAElcRqZuc15u7iMO31o8VkIQLlStEGWnA9uCh3yE
	XpArRNy6JJuP4cfuOKlMdaZ0g57LbyVDn6PENuPVP
X-Gm-Gg: AYBFou2K2pjm4Z2TG0x+BO0IIivBt2UbKRdkjct5OyZ8Ah8FuUJn1DHbaNvi6gTG61J
	MASi032J3gtr6ij+yLjZRv52npxCuw0UUsi5V5Q1Yq1OHr7me6xUKnC7fnyshBMAXdiEH0bnrVt
	Nf6sEw4WcNMz1aZq81t6xHZlek77j0Vq8BUKJPkzQJXRKor/gnTviehjIw+mbJpceuR7ToTsKwB
	I2t4mXjSbr7zlhf0xacEbQ1W2E8GypM2kkDcs+XwNDwnkwOJYXYHVAlaAAivjY7Co/ioxLEDMp2
	/6VPwCbkwxT0Q3X39DT+KGC67mG+rkdudcoobC3AQTbaRsrjKeWjOJ4QesS8nfvPe+NC5HSu6pO
	6Qwxs47HjoDXP3Q==
X-Received: by 2002:a05:6512:3c86:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8bff2c01dmr18224e87.8.1789645668434; Thu, 17 Sep 2026
 04:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-12-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-12-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:47:12 +0100
X-Gm-Features: AcwNN1UOph-dvwenB_bEiuZFqzb6gytAI9_L8AUcm8oP9DDQEKK-aUQXatB0jDI
Message-ID: <CA+EHjTzOR7xczcb1HbUAi3H7K8ta=pFcdjxJb7UixZEh7QS-Eg@mail.gmail.com>
Subject: Re: [PATCH v18 11/23] KVM: arm64: Use kvm_vm_is_unprotected() for !kvm_vm_is_protected()
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

On Tue, 15 Sep 2026 17:01:29 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
[...]
> @@ -490,7 +490,7 @@ static void handle_exit_pkvm_state(struct kvm_vcpu *vcpu, int exception_index)
>  {
>          int exception_code = ARM_EXCEPTION_CODE(exception_index);
>
> -        if (!is_protected_kvm_enabled() || kvm_vm_is_protected(vcpu->kvm))
> +        if (!kvm_vm_is_unprotected_pkvm(vcpu->kvm))
>                  return;

Could the two pKVM-only helpers keep the static key in front? With
`is_protected_kvm_enabled() &&` inside kvm_vm_is_unprotected_pkvm()
and kvm_vm_is_protected_pkvm(), as kvm_vm_is_protected() had it before
patch 5, the boot-patched branch skips the load again for every user.
This runs on every exit: the old test is a cpucap, so on a host
without pKVM the function returns straight away, while the new one
loads vcpu->kvm->arch.vm_flavor on every host. The wide
kvm_vm_is_protected() can't have it, since Realms run without pKVM.

Cheers,
/fuad
