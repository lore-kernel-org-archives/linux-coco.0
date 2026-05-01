Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E332470F
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662742; cv=pass; b=YvEt2jMexW3LMMrqY1obEY/ym2Fr2yvmsVQuxk62jf/M06WYeeHNKEmlsM/wrajvIr1/qk7kZvYT53765H2FNk7cDtTYfAjkUPaJa5Z4dqC/RTtbPnCY1zYP68g04ePLGLKH5MiM8zI65n3v6Y5jqEhE10WwH2vNHDKX+G6HXZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662742; c=relaxed/simple;
	bh=hsgFMxSVpPKS2tYlhKBJWXt+iv4JfRbOTmCq+LCIYTE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0jYf26/Vjudtdn51wJMCp5b6YEWxDZlhnczdaLaQK5kzRXLA/xalqqwMPD2X61QV70MJPfqajKaxpPqXu+y4bXuJrzOL3ed45ApV0crFbb0+1c0SaVzmEwqow96xR0NhrypjLrL2zoFIMOD3kux6ody4gXGFfExJlXsV9Y55S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pTdCg9Fz; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pTdCg9Fz"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-606045ef716so1427459137.0
        for <linux-coco@lists.linux.dev>; Fri, 01 May 2026 12:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777662740; cv=none;
        d=google.com; s=arc-20240605;
        b=DT+ZWtH8qqujIXfUbHQPodTCZ2T949+rjlcQFurcHhYB/Wc3bAQ8/p/GpedzPpR0UI
         UL6trboENicyj3vu1a1INs7IyH7ErsHXqGTLkzEbb0+vIivU/u/wl48r3xcTHDf2Myjj
         OkYcDjX/eoIGdJck4JDX6murI5VTBqGnk5rzl2FpJDil36CVsGGicxUB1Sf6ABvlmbnu
         ApKMFcBSrklQa8JWCV5Ix56qnBQP2fjaA+47euVsa7S+DsN5IRYaJEnL8tyaqnCPwcWm
         RuDlKHJh5Eh2NSkT1P+MVIyTWCTjq5L/52W5a7eNjFG2DbxF4MYeuqAzfphzXvQyxNks
         gwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=nm6005Bs28bikl/uf0zpE9w9BeJo6zdbBUk2D1gSfD0=;
        fh=NgBxKj9G3nlwQKY66iI+8p/RV0NzP1r5ZyyXQNZTw/o=;
        b=fyIqqAJ56pgxGXJ9/8KpZuRWpOYaDALX/hPFubjA4CvjNeXJ/fvkmYKBXWx8euXmtA
         90P6drl/ijfCzf4foQEBfrpSNXFO2INcXMenU02HDHOfCh/OQW5ZywRPm4x4J6K3UTLS
         JcdZvr+LjB8fGO8rsSKBEgYamw9Oc91y4mrlhPXxIJjplbYy3IDbuFMAhgCJY6iQyRYn
         Vhvg9F+6ZjBDbRNhiw6PTDLuqQcBvY+GsV4luKjxj+jEYYXywfrMgKvYYsiBioK0mMw5
         ikRIog2rPuufyw79ydMhPlOen3A5lrg/mGX4+RxEi5t81dOp4JPGusMMfAkkMo5nk289
         fgXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777662740; x=1778267540; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nm6005Bs28bikl/uf0zpE9w9BeJo6zdbBUk2D1gSfD0=;
        b=pTdCg9Fz08gqVc7ln6oMGt1+5ePwFu3KAmGwsEv/AUUDhblkXBVlSriqNAqmyjF47r
         7j/LEJgzqFqaRPGvGT9P75dqi48NSxS6fQi7BcMpgnaKGs2Dc66YQzNx3A1f9wic2FJT
         2qWVz+ED7EqJPEErjUXivUlyA6ftpGCxWUr7aXtKYCqWG2Pco6g4WZNYxLWW7gNUSukB
         g4Q6RJYmet8X9lNR8hZy7/D2d1qsmccXMjNxpVJU7dT5P9n+ZPsfP5VlajdMCfw33FSt
         Sds3c5g2fZiO0ECn0iKr96ODX+RAg3de8W5k45BchelzS/yPri02vUO+quj9A32tXfWO
         +XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777662740; x=1778267540;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nm6005Bs28bikl/uf0zpE9w9BeJo6zdbBUk2D1gSfD0=;
        b=A+fYGpnzIjU/1DuZDjpOMy60JtPCrXc3VJFqUp9i0xB/8eHpPreC8x3aM9I7l2sBIu
         q3do6ErB5NSjaNftQtDMZ42Ckan+9+ybLFJ6gR4J/Fk861rZMQdVWSxm3R6Kwc7RbdUh
         1QON6FhS7ISv500jjRFRnK9JZvKgRmZYdJO9Jn+9n3fXolx7slELycYotbewbjliNeA/
         OVS+A79xg6Q0JYClfilKMa1LnQD1YsbFmyjqLVLWJsn6AsIXRWkTYLxghGnF2bqenDqH
         YXykXUy4mr4kS3IUzo+L3D6FKlGG/dSYZnOy4U5Fb2rSd79zH9MjYKM4YACg8ZGSuAfV
         XPWA==
X-Forwarded-Encrypted: i=1; AFNElJ/dz0nmE4qaYokv7DDCz6i8tnQgfWmj/VArDOKvXP0/X6puj2QizsfKO8HQfmedZv5sa0DP22iVP2gK@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn/jfhE60uiQUN9nQhcwwu5UmiH2K9+Q8WZRocP4tiYOYBuPNC
	hmWg/sxXFjpP7muAov8iRpn77rSjh/ZV7pfSK/+NdCROeFYbKrzk4c22VHEwPIFarp3AkEM+Rr+
	ei+DrVM5TsR8XlnqK6dAUU3rTFpVNR5v4PZeO8q6O
X-Gm-Gg: AeBDiet3Mn+IXQu0SGP4Py4qWoo2qQTkBpj642pO9amlKErWNKNkPlhijgmAiJr0956
	16emNAJbzXpAiNsmNe8rjLrTsHp8GKMWz2tTowsFkvmSc6rl69qznhza/Sat/x2TTooNXdSnPXO
	11SoY1LBsL9JhGva5TfIQOpdGlVv2e7UpRwxDk6PdChNZuPq9Jyd/QOFcl3KAutx/awzZpG9H9W
	35Wggem0PqMPPozqkubw9TmkQ5/46pV1B1fVeHkuZx1G8Y4Lu2xQWs+2r1rs/lF96YKq2eYY82I
	1GUorC4lbebyDiptcYfZAFDw0J+u1vH9jU/z9FOc6qjzKfru9rnNmcDrysPKUDcL3lcfQ4L7iZo
	4Eiy4bv7qVl6OBdc=
X-Received: by 2002:a05:6102:4489:b0:618:442a:9e76 with SMTP id
 ada2fe7eead31-62d8547deeemr417754137.10.1777662739743; Fri, 01 May 2026
 12:12:19 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 12:12:18 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 12:12:18 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <0c15142ecf6689ebe31a9c0f6f331398fc04f6d2.1775874970.git.ashish.kalra@amd.com>
References: <cover.1775874970.git.ashish.kalra@amd.com> <0c15142ecf6689ebe31a9c0f6f331398fc04f6d2.1775874970.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 1 May 2026 12:12:18 -0700
X-Gm-Features: AVHnY4IwCQzSJJS5oI5H0hf1wYJTfgd9UcwRH4ft9v8o5wccryGIDOCmRLQ2i0g
Message-ID: <CAEvNRgGP4ZHz9=MOGybGwe2A4XHkVF6nXnr_KdHavz1rR62U4w@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] KVM: SEV: Perform RMP optimizations on SNP guest shutdown
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
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 3f9c1aa39a0a..e0f4f8ebef68 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2942,6 +2942,8 @@ void sev_vm_destroy(struct kvm *kvm)
>  	if (sev_snp_guest(kvm)) {
>  		snp_guest_req_cleanup(kvm);
>
> +		snp_rmpopt_all_physmem();
> +

I see this is what you suggested in [1]. The time-based batching you
suggeested works because adding to the workqueue when there's already a
job just does nothing. Thanks!

I think optimizing when the VM is destroyed makes sense, in most cases
for SNP VMs, we don't expect large 1G blocks of memory to be shared
anyway, so even if we try to RMPOPT on every conversion to private, most
of those tries would be optimizing nothing.

I guess the remaining optimization would be to update based on only the
range of pfns where guest_memfd has private memory, but that could be
done in another patch series.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

[1] https://lore.kernel.org/all/31040bb7-653a-40f9-8899-40bc852f7e1f@amd.com/

>  		/*
>  		 * Decomission handles unbinding of the ASID. If it fails for
>  		 * some unexpected reason, just leak the ASID.
> --
> 2.43.0
