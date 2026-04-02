Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E550372B52
	for <linux-coco@lists.linux.dev>; Thu,  2 Apr 2026 23:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172211; cv=pass; b=s+8VhZYgXs2NjKhzR2aVlVgMQ5pg14afqNTZQMmPYZ4Rd6PZSEtYtpXAglk0HlBYD2cA7OvC2eN3H7+V684SKwcJIZiQ6/BMslf6SHQki0HRLTZr8Jry6KC2JEqKe4d4eX7iCAs1BIdOys+Kabu9sdlyvXRF3FNC0F+vKZqVj0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172211; c=relaxed/simple;
	bh=2WAgR3x9pcbMMZEljcq4po1AfFNPTeTXEWuQrsK7vdM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcZd968aHQE6dET/W4NMHrY068v78ShwT7qKp05q0g4idphW+liBwJmMAZKI9RNfiHOojDi1oVvkxcZRQlCErt2veqkUERY62oPKO0BEzdlz7h8uRbWvuuUZGsi/wiQWwvNb+ykAnlIeC91dtal9r1YNkraigZ/WYrVRBadx/jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HwATihRI; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HwATihRI"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-60525a93444so429484137.3
        for <linux-coco@lists.linux.dev>; Thu, 02 Apr 2026 16:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775172209; cv=none;
        d=google.com; s=arc-20240605;
        b=YhVRu33SpylDAkQCQNLs/0ktXcHuyuCWZJzglIdmpcHVZRODJrEBRHzJsTAOExUvo3
         b+UeonACDgUatXnW2cZmIxZqnSsbx+bnYcmN3MxOqrOFfviXUYahQ004QakB5uexkMzH
         j4+JemwgpicZC2siVG0ezvT+Yd1f8FYKeyD27xd3bcaawVm56N18sqracQ/LOQrScgzI
         jMcmRu+DJW56suGgiPbQfRoMvG+9BBbwbIAHAkzpN4+dELr86X7/RrubxgtmQ17VDsCB
         16YG1CSebUdx/4OKJWIw7UvUBFw0Ts1yiJJyaN3aIfGuq2sQWdYqQQTJS2kfhdM6g6X3
         a6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gjOPgwHvpL8SXcAqUI6l7te3rZPTzhYxLIlKMmHX23s=;
        fh=78lvv6cK9tQMTg8rh6ccLI6R5YaYdDJDba3jOC70IJA=;
        b=HL2F1JyZexEwJ7zTnBbzFxuOfZSczbPpOb3SzeGbgE4Ji65PrjDcEz4hfV95U3ab/v
         ZAZG/tDeZWyKSs6s/yMNELUpOzoX/K7WTAsjF/zZX7acxJA6hZFiLtPNtWlXliH798c1
         0D7a4MUflAKYK8QSL3fup+v7x9F7mGyo0tzUgbllFEqKzZPL5BuQOvVnby+wBhf/ZiQc
         PFtebmxeybZRY7BFnwkQBtPpsHcpCqoz/6Lf3tOj2G4qAHMJFNpHNxW8NQsz3EHkS5yX
         qhI6h1zaZ+yixISw9eDjTLl2KHoTv6ZFwhWBv5pMBdxYsfJRKKbf7diRXYSTyLfOU8VX
         tpaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775172209; x=1775777009; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjOPgwHvpL8SXcAqUI6l7te3rZPTzhYxLIlKMmHX23s=;
        b=HwATihRIsExeypronIvjEgXxBnS/KU/vi6r+Ygesf/7hjgIIVkls3GVd/Cgn/E++Z6
         ZILX6B/GjFB9VYTXhNYDaMKGz9rhnX6KRehXQt8z0/R67PFfd4MT+6Yv6tJV7i9IcWTK
         HzCoG0CZIf/gAv81mrdiRLizTYzvO+r9+g3pCnyRPEBE9zoyQ6ddk+MIpCDtQDCN+zVr
         WQimoM9oMxBW6vOUky3fOJbu7MlX+s+fRBC6J4gfFda1r2V0XCBrPmnOqHKpeIj0y/Gm
         j8pE2elWDyCAv4brV0qmztJQeQMM4NqsBIh9PIy6GWcV0AH8T/ehAPI0g6jfzBFnfi99
         673A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775172209; x=1775777009;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjOPgwHvpL8SXcAqUI6l7te3rZPTzhYxLIlKMmHX23s=;
        b=mLWzTCfWg2ozMcBurqJl5LfmCIrD7xD7Q6mZI5nbus114DcUFVR2FoUYDY92pqQDLJ
         YEYRVLDZ09j5x7VOQ2/g8Z+Hg1mjU2A+/Qmh5qk7YB2y1azNSYIFesz2J1nnaxud412d
         HP9yqj0mpippcSjjvf0dm0PQOj4zVTL5iP74bMJxXRCQb/LL/YvWIFGGCMk1D8RstX56
         3Hz/rw0/hM+qAfZOYZBSJAfw2qtd75yCaD0tvTU/YlWLnemmVVavruArAzuSEVtZPoJd
         Kromk0AaKrgjuVY8dqYR9ClGxHxmr55r3cuRUIVG2WURbnmC/Ie9axJiP62z8MG40qP2
         uMyg==
X-Forwarded-Encrypted: i=1; AJvYcCWit6Iyq7re6kV3lpcEHb/Hhp9l3XfPjj/jw5C2Rc4Z6gCNGuk6Eb0yJm4JW+mJGFkh7bp7Q9Hk9+6O@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2MHbmkoTqNAdXHy2KUQhb4ipFBj6vt4BZXlbmVHkXj4cWWtRx
	sAUWsuYqH/swSiyQIuguKES9NWbXHlcJOZRerzQKBMZ6Sx72M4209fMC01XW+4CntcBHfhVqGsQ
	AY6MGFocfhZbQ+nqB7nrXt0lYLgxp2t9h0tYdvS+L
X-Gm-Gg: AeBDiet2a4oBuKNL4+Ijb3hPS8z46EQZ7GHk4oE1nMObEj9XtfC/a8h4b4cDEyWIghi
	Meq7FEd5s7DafaUmRl2/7EsqxtSXwoJap6UMx9/rbS8znQn7xsRlDqi1I1XFICmbPdnVhPP/bDR
	NbeskpkmCDJlx8rnelOhVY/yIk3H8gByrvSKDbuit+lDFeG8sEV/Am4Osmz9PmxaWQjDXng21S4
	0EWOOZJJBNVP4DH3e0p2M6vVeiSlPwFjwQ5pZ0sNyApWEJFyP3q1JRprX+vPKZ0oO582755yXDC
	zRa2dZP0dc/xO3pMAeJwkoz8kyn7YMzA6Pom4PMND6fV4oT84dj0TOFrNKQdtIwdFjw3jw==
X-Received: by 2002:a05:6102:c47:b0:5ff:da11:fbb4 with SMTP id
 ada2fe7eead31-605a4cd8d9amr397405137.1.1775172209191; Thu, 02 Apr 2026
 16:23:29 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 16:23:28 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 16:23:28 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260319005703.8983-1-yan.y.zhao@intel.com>
References: <20260319005605.8965-1-yan.y.zhao@intel.com> <20260319005703.8983-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 2 Apr 2026 16:23:28 -0700
X-Gm-Features: AQROBzBntx9xdv1WNhuZ4VA9cGFnH-Mo9Y24zQ9Jpt4-WeTGuacelxcK9gYE_Jc
Message-ID: <CAEvNRgGknoP=QscA-efLB0LSS03XttsdN3v0KBVROAXTknAakw@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/virt/tdx: Use PFN directly for mapping guest
 private memory
To: Yan Zhao <yan.y.zhao@intel.com>, seanjc@google.com, pbonzini@redhat.com, 
	dave.hansen@linux.intel.com
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, kas@kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, kai.huang@intel.com, rick.p.edgecombe@intel.com, 
	yilun.xu@linux.intel.com, vannapurve@google.com, sagis@google.com, 
	binbin.wu@linux.intel.com, xiaoyao.li@intel.com, isaku.yamahata@intel.com
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

>
> [...snip...]
>
> -u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, struct page *page, struct page *source, u64 *ext_err1, u64 *ext_err2)
> +u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, kvm_pfn_t pfn, struct page *source,
> +		     u64 *ext_err1, u64 *ext_err2)
>  {
>  	struct tdx_module_args args = {
>  		.rcx = gpa,
>  		.rdx = tdx_tdr_pa(td),
> -		.r8 = page_to_phys(page),
> +		.r8 = PFN_PHYS(pfn),
>  		.r9 = page_to_phys(source),

Perhaps in some future patch, are we considering also passing pfn
instead of struct page for source? Would we also update
kvm_tdx->page_add_src to be a kvm_pfn_t?

>  	};
>  	u64 ret;
>
> -	tdx_clflush_page(page);
> +	tdx_clflush_pfn(pfn);
>  	ret = seamcall_ret(TDH_MEM_PAGE_ADD, &args);
>
>  	*ext_err1 = args.rcx;
>
> [...snip...]
>
