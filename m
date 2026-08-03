Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531934EEF7
	for <linux-coco@lists.linux.dev>; Mon,  3 Aug 2026 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796208; cv=pass; b=oqRrSgYufWvcx9UdtqkogWINGA60V1ZcoNDb45xzT3E8FZn7arogEadrsjjg9ArMzPRpx7iF/lDTioJV75K5SsukUPx5EFELbnSocrU69bs5eGORgQ6hW5+WiVrF/gKZUHk0BuuchUro68jhOZni8HfPBBA1cNg0ufcbtOMqwHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796208; c=relaxed/simple;
	bh=SoGWMfuDZcITvarO1qukl7KE+ls5azooLD7ZNrSHGPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ox/uJVHhNgT+bWz7pfQU6HxNePTJHbe8Hd9rJ4Wikz1BrpwDT6ydlMjCUmDFi7efpO5F+1Qp1k253QpHDlbGZQ0bj0sKrgjq4sJtAEIc17ZMSQeFa8NQfO51eaEODFSbd3M3bYNc2D3FgRUoeS2MEIimfHsOGBNi82RT5lJsP74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f8T6DO5o; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f8T6DO5o"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92ea24a2dbfso308019585a.0
        for <linux-coco@lists.linux.dev>; Mon, 03 Aug 2026 15:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785796206; cv=none;
        d=google.com; s=arc-20260327;
        b=Y83HUkWr5Re1JNZ7QGPJrxaVwTwgzTiK7L5BCQGEgKfbr2oDSStgvxH5LB92bc7Tp1
         gEY/rLYW7bMbMT9EaQqd2TVreR8TsclX9bMlEasr80DUdbU6SpAMoBRxNxT4cuMQzm5+
         cmu5U7HJ68sf8mXiqO396XZm58nULsSZ4utcH/tiilIJdf6rzYjD2X5jb8zYGBCb6N1E
         J1TNuApJgUavreuupCILyMLiDIbI9ex+oE67aXzuysU3XCer4++IeNQSmtEZIIHjOsAk
         PeY2UB0wBN5iba4b0EX65Gz8MUY7m8gXxIPQi7Vop55bfqmmLDCWCod9B4a4GHgD7Bd5
         LWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yTl9Y/o436Zlv2Vup2MQ3FRSTw8xGxoHxInk9rGis4=;
        fh=QsUJinKfRhq8bt2BtEME5sQCKv2r0ZCWcSAV+qaqy18=;
        b=SxHg2knykOHjvtUGSzr4hjVPchvE2BhJG071OKDbPb3VKXfkaqdYmn7qaDDpMkHACd
         GXzUjCp9dsrk0SLcpydb4SFmgc/S6CW5D8qVm2QjuQox0WAWHQe8TXzmncK1v2VJPlDo
         oJvenvXkzSxPEl3RhssNDVaYndWG0daTL8/q6G5iPk+0zylAcox6D6MNJeyM27CsLU9/
         cyZVhp5C7koup095gfMVo5IYsIYSmZbFXXTUpEQ8FljuAxUwuE+8kyLnnfpG8ZLk8x8S
         1x7WK7XxFdFQ7+VAKVLy1dSTp7ybFpgPZI7vrozolT3aG6SkXaah6AFjjARbRlHQY66v
         wmPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785796206; x=1786401006; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yTl9Y/o436Zlv2Vup2MQ3FRSTw8xGxoHxInk9rGis4=;
        b=f8T6DO5oeI/yBh7vbAt8RY/i606/Dl2Nk79eeofxfwEMm2MjgTEvA8O9yiVvV1qn6O
         Zpa9tJ6GNyE9Lb3tKl66yo4w89PrVUoaKUBKDjTUUzZzTl5vF5cvdR1WRRpR+4XikCEr
         Mlw2U6GWIoQqK8pAfhncj4hZALiaG350LQ5r9MhskrzF27lJ+I/Vk4kxrDrAAvI7SuJn
         Qj3dyUOcNQeb0azT3Zvv0BSvVY3xbQSMcXWjowHcMBrMHNBOqnbkkIrRWSUVGZNgfl2e
         4T1gR5slkiONk2IWQFzFCto2h0tJdXa9/pDa+biKBr/PBFArUJLZf2E7niYQZ/DsclfT
         coPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796206; x=1786401006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yTl9Y/o436Zlv2Vup2MQ3FRSTw8xGxoHxInk9rGis4=;
        b=KSOt+LVUmMwi9bhmmSFMf+OQvsacbij4nSRB6HiKC5PqfPO7WeBIEaIm0a5m9TQp5y
         qX9m8QazOVvDrA3iN2bgzz5cJyc3ArNZytJPHpKCupRTUykdqU+Y0wayMdgTNr1OpxSr
         BKBP7CQ/9EFRkqfWzm/TzJF3CQxhn+VefxWudi1icLIKHOsOBX5QRDeN+7y1xcIG6fLm
         phk7dmfEZ88xAnofrrG1Lv3bnwgBsCWtDevHFe+IWGtYPaS4jpdB1pM6iQZmKpnVG2m6
         maehrzvCOmjOm6zxThXM/kaETH7yCHgLBiImjZfb7bqthB47YLy4vX3Wh8u22Q2RCgN/
         Toyg==
X-Forwarded-Encrypted: i=1; AHgh+RpYELOpMJN/5kBvnqfcri+pb3ShOg/n43FOQQcmfFGXy+Yh0QPcE147XHZm5+96nixC7G1ObTCsR82x@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7LYY0n+ObSMKKH4ga6RDPbVizM7ZHFC7Oxs1HJmkMxR9YrXpj
	y00/bSH5rMsi24qD1tPxdnwI3faJqlm2J0UCj6pQWBf458oUkUrEIW3iTi2zswb5F+0qBVyb/wC
	NjEfhknNJmifaLYjghczSVpMYIk+bhAHnVx0xNiAq
X-Gm-Gg: AR+sD12Wni8mk3deUlPeyEvJRXx893kW2ZmFY9y8/IicRJRyprV5u7oFhtdA6B+/KOx
	WeoU3HQk3N4zibJ/lcRp+pi5hMfpG08qP1OQscgDzAM4LCpHvdpYMPJiyLnDkoAr132seMD3Jso
	VRs4jmR4hqIEojLpD8U2FuM0FN6a0iPQApOlqjUt2K89DSxhKtmniRrAiGU5EmpnmrBxe8DXc1P
	U6Lj5o8UbBPVS2r2V/371nKmPJBR9g10sq/OjfxIpKtNlCNe9CeIPTZ9ic9IGiezVRw3VPvMGbx
	zMk9nCLZy2QFdRckuWVVvSrUhQt0FT19nQBLDidRnBscXGgzd2bCfPDHDHy5YFmwCzhmS/PzfS1
	YlQ==
X-Received: by 2002:a05:620a:1788:b0:932:d92c:1604 with SMTP id
 af79cd13be357-934a093ee41mr1858091985a.23.1785796205213; Mon, 03 Aug 2026
 15:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803134403.80630-1-steven.price@arm.com> <20260803134403.80630-18-steven.price@arm.com>
In-Reply-To: <20260803134403.80630-18-steven.price@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Mon, 3 Aug 2026 15:29:53 -0700
X-Gm-Features: AUfX_mzgu7kD5xmIyUYZ_YnVZsQj0adTFpMJoMddiEH4UKglz6_2Lo8CDB6wxAY
Message-ID: <CABpDEun3NPr7Na85pmOvdfYQ1DB-2nCcocsyDESXM15bzJU1og@mail.gmail.com>
Subject: Re: [PATCH v16 17/45] KVM: arm64: CCA: Tear down RTTs
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 6:45=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
> [...]
> +static void realm_unmap_stage2(struct kvm *kvm)
> +{
> +       struct realm *realm =3D &kvm->arch.realm;
> +
> +       lockdep_assert_held(&kvm->arch.config_lock);
> +
> +       if (realm->stage2_unmapped)
> +               return;
> +
> +       write_lock(&kvm->mmu_lock);
> +       kvm_stage2_unmap_range(&kvm->arch.mmu, 0,
> +                              BIT(realm->ia_bits - 1), true);
> +       write_unlock(&kvm->mmu_lock);
> +
> +       realm->stage2_unmapped =3D true;
> +}
> +
> +int kvm_realm_teardown_stage2(struct kvm *kvm)
> +{
> +       lockdep_assert_held(&kvm->arch.config_lock);
> +
> +       realm_unmap_stage2(kvm);
> +       return realm_destroy_rtts(kvm);
> +}

Hi Steven,

I noticed a warning in dmesg when destroying a realm:

  [  158.533495] Call trace:
  [  158.535927]  kvm_destroy_realm+0x208/0x218
  [  158.540356]  kvm_arch_destroy_vm+0xc8/0xd8
  [  158.544439]  kvm_put_kvm+0x324/0x4b0
  [  158.548002]  kvm_vm_stats_release+0x1c/0x38

I traced this and found the following:

At this point, calling realm_destroy_rtts() may fail destroying the RTTs
because RECs are still active and the Realm is not terminated, but the
walk finishes and still sets realm->rtts_destroyed =3D true.

Later, kvm_destroy_realm() calls rmi_realm_terminate() and then calls
realm_destroy_rtts(kvm) again. But because realm->rtts_destroyed is already
set to true, it exits early without tearing down the RTTs.

Consequently, rmi_realm_destroy() is invoked while the RTT tables still
exist in RMM, which fails and triggers WARN_ON(rmi_realm_destroy).

The fix I used was to remove realm_destroy_rtts() from
kvm_realm_teardown_stage2():
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -434,7 +434,7 @@ int kvm_realm_teardown_stage2(struct kvm *kvm)
  lockdep_assert_held(&kvm->arch.config_lock);

  realm_unmap_stage2(kvm);
- return realm_destroy_rtts(kvm);
+ return 0;
 }

I think we don't need RTT destruction here as it will be handled cleanly in
kvm_destroy_realm() later.

Thanks,
Alper
