Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FB8326D4F
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 20:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769718915; cv=none; b=hyaDXquIH6CBWdVmgTQtRGDv/EYBeZoyc48JZuIN54N7ZiF1MUM9elkVvOvNVHfNrFIp+yfJDS1TMZXEcuMoZmYc7C1CwMcwwiNW2zoW9hayKvWke2T6Y+N9WBfyDazVqcDyxJXJQFbh2ko4UL8SstN8kw2RrK6XxdCOp8iQklM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769718915; c=relaxed/simple;
	bh=MyNIcHQ3AtOtHcDNc7t7dV+X3P1pPKihf3RCfVQvvwI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Lq4oCadMNtJbgUdG78YkR/mv7h3OenXsm2WuftrFBgKS0zcHIavaUS4ObGNTLQYh4QonVKCWS6jPLM2Dsu+NW7JEfYYuZOehzkhmmzK6jh2T634Rn6iEP5zOk8tsZF2qWmmMPbNFHia7jq0gGbeb1bQZ/AllJXLewf9x8LERvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lMJSIshr; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lMJSIshr"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso2801497a91.0
        for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 12:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769718914; x=1770323714; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nRr0fknTEEftcLLsSBELlvbzRGlEtPa009sOBZT15IA=;
        b=lMJSIshrLYMRpAy+KW18jYsPcTzDYW4POAq4VBPh2DSdW6yKv4QdzYwANtl4JZGItv
         whLAe6xNuTsoOnkxCeIMv4yCddYtGwKLq7YEqJxTlZW+F8jBkSnbE+soMosQR1Y2oNyd
         MtdQFhUjII74T/LqgYk2jT+Bv2kwDNTWOKsqUUpd5WBKTUxr03TDg540QstNSjx/Sc+T
         Rlx3ArAkxFCIckyiAj3ha/Iq5fGWYZDzWqFRBs88OlfhMTWZG3lg+y3nJINGYAD5UGZR
         yAGFgUlhBlkRxFxK6s5Q4TDQyFj8u4ony01wHhX6DsgHF8EuaqGMHn2KErUJXjZMhn5E
         GHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769718914; x=1770323714;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRr0fknTEEftcLLsSBELlvbzRGlEtPa009sOBZT15IA=;
        b=pd05eEfu7zHlH7y5AOdN79hhsHarQsr2fqZPzgg7tDpHzARQT2wFY2qVxyAMiNuHMJ
         gyGKCRv6esCl2v/FnRadb5apNm9+bxaBuELVG5cnwCGTEMkYnTVJGMZNnm4Q4eyS3SRM
         FKm4tgMv8Rv8lO6+ZZ5u9lf7Oxe0/gm8IIuTM6B0ldWv5Q72ghf8cu5fKKl6J40LQbOi
         WpG1LqeGDNY5WUs8fxvZP54G+MhiExpPdyXIA3/2+zYPf199f9c9qgom+L9mKByG/tiA
         Oz7qrXtvmYaJ4KEcgT+ZqitPYGMtXRqx7sB8hkuRCKvU32jnjDQP/HW8kjSLce3a+0cu
         b6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWJA591m77JRmGkp6EMU5oT71LQsBvee95m12AoI3AkBaJzsSqduyMQVOBPv6CIZeV9rxPk93D9sRv9@lists.linux.dev
X-Gm-Message-State: AOJu0YyxGeLwPiSAQbmdMZwIuE2LS25Axe66BSeBPn4vHe1mqeLIj6q1
	pAWRHJm47s3EzZkew7tJJ6XWC5ox3Zix8wO7+JUdPGb7QiX/PfSJaSyfpIzv60ROkzUStSC8W9x
	shl/x3g==
X-Received: from pjbov11.prod.google.com ([2002:a17:90b:258b:b0:350:fe17:1110])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3bc6:b0:34c:99d6:175d
 with SMTP id 98e67ed59e1d1-3543b2e0022mr605496a91.2.1769718913806; Thu, 29
 Jan 2026 12:35:13 -0800 (PST)
Date: Thu, 29 Jan 2026 12:35:12 -0800
In-Reply-To: <cd7c140a-247b-44a7-80cc-80fd177d22bb@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-12-seanjc@google.com>
 <cd7c140a-247b-44a7-80cc-80fd177d22bb@intel.com>
Message-ID: <aXvEgD69vDTPj4z5@google.com>
Subject: Re: [RFC PATCH v5 11/45] x86/tdx: Add helpers to check return status codes
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Sagi Shahar <sagis@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 29, 2026, Dave Hansen wrote:
> On 1/28/26 17:14, Sean Christopherson wrote:
> ...
> >  	err = tdh_mng_vpflushdone(&kvm_tdx->td);
> > -	if (err == TDX_FLUSHVP_NOT_DONE)
> > +	if (IS_TDX_FLUSHVP_NOT_DONE(err))
> >  		goto out;
> >  	if (TDX_BUG_ON(err, TDH_MNG_VPFLUSHDONE, kvm)) {
> 
> I really despise the non-csopeable, non-ctaggable, non-greppable names
> like this. Sometimes it's unavoidable. Is it really unavoidable here?
>
> Something like this is succinct enough and doesn't have any magic ##
> macro definitions:
> 
> 	TDX_ERR_EQ(err, TDX_FLUSHVP_NOT_DONE)

FWIW, I have zero preference on this.  I included the patch purely because it was
already there.

> But, honestly, if I were trying to push a 45-patch series, I probably
> wouldn't tangle this up as part of it. It's not _that_ desperately in
> need of munging it a quarter of the way into this series.

For sure.  The 45 patches are definitely not intended to land as one.  I posted
the mega-series to propose an end-to-end design for DPAMT + S-EPT hugepage support.
I don't have the bandwidth or brainpower to hash out a KVM design in two different
series.
