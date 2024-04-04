Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482F948CCC
	for <linux-coco@lists.linux.dev>; Thu,  4 Apr 2024 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712217847; cv=none; b=hsf6ELkdIHC36d8p7nDwNrAzd070Ul0O4NzEI6NE7bkH0Dv2mnm/HKVFqlVaLhOi/kM5hYMxUNZRdmAIGX0OZIzu0N9kkVTjXPrjL7EH4hA0ljsNOSxeA52Hjq4h+kL2uyWWkZuv/b/nTLnonWtHpUXMfivAOaordcHYRZlk5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712217847; c=relaxed/simple;
	bh=R8LcxvfTc1DjuB+zF4WPxuwk747NekCsbw0Gms40h4I=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwQ3hHAy4H85yqEMxf1qBKkkjzpLE82Ql3aaBVZep6RwMjfi5sOCFLFb41+ztXf28mRsNdRF8jXtgX76LlmcP7PZ5GJNDmCEriA92mlEJI2mh2HDgSVytoAMAoZaflRQvdGm9oSSHaNhGyaIuhW/El9OemSoBjnMF7i6AxA68Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=R9UhIKjX; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="R9UhIKjX"
Received: from 8bytes.org (p4ffe1eea.dip0.t-ipconnect.de [79.254.30.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BA8092813C5;
	Thu,  4 Apr 2024 10:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1712217843;
	bh=R8LcxvfTc1DjuB+zF4WPxuwk747NekCsbw0Gms40h4I=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=R9UhIKjXIqN9MCNGxmgpgd77jqOXOakrh5SFHDgiWnxQl/R7wBZfWSYFvXdTHuGoD
	 7JLcWdGdBR3YgsgNtS4SRqlEPvdplzxGlpfwDBEK3sILwMWGmfalML7/b7Qdik8Lj4
	 ZyKdDSuW5g8MJq9FBq85INTuHpbUErE37JYmPGA2vN2h8lhZKNypHhoEzXOYe3XVVb
	 dEaYk9h26vUmxTgMn0uM4BU9c+VoVM6Je2dFK6I/4HfXokXDaxPOOMyYDZBWlnG+tg
	 7O5NUSl8Q51oiHdVBmCYnQkDYyB1LCNhU7OLO+cCIBrYc9lOjekry3Fc6QDOCgIT+U
	 XhrPoIwwRVvvw==
Date: Thu, 4 Apr 2024 10:04:02 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call April 3rd, 2024
Message-ID: <Zg5e8k3KwZFQK6NQ@8bytes.org>
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zg07c6Y5a_Ak5oXs@8bytes.org>

On Wed, Apr 03, 2024 at 01:20:19PM +0200, Jörg Rödel wrote:
> 
> 	https://github.com/coconut-svsm/governance
> 

PR with the meeting minutes from yesterdays call is now posted:

	https://github.com/coconut-svsm/governance/pull/9

Regards,

	Joerg
