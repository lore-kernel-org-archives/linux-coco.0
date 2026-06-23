Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADFE38D41F
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236908; cv=pass; b=NqMsDQm6fb+ntd9L4q+166wwblBYQPCmEe/qsuFjomtYRPsmLWDszyit33fUGLnWgxjJ8sEzkATuRg/+gEcFk4lV5n/062K28kBoRHUplndI6FraHuXYiXc524ipHsKmAtm6UCdM7DrReGFcRMMqWLaalYuNhUAKA/0kLv5mrRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236908; c=relaxed/simple;
	bh=Y9+yQ6m2SHjTMQK+C809Y49D4LsiLBGTR1bcbiYo9aM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoHUnN9KrvlgM1qIqx4GZNdgKGScUo7m1hSSVEMg8TL5un1yluRcfMYyDYO1ct4qxWE0++CBiKyQGBXkMzwmL9y6ceff1lcbgU05RBXg4Xjuat+CJQQvvzx+87D2wnt1iOGBH5JUDtGdHq1PDDf9jwMU/b6910KP46FhtIes4F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ix4pRfrI; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ix4pRfrI"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bebb72b845aso18896166b.3
        for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 10:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782236905; cv=none;
        d=google.com; s=arc-20240605;
        b=L4BDqDAM9qAG7cPJRjOZL0uQy9WzylE6YbPG1AytGUm8oG9Te9vKo0jQ6+744uxJiS
         JgUosBsMLo0H8oA17XbYLxvkJn+Rx6cYxG6J152x2ybXZjqID60QjZDdeBO5rMpSWFIa
         IK9pm9w5FiMioGtcOS2oszgD48dxKt2qsssy8AeQ1l3TDA2RDWf6eboOWrz0/tlNWZCF
         s19C4y/zaCl0hOcSE+F/NkZmOC2ivOHmM86ipxqtCJIZGqKfVYmek/2MFhJVW7bQuvRT
         0/hFgdjpW6JfxF3nONU5ERsYTSHC0pesxDe9R2iwSK+mBqSCT/ARFZlPQlVe2QDHqff7
         l6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Y9+yQ6m2SHjTMQK+C809Y49D4LsiLBGTR1bcbiYo9aM=;
        fh=l15fm8K5L5u3OO4TkREPYVjYv73eTbRawzo0aouS67E=;
        b=kaKCeDmivbTR8ZTMGQuVSZnlatA1XoyqKyPYXkQV1KlktxjZb4OXGDfQH/aYh7EKt1
         61UYhjzdXc/+I2uIisLE6m/OuH8QC4RsoC05Z84eq4gZSCpiQRHYmBNIMblEkhLfpy4N
         ZHLZSqXJBGynhE9AeSCKgg/WIwsZGKaqWXcDNUXGlaBq6oB2Q/ycz3Fk2qqW09h7QE0P
         biVeB+vuDUzsLm0zxGEgMT4Gv4p7KjlYq7Ih2dcmdYRLgmjxA0q6dKyIiYQEG4LjfK92
         0uTkXAOdOB8S/ymDTrszJKQmFWgJ/llsjIiTv6Mg8RqwjHcKIPWM3aJ+1taOnlqyd9Vv
         xbWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782236905; x=1782841705; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9+yQ6m2SHjTMQK+C809Y49D4LsiLBGTR1bcbiYo9aM=;
        b=Ix4pRfrIL2lVnygZ8MiwiVb55oHSG0ZDB38WCK3ay1JAhbMxe5gpKym9oI0/Z9TdN+
         HM9lWHsZy2qATeV0Z2FBIIlohRVv5U+JY2ZZUtNPMuvOihduyWQqKa40UUWJ0Ut+L/jM
         sdpzp7QuKQ3dWBt6p0GikU3pL4K7VxXVvQX0jdHJNT+n7GsgnMpIaVH1VZkBglV8J37c
         vrmxrzGqPbEPqGHy151jnoFTvMYd4w0l11WM0ZSHpkPXa2LvQNr7jz0F2qLCVyk6M9MB
         asGzUxalM/8OLWswki+KikRUx+U5UKR93NXQ7OXoymgdmwRmhYppO6+wPX4GuEWBOhfA
         zebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782236905; x=1782841705;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9+yQ6m2SHjTMQK+C809Y49D4LsiLBGTR1bcbiYo9aM=;
        b=jPnhTDFAmMiQQNBgyP9k2MWRKZ8qgVbbPbbjq0ac0qrUsZD9x3tpai8Fm8mWG+F3nA
         a/4p6esTSu4yl/XBIwpI+QIvzeWD+ratZR61HMo5AkgKH4eb4g1NCcxf8MzZAlyIlOsX
         Upboyfne8ULT4bYoksPMJHXm526xwrX5SZOTWtc/vDpRMWGOm31fJBfPfMYExf9ClBMT
         VxhYGDKauqgf/wd/3ssknhHKkG0Ft4ZsMcmhlzxTuinZMbQsS5vElQzyzVRSH+lXvuG1
         wo9ZP36XqHosCDMv8X0+fg+W3Blv+P4mAUzfUp53aqzKHSFx8/VV0GxQIeHCWi/dlltp
         faIA==
X-Forwarded-Encrypted: i=1; AFNElJ/DQJEdTMYetrlWrAR8BqknSuqzHdfE5Hd55WQZEJJ+sYJJBmxXKVdMWbt6pJCv0z6a04qXo9OTqxVe@lists.linux.dev
X-Gm-Message-State: AOJu0YyABVhEpaHdSLiUorJHRx+g9TI4z3kZen+HkRgIEDpK+GRGqe9M
	pRcAodWfnA8ef5P8DuEHsEFZsXJ+QIteJC1fs7aOwlYqswwla8q7PXV6X/pCNXcmAu0LONzEpIg
	Fg5D6Lwm2oye6KOzfxKNNDX4fGDS+aNcFrxFulu/z
X-Gm-Gg: AfdE7cmfXRwXJi5Lo3mY4vvBro6pRLTr5gSwtrz6ldOf2jkzh1GI3jLD49kUHQ8mK/Z
	OQUrBCuSqcjSYUUy34J+x7JwiP3IIjiVUCqudSIjiHVhzTpsuC3Bf/UlsLyaIA/vDJwqc2iBEic
	c+FciTFkF7bYnRPO2Qai2z2IpKwCCaoohnDfG9Xy9w1B2GuNVQJSzWoDrYDTBri9MiA3tl/Hq5M
	s8ZucHrHAzv342adhP39rK8jLxAX9PwFrbdZ0ElcSou928ISCROCo8oCW/ZwTho1pJvmC+7MOVd
	IQhzui02FdwMvjSwAYmmSyRHCfS1x3xQTbkuetIKHi9hLO0KD0li6UZlumVl5U0FRwAfLw==
X-Received: by 2002:a17:907:60cc:b0:c0d:5466:ce4c with SMTP id
 a640c23a62f3a-c0d5466d9dcmr844180966b.1.1782236904428; Tue, 23 Jun 2026
 10:48:24 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 10:48:22 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 10:48:22 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <0df3b665-3a9c-4c46-a7aa-14388e8e1577@fortanix.com>
References: <cover.1781419998.git.ashish.kalra@amd.com> <1feccf6e2a56d949b30f403c0ca7949f580e5982.1781419998.git.ashish.kalra@amd.com>
 <0df3b665-3a9c-4c46-a7aa-14388e8e1577@fortanix.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 10:48:22 -0700
X-Gm-Features: AVVi8CctYJVp25OwZWeFxJ-OUwcfHXzFhyslZieHlTKLg5vqXDjAr-hhZP5Iwqw
Message-ID: <CAEvNRgHDNGCETxLsy0v-_cBO1=1U+tXtOXWEFrXLU7pYz7U9ow@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] crypto/ccp: Disable CPU hotplug while SNP is active
To: Jethro Beekman <jethro@fortanix.com>, Ashish Kalra <Ashish.Kalra@amd.com>, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, seanjc@google.com, peterz@infradead.org, 
	thomas.lendacky@amd.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	ardb@kernel.org
Cc: pbonzini@redhat.com, aik@amd.com, Michael.Roth@amd.com, 
	KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, Nathan.Fontenot@amd.com, 
	jackyli@google.com, pgonda@google.com, rientjes@google.com, 
	jacobhxu@google.com, xin@zytor.com, pawan.kumar.gupta@linux.intel.com, 
	babu.moger@amd.com, dyoung@redhat.com, nikunj@amd.com, john.allen@amd.com, 
	darwi@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Jethro Beekman <jethro@fortanix.com> writes:

> On 2026-06-15 21:49, Ashish Kalra wrote:
>> From: Ashish Kalra <ashish.kalra@amd.com>
>>
>> The SEV firmware enumerates the CPUs at SNP initialization and is not
>> aware of the OS bringing CPUs online or offline afterwards, so OS CPU
>> hotplug can diverge from the firmware's expectations and break SNP.
>> Disable CPU hotplug while SNP is active.
>
> I think this is too broad. If I have a hypervisor that supports SNP virtualization, a (non-confidential) L1 guest running Linux should still support CPU hotplug while also running confidential L2 guests.
>
> --
> Jethro Beekman | CTO | Fortanix
>

Were any other solutions considered other than disabling CPU hotplug?

Is this temporary until something else is implemented?

I'm not sure how commonly CPU hotplug is used, and if people are okay
with trading in CPU hotplug to get SNP.

Is it that fundamentally the SEV firmware can't support hotplug, so
there's no point in keeping it enabled anyway?

Is there some way of supporting hotplug for CPUs that won't be used with
SNP, for serving non-SNP VMs on the same host as SNP VMs, or is that too
complicated?

>>
>> [...snip...]
>>
