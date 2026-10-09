Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739AE4DE701;
	Fri,  9 Oct 2026 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551678; cv=none; b=VNvLzAcUkYn6DVT73hEY6ZmsYZZtxWUbIQdxbnaBSUVG4AQdIQ1jGaQu9LWPa2ubeS5XuFt+Efwyh67GP82EKQkzyN61Iw643JYNacM1YBSiGz4Yd+8X3vJj1Jz4dJi+qDVQSa3wSVBUE9uc7W3meNZzXZ9jk8EdCbwnG/BvCyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551678; c=relaxed/simple;
	bh=GGiPjmYE+NR1PvIkMssfxEKbkvELLVmOBOY7rLxdGaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UczbfjRm/Qg4yGOfLQ4akS0qse9Ci79PGr1ZmRa+T+m4DwkoZFBKZfa0jchjHiBWYKUFM8H7buOEAmo+dZFyU/Qm8kc5gUoC1kX9din0k/x9eI7DIeOGgqX14EfRH9FRshFrUWAmUOa5wW1VSALViwQbKEYf2SByr1MIIN0UJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxPkGSqC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxPkGSqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAFD1F00898;
	Fri,  9 Oct 2026 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791551677;
	bh=Vznt9dKT8VJX3ifX04Rk3RYrekgS8ISKuvcW7DeTKU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KxPkGSqCco60pxWa3c4DzTtOCeDVS7FebVASeTx1mXCa7biuC0udcY2Sg2Zb0YmOd
	 wHdGUKuyQZ0i/dtj9Opq6JT5I0Lu9tFU0YE2T7RgSX5FtOUjujLVfkoMyXYs61wJKZ
	 0dbf2KrlBqd7bZFX8Qppntyfsy6Hv78tJaQhGJvCrB71Nr6bMOGUDSFEQpa8pzs7g2
	 iAc/mK/uJylSPakWtR0nJNWmdjDxtsAW6/cJnbx2iVXixwSsKgafUQ1Sr7ikvMttT0
	 yszCkQtvM47QEhb4BnRcmiVKDbVyrolvvp6mver6G+fahPysIsR2KKujsDBNo7a2C1
	 aPGiSlp0PCoIQ==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.ams.internal (Postfix) with ESMTP id 02FB6198003A;
	Fri,  9 Oct 2026 09:14:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 09 Oct 2026 09:14:34 -0400
X-ME-Sender: <xms:tujIaoc-FMNtQ_-aCD0rYXqbXOzmB373QHkMlXRH6OGGCjWyZcutCw>
    <xme:tujIahdQEPsPRICPQGZeyeN2zFF-jG1sTyNxGn3m9a1olI_6kNfUIP1SsulNgN3SH
    UfhJeYNgf1Tyl-wbkYRWQiMc6HeYmuYh7Z8BWfNmKqK713HnFxa6Tm4>
X-ME-Received: <xmr:tujIaiEmpkPJf_uZ1kd4hU88IgM4Y4GyQaPN1tqXyS_1EQqpns5Hc__dhAg>
X-ME-Proxy-Cause: dmFkZTEFoiks0RpXD6KY5YBSVURWpSabqnLZxqpKlNYFdzKfMs28BotY23zVK8hQkxcYht
    ew/a4BEUHagbfij7D5Fj3M3oBGfEHzyEMx1FuPT2V85p1X/6rgqqkJm4nUgQnoKuiGaz7C
    dRCvoMnuhsL33YwGQ5WoP4nVVjvK4rutvcSH7hCVic0ZfQYe5lnjPJcM+fPpj79QET05gN
    MLMtfmPZ/jonYCuCe4MUP8s3gnU2W9F54sx/S+SzY3adfMPNzeqoL1Hl27Eu61EyqkIJFc
    m6TVpSfih24c7nk9VVTeW8q4S4aj6DfFUoa38qz5YmRwQV7UaNLgr/rhN8og4AqAul/lop
    OE9O2DvUyFv+Gx0xWZORkvaKiitH9lsBIE4YbeQ03OpGhYpLdpQwz7/VkrwTuH5jORG5uz
    tK7xySguBsRhrJkUHU+pAIzzjKaNBjhXChHvj9GfnKx8N0WnVCkW+ZKPhogX+9WBuJ82E3
    E290us7FNntIVm9EaI0PO9/iMSqpGo4QjeDCm+M+qSa/uKdnyt9X85I45Ye5u3+uOE2HO1
    2mx/1/BC+fuXEz666slp05QBvIOCD7g4bhs08KSypTXGl73a45Un1SRlwExQn8yE8Drcjn
    qrCkxBxLEeYMHM3Qloje1BCV5Z+98AgdzOHz5B5mway1ornHEo94FOnDDCrg
X-ME-Proxy: <xmx:tujIarWB37laLvM3E_V-l9Pi1-V2aDbPPqDr0k0DgHQ50LulH4KEVA>
    <xmx:tujIasytS62b-fr0Gg8C1lEDNM7Yc0JbX0CwJlDkMtf6p0-XM-eZlA>
    <xmx:tujIarp6W4Q5gZ57dysLFMlSaaMjPHuKog072bkB9bNEJIIX8v3eAg>
    <xmx:tujIasFfFgqf4xXlunus3reTfxjLw6lKsXQIl0mPJAynxAFnJ3Ykxw>
    <xmx:tujIahBiqdesN9UhxiuFY_FA-u93dec4HARM3EN3c37I8i9957TvBXAJ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 09:14:29 -0400 (EDT)
Date: Fri, 9 Oct 2026 14:14:28 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, dave.hansen@intel.com, kvm@vger.kernel.org, yilun.xu@intel.com, 
	xiaoyao.li@intel.com, sohil.mehta@intel.com, adrian.hunter@intel.com, 
	kishen.maloor@intel.com, tony.lindgren@linux.intel.com, peter.fang@intel.com, 
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, chao.gao@intel.com, 
	artem.bityutskiy@linux.intel.com, nik.borisov@suse.com
Subject: Re: [PATCH v3 2/6] x86/virt/tdx: Configure add-on features on TDX
 module init
Message-ID: <asjopeR6IOk1aDgc@thinkstation>
References: <20261006-tdx-module-ext-v3-0-db52cb05b918@linux.intel.com>
 <20261006-tdx-module-ext-v3-2-db52cb05b918@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-tdx-module-ext-v3-2-db52cb05b918@linux.intel.com>

On Tue, Oct 06, 2026 at 01:41:46AM +0800, Xu Yilun wrote:
> The TDX architecture identifies some features that are off by default
> but can be enabled by the host during TDX module initialization. They
> are classified as add-on features because enabling them affects existing
> TDX systems: they may change existing feature behavior, or reserve more
> memory.
> 
> The TDX module extends TDH.SYS.CONFIG with a new register argument to
> specify which add-on features to enable. This new argument is a bitmap
> that uses the same feature bits as TDX_FEATURES0. Note that Dynamic PAMT
> is an exception: although it is an add-on feature, it is controlled via
> a legacy, dedicated register argument [1].
> 
> The kernel needs to enable these add-on features when it supports them.
> Add a get_tdx_usable_addon_features0() helper to return the bitmap of
> the add-on features that the module & kernel both support. Initially,
> this helper returns 0. It will be updated to return specific feature
> bits as full kernel support lands. Pass this bitmap as an argument to
> TDH.SYS.CONFIG.
> 
> The TDX module requires SEAMCALL leaf version 1 for TDH.SYS.CONFIG when
> passing the new bitmap argument. A previous change [2] supports the
> versioned SEAMCALL leafs by adding a "version" field in
> struct tdx_module_args. Set the version field to 1 if the new bitmap
> argument is used to enable any add-on feature, otherwise keep the
> version as 0. This retains backward compatibility with older modules
> that don't recognize version 1.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Link: https://lore.kernel.org/all/20260904215841.303070-10-rick.p.edgecombe@intel.com/ # [1]
> Link: https://lore.kernel.org/all/20260921-seamcall-version-v7-1-cf05fe76b467@linux.intel.com/ # [2]

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
