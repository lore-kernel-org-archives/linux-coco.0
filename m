Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC7A12F399
	for <linux-coco@lists.linux.dev>; Thu, 29 Aug 2024 06:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724914649; cv=none; b=GJXbIy12o4aMFlps9yPsi7XEpebCd5AAIne0LGcxu7ANKK71zuBeSBZ734Q2kJqyneQc1EiWzsRyD0SvMjwqYVtV368f3L0Fzl6gO//af6zEG0lTSLyiUOh8ZeeknsWWt95RAI9UBBIi4hMKY8rOoQwMAquXszsuYmKR44nmtAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724914649; c=relaxed/simple;
	bh=jjcqQdPBI/qT4OB7rICMyr9hF5X7vkvgdQCl5m1D9bA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCog+EOcQowWLOJ+0xVLp01X+a0p/qj4vL7xQPq/hYYjSD9cijgmvTITaoRZnCh6gntnxI4f90OKuFXuC3a3Vn5H4CkoPNZqGaFRcKvP3Zch2mWn0JSx8XmMf93lM7zjNeca/MwOSLv+M/8u+jtSf8ZhpGgLh6wAh2B2/vIuHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=RPOR8aHY; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="RPOR8aHY"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 40AFD286555;
	Thu, 29 Aug 2024 08:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1724914640;
	bh=jjcqQdPBI/qT4OB7rICMyr9hF5X7vkvgdQCl5m1D9bA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=RPOR8aHYEdMu8LJdMDLT8PsvQtA3PpOlqu9VvBWV7TuYl+JLa3tzVB1xOgUyK1fpQ
	 elHwJcVhfyKTtePGVP2DxAAvtx5tUy5nIdY5siqeFqCLq/yWulBwceQUkjf69x1w/w
	 YUn3U5EMnqV5LVZPIKU6B/3CefWojuCAQ46ABIgd/q46a/G0NMTZUU4PQToyND1GH2
	 lLcwsp+Xf15LByH/sXPWhc2J31qCKZFO7rww4Iyg3tBz90g1+UXGxir2t8sbDN+zp4
	 VlMEKbtzEDNtn+fVHeXq55gyIVo5UPh0sGMQ9jnTIz3dbbdJsGvtPrisV2fUdG09ck
	 A9nygRZIe35xg==
Date: Thu, 29 Aug 2024 08:57:19 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call August 28th, 2024
Message-ID: <ZtAbz1E-sOs3ueIf@8bytes.org>
References: <Zs43_I_cewEo6efb@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs43_I_cewEo6efb@8bytes.org>

Minutes are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/24

Regards,

	Joerg
