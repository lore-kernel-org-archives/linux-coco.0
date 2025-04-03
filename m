Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012E61624E0
	for <linux-coco@lists.linux.dev>; Thu,  3 Apr 2025 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677189; cv=none; b=Ss/IlWB+qtVrQ/BMkBo0TJZH/aeqZOGi+85FC0agk7aI6TdnZAN4wl0vVjjRj6veb8C2xtV2Yd3BME1Xl8SnJeBvM6+YmUHFKpyw+/ndX63IylXmZ41b9a0HDjj3GFLaf6sVshrouzO0R6TioKdMwEXkM1RQ4rw3rMtbIvVS/Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677189; c=relaxed/simple;
	bh=74/S9LRUT/xFrK/jObRwJrbHGS04ysjqck9BByMN2yc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InCVwxihfWWAiU2fbi3nHfKcT/9hrTABtmlM880SQLeNE9qCWZBYFSsMZdo+yUENPUUxMOEzW2eSDgjCx2EV9sYmCB5QQWcSG4GCo4YkR99HCCpbzu2PlFbV4nRogepz8ZJQRQaE3m1jSVusCs1ORLIi3TAfDLRbp1MxBYNZYgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=dwgwgQeG; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="dwgwgQeG"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4535A47535;
	Thu,  3 Apr 2025 12:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1743677180;
	bh=74/S9LRUT/xFrK/jObRwJrbHGS04ysjqck9BByMN2yc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=dwgwgQeG2c/k0Wx3PpJrbyuBJZBzeCVMUDV1dxDhAFSu/+FDkCuAL3bsZZfIMyra7
	 oZNqqmBaGkDsdn2XWOyPc2lRxrrtycFkQdyjePe0YZKKHRv8wjGIlQ1FPRFUWJPU20
	 A9pMjQV7ZLnYDnww6llON6qzVeR3KU5SXrgyagFIsrpXq92owRzyozzfCkj6r356Rt
	 zNBfy5oM4Jylj6JcPuMSRi0z+M/TFtqptekQ6+Tvu7R4+79bu0yZ0qFbTkSZ3tPjEw
	 z9cJ1nPCGz4/SF7ojTEnFQ7os/12o8RcA4UY1iOaTYlxrxagoxSL0rtLL49LY7AXP/
	 14sHfkTjsaQYA==
Date: Thu, 3 Apr 2025 12:46:19 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call April 2nd, 2025
Message-ID: <Z-5m-w0qien6roVt@8bytes.org>
References: <Z-wLndJu1CM_K64R@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-wLndJu1CM_K64R@8bytes.org>

Meeting minutes are now ready for review:

	https://github.com/coconut-svsm/governance/pull/51

Have fun!

	Joerg
