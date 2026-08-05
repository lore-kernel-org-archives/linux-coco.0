Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF7A43E9F5
	for <linux-coco@lists.linux.dev>; Wed,  5 Aug 2026 16:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945772; cv=pass; b=VOnAKVYaaSHevcKwALGk6yqw6iDfupGrkYG2JXDNKkT7Rl8hFLTTqN4Ds2sw7tEvvEzeyhq1EnSaLpSereiy3mOM6pd3KQEo5y/Hj2EU1DYTr5C8li+suFNtCupsMuV35fMRuQAz6yhpt79gl3dDO+0USWYEz4a8IAyTtH9Uz+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945772; c=relaxed/simple;
	bh=urqjPATeIdTfgUOdfXyZZ1lXjN9fdXK4VUOiuTSdems=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7vogHJsSLinwmWM6DbuNi/+Lem5zwxxKUJwwCYY4Cn7iyE8RDwlPsYiKAcziXj/NUtquLzTwhuUh6/FFVKO0gNYWegOTkG/qOEsyRcY8KFThB1wkQZYJy1ugDit0I679QhoxBJ9SFRuLS0RcAyD6g6rQ0NT+AeBj2bi1EEJJGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OFbZjep+; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OFbZjep+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e347638adso1285529a91.0
        for <linux-coco@lists.linux.dev>; Wed, 05 Aug 2026 09:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785945761; cv=none;
        d=google.com; s=arc-20260327;
        b=pnLDCouz5GVZPCROeOUky/lO8CvA3MB25wTPNwAKwcq3cbxiJmDbPAV5wMwK+zlCDv
         E+z3f39G8oGb2sLMy7gBpfXenC46djpc/a3mByaDSk7wVjS1xD5/QUOOvx48xP8asSbc
         NkDcGvK8zUyjmnZG1kIr1lgraYHHXBnq00+d8ZpKxcHfjNJA/mLCP8U3L/zcNw9dwp9Q
         PB2S3n6T4j0SWRmx0FC0gq9nnBl7M3Z0g16hfwzN/d98SVdGebyjv8JstL1XvcGYrYxL
         zZF/5Up9US3MwNNuSn04VfvfdxcIjIeVCCjw3Gu9u+/KJkDFk9Wlheuu9P/ZyyTYAGzY
         T/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dDxVaJA0qLhUpRmzRVBWfrwvszjITp7kHu2WvQfbt0A=;
        fh=0hRgH6IdjWLCTwfCGt5bRkvngy04GqiD8GtH+7xpeRs=;
        b=VyUTkGuYEBPyXgHMKv/2DRK2d9gBZ9HXBKGXxnq9xH6C8ffEEXtcQfc9cd+YIuz2TP
         25/n7g7rVGdWuV/fJZLQojv0KMLBkKg4ygrEXJRawMD/zHd4H7zCmiJs/gAFMJgL1bCV
         F736U5nlDHUGdoQldfSgfYVgYaMAPDOa+cEYXpEytbckPRdG8dt19AaNtgYX20Hhw4R8
         GK/NMX8+fRsr2qou9AdicmwlxrKKkqObTduHRJ952K5x8SHcOnZ2x792qn/xiZ0AWA8C
         jvu4Y8Bke7KSBGnS1sekDW0V2lbqTsqS1MQrp5S89WeXNeYzUzhX1DZ4idAAEL8+z+sz
         K2aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785945761; x=1786550561; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDxVaJA0qLhUpRmzRVBWfrwvszjITp7kHu2WvQfbt0A=;
        b=OFbZjep+cS1htugwUXpD0pmSl5wJUInB5Nmetet7B7pB6eJSH94fKBrEEy5/jJD+tf
         PZXTVciMF/x9T5AE+SNEQxics/96AoOGcHnnGni8nQ5PYtd4x3Uiag7B0a6rYzjAn6yE
         QhKVOg6oh9M00sj3f3jX7YXVw+9hmCen7BarDR7PlJ175GuBeahBg2XRCN3UBf4ut2uT
         D4OA621LvFYqauIpu6r27ybkGoizs9Bac2tAcWnexEcqSJBBw2xXVg2V+BOueSgXOiTn
         x91JtLs6MO5IGQV4Sa9+qcDtUHU6AeZdAeCzfFcXdZXpSxBWUfockg3fp4N5sWHrzTyC
         G4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785945761; x=1786550561;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDxVaJA0qLhUpRmzRVBWfrwvszjITp7kHu2WvQfbt0A=;
        b=IGvSFklsdJ43JUVlzvw38Yz+fq/4y8aWwaXzQNHx9ex/1JZ3flXiPs+b2wNbmotOmj
         ICAFmvQZmkEtQeDK+SJjjrtyKh81tyUm1hIlI09XL0wjo6nPg8TM//qjn8TYBlUSzUce
         uc+uM7UK6hTlahrZWytDO0I8k9gKHmUMv/DAV61B0rBSJ5IADVrWaMyUnARoiDbUCjHY
         pBPM0Devtl9fgZbVfdLiA2e/Kd5K0zNy46afsqt4bafhi9YqYMoKFdTe5rqP8bKpiAvy
         WlszKCWU6pKDMyr+vDXRYdpDT9rwFKLz7xR0f3uppEBvO6DkShjVQg31hjeK96kWw9FV
         5ffw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+A+v9imIbbS7g+ItoUPpWVhZi/dHmmShLW9YbkhU+k3PcQpgN4stb69qrQ8sFikKuLZNX+3AFlAIh@lists.linux.dev
X-Gm-Message-State: AOJu0YzG6fHMt3aVbi7o1hfBg56hxpxW77ZGgOj1HwU6HtAXTmHe5cgk
	qjRohcBQWkQBQhuFiESM+tTYtNqDG057e/SrGDkGKQLYUY9J0xfaZQ7BmRmdolsvWwIHWcdC/hk
	VwNgae/LKyEVx9CxeYplPxIbDEc2NYdzo4+T0YVu7
X-Gm-Gg: AR+sD13uCU8Rimp9781l3EGyHp2P5e0oCCceGxY51VtvH1QU7dvydWSJxzvOS7pE+qA
	Vg5uZJwy82kVPQewf53DgYW4UoSjpYCbz8Kw60ZorC9MdKKKapgS0UHXz7IXOw8hkPAYS/ql+Ez
	Pdh1IYFPYY3cjwBXvxURcJi7+mAKn7FZOvdEbCsYm21j8X0CvFwD8/GrnehtouacBphnH6o5AhV
	hrD2W3t42JfVc0ambtJX9syUdO3nOjqOxHxp0/fhQntxI34/jwM4Nr0TrgA5/+1kMTj3j1MByig
	v32l1Gpb9Ie/Drhroh6/JORgNkH5Q2dwZMhdpcxzqHd4KO2e6x1EQjE5EMfFjkOkdfPvR5x5SGb
	ycmgEnB/1NFETds/PLMLqcOdLafFJzgnqe6A=
X-Received: by 2002:a17:90a:dfcf:b0:38e:9045:babe with SMTP id
 98e67ed59e1d1-3903c5589ecmr8554536a91.7.1785945758439; Wed, 05 Aug 2026
 09:02:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Aug 2026 09:02:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Aug 2026 09:02:37 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260803134403.80630-25-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com> <20260803134403.80630-25-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 5 Aug 2026 09:02:37 -0700
X-Gm-Features: AUfX_mzwYvzVqQkuKFkuAOMZ9a38FvddXqwH3nl4jjle1d5YB5Md9uRdePzF8HY
Message-ID: <CAEvNRgE5O4FcNQDHwh+DWsHH7gLs3qzm+L4ZQ9FHkt=WoTV2Hw@mail.gmail.com>
Subject: Re: [PATCH v16 24/45] KVM: arm64: Expose support for private memory
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Steven Price <steven.price@arm.com> writes:

> Select KVM_GENERIC_MEMORY_ATTRIBUTES and provide the necessary support
> functions.
>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v14:
>  * Switch to guest_memfd in-place memory conversion and drop support
>    for KVM_VM_MEMORY_ATTRIBUTES.
>
> [...snip...]
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 15d42d1993bb..146c52f867c0 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1510,6 +1510,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>
> +#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
> +

Perhaps related to Fuad's question about pKVM and CCA state: would
conditioning this on is_realm mess up pKVM?

>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>
> --
> 2.43.0
