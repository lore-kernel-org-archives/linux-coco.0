Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1444E3382F1
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770330928; cv=none; b=o1cmgfrpnfBY3X6SxqgN4iqtUOS5lnsPdkxEApgyLgkN/XvOoxQfHAccpW/AdRW310m6l9GA/59hjJkwGpFp1IBcFGTBdObQBSJcKFSs/+V1qTG9+FYrxv6p5M/s7WnVk139YYhTIJK+9jjvzp98EdsQHNxC7iWWszhsh/HFi+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770330928; c=relaxed/simple;
	bh=DTZoxUBHwlPOflFRXBTJQv1wRjt+JpIiExBlV0YHN2Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZazGSYwJiozFtcvfVYnYWYNpMMLEdkkIFd+zod8shGCbSuvrFy7pxqn+4qREZuhPHfqiStzQzTi1/2jU75dTouK5R4ILU4l04lvRq8bpVanZl+LcaQZ1M7bCiuqL81EgQYmZ6jvq/Jg1DVvZaPAkVX49YgbiXx+sfKlq9ll6l7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LT4p3sQ2; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LT4p3sQ2"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c68b97c0adeso912248a12.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Feb 2026 14:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770330927; x=1770935727; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AToWCMx6AQDZQKwYN/F1QOoyLmm2g7aKLDy9Pva2rRY=;
        b=LT4p3sQ23sFHoxbhOijMUIg5TdEs5mUcpnnH1CjBoXa+R/MGxTmZRfL67qI7svuG46
         k0BHqdc14EORFY7Z2dP/S/keO5g24JpZwnbtKtAWqPyrTBQG6gellUt97SP5nrIo97Kt
         rWt+pb7hChG+S14ynHxRguSdJ5vBBxlSQuRJdGsiWuJbP54bjpp6xZv6kvmbV9jXByRg
         kEKvowSwfy72o9hakCOaw9kyZ0FSMxNfC+pf0rjJqGZBiYw+TQpwpYbM/SHBZq7dzG24
         Sr9ITJ+ISvCP7nuYKvULwCAHT31hlKPH2zX0LV1k1v5YJD5i9ENK2SlTQuKNlITgv+uC
         PMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770330927; x=1770935727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AToWCMx6AQDZQKwYN/F1QOoyLmm2g7aKLDy9Pva2rRY=;
        b=IWYmbl6Tw31i5m0yBZzzavDwwhwVjVrQxgCGq2aQJXp7fSvCEGrjAPeSswf41905WZ
         X16Wo8PWbxUPmx0otyF7/WLjezZIjE7i28meXq3gvoY7w+4kxcVctaSbf/AHJz9+daVL
         IXyvwYiMgMzbSmGrpGiVlgE4CKJS6i7ZA7STqIcQYxFES5l28Efwej/xXX7/gkdtDGNj
         QwPmXEJ1wulcXa7DSW0oJn4QFA3+v+Ox8ycNExLWBcudd6xQZzFRHVD43zx1E/PpQpJs
         ICFCyOtdGh8OpH4xUWhuFiE9QFKZ2MpIZJHrj42BO6qSGOn3SMqbw+0s9oO+ltNXlske
         o4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUpFqHRen7dGYALTGr18a7nlD2fNxYsdG94RbsUha2yxLiU6E5PVpYCmQ99wH7zSIWP/secM54Ta3R7@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp7wC3STd6W+90GfeMX/LOYcRdOBmnEZouC1VP23IxTjtME/UE
	UeUeCvKghnyhzQClejsiDDjIKfLqxzN2PBdjVZ/h/2JYOCY56zUheifGF6H1HK13do5Spu+My8B
	+GiYvPg==
X-Received: from pgjm1.prod.google.com ([2002:a63:fd41:0:b0:c65:e57d:fb55])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c88d:b0:366:14b0:4b00
 with SMTP id adf61e73a8af0-3938fd02abbmr3806163637.39.1770330927334; Thu, 05
 Feb 2026 14:35:27 -0800 (PST)
Date: Thu, 5 Feb 2026 14:35:25 -0800
In-Reply-To: <aYQ0l+C42gssMHHV@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-17-seanjc@google.com>
 <aYQ0l+C42gssMHHV@yzhao56-desk.sh.intel.com>
Message-ID: <aYUbLVrxwDDZ2qh-@google.com>
Subject: Re: [RFC PATCH v5 16/45] x86/virt/tdx: Add tdx_alloc/free_control_page()
 helpers
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 05, 2026, Yan Zhao wrote:
> > diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> > index f6e80aba5895..682c8a228b53 100644
> > --- a/arch/x86/virt/vmx/tdx/tdx.c
> > +++ b/arch/x86/virt/vmx/tdx/tdx.c
> > @@ -1824,6 +1824,50 @@ u64 tdh_mng_rd(struct tdx_td *td, u64 field, u64 *data)
> >  }
> >  EXPORT_SYMBOL_FOR_KVM(tdh_mng_rd);
> >  
> > +/* Number PAMT pages to be provided to TDX module per 2M region of PA */
> > +static int tdx_dpamt_entry_pages(void)
> > +{
> > +	if (!tdx_supports_dynamic_pamt(&tdx_sysinfo))
> > +		return 0;
> > +
> This function is not invoked when !tdx_supports_dynamic_pamt().
> So, probably we can just return the count below?

Or maybe WARN_ON_ONCE() and return 0?  I have no strong preference.

> > +	return tdx_sysinfo.tdmr.pamt_4k_entry_size * PTRS_PER_PTE / PAGE_SIZE;
> > +}
> > +
>  
