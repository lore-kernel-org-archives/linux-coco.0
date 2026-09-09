Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AC9538D7A
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952850; cv=pass; b=flxoycu9qJEBdiagBzPfxWpKH30EkJG5HCQkrcnp+4W/2+HWu+DLuQxRrtj84o8VW+qalMHYSMvWLmDhFeF5g78GjsStCvplddJlM9CICQEgyhN0U+8GtoGeRaTZQU+RYx2bhhmrdMXQqedCrA713uIldNoxuK/Io/54pBZh1s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952850; c=relaxed/simple;
	bh=DGJNGDyqk/L8FuMkKQ9UZ8lh0gD+ZC6OA/bClDuW/zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5Vkm9C5z7SmfJSS8cFMHxlIkCK0NQ75A9OQYyyTdY/jMnNp+7Iuo1jxQ5T7bz1ebVCA3SCbsDL5Twsmtlx8R1iW3+9xXDkdAePN9qixowczRNrxSgbjl9QKLnL2vQAJ26/r6xrn3BlhUyxGiOMbP8LvE59hG6JZdG4aXQTy1TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aLST6P6s; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aLST6P6s"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so5824e87.0
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 04:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788952846; cv=none;
        d=google.com; s=arc-20260327;
        b=OjAbK9A/fKKRfI4A6XxmSTRPiSklqAmgWwnao8CC2yU9D+sABeghuWEQWFJR7TnKAk
         kMGwcgte0+8ofnkLmmxNyxIcmvrovMyojEcAQkEbzuGkNyDgEF+UOKdeoS8e699XnzZ8
         e2jhKPPDH44kkVzb2fcfUjCGDGWmd3lQGI0n8KUyUCmwPqeCk9xhxii/GiaccK+RMQXj
         n5pLHJ4DbUT0IX++TFMFrEBIqdBvU9/XRP+WCPD6rsb58hTHuganpdjwTJw+2Hmun78A
         ubMhg49hLxp6b5OaSjGO1IQKonXJnjeyH50VcuzLh8iiNBbH5tQO5uRIxh81zPhkyWGC
         YMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        fh=aTUsltASsomUWolYTvDHEEYeMDZwpS8x//2uwbcA9ZQ=;
        b=a52VuBXYDRXptMAOklCxSgYZ2zuo66v9jy6AGVdvFhgNtv3AGjdjFCe2QoHhLqnJqN
         8ew6Z72+7wriZe73Cfdjvj8pAVIXMlPkJ0obWO0m+qfMGPZ8LRBgTMYKbLXvEVdRDH+e
         xe1WBwsYrXkNWO5GCpRTgEj3FR/TsBCGWjs8+eaKN/RsRqCbRdb+Wnx9zNypLeJlihV/
         Vhi+JeFNAwyL0ed1FUNgoBKGAaxXbtVybEkhf/jiEbgq7vayU0o52/b7nii6CYehCrfw
         dafRienKDafoFsTmsR8i5i1Vr3W2nC7/r1O8PBdWoWHVADVzQ4ev4k/WjobY/Ba/SF0a
         w4hg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788952846; x=1789557646; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        b=aLST6P6sDSJfMaEsNYNMWQ84M56STSofyFPZSALAILd3NlLX4/6Qo3uD7B7cX/B5Q8
         g+WYDJrf/Kq3/s9/uiIb0C6EahhOVzKvlBfutZ+J0iD6bjWl9oAaUe2CdAOdYGQkHvUM
         Pggzo8jC3IamvfmiBWXbXZwQ8h3lHbEnR0qm9mOkwyPnr0EOlBtUjgO4DcuPzPZgQo36
         qVVZBv78p7cLVG9CQmTXZL/QxtXvg9csCY5BPRWWKqiKMF6JoTJUCSKvNih8if4zLdJP
         NPJgVwDn5g8EgjjYeys0yL17/UUQAZvyv13hznEkdtVc/q4XeejhXltuvHG5PAGVFRXe
         QM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952846; x=1789557646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        b=LN6YxUYVnk0D1MKQIIbQrLXMmD5oAIbg4E+UJbOLenyuAxcVCPWDbWsR+DMGlUBPJR
         W57w7ZRGo9qZOlKgngPvTV8o7lMpVRtRrlU0B558eBlrkIDJcEr0i0fcFubbZIk5IAVL
         izrzX1Kq6Nm1KIxGiHWjrDHudspxjmY114DvnFxipWG3D8/8QrNCtEfFCQ29UFMKBQe9
         bbdnk6Yyju36eNOy6LNJL8txLLH2u1XP1fagFv9RMvg5DuGa8df+np0ENjr4CDtwqK9g
         P8uwmcZN1h+u9LpC75P8J0BT/awfUM8bsr8n3A7leF4pnoJpiHxtlSvHLXoT0JMzCHr4
         H6EQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBJuTGXS1Iotf4DH0t4A6x7GpZOEpP4an+8XvfFq4HAi5W5dUrtp/v5Yzaqv4zkSQEvFEKlbGPy/LP@lists.linux.dev
X-Gm-Message-State: AFuF++nwigq1wDGFHnc8vsiVUAo0sKzO6HWJBg/4npNNoL9IPNyBcSE5
	Hztc5lPOyuGBbOQruDjSvS9+gmOBI8K5rEC5DntGEx5ckvKwULcsouJHgsEXI1vOtm8MY1eyL4O
	KPPFSprwt6dcMGmWGnHcwP+DErbtM5gAyEh0Ljnh+
X-Gm-Gg: AYBFou2mx9uykhiksA69opnv47i00L8e55ZZrpWHx5GwqvPZ5GjtIrxd0V2Ms+Xcqie
	nTP8YeEmGWkGdUd3HFFRMflrUis8EYZ62AjqeIXc7xMSslphY0Mix/w5TkMNgAF4qXr7s1p7miN
	hoys4/RLn3e+frT7umwjsatgXJdcqHumHUjcX3wNdEqSJ7RV0PtVn0lgfOkfpEIIQ2uUtm1n+5M
	4vLWIkTxfu1u3m26e7GY/NH4mGSakbzE6+trL6vvWVXJ5MxiUNtIF6ZGsz5HfZtl8DH5Ad0UoJz
	lWs8KzWdSPIPrrhiIkpyMaYGW6SdzqQRswQUHJi6Kh64NxI94lL99cXWab9SGhsxH2Q0Dk3fXQD
	yhYddZHCN+gw=
X-Received: by 2002:a05:6512:3f22:b0:5b5:e890:1953 with SMTP id
 2adb3069b0e04-5b764bcde12mr149151e87.12.1788952845618; Wed, 09 Sep 2026
 04:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-2-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-2-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 9 Sep 2026 12:20:09 +0100
X-Gm-Features: AcwNN1UBL7PwhavrAXm1ihvLqEvgnaWmqxzjHA3KjiWz2CvXQREmUKFugkp-B-A
Message-ID: <CA+EHjTwSwGUGT=6GWaOyav7kBQey0+xpL0kJ03ABtp23ZgD6RA@mail.gmail.com>
Subject: Re: [PATCH v17 01/20] KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
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
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wro=
te:
>
> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
>
> ./include/kvm/arm_psci.h: In function =E2=80=98kvm_psci_version=E2=80=99:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>    =E2=80=98vcpu_has_feature=E2=80=99; did you mean =E2=80=98cpu_have_fea=
ture=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
>                  |             ^~~~~~~~~~~~~~~~
>                                |             cpu_have_feature
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
> ---
>  include/kvm/arm_psci.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
> index f86a006d67136..06c20612e9e7d 100644
> --- a/include/kvm/arm_psci.h
> +++ b/include/kvm/arm_psci.h
> @@ -10,6 +10,8 @@
>  #include <linux/kvm_host.h>
>  #include <uapi/linux/psci.h>
>
> +#include <asm/kvm_emulate.h>
> +
>  #define KVM_ARM_PSCI_0_1       PSCI_VERSION(0, 1)
>  #define KVM_ARM_PSCI_0_2       PSCI_VERSION(0, 2)
>  #define KVM_ARM_PSCI_1_0       PSCI_VERSION(1, 0)
> --
> 2.43.0
>
