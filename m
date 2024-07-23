Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424B914EC58
	for <linux-coco@lists.linux.dev>; Tue, 23 Jul 2024 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721726981; cv=none; b=hTTN4pzIdcuBcNZV9Rql965j/xSnE8M2wVxAm3M5Mt0nPTeaeqqrirz1W0imGQqoYys22rjlDywhz2Wa65/QomIKBJFtZmV1kAFnkOa8w2d7QmehBimM3zpb4xaPz3DulvTjT2fNpdhDISLs/sq/oh5SSlNisn01US4NiXrHzns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721726981; c=relaxed/simple;
	bh=qOp7JolbibUywc2GBhgea2TOpB5t2xmTTw9pw2hdLKk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVucTCu7BlirVSiiTpnyi6LpI079GgOPG3k2k+OSzcV2bRQMkFCHPG8887BkflW+ap3lFH2Nk8vu7UVOUf50bnOWOixh+KsLThJiSfSAKSKinuC8eQ5Z6VNiyTbM4s44i7qxKKlNR1dGlzJNFRdB6rjU1ZsAIIjNvzIYZFVGQzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=juxVpSky; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="juxVpSky"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E4FCA1C7C64;
	Tue, 23 Jul 2024 11:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1721726972;
	bh=qOp7JolbibUywc2GBhgea2TOpB5t2xmTTw9pw2hdLKk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=juxVpSkypUiShX5ggkpwsa636JfjXnxCey+VeV0Uvj32mq3131kNiLrNY4e7WIXVR
	 vJ5OIG07ZWOYGh6Wv9BVXmFXj5k1uSot19rM89o7ywOnytzvy8HOuU2C69PuE00L3i
	 6E8BbngOYcu+kkdXBHIqF03ezbQxfyDHjulKC4SvyNhHRxQ/GhEMC06pkmukgormF7
	 UGF+jsyTeXRFszMKPT9CwuBoDd9xTn6Vznkikxg0VvA6TyGZAQs8piwRfYYJB3oVB3
	 y0ZHd5xxkkX77psuE1q93t1wCH3w0D1Uaoz3DGo83XueE16HFxJn0IXzHvsgW3ZW2l
	 Uklq0KAK+s7WQ==
Date: Tue, 23 Jul 2024 11:29:30 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call July 17th, 2024
Message-ID: <Zp93-mMjOSP0Ndff@8bytes.org>
References: <ZpfDsB66UnU9oodo@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpfDsB66UnU9oodo@8bytes.org>

On Wed, Jul 17, 2024 at 03:14:24PM +0200, Jörg Rödel wrote:
> The meeting will be recorded and the recording eventually published.

PR with minutes for this call is finally posted here:

	https://github.com/coconut-svsm/governance/pull/20

Regards,

	Joerg
