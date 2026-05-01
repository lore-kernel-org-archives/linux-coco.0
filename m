Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482DF3DEFE3
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777661869; cv=pass; b=Mx0Pui0+uW8jkpN2NkCVcvIREfh/IG3FYIjobjw7aTymQ+zC4mFCR5+RuAIiDSGR9ne0UcKPuUxWAqaw0ldD5g62P3ZtcPVMBdAVPlggCiFl52MN8BLNugAWzrdwO/gxP+xQAYLRQBtqgnHfgej5DaBCrwouUvGh+sl9Vo2Bk2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777661869; c=relaxed/simple;
	bh=Koi/x6eiTTEG0emLXyoyoxitRX8hdub1AnzYnT/nULQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2ADs1WMY8LxpXD7nozc5SSTv6KHeELr64WapN4CvLQgF2+6lhao77zDkOa4eRuygbd41FKiUfrBO3PsEdjaWEc2myunLqRaZZUhkvlIpqj4preehnP1goM2yzboaZUfMyW0wH0UglU2NuL2/ZrUQyUstwf3Tcx5LLca5NkeO1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pYNF+v7Q; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pYNF+v7Q"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-95ce0cf2d4bso722386241.0
        for <linux-coco@lists.linux.dev>; Fri, 01 May 2026 11:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777661867; cv=none;
        d=google.com; s=arc-20240605;
        b=lYNJ9WwMFRBZ69bcLNuM96ovFtPO9vQXlN3IaukXFApnZTRIi+nYvDWTd1+CX6RWpU
         uVa2DsMiG+40R67MFvF0p7sEc3zb3Bs9BBk3V0gZ5QHLlsTWPBk8xpyCaA2ZRELsvqpO
         VcQbZXoXaFN7Gd6D8V9HRYn0O81HmHw3v2bnKGSCQ90NhZDJ5KTpOflrwxB+ePqc7rgO
         5uWxumIhx2AMrZ99wrndjOxZN7BSFz3/gBAZDFU1OqJCkP1uF6UXAYQ1jAj2VmnylWAu
         WtBB5yblUjeG5gr+eecLrEVg44+OWxJJeq12X9auRY3KKlZ2i9DFI922HXhqSUt8O678
         Wy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=2wORHHkll15fgrTiDIYC4jYGmLh8OaJoz0awypHbtgE=;
        fh=VgCYnFTqQLls78S0OG0CCrBlmR2ObI9FxQUEjPEdn14=;
        b=khgciQH6ziy8I1WrWoi7cGyrhpqYNse8HttPVTETLaTtKzE9C8SHdEjAHGp6qNeDy2
         y7Wk40CdBjOlWXSFMBgOtpYQ+sT05WvL0Y8rWEwGiCu5YbRMOX9ywknd5GPMd8n6M4/m
         D+fSXpf+a/bH1F/Xievf8ldK7/qE3DFPJTMcNs+htBI8tb80+3bcXVvLfNusXfxMKWXv
         otEOwjXLy3Rl8LmxBI+idmQfF9U6Ae9sL5mnb2X9dKy8docHNP8IfHvYSbFatj7x6+8O
         8bIiE+M6l+YC33gfCPBY/Y6BJqr1TqczQvw3txIxTMP+uEqU8pbjtw/Hg1Odoh+9ZpdU
         6U5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777661867; x=1778266667; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wORHHkll15fgrTiDIYC4jYGmLh8OaJoz0awypHbtgE=;
        b=pYNF+v7QyOWe5r4r9Q+PMP0UsMarOHXzMzxYHNfEvycF0QgwwOmzuSJSAQVaPjFrdg
         075+6BH7pRfrugMw0IgF9RmBp9cJ3EZVJNkW70cbNFC4lUOTmQ6VYJsO+bFMYZ/VdUYO
         w26CGw0N+F2PNhmEcQf0fh283Cn/Ah69KknDVlulv9Dq06jDKD41/pFUTkjUmhZvmKC4
         4hr9qoRg+GFBbiF/oAl0sFRyKITeYldTSJ39o7Hyo2XgEmuEpJOZ43X7Q65MeTbL/clz
         iPvZTN0Pzyr7SD4yd0hwVABc+LFc242IqpSPmxBDhfymEvGKeCkL7EOcB6Kgd2BEhSgS
         IsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777661867; x=1778266667;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wORHHkll15fgrTiDIYC4jYGmLh8OaJoz0awypHbtgE=;
        b=G7SauVBo5JiLEI13GaqUAMEVHsxS0cwp66JYZMbvErjlrLzkeYsI/Jex9Kahw5M93z
         hlFHL9xchKnSeWyjEFnF5EE4QIv6BZvcrfRx9oSq1YePZ+BORlmBkNVgUYaPpTF4kPwm
         dWNqbX2GxRs+T0R6AwtdMdYkDqJ75juAM/7AG9AAJghVvKd4BGQxrq+fGKmk5DiYzDaK
         GTyJKMTNepOZfkHFZg0Xuv1RiLdzOT4P9pYXUsYJkCyfFfbzIj7PKvXZwyc00QapdFnL
         G6faSyUVRkLN/qmvzMxZvo9DSyz12eY+8/v3gxIAiN831tvp58eSL7E1d75jTRYyFp5n
         gA2w==
X-Forwarded-Encrypted: i=1; AFNElJ9GZ6TsGZ5gFyxJa2YG3/UDUJhyTazZC2RhfdudImVXJHjQ0+Q9rVobdFrqVLR004rmNEAzoxD/V11h@lists.linux.dev
X-Gm-Message-State: AOJu0YyNlmrc9P4OEiEIGlH24ZRPT73nVsDKf//ZyyQWn6tAfyMsjHk0
	SohgPUKDgsb7rXuZWUhwe52vQb0DzAeMrWYq3Pg7Dj+Ry2qSFCilTbnMCv193wP8AnF1mVLdw1f
	RBpF4SHTySC5baZTwxr1bLCvwQa+6Wg/hdMGA2q27
X-Gm-Gg: AeBDietgpFIM9utbdANN1kkVgZ8z9GOHl+y7uMxZmcWysVwF3m3QLkwqQekmoeZ38Sm
	/ngp3mSea22gSHVpcin7n4AC6WNUBdVLvZ4yL84VOATcIA1iwJrUvbWKOUdfod16GF4RztxqwxP
	2U9MhJ4WCFAbJe0MEyhXS0z1QQprLIa7Pjz5hfjpcW1m2uNw/nnCNM9Q25cjcJw6B7IOOX55rg5
	JTxzNuDmyk2q+5vj3ak+NbfQHqk1EjqhMISaaJTsQc8HdniVJf29ciQWZVE64FaZ10ydLXlP9/b
	U6cOZgwhblyEx2Hx5b04bNkvMv8MQ2S0FFAWXfqcAswknANYP3IVSZh9kN+42axwNjlemFslypZ
	LnsQfbTdtuEkEAGHi+OJMaZE31g==
X-Received: by 2002:a05:6102:c8e:b0:608:cdd9:2bcd with SMTP id
 ada2fe7eead31-62afef0f7e0mr3530809137.15.1777661866644; Fri, 01 May 2026
 11:57:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 11:57:46 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 11:57:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ad924b3fbe4154466195e0668604afe8e0b825ca.1775874970.git.ashish.kalra@amd.com>
References: <cover.1775874970.git.ashish.kalra@amd.com> <ad924b3fbe4154466195e0668604afe8e0b825ca.1775874970.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 1 May 2026 11:57:45 -0700
X-Gm-Features: AVHnY4IvsBfXLUkyXbLpr28PPeYHc_4XXhzxQ2PbvYLXjabiP4YS4Oqwx2rdAxI
Message-ID: <CAEvNRgFRJNRyUf3T9TTWr9-xt76E=Z28vSKsdZ46QK3UAEd8dA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] x86/sev: Add support to perform RMP optimizations asynchronously
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
> +/*
> + * 'val' is a system physical address.
> + */
> +static void rmpopt_smp(void *val)
> +{
> +	u64 rax = ALIGN_DOWN((u64)val, SZ_1G);
> +	u64 rcx = RMPOPT_FUNC_VERIFY_AND_REPORT_STATUS;
> +
> +	__rmpopt(rax, rcx);
> +}
> +
> +static void rmpopt(u64 pa)
> +{
> +	u64 rax = ALIGN_DOWN(pa, SZ_1G);
> +	u64 rcx = RMPOPT_FUNC_VERIFY_AND_REPORT_STATUS;
> +
> +	__rmpopt(rax, rcx);
> +}
> +

Could rmpopt_smp() call rmpopt() to remove duplicate code?

> +/*
> + * RMPOPT optimizations skip RMP checks at 1GB granularity if this
> + * range of memory does not contain any SNP guest memory.
> + */
> +static void rmpopt_work_handler(struct work_struct *work)
> +{
> +	bool current_cpu_cleared = false;
> +	phys_addr_t pa;
> +
> +	pr_info("Attempt RMP optimizations on physical address range @1GB alignment [0x%016llx - 0x%016llx]\n",
> +		rmpopt_pa_start, rmpopt_pa_end);
> +
> +	/*
> +	 * RMPOPT scans the RMP table, stores the result of the scan in the
> +	 * reserved processor memory. The RMP scan is the most expensive
> +	 * part. If a second RMPOPT occurs, it can skip the expensive scan
> +	 * if they can see a cached result in the reserved processor memory.
> +	 *
> +	 * Do RMPOPT on one CPU alone. Then, follow that up with RMPOPT
> +	 * on every other primary thread. This potentially allows the
> +	 * followers to use the "cached" scan results to avoid repeating
> +	 * full scans.

Out of curiosity, how does this caching work? Is it possible to do it
once and then synchronize the cache to the other CPUs?

> +	 */
> +
> +	if (cpumask_test_cpu(smp_processor_id(), &rmpopt_cpumask)) {
> +		cpumask_clear_cpu(smp_processor_id(), &rmpopt_cpumask);
> +		current_cpu_cleared = true;
> +	}
> +
> +	/* current CPU */
> +	for (pa = rmpopt_pa_start; pa < rmpopt_pa_end; pa += SZ_1G)
> +		rmpopt(pa);
> +
> +	for (pa = rmpopt_pa_start; pa < rmpopt_pa_end; pa += SZ_1G) {
> +		on_each_cpu_mask(&rmpopt_cpumask, rmpopt_smp,
> +				 (void *)pa, true);
> +
> +		 /* Give a chance for other threads to run */
> +		cond_resched();
> +
> +	}
> +
> +	if (current_cpu_cleared)
> +		cpumask_set_cpu(smp_processor_id(), &rmpopt_cpumask);

Sashiko [1] pointed this out: after cond_resched(), this code might be
on a different cpu so smp_processor_id() would return a different cpu,
that would mess up the global cpumask.

Perhaps it's better to store the id on a stack? Or actually, what if we
give on_each_cpu_mask a copy of rmpopt_cpumask with the current cpu
unset?

[1] https://sashiko.dev/#/patchset/cover.1775874970.git.ashish.kalra%40amd.com

> +}
> +
>  void snp_setup_rmpopt(void)
>  {
>  	u64 rmpopt_base;
> @@ -568,9 +656,20 @@ void snp_setup_rmpopt(void)
>  	if (!cpu_feature_enabled(X86_FEATURE_RMPOPT))
>  		return;
>
> +	/*
> +	 * Create an RMPOPT-specific workqueue to avoid scheduling
> +	 * RMPOPT workitem on the global system workqueue.
> +	 */
> +	rmpopt_wq = alloc_workqueue("rmpopt_wq", WQ_UNBOUND, 1);
> +	if (!rmpopt_wq) {
> +		setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
> +		return;
> +	}
> +
>  	/*
>  	 * RMPOPT_BASE MSR is per-core, so only one thread per core needs to
> -	 * setup RMPOPT_BASE MSR.
> +	 * setup RMPOPT_BASE MSR. Additionally only one thread per core needs
> +	 * to issue the RMPOPT instruction.
>  	 */
>
>  	for_each_online_cpu(cpu) {
> @@ -590,6 +689,20 @@ void snp_setup_rmpopt(void)
>  	 * up to 2 TB of system RAM on all CPUs.
>  	 */
>  	wrmsrq_on_cpus(&rmpopt_cpumask, MSR_AMD64_RMPOPT_BASE, rmpopt_base);
> +
> +	INIT_DELAYED_WORK(&rmpopt_delayed_work, rmpopt_work_handler);
> +
> +	rmpopt_pa_end = ALIGN(PFN_PHYS(max_pfn), SZ_1G);
> +
> +	/* Limit memory scanning to the first 2 TB of RAM */

I think this is better phrased as "limit memory scanning to 2TB",

> +	if ((rmpopt_pa_end - rmpopt_pa_start) > SZ_2T)
> +		rmpopt_pa_end = rmpopt_pa_start + SZ_2T;

and then this could be

    rmpopt_pa_end = min(rmpopt_pa_end, rmpopt_pa_start + SZ_2T);

> +
> +	/*
> +	 * Once all per-CPU RMPOPT tables have been configured, enable RMPOPT
> +	 * optimizations on all physical memory.
> +	 */
> +	queue_delayed_work(rmpopt_wq, &rmpopt_delayed_work, 0);
>  }
>  EXPORT_SYMBOL_FOR_MODULES(snp_setup_rmpopt, "ccp");
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
