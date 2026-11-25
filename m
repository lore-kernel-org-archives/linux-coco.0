Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795565381;
	b=LlPQzOtEW585ABILRmjE3hfRCV0fS4SlpwOna9SoDLiemRDw3Clbi6bd7fqGTB8gLujI
	 cPVKvVNqsHFYUoKcRVW2wUGfzD+WOSHB9KZNb/Q+FFP3IZMHM2FJ3jyuXNfvm5qDDtoTG
	 yKKVJLYu3Mpnd6Hr8uB5lY+DNebmnii2KohEdJBk/HPkHe0rUYeTzzktWavGo9YOJ07Sx
	 YPfXVuz9yWiBrUzo8Fl1YQGjJmSmX45t+vuF3LNY/ELlWo9A+/1tMsXeHcJ1NaOr+/R/I
	 dZUcd/fV4pjOtaBTB6zcENptwOUF18lstAt54vfxLRbMUdvfBg1LlFVkoQSmGRp0mgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
	b=xJ16ZuG8P2r0p9pWg/K62izx9MrrAw95bHJK5T5t24gvM7n1UFsFgh5NQHyJEQ6zjw5m
	 6bgMfpn2D/qYY4GFfW5FBNaEMMUFRxbCDFmfpltUvw9wbpRznLytQ+EkENUOtTD/QaU2Z
	 U0agULWCuMyaRrbGKNX3MFo4ZDm4Xxz4w/ihJeTtBA//wjmwdNCyZyrsqobvHP736fW6h
	 MrGv3ZrzlXGU8+zMFYl05k4hH2/8GpyhmpTC+luteb7m3IDBpkaBAvYT3l5MyF/QBx9Mm
	 plvBj9yOfUsgamt3qtePgn9chpg0/ndATNXgGxarKZuC5BejefZe7WzqSUlp+p3bFmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bKP5JN+t;
	arc=fail smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15A606A326
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 00:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F15A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bKP5JN+t
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-92107df3f13so49877276d6.3
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 16:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795565380; cv=none;
        d=google.com; s=arc-20260327;
        b=J4ss6xWsHatlWfX7jrEM5X2MxMSRbmzkbb4e7kkj7ck5+ZDkGSsBB0rj65J5zhwg2D
         Yj1d6b2KHYaOLouMjfp42Hm/ihwkuYUTjYCQua0zd5ScfjdPNTSZoxGlGIP5LlpcxDof
         a6mP6Ae6YrgfE4t/ZfSwF4X1DL5iCk6zivseT8meQ+PCHXAW7FN/77vjk3kvtr37EWSO
         BTtC5UvpdwiGIj1nH+kSb4tCu3Idj1O1ElH3Ek81qUrIwtP2828zmja3LFnj9yS1qW+p
         9z7+7J93iR50dlPp9UqWP6HSzqf4gOkfW5xlpsMfnIF5e4iDPPWmLCKF/0nFXrQkJ6aB
         moqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        fh=qnTOqDbhB7pOmsvmuKftsm0OnIu/XAuh5xa4lQNBKrs=;
        b=juFsgc7NBJ/RTt3tub4R9u/xQtEbWp9QRoDuOfJpN71qBMRNi1fEvO/7ml4+yK76Pj
         KCvjPf+D3r33QQgBZTWyyTE9qKAgNaT9MO4u1gMpL7Heo9t1NDWzCo5iScp/lStWUMB9
         JEQhYd0TpUAMzKVcvunSrk6babbhfAhUoMT4iCgZl7CjpbZoY1FA53QaczMuajcC2OUn
         hVQ74l1E8k/NPkhmWBtmYH0+PzRrJ2V5ZLejOTLvP/CdcjFI9uLXGhiY8WSJKBrwTf9E
         ukAqikmjbo0LuL0oCA/RzBV4WQwlAoY7kBXVMjvhO990Ee5y5vuVlyJM6EKa4zn5G2rQ
         mQkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795565380; x=1796170180; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        b=bKP5JN+txnagUjrT+KyPlIY5daEWkCg82DFYQvk1pGDMCDG6uu2EjitGLRdfT3VPkW
         I9THDLfNLN8SotjLCYwRnqEgLJTY4e73uXFOyuo0wfEkkEbAlk/wCYJhLvdQrJptaSPd
         8TFanXGVkLg8jWdRBQ2xmIvpnRxMzZT9bsYGUuygTtoSGDHyGujGH3609YDgu+IQLDeu
         R+Vo0l3y1npCwGXht6pwopJOjYkKKaQbmXU2BoyW6ikjkZj3SnI4vP3k9XKm+SoSZvHn
         J0ioTmsPPDVooTqbo/NH8AqUTD/1qiFwx/N//Tse8kokQ4TpE2CxIbfQhmG6oilD2Azm
         Inyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565380; x=1796170180;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        b=SGlw5Jnl5TjdVM9dJLuiw4FQtG0Ua+p0h126v161DUT7IjKSzjLL+U+uQk+yeqyggL
         LsSOM51RbDc+smxtI33x9DHXRueg8zkXSYIEroqhAb8KyIt6SubzZgzhsibprRTY3Cxe
         RonXA5dLgr1OCwFE1y8dFCuAQUN1mSx5707YINz0owK68oDrxlTxRit3AfZQjHEMze3G
         vqY5nvYylM9cjxZoIK+BqAwnL+JPdhMaUOQjI5mJlgOveCE4sYrE+D3zZnMmiFrYY/53
         oJmh88/f1oCFTPUL3w4euxWyoLHp7QEa2c8Pii1eRdhB04jRSnUr2U+RhKRMoTVyXYJu
         CWhA==
X-Forwarded-Encrypted: i=1; AL+hErH/tK/2YM69dgGuxuN7Hb1ZZ4KWRUk2MU6xIPapIBgeEAdYEulWUUM0uFvgi5UVxW/h7q0cfQk2Mtt9@lists.linux.dev
X-Gm-Message-State: APuU4Z+CGVAzfA6za7KRlluueggSzTn+m7vVMuizBtTxE2dQTqnPp6b9
	u23euhB1lt350uRzoxOMBnzheAbnzZKAxgSkpaXRYk8+0bN2ExCPZUTFm2AyZIYOaIieb0gC4jQ
	/4w1cpNX/LA1U8fcsCkuJbArWh7V9smIHHrfRgXO5
X-Gm-Gg: AZFdTZcidnGWDD+vdBdd+H19yq3aBJ1i7BR4/cAm6Obw8X94VpbuB1B1DhELfd9zmwQ
	uyUHJWKmWyO6sOBB819W9r//F2skj91SVr4rsRHomZ+4Q/Z2oiUVDBUPrlht0HJRaB02v6qRWLz
	3FxtexOQ0Tz5ITOyC+Igo0G/SyoHE1QyvJyppbObd131WZFL+/T+yEkhNnNQ3lMv72oEQ8UAjbR
	tnvHOBSKqkFsvXikc77tJ4ZmeTBFNadUJxKoTSzFC+1daklbUbpqzFDNW9piAGJQsOsS1l85ayI
	/urc+o8QvUgSE0SdFHxfSK0QC0+gosw3BfJ0xssjKhwYRpSSjSG4rWOUs15w+5A7AWo715Zd0v/
	sa6q4ed8fRORZvuwKGucyNp6NfzvIz/9fJ6Xmt8DAHd+6/eINHxAHEO0f8HrlzbJs6WPT6mkcnQ
	V12TZhK8oY1mBW9YIrhXhM0cY=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr275174306d6.54.1795565379417; Tue, 24 Nov 2026
 16:09:39 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 16:09:38 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261123104233.95710-10-steven.price@arm.com>
References: <20261123104233.95710-1-steven.price@arm.com> <20261123104233.95710-10-steven.price@arm.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 16:09:38 -0800
X-Gm-Features: Aa3M54oNKjHnmwhcyDiHaoxz_zNMiDJBoB2YChnt0u_TPYjP0NAb6dZlL994CUs
Message-ID: <CAEvNRgFQ5BXqU3KfPFT8bfZTW=RyvBw25z3GZtr3JA=Wv3Yqfw@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] KVM: arm64: CCA: Prevent memslot modifications
 after Realm creation
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Steven Price <steven.price@arm.com> writes:

> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> Once the Realm is created, prevent changes to guest_memfd backed
> memslots, which can provide private memory. Validate these changes
> before KVM invalidates the old memslot, so a rejected deletion leaves
> its stage-2 mappings intact. Realm stage-2 faults will also validate
> the private memory backing in a later commit.
>
> Require Realm memslots to lie in the lower half of the IPA space, as the
> upper, shared half aliases the lower, protected half.
>
> Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
> as supporting private memory. Defining the macro also makes
> gmem_in_place_conversion true for every arm64 VM, so guest_memfd
> memslots are marked gmem-only even for non-Realm VMs. A well-formed
> KVM_SET_MEMORY_ATTRIBUTES2 request on a non-Realm guest_memfd now
> reaches the VM check and returns -EINVAL instead of -ENOTTY.
>
> Additionally, similar to pKVM, do not support dirty logging or
> read-only memslots.
>

Imo this could be split into a few patches

1. Add the constraints wrt realm memslots and being in the lower half of
   the IPA space
2. Defining arm's support for private mem
3. Imposing rules on memslot changes
4. Maybe some others, maybe I'm misunderstanding the patch

> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
>
> ---
> Changes since v3:
> - Explain the arm64-wide in-place conversion effect and keep the
>   general IPA limit comment.
>
> Changes since v1:
> - Preserve private mappings if KVM invalidates a Realm guest_memfd
>   slot before the prepare hook rejects its deletion.
> ---
>  arch/arm64/include/asm/kvm_host.h |  2 ++
>  arch/arm64/kvm/mmu.c              | 37 ++++++++++++++++++++++++-------
>  2 files changed, 31 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3ddeddfacd06..55673d08e3eb 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1607,6 +1607,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define kvm_vm_is_realm(kvm)		((kvm)->arch.vm_flavor == VM_REALM)
>
> +#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)
> +
>  #define kvm_has_mte(kvm)					\
>  	(system_supports_mte() &&				\
>  	 test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &(kvm)->arch.flags))
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 800333a345cd..9af5fe6d87f0 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2861,17 +2861,32 @@ int kvm_arch_validate_memory_region(struct kvm *kvm,
>  {
>  	lockdep_assert_held(&kvm->slots_lock);
>
> -	if (kvm_vm_is_protected(kvm)) {
> +	if (kvm_vm_is_protected(kvm) && new &&
> +	    (new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)))
> +		return -EPERM;

gmem is already generically mutually exclusive with
KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY, so before this change,
pKVM is saying no to KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY for
all memslots, gmem or not, so this check makes sense.

> +
> +	switch (kvm->arch.vm_flavor) {
> +	case VM_PROTECTED_PKVM:
>  		/* Cannot modify memslots once a pVM has run. */
>  		if (pkvm_hyp_vm_is_created(kvm) &&
> -		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
> +		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE))
>  			return -EPERM;
> -		}
> +		break;

Not sure why pKVM doesn't allow deleting a memslot after the vm is
created, but this is no change from before this patch, the removal of {}
here is mixed in with the other changes in this patch.

> +	case VM_REALM:
> +		/*
> +		 * Once the Realm is created, we cannot modify any slots that
> +		 * could be providing private memory. i.e., guest_memfd backed
> +		 * slots.
> +		 * TODO: Handle trusted device private memory slots
> +		 */
> +		if (!kvm_realm_is_created(kvm))
> +			break;
>
> -		if (new &&
> -		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
> +		if (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new))
>  			return -EPERM;
> -		}
> +		break;

Imo this should be written the same way as the pKVM branch for clarity,
like

if (kvm_realm_is_created() &&
    (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new)))
        return -EPERM;

but that aside,

1. Why block creating memslots after realm is created?

Does ARM CCA have no way to add pages after a VM starts? This isn't
blocked for TDX and SNP so I think this constraint seems unnecessary.

2. Why block deleting memslots after realm is created?

This also seems like an artificial constraint, and it constrains the way
the userspace VMM operates when stopping a VM, like the memslots can't
be removed ever, the VM just has to be closed? (something like that)

> +	default:
> +		break;
>  	}
>
>  	return 0;
> @@ -2883,6 +2898,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  				   enum kvm_mr_change change)
>  {
>  	hva_t hva, reg_end;
> +	gfn_t ipa_limit;
>  	int ret = 0;
>
>  	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
> @@ -2891,9 +2907,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>
>  	/*
>  	 * Prevent userspace from creating a memory region outside of the IPA
> -	 * space addressable by the KVM guest IPA space.
> +	 * space addressable by the KVM guest IPA space. Realm shared IPAs alias
> +	 * the corresponding private IPAs, so Realm memslots must reside entirely
> +	 * in the lower half of that space.
>  	 */
> -	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> +	ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
> +	if (kvm_vm_is_realm(kvm))
> +		ipa_limit >>= 1;
> +	if (new->base_gfn + new->npages > ipa_limit)
>  		return -EFAULT;
>
>  	/*
> --
> 2.43.0
