Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E328A2A1BF
	for <linux-coco@lists.linux.dev>; Fri, 30 Jan 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769736622; cv=none; b=iQKRtvFA3wgd6USoY2wtqJBwS8Y3FXTJX3n0a6e1GnhM39JWJTlQ+Q0epW+P14yXkh7uV7GhfMUQ6Ybx5+oGjze9iLWPk6DdFDalNbyles75jcPmPMndqfe1Wan03gK6e0t4b1FXudBV7wyBxNhRtPFSFWhz+Jpj/mXjSthsJjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769736622; c=relaxed/simple;
	bh=OWbo5+AC/7MNSmt+smFsiU1JrGaXjjA5PVj06qv+38c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=IIECvAIpnThB3VoCiVn9WzTQoPGTcnIJ8a0XVAt1n00iFkM+PfNytMHOy8n78PGd/rXbO39IaJ9cuJN0m5X9htGchGwrD6s49O4yRwSnviL5hsy4bSFpyydPLFEFLMrGWyBEyKPqrSOJKh4FqLETxY06X9G+ho/ftP2MzsW7Vi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J+1Fl7u+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J+1Fl7u+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso3677369a91.1
        for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 17:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769736620; x=1770341420; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQBtu95IXBz7ZXJTgTL37RQFlBFs8n039CcrQPqipBA=;
        b=J+1Fl7u+5ShlV5eRapJ706Lp+Ra52uSVAcz7ckXfj8/UcCZChTw2lE7D+vqNlYyJpS
         WZ2GGAovmKdlrlNRV6ZG8/NMHQ/0cLm97LYqq6+7LNwgV0poFnPDUJfKSLpan7O8B7q+
         wHkwvRTinXJZk+xAhXgQlwqQgJZlpYNF0NueqybST4vu7A5LjaGGIvvk4Ppz8tUhDSUp
         7bgA7cD/a9xDhCrEPgCINYXIiecVeJ2wJ+33sWoAC++bVVRC2snxD1tCNymgfq6v0Qx+
         gq+zxXtsZhqMmGjO8lzge4Oa9vgqYjl+DiM7ShWurEtzmrKkUIyk8/qs69UPOsT6lK2W
         0fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769736620; x=1770341420;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQBtu95IXBz7ZXJTgTL37RQFlBFs8n039CcrQPqipBA=;
        b=FLe1d9sEChtK/zAiNAFwAKVW06nKAUJY8mIFLpuOssO1oSWGagha3fxQyGALCucLVI
         k1T+6aYEl85+enanE28Uo9Ica6tkRAVtAiQHJNbJ/brEaV8rt4yPllA2VQdUx5/AkNso
         qKD5jsagVYqoQmmJMV3eg3VxXUI03DSqM2C5+EdtodNUrbD8YoCX9v9zcS8OT67p0dOP
         6WtDTX6Td0HQbYLmP4u2oIOsY0xu1VWq1Jm0618V+dpXeyR6ud1Eo7DHs3dYmchN57rI
         O8APtw6j8KRARgUX+D5gtX6Y93RTzkfp6kOMo50Iq6HpUFKWrfxIoMvyRvZ3ap3riU10
         0xsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6fYQgH5c9f4WkAeCdjJ3zBqeExgPsGaNqHhOT6/6CxTG9EV1WEtaA2rJ/27mAZf+hjl+cJIumC4Pm@lists.linux.dev
X-Gm-Message-State: AOJu0YxaMLxVdXwAP9KYeLXLSeWVwzGr1AmCRDvkCAMafulyHS8kn/hj
	pOKuw+H7R3c77N3nw3OMu08MTJeRXkQm9sqK16alT3Mtep61oWVDCpI1NVNNjtpmSlxMbIoOpFw
	3iIzFTg==
X-Received: from pjbcu19.prod.google.com ([2002:a17:90a:fa93:b0:352:d166:32ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d4f:b0:341:88c9:6eb2
 with SMTP id 98e67ed59e1d1-3543b2dedf9mr1401283a91.1.1769736620318; Thu, 29
 Jan 2026 17:30:20 -0800 (PST)
Date: Thu, 29 Jan 2026 17:30:18 -0800
In-Reply-To: <20260129011517.3545883-17-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-17-seanjc@google.com>
Message-ID: <aXwJqkVErsY3CBuX@google.com>
Subject: Re: [RFC PATCH v5 16/45] x86/virt/tdx: Add tdx_alloc/free_control_page()
 helpers
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Sagi Shahar <sagis@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jan 28, 2026, Sean Christopherson wrote:
> +/*
> + * For SEAMCALLs that pass a bundle of pages, the TDX spec treats the registers
> + * like an array, as they are ordered in the struct.  The effective array size
> + * is (obviously) limited by the number or registers, relative to the starting
> + * register.  Fill the register array at a given starting register, with sanity
> + * checks to avoid overflowing the args structure.
> + */
> +static void dpamt_copy_regs_array(struct tdx_module_args *args, void *reg,
> +				  u64 *pamt_pa_array, bool copy_to_regs)
> +{
> +	int size = tdx_dpamt_entry_pages() * sizeof(*pamt_pa_array);
> +
> +	if (WARN_ON_ONCE(reg + size > (void *)args) + sizeof(*args))

The above closing ')' after args is misplaced, this should be 

	if (WARN_ON_ONCE(reg + size > (void *)args + sizeof(*args)))

I'm still in disbelief that I managed to end up with such a horrid bug that
compiled without any warnings.  *sigh*
