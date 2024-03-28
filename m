Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F363C0B
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711616093; cv=none; b=n0EIba32ZH99lUwThCE8Ui6b/GCvHCgIHKARrIETwto0D93XXoVyrz6DxnOqlDqDF4RGPaMIkNCzlhRLdAk46O8xiR9MGYLcTmBXAaVa0Ceh2P2EzaVs1CZa6CFqP9j+0//qegOuodLBYKqf2zRhzjevRKW4s4cFBvQa0pn3JT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711616093; c=relaxed/simple;
	bh=GgsyKKFi6sG9NRRDRaz6FN6skq4tsDNFgUHyDPygEkg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lce5Pqa+gqSizXFB5CgXc5PP5QzdxgEN/g1qPvxnFxkpC+W6sRkMqXQzb0ixb66gpXo6aMyd9Cc83sfTjYtGDf+O0IP7QbUmRcTm0Nc1jnxDMpZYSKXtkUOGGXVvpwiF6USXhs5QlqIRkF93aPaRcO2q/wb/pveUYUdMiaiLyXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=6kWIvJ4H; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="6kWIvJ4H"
Received: from 8bytes.org (p4ffe1eea.dip0.t-ipconnect.de [79.254.30.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 129A7280FC9;
	Thu, 28 Mar 2024 09:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1711616090;
	bh=GgsyKKFi6sG9NRRDRaz6FN6skq4tsDNFgUHyDPygEkg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=6kWIvJ4HXGyKZcoJi1g6iUhTuTl0QScRhmCiWg2tb+GNORosiESxVLbM/Ie94ioLZ
	 OHK4Z0PQaYBlMdKGeZnqp6YmQzuHOJBVLsYhTiTJS0+xoQj0cvgW5YyXVeLctkAuMZ
	 HA3DbQelOEJEmejkBTB4e1qf/AZkwIj+3zEiBY8I5Gfd5koEc5shciT6WOoxVE6IjG
	 ZIyoR0imBb7w/KtREHJeyytwO9xDKV6UXbmHiwJ+vGFQ+4tSCUlSq/9+UVJ55OvXx5
	 0kIUvKK/QG9a3dQWe0iEhtSL7lw6o36yURIPxmdd5kPwV73V9b+KCXTT/9Y26ZZlmF
	 EVOTWkoZ66dvg==
Date: Thu, 28 Mar 2024 09:54:48 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call March 27th, 2024
Message-ID: <ZgUwWO-GVS9O0_mS@8bytes.org>
References: <ZgNEjFQmGlrTTEcS@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgNEjFQmGlrTTEcS@8bytes.org>

On Tue, Mar 26, 2024 at 10:56:28PM +0100, Jörg Rödel wrote:
> 	https://github.com/coconut-svsm/governance

The PR with the meeting minutes is now open and ready for review. It is
against the above repository, as usual.

Regards,

	Joerg
