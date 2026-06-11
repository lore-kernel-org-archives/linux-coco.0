Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF34D2ECB
	for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203645; cv=pass; b=p1wZXrDFlNZh/Jz5w7r9eAFeiIkkJWOEEOY2fHD749yTdY9S3Z0gqu7UDTfEkK5dj6YKK5kTYPsBPVCqMWi7v46Lwn0EyI19nu9+RSOruzIoMDQ4MhEwMM5DxEkZGFgrf5dopjYwkA/LO6Uj2V6Q84xtABFxYv0f32QfV5PHrPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203645; c=relaxed/simple;
	bh=MrFHJAtiz3l/SoMxwQsRd+iR3vzlfSRyOn6rVwZE7gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFG3YQe8b+uZXU6fggMKALy5Dn2ZPRxpGyMsW3ZkmilV42tcq8OiPvhJ21FF/IXJe5rRFi308dmgXZn9vAV7F04mzZyBwnOp5jpTm1rg8lL3FGBT6ApslG1vMue8KchmOy3PPXP0luEKji/rE45S0O4PkZVL31jgigN3NcTVdIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OOMc3jkM; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OOMc3jkM"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51765531803so106051cf.0
        for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 11:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781203642; cv=none;
        d=google.com; s=arc-20240605;
        b=cJQ0Xy5UIiXoWVA+/shoqgFayWv761esbNOGV72wFZa4f2DRGAjbz3s5EQw3R339HR
         YI2VU7j4xwSkK39AxjN63gwnuX9NmQs/apM+dEA9YJZb2BRoMXngrQBptgbVPa9AuGOg
         RVcfNtCYJUBo6Jzn08cpdwEZ9M8SZKwHcC6erh5VaISuFUaQCzsZ83seOtdOaACMPIHG
         7n/YMQefyTMfUxLPqhXLm2qOTmaGJEHZfxOljzgqnP01cPbAnFv4q4jsxVH/pjCYIF5W
         Na1iqiByXahgu6e6PJ1V6Wy6cOvyJViD20yBP9Fz+qjXbFEIzvDmjeGKAdW7ITZz5gUi
         lw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MrFHJAtiz3l/SoMxwQsRd+iR3vzlfSRyOn6rVwZE7gw=;
        fh=dT+drFvSRwfhBi+I6qA00zwyhd0QrZjeTfDg6UuMwq8=;
        b=KcHssHscAwrjS6EOp5q+T+tsb5AgSDuILokVHr8PGZrecCVX5JNNxTYg1LhhPMKaCv
         sq/jgk+XfLrZHMsCYFltOTD4I493miAvg0ZqFsVi5P1PdlDxn+PW7VBGW5IV3MaYxVhL
         MbBh2+MxhROWtUspTSUp9XttxB9l/oI2k0TKWJoFq3xipl/PuBG0bUw1ODL9rcTeb6Xx
         iOrO9ZgwJMQU0VBWFqDkOxyQk7YD8/0N/sUkBWO/UD/PBAg6R0yhjPNwVmHH0UgQsgux
         VPLyc0g1oPuSHR3H4qAAwRQ62pI4c7vSmN3ZTUaCQweUA32VerCgYJTmhWgD0V6zH7iK
         VCqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781203642; x=1781808442; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrFHJAtiz3l/SoMxwQsRd+iR3vzlfSRyOn6rVwZE7gw=;
        b=OOMc3jkMBnS0PiIlkjvc4CZzDDEtBquJaRhU+e5TlOZJp1OjV1QmpSS4uIr+1ivAms
         e81c6b8fYRAx/3cSPxEEsABRuulfF2ETbF3BeeqpawpcTKujeaBLkQMrX6zB8+njdDAX
         UJcXyfAi2eCbdCQtbQPpS/kO90g+UyMSQKpJyacJCQ82q3iFNRB7IiTvcVuScepBaRnG
         ZdaQuNsF8YmW2wxcznFagHeGT/AjsgYQRoIPccDu/GnNqfjt4JaRE7HUZQDv/QVxiuaw
         RHYJHUt1+xs1ABWZkuuKtteQHTbr3NiGiDMOH/dmFApH4QzwsNudPgEj2XU81OS1JFX8
         BwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203642; x=1781808442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrFHJAtiz3l/SoMxwQsRd+iR3vzlfSRyOn6rVwZE7gw=;
        b=jBfF0EsK26A1s2Ty2p/W0PGpONfvp8IodmwtgMaKOD64HWj60A9NiI7/V7k6YU6CAb
         MOJXZ4cDMPbAYSybeeYzJd64KtRX2BkRZKPF3b7NzeyYTiZi0/rPLge3gzsEVjLTmqvp
         qmREjU0egLfsBfZgYpQIJdg+7ethzl3cPKi40yTWx5LIINL/gNupD7kqQHPQ7GC/bRIf
         M17TMH0I8bRdWMcsMPfa1CGtJz1GZGTrY9CPorIejVHa8SlDNFSbm+f1EHZwFT07VI3X
         rvr4iViOa+E7/YRZ47S9tFyGyKTDIKLAynSEHu582esb3DTCx983b9QTvxD/Wr0GL89v
         PuyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pEWLSxiJCyNHdw1seEvr3mL48Bh31CVK5VKSDxw1EZeoubvPxRinnt0IfoKm865NW1HU5Y5rifcVB@lists.linux.dev
X-Gm-Message-State: AOJu0YyurGjaEtSsfh3DTcePKMqd3zWEkBIvX4QB1y2igQ9+rQsonaGE
	dNj748B/WLfzNsTHZhU8Y6qEFa7bFP2Xao/3D5/Gofwo5GvPaLB3l6rTYvumxzfVDEcZgn3yCMJ
	VLMj3dQjT8ylajb4Fp09OGwpW4I5fkbBiLcLzEPTE
X-Gm-Gg: Acq92OEjHzDqqfjanMnhBnkFnUvTTc2P+hW+nRYXoXLZd0PAW4dxXoaZPCBIoZSKAgj
	OCumvvvXyKeez2HpBZI48C+K/8TVgGMUYIyGPng23t0f1glhA2YE25xQpsBz6LgCEgUCxShebSH
	20SPeEiMc//1Mocgjv1HRI6CLNeZGXz4fCYs0M307z8WWSZ18+sG5/9KPHxEwc3WM6qzmPYW7jR
	YyFxdzvttPS56rNlbSIpzzG1QovmMNkZehSHvV4Hj09FeHw98hOCv5lBxHDKR69HYM9Vu7stJD+
	SPbFt1Tg1baV46tZcTW4IBIb2DrSZxFdTUwShjRM
X-Received: by 2002:ac8:7f96:0:b0:517:38aa:c2b3 with SMTP id
 d75a77b69052e-517fb07577dmr1124901cf.14.1781203641487; Thu, 11 Jun 2026
 11:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com> <20260526023515.288829-3-rick.p.edgecombe@intel.com>
In-Reply-To: <20260526023515.288829-3-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 11 Jun 2026 11:47:09 -0700
X-Gm-Features: AVVi8CfMS_qzgZKmmT0RbAyGSJmggudRfRKARlOu3o-uoZD12JuItpxRuWOmlpo
Message-ID: <CAGtprH-TzqYbwp0_8ah0VJcccOwHnUz11Ve2Fk8Y-zwqqGFMsA@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] x86/virt/tdx: Allocate page bitmap for Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 7:35=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The TDX Physical Address Metadata Table (PAMT) holds data about the
> physical memory used by TDX, and must be allocated by the kernel during
> TDX module initialization.
>
> The exact size of the required PAMT memory is determined by the TDX modul=
e
> and may vary between TDX module versions. Currently it is approximately
> 0.4% of the system memory. This is a significant commitment, especially i=
f
> it is not known upfront whether the machine will run any TDX guests.
>
> Each memory region that the TDX module might use needs three separate PAM=
T
> allocations. One for each supported page size (1GB, 2MB, 4KB). The
> TDX module supports a new feature designed to reduce PAMT overhead called
> Dynamic PAMT. At a high level, Dynamic PAMT still has the 1GB and 2MB
> levels allocated on TDX module initialization, but the 4KB level is
> allocated dynamically during runtime.
>
> However, in the details, Dynamic PAMT still needs some smaller per 4KB
> page scoped data (currently it is 1 bit per page). The TDX module exposes
> the number of bits as a separate piece of metadata than the 4KB static
> allocation for regular PAMT. Although the size is enumerated differently,
> it is handed to the TDX module in the same way the 4KB page size PAMT
> allocation is for regular, non-dynamic PAMT.
>
> Begin to implement Dynamic PAMT in the kernel by reading the bits-per-pag=
e
> needed for Dynamic PAMT. Calculate the size needed for the bitmap,
> and use it instead of the 4KB size determined for normal PAMT, in the cas=
e
> of Dynamic PAMT.
>
> Unlike the existing metadata reading code, this code is not generated by =
a
> script. So adjust the comment to be more generic. Also, start to adopt a
> more normal kernel code style without the tenary statements and if
> conditionals assignments that the auto generated code has.
>
> Assisted-by: Sashiko:claude-opus-4-6
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Kirill's comment make sense to me.

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
