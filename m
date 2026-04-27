Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FEA3E866B
	for <linux-coco@lists.linux.dev>; Mon, 27 Apr 2026 18:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313548; cv=pass; b=Yja58UBbnCd+mMFpgCHxaeyGvCg3OhiV8BjY+V7Z/Ipg4yruRsb/sEDhXfOehlLK+3oQjOrJbjATrnSkQpRxAyW3jENezw6MLEW2+JZCqe0kGHiSVElTVPzgpHhVrKQ37PKBWjH3ReiJVGXH4AnBYyKRsgPIaK+g9coNXvroyK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313548; c=relaxed/simple;
	bh=Bv6BTNFx8eotL6sCX8FOszmjIvqGdco6s4FUj3kQRLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDPtHSx/YnBeuhfvavMjhnX1uiFiVzZKEySSOeuaZwRooIFkF3PW42AN6DpVdRs0ouoYHgctnUARN57mbAFLP4UGrwKPia+RXuUCDCD0GwRwBMxrUmgyB6VMtCWLjNlmdyYpZWKmeir9dc0acNhnhLDG3QUj+6JF9KUPufkw43Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdKaWxa4; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdKaWxa4"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50d864c23bdso81151cf.1
        for <linux-coco@lists.linux.dev>; Mon, 27 Apr 2026 11:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777313545; cv=none;
        d=google.com; s=arc-20240605;
        b=UZoWBRrCqfHfomNeN7Lzo1Dieidbec2SiNfbHztohinuXJnnrinAFZ6nmcz3ydxQYV
         LX77U0FjG88n5gD8tC1K/1jVP8nQFJVp2TUCQMUSZU2syrQir/dB/E/7KutrGc9cJbGD
         qO6lH/TWrttn+76bTScU+ZXH6i8Z1gqp3yJjF7bh6+0NMW8Ad0LgRypOxMlaq6LcWxGw
         h8hDE9l/tKJYGbFp60+jd/rMNeuZyvZJbEZpZO5UviiwL3JDPJsA+/p39q6nbV/zhuBd
         /fAQc25In0zI+Dj0LKVsjH/q7WtPgJ2w/Ql+tzBiquvClxNj1kpJH2ra+ewR0lEuu9Ul
         PE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=462X41kdBtO/lLaDMT5cvpDfu7D1CiZVzDMruqarSW0=;
        fh=YSk0cUpqHqW2v+APEDx+kvdnVJuaAWpKpTnUDkaln50=;
        b=itU3gpXgOr+410IgvNB17J1BpPEx3yNtNH2odHE5Xz6P0r965XOxkv0LSX6ilSO/FV
         3N1ZDAkCBq/4s8UQ3oUDbfIaKsrUFzAr3zVl2ZawBTUuy0JxM46N+FkAo0y6bPZncNFk
         /2646l2sIIeeuOS/w8KpyQtKVw2IVGTov7onAMmOwd5WyJNB5pqqFw2FO4eq5CXiGSo5
         qP2X1FwLIGNtE4NuBzc3HvPm8x/tzP3FtZxeBjW0RdgEsZMZtHEjgGa8OYYHllzKb5XK
         dRbcqLowqC3LlAmEUziNNhxEdytksBT/Ivd2Ics2INpl/EdaZ+ykpKPevxx4tPEtN9BU
         asHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777313545; x=1777918345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=462X41kdBtO/lLaDMT5cvpDfu7D1CiZVzDMruqarSW0=;
        b=jdKaWxa4gJv1ou5r4OljeGrYeXJwHeGR7LVoa2hZZHtDGI2kWJQ/azLMuDLCEi5KUm
         0FNO5qXEbJx4pQPFgjBVvVzbQsR4t7grB1YjFk07xj40oTewv5wtOqMgUEx1N4TxfhxO
         1QVc+6JxIqQU84aQmfMNf/Jfsw8B4U6qcaymOkwbZeOqEqm539E7X9vKv1Yz6iE6e7Bk
         RDrg2VLBlN8Ly+HLzCzf82Fy15l4iXjA6NITxzoYbB/V6RW6Y56X5heCikpmtbSCX9Mi
         peaoMGGRVarTHQQIVaXO604FWW7udmdq//yOtKCDb3ISy+XDxiOLoSNmXlBKe9ultLPn
         Y7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313545; x=1777918345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=462X41kdBtO/lLaDMT5cvpDfu7D1CiZVzDMruqarSW0=;
        b=lLR0EdmwjHh7rrap+IignJ/yz1wOgJBeVoUTJHRB/Jx6iccr0pmVFpBSNUQDcJ28Cz
         tdhFbncZ/Zo8BzkPFkB8Zj6V0BFEA5IJvTLTh9O9ygWGhqllKbMr1ykDmX1hIOyWfUGh
         ZCdQXY+b5k/NRkNLmxDWbptB1VqfZy5mYQQP5w8QpkQkwgiqaCVynJDHTETmF+2pOuKj
         VEfSVvUW/2Pnd5X4rfNJXQtHKrIR3WYhDqMzwLxrq70cJGqtsvkFXsFegxMecRdzo18+
         cX1iAW4bo4pglsX2WCfGq7CHn7R3Y33ZiEbfczTc2xSucU0hj/BbAOtIassA8v3YdxwB
         yHcg==
X-Forwarded-Encrypted: i=1; AFNElJ9Hx1V1TR3AYv1+tqWP7qFF21wBZoVAM1wGVqbEaca8LKQTq7tbGnD5LRNaSFwPOYexnCuws2KTU91W@lists.linux.dev
X-Gm-Message-State: AOJu0YwnsHr9wZ3StSO8Icvt19OyyADIiQk5tBYpFV5g8IuT3maj/TzL
	n8xjM31EDTC+jGwkL8IjA59yio+IJ3zACODc0cJs/X0SvLp6QWVEFzB3Lcl7DP5BKV4Z8fDRFwB
	E3RRJQeSSO5unTpEbWbJigW51jglhJx0M8pNSgtet
X-Gm-Gg: AeBDietct6uLgzbPuBIRGBrLFtjnStZyAz7Vxq0TD6ZwvkkD3b+H9gNzExHyF7mycuo
	8IEzkHLWMsMukB1t4eJZEiGOYVGzmc4gB+5ijLRNQkGjU9KqPT0nLeeahzlfqdFXm5yn1M8HTk7
	LHcbsOR/nuAUL7C0O5VvIrpxLHMbSKpRg4VpDMXh1ESK15O0Cd0zf8EoNJobeApYn0z20IiTrQZ
	1kxPT0spCxLAZwPYGJVFJepmuELXGAonWHSF3XloOnw/ksV4gnJ/NTNMdZo9tUpmNdz9xgylXZD
	nMgWFs5wrkPLKvM27JCEYggLjG6+xree9nd2IJ2f96QMnAHjfhZKB4LRfiejY9EvTb4HyI+A
X-Received: by 2002:a05:622a:5e17:b0:50f:bea3:9475 with SMTP id
 d75a77b69052e-5100cbe3608mr1392371cf.14.1777313544554; Mon, 27 Apr 2026
 11:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427152854.101171-1-chao.gao@intel.com> <20260427152854.101171-2-chao.gao@intel.com>
In-Reply-To: <20260427152854.101171-2-chao.gao@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 27 Apr 2026 11:12:12 -0700
X-Gm-Features: AVHnY4L5q1UHrVRtKqKnRAb0L10M9ZeW4_EVR8OMjdp9PtmE7Gxn7pe3CDO74Ws
Message-ID: <CAGtprH8mcz4HTBQvnSfWuZ_yErDUKq9PX3Mr55KAfw2VK_o9Mg@mail.gmail.com>
Subject: Re: [PATCH v8 01/21] x86/virt/tdx: Move low level SEAMCALL helpers
 out of <asm/tdx.h>
To: Chao Gao <chao.gao@intel.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, binbin.wu@linux.intel.com, 
	dave.hansen@linux.intel.com, djbw@kernel.org, ira.weiny@intel.com, 
	kai.huang@intel.com, kas@kernel.org, nik.borisov@suse.com, paulmck@kernel.org, 
	pbonzini@redhat.com, reinette.chatre@intel.com, rick.p.edgecombe@intel.com, 
	sagis@google.com, seanjc@google.com, tony.lindgren@linux.intel.com, 
	vishal.l.verma@intel.com, yilun.xu@linux.intel.com, xiaoyao.li@intel.com, 
	yan.y.zhao@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 8:30=E2=80=AFAM Chao Gao <chao.gao@intel.com> wrote=
:
>
> From: Kai Huang <kai.huang@intel.com>
>
> TDX host core code implements three seamcall*() helpers to make SEAMCALLs
> to the TDX module.  Currently, they are implemented in <asm/tdx.h> and
> are exposed to other kernel code which includes <asm/tdx.h>.
>
> However, other than the TDX host core, seamcall*() are not expected to
> be used by other kernel code directly.  For instance, for all SEAMCALLs
> that are used by KVM, the TDX host core exports a wrapper function for
> each of them.
>
> Move seamcall*() and related code out of <asm/tdx.h> and make them only
> visible to TDX host core.
>
> Since TDX host core tdx.c is already very heavy, don't put low level
> seamcall*() code there but to a new dedicated "seamcall_internal.h".  Als=
o,
> currently tdx.c has seamcall_prerr*() helpers which additionally print
> error message when calling seamcall*() fails.  Move them to
> "seamcall_internal.h" as well. In such way all low level SEAMCALL helpers
> are in a dedicated place, which is much more readable.
>
> Copy the copyright notice from the original files and consolidate the
> date ranges to:
>
>         Copyright (C) 2021-2023 Intel Corporation
>
> Signed-off-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
