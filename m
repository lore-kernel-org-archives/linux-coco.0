Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A261D89F4
	for <linux-coco@lists.linux.dev>; Tue, 15 Oct 2024 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990425; cv=none; b=NsSCQcJYlG0qh8/IJMS7T/FeJlwHSEz4RElRZKLGd4FOpxrVOadT3jmMzeO2RG82+yejJ7UqftthjLsLgWRoNnQGlq/N/20VV9WZYZMoMe383R9Pl/FHoK0XCPMN4tP9KQXk8eAIZ0Vd241NtZcTbeg/FM3GpnT5dzXW8Qej+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990425; c=relaxed/simple;
	bh=/gwQ8p8FHpCLXcwy89flvhb6XU89STaw55sfhY4DwP0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCnmmNo38pLfxWRrUvg1GAmfAkUa6muMSNWjQH6EcAmZouy3+pxOZ/YO+s1LWMB5pEmyR943A37E0FA9SlPVJonVCt5DWgZqZScuTSC15VEgytmk2DKXOp7HQMdfaVv4aT3k5see462DIrS9zSKDJIjrVmjouVbpczmnRmwqTCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=skZ/DWXq; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="skZ/DWXq"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 57AD12A7A61;
	Tue, 15 Oct 2024 13:07:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1728990421;
	bh=/gwQ8p8FHpCLXcwy89flvhb6XU89STaw55sfhY4DwP0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=skZ/DWXq0V3yrsR1e+xSrsojcbl+2S/Wj+9cwOMnvq72VpRQJWtULKkfgRhDYd5zb
	 cIt30NY3mX/+3GVhB2/Peg/DdP4zIUAziOPjZ3QbnwTLjCZWsbLeKie+3ZRkCCspzs
	 Mqt16U8dZcmYcIm53qQDq4gfiSACtFXggmrvwsheqcgO8HhIsb7TkKIDUU+RedvFK+
	 jFZJ+S5EG38CfgMaz3K+Xbsa4mwLvCI/93W22P8rNV6jLH3a1sTjQsa6UnUiMCgH7v
	 CzkHhKM4XnAN82sxxp5I9C4ZREFBHNLyR3IYFMrjTO++F2kvCmWtHrL+aS5DyoWgaw
	 GxXkCW01egfyQ==
Date: Tue, 15 Oct 2024 13:07:00 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call October 2nd, 2024
Message-ID: <Zw5M1GTiDtL9MZPp@8bytes.org>
References: <ZvwV_eEVNqhNpgky@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvwV_eEVNqhNpgky@8bytes.org>

PR with meeting minutes for this call is finally posted:

	https://github.com/coconut-svsm/governance/pull/29

Thanks for your patience and see you soon in the next call.

Regards,

	Joerg
