Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB85F190660
	for <linux-coco@lists.linux.dev>; Thu, 12 Sep 2024 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133923; cv=none; b=k+Le9AP0VNEVWRQV79XaL9oGwx/7+UF+q3sLKjd8useApE5WOo1xTVLjSqhL3my175VApykB9Sm3TxU+zVjPEqKpuekIgEtRA9dRBCSgOw+K/cATfF3ZxzNG4aHsR43sRPpo3TA/t2NfTLj906UadrfAjz7iRSOJ/J2/cMKkoa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133923; c=relaxed/simple;
	bh=t7okEVhztfPXwitdFJbz1cyq/1z1NkiZfoqj0HnaW/Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzuU8M6y3zaf6DeXsWajiAGGzQOGAFECFW10YGIc/O520U8dTZICeJHhc/5RzMyyalmKTfNgr+NAJuw455qoG2cPi0EdEV/+A+Ix2vwbv9M2ztXnmVadR4KslgwJQeyfJIOxKeXq+xPYP0pgnRv8S340lrkjNMmHmKhCRPMleQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=8e5sGZLI; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="8e5sGZLI"
Received: from 8bytes.org (p4ffe1f47.dip0.t-ipconnect.de [79.254.31.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8D90B289ACF;
	Thu, 12 Sep 2024 11:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1726133476;
	bh=t7okEVhztfPXwitdFJbz1cyq/1z1NkiZfoqj0HnaW/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=8e5sGZLIKp8bClS7IZhJMbHC0jn8OpsDHAVawsc0pS7/Qu/xPsxbrGxTzGsfyFxhP
	 sC7JvX2/D46CP7zVu/NTTWfz0CDKQYb/0Y7Qgb5rFTSCIV5iaHv0VUFN/dBr4+/f1j
	 2tVEpm3xBqYC4ntRXwFFydsDsEaLrL6lbcPBNUuAyrJdjfe/CdK5LEbHkkdiTi5WAH
	 RZEAMU/u3ZD2sJnbA6vqLrZ6qSyf3p6aeMRgjbkG+d10s0vNmd2z11cFBzRWAmgl8Z
	 tWr27Y/maWoICY4P10vUS+AguK4eqxn9pxgWVJH1x9pxI1ZKPsQysw7XzBkgRsSQPW
	 JnlApdFgXkA8A==
Date: Thu, 12 Sep 2024 11:31:15 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call September 11th, 2024
Message-ID: <ZuK04_9AU4g2IZ9l@8bytes.org>
References: <ZuFKCBNUG-rFr5-e@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuFKCBNUG-rFr5-e@8bytes.org>

Meeting minutes from the call yesterday are now posted via the usual PR:

	https://github.com/coconut-svsm/governance/pull/27

Have a lot of fun!

	Joerg
