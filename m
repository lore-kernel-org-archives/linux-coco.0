Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793224324;
	b=Ywcu1LjrNfHeqwhY17v6MYnl8fP/QSDRDa6xofCXvFgTf6c2Ti0SFZCDmaTg3YIBW4Dn
	 2YCKqzITP7WIYXdGMMJGw+/jJ3gq1ZVITitjkZkpi90SzaEhQdW3TuSmiD9QXyNL7g+aa
	 ECWSodtCRUa3gpWn0lNJOUqq2yGEoXFNeHvmpirQIuTkVdLMwdea9fdLVjm7B1g7cZDOC
	 4VuJB568366w6PErtuXuGxMbdM0rkl4Q4WrVsQ62dQFGiGJjCSV4WQETbaG60pKj+0oji
	 rDdzRn8X84dqeROieAP7REXBD14Khhv8n6cFx6k0E60a0UEuxjytoWs+ygk2YJZK3Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mPtExrnKGOMQtspuIP7yF8Ip7fswDzEEpF0H728OVnI=;
	b=fcT268j3ifU7VbzNCQjS/a0HmBtq5dYduH12Qjh/q7Zth2D2/Uf16QehiI/lTaPfy4o6
	 ox6X0/t/DkHBPxKHGXZ26OBosEl6ez1NUuV8H79+RD3zKU5ZRsqG65t4i8klp1w8QAqQL
	 CCRKLLAT3yKtMrPqKFRDmChow6NOQyKctsrwMrqCneLZErGnmu6Ha5llh1ks3leMzEbF+
	 42XY6z0wSgH1IncnpXZ6qE58O15ghOXbs614wSHiyv0Y9+zD4JQ75mYWsdjBYTEZCKkpR
	 TYAH9HzRPk3P/HmN6GyQ1p3yseb7kvLmAfFwsRGhsqtbdh+uxVWVrAMh6xxPkH+6NJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrY5eEoK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F43B606A31E
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 21:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F43B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrY5eEoK
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9995ce866so13851645ad.0
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 14:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793224323; cv=none;
        d=google.com; s=arc-20260327;
        b=FLbqJ6RaSoekHZhw551OC4uLvGXxeT8zmgw34CokVHBgzUXwhm6uiz2+jolSG7uoV1
         0skfjMcO6KrBIOnDtPRBdvAvQtxY7D865NJi3sJTYIKAKYK2rnCHni01tOATiNRvAOyg
         GZx5u+XMI2U4GOaWTVmG07ht5Xrq8GnwKqTSHaLoleNmsnhvYliOcO0Q/PvAIUU4v9LY
         ElGVgVfrHLQkSE1TL2Kp2/vbE6gw3sSVppSlLTsn+5ldVHtd2lvjHJ/TVJNIsYxeqVDv
         GqBI8sgOy+X16asl9H8mGZtw2XBDZ7mhx3ToaEZMkWYZ0xQszIkcOldRhftaZAaM0hlZ
         N63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mPtExrnKGOMQtspuIP7yF8Ip7fswDzEEpF0H728OVnI=;
        fh=Gj8FdtdBCOwzVgmHo42qVO47l6vMr+xgEOBGbW+sMcs=;
        b=A/pzu+tanFxAU8KfNGqEQY+HTeQzUOHaHKx7f2QwHfuTj4ds6UjvhD17kWn+melguD
         fN+ja6Os4fPEnuuHZ3re7w3t6ZWtjBwI1x4C9jvdgNFvExNIRMZwWMiagIV5OXAt1QYA
         KdjKx9Dy2iXaPZcfpBVGn0Ym97wdNrP0QRTCjIKwrmMa2y4WBac4fvIYGWqNTdEkIlkL
         Zm3JGYaOsxUaDLke+03FucapxtaAQ562lKmSB/NM8Cm6JoiCaQjX+xq0isq/XaEWBICy
         On41W1RiLh04H1camnIUOvohn0OQqTBQVFqkNTrBzBxPNGHT+DfcJHxV6/bsjhXwdnty
         ci+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793224323; x=1793829123; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPtExrnKGOMQtspuIP7yF8Ip7fswDzEEpF0H728OVnI=;
        b=zrY5eEoKJ6w9OAAJZ3TxHctmHmU8iPUmsOozjIdApT1LvzNTUxQNZiNU4Ev+5TNtkN
         eTziHH+sTTXF72rIIK+rHr0WnVPv8fQf24QuF1AmjkU3CqZvJMsnKnDFiABFxht6Cl4U
         TSlyTxDDvPzHVdEmuy6wDpqG09KXN4sxivZjoy48GmG4X6R4l4cjJVZOwgC3N4Ka6vdK
         Ujr238B0JBHZAOibirgUWG46WeyOJGAxE8EgFBo1Hf1LYsBBrP9CnMvpP6+/P05KTM+E
         iAgwu3T0xfReD1xM2V13QfhG/DhkI+i6eGOchuI21Tqlk8bTclirEtjtqYrZhCW27RUL
         BYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224323; x=1793829123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mPtExrnKGOMQtspuIP7yF8Ip7fswDzEEpF0H728OVnI=;
        b=Pg9y2B5nNGt5gYfFRToTxAD3ow9suef0AZK9oIu1zBoozuYH3g4fVJf309b98E7DDt
         9x+NTuf6FPjemzwFGd+xlyVn4ofjGBwnPTzvLtIWp4EHoOuCbv/yHaz8j9YQZFjZcGD/
         /BMEymdmZe2uVh/cnWLEVOKedmA5VkxCMGnudKhm4KsxOZAoFf1KrKcjFQzX6XvQriEE
         wmAYvbrltAiDYp4iNPgLxCDm8Eo5hdU6sSdHvSayOoBFokiBDHDf21j2rirQnXNyxv3Q
         EYFQ/rEOy4fNb0pkxpsv5jdc6KpIgJQ1pmrpOqc0fB0c1VZwMc1UKm2bY2CLhBT6krT7
         EICQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7W4FXiRq2WngisGOMr6BwhHMA+wqUyoU++CZcvg0CM6nHKUPDjjOT6qJ7OlCSB3V4Ust07uy7n3mp@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+dSq+hTn+TqEbfTUUtuc6BqBBTLuNRhodq8PFE4dGo4QtEq5J
	mLI9TawWk0X7ePo1Lovkc6RVP9az/38rh+hDYV9jdpUG3yhfqiZXsO93Ovhn9VJCW61W3jqPD1W
	ZDIuwFZY5LEXqYwS6qtBIPlH2Wdznsxg=
X-Gm-Gg: AYBFou0uJoGheqZ5UmXqcHm1tqM0fqmlwfmALvGds/pnYMsYFSlx+iY3JUcjR1ZTvuD
	GMtGbdZUmqGhRY0utYaW2r8V2ZYvKPyopl/dZQ5xJF44A7KVdsj1dhbU/XiljzY7dNig1b4V3Nd
	qxIs119ZnWF4a4+nQdrcP+Kdtaj49V9fJAI1K0fuR+k6OHHsQCkGdHA3/OwH/StAxElAlIZmdie
	g2nEhaJTaif8ZQG5tafi+DwymYvkc/Ty4CD6EBPnkX0kOFNImqZWaVliNRnryedD9nHXhWLKazL
	F59TvqQZQ+VBP77m9AG57AlCj/lfUkraX71KU9Uh/B9z8Y5K4SyOG6FvzndzLZkQXPInpbvT36e
	GLx9HeFDZ61cVMjo6P4aa2K1BCoHEO4DUDsXs76Q=
X-Received: by 2002:a17:903:94d:b0:2e8:1d5c:f6f2 with SMTP id
 d9443c01a7336-2eb003bd5f2mr34821655ad.24.1793224322720; Wed, 28 Oct 2026
 14:52:02 -0700 (PDT)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793216372.git.ashish.kalra@amd.com> <56da047d63b22f03a7e709fc172a5543da894d67.1793216372.git.ashish.kalra@amd.com>
In-Reply-To: <56da047d63b22f03a7e709fc172a5543da894d67.1793216372.git.ashish.kalra@amd.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 28 Oct 2026 22:51:51 +0100
X-Gm-Features: AclHuK-lLMUGo00CsLuRjBYLJYO8QfoO65WYw2V8BbtyozSJ3LTmNXJa2V5HQzw
Message-ID: <CAM9Jb+gBzgwvtOkV32bNudAqb4sU5+40zuj54py+JoLVvV+naA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/sev: Clear RMPOPT when segmented RMP is
 disabled by firmware
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, 
	peterz@infradead.org, thomas.lendacky@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, ardb@kernel.org, pbonzini@redhat.com, aik@amd.com, 
	Michael.Roth@amd.com, KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, 
	Nathan.Fontenot@amd.com, ackerleytng@google.com, jackyli@google.com, 
	pgonda@google.com, rientjes@google.com, jacobhxu@google.com, xin@zytor.com, 
	pawan.kumar.gupta@linux.intel.com, babu.moger@amd.com, dyoung@redhat.com, 
	nikunj@amd.com, darwi@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> From: Ashish Kalra <ashish.kalra@amd.com>
>
> Segmented RMP has two independent states: the CPU *advertises* support via
> the X86_FEATURE_SEGMENTED_RMP CPUID bit, and the firmware *enables* it via
> MSR_AMD64_RMP_CFG[SEG_RMP_ENABLED].  A platform can advertise segmented RMP
> (CPUID bit set) while the firmware leaves it disabled (SEG_RMP_ENABLED
> clear) -- e.g. through a BIOS option to disable Segmented RMP -- in which
> case the system runs with a contiguous RMP.
>
> snp_probe_rmptable_info() clears X86_FEATURE_RMPOPT only when the CPU does
> not advertise segmented RMP, or when the segmented RMP table probe fails.
> It misses the advertised-but-firmware-disabled case: that path falls
> through to the contiguous probe with X86_FEATURE_RMPOPT still set.
>
> X86_FEATURE_RMPOPT is a CPUID bit advertised independently of whether
> segmented RMP is enabled, but RMPOPT requires an enabled segmented RMP.
> With the capability left set, RMPOPT_BASE is programmed and the RMPOPT
> instruction issued, both of which #GP on a contiguous RMP:
>
>   unchecked MSR access error: WRMSR to 0xc0010139 ...
>   general protection fault ... snp_enable_rmpopt
>
> Clear X86_FEATURE_RMPOPT on the common contiguous fall-through so it covers
> both "segmented RMP not supported" and "segmented RMP supported but
> disabled by firmware".
>
> Fixes: 15d974be0a3b ("x86/sev: Initialize RMPOPT configuration MSRs")
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Tested-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>  arch/x86/virt/svm/sev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
> index bd70c4d0b774..cd0412b9d251 100644
> --- a/arch/x86/virt/svm/sev.c
> +++ b/arch/x86/virt/svm/sev.c
> @@ -827,10 +827,10 @@ bool snp_probe_rmptable_info(void)
>                         setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
>                         return false;
>                 }
> -       } else {
> -               setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
>         }
>
> +       setup_clear_cpu_cap(X86_FEATURE_RMPOPT);
> +
>         return probe_contiguous_rmptable_info();
>  }
>
> --
> 2.43.0
>
>
