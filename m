Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792807410;
	b=Ggtgup74Vwi/QVBjvU+Qsg5G3y4NR/AbKkBtgCEHzfK7Ufz+GO3cm7FYWCUvb8S3XuEq
	 z3/4qVwpEZmgNUEqlXMinjqwW8PirnyY9l0HyHSDVeA+vykE1ZqQaRKjzQT3rV9tmlmnO
	 RvdKCmshygrslpKWS9tIZXOkW8i0jEMoAnsjE4qPGwCtCqTgDslWSBn/ZuquNCquOkpjM
	 sjQczPzUxR4sfQ+FohXwV77L6d/sC1yAxaawHBI0GsRUOvW08BVOP+y+d6sFj3G850Acr
	 AF6Dy2h44yrIne9TTFJHz71YgzUNJ6Yre1luIhXIJFR2EL+elBEWAnQ7HdhCxFc+CEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792807410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jNxeypu/UiKv86Z24ODkNybt5lTKhyqeVQWmn/P5E/Y=;
	b=kUKmAI/Ma1yvuByorht1evaFQr+oZsTLYz8aTIrKgIOToo8u/tGawMBRGOhcEEe1ChBx
	 xNRGuYjRYYLuTbfz/Cnly0OHc7V7jEk7+ILwVDOJEWrDBnRMheLSBhYvIe49odtXrivhI
	 XRfkuvMlzT13iEDjI0s3XOOWzfvTf++MLubPbfHJZKUOYvElKVwcxiTcfA+qWQoyzqnMa
	 TJ2Ygh8vKBgQzyp/mg8Q7OZ/fSiNaStfK8OuBWu0EDnPhVvL+A12d8vJOalYXPL2m8MY/
	 OnvdcZj+ew8h3YJN46N7b/gGSLQkrBbavs7pLOaSJ6wFP4OKVNi+AJ9qI42rdjRg47g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IOfREKZI;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDF2606A31D
	for <linux-coco@lists.linux.dev>; Sat, 24 Oct 2026 02:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDF2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IOfREKZI
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso1503209a91.3
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 19:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792807409; x=1793412209; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNxeypu/UiKv86Z24ODkNybt5lTKhyqeVQWmn/P5E/Y=;
        b=IOfREKZIUpe0hO6c3PjZtvhZ4Wl2wIwTkYvM9msNI968Ya1iH+7/YndyImMrrBBVeb
         C7WECH9S9XSvw72t29CGz/fL/C6Tt7d59pBXFb41XIYxrcCJylU1bMZj5itquKliTUrC
         Ksq0BlF99Z916e9LI0PKtqJ83pPFX8s1bt6rYNfUqYXHKhECKQek+CENkkL3pEAVl43c
         NLlQ/08YE1K2luqJxWvbnd4xDDSjr2AWNmbquooVsYomNIJnQUNMwVoA9Aa+mq4GlZAc
         jW7Xtae5MS5TFDI/Zt8adDw/F6xxmbGrpO49T44yt7NZIytPTecf8jr7ujM/5pubkgRi
         kcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792807409; x=1793412209;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNxeypu/UiKv86Z24ODkNybt5lTKhyqeVQWmn/P5E/Y=;
        b=NDa5XQ76juxoHkZJprQGCyzPt7DhAb+roeWkdzyRCOLq5IvUe8b3gbhFW/NNwWhVAs
         sFlCH7ZPTqOZ0xcjTUkm+OfzCyKqzFn3RX4yp+Jqvh9yiSTrL46MHiUaYk9fKldJ46jQ
         9W3Du5g/4AccXqMRclczHLXPpFBavDcBgpi4EHoz6NU/NtrvTAAkHj7QA6R9Bfww2H0T
         PuyXXa6CVDLJhpTkEwPjc6rL6guSP+vhfKjC5Lh99OxtdDwX8s+dDX/oOHdk7Bexf9YN
         BmUqK+/qjC4FoPAgSDKtXXIlaqQHkH19JpW25Ii62Xd5ATh1TKfFrtgrGADv3Y7bYrDw
         T5FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmCVDpX45qW7H83lZFBscwkEAgFNQAHe7qP2KdB5Py4iuozG22zDTFdDDhkWX5XESbAG6v8aeYqV8D@lists.linux.dev
X-Gm-Message-State: AFq9FYJRRsK42RaepPyOqnMyHKjeb/GVFBdRWpC9ZtBm7Jx6TLmyjWGB
	79m3oBLXI40aYg3Go+ItN6PoEMu0HOjkVM5wKIEjrxrA05/cZn15I1tTrnrPg7PQUxZ+LSITuS5
	tI4epNQ==
X-Received: from pgmr20.prod.google.com ([2002:a63:2054:0:b0:cd8:bb5c:4aef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3846:b0:3ac:945c:7f69
 with SMTP id 98e67ed59e1d1-3adeb162362mr786457a91.66.1792807408684; Fri, 23
 Oct 2026 19:03:28 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:03:27 -0700
In-Reply-To: <4e1d5d94-9956-4cc1-af5f-1311461ab233@linux.intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com> <20261022210134.612848-3-seanjc@google.com>
 <4e1d5d94-9956-4cc1-af5f-1311461ab233@linux.intel.com>
Message-ID: <atwR78qCo3qeUXLH@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate
 when filling CPUID entries
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Changyuan Lyu <changyuanl@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 23, 2026, Binbin Wu wrote:
> On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 271c2f94b8dd..37d088f6f7a8 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -2,6 +2,7 @@
> >  #include <linux/cleanup.h>
> >  #include <linux/cpu.h>
> >  #include <asm/cpufeature.h>
> > +#include <asm/cpuid/api.h>
> >  #include <asm/fpu/xcr.h>
> >  #include <linux/misc_cgroup.h>
> >  #include <linux/mmu_context.h>
> > @@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
> >  
> >  	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
> >  	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
> > +	entry->flags = 0;
> >  	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
> >  	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
> >  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
> >  	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
> >  
> > -	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
> > +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
> > +		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
> > +
> > +	/*
> > +	 * Explicitly zero the index when it's not significant, even though it
> > +	 * _should_ be meaningless.  Userspace relies on the index being zero
> > +	 * (the ABI was inherited from KVM_GET_SUPPORTED_CPUID).
> > +	 */
> > +	if (cpuid_function_is_indexed(entry->function))
> 
> If the information about whether the entry is indexed mismatched, i.e. the
> warning above fired, should we use the information from the TDX module as the
> standard?

IMO, no.  All of this information is available at module load.  If we want to
harden KVM (and we probably should), then we should apply these sanity checks
(or equivalents) during tdx_hardware_setup() and disable TDX if any of them fail.

Anything else is a hope and a prayer.
