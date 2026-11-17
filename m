Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926581;
	b=CvgmEBasDdGNZldnDckKP/RhfpavKl/wq90AEHY95Its7Ee3px5uNqRUHl0gXCQbdZ8R
	 QV+cM6TZ7wxwvRviUA4y98yyQ1vqllT1dbx3Y8pXNpRAqGOqcx9ey83f40PymHnwv29wn
	 INrNRxG6HvV7l701NkpGusWMT7FMfkWl+AY9ko022cYRf55TCTxsAmocTHChd23j3ZwvY
	 mXXX6ENZqYZaXpqZkXLRatjSmIk6G5/ByLR5aUdZbYtlzuAMMYbolxRZy3lxGao7DvnHp
	 05yDs87i1DItUOUZ6GR05q47q7nL/PiLpDb7Eav/4kDtKLSg/LHBsc/cEN9O4WbLKAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
	b=n+wDRmukb021L7JbZorMUTCU5TdlSeIvLucwPvA04QXcCIHPJhJB4U1EdXClsF/aCcbC
	 VXggYhtuY5ZIC0xbw7Mwyy+dgtlWC7N04nwe5jKN5US3ZQXWGlvydxctHj2UuDo439W8v
	 cppL765fgUyFc+GChI6DFxu1seBNraDRIDOGMIEXqSF5SuMzGBHFHSqe7ezm4yGf984gQ
	 phvqfb9SVRlucYq+khxofJ+HQCiUlUjXlSILCeisqO2Xe2jLl8MH7aiprikzbGYA2GlI0
	 mnNbPsjnUcpUjLd54jtZpCM/uKSJRzXEos2AKb+SNYD/FjBbH1VjTeGmmMEyCeNanWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLdmwY9b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA8606A32F
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 14:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3DA8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLdmwY9b
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9857e87.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 06:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926579; cv=none;
        d=google.com; s=arc-20260327;
        b=TI2LsWy6Ta3QEoVo5rtAGUCw0q6/90IN77mmxbjUheLlTIlagkG8ljNtcqGQZQpS51
         h3pf+EshwKA1JnLQlXQhDSY4frv8/jIrEBuqGLWQYF7OgRsMW+9HFU+wQLdD3rTFZscb
         gN61Qb9f9+0ygDmnLuRnAWqJ2v696BeG0SRNT9VzqLrRnt14mPuRIKEpM21e1pklf+RW
         zZc1hvSfDUD/ra/30To3JgxC7pux/c7Lv2kcHdECY09F7nJBd2rao8N2ATvAHTAwqPB5
         54nOZmnJeApTjfvCr2eQWoeWhAps5ZgfPshuF/42Ctv+ZRzMiVaHZiLG0oEEjkNj/uIs
         gIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        fh=K/BshokuNmfdRXEvxJ7JHQtSYjqtacgRMM1j7RayRf0=;
        b=WsU/7mLiKMY4YjahMocKxt36k0fz+L6ZfeGHrVKpMOQoTZ+QoaiD1fIKWJQ5SLZUcd
         AQ1W+LRCI8yptD/kKSjDul+wzLDZU/EVDehL6OBV38STABmgF0oRKgk/55y35M/3LqDb
         5ghuMfPmsvCyZy7fvQV6ExNX4PLaS1MtI3FXhj/oDxYqrOTLe7aIwRMLslZYnJziZh/S
         z/lY9YErxAhPgc2BSQMT4pSQmXXpUIVEerBc+qFEfW74NT0TawzoaDV2wJKHh8ykWokI
         +WBprkW1CJuC5NzM1o11UGYRgoMHaLRW63LSyFJYUqcisAIdZeZatJYHEobgYbQxLEWg
         OoHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794926579; x=1795531379; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        b=iLdmwY9bV1opg9GnODQ1WJzYbiC4+hWPSrEJE/IPLvkGk6syxPms9MSBHs+SrzLIY/
         z0lIHqQR/EoCBeANGM60GV+FA0RGEucCt6Tbqm2qKjsRN67hX97LwemUI3tzmAFTFypb
         4G2aBxAQ8r0NmY8/dh7dA1nlzh7j0FSgQvAIWiw10YCUNaajiNoRvjuPrI76Rt9W+34P
         anKkj9vq2o5sWfyS+8KinlOC+1tQXGSKs7p+HfMVSj2A2z5eGqmgpVfWqrLJRW7EdMQW
         8/y8oGlrekUcun1Yn5uFl8lwogkEQ8ChcfAXIdE+WXooKAO7pwxW53WrXgjQma4wHkeB
         aGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926579; x=1795531379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        b=gIrKkXRmOfbs+tfV2qvLLtcqGSZjQn1sEAHxg1BWJsUAwcmvHb8l97dERzaXUsFCnA
         2A+/5NsxCJzqtKVgD6PCBLvj756QnOTJexcmy5rj4nQ8NqyLZmyXMWnWUt1uwf89yHiW
         nrqIQK8dgRljo0my6NRFJWhfHnX56sdgW1HNbuLP1UlYYqz1IQ/mOyAvPtpmP4k66ttR
         dcgdu8XPOAM6i7Rjg4jSf4o5QJ8TBY4dl6v7WNZ6toKqq4n+aUuF7uL7QOIQPcQffQAM
         XXBUS845JNoF5FD7csXqjps7E/TXUeuMkiRUT4cV0ZoMxi1hwYB09CbkyjWXqZdaSled
         8/yw==
X-Forwarded-Encrypted: i=1; AL+hErGDtaN5TcBwPpqlveSspITNdLqZeFoegl1gmxSBRSSwoobxvrQUJIE4WqWdu8sauhHfVy3uNWJyycpj@lists.linux.dev
X-Gm-Message-State: APuU4Z85qg5v+dJQ40WXr6ThkpDDOLmd/asSq7wD2d+PFczfUMbAWLdy
	mJd3RY2HNhEVaD7poWmnpyFBSaCeVilFVVp8dlXYVc9HAh42HLEoXXlic8Om4SxMIlbEdjvye1+
	hVDLCiry+1njnNHFZvWDsQKPJ7L0JDVOKLphU8XGA
X-Gm-Gg: AYBFou3mDVkdwEj/qh1gEPfSBbHcGLJGTBhcKRnw67TKibW4jWZysJNJYRXkgr2iLO2
	5NdDGgSgovL9Y0e/8Tcngf57qfbqXrdt2OS6eIQkQz6NJZd0G7lAgEScS7CApnVnRAU0k+GGGJ8
	bLhttSdxqPrrkxCvg1pp4eEkB0PuTzxqeIbqWBl6N4D8QNUBJLmqyALEFcqj1DWZwZI4IcxzjAp
	uqmlRxGHje31FnRRdrIJhaBKq3Emrt+D/ctUc8AUWetdVCFrwVM5TelYzF2fZxZeo/0h0ocdwiY
	Zq/YrcYEc7x6hrQWsepOGJeJn9wF8lr95DyUohHD8sBlHhhdZSgG5M/h011bft34kLGXwn6AarV
	Q6Nfl4XS8bZf5kekAYgUH4kmvs8qApaT1cEH01ZKQ+TZ2nrJgpOkV4NMErO46GIjwGoAfBxTo1F
	ySw+2WJTO1SHxOQoOwJIOIDTEp
X-Received: by 2002:ac2:4e07:0:b0:5bf:f84f:1d74 with SMTP id
 2adb3069b0e04-5c1a2185fadmr144874e87.13.1794926578238; Tue, 17 Nov 2026
 06:42:58 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-9-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-9-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:42:22 +0000
X-Gm-Features: AclHuK_cj3TGdQobS2sWbu8813m5UwP4GVfoFkRYcpiUN0Z7bFACWbcVhIVAqkY
Message-ID: <CA+EHjTzAo+5FhtxfX8mQ4t3k5BhatR15UKNSAQw+CRbxJ=wz7A@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] KVM: arm64: CCA: Prevent memslot modifications
 after Realm creation
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

On Mon, 16 Nov 2026 16:43:54 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
> as supporting private memory.
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> @@ -1611,6 +1611,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define kvm_vm_hyp_is_distrusting(kvm)        ((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
>
> +#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)

Could the message say that defining the macro makes
gmem_in_place_conversion true for every arm64 VM? One visible change
is that KVM_SET_MEMORY_ATTRIBUTES2 on a non-Realm VM's guest_memfd
returns -EINVAL instead of -ENOTTY.

[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> @@ -2887,10 +2903,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>                  return 0;
>
>          /*
> -         * Prevent userspace from creating a memory region outside of the IPA
> -         * space addressable by the KVM guest IPA space.
> +         * Realm shared IPAs alias the corresponding private IPAs, so memslots
> +         * must reside entirely in the canonical lower half of the IPA space.
>           */
> -        if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> +        ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
> +        if (kvm_vm_is_realm(kvm))
> +                ipa_limit >>= 1;
> +        if (new->base_gfn + new->npages > ipa_limit)
>                  return -EFAULT;

This check still applies to every VM, so I'd keep the old comment and
add the Realm sentence to it.

Cheers,
/fuad
