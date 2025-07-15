Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB324204863
	for <linux-coco@lists.linux.dev>; Tue, 15 Jul 2025 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592242; cv=none; b=g8BYV5CNfnuoVOTnGZVjdSEEp1SI5EjN/5d5q+1tnMpDC2pGUqKTLzIhjVwlE8USyhd9XpJ5fKYlofLlp1H03/VOCG1pSj7KNlPvnMSGe48k/iv7rI5e7bA875kn3shKpdVfrpELHlBKgGSOhj4Xh0ItYioIAHEvme36SR4y08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592242; c=relaxed/simple;
	bh=4VggX2D7gPOxcgo1aao/mMvKRzUYIRe+bl1k2gkC6I4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IyOMja/cu1WfhPywpVcspnq+t6jgPloFgVA5DNEWY44PxYP4Thy+vma6cN2wG/k470cBB83VHEUx8RtvkQdxSG6Gi4WlUito/iCNvZanZYHllF192pL5WeSoIe4J/fhlAJAr1/Kh68WiuzoNzjDwf1bb/75gmPH1fL42ILVDbGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dbgHAVo2; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dbgHAVo2"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7489ac848f3so8368422b3a.1
        for <linux-coco@lists.linux.dev>; Tue, 15 Jul 2025 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752592240; x=1753197040; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ryg0XVXx/d3QRix1Y2kL+AIJsLkxuJ3xCLHGA+yS2Dg=;
        b=dbgHAVo2pWgAqY8e2u4a19lt/+5aWvWw8Mi6wrUvrWjYpy0xaVQeRnZwsNuZly0+0I
         jXPr6QvQxK3XqYui/8pjrrM84OQF7D4FMbQ5SDv1Y/EXHt9CaLgQk0fGb6932AV751iF
         x2IGazGazcBTDg/JBzGUDt7QdDIa3sn/mjXycdGIwh0jr+MXPISI5VYLMU0cILiB6XbA
         bIEPPj+M69avT6o54fFOZLAY1cl1+l6JlQZlT8N0aBmC0eCRWsjkJhFNAboyfuR730q4
         IEz696akqSrdkBlsCYWEqJDjHovzwYcZcujtV8m7s0/eRnMkf5X4cUAEuRunW4L1u0O7
         92bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592240; x=1753197040;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ryg0XVXx/d3QRix1Y2kL+AIJsLkxuJ3xCLHGA+yS2Dg=;
        b=hY+IRLVqlViHyb2Pqgc8iuGWkwINQb0WZ86O33p8o8OiesI4aF1y85uP+FF9Ra2JdA
         1LE8K6YJ8XANAoLyB3AhnPf0Ep0CRatOqS/LcwcHBdn6ZfsfVWz0fSPi4YTxAVpo4q7o
         /fYS8tDoZ/xZPwJj1uZaUV9Xcc6M6eJ0TOKEDTw1RsRwpphdbM8IHXMkYws2UvTGODTZ
         H+9rj7TOVTG7Zswtws100rcUZpE7LvYnOkdd7BVsrAX2AKp9vUl7t/d+mxBiTqoCfLLi
         JcXK9Am062HLMl6jbnIAQMrIHgdbY3uKHvZ1u93vaOz1KFlc1twy3wpF1ckITn4BaJ/4
         ydjA==
X-Forwarded-Encrypted: i=1; AJvYcCXHMOxQczQiVXPNghYIKHd9JDI5+rCJ82Kl73x04uLpPyO1dnv0dD7Mjwzw242lvHoD4yz4TXPDXKQq@lists.linux.dev
X-Gm-Message-State: AOJu0YyFwComtLtrBIjUGyWccEhmFW5lrxLutdlAxH5dSVMO2vCI7lvJ
	hxy/dWXPvDHO79HdpKVsZbchw2YloERBont0pNu2YtiSGIon8hoHHzVDur9kHqgrp0n1gHhf0vA
	i0lQfhw==
X-Google-Smtp-Source: AGHT+IE8AvoOdg4HoJ39XtR7Ju366xu15Xs/lxrGtWzcB0GyotBFu+SxAx156O4/XuUxhfBVnfRu+AiVvCM=
X-Received: from pfez19.prod.google.com ([2002:aa7:8893:0:b0:746:1fcb:a9cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:813:b0:736:35d4:f03f
 with SMTP id d2e1a72fcca58-74ee09a9561mr24411992b3a.6.1752592239880; Tue, 15
 Jul 2025 08:10:39 -0700 (PDT)
Date: Tue, 15 Jul 2025 08:10:38 -0700
In-Reply-To: <20250715091312.563773-1-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250715091312.563773-1-xiaoyao.li@intel.com>
Message-ID: <aHZvbok0tr7U4wf1@google.com>
Subject: Re: [PATCH v3 0/4] TDX: Clean up the definitions of TDX TD ATTRIBUTES
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	binbin.wu@linux.intel.com, yan.y.zhao@intel.com, reinette.chatre@intel.com, 
	adrian.hunter@intel.com, tony.lindgren@intel.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 15, 2025, Xiaoyao Li wrote:
> Xiaoyao Li (4):
>   x86/tdx: Fix the typo in TDX_ATTR_MIGRTABLE
>   KVM: TDX: Remove redundant definitions of TDX_TD_ATTR_*
>   x86/tdx: Rename TDX_ATTR_* to TDX_TD_ATTR_*
>   KVM: TDX: Rename KVM_SUPPORTED_TD_ATTRS to KVM_SUPPORTED_TDX_TD_ATTRS
> 
>  arch/x86/coco/tdx/debug.c         | 26 ++++++++--------
>  arch/x86/coco/tdx/tdx.c           |  8 ++---
>  arch/x86/include/asm/shared/tdx.h | 50 +++++++++++++++----------------
>  arch/x86/kvm/vmx/tdx.c            |  4 +--
>  arch/x86/kvm/vmx/tdx_arch.h       |  6 ----
>  5 files changed, 44 insertions(+), 50 deletions(-)

Acked-by: Sean Christopherson <seanjc@google.com>
