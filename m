Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF78288CBC
	for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 23:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754004676; cv=none; b=QJx0gpHIkvYPfjO+uY+JTfzXb2BuV3LfYICK0uiax+uQtPPpeTR/zNE4XMokgl+oXoWrFl7WQwQmzWC0r+4kkPYRbxpHcSI+nFYrhyhQZGAjYL4POP1pnowze4MF/I1LFgSAc/vbBcn7nA8DDzdV72D61dsi3HE5YYsnw6vwa5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754004676; c=relaxed/simple;
	bh=2NaScNcdaGcrj1b9CsW2e7a605w4dLrZuMpOBsYF0u8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ssJHFhYESiwl3geQM3vUcn8KTxgkrMVOin5AFt1CywfO+kuICjcDEkKBoxYVNTyEsX4yqH2VKsIi0UFJbk7dXhNW5nMKVc8wEaMhCrY6VAHgdw+3HZkK/+v6f+H/hQTKVRcmsIKBOe57KlDBDRWJ8HkjrljKx4TaUxOyAH7Y/6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0n0J4ya1; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0n0J4ya1"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23ff7d61fb7so21111335ad.1
        for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 16:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754004675; x=1754609475; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NaScNcdaGcrj1b9CsW2e7a605w4dLrZuMpOBsYF0u8=;
        b=0n0J4ya1SCf6yJ4uh6LJiUh6l3CHCLucsv7xvV0cCW4SMbgNzbOr1AKTNFlNzSspfD
         nfR1YyPSIpCTbQTJPB+TgCpOdlEa/V4wv7esKZp+8J0MucU6l49piTzNl4XNcg7lx3V+
         Ttf+woAK0cs+Oys7D0gSdBYX5zVi1j6jwgJPmjtZ4IezJ2065GmSZ9jeVtLOWcK05/GU
         KlJbCXRS+w8sRUxg5qFRS0/6Z3zklGhe+vMrh0nVb15+u2R+vhAM5NNxbvfRSWAvELXz
         dKeN4B1wIei1+zBPOUf//74ta6EQtgtH63Fz/OKhPjVYm8a6avI6lA4kRjFpd4zWiF27
         WyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754004675; x=1754609475;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NaScNcdaGcrj1b9CsW2e7a605w4dLrZuMpOBsYF0u8=;
        b=hfwySuY2bDHftwqYRRGBthWrH2Dr9PkhQdCgP18WJW0Z4bTqlzprJo0SDx6aWNPcJj
         RTcmc3Q19UPlmU5xi/vNYmW+2M63AOR/t5289E06cxknI8isqaRP0rIpWuAf8mBtSkrM
         Ac2SabzZioA7OzMvTW2h+QQ6L8JZd88DQwFxW2j7BTk8J6Fh8ZtqB77cFUmb6ynQC0Ec
         +gpj5flebajR2qgFadgY1/cU7Z2KE0fjwg84vuIl5zt7rPiUPl5Qkhi3hCoOD4rN9vyQ
         FK8ycfzZ6eyINYn+ZBsT6XTZlB0vmiL2FfsKyz+kVHZ0zXRMlGweQKGY9+qqSVCVuOI2
         ruQA==
X-Forwarded-Encrypted: i=1; AJvYcCVj9EOph+yg0gB5pNl/9e0PgWObESuLXoj9CRiaU2ZcECG6+uqGoYT/PW6954W4Cj4fy6eZvCuG99YN@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv1YZcRtlmiFF+JqY/ilnDZN4yOMlILMIsVDIJGh8byeLEkDvP
	TuiXaQm+YLcw0x1yZdYhgkxhpwSOExlqgE8KCukCMTM7OwK64omq4Qx2dM4nh+oTZv+nLOTT27A
	JWMS0ew==
X-Google-Smtp-Source: AGHT+IGryvmAT3lqluwhQwi1mQ7FX1BibAY6piThiCuH2qx4zB0PIPWm+u9AgX1LOvUYyklReyoB9RUyx2Y=
X-Received: from pji15.prod.google.com ([2002:a17:90b:3fcf:b0:311:ef56:7694])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1cb:b0:23f:fa47:f933
 with SMTP id d9443c01a7336-24200a5a8aamr57745545ad.8.1754004674734; Thu, 31
 Jul 2025 16:31:14 -0700 (PDT)
Date: Thu, 31 Jul 2025 16:31:13 -0700
In-Reply-To: <70484aa1b553ca250d893f80b2687b5d915e5309.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <20250609191340.2051741-2-kirill.shutemov@linux.intel.com>
 <5cfb2e09-7ecb-4144-9122-c11152b18b5e@intel.com> <d897ab70d48be4508a8a9086de1ff3953041e063.camel@intel.com>
 <aFxpuRLYA2L6Qfsi@google.com> <vgk3ql5kcpmpsoxfw25hjcw4knyugszdaeqnzur6xl4qll73xy@xi7ttxlxot2r>
 <3e55fd58-1d1c-437a-9e0a-72ac92facbb5@intel.com> <aF1sjdV2UDEbAK2h@google.com>
 <1fbdfffa-ac43-419c-8d96-c5bb1bdac73f@intel.com> <70484aa1b553ca250d893f80b2687b5d915e5309.camel@intel.com>
Message-ID: <aIv8wZzs1oXDCXSU@google.com>
Subject: Re: [PATCHv2 01/12] x86/tdx: Consolidate TDX error handling
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Chao Gao <chao.gao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	Kai Huang <kai.huang@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 30, 2025, Rick P Edgecombe wrote:
> So STATUS_OPERAND_BUSY() seems like an ok thing to try next for v3 of this
> series at least. Unless anyone has any strong objections ahead of time.

Can you make it IS_TDX_STATUS_OPERAND_BUSY() so that it's obviously a check and
not a statement/value, and to scope it to TDX?
