Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786A22B8DF
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782237046; cv=pass; b=oYjUXDTgVqj4g7GzMpD9OpqYIJNo5sUBvCioFegifRyG2hU4NSJ3aB4wzpVUYe8yT8P6jAnJShgjNc1i4AkCFrGvUy73y8W/v8y0GSe9eGxnPzGM4ryBzB+Yy6lXQW05vqat+oR4TALTNIDKjgJ6xlvplBsceD1pMi7mG/hBgOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782237046; c=relaxed/simple;
	bh=ao/gjLtwrPN9EkIIj1OlYbo6h/r99kzcN9bKH22zQDQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtviYOq7vZOFikDafpP/JiF8QU1rmsguxSD9XF5NbN6FWkan7S5lvxCUhkoIQlzPt8R5O/0+tE29IyQmE0UbSzWlvoi6K6QmTf2n794DhhkcSsP54rwCZDjI9mp8Do28UFfXEYZKPBUOHhDLdq+jVqaIkXBWqtemrjo75zNQk3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wEhaDPW1; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wEhaDPW1"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1384ebe7a10so235811c88.1
        for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 10:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782237044; cv=none;
        d=google.com; s=arc-20240605;
        b=DINgR/FlM1ZYhYr/t8kUqpEOZmlsn/qT9BDrX5KNyhSV85Yc9DeVtt/u/uwIYWMW7Y
         bB3iAOPzAEjvntQR2WVfL0kqBeAIz2lCBz8Rw+PSzFCwZ8fZFF06bL+5Isz65ZhvQXY0
         OnKdj0EjSzEP4ZD2Acx1sxR1jDT0CkNAnCUCLTdlzCHEOkrOP9xEEGKavNELmjtJ/0RR
         iVoCUvw8c1gbnzBgrZm2xkpvjBqjJDyaNV5/3hiRU9BRueM6WJ65NTbqTKDCook+EVo1
         RtFN0xsI89m/BgMSBmXDaPWpvA2A3SROwHF2bsiYsVRZTI2ehLgSWdVj9KWmj95jLO/C
         y3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=iaH6OIuh4aHHZqieJze8syUo2Z1c4+x2P2tU6UVJVNo=;
        fh=rgxbX9wrb09K/rup5cFQqVHewFUmnb2ZOqedEq3cNNc=;
        b=OIOXaWjdSxy1qnvDZSXCuzll17zrfv2KKKb7JUlma9TnUVRoDyHK0EudrXhQMFtJt6
         cS1UcxyjNcKuMflvKENYQxGr88bqDZanKgL2FmkxiiQ2CW7FJ5OIXnbteYh1rSoj6KYW
         M0KfRHuU8fU3mUUJlK9mitiHdn00aBm32ubxwyRAV6Yi+UzJs/wZEgI959nGW7jdToD/
         FnVuUZ3SBdnP7E+4i44ApbD26wkI9H04iQycdrarnal3orUfEgOLijZQg8VNy8tVtacE
         VwLKHXMZdDR+OcfdNcZikoj17IBxQWzxIjoeHFFfZsh9kBETy9nV9sER3J8Ut4ujrnzx
         Yfqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782237044; x=1782841844; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaH6OIuh4aHHZqieJze8syUo2Z1c4+x2P2tU6UVJVNo=;
        b=wEhaDPW1PA1fuZyUPQg7VtHi5LgUqDztI+brfBUioDQyTsIu4HqjS3STgXL6J75iMr
         FTOUqdETnEkRQYlSIUvUnHXI4CrrhTaFJQQnDBf7bYvo8xvarnoe7Kk30NTYVoXUAMwQ
         qXOW+Y9sCO7ok7jg0inZsZKLAAbSRQvIe47e0rZz6RZ85a4TmBu9d3H9C+O3Aqciqnsl
         77QwtcTijKQ/00U14AZTMysyc9i8wHa6fenaZGoO9ieM2EBkSASwuHeq0Pc9TvWcMX18
         K5ss1YEv4fqKXghbFjr6PH+d0bGN8PuiVGIvqKkXyZ1txiVKP/TH5SQCHj7KCkmBX44i
         1X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782237044; x=1782841844;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iaH6OIuh4aHHZqieJze8syUo2Z1c4+x2P2tU6UVJVNo=;
        b=L9Xp3d6flyDXll/7wjYgLOouZ+tytRUJCGOz8xmZ30RdujUuzrOcCR87DwmkV0PGh3
         LBELmN3JD/ZhfncUguMrBPX19mpCPtgMVetm46FH32FmilJFo2GLyc5OJ/AXOFe20qbm
         hMXX+fpqRYMqzqeHdP8fWH/BWgMga84196wBtK82d8oZeVduNHIyHNnH51duXoBwnFLF
         EWlKEYc9LPlJZjo/cZk4pQz5d0xPOYwEoMc0QO5Pvs1gVVCv3Z0yL1Cacl7OMYGGKs85
         y0DUGOVQaka15bKxGWv2CzbKyHEC7o9KH6xN6iwJFwvbNJ963hRugIVCrs6anxrw7kU5
         bdOg==
X-Forwarded-Encrypted: i=1; AFNElJ/Eu96jZkEEFj+MfVXfF3X05W+fZpvSw3G4LyQanVLOfjnl3g5C2bAJOhcQFAQj+Xcsm3gNNhq8ctOo@lists.linux.dev
X-Gm-Message-State: AOJu0YytvVGhEu5wGcL6SeQ+Zc/3WQBfRvi+LZsisk0kGVmbT6A4IZ80
	6h6hrgXKJJaxqH2BgoMCsFrlMrltrOUBDcvrPnO5xWF5QU9anhqRACEBXtGkp6WUVN/j7MupZIK
	GryFiwbuYYioOp7h92aRSWhQCM6E4kfxsAVVz1DHp
X-Gm-Gg: AfdE7ckNm5DQePnh+oN/FbgSEZh9Rz611U1lC3xjf80cf35wCiWeLxxSyRqO3V8KRK2
	3QCUsaLByHxwqubgU/h6uY8Gt1WU2Uq2Q8WXbt+UPc7trZ6O+SkqqnhkCqyrhb+dqSs+EFOqq4w
	vTiaemfEHC+W8PT6/CqGO3fvaDrxybC1i9mWaBPKjB8UAYOoMo7SKxuAGbBNEa3/wluT1V3PlFR
	2U/Jn6sV6O8vL4gTECt+40EH3UC/po+CISj3WcVkPZtmXU0mD68pfUbhph4XEqcqRCkujIO4CVo
	r1PTKIPxWO7Tez90zmtIW8FnPv+pfcKuXQ9EMLji72yd2PvFwsCabs7W+6o=
X-Received: by 2002:a05:7023:b0d:b0:12d:ea4f:99de with SMTP id
 a92af1059eb24-139c5b9d56amr3139260c88.0.1782237043068; Tue, 23 Jun 2026
 10:50:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 10:50:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 10:50:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <8c5f4082-e3a5-4f65-b058-33938a7ee324@amd.com>
References: <cover.1781419998.git.ashish.kalra@amd.com> <de274c2fb3f794ff1f19f0c96184ee50d04d1282.1781419998.git.ashish.kalra@amd.com>
 <0fa0bc95-ff31-40c5-b083-3c885d09d0ab@amd.com> <8c5f4082-e3a5-4f65-b058-33938a7ee324@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 10:50:42 -0700
X-Gm-Features: AVVi8CdyhQZDa5lioZ66r0smztGw-BoY8xCcu3T1y7FPhbFJD_2pARoB-P2VDng
Message-ID: <CAEvNRgHPbb0ARYS-E4N=fM1eG5fNshKHSwdWj74gZdzjgwm4Rg@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] x86/sev: Add support to perform RMP optimizations asynchronously
To: "Kalra, Ashish" <ashish.kalra@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, seanjc@google.com, peterz@infradead.org, 
	thomas.lendacky@amd.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	ardb@kernel.org
Cc: pbonzini@redhat.com, aik@amd.com, Michael.Roth@amd.com, 
	Tycho.Andersen@amd.com, Nathan.Fontenot@amd.com, jackyli@google.com, 
	pgonda@google.com, rientjes@google.com, jacobhxu@google.com, xin@zytor.com, 
	pawan.kumar.gupta@linux.intel.com, babu.moger@amd.com, dyoung@redhat.com, 
	nikunj@amd.com, john.allen@amd.com, darwi@linutronix.de, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Kalra, Ashish" <ashish.kalra@amd.com> writes:

>
> [...snip...]
>
>
> Yes, a simpler implementation will be like this:
> ...
>
>  	if (!alloc_cpumask_var(&follower_mask, GFP_KERNEL))

Perhaps have a WARN_ON_ONCE() here so we know rmpopt was not performed?
Not a huge deal without though.

>                 return;
>
>  	cpumask_copy(follower_mask, &rmpopt_cpumask);
>
>         /*
>          * The current CPU's core always has RMPOPT_BASE programmed
>          * (snp_prepare() required all CPUs online at setup and CPU hotpl=
ug
>          * is disabled while SNP is active), so it can always be the lead=
er.
>          * RMPOPT_BASE is per-core; exclude this core from the followers.
>          */
>         migrate_disable();
>         cpumask_andnot(follower_mask, follower_mask,
>                        topology_sibling_cpumask(smp_processor_id()));
>
>         for (pa =3D rmpopt_pa_start; pa < rmpopt_pa_end; pa +=3D SZ_1G) {
>                 rmpopt(pa);
>                 cond_resched();
>         }
>         migrate_enable();
>
>         cpus_read_lock();
>         for (pa =3D rmpopt_pa_start; pa < rmpopt_pa_end; pa +=3D SZ_1G) {
>                 on_each_cpu_mask(follower_mask, rmpopt_smp, (void *)pa, t=
rue);
>                 cond_resched();
>         }
>         cpus_read_unlock();
>
>         free_cpumask_var(follower_mask);
>
>

Definitely better than the version in the original patch :) Thanks!

>  Here, the leader exclusion must use the sibling mask, not clear_cpu(this=
_cpu). That's why my collapsed version uses:
>
>         cpumask_andnot(follower_mask, follower_mask,
>                        topology_sibling_cpumask(smp_processor_id()));
>
>   - If this_cpu is a primary: its sibling mask contains itself (the prima=
ry) -> andnot removes this core's primary from the followers.
>
>   - If this_cpu is a secondary: it isn't in follower_mask at all, but its=
 sibling mask contains its primary, which is in
>   follower_mask -> andnot still removes this core's primary.
>
>   So either way the current core is dropped from the followers. (The old =
code needed two branches because case #1 used
>   clear_cpu(this_cpu) =E2=80=94 only correct when this_cpu is the primary=
 =E2=80=94 while case #2 used the sibling andnot. The single andnot works f=
or
>   both cases).
>
> Thanks,
> Ashish
>
>>> +		goto followers;
>>> +	}
>>> +
>>> +	migrate_enable();
>>> +
