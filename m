Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325F4263F5F
	for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 23:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754005996; cv=none; b=UWSSXwNtbczRfTidvnXhfPqo0NXzA5me9wR7y/rg7GGqEYiXI1pISuOiisfS4jEA7pWxSB+1Qr//6dZzQQO9rLyYWthBD10jZZsfjIdcqAFeiGMPFDv7X6jKl8eCWAE+s5HY9nyB6Cf6KjGg6Za5JJ1zCjr+xNgoUhVmHW2JSmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754005996; c=relaxed/simple;
	bh=gAbRw7uH3XXn+Sglf+E7heaWdxMLlW+TtO+KicM6Atw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KXBdK4A7azoKqQWYzspgeDCXam5tP2nIeakHDVpwm2Oin8BBJV3xFAohVhVnM4xwMTtobUM9BA6UrYsvEO0cfIKXtfcRkjLHASbIFPJf6zbp2xA9Am2Td0yjsYfY1WrkjKW/QwUkesakBDJhd2rWpFLV2EDXbkmKw7+M81CC330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=layIgycJ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="layIgycJ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31edd69d754so279347a91.1
        for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 16:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754005994; x=1754610794; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdNmMaDXwOSAnSNITEaVtFj8sCKjwB2O/VXZWVuTvEM=;
        b=layIgycJtI+u/+eJXnevlSulzdcAAK3YP3GM1vnG1W8ph4iZUMbSGLpmrt9Xk9uL0+
         4cH2ZF+nFBUrRWYbrKa++KxFABtqUhSSk+4innatxNdb37C4VGINcDk2Pe9AjiMcb9Kb
         smNET9ocu4quuMVJVOwsmtJnKgMw+p/yjPbPx7LSi487Q4gy9cBvaETDe+85iSAqh0Cj
         Qxnl1h/FsM5zmMTe3QMyvFTIdS7/cb9DBpHwbFKonG0JyR8oTd8GvyLqxAlAVVVkz9RX
         9sl6n22N/ajBjgh3/JwvntbeiVm/Wz9p/2mVWOWppAFJGcxA+lBcsinJwKfFSo5TGRqI
         CMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754005994; x=1754610794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdNmMaDXwOSAnSNITEaVtFj8sCKjwB2O/VXZWVuTvEM=;
        b=NYB1Z1exnr2lpwFSm50blIRqQU0X44Y3hGJgt/pG40tMFIA/pthVAUHaxBv3HQbcjE
         hyBwOhhXR6eAhoFyM/xyiVds6RZb/hF20fDupsfJkKGrirkUW8X4xuBcYkxkkr9ouqVX
         gBc5nSy17O2in7JYrveE0COmPKGurTnV1yKu/w1BC8sT2SPyYKnGypp2kChSRo81rZUt
         46UJ1OVGSN/pqT6ycekSC4B0AMT98slY4XL01YcI2bpYYbCdP4uoqUx5Zgp1LBIlCl/1
         2OrgwhXTzccSdnDuLDOTLlfRWAQsxfiUAmW4t9obDgq7eVHs9aspMv56mYiPCRXvj2pv
         UYrw==
X-Forwarded-Encrypted: i=1; AJvYcCXaZhbgRgyvplWgjEki127ooRKkrWCbxqqwwmY6WCRDHOFp4WWgbWT75I0/mNsmRoX+8z1h9Mp0B5y7@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/8Mm+Saw+9MsucKS4u9TKd8IPMDVytbMfUgrfx3vBPmijmu9B
	LunqQwZs65v/obZR/mOUbrzu8FHl51ZdDuVzxranYLTYPbnmf5Jcy6xAFkM/Dpn3mzR0eRgxCCD
	JcrdhCg==
X-Google-Smtp-Source: AGHT+IF/xJsJThBWRLK7V7PkLQxZ0BHJZfUUHaMinJ5hy7aj9uko69XjGVMYarBMMDIdNyJOz47ad9dgynE=
X-Received: from pjboh6.prod.google.com ([2002:a17:90b:3a46:b0:2ff:6132:8710])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55c8:b0:311:f05b:869b
 with SMTP id 98e67ed59e1d1-31f5de58622mr12279406a91.30.1754005994626; Thu, 31
 Jul 2025 16:53:14 -0700 (PDT)
Date: Thu, 31 Jul 2025 16:53:13 -0700
In-Reply-To: <3f39e6f85341e141f61527b3192cefde0097edb8.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <5cfb2e09-7ecb-4144-9122-c11152b18b5e@intel.com>
 <d897ab70d48be4508a8a9086de1ff3953041e063.camel@intel.com>
 <aFxpuRLYA2L6Qfsi@google.com> <vgk3ql5kcpmpsoxfw25hjcw4knyugszdaeqnzur6xl4qll73xy@xi7ttxlxot2r>
 <3e55fd58-1d1c-437a-9e0a-72ac92facbb5@intel.com> <aF1sjdV2UDEbAK2h@google.com>
 <1fbdfffa-ac43-419c-8d96-c5bb1bdac73f@intel.com> <70484aa1b553ca250d893f80b2687b5d915e5309.camel@intel.com>
 <aIv8wZzs1oXDCXSU@google.com> <3f39e6f85341e141f61527b3192cefde0097edb8.camel@intel.com>
Message-ID: <aIwB6X6cw9kwgJzs@google.com>
Subject: Re: [PATCHv2 01/12] x86/tdx: Consolidate TDX error handling
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Chao Gao <chao.gao@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, Kai Huang <kai.huang@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 31, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-07-31 at 16:31 -0700, Sean Christopherson wrote:
> > On Wed, Jul 30, 2025, Rick P Edgecombe wrote:
> > > So STATUS_OPERAND_BUSY() seems like an ok thing to try next for v3 of this
> > > series at least. Unless anyone has any strong objections ahead of time.
> > 
> > Can you make it IS_TDX_STATUS_OPERAND_BUSY() so that it's obviously a check and
> > not a statement/value, and to scope it to TDX?
> 
> It's a mouthful, but I can live with it. Yea, it def should have TDX in the name.

IS_TDX_STATUS_OP_BUSY?
