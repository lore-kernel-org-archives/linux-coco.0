Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619FC41AAC
	for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414221; cv=none; b=mkrprGedK6XTHHDqzD9QF1o2vL2Gn/DiDby5CsW7ji9INr5aJHbkD0mjN7M9N4DOtNg6ik0te3cBnFmPv93YWVy4GkdnjX7Ikl3w7+GeiAn9RqGRopBHGd3ZAlZTH9DgaiHQ8fA/YiZ8zT76LM3+F5045PL6RWZoaK0VjsTvkzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414221; c=relaxed/simple;
	bh=qdrEtzxwFnHKC7ndsgo9/b1dtvac/CzKEFSCXmkUGuA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQK3B/GCn5B2NbL3qMxfN+L42heRXVZO503/dXMww9PlqumX5MpZKi+aILYP/XE7WlliqR01uvQ67RP7EryE5m0J7EW2ElzvT67Oj9U1nLD1vlVgdJ7pG6bLTlcDl+12WGAy364PAj74Y++TiAXIV8Wb0cxR1JCJbDkvEyzcvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=IiSro/5K; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="IiSro/5K"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1863E46FEC;
	Mon, 31 Mar 2025 11:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1743414212;
	bh=qdrEtzxwFnHKC7ndsgo9/b1dtvac/CzKEFSCXmkUGuA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=IiSro/5KgmMLPO6+8i2KsybmNZWOzNBngMERnhcLcqwJXPCTd8tVXsF1dmnR0ttS0
	 s42gk9qlIYM2+5SmQK35XzZBiQ8ap6PCVC9K47L4Hh7GBODmvGp2nFIqroUg/JibTa
	 gUpAR2nIsMY618aPdO6iYkmduAlbvvJnn10Sq6p5/kjfjJiTWADmw+qFn9RU7auL3e
	 m0p2sbDkh3L79vU9J5JVo1StRjHE1hQFe1wVFGyJyw2ZTFB0NSFPaFz2LZcnPLDtrf
	 HKyS9wwp0oOs2rpIY+fOVHJXGFsr0PUQ653dctNkUr/iBm+nQoOzBeqJaqWwwxOV/G
	 WIjBrJApzTH2A==
Date: Mon, 31 Mar 2025 11:43:30 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call March 26th, 2025 (Changed
 meeting time for US)
Message-ID: <Z-pjwnNcb3YD_d-i@8bytes.org>
References: <Z-LgVcs66nVpAd7x@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-LgVcs66nVpAd7x@8bytes.org>

Took a bit longer due to me being in Berlin for OC3 and the weekend, but
here are finally the minutes from last weeks SVSM development call:

	https://github.com/coconut-svsm/governance/pull/50

Have fun!


	Joerg
