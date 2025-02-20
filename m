Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBE11C3F02
	for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740040484; cv=none; b=jb1+AXDFTNrCPkllWGb0ctFYQstCxx87ANMPgXvs3P2HX4tk/sfBvqhMm3/H9QkSTx3fpHl79YjklXobFpfDc9ALjYccA4gTyqSdxmz+qpaK0MNNHhoVvWTM8nzjGHTV7VwOBd7bDCqS5hJFIAZ3sTWJmI+mEUw6341tUA7/YWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740040484; c=relaxed/simple;
	bh=XyBuI8Sild5p/RzQBivWxOlqeJYyW01UXCrsRi40xhU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aq1R78g/Yp5CoaJy0Znssg568kzQobJmml9GMitXruHJ+4S3WfYloI/qXWfptGyEzPvf3oS8+Id9g4LN2pb9Vk2rCM3vZmquPmWAH/K3J6qnxNhXlP4mVfGOoGoE+hvRqsKI19xQS++Tp/UsDbavkoyuuy3MAxKmwmA+GitjmGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=2vFFVU+3; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="2vFFVU+3"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9EA0942FC0;
	Thu, 20 Feb 2025 09:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1740040474;
	bh=XyBuI8Sild5p/RzQBivWxOlqeJYyW01UXCrsRi40xhU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=2vFFVU+3BsOV3GiLpz5y6B+kNuAR4a3IxNoTVuOgvR7Mvv4CcYMDdF3iPUqsNohaW
	 NWPBKtFZu7vpbeHQ5U/foCKMoTC/eoAonV4qLLzDGtNKDhiWJ3aNdESylO5n2FKtv+
	 8C82Xvc1H2Q6tA9tkwgkvj2fcf11xOZw+EyBLlvs0Erp5091MKLO3tgDHi1zWNwKZI
	 rDM2WKMdGAZe5fYAEJe6CTfJc7Dazmv6L/p26rYSxwyts906YLNtjAnX+51cPcKdHS
	 Iu4KJN35qx0bRPYlZZPr+u45zwkSbYv9+nRbljdS/m6mwufH39oo31sqKVJ7LWoo8L
	 wdqD9F+arETbA==
Date: Thu, 20 Feb 2025 09:34:33 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call February 19th, 2025
Message-ID: <Z7bpGf5emib0gDGs@8bytes.org>
References: <Z7UA44UQxp27TnAB@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7UA44UQxp27TnAB@8bytes.org>

Meeting minutes are now posted:

	https://github.com/coconut-svsm/governance/pull/46

Have fun!


-Joerg
