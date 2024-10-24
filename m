Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDC218B460
	for <linux-coco@lists.linux.dev>; Thu, 24 Oct 2024 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729756689; cv=none; b=nf7fASR9CuzGrknccYLoaDad/P3MH+7zFv1lsU75bpneUwlTxSVV5i9jTVxB2LLY0yL0AlQuGpwfpiVENNzITGcm8+J+x2HL4ISMyPb4CpcPBPzJWv9aItQiW/owi8SQcOFjPo7VNDANW87vOEjnrYJxEucyCXRHUYIveky0QWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729756689; c=relaxed/simple;
	bh=eVUUtrt21tNmE0yF6lHyeGpFyYuv29EDp72djpeYOFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpZdPa3vXOYMNz86xpjvFSRy/1QtzzmkgdRqIaKgvkduONbeGjhw1b9Di0mGGt1Lco/Y5NT3Blr/BFQafPgNb68UBYCdeKdGBlAECMBRQ3+dFUrx9Uayd9PWF2KV8ILJcbz8NZHMliJ8PTvUuSxqPLsjIvzvoBUoe9Zavz3Hbfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=0qSFqreF; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="0qSFqreF"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ED84D2A87D2;
	Thu, 24 Oct 2024 09:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1729756680;
	bh=eVUUtrt21tNmE0yF6lHyeGpFyYuv29EDp72djpeYOFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0qSFqreFSXIIXoKrZJQ/kg1KsGEy9M/PL1i9E8bPIC/AnN/sZTeDrsmKp3bZTfG9/
	 o0w/ZNyebI3XDpmxdq63z1PXwKZ5cS6+GWtcHXYSa7NoZ8mhuBlrHIftNJ7Z+QBubm
	 SzPAJAratiDFEz0UmdcLVCF0JR8yM9at7yjhNRvp+fGWjGi7M23TBvKg2JnHDNYAC4
	 rTHab/heZYi4zyVt4X0U1PjQGNtvNouT8lGLpplplpFTFLIysepv2QzJO8x3nOwbP7
	 B9zCIFT/3Um6i7B7BYz4wrymPz+osksY6U8q8+RpDrtG8jlcgp2vJdHqeRZYvkYxVr
	 GAIxc5mtxeiEA==
Date: Thu, 24 Oct 2024 09:57:58 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Cc: Ziqiao Zhou <ziqiaozhou@microsoft.com>,
	Weidong Cui <Weidong.Cui@microsoft.com>
Subject: Re: [svsm-devel] SVSM Development Call October 23rd, 2024
Message-ID: <Zxn-BvVKj2ZdYWeQ@8bytes.org>
References: <ZxiIIxuWHa_Vs28L@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxiIIxuWHa_Vs28L@8bytes.org>

Meeting minutes are now posted as a PR here:

	https://github.com/coconut-svsm/governance/pull/31

If you find anything missing, please let me know by replying here or
propose changes to the PR.

Thanks,

	Joerg
