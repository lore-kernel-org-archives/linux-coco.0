Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8CE1BD02F
	for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819611; cv=none; b=UafKxS1jtunJNwWzASOQLS0tZ4Lhbnnq42h03O6wogf6sEra8dOuczcU0r1+n2LH0Dkv5O7qkXlvWIRO08q7d2O7C+hcDNERP5TCopcI0MJAljPlQPMvYpOxqlOmDGTSV1DzVOMd6voW8hGXFBJKOn+kAEt6A1NALCnmKlFV7aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819611; c=relaxed/simple;
	bh=N1djNMrWeOTEnl4Sfzw7lzjXWhV377G4mApmT7sS4p8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSp21ImxJaI6hwuOl7RZBelKWcpxWIJYuOp2mcQvR6lOI7oq4PDc59E83cw67QHoPJKaMvCF251+dl+N6AXqKUkTzWcpXBl+tZTx0FxsfK8FOi0giSz9J39i2LarT/GgGk1c4e6VpPZVzIR+otVCRz1JoR+hSSmRgLSgxpUeBrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=l4eglqj+; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="l4eglqj+"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C33932A2C05;
	Fri, 16 Aug 2024 16:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1723819607;
	bh=N1djNMrWeOTEnl4Sfzw7lzjXWhV377G4mApmT7sS4p8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=l4eglqj+Tkfu388LWg4u1PBhiU1jI3wGeu1tTAqXm7dPrMfsI/iCItuap+QxvJjPo
	 bBDpsjYgASoClDElSAjVSBjevhV6QYn8ul9fVoU+a+i10kXviSShDWHitHOtL08Nu4
	 xoy0J7qgjAT9NZX3Vsei8O3LF1+aOn8nfYUUpRi+GZsY8kbznPfldJ07CLRuqpeHul
	 HhAK8c837yXK84ulGjW5UsU3I7UMrir68O3i72i3Dyw54/v22t8omAa0FcUZrX2/mw
	 P+1OeMAFClj2JvqtwzgVtcrXykPxgFj0Xly6wnbCTLGOUKVlJAHmaqdzkLjRfdzL8k
	 j1/5S1mjJi+ig==
Date: Fri, 16 Aug 2024 16:46:46 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call August 14th, 2024
Message-ID: <Zr9mVgqHOUkzFGfA@8bytes.org>
References: <ZryER6RlLjgUKsze@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZryER6RlLjgUKsze@8bytes.org>

Meeting minutes from the call on Wednesday are now available via this
PR:

	https://github.com/coconut-svsm/governance/pull/22

Have a lot of fun and enjoy your weekend!

Regards,

	Joerg
