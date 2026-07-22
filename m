Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2926040DFB6
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 19:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748880; cv=none; b=FB/IrRs/fXxXOGh4kZeFrIpfgMrUO+otSTapPZQNWEzqwClvAk0mKtHfHj1IfcggbjfMxNORZ+fmYR/8rhfYL1ueEH+ENenYizCSVaIPvW4ptphotsgHDX+AR/hHAFhG/xPyKsdIx5DvrbJJPQnR9zXQg7Jq6kM7HQnT0XWMZV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748880; c=relaxed/simple;
	bh=1xj0gKyVDg9BPa8UAb1IrHRIih45Z44r20ovKTsMtlA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ONA+1TRfg8ieGRbMLTGOqPhrXJ7r9EzgmeMPuEw+GYjYUdz/gX1zdeyGl0ZBzsT2adXOUWUNI7Lgg7fPIs4osHc0+Qjdj3RbOrjhkwcsw80oGZW9ItOZDIB5AufUD6VYkBcgrHow7lP2IOkmYmNMEegGdKHQtcZfZbVWJPkmvHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RHC43LPH; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RHC43LPH"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacd6d37edso175291635ad.0
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784748876; x=1785353676; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMWtzkw+88B3doKk+TNewGk3CZeZPu1IQm5Y/qLTIEE=;
        b=RHC43LPHxSHcQaeYRSye7wf4JlBdkKVqDgdLROZ+m0uRAUXc71tLJzOqQTUc6XyU6g
         W+U0QkHdvuMMlNECuHCXZLkAtNhinybhtMNwPXl6Azk9xU2xdJjVeZvjGCNqFH6XxMfJ
         NdvXscZaypGM0pf9AaAWm96zWzK/VddjSZTYLFiphR4pTDiaNxr6WLwmZp2i4Mo011bP
         rYs1XqQdIRdW1r1hw3yaHO0qPnenXyNRAKYjW0KKjlunjIUQ6cGHUstAqLrAgbh4ARjk
         ujPwlo4GGO6bRDR0/VxVNIBpJIewuOocZnCGN392xeCPHR6GON7hUn47GXPisRPsF4LZ
         0Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784748876; x=1785353676;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMWtzkw+88B3doKk+TNewGk3CZeZPu1IQm5Y/qLTIEE=;
        b=IiCY80d8XJna7p5vJrVEH6BH4FmPd5sktwUnWnov4bj56Pe6vvX27bOQStVQyxft/s
         Nz5vjp1y1pP87BSRffvxA2GJreyb1IicBjSf0/47rL2oizjYpyhrG4yuC80Orq4lEC0U
         d+p5oXF04p0Sa5kxNsf57LHlrszLrDRD7Dqcz3MEykjzpkmB+8mk1zHsj19aLbP3vX9I
         /6JVbYxSmJoRRkbaPvi4jFZXUBcocBhoWVaRl9l4oGWeFV60OHMpOPYLAbklUj5R98ec
         Nn7X+jzy/GGOJoShN66xVkasnCz2XemGkHzYlqC4JwojBa2YQ1Uwzp3SdJh/UR8KjaA/
         RT3w==
X-Forwarded-Encrypted: i=1; AHgh+RouBexhH2OYancNx9UaHZ7lkoi16YmzGi0j9vtaHJpK8xK2qCaRt7rpMgcXNBjzWaEJiaQn+Wk02f2t@lists.linux.dev
X-Gm-Message-State: AOJu0YxEFlCUARE4r9OXsjkbsjZXmr2ep+5+6TXAxdiKfIqbhgF2c3B4
	87tuOoFO0oprNXssU6W83CR+AxlGX8Dk9HNaLnLGBaQKOQu9hjhDGDPG/S9jxx7wMeg7m0lMMGv
	V7ml+Yg==
X-Received: from plbaz1.prod.google.com ([2002:a17:902:a581:b0:2ca:c2f8:a319])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f681:b0:2c9:cf5d:d9bc
 with SMTP id d9443c01a7336-2cfa74b13famr1966725ad.35.1784748875968; Wed, 22
 Jul 2026 12:34:35 -0700 (PDT)
Date: Wed, 22 Jul 2026 12:34:35 -0700
In-Reply-To: <4ad035a82ee10dc4645e26a4bd1daf40786a743a.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com>
 <20260718014500.2231262-9-rick.p.edgecombe@intel.com> <20900cd6-6d05-4a20-a21d-2a1d4a6ef5e5@suse.com>
 <4ad035a82ee10dc4645e26a4bd1daf40786a743a.camel@intel.com>
Message-ID: <amEbS6WDEyrvW72Q@google.com>
Subject: Re: [PATCH v7 08/11] KVM: TDX: Get/put PAMT pages when (un)mapping
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, Binbin Wu <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, Vishal Annapurve <vannapurve@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	Chao Gao <chao.gao@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 22, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-07-22 at 16:46 +0300, Nikolay Borisov wrote:
> > > +static int tdx_topup_external_pamt_cache(struct kvm_vcpu *vcpu, int
> > > min_nr_spts)
> > > +{
> > > +	/*
> > > +	 * Don't cover the root SPT, but cover a possible 4KB private
> > > +	 * page in addition to the SPTs. So -1 to exclude the root
> > > +	 * SPT, and +1 for the guest page cancel out.
> > > +	 */
> > 
> > That comment here doesn't seem to correspond to the code in anyway. 
> > There are no +-1 adjustments.
> 
> The +1 and -1 cancel each other out. Hmm, how about:
> 	/*
> 	 * Don't cover the root SPT, but cover a possible 4KB private
> 	 * page in addition to the SPTs. The -1 to exclude the root
> 	 * SPT and +1 for the guest page cancel each other out. So
> 	 * make no adjustments.
> 	 */

Maybe put it in code?  E.g.

	/*
	 * Minus one page to exclude the root SPT, but plus one page for a
	 * possible 4KiB private mapping.
	 */
	min_nr_spts += -1 + 1;

	return tdx_topup_pamt_cache(&to_tdx(vcpu)->pamt_cache, min_nr_spts);
