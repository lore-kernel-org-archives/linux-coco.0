Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454213C9C8
	for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713990114; cv=none; b=hI+2dkOAX3MxF+kRQY7MhknjkTlgKmDjVjNr8llUqFDbHT3qKhBMqQyQfZ6PnTtP5QEwppmilds1es1BAZBL6WPdGyM166NT5IVqTwouLlQBjTezkVGmnlkj4gUqzhgLvaLY2RSCgveNStiE7Ncae/nPCoJzqpEI1IfbxsWcULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713990114; c=relaxed/simple;
	bh=TGEtv5XOiits4mamBa9OAfqfGV4U4S70ayjHE1cLPf0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hdj6Cev2R2oNkgBYgx1qHkxug4Twm0zrlEpIebc2auxzo4IAhbdSi/byXeHfX+9S9v2/zujubSM6QtKX43THqOOympN13CoDk8kS9PyO56udUND6Qknv9ZV8w2tJJNd1RAl0MiBCvdEiMnfYSf8zvEToNPdMo33aBM2gaLGmBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPoY2U5Z; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPoY2U5Z"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6b269686aso519792276.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 13:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713990111; x=1714594911; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJKivmW0J/DCohVbY4PLH/Gsm5HkrpKk4PumvPQkGTk=;
        b=tPoY2U5Z67pr7YgCWJAf6bD1cMg91bHhaP5hAHpqh0+zFwfXmLJoPlqaGECTUxuGCM
         hxtsojmG+yqrkP3KHzvrdcDikk84FLQP6JGmVrX0lN+zeg33Mvs0HB7RWYke/wE2TRyy
         2cx41JUx8Z+F2+NBP8YXYAAm9itPkRisISMiNhbqOLF1cEc5C7X6dwuHLCHEcerCU8Rq
         fcQbVcPEhxpRBubz0iCZbqSZoB2gv9Miq3/i8QnCbELDnE+gTOYNGC/1KggX9uqp4xd/
         duV+6rSrJIIWrEegnPcYwUr/hAT0qdtlotntIPQjwg/7v7T0fBGyFBqjghgXOLTZOs28
         UHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713990111; x=1714594911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJKivmW0J/DCohVbY4PLH/Gsm5HkrpKk4PumvPQkGTk=;
        b=wabERGWSo2ZN0dApAhLJRYxWUGQUF2Buw0MHsqwfhm9QAaMxl/fg3rqujOI3QPvpa0
         7Z0oh2hCuBE64KrI5uiCRAcX6jsPt7P+DdenLCfv5qeRplVthaPyws1vptgXkN2QBGJE
         UuPpsuWjR0uEhYzElLbQZVdcNcW9utKgnYRGAEffVXO8JC51Xq091mYRgCKy4JWl49od
         kR2RpZyB7Urf7syjmBq+SaUod8ikqr+U0+ew4T1v28dFKjSKGu5a1RMCfSQsHXR/L1sN
         cbuCWZZ0oBQNU78qDImsWoUkmOUcS2mDaZUFx+fxcE1g+Ugg6e0eGthtYvW6GguWCU2Y
         FfZA==
X-Forwarded-Encrypted: i=1; AJvYcCXAJBZw3nkSmVZLvHhyokSoPSZxpapOXnSSDeJv2N/uMEUCrJDwgNBInq4CtSXoMVBJm5hePEEh1+XjXagBEkA6EdCCwVFPyUPJMA==
X-Gm-Message-State: AOJu0Yw14Vtg2pCGXqUVAwG3efF4NEgD4WVbl+RfhcnWImv6BdpEEzzK
	x78fBNjD+K2RCNFMYCBO/s+1sF560xk9n3Y4Tng910+fsV/3kxj9PcyZQSNxLls3OaLOuVqANpC
	0+w==
X-Google-Smtp-Source: AGHT+IET29Be+TqLLxR1el2WX7B1TltJHuVLHw4XBc2UEobX1IG760KHrKW5Mr9mGqY0ZbBfjntc+5CKv7o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:c54c:0:b0:de1:d49:7ff6 with SMTP id
 v73-20020a25c54c000000b00de10d497ff6mr385878ybe.7.1713990111258; Wed, 24 Apr
 2024 13:21:51 -0700 (PDT)
Date: Wed, 24 Apr 2024 13:21:49 -0700
In-Reply-To: <20240421180122.1650812-4-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240421180122.1650812-1-michael.roth@amd.com> <20240421180122.1650812-4-michael.roth@amd.com>
Message-ID: <Zilp3Sp5S-sljoQE@google.com>
Subject: Re: [PATCH v14 03/22] KVM: SEV: Add GHCB handling for Hypervisor
 Feature Support requests
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Sun, Apr 21, 2024, Michael Roth wrote:
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 6e31cb408dd8..1d2264e93afe 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -33,9 +33,11 @@
>  #include "cpuid.h"
>  #include "trace.h"
>  
> -#define GHCB_VERSION_MAX	1ULL
> +#define GHCB_VERSION_MAX	2ULL
>  #define GHCB_VERSION_MIN	1ULL

This needs a userspace control.  Being unable to limit the GHCB version advertised
to the guest is going to break live migration of SEV-ES VMs, e.g. if a pool of
hosts has some kernels running this flavor of KVM, and some hosts running an
older KVM that doesn't support v2.
