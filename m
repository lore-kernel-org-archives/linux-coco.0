Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C5C264616
	for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 23:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740093446; cv=none; b=RKSQC/vOhIcGXTWkyQeoJCBPUyi8smLLdPi+25XmK1oWgCln30dzwj48c/MZBovxfLrSsHXRYVPiN3XmgnQ8U/NJa7GORf3YtBX+F2SSPKDjXoPXDrBehISVuyIZbv17JOBTZrWqOaNm4h8Ka4ar0q4wmfRf/oBzRgEwOFltidM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740093446; c=relaxed/simple;
	bh=1cIjuvp4munwp36O0Su27G+k3yaY66vxM/AalS2J9ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2bf7scXE/4FC7A5viTg1l3S12OQi2IjSkD08WNtbuNRupMLsOhM43No/M8SHIAPpSR3L/lyU6ST7N9jmHFsYZsb1LMR3yjIl/PY1FiI5JDJ9G0ydXV5ZOrVlQc2LYGbykJuerIL/zXQia6fEXd5SSvKh8mBgwBffIjPRxlqMz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KNV5v92b; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KNV5v92b"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54522e82e7dso2942e87.0
        for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 15:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740093442; x=1740698242; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRORyKgcdd4uVm+XGlcno7rV+y967/k6WA8VcDaJDCw=;
        b=KNV5v92bUGO82CB6XfHMGJs9DqAMh7c4qf8UNKwNSs6eOhuTBQ16n2oktA3f5jUJVI
         nsKQoa3GeduA65YcHhmcgbRVtr/AsLUSvtZ15mCh00efqPqUCUfCl8q4gei0jV7VlppG
         O/cfA1wFYcJrpKsgLKnJ0R4E9wBFS/Rb3//55kZ1WB9Zt7qePueDGiOWEBzKyCrO7eMO
         dG28eJjyj24+DmeYrSRocIPghDH6IDDZF338JiGepICYOdFpF48dVFikMYN9koG6/oyu
         xt+b9qGlV9QUeDTOTwyZOfjUrB7k2sE5BOLBX0X6+4tMWDYG7X7GF1EL0xgSsA/SU7qV
         YtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740093442; x=1740698242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRORyKgcdd4uVm+XGlcno7rV+y967/k6WA8VcDaJDCw=;
        b=QeHp4s9ObVJnJXql49JOIglpxbKlhrwI3ddDFkMuNfYOjowWdNnCAZOFJNeZ+kLH6g
         Afv08I6MODR0ZK/utqXw6gD+/SKIpcs9xxnq/axiHN2Rvo4x0BCrXmiHi03LF+bVrBF/
         L7qIPcS4ZVCu8qU+9uzy8PfxInaHpwE2rIqKYfVlbSCooFMw6rich66tDqGkXZk77s7L
         nwioaPyrBX96KsxY5VKpRvfe3Ot/uRgB6LwOhmd3SH9+F1IBPjRyRtmqnccX793R38IF
         zFQPAmC5JxCoOs17uHAXdVECTyfTlqpcIxbNWkO1neW9SZcWSiycOctxD0upjjlXB+Fb
         BKtw==
X-Forwarded-Encrypted: i=1; AJvYcCVRQl94ovT/2T/IZsj/CFKkVbnva2SroS7/O3rqa3oixCHRN6ukcjFy7apt+oVekGbKvJOOFigAK26V@lists.linux.dev
X-Gm-Message-State: AOJu0YwzgpF4cyj3jbePJoRBt2XscCFq2iacbHgTap7Jq8KmpA+LxRVK
	lLGrGntrdUJWMN9D/ONkPyHBQUoC9aAoM5r1dgD3ltTN19dX2MZfjRkbiYTEevfwZhGXiuVt+Z+
	VeuEoukqk54Gwv3RrhY18MuEX9/ddr2iSCfzB
X-Gm-Gg: ASbGnctfufWpRPsnrnDOmURSx8Le5ePU5hqodvimWXYcWsKlLtD/+RwREfW+x9ppvZz
	JbKk6/QNRyHCHTm1OvIRRm/GDXu1wDzVIyVBUA1a3s6ZrbGIFqkxN+COd443lxU/6MpVQtTihgk
	UyIAo5c9ZNMsmA54Az3z+ANMkUambW
X-Google-Smtp-Source: AGHT+IEWQiBc288yYrLCTppIrbxa3qN0HBmgiL7WK6l/eN2zlTxhCP/B74cPGse/0Iz95hyG2RtMrjG+GdCe2cYgGKw=
X-Received: by 2002:a05:6512:124f:b0:545:2301:b1c6 with SMTP id
 2adb3069b0e04-54839f9c24dmr36007e87.7.1740093442260; Thu, 20 Feb 2025
 15:17:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250220211628.1832258-1-vannapurve@google.com>
 <20250220211628.1832258-2-vannapurve@google.com> <9120e074-52af-4ae5-a08c-e62a879c7ebb@intel.com>
In-Reply-To: <9120e074-52af-4ae5-a08c-e62a879c7ebb@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 20 Feb 2025 15:17:10 -0800
X-Gm-Features: AWEUYZlcMEtt0DdUpswWfn-2RnJ9b7h7OlP4aU2QsZo74T1M7MMOMNFwfs29_Zg
Message-ID: <CAGtprH-utPk=u938odDYAWAFLSZj+OhVH_k_RCHc87k3eqm0jQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/4] x86/paravirt: Move halt paravirt calls under CONFIG_PARAVIRT
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, pbonzini@redhat.com, seanjc@google.com, 
	erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, kirill@shutemov.name, 
	dave.hansen@linux.intel.com, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	jgross@suse.com, ajay.kaher@broadcom.com, alexey.amakhalov@broadcom.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, stable@vger.kernel.org, 
	Andi Kleen <ak@linux.intel.com>, Tony Luck <tony.luck@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 1:47=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 2/20/25 13:16, Vishal Annapurve wrote:
> > Since enabling CONFIG_PARAVIRT_XXL is too bloated for TDX guest
> > like platforms, move HLT and SAFE_HLT paravirt calls under
> > CONFIG_PARAVIRT.
>
> I guess it's just one patch, but doesn't this expose CONFIG_PARAVIRT=3Dy
> users to what _was_ specific to CONFIG_PARAVIRT_XXL=3Dy? According to the
> changelog, TDX users shouldn't have to use use PARAVIRT_XXL, so
> PARAVIRT=3Dy and PARAVIRT_XXL=3Dn must be an *IMPORTANT* configuration fo=
r
> TDX users.
>
> Before this patch, those users would have no way to hit the
> unsafe-for-TDX pv_native_safe_halt(). After this patch, they will hit it.

Before this patch, those users had access to arch_safe_halt() ->
native_safe_halt() path. With this patch, such users can execute
arch_safe_halt -> pv_native_safe_halt() -> native_safe_halt(), so this
patch doesn't cause any additional regression.

>
> So, there are two possibilities:
>
>  1. This patch breaks bisection for an important TDX configuration
>  2. This patch's conjecture that PARAVIRT_XXL=3Dn is important for TDX
>     is wrong and it is not necessary in the first place.
>
> What am I missing?
