Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793700196;
	b=gNPX1oE7s4ozsUi8wD6MEafncVrwi/YPbJ7Cs3nViq0gr+5gTeOuBcvbD4BaD79ZMd+s
	 8GCdmZUPdQ057wsBwYp8Et20YIx/YgcxMvmRrN9F4kRgtlb/mDCNM3wqhDI97tUBHMtpv
	 nluBC9FEqk7Eqt6eL1anCyJ+qKg2j8XwkDSNYeScYam40v7fj2x0tnX2NgG0tmSTW6/QE
	 4vXElgO3zljcJ1xCiwK7/Qq4b0gDe7PW9EFD6biMTXjOMy6GskuBYL/fb8luSz4wjZPF0
	 QcSR4sYlPoUVLMyjHROKfqI4xMms7hMMjj2AHdm8s6m6OTKrRQcyEPF8FuM8n2UScUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LEg0SrmO/VhGhY9o8Sggz15O+9RUdwZIrLUomDbcYAw=;
	b=lyvUEg+HOFPf6n2UWBh1dNX0FyLVBYgdSA5Oqi2mkziFN3FqsofG4D6+y2imMdH7S6vJ
	 9zL8SiikkSFNIBf9ANwrUS7rFwo05npDbd8RoqEoPyeS/TW2Bi5DFCPwVIB+BipgNSOku
	 2Y/e3kXHBsnvFGKuhW2rCxfZWyKFtgR/EBGhmq51ulT2R3QgHASht9J9Hv1+gTe6cMGmj
	 S0BL68PJ3mrxJ23JxavftZrPK+CFbdwkq6tBAlwlvHcC00nDqf6hPMob15I/T6DJJTLxB
	 EQ7vzH8xv5fUorXwunEWKs0GKwrmLPN9acAgznH1kdS/FTkfTtE2dbhVUj4NB8Ana1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=UYZV7VUz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE5F606A334
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 10:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE5F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=UYZV7VUz
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1afdf5196so1313923eaf.2
        for <linux-coco@lists.linux.dev>; Tue, 03 Nov 2026 02:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793700195; cv=none;
        d=google.com; s=arc-20260327;
        b=g/ViKk75zTlcU903J5Y/UqyhG6woJ1kl5Qsv6fd1E7VGdmRK7NPN64w9fsh8lsyCzs
         DRUnnIeQbDjRkHemXn1tg332dWzpKvcw2SQuH0HkMgGjshiFx0za+78I1/wYLxOgNXkR
         vDb3Kfm44t5TIk0hKhVC/eEB6/wJg3RESqo/R7/bBIra1OpmDMc4vzXoLxQ0MAXv+nJt
         u+ksMJyFXe31WDPmcxps9znmMGVexjWAVMIus8g3wUbc8LpBZKyoo+b7PO3qYtNiekwl
         WA9mF/4Y7prZQwV4xVko+mYwUDyofcgpzEbLSm4zu1NuFNChbNoUKGyHVU5dP608kZPX
         nmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LEg0SrmO/VhGhY9o8Sggz15O+9RUdwZIrLUomDbcYAw=;
        fh=jAQdCTVBxv38GVeCjVQHJtUR8mnJ+7aZ+YcPZmDhiKM=;
        b=GiTrdUXs0UGhnCLXvbTrSwrgbLvU76HfxbPcJRXq7v0GK+wrcx4wWU/bpTR7nVXEVf
         lNtiX97jrLLG7CZa7tLauyODrPmSGKspatvLoOe3OmvmXnvaKNH0PrPKvxZVw+PsOJON
         RPVn5pK9/JO8plZYJ1uU6KSELcH74jsigApYG8bqx/gKx4GEIh9P0awfhj4M5EePnUK0
         5AuW6wyg3gbysFtD+8KA35vzo8LYZLCK5DmrPiC0nbTcsz0SRvJLuUoJRXv5TXHoh1IK
         JndCh6uaqpc4u5P20ikfcNRbIknACLNg/HyK200K9435Fq6jm+Jh71RvW8yKQAWGjMxZ
         hsLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1793700195; x=1794304995; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEg0SrmO/VhGhY9o8Sggz15O+9RUdwZIrLUomDbcYAw=;
        b=UYZV7VUzd3Th67Lh9y3N4eN62/tLSAFgKlZK4C1UeqIt3bcfoaNkUQcdrvEyCp6gIb
         FR8ehX7h+tixAantsk6H8ZxHCkCFUpEjjvBsM7TXJJC3tpoqJdkL3fvcHnb73RYaOtz3
         Ru2l9QLCaxsYXKf8PPpnRaX25qEkiMv7iPo5LTArtqtu6+JfKTfxlMJCWigReStmwg9Q
         pAU0Eg7ABNqJ00QKDPNrZvi5QepabExZR9/a171WMv9xYd0Bl7AfL2W4Q+czK1c3vMIm
         mN+YPI44xACKeZmeLlpK5xnPnJ1BBSPHZWv2D6zNnZh2eXjstyd5kq+d+0ushpZDac1j
         cotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700195; x=1794304995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LEg0SrmO/VhGhY9o8Sggz15O+9RUdwZIrLUomDbcYAw=;
        b=X8DA6jy8VjZglZujjK1K/SmOKqPWsGZIJfnjvet/sDyZ+efxijLxmDKQTuGJbsYtU+
         ScYOlfECRLmumZ0mb+Y6BmDO6+PQhgtfzc6eQpCK/0VBwyhXjsC5Blcu08wFWnaY+FRm
         TJ2n0aMIafBZZ3ZjYGOsM6Os1qjXuKjWpNI1zMuTuzdvrtJSC6z8UXimAYRXBaH2zUhE
         419jQ3MmMj71Q/N3IUg2Tku+cP1Xqb9Scmf/eihRNJ6BXQWnCjjFxGNpmGX2o84FTi5Z
         DJ7Dkph8Jbh4lwpjJvFJms5qyOq21YQjr+inmlAp1JuGodZ8jXaZbFC73MenZsYZD3hL
         LrnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB0hRst1HavxX1TtlGYj3y/pBiruMyQaHQDPwR67xoFsrP6CrGJgsyaq2T86tHs0/spSLaw1vlbyR/@lists.linux.dev
X-Gm-Message-State: APuU4Z9B/Bjq4X93pXKAxvo5m4JsItRpfRW8cCK/qGB5kj63JYU5y2rz
	AyWvQ3rk/qjq6UUb74sHfyBD0QnFFgFCHR2E+O5uFvngsrvok+Mv0hetQxjNjLXj+lHZPnZKi/p
	JU8A1+vd2DSgW6fbL6OHtgxEDm0IFF0PP+L8bGpvqPA==
X-Gm-Gg: AYBFou0NMAYWiGAIYJbh5VFUNIvML+y9VwmkYvB89tpttlq8y6xiYx9KoTV52bM+rNH
	Ow3oIOVEyTGxbIgZUcJSnxULHzA5IR18VTEVwHaGooSMCQSKQMHiLX52hy+96848S4eU6yioDeU
	lmhg50Nh2mLhmQ1/kJNEHH6u0VLeAGkuoJYl4tKtWIm1x4mGotX+6DfyFXBTFHjr7oyv5nKFuVJ
	hVEGsaQISAvxqItPme9GsQD0391QViO8i2jei7mDKOO8Hq7LXBu57r8x+xcIK5S6PZlzS3vj1NJ
	v6novLvsZiF2hZwHSYgcJwsQV5S0TUt8bE5vyAx/j1Q9h4kQtx3tUi6OWfw7B7mR5oJxWtsl1BV
	+B3IRo9oVENxAtj9Eo3m0D5LEPbdDNl684nC7wcmayL5NJSMLxWdX35Y5r51tUxAhYe5UYmDXgO
	4Au8tvV771mAXGO7Aaalw2eXBsbpVGZuqokb25EPYJiqPv5kRCohDPPqxy4Q==
X-Received: by 2002:a05:6820:340e:20b0:703:10f3:89f1 with SMTP id
 006d021491bc7-714f2965e33mr4202725eaf.40.1793700195111; Tue, 03 Nov 2026
 02:03:15 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net>
 <20261024-tdx-guest-quote-poll-v3-2-6a83bb767314@flashbots.net> <7a832e5c-eaff-426f-adff-7935be265bbd@intel.com>
In-Reply-To: <7a832e5c-eaff-426f-adff-7935be265bbd@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Tue, 3 Nov 2026 10:03:03 +0000
X-Gm-Features: AclHuK8r2SlXD9z5feGLL3zqeEwt_maaNYZRrrX02gKnp7mXSTM9MjCJhTQJcWI
Message-ID: <CAKV3HMNEi6aU8GhLuszn8Tmn4aOZBb9i0Ueq_-xre6KUBYssGA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_2=2F2=5D_virt=3A_tdx=2Dguest=3A_Po?=
	=?UTF-8?Q?ll_Quote_status_with_exponential_backoff?=
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams <djbw@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Jun Miao <jun.miao@intel.com>, 
	x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/27/2026 10:08 PM, Xiaoyao Li wrote:
> I think it's possible that the host VMM completes the GetQuote request
> before the first check in wait_for_quote_completion()

Right, the loop checks the status before it first sleeps. I'll reword
the first paragraph in v4 to:
"...checks the status of a GetQuote request and, while it is still in
flight, sleeps a full second before checking again. Unless the VMM
completes the request before the first check, every Quote request
therefore takes at least one second, however quickly the host answers."

I'll send v4 once the discussion with Rick on the cover letter settles
how patch 2 should go forward.

Thanks for the review.
