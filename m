Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927CD466B5D
	for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781634064; cv=none; b=rltW/5Krz68plTwsTR+vQQD81UyVuvfWAjVQm2nwiNbrF8+rQVnFwEEwORY6m31b7WasROagea+A29zn8x1Njo1PYny/kERAg7Rh5mYcG7PQPesHKimX/nNz0R94TfLjHOYfbTPW8nPol0MSdfcsSm9pL+ZOvK3jS+pVD/aP2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781634064; c=relaxed/simple;
	bh=0tSUUNVDEBGwYBjppBS1BH3TrzovrW9yOtoZpZdMF8Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g0qw7nAuXRYe+K4X3B1Rboig4ji0v5KWngooPUe5pUEyZ4pTZfNONmvO7iZsH93dskl1FJHeYixcdCTQXTxvyKNMFAs2yTGcIZEj838REt+chzOPhmsKJ3IJnupEurBahWV6TwHcmaSNNiQi0i9Czlt2ZzauJ9OVG3sYalJaPms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DDChZ+L7; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DDChZ+L7"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8423f24dcedso5932238b3a.1
        for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781634063; x=1782238863; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PDGQwmie0FsFOW5zpiubju2q1B2vV8kB05baSk3HG50=;
        b=DDChZ+L7ZbTF85bQ1hCEMjXc9v9BkCDQU6Ea6T+nK+mXVNY/EtxROj/ItmT6y08s0l
         dmxGCb5varMgePevCMrY9rHDRRRknra1X72prJZXjMZbTAafg9OsS0O+xthpbFP4eeGg
         K10B3Y5tY43nLh0Yf9bJv2e0b4C0Iraf8Q3CQN+BHQyLN6bNqDbHua9rPEFMvWBDCz+9
         nglGMjgaUBIh1QhIwbYGMSVZvA8nySg9ZATY7zvVzgPpzrJ0jsISz0hQkic6M9h2Bvca
         FKr0u8z9xZFVG+iBTwSXMrjUGqe5d6CHU9djdPtRr2sMuz6UIiM5EpZ8dDxUUNAQUvQF
         t5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781634063; x=1782238863;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDGQwmie0FsFOW5zpiubju2q1B2vV8kB05baSk3HG50=;
        b=CbqX1IRNMQ9oa/ypOddq7xR4kJBbhCqA4ktiHqHEgTezW7Qbc7HXvtFdRfMf3NE1KW
         1GcujvEZltiw8z0F56TAI/IHC6EQvC9Lf9T2RgK+xpYUsXnPCa5iwEJAyQPqL/ZaML1k
         K10EWvfLpdXMsXZJ6BgMwuGl8dnOzs9EcHfpaL9ey/7A4c9aix6iNrjbcsbq3cRvMc4z
         fpa3WRJH1quWFAJLaRmu1WoEnfPz5xuJLO0zKE3yhQb1DGZLSO35EKlFgXUJVG4zuank
         I1tpW96Piw9hcKtT5l1m/BGA1HDOGKYPs23I9I0VpIH/d5MXs5g+KIvXwQ1+f22J8Eqr
         v/DQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Yv5rG4FiznI31C8dGTNMJMNO2arjWDtWpcXf2eGf1sBnmBgeMeivohcHOVRheCPz2mLuPMgB76C5j@lists.linux.dev
X-Gm-Message-State: AOJu0YxzDN2rdpgFYGGbCe6ocZVYiJgnnrzkZvsF7AX9DKnu9r2OAvjw
	QRh6L0Iij1AVa1gIf8yX9n/CLeLxMtE3mnNUrLm3pOPYyyvNsIpQZCO+O/iQihI2wEnoGAAMxlV
	oTzQryg==
X-Received: from pfh18.prod.google.com ([2002:a05:6a00:12d2:b0:843:492b:a9f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a211:b0:83e:e897:a394
 with SMTP id d2e1a72fcca58-8452442d041mr320027b3a.7.1781634062694; Tue, 16
 Jun 2026 11:21:02 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:20:53 -0700
In-Reply-To: <20260521-tdx-selftests-v13-v13-20-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com> <20260521-tdx-selftests-v13-v13-20-6983ae4c3a4d@google.com>
Message-ID: <ajGUBQ3y8lvwM6_N@google.com>
Subject: Re: [PATCH  v13 20/22] KVM: selftests: Implement MMIO WRITE for the
 TDX VM
From: Sean Christopherson <seanjc@google.com>
To: Lisa Wang <wyihan@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, May 21, 2026, Lisa Wang wrote:
> diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> new file mode 100644
> index 000000000000..810ca7423c84
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef SELFTESTS_TDX_TDX_H
> +#define SELFTESTS_TDX_TDX_H
> +
> +#include <linux/types.h>
> +
> +enum mmio_size {
> +	MMIO_SIZE_1B = 1,
> +	MMIO_SIZE_2B = 2,
> +	MMIO_SIZE_4B = 4,
> +	MMIO_SIZE_8B = 8

This is absurd.  Either open code the literals or use sizeof() where appropriate.

> +};
> +
> +u64 tdx_mmio_write(u64 address, enum mmio_size size, u64 data_in);
> +
> +#endif // SELFTESTS_TDX_TDX_H
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.c
> new file mode 100644
> index 000000000000..f19be79fe11f
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include "tdx/tdx.h"
> +
> +#define TDG_VP_VMCALL 0
> +#define TDG_VP_VMCALL_VE_REQUEST_MMIO    48
> +#define TDVMCALL_MMIO_WRITE		  1
> +#define TDVMCALL_EXPOSE_REGS_MASK    0xFC00
> +
> +u64 tdx_mmio_write(u64 address, enum mmio_size size, u64 data_in)
> +{
> +	register u64 r10_reg asm("r10") = TDG_VP_VMCALL;
> +	register u64 r11_reg asm("r11") = TDG_VP_VMCALL_VE_REQUEST_MMIO;
> +	register u64 r12_reg asm("r12") = size;
> +	register u64 r13_reg asm("r13") = TDVMCALL_MMIO_WRITE;
> +	register u64 r14_reg asm("r14") = address;
> +	register u64 r15_reg asm("r15") = data_in;
> +	register u64 rax_reg asm("rax") = TDG_VP_VMCALL;
> +	register u64 rcx_reg asm("rcx") = TDVMCALL_EXPOSE_REGS_MASK;

This needs to be proper assembly, i.e. in a .S file.  Using register like this
is *extremely* dangerous, because the compiler is (stupidly) allowed to clobber
registers between their declarations/initialization and their consumption in
the asm() blob.

> +
> +	asm volatile(
> +	 ".byte 0x66,0x0f,0x01,0xcc" /* tdcall */
> +	 : "+r" (r10_reg), "+r" (r11_reg)
> +	 : "r" (r12_reg), "r" (r13_reg), "r" (r14_reg), "r" (r15_reg),
> +	   "r" (rax_reg), "r" (rcx_reg)
> +	 : "cc", "memory"
> +	);
> +
> +	return r10_reg;
> +}
> 
> -- 
> 2.54.0.746.g67dd491aae-goog
> 
