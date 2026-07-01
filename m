Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4648A3A7F6B
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940517; cv=pass; b=WYqfM02BuPG8i3T7VzdfwBbsqHsvOG/HMLqY93OrheLwindd51/EVQtAu7I8aTnfWPt3ZGF+fCmzM2hIbuBJEiWPXdUmZtJYq6AfsWU81EgVfzzMYZhYrj3kFtNsCX3mot8EUAS0vBQBzd2umta90abHaA/veiN1ohBb1mozeEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940517; c=relaxed/simple;
	bh=CkwVfY1nmZ3D1jFCA3niLHpZ2cVyZBfyXndQ5/TEkzI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxxuECshvDMQkYsJ3S0thUoPsnKpjM6/qqI2NPIBBbwVwBU+g+WpEbzilx4hOO5kRyZ0xqfzpyiC0ULC74lM6mNh4ya4K5uzFlTXEcb81gq/q192PH1Pb0VHroGBxStQPm9NMOocnTZ4Og9wAommo4qF+TiriprleXURpsCVQwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uPz64zHK; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uPz64zHK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so17910425ad.1
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 14:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782940515; cv=none;
        d=google.com; s=arc-20260327;
        b=KAIByaHdrOibVrIj1mIy7Nt8N2IYM5EuXxnTAbU7Uo+M1dCNKks+pDWwPIHdhWBee2
         6z0KhH8sYUqnBiN/pp0dariQJm1RX5LMuRsiJ0bfYpXS/UTCSUXKYTlg3DG9iKZx1pbA
         XlfOxzoFiW7iIMj7dd2r2EAY6YCojrXdoeoknaWKTCGqCH/QETyf9Km8tjSDvbtUyTRa
         LsMWVskVjZNqfb2CEOalvMAjeM3EjxrbqJUqtERDl8CkPcAFR0olQYe7dql2+T2C0sG6
         sUKUEbH8/WR/Cu09Vzmz9ZGxwB/FoSdu2J4RkyBt6Zp6A9MjAicRJj0dMRVCBew4Ou1e
         F7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=hdj0HDgY6Dfd9B3CG41MszDY29ma1ezvlMosUMSNXGo=;
        fh=g0UIGG3ue4+M+laj4r0WkrsU3vUi7OeuOI7yY2rDBSI=;
        b=R6yfuz5QH2gXHxLNmxKSYRSccsn6Sf6Ko9yNfeezpOFScmruXfAOg61ByYmNv8fEVP
         +kO0UXmHptBY5H4K/dRIKS8Of1/RqSckhwiEQUXs26//7UidVmVwRzs0ZyLzh0nBUrHz
         QDFqxKnlRLgb5ke3OkcH88RuMPC7fE14yao/f0i/Os9fUaQ94HDSqR8DdBGme5HpP82n
         8eIbCGKYh+Jt+3i1sKX+AwVV8k3bDw1pnVZJE5rQIZBy3tQWG1ll1WQ+6ZNNNsW1DJQ/
         xpfHrnqlvZcf7esmi8D+TXich3TFdwMmWVzW7eEkqgsPZ3t6jf5oqlkg4MPqTn12t5TQ
         rigg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782940515; x=1783545315; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdj0HDgY6Dfd9B3CG41MszDY29ma1ezvlMosUMSNXGo=;
        b=uPz64zHKGFN8altsm0TOK8aU5L7PVirHPj87yaI6C5ELAcVbUbqvE4Eb7sLv5hPCL6
         X9jU5znFKnaPIgjNU5vWA2Jn/vIrew/uyC8mf+BIBLwvHns8/SOnTZn8si7B8mW1gEiq
         OUfTcWZJuMdZrq0lqYsx2kxou9egHB5/3MWcWSBsyGtRDJDSprUfVcB8WQuVaDaPQiTr
         uL/nYxA0759XxmV71N+7uG4omM12P80X51tsi3nY/GfMAolklE/vujYixwz/zYyjmcW1
         UsU3Cl8REsEs7Pg5EUTwMYKm/TESiyXuyhXt2m0ylfNKucYLh2Ga25jIDTLEKx1qH6d3
         zt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782940515; x=1783545315;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdj0HDgY6Dfd9B3CG41MszDY29ma1ezvlMosUMSNXGo=;
        b=EsXPvY7qtJ0sGrpAS0sO+M+CZNJMd20VWmljpllI1vSKt04qV3TDA0sr4PiuHaHGQB
         nAsOXvZdT/zVhWkh9EeNLL901fw8tkRs/h15wPWaewdbocrx/Qe56M8MUv9+71nz5Ei0
         WCGCF1ndhLz+HKRa/iC7mVUu4Ijgw8lw83cEsSO9ipb9U/bdwxrgfGGzaPMfIpOEhhbF
         pnxgDrTW5bZX5PuVy+EDQcKC6sMfgwckZ1Lm9T6I+2DT/NJilN//kJ6h48Cl+13hzzqd
         z3Di7jDJyydtT3e2pFmV//F6ZmyVCWBzvfeT+ExFKvUzKm3QyTHA3DLOc0kijCvoLHhd
         vnKw==
X-Forwarded-Encrypted: i=1; AHgh+RqsLUvo2x/keOgRNo/LftmnmKctMIrqJ+omFueCPlxt762gABvyR0+Y7xOTZV5ks2V9XPgvxsoRUU1K@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9sl2i0/PCVTmazRP4AMc7nJMFGlA9+4o8ds3d/ov4DuAZIu8C
	stzMF56ZEUydxQg39XDjF6QcdcIfa2Pum1x4GRkt8mAmiZ0tlk1vScKTYZRnDt2Y7C0LOA4zxlE
	cjYBwUO9QH2CbWuCWifcoMIvjYSjZ44Rjgt8OPYc3
X-Gm-Gg: AfdE7cn3ogzXoE+ItfQhptWKLH+rLRLrZrrdMiytR+Ytl4DJ0ZTpY+htBZ3Am5RajgW
	0yAdLE3RqOUkKZH+yuws4bGKmDF86y2BdtR3hxtZ9fiE8EWc7ZU9DL6INADeH2ttmi6scRjJ0Dk
	8+3G5qPzRKUPYjlaFDOFVO0rUg4f8SR6+RdZ/OskQ0m5uIR8E/3sKZwhlZgGhEsvPXx913y8+nE
	HYRUFg/DdEdCITUQm9dv/0wqAzLrvORszGjTAW6Zf6pGxRmGJIxtc1wfQSB2nBQV16XMAsn3Xis
	pY7PdSq4Uqs5AwevL0TPLyHGyZ9Q67Sfr8m87w8Z2JZvlqGaclZVyEhPBks=
X-Received: by 2002:a17:903:fa3:b0:2c7:c385:c5a7 with SMTP id
 d9443c01a7336-2ca44a3c734mr65598715ad.26.1782940514709; Wed, 01 Jul 2026
 14:15:14 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 14:15:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 14:15:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260630213711.479692-2-seanjc@google.com>
References: <20260630213711.479692-1-seanjc@google.com> <20260630213711.479692-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 1 Jul 2026 14:15:13 -0700
X-Gm-Features: AVVi8CePIGZCD784dZYKnrRLqlsP0VAkKm3avleV_AoQHT__5sr4MRrtBRokfdg
Message-ID: <CAEvNRgEK+LH+M32LrxFSbN3Nf9sYtAVkr2c2vYq5FHzJmJqL7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: SEV: Explicitly disallow NULL user address
 for SNP_LAUNCH_UPDATE
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Joerg Roedel <joerg.roedel@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> From: Joerg Roedel <joerg.roedel@amd.com>
>
> Explicitly reject a NULL userspace virtual address for the source page of
> SNP_LAUNCH_UPDATE instead of relying on the post-populate callback to do
> the check, and don't WARN on failure, as the scenario is blatantly user-
> triggerable, as reported by Sashiko.  Waiting until post-populate to check
> the address "works", but makes it unnecessarily difficult to see that KVM's
> ABI is to disallow a NULL source page for non-ZERO pages.
>
> Note, several existing VMMs pass a valid userspace address for the ZERO
> case, i.e. KVM can't *require* the userspace address to be NULL for ZERO
> pages, at least not without breaking userspace.
>
> Fixes: dee5a47cc7a4 ("KVM: SEV: Add KVM_SEV_SNP_LAUNCH_UPDATE command")
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260611125849.9ED631F00893@smtp.kernel.org
> Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/sev.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 74fb15551e83..621a2eaa58f2 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2330,9 +2330,6 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  	int level;
>  	int ret;
>
> -	if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
> -		return -EINVAL;
> -
>  	ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);
>  	if (ret || assigned) {
>  		pr_debug("%s: Failed to ensure GFN 0x%llx RMP entry is initial shared state, ret: %d assigned: %d\n",
> @@ -2421,10 +2418,12 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>  	     params.type != KVM_SEV_SNP_PAGE_TYPE_CPUID))
>  		return -EINVAL;
>
> -	src = params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO ? NULL : u64_to_user_ptr(params.uaddr);
> -
> -	if (!PAGE_ALIGNED(src))
> +	if (params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO)
> +		src = NULL;
> +	else if (!params.uaddr || !PAGE_ALIGNED(params.uaddr))
>  		return -EINVAL;
> +	else
> +		src = u64_to_user_ptr(params.uaddr);
>

I think separating validation from src assignment logic is better, like

    if (!PAGE_ALIGNED(params.uaddr))
	return -EINVAL;

    if (!params.uaddr && params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
        return -EINVAL;

    src = params.type == KVM_SEV_SNP_PAGE_TYPE_ZERO ? NULL :
u64_to_user_ptr(params.uaddr);

This version is also slightly stricter, since it enforces that
params.uaddr is aligned even if params.type is ZERO. (unless the
intention is to really not care about uaddr and permit an unaligned
uaddr?)

And then with conversions I'll add

    if (!gmem_in_place_conversion &&
        !params.uaddr && params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)


Just a suggestion:

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>  	npages = params.len / PAGE_SIZE;
>
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
