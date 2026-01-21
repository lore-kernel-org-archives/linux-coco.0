Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22E9296BCB
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 00:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768956727; cv=none; b=WEeu0JUXugbDhAe8QmIq/2hCLty8wQD7SEswlbRYK5VQhWRS/QBXOsGSoEXJ6lewKp4Pdt6FxfqO04ZmgDF/oeSLVGrHtk+i3xHwMDFdf943SDMd9hCfFv48WdrUqmS/D6LX+ZQomgsd7BLMGTsnRZ/l2c2o3CWipXr+vsSBUTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768956727; c=relaxed/simple;
	bh=EkVcNVO1CNLIf3T/s28sXrF08YLCrCvJ5AM2yKBw9Zg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dg6q5qqVXe7syIcDCcJP+ZUmQiUlkYZLXlfTXkOAihG1s6rrpRunYm1jmTxGZQpXv0GpTmMRNV0TsTrhZWlteSM+pa3tb271vTJkZ+RzIhQJPIn7FM/EANZ0CTUjV5Yo59dH+3ReraR/SOuUf5RUSYI94/rULaHlC3RWKVerelI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MAp+lM0U; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MAp+lM0U"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a089575ab3so54109855ad.0
        for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 16:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768956725; x=1769561525; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+MdgG0Ul2crpYgoSbV/KPCK+3WNDc/xDp+a+HIFVTx8=;
        b=MAp+lM0UDSGTilkuruunvwUsx1ZHoWOwXV+ZYYbw65rKGAfvUsCf+ojCif4NVp7yIN
         wW5PM2KXdV27vO3PiNm4mx386aFeOCsDEVZvJ7tX0SU9dtvYEo9WEZB9RD8lFU9UblzT
         KcIZFMfOHn0mlMMPl7+oAjvSIdzZDxDyTfLtsM4mAfxxOZPXVZiml5sL98osjlYJDhzQ
         op3N7NLhZK+e3NDN0zkWyKKsHicORFlaP3S2NDD+xABGA+52G4HADaIUYBMxDUDK5CnP
         sISJ2vMkfeRrN6AIi0bQma5hh1+ANJFJCWV7UDkmOGa1gQmQ7gaSfOil4IQMOwdi5IOY
         9Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768956725; x=1769561525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MdgG0Ul2crpYgoSbV/KPCK+3WNDc/xDp+a+HIFVTx8=;
        b=u6TnlHprrB6nLeTQUv0nimGb9tqJOnLZXH0vmBWgmF8s8JhI2L1y0YksMDWdw/zthI
         6DYhcMzJ7GmFAnZZf5Bj2WX70BQKjxH49Y/m/aBqlzWMkTBGU1LOm2XyUc8OWZg6aiVI
         rHARUmw6uzepicsqH2loIjcQnVmvy/PHn7R3SFRBgOLkOl73XXs30RWONKE2611We0ab
         6z4Z48JtRvcY7LjDCI4yeKjkmp00mIee1GGLBbAFdBHeSTP2Ge52RfYUDeX0KCCItcm8
         ugDsqXbECZ3Ytzm6vkDsywdWkREzrNQyitJbCApU4aFz3OCkwZV0pVQc7wtlk4VTsqIx
         Le6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKrcioOEg2f0OnJec21oCO+NEdgD3foUpuYtiZWKHX3yprNzyZbWHGGrOAPNQqBpT2x4rR23do4WQV@lists.linux.dev
X-Gm-Message-State: AOJu0YxAzjkm/JLLpyQNnkGkeaB6XC32gQWyknapjPYMFNB/XEEPhXO5
	2NKAsKGHOTqt64/Mn0RfgZ8BC0wvCLX1WjX8/8biPCAcug4b5Z0E+09QkqrL0HQW/wRrm4rAN0L
	ibLIwjQ==
X-Received: from plbmt16.prod.google.com ([2002:a17:903:b10:b0:2a0:c208:8799])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db04:b0:2a0:bb05:df55
 with SMTP id d9443c01a7336-2a76951f3a7mr29795775ad.21.1768956725049; Tue, 20
 Jan 2026 16:52:05 -0800 (PST)
Date: Tue, 20 Jan 2026 16:52:03 -0800
In-Reply-To: <20251121005125.417831-13-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com> <20251121005125.417831-13-rick.p.edgecombe@intel.com>
Message-ID: <aXAjMxbeMO0pioNF@google.com>
Subject: Re: [PATCH v4 12/16] x86/virt/tdx: Add helpers to allow for
 pre-allocating pages
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, chao.gao@intel.com, dave.hansen@intel.com, 
	isaku.yamahata@intel.com, kai.huang@intel.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, pbonzini@redhat.com, tglx@linutronix.de, 
	vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com, 
	xiaoyao.li@intel.com, binbin.wu@intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 20, 2025, Rick Edgecombe wrote:
>  static int tdx_topup_external_fault_cache(struct kvm_vcpu *vcpu, unsigned int cnt)
>  {
> -	struct vcpu_tdx *tdx = to_tdx(vcpu);
> +	struct tdx_prealloc *prealloc = &to_tdx(vcpu)->prealloc;
> +	int min_fault_cache_size;
>  
> -	return kvm_mmu_topup_memory_cache(&tdx->mmu_external_spt_cache, cnt);
> +	/* External page tables */
> +	min_fault_cache_size = cnt;
> +	/* Dynamic PAMT pages (if enabled) */
> +	min_fault_cache_size += tdx_dpamt_entry_pages() * PT64_ROOT_MAX_LEVEL;

The caller passed in number of pages to be added as @cnt, don't hardcode what
could be conflicting information.  If the caller wants to add 50 pages, then this
code damn well needs to prepare for adding 50 pages, not 5.
