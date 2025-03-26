Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6379189903
	for <linux-coco@lists.linux.dev>; Wed, 26 Mar 2025 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743001670; cv=none; b=USGWCv3c9nSSaVreLNVwO3db2KCLttuisfJG6i/aRbaSc9ZBLEcCG99AbByP88hagfs+FeCorFE+Ho/RDPrZWdjJWf6JxlE/p9hASAgzMw3KgDprp/687WrSDt9Bs9rsHTAkCgMNimbevszGTWSQnok9nqox5kdg/0rfyMz35uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743001670; c=relaxed/simple;
	bh=wpI/6Tg3JzMLXkj2EE+uVlYMlQYWKMq9bpdzv9t7VoM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doGzn8Kf1CVSEqxjbmIi5mx+EePo7P1aMyBrP5sNPIb3c2SvGYynfF1O5Y+dwcaYZ1ruUCfAyzxF5OwFLwcCqGq7uHJdf42CT++TMTWEIdKK3afzwQNeyTSEv/TTd66A7ZiwFtZvfufK37JEMp9ImGXRZlur5745wh1xBnrM7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=y2t5BMvF; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="y2t5BMvF"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 77496469F5;
	Wed, 26 Mar 2025 16:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1743001666;
	bh=wpI/6Tg3JzMLXkj2EE+uVlYMlQYWKMq9bpdzv9t7VoM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=y2t5BMvFP0yQ5oy3p32xDAfTCr40wi3id6LNvdWqqw3EzlyABq31hEwoNfraRp6ra
	 cQXhjwmrJKea5gdXwAQckqVmLcyyi6eJ3EyGEtQnUqOHQXlAtjRLhQDVuoWCJVAgu4
	 BHLFc4PiGFqvpcyEqinCXq5SeVgwenXaWEP9mUKUNKZUwTDU4NyU7eF2XylEICDD/6
	 6IbxrRt/cZ6afA/2VzTnvLw+/e5jg/v2PBFp3NQWmc+n/Dv9gROsHFxiYd7d3oDrdd
	 QJ5Xu9FwZhNysz9w3xuJoqrSyKdWRoJl7w/9rJcY2tc5EN90ssguHgysTW9k1i1UjQ
	 ukcA4i/1FcrAA==
Date: Wed, 26 Mar 2025 16:07:45 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call March 26th, 2025 (Changed
 meeting time for US)
Message-ID: <Z-QYQTBuOjJtkiWX@8bytes.org>
References: <Z-LgVcs66nVpAd7x@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-LgVcs66nVpAd7x@8bytes.org>

Hey again,

On Tue, Mar 25, 2025 at 05:56:53PM +0100, Jörg Rödel wrote:
> Here is the usual call for agenda items for the this weeks SVSM
> development call.  Please send me any agenda items you have in mind or
> raise them in the meeting.

Just a notice that I want to bring the status of some of the PRs to the
agenda today, namely:

	- #259 SVSM: require SNP restricted injection
	  (Can we require restricted injection on SNP?)
	- #528 Attestation driver and proxy (with KBS attestation)
	  (How to solve the stack usage problem?)
	- #541 svsm: add SVSM VTPM Service Attestation
	  (Any dependencies regarding the ongoing attestation report
	   format changes?)
	- #635 virtio-blk storage via mmio using virtio-drivers [v3]
	  (Any blockers, maybe generic MMIO routine support?)

See you in the meeting :)

Regards,

	Joerg
