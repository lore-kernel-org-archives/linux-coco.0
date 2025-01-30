Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD5718DF60
	for <linux-coco@lists.linux.dev>; Thu, 30 Jan 2025 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738228048; cv=none; b=ra2/1Nlj0QgBkaLWnlVGOWff9D+gAxdLzyDY3pYBzSlSg4lthaWcp7/j7BnQwcOeCCEvmu4IUPXZ5TA1mFVhJ4UWZTbnUbrHse5lh3jhwbfW2VAbDLMvZxL8TN9KEAJ6zMXFx7v2fRbtfpVvLghC25XVNVvRBmTeDN3FsTXZZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738228048; c=relaxed/simple;
	bh=fAesCrg5k4232xvZ2JLS/toNGDIP2Mt/eunsxR17oeQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqZ/UhBUxPum2kgrPHX/yBFilKsVcBS2jHbRQvXAoQ3Xoz9fCWKwkl9O/5C4r3ldJAtC4U3kzYGS+61cAeUlRVJW6Y7sEBAuBfuSV+y9ujoCFzhrMxEAq2Gds7005L4uwKeQtFs1U7wrlG8++fwpbL1aVE2H/L9qXMJiHilPzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=fm6zdcc/; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="fm6zdcc/"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E5436407DF;
	Thu, 30 Jan 2025 10:07:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1738228039;
	bh=fAesCrg5k4232xvZ2JLS/toNGDIP2Mt/eunsxR17oeQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=fm6zdcc/weNBGd2NWRe3TTV9pw6tVXlGVbzjiuHGAPaErbT4/AQBacSAcUjC1XB5L
	 lEXtPpiM9Rc1vedqiAEGaw/Bs+kH2rYxfrP/JSO3CDaVzn2sMXl95a92gwKlBw+upv
	 JISSl07t8ZmQJ1O5t8mHdPjM+WSJVPKHGALdxRLRDwXdfrWA+o69DMNp2FJkoKcFrL
	 OAd9c9/KC5SB3MdAMGmJGuHli1Xucl8PfTy+EKMj62jEJ5vYWFM5pdk2JmZ6/mXtXJ
	 4DseUevFkjIg1ps11R5rbSoKADhqYAPsZ01dG5pgwqI4HlFOL/nGkTJMNFCGuXsDJx
	 UhpTwVk8Q1H0g==
Date: Thu, 30 Jan 2025 10:07:17 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call January 29th, 2025
Message-ID: <Z5tBRYNugYZqXZTz@8bytes.org>
References: <Z5jv5sC5iurutj7M@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5jv5sC5iurutj7M@8bytes.org>

Minutes for this call are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/42

The AI was not able to sufficiently capture the CoRIM discussion. Dionna
and Jon, if you want to have that captured in the minutes, please propose
the notes as a change to the above PR.

Thanks,

	Joerg
