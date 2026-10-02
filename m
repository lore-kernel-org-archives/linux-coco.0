Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23899417BE0
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933685; cv=pass; b=tFWaoqdfRqYZvcO9cQl7ptQ0M7qevYknysK0Gu7Rq1h0TToXPuHVo8Y+d8U4s4rMq4HKhbjBajeivX2fdMfNsBcSJXLlOQiDREwZeNbxTenwuWT7Z3RUOj3LKwYW6V2PulzucIPXcGOVMOVS3iuKIUO38dNCzdcI0wwr8hdtBxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933685; c=relaxed/simple;
	bh=x9JTFIhcYIzkewGT1y4B5m/45uK/p/cDf2r6ve5Iqn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICz88TOumZHq8QSstL7BQW+0VAvKf+pN3Ezlk7DPolF1+3Ho0t0N8teieSuBsuYh3tk+lcdwChUyYnr3lXMVbVY+MG4LpppSOyxXxVYlImln/PmX3LsU/tzY1hGToaqjH5v+rj2wAyOhoAMFmf87oxwXsdn8lSBlcmDBXeNLvEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vTev8OZU; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vTev8OZU"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so6478e87.0
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 02:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790933681; cv=none;
        d=google.com; s=arc-20260327;
        b=L/ITBfHYUNPyU+5aDHbNQWR2xGZcUmEvyEpvKEBaq9sc2pHMMVtCVpdQv2HEzVkH64
         C0z62n6IwIXSQiGDKjbsyhReUNtFON8yJmvfZmVMPhOfed2GMVIpq91CY43a612VrhMH
         6DNTfxuldPgF5stC1599/sIC09+dErZ6TU82kSxNh8MVHXMppS/uWJef06JjbSjv9IP+
         ALWRRkO1Z79zI74LJnpH/M19LFBI4HDLIc5GhaCl+7h7wgsxX7RIBH0nu83wK5lLxc+A
         mKiRHLjDhSeTtCn2OQz7XyO+AZ2oO/xOZkY1d1AUGuxgiccqV/oQUkfsJ5Iv78g+cXNA
         kwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        fh=gaTxE9FliUfqwL4wGYaUcNOT/Ksxq14capsq2tzG6LE=;
        b=lGniBy6DMwDs9uUM2FKBC8krcvM5mR0mrkxvN/WukGHv2WQZobeJQP97NQtyxeXiIA
         6ae9rEFkG6uCHiEOSfIzEomrUK1P5PFKvJTur3kz67Wz1eCv04q/jdtzbuI5OlTwsIxT
         xS15BbEzlwMOiwg6yJDPmx+HcXUw4zsEa/pSyQfAZu4Wf7AsEYAlvCsCQd+OHWOCRDIN
         ZMyqVr9oUJ1Gb5Z0pkz4gXqgF5iF+qK2qLf7VbX59K4SWamRglEnuaN0OmsCf/ocwYxj
         s29ltmwaKs7azthUANj5qj2ScBEvAIsCVOzTYBP5SYo3BPHk077Fv0PvDoQ53A87BlGc
         quCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790933681; x=1791538481; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        b=vTev8OZU5cQuDu9KCAqs96cpLIZh41+WsHZo4IBzVjG1Xt0XLmTBUrr/1fx63f6E3O
         LQ7vesjRbdraYH6q5Q7DtglfDhwx3024TSwqy519EOE86EwV6ulQge+jMsQI+asRg/fp
         WXnFeaNL98QsDbnfgW1dDknzhYfsZOIkFpFnNhcFYH+qvLv6gtWVqFL2aaBkdAYP8rYQ
         vt5+Bs3X/4KzaA+95SZGIWcOKAwQm3dUHnUUbrQGu+lsRvPkdilWKrD7Mr/Hhgz/EzHQ
         KiDlsrg76reXFfysfr3u8GCunkOsCYh8YXBmNw0qEg+gtohQe98Bn9DpehvRIuqTvoBg
         q9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933681; x=1791538481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        b=r3ldinT5dj6IVA9+btiB3H1pN7fgfmuRfdjoCULrKde4wvl1ySbkNFMqa15n5NUPnU
         BXA4Vj6jfTL/VEYbM5vmwp39kOpTFf6MphBzuCJgA7gMkuJ4sGpESKdbsGWZQ6E2pszB
         1L3mGguDIyaRye9Ny8q5pQ4v/xIz2BDtiZkRrssu/r/iq091S9g1I1yOg15DJV11QzHw
         P7UCkkrLalmOuoMkqArndHrXODqn+hwfC149wISClH+g6Jp3xHIugUhryScz9SPBetRB
         U7Q/iPh62sBbPDrwe7jNXM3O4eMHvPBp2O+J8CV+kJYEyQacPJyt+r/DttQLl7YSyw1p
         aAQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeJP/A8ykWszkxRTbDu5Zr35TbFmVVpqhGZmD71P0TgbsuSqo8bP4ok4YwfVoNU0NGT9TLIuBjs2PA@lists.linux.dev
X-Gm-Message-State: AFq9FYKnGMg2sq1UWL4BXsh8mTAsBvIalfQS6l6iKrd/IGqZHfQOijen
	O8k3t+60s1gTmQmGUkJ2z93C09X+vauXUxRCqjzwHbKLurmb9EeAkkadg/JLq6mljW9I82DlZyS
	xcVmZlaoHhuQIYIDxMnvshwnE4eS8KpWU+zyURdox
X-Gm-Gg: AYBFou1N3a3074jt0BPkzaJ4MYmZah1+1TYKTaRlQLHmm1sfNkQMkopHaiPyHJYFjrL
	VPY02HQqQbkjnySI/rJ6dTW7ILIrNwIsL1BZb/IExpZIg7gB47Cq9bRnGzAqFtaYupjDpail41r
	WzgO8JB5DVwG8fHIWG8Tdjx3OmIVZu77Ejnu3lBMrxxnPkR7tU7BNXXEKc29DGme39OsiXJeNjZ
	Ufyu6OeGYxydHKWj0VnVcD2K7F0zdmd5SmQPFQ+nZEcV8E0CflYW2HYDgYBHAjlnfj9NwbqCSWK
	Dtt4aK7YkhtAmJOfidGn4yOOoHfHWrtIhxUJCQ2b5C+z4YJ2HYescHO1vP13sdQ/XlDGSCO6MYW
	3MCP6RfO1wsA+DA==
X-Received: by 2002:a05:6512:6d1:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5bb7c948658mr120571e87.3.1790933680638; Fri, 02 Oct 2026
 02:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-19-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-19-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:34:03 +0100
X-Gm-Features: AclHuK90hdLcclI22eF8PMzgsUup2Pu-fPsPyAyT7zN-k3WxhBppCUIye56E7qo
Message-ID: <CA+EHjTyyKxW2TT9XpjSDkdjWEuGyWmA_isDpOnoyri8ikxZN4A@mail.gmail.com>
Subject: Re: [PATCH v21 18/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Thu, 01 Oct 2026 22:06:58 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
[...]
> +       r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +       if (WARN_ON_ONCE(r < 0))
> +               return false;

The fix [1] is in -rc5, so a rebase conflicts here. Please make sure
to carry it into this copy, i.e., a plain "if (r < 0)".

With that:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev/
