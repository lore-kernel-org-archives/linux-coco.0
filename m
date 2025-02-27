Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AC82222A5
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740645600; cv=none; b=Efb9pypcQleS2gxWE1pPXPNo/pz5YUcJhcZa1PXICILjuc3fU4Uv6sItGK9VH4HkvNXrOjpVE+X8Ja0G/Xsp+Ubbjc0LgDkRP9tEgk+Knz4J15S5JSphPT5MCwNJX83NBbPbJKCDqqfSjh4GsFfJYfkvYc07VHO6N8pPO8nEH/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740645600; c=relaxed/simple;
	bh=y59QjIcLfjFjt1pNpO2eyc8kZZhyw3XsTR9ldS73Dc8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNPbamAZomOla8TNJG9+xL7rcwqaSKsLx3H16Ecu+4AfXBSCANOCe5MBnIaaUn26K5diAbWazpgsb667q8NUrFduPbiSvA6DsqBzFMd+KoBmtcEmPCuMifdZdBIzoUI+zV/+EursjDP9CBghfzMwNc5Pd5kueUhJilaCvxohIq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=quNnpsFH; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="quNnpsFH"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 374B143C0E;
	Thu, 27 Feb 2025 09:39:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1740645591;
	bh=y59QjIcLfjFjt1pNpO2eyc8kZZhyw3XsTR9ldS73Dc8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=quNnpsFHNPc3gYg97mM/EsQCvbrbvOJPSheoHwaVP91BhtyiCbbe/2Kx5x+K4uA/s
	 9TO4L/PppdXVLRJbsF6gH1T/lt10j5hVBGogaCRAJm1rGtoVQrDc6svelKuZcOy1Mg
	 oeN2u8Jy0PJJmu4EQ3FGSVfotX/gg01vGWUWYbI8zaxveQb7XnYAqeZz3ohRJSDefS
	 7RH4XVH2MUoJILfyQT1VRZmS/3mKMz+JGyjLpnCPqh/4SOfk+qyfiD8uNxJ1Uvlh3m
	 LNaA1Xd/OQkH33KGjE+FT2MAqSMsNaebZw0OHH5FsZ9y1Q10pRyJ94n9igGdqtGU8b
	 G+10mg7Sj7osQ==
Date: Thu, 27 Feb 2025 09:39:50 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call February 26th, 2025
Message-ID: <Z8Ak1tgXN3vs1nUx@8bytes.org>
References: <Z74zNJjPvsnSlotP@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z74zNJjPvsnSlotP@8bytes.org>

Meeting minutes are now available here:

	https://github.com/coconut-svsm/governance/pull/47

Regards,

	Joerg
