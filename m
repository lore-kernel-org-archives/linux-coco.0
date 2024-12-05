Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340551D0F46
	for <linux-coco@lists.linux.dev>; Thu,  5 Dec 2024 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388256; cv=none; b=Z6KRDAKqzFgEq63mLz1J2/PAW/OYezT5Q71T7c+uoz8TGy09IEjXsa2jKgUoL8jmbL6ytzzwRvuJAV9OZw4UzFj914pM6t6KYE20z/eHOmnXy6sdB7sWubYnGimStXOW3/pS3DQCcjraye1fXSVNKDraAuHFxlVDzueZAe4J6fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388256; c=relaxed/simple;
	bh=+a4HsO2bH4518vTFXmwwOW7grK2seCUs9cPD/hCfQ68=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjaYXcJXIDwul3AvBsJ6ybDGIAUtlLstMxRQJAHZERziW0NwmQyPDyFI+IANeDgJNzr/YmRpYBqO1mHFOIcAOMVbuPuBPNxrBbbWqIHeqJAv6OElUq/O0s9z/LpQE3AMf7DUusV/Mw5p9/lZwAVifLbp6IHPAbZpJmXB0ZNb/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=LfgV+MY2; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="LfgV+MY2"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 24A2E2C2621;
	Thu,  5 Dec 2024 09:44:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1733388247;
	bh=+a4HsO2bH4518vTFXmwwOW7grK2seCUs9cPD/hCfQ68=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=LfgV+MY2WIOKEL3dis7+fYgrt/cCovylOKDY2XB1pqVQRHN1H7FqphJqbcxGKEi3g
	 nYxrB43iSWYYj1RXJgQMOk7rU9EH8mNznTG8YhCKz6ifh4C2Isy1fhPgSvyKvQbo9y
	 hLlpRusB1tPFrD58PhG2DeF3KsG072z2UgM4Ig/evBdRyDW/5DoeGNsHoW7JIA+CE8
	 FlVprb7w+cM+gpmtRMx9sU20sOy6KBQ/1RNlqKPJ4yKR+AyxDQZgJxf9Zbt5X7FJPi
	 09B0fVRmFqeb0HZkmNo4uhGtCezRdM3Lj3F0y0FDa4LYffT4E2E7unluN0hgm0h6xm
	 ljPVX22ZZdvxA==
Date: Thu, 5 Dec 2024 09:44:06 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call December 4th, 2024
Message-ID: <Z1Fn1rXNyow5GPnV@8bytes.org>
References: <Z090CQ10_c1nk1Ld@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z090CQ10_c1nk1Ld@8bytes.org>

Meeting minutes are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/37

Have fun!

  Joerg
