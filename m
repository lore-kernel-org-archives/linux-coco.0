Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3393FB7EB
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777659166; cv=pass; b=Jb+n7iojvNiUWD7q+43vPcACS48hGWcCMrqfNl0SA5iSs/O00vkeLFeyuld5OILS3x0EGVw9nEPe4ZenWw1iayyrKC9hcagPp7yx/jACVSOWLJ7collfV1mi+bH1q02LRH2W0RO901CsbkKGVM2lzWOPK46XqXPdHgttQo3OHL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777659166; c=relaxed/simple;
	bh=Evb7pUiFabj+kz7Z4hmGLA3FozrlLW7MTuvahXfdXYw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bePyr3HPOveDfbYtDiFuyJMxP1/c24h8ZV8csmlpv7NVYhz5+UxN8P7Ua8Vk8l3bDctqxgKEFibNjfNIQhR4QO2y0ROSQ1eqGfReB0gkBpmsfCHm2rn9/G1frsgqOUFrnU4ERbrSr+9/NfFXFB6B4IltbBxchmsd5cP/evKjIbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=siIPRkAG; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="siIPRkAG"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so1377417241.2
        for <linux-coco@lists.linux.dev>; Fri, 01 May 2026 11:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777659162; cv=none;
        d=google.com; s=arc-20240605;
        b=C/6e+pYv2N/iaxFjZwMRedEgbEMo3ST/Z+chZV96NzL3CCC27NjsTGb0jIe+GHbzWQ
         TLD5RtZHIzUuQiicDWLaYFWPnN/+1vnP5/+WcQpG257W3Za9hQGGBOV0PgIkKRWh1KLi
         Dj3HXvwFAGE4q4YjYvWDjIVaGvzL06ciuWHihtndw6eBEbYX6Qki4ooDzhQudwyot52g
         IfoQLYrRwLbUHl0UTY6CtlWn6MsJIRgMj2p6K4esQDOc6mdO/BeZ2nsRkiJP2kll3UHl
         aRJXK8y5A92WAUOnc63fCmYz7lPBI45+lkMLY5tjQ0CCLT/7DQ9CrTHRyNIyeYcGck0a
         OgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=A/Y83NyQH5pjjwFsH83zSujxJ4pp2R0dNDGRnTykyOk=;
        fh=ZLroCssy70Ee4ZG4lXu2Zfq4T4o+ZjI1BOOt16ig6sE=;
        b=K79s0/IdtMh1O7UaBULqbO3grOl5ngsFG6MeFDMODuanXoCr4jxygbCSq8tyjgqOyn
         XbEbcWCs5D0Rlfo4e9ap6KrWSWsiV4BL1sy0cVinposQfNgrAc18xgGQUlS9MLA+YF1m
         sRWXe14HpV+IbNHHzz5o/28QFKjeQhhtP4M2jnnUIH6SkmXoJvPRn1p5irpSxnlRm7zf
         k1yOd/ObTr6JTK75VGtGUTWsyIiWOrM3OQoH2NzAml72ERo9gEsGAlWloKM/ctuWXWrv
         fGMQJhGzRf2Ceofsu+kXq0HmNppdTf5MJTk68QfPs4iTGJ/g0ZVglOmVI+JMBLI6Cf2y
         R8HQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777659162; x=1778263962; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/Y83NyQH5pjjwFsH83zSujxJ4pp2R0dNDGRnTykyOk=;
        b=siIPRkAG3oI9xQjwaOYxTxd88KgA3mYM0jJHZqm6PXuPjGFJicdVco5fLdg7BKHWoY
         /YVEZlO80WmmWdVmu+NM7mIgsObto5p+UQa5lOQtY9cIByuns7R1eDkTbW/b1HN3yR0l
         HoA/vl8Le5w98bE/XKtq6PPPczpUDVsT6/NfKd5E1jQsZLZQ1i7soORljEJl/FAHXPV0
         uaqC2tYvfbkrhEJLsVaN5LbZqOYYq3L31A32tEsCQN/GEfCiXKbHQJZiLj4J3Iy2oJjl
         D0jDXAQt594TEEo01+/ClzRY1sB7mU6REHcr/mPylNQeP8DlxsvkTd+d7gHvS2DkCB64
         vG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777659162; x=1778263962;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/Y83NyQH5pjjwFsH83zSujxJ4pp2R0dNDGRnTykyOk=;
        b=s1sCdAsf9zWHscomc2YA7rZVJCri/YMJVZ2BWwRu7JTTXhy6eRKVXgjv0/33T9UwD8
         uxd9LOANod9nuYHNFbIyld7qrnlZm+pWMl4ADb1td78etL2EEWLme2eq+gtqNd2UoKxs
         DzfSX0tWJQYthLCemjw6I+u07BVpQfxW4Jn6yekPe7JhyqKfAmxm3Zw6vThXy210Mwob
         6H8Yz/RcwHZbwDkAjKb9oPnyARG+8XkENCI/Hil+A6PZ/ValSjmC0ghEugkbDLnHOVLm
         8R2x55NsyiDctLYHwGoQpVEa+aHOHW73pXBwuUOaGei5NKmURqrQIn3Sow3JURtn14mX
         LJ1A==
X-Forwarded-Encrypted: i=1; AFNElJ+eYwAmfZggf9eQF45lcKZZkLxjnvaXf671VOiTP3h3oTXP0s+ldmeTCWVcvx0jhz304THRKc0kZUsn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3sQIJ2/A7/6HeWJIoR0/Okskr73BjB3TOhTWYRgstVGfOoP3L
	hXbv7zZkXyUvXyPhBS3fTAA47fUcj0hnjsFc0Faam5ygeF19BfPgLcPEf3UVmmtv7XeI2bvFM5Q
	nLgsXMKeLvi5Zk0bzmAuOZZEuf0v2KoI4otVvcf4d
X-Gm-Gg: AeBDiesjGiAnnX3kbzX1K6dbvKiO74iqqhtayXZH+JiJJ52funuqQir+zZVds5m0yFM
	sHDXzfKuqlQHmocI8801UPusytsoiL12oscPBj3FtXLxSJctDJYmTIHJjhklwF1GD29Ewl2he8i
	DWadQeFHe+EErDFZelya19+03dk7bo87iGGRCOqxpnOtLQTvIfCNrKXqQMCLT/NTaeywPOrUNLL
	DiT2fLnLQOS3yuNuFG/uW7QyD7vI7xfhuCqcuy/W6CI5gtRZZMvdKxbjAbZHZkL6eD4AIM7Us7f
	BsD+fU8nSKhnvvazAgY8VVLxwLf+qxeDNcERe2xGyOUR5WdsaUKKmLzE+ifKIIa5xXGJVCcep7w
	39g1rvw6Z72huJOg=
X-Received: by 2002:a67:e116:0:b0:605:5d09:8631 with SMTP id
 ada2fe7eead31-62d87c925d5mr189727137.29.1777659161523; Fri, 01 May 2026
 11:12:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 11:12:40 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 11:12:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <846263383f9b6a08fc87ce6edb931c912f68c60d.1775874970.git.ashish.kalra@amd.com>
References: <cover.1775874970.git.ashish.kalra@amd.com> <846263383f9b6a08fc87ce6edb931c912f68c60d.1775874970.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 1 May 2026 11:12:40 -0700
X-Gm-Features: AVHnY4JCk1U3ofCsegg3s5i-0XLTqrNFTyFRrFp-Tgnyf0yeEIzSs60Geh1Ze08
Message-ID: <CAEvNRgEC2NSROZWz8uxnOSD6t8s1KmmFrr92=e8s30PJzYhQ1g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] x86/sev: Initialize RMPOPT configuration MSRs
To: Ashish Kalra <Ashish.Kalra@amd.com>, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, 
	peterz@infradead.org, thomas.lendacky@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, ardb@kernel.org
Cc: pbonzini@redhat.com, aik@amd.com, Michael.Roth@amd.com, 
	KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, Nathan.Fontenot@amd.com, 
	jackyli@google.com, pgonda@google.com, rientjes@google.com, 
	jacobhxu@google.com, xin@zytor.com, pawan.kumar.gupta@linux.intel.com, 
	babu.moger@amd.com, dyoung@redhat.com, nikunj@amd.com, john.allen@amd.com, 
	darwi@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ashish Kalra <Ashish.Kalra@amd.com> writes:

>
> [...snip...]
>
> +void snp_setup_rmpopt(void)
> +{
> +	u64 rmpopt_base;
> +	int cpu;
> +
> +	if (!cpu_feature_enabled(X86_FEATURE_RMPOPT))
> +		return;
> +
> +	/*
> +	 * RMPOPT_BASE MSR is per-core, so only one thread per core needs to
> +	 * setup RMPOPT_BASE MSR.
> +	 */
> +
> +	for_each_online_cpu(cpu) {

Dave mentioned hotplug in v3 [1], which led me to check. From this
series, it looks like RMPOPT won't ever be performed for newly-plugged
cpus, is that okay?

> +		if (!topology_is_primary_thread(cpu))
> +			continue;
> +
> +		cpumask_set_cpu(cpu, &rmpopt_cpumask);

nit: perhaps flipping the condition is easier to read:

    if (topology_is_primary_thread(cpu))
    	cpumask_set_cpu()

> +	}
> +
> +	rmpopt_pa_start = ALIGN_DOWN(PFN_PHYS(min_low_pfn), SZ_1G);
> +	rmpopt_base = rmpopt_pa_start | MSR_AMD64_RMPOPT_ENABLE;
> +
> +	/*
> +	 * Per-CPU RMPOPT tables support at most 2 TB of addressable memory
> +	 * for RMP optimizations. Initialize the per-CPU RMPOPT table base
> +	 * to the starting physical address to enable RMP optimizations for
> +	 * up to 2 TB of system RAM on all CPUs.
> +	 */
> +	wrmsrq_on_cpus(&rmpopt_cpumask, MSR_AMD64_RMPOPT_BASE, rmpopt_base);
> +}

[1] https://lore.kernel.org/all/ab41b1d8-e464-4ad6-ac07-7318686db10e@intel.com/

>
> [...snip...]
>
