Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3484C77D2;
	Wed, 22 Jul 2026 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719388; cv=none; b=iQpEnKtEZRu+gtOIt+BHp2HqQdftttgp5fjJbl5r2RE6dstmmLTq+Vp2jz506GZXYJYpvaSf/pzXTrZKltR+fxzC8ta0bHQptf8X7P9OMPRXdUdhHqirWXk31fPBLtRkrcoE/G1s4heMTAD8UbgA3UpWhril5ncB6Mi91pWX/zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719388; c=relaxed/simple;
	bh=8+/clJPFOdx4YyMbKk+20/cCk4i/aduLyP/08LG/KnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTkvP4BxmAbwm4CBN/pF0Z9J0GT30KwFuDXsNBm3uJ7Ce5qkIKxj/3Avx9ILTKJucd+cpNAMCbL8FfQZYu1rgg2pXJvehyQPHa44bHH5zcIi9cIE7iObwmDeFsqG9xw5OM91ZwUN68Fr1f/tvqJMvL2GeuQf3KM1GziyQhXadZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yh4KTmTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yh4KTmTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492691F00A3A;
	Wed, 22 Jul 2026 11:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784719386;
	bh=VoW8e5qYQQ+PMwq5it9LQLgrLirJMylIxUpu0LSkWxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yh4KTmTuU913V1+vSYeqvYyAR5Awf2jQQ4d9RTWR39KLRMAPSjhXf0sS1lstMqW50
	 ji35qprKyryKG9gSCju84GGfvROrV4MTVE7iZUSBfu5Sbon72OO2g3Rlg3hnAK1mbh
	 ozDzjQhZQaOIl2xZd7xOM5OCs6nsZzgzlcpXjmLpcD7J5bNAC3OYcEfpe5MpHYJLYX
	 peN/ZnWfTTN23kCz13vI72uNPhaAg0IvTqDGETVJa4ZMsKRtD3dmP4dJSGibLPVD64
	 1AqhkD4pmC6my8i5ppjqa+mbxZo0tztQ7Xony4WHmW5NuFW4HlcoF2X584Jm3PfgZe
	 3zGFVY+anK/TA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 737F5F40072;
	Wed, 22 Jul 2026 07:23:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jul 2026 07:23:05 -0400
X-ME-Sender: <xms:GahgasZlJV76SSZLR-KxG-AlFkGbXr5A7pez_yEkvh53qvvqSThv9Q>
    <xme:Gahgajfq4jLnwvaxyn1pE7d0eAVhjDF4dN3nyQw9ohFbPYXN8jonQnLjsiuckM0-R
    6GDcdyn7c4f-JFH5841UfbJL1q_ToF6rhUusn4SEQX2ZG85FaZYN-CY>
X-ME-Received: <xmr:GahgaiQZLn8uCpl1r_s9odfGKi1GMDDmBS1sDOd3rBsXbPyqz7raWRuNUHC6fw>
X-ME-Proxy-Cause: dmFkZTFDwoAQ73y6MRPJYX+djuSJrxU5QUfgOdT0C5pisrxyRFNHjyYo/OuJnLfBNTikoo
    EpbfibbCxUhOCLuz2rtwbT1dX1PzPSAFNWvQSep5UvNZTw0XTycbTYVgzgoRVuhcdqQjmJ
    gLWX2z5iq81zVjQIfbVmE+1izOj01T9MMlh7nPRBal2BasY/OCr8d1t+MtSoaLB+0oibjw
    QvbMAv8ffgvjb9zDGZjw7TYiJdv72b0Kk/h60R6LHfitb5Te3fzTFlKgNmrXsohM9/room
    AxdRuTaiGk935qDAtbfxtuVaZPhQQnccTimoZWnerasrsN6Wl2VTBS8Qb2DW0tzLlYs9Ju
    jVf+0Ab9lglON6iSyldF4z8ePWtvk/hWiG0wyacjv/iALc35v3fXV3RGxXuUZWQg6K9aVF
    D9hIuz56pGU4HJx8QxBwTzbZYHBE1N3nT/btoDnYGYoymuKCLwZPGunZED1VH9z8mz/Ocr
    6WLICsFCjBObt7a+fQBNU2+ly1HcDw3QKK9X5V7OUkJ9SiShASmRF/HgAZD6UVVTZonEdB
    THT/futJRxrl0OZCbIgG0ebDP0UxMqZs1tBuIrmZAaJBRHUGi3BzZGuE65O0n0K3EZ1tnf
    aCgXPgn6bSbB1eVdVz9S+N/BqxMCD0ChyewnT6EDyP9A6SL0uBLkX4SC/q6w
X-ME-Proxy: <xmx:Gahgallp0_ofBXu9SxiMUomAwwKW8NvcVKdIV43zKw3wIQfxg-tX8A>
    <xmx:GahgagtQmCnCKIFfzpKmjFxa6pDjUsGOjEbK3XByxjpW1yqXdVmf7Q>
    <xmx:Gahgao_9vzhwvMlYb50ZTP4V_NkF2IyzO6857nwyCdVVRELEi5L5_w>
    <xmx:GahgahwnElH5VYC4iC6np522L3nfD3yz9bvxlnSnbnkXzfM_vE1BcQ>
    <xmx:Gahgag-kNWAgBp-ZC6C5KEeEOp-Bb0iZYrLXHW2QhaEq_pJVnwYU_6dG>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 07:23:04 -0400 (EDT)
Date: Wed, 22 Jul 2026 12:23:04 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@intel.com, dave.hansen@linux.intel.com, 
	yilun.xu@intel.com, djbw@kernel.org, linux-coco@lists.linux.dev, chao.gao@intel.com, 
	peter.fang@intel.com, xiaoyao.li@intel.com
Subject: Re: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Message-ID: <amCnuX8XAjxWFlHd@thinkstation>
References: <20260722084634.131020-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722084634.131020-1-yilun.xu@linux.intel.com>

On Wed, Jul 22, 2026 at 04:46:34PM +0800, Xu Yilun wrote:
> While both options have merits, I chose the latter from a
> software-centric perspective. I sent v3 to invite more discussion.

I still don't see what postponing the encoding to assembly buys us,
but it is not the hill I want to die on. The result is centralized
and correct, so let's move on.

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
