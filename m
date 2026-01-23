Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392CF2765DF
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194674; cv=pass; b=D8VlMt5iZPpTJm+VEuvGd0RdBA+hET0PfYXQCyb/JziHdse6mk52PHKTVDlYVQoW+8d8CU/fJaXuIkE0hK5vfgBNNOzY53M7HHOpZBaRLs+m0/9FMNPgskW3LVrxTFHQ4ICOd2jEgFdESXqMo667Zebn6GQmgIVlrighp9P1qfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194674; c=relaxed/simple;
	bh=eDapWr+n9P1X1BHF5iSqs6NkiN+CqMz7juT17mz9KkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKxhKVVjA3Rsj6t9ZMd3p0aBdGF+KHct3A0eXCl+E4oQ4L8L2+8F6rLvHjGUpUBq2L+7MfP7/khAIKZjQpq6YKnCUEsUt4Q0bBlqhixtf9PcZkArJv99jCPe+iPj9NQf8eY8AGwdFSfINerdxACoz9HbAzvcDACqUJWZpyuCYxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MGqkHm5i; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MGqkHm5i"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94121102a54so1854594241.1
        for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 10:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769194672; cv=none;
        d=google.com; s=arc-20240605;
        b=NYYERk8hOGmYhUniWyyYalbbO3JfoGeyeQsL3ELhklVdxUTbW/dqxlR6u3nKULIaRU
         AML3+aXlGTqNGzT8dU3y4ZDwvqLejJo0ej+b8wn8Axp843pubyF3J4ORWj0B3JMphcxW
         8y5A6dBC2xjHeYWOdvysqzuIrtI6OkLFGJXC3T+vgiMxe+Py9ZAQXO6rQ6qRgj6MDkVt
         h4hE2S/aXIPNZk7FzKfW4VhPmqZduc74Ir93Iiggi57ih9u+yOvIcgaWVoaQR/YQPC4H
         l4Vn+gkygrZjEc1RTfdlWxz54j7O57yXhsXG5LOHp1H18Jf1muewlpBkGdlge/agDUET
         tM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZS1VP6COkKjKYZmCvco4g4510UVwVXjW35gfix/QdJA=;
        fh=jps4r/HNLt+v6rkNxcd9iRGme0iIjs9c9vD/hTUzF4Q=;
        b=iUehCJKTpAf6x0ogjQ6a1h1k9EitvZcQ04Bnhi1mPXiLAn11/osmn743YRQV0nz4Xb
         SRYTyzSUSJLGdfM7B5lQ3trHaRf9xl4RRCRwroNVJ+i/FEapTR6r/BcwlYvVjTvFUAKR
         fodXWcR/If3+n2TQfmt5Boc0xVND8nmIn14Z6OEV2GhQupv3ZXiESauHzydBI+74LOrK
         ENiQ5MpiEpzNSnNjFn1yQ4NzF3TfrL+0OAmLWDwFUF0c8XsOiaOT4Ivr5fARGhP0yVCs
         chNzIHbIOd9t3X9RUGW2c/0QsEn8U9Wl06agWlHa81AVzK/qpYgrsWkSW7AKo9QTtBbx
         OcTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769194672; x=1769799472; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS1VP6COkKjKYZmCvco4g4510UVwVXjW35gfix/QdJA=;
        b=MGqkHm5iN4SjrqWdL4L6kopkLG5d+1Rc75VbapKQnOhhXDkb2XlvAwnas28ENsdpMU
         cad19Q7wRsD2Fn2wMqInBFBmMK68yDvtnsCTIVl/ZQHce9ki+mI7bDPU/Zoq+JTzx9Uv
         vKnnZXLPb3vGj5XGY5umDRtukFdD4Gx6V7+/40wlUVU/fp+/AzceSm+PcZVIzV5vK+sb
         yhMUS73wVuB9cNcMWy7qW+T+5qIlvKDfBzquyRr3686uCfHSvGfKthSvVOWoHvIRG6vj
         mquj2dYveKfOHor0vccAo4a/3ovJhnK+c5z6Tszq7McI8fS3JphbVp03Mm0LkJHYUtHv
         hPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769194672; x=1769799472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZS1VP6COkKjKYZmCvco4g4510UVwVXjW35gfix/QdJA=;
        b=AJv48Kk489M0EC0zb5LlHt48Wv+umcj5+WX7+zrIzmg3xAo6Pa4Xjh/LymOslCqEbJ
         Qjhfz4mUtd2yv68xrW11kTdwqlcZi8WXC5/JTcJF6CbSU6KpcBq961ZwNUT2ObE1cAuH
         kWbn3n7//LWmtNRYrC/OQiu5V+EmuF9lnXb87ssupqItcWtq0JJTfLkvi2cpzmsR10Ig
         7ojJvuDZqhN/25rPzMERKUzD2438O3u+Q+txxAjv8LshP3Uu+7lTlCCK9NMEOYtVXA7N
         2tn8K0oCzarWNchy725TP468tVdtqLnlXP+GtUbTwPjqS4JAOFs6t8Y8ht4q7mWidyLo
         1CFg==
X-Forwarded-Encrypted: i=1; AJvYcCVMpGKC3UT765LtYb9wLbUvvvErqWc4dBXekxLbJo4qbxLNdUzcySWhxdfdcyyTJN7M2SCtNpGvwf6G@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7lRzI9Z06y+fce0tK8D+mvcmmTDxYr1JCjt5b3XAIuEU90ANb
	/kBfYxSqPzpojdrOQ37OaGY5wo+shrNkCsEBHikShgXT/QSPdtuQfJV6NZnnNtG7MLIxmlRCdWM
	5M5fqWRV2PQ6Ebbe1IdJZfn3KTwh7PUMucXLvyj1v
X-Gm-Gg: AZuq6aJItARXt6Qg+jbMqhr2ZoMXjq/ptKImsmi+5xh3gDxidCUX6lZ3EFaieFbPEMu
	ZxB/bz5uREG40TpNxf0BBI7phTLv+mEtNT1w0X29zbVILrCAZQuTc3dhu2ZGPWG59pvyJPqjWCh
	YBaxLPhc+WFjSdc5S/s5FFaSAHqUa+9Gi3Ew7Rb/38aUTjNKpBxYn3YIJkJO74fbcLqutMsOp7L
	5x6tkguUZ/4n4C9aNmn90j3BBnErd+UoUaww/vbANFRGIJPR1znpBRpXr1YwEAdHTR9dVQ1VXkA
	LBKo4pabgIf03vaxZXy7zriH7A==
X-Received: by 2002:a05:6102:dd1:b0:5ef:2457:8011 with SMTP id
 ada2fe7eead31-5f54bc628a1mr1369126137.21.1769194671879; Fri, 23 Jan 2026
 10:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251217101125.91098-1-steven.price@arm.com> <20251217101125.91098-23-steven.price@arm.com>
In-Reply-To: <20251217101125.91098-23-steven.price@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Fri, 23 Jan 2026 10:57:38 -0800
X-Gm-Features: AZwV_QhZYPGr8z6s2H9r2lNS2DnUjwnSFq4bTCqpFEvFz2mvBWHpQWX_DZm5pNo
Message-ID: <CABpDEumQ=62nZ_xEN6oMHw=J+6ps=Gy=1vx8i=6Hz+BacO1Ymg@mail.gmail.com>
Subject: Re: [PATCH v12 22/46] arm64: RMI: Create the realm descriptor
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
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 2:13=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> Creating a realm involves first creating a realm descriptor (RD). This
> involves passing the configuration information to the RMM. Do this as
> part of realm_ensure_created() so that the realm is created when it is
> first needed.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v12
> ---
>  arch/arm64/kvm/rmi.c | 117 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index b51e68e56d56..18edc7eeb5fa 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -500,6 +500,106 @@ static void realm_unmap_shared_range(struct kvm *kv=
m,
>                              start, end);
>  }
>
> +/* Calculate the number of s2 root rtts needed */
> +static int realm_num_root_rtts(struct realm *realm)
> +{
> +       unsigned int ipa_bits =3D realm->ia_bits;
> +       unsigned int levels =3D 4 - get_start_level(realm);
> +       unsigned int sl_ipa_bits =3D levels * (RMM_PAGE_SHIFT - 3) +
> +                                  RMM_PAGE_SHIFT;
> +
> +       if (sl_ipa_bits >=3D ipa_bits)
> +               return 1;
> +
> +       return 1 << (ipa_bits - sl_ipa_bits);
> +}
> +
> +static int realm_create_rd(struct kvm *kvm)
> +{
> +       struct realm *realm =3D &kvm->arch.realm;
> +       struct realm_params *params =3D realm->params;
> +       void *rd =3D NULL;
> +       phys_addr_t rd_phys, params_phys;
> +       size_t pgd_size =3D kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtc=
r);
> +       int i, r;
> +       int rtt_num_start;
> +
> +       realm->ia_bits =3D VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +       rtt_num_start =3D realm_num_root_rtts(realm);
> +
> +       if (WARN_ON(realm->rd || !realm->params))
> +               return -EEXIST;
> +
> +       if (pgd_size / RMM_PAGE_SIZE < rtt_num_start)
> +               return -EINVAL;
> +
> +       rd =3D (void *)__get_free_page(GFP_KERNEL);
> +       if (!rd)
> +               return -ENOMEM;
> +
> +       rd_phys =3D virt_to_phys(rd);
> +       if (rmi_granule_delegate(rd_phys)) {
> +               r =3D -ENXIO;
> +               goto free_rd;
> +       }
> +
> +       for (i =3D 0; i < pgd_size; i +=3D RMM_PAGE_SIZE) {
> +               phys_addr_t pgd_phys =3D kvm->arch.mmu.pgd_phys + i;
> +
> +               if (rmi_granule_delegate(pgd_phys)) {
> +                       r =3D -ENXIO;
> +                       goto out_undelegate_tables;
> +               }
> +       }
> +
> +       params->s2sz =3D VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +       params->rtt_level_start =3D get_start_level(realm);
> +       params->rtt_num_start =3D rtt_num_start;
> +       params->rtt_base =3D kvm->arch.mmu.pgd_phys;
> +       params->vmid =3D realm->vmid;

I don't see a way to configure rpv and hash_algo anymore. I assume they
are gone for a minimal userspace interface. Will there be a way to set
them going forward?

> +
> +       params_phys =3D virt_to_phys(params);
> +
> +       if (rmi_realm_create(rd_phys, params_phys)) {
> +               r =3D -ENXIO;
> +               goto out_undelegate_tables;
> +       }
> +
> +       if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
> +               WARN_ON(rmi_realm_destroy(rd_phys));
> +               r =3D -ENXIO;
> +               goto out_undelegate_tables;
> +       }
> +
> +       realm->rd =3D rd;
> +       WRITE_ONCE(realm->state, REALM_STATE_NEW);
> +       /* The realm is up, free the parameters.  */
> +       free_page((unsigned long)realm->params);
> +       realm->params =3D NULL;
> +
> +       return 0;
> +
> +out_undelegate_tables:
> +       while (i > 0) {
> +               i -=3D RMM_PAGE_SIZE;
> +
> +               phys_addr_t pgd_phys =3D kvm->arch.mmu.pgd_phys + i;
> +
> +               if (WARN_ON(rmi_granule_undelegate(pgd_phys))) {
> +                       /* Leak the pages if they cannot be returned */
> +                       kvm->arch.mmu.pgt =3D NULL;
> +                       break;
> +               }
> +       }
> +       if (WARN_ON(rmi_granule_undelegate(rd_phys))) {
> +               /* Leak the page if it isn't returned */
> +               return r;
> +       }
> +free_rd:
> +       free_page((unsigned long)rd);
> +       return r;
> +}
> +
>  static int realm_unmap_private_page(struct realm *realm,
>                                     unsigned long ipa,
>                                     unsigned long *next_addr)
> @@ -803,8 +903,21 @@ static int realm_init_ipa_state(struct kvm *kvm,
>
>  static int realm_ensure_created(struct kvm *kvm)
>  {
> -       /* Provided in later patch */
> -       return -ENXIO;
> +       int ret;
> +
> +       switch (kvm_realm_state(kvm)) {
> +       case REALM_STATE_NONE:
> +               break;
> +       case REALM_STATE_NEW:
> +               return 0;
> +       case REALM_STATE_DEAD:
> +               return -ENXIO;
> +       default:
> +               return -EBUSY;
> +       }
> +
> +       ret =3D realm_create_rd(kvm);
> +       return ret;
>  }
>
>  static int set_ripas_of_protected_regions(struct kvm *kvm)
> --
> 2.43.0
>
