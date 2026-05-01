Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF452D8DC2
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777660437; cv=pass; b=EunwtO7V9bBU+p8ew7n6kQX5+tEoMUgiUtjJIi4lLYc1zggdS1zf5LTgCyS7ymCDgi/rFq8jD1iFh/pTDwoDLpuuyh7Qjc2k736yVR/IF1DRzer66mKbCCI2/84KSr1V96CsQg1VP1CdL0AvCJ46Lr6lFEHW14mJKmD8P9+CF1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777660437; c=relaxed/simple;
	bh=fqg3WAk9fcb68sFfknqpiSw4c3xDKlkyGKAWTbUwpGU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8MWcD230G7h1w0/5KkkhSipSTvE0YYAx2hzRhz/ErA9jHUWZceoohHVjbjaGPcAKt5xN4FjO8YF9IcJHSpvc48Z6Z3prdB85xlEtXm2kltyZBWC5C30IaTmPSkhvXYzR1KxQzK3uM/tJE2KcwLjZLuybrweFjDVp2EcvXxYv2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cuhRJAdm; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cuhRJAdm"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so924207241.3
        for <linux-coco@lists.linux.dev>; Fri, 01 May 2026 11:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777660435; cv=none;
        d=google.com; s=arc-20240605;
        b=DBoGIAyPeTrqraF0dtTcwGVQZHO67Reqfc5exuki3Q+6YWaphcljbJXXKl0HWietiN
         FFQ5J5bLTbC3+bpTNaycIDY8s5RBnZzEm/WzreogxM+w8u07ecER6YCBvPJlQn0xtJJb
         Y3rhk2BGoLwz8T9nfTuWCm+cSwneEWpj6MNDSR4W73xF4OWTOhlfVAAvgu9b32y8zsnB
         J/kPgUeDGRuXDCr279tgmIpj4nWij+zdt7Ng1qPoKYrQqbJmPdzTUhimTy1m1FQhzwDC
         56zJ3pqtL7TQ2o1hwB/tReScXfOLZHXCxVpEQo4/8EYnhTT/GWDMG4IsLSutq0ILMKIb
         dcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Bav75grk2ITDinFEb+etsys3gj6sTaCIDR0vYHpkPhc=;
        fh=yNDfcKi0KEIUDbC3y24Q8KYGBbzMhDleSfpmpwFxA6g=;
        b=GDRNxWkMUDfB8mzXQxVDoLRnJL8r+1BW4o0ZXrGzkDb/ddn7Eq5ajIIHSBEB03ZMBe
         GSjQ33piUoKGi+TxUjvx4RLdmUMXapELOJBh5mwrPQMHF1iNmB6l34xaeyjypRiBfYH6
         jpv6lXma1BP6LsSdMVPU6aEu+zBEQEkhBY6y4EShvaM1GBcXK5MhyoYPpwZQ4icFhpSz
         wGr71R/DCakBsmOBM+RvC+88hvsscUq/84toF7lrcHmyAJmg0TaDlTXs+gfYPWgE8Kjk
         GSNSc75LY1ddOWnqMJ1W3ie3rTevEdZ/LSd5IEQk9Fihw9yhHFAjLvTFVqv5TOdabywC
         cBDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777660435; x=1778265235; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bav75grk2ITDinFEb+etsys3gj6sTaCIDR0vYHpkPhc=;
        b=cuhRJAdmcMiYVk94x1oAWPfbGqw9zdxdOuSI/5jA2axwYsURt1j3eqnH/1W1EszSOx
         M2a5V4depJYQzEHSopad1rKoLSydDfrMdWiEwqzjorcL4ZRlfprz4y5u3CRBGc/zLRuj
         SQTH4n7+djlvgWUZqrEImTk5aWfMBPab+U5XP/mzkq8PIdzuhggo8aC4rtvent7Brq0o
         8SEXGnGaIKJEw1LYRxCXn56BTzM49Nvpq2cOtA09gTgHLQVCzvXRRu/+FOr9wD/xHgbb
         5t8DtkMpXLgu94az/dT+d8pRHjTPCbzDEkfIDogDa0ELD2vIqlYRppZpQjSIsMGN41nz
         vsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777660435; x=1778265235;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bav75grk2ITDinFEb+etsys3gj6sTaCIDR0vYHpkPhc=;
        b=pYmvglegezfUCmL9zJGgua7S/aBukg8QclSp/EaiN2EuFY/ssA/yh+ydPadJ8R0miW
         FwsPlj5LP/IU2n2ukIDDB2vPj5MUuG9wbsws3CPs6ILZ+22RLMzEnlB4/iwHKjEToXUt
         ZoxgGZuHGUlkgV87mAwRDiluHZPfIcDt6ie6L3tn/xgKMlSRtrnesjTdtuxEay9L1DWe
         /rUEJ5yPyfNLZ9SC7YArnike3XOJcoFSE06IIq/Dn3bNJXMgtGkdXX/jDeKNHaUjmZpP
         C8DSc5Q75+rdrif7Md+mEMeYR2eN6G83nyAydisPzzyztUk0mXkLDUn4N+ehoBKlsRC+
         9UXg==
X-Forwarded-Encrypted: i=1; AFNElJ8LOWM9amXg3laDF+FSOxkcFuQjKtKpN0LEcfPOMGD2wVWNqBONpJX4tIuC3u9IN/54zafE6q+fH8Lw@lists.linux.dev
X-Gm-Message-State: AOJu0YygMomjsaLawcknYRu1wlQDCSqUFxpdE836KwDd/BRa+DMxdBxm
	xhSL6p/b2z6VXXV8IS3HJ6JkYLc1JP7VZesFOHKeABTf6Xy9fBxlEz3y/1J1m93rpbzAC37RDt2
	scjq2VTnC3DHH3QY0HNqxD6BHx8UzPo385UjYvXuy
X-Gm-Gg: AeBDieulCb01bLRNWVm9pUBVCxF8NKRq0d1/364NKPy1ZWVxEZe2Xx30TGFMI92l1/y
	upA+SxhGyqHqzflZl3xI4vPPuY2AT8xkk7mmE2v9KtdB1YgoojvLmYgULIVUv2zYfQMPX8K4/TO
	Fktdd0/aQm1QLQzyadbfYNAo/M4Ry6L29fNEUXWYqVBm7/0H13TXr1ChREncH4ThgIvEqkTygwA
	Ax0lpjJqRrg91NOnRdNWGUtkoIo3S5NxVlqs6kHz8Cix1mFUkMZ5l3rqckRxtSjtpyDMpRe7S/R
	K4v4yEvzFDlxKgk85fIgm7j7A4HmIA7jWEicYiKGu1ERo3KRQh/3nVS59Xs5ThFLld1aO4zwZuz
	JCKg/elo4hgvKTuo=
X-Received: by 2002:a05:6102:2d0d:b0:610:76c6:b74a with SMTP id
 ada2fe7eead31-62d868151a0mr372350137.14.1777660434999; Fri, 01 May 2026
 11:33:54 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 11:33:54 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 11:33:54 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <662ddafc74fa90be6fdf7dba09bccc53f821f328.1775874970.git.ashish.kalra@amd.com>
References: <cover.1775874970.git.ashish.kalra@amd.com> <662ddafc74fa90be6fdf7dba09bccc53f821f328.1775874970.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 1 May 2026 11:33:54 -0700
X-Gm-Features: AVHnY4KBx_0gaB7DjfqkDfKW0Ew0L3t0R6FaDd_9Z8Ub7GHIEHP6tTt4gOQ4jX8
Message-ID: <CAEvNRgHE1kVUq4vdFMLGM1jiQGnTMDehkDK1oJTx3vN29-7rxQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] x86/msr: add wrmsrq_on_cpus helper
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
> +void wrmsrq_on_cpus(const struct cpumask *mask, u32 msr_no, u64 q)
> +{
> +	struct msr_info rv;
> +	int this_cpu;
> +
> +	memset(&rv, 0, sizeof(rv));
> +
> +	rv.msr_no = msr_no;
> +	rv.reg.q = q;
> +
> +	this_cpu = get_cpu();
> +
> +	if (cpumask_test_cpu(this_cpu, mask))
> +		__wrmsr_on_cpu(&rv);
> +
> +	smp_call_function_many(mask, __wrmsr_on_cpu, &rv, 1);
> +	put_cpu();

I think

  on_each_cpu_mask(mask, __wrmsr_on_cpu, (void *)&rv, true);

is more readable than get and put cpu.

I understand Dave wanted to remove the ugly casting earlier, but perhaps
it's okay now that the cast is wrapped in a function like this?

Just my 2c, feel free to go ahead either way.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> [...snip...]
>
