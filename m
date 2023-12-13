Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C0E56B86
	for <linux-coco@lists.linux.dev>; Wed, 13 Dec 2023 17:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d5Kp4nXT"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbc8996908dso2017343276.3
        for <linux-coco@lists.linux.dev>; Wed, 13 Dec 2023 09:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702488614; x=1703093414; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/vSOPRW34ZBEoGLP7AobDWeoYbZlEIfUFdS/cfIhTI=;
        b=d5Kp4nXTHg0No+EZ4ToWNyFwsgxilzhqfg/CQ9aXeKzxwDhIZr7cpe9Cl//A2sKS4K
         wnrA2SHT0zt/8ZJmeEBnPWQI4g5sRUdiobJHgiQI5dNpwF8aXZ+4gWMN3FDVGdebzcQh
         XqGpwjidvPXJefw0noYCRanWcnBIg/QEftTs/40qT2GQWrYJUorQRPg8m8Npz35q0aCO
         e7M93gUDq88n95hB3rqJAzFAfn4cvpdZictm4XdNfpAHfiAz3nxarby4/fmAdzJghJnT
         jA83RZ+zNjNBNxXEWo3qwfqGsZTWSdoVHWNjGTZvyMQ+oQPLLUWPnN1ixdf6LfK8sKTn
         Cpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702488614; x=1703093414;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/vSOPRW34ZBEoGLP7AobDWeoYbZlEIfUFdS/cfIhTI=;
        b=d1zU15DCKTRUI+t3wyxsrCj6ewGW3rasBDF/hRb2yL5inG3nfYTUhNdtSGzpe6oqzC
         uuqaB+cQCtv+iPmEEPV5dgSabHaB/AQgmlF3ZvZm/Ok+RmFvyxIemdx8/EErAvruQakg
         rZYTel/2b6dbzQrc4u/VSIJm3FqrUvSll+AZ/7JZXvDI1X2LB4fKG5cYH72gq8q+KPjR
         BU7/8ksiKO1PAR+q+0yoihr283oQp1NrldaoP1tXsZH897/vlS36PWMthVZhQkQE+mIz
         18IixQ6AskmgWCc3SMfc2Jd/LvQoDK/0W2jyTP3T/UT7L1cnlezugxqF5+/TUHAFvOLN
         Q6cA==
X-Gm-Message-State: AOJu0YySZSTSbz7365k33GqYvzrbVTR0gppX+OG86dfYj3iKwraDaw0F
	DIDp4K87Ja1jys485wuVC1h7kI1ZTWc=
X-Google-Smtp-Source: AGHT+IFOP09PwT6lqIkFRJAMnbtTHRKLbaBMtetikxZWuMnGPaXYka0H53M769c+RQXX26fiZIa7/SXOFXE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1812:b0:dbc:cc25:8ab with SMTP id
 cf18-20020a056902181200b00dbccc2508abmr23845ybb.4.1702488614570; Wed, 13 Dec
 2023 09:30:14 -0800 (PST)
Date: Wed, 13 Dec 2023 09:30:12 -0800
In-Reply-To: <e094dc8b-6758-4dd8-89a5-8aab05b2626b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231016132819.1002933-1-michael.roth@amd.com>
 <20231016132819.1002933-4-michael.roth@amd.com> <e094dc8b-6758-4dd8-89a5-8aab05b2626b@redhat.com>
Message-ID: <ZXnqJMKD6lO6a0oq@google.com>
Subject: Re: [PATCH v10 03/50] KVM: SEV: Do not intercept accesses to
 MSR_IA32_XSS for SEV-ES guests
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, jarkko@kernel.org, ashish.kalra@amd.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	zhi.a.wang@intel.com, Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Dec 13, 2023, Paolo Bonzini wrote:
> On 10/16/23 15:27, Michael Roth wrote:
> > Address this by disabling intercepts of MSR_IA32_XSS for SEV-ES guests
> > if the host/guest configuration allows it. If the host/guest
> > configuration doesn't allow for MSR_IA32_XSS, leave it intercepted so
> > that it can be caught by the existing checks in
> > kvm_{set,get}_msr_common() if the guest still attempts to access it.
> 
> This is wrong, because it allows the guest to do untrapped writes to
> MSR_IA32_XSS and therefore (via XRSTORS) to MSRs that the host might not
> save or restore.
> 
> If the processor cannot let the host validate writes to MSR_IA32_XSS,
> KVM simply cannot expose XSAVES to SEV-ES (and SEV-SNP) guests.
> 
> Because SVM doesn't provide a way to disable just XSAVES in the guest,
> all that KVM can do is keep on trapping MSR_IA32_XSS (which the guest
> shouldn't read or write to).  In other words the crash on accesses to
> MSR_IA32_XSS is not a bug but a feature (of the hypervisor, that
> wants/needs to protect itself just as much as the guest wants to).
> 
> The bug is that there is no API to tell userspace "do not enable this
> and that CPUID for SEV guests", there is only the extremely limited
> KVM_GET_SUPPORTED_CPUID system ioctl.
> 
> For now, all we can do is document our wishes, with which userspace had
> better comply.  Please send a patch to QEMU that makes it obey.

Discussed this early today with Paolo at PUCK and pointed out that (a) the CPU
context switches the underlying state, (b) SVM doesn't allow intercepting *just*
XSAVES, and (c) SNP's AP creation can bypass XSS interception.

So while we all (all == KVM folks) agree that this is rather terrifying, e.g.
gives KVM zero option if there is a hardware issue, it's "fine" to let the guest
use XSAVES/XSS.

See also https://lore.kernel.org/all/ZUQvNIE9iU5TqJfw@google.com
