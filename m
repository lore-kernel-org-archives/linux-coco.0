Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99021C147
	for <linux-coco@lists.linux.dev>; Thu, 19 Dec 2024 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597987; cv=none; b=d98fQw8HBBLLfVFJ5JqW7PKQM8bfTY7J4lmEoFSp900ccOnZe8qVYHmpwxSuEvCikbyAHN7U5NiNmu4wc+geaTQ9u5WKvgFr0DnafrGFMrsPWXRnUd6DusHDFl5eVjGOj4kd8EfbFzx7VKvgriwqiLdzNZYxhhdP0rmRZVXodKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597987; c=relaxed/simple;
	bh=XoLIb7hLRqdqYo8MCdlPVhFRsCNawojHT5B5ZbmUlB4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7BStiCFiGWQC4iE3P3M93d3gn86CdKBGhOuHQwKahOKn5ReYjkFsFsn3EeO40JAWSiyNMaLtY/P2hQll43xhO8V3HcuR4/5Lf+4Ua03waBVZwfu4oi9qAe+nGo2DZTsGtILOPb4OSupo0zrwiRXI1Y+FWlbBE6d3fN8D5PN2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=fij/6N0T; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="fij/6N0T"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D617D2C269B;
	Thu, 19 Dec 2024 09:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1734597976;
	bh=XoLIb7hLRqdqYo8MCdlPVhFRsCNawojHT5B5ZbmUlB4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=fij/6N0TLkm5/Lv5RZb43jvx6bs6AU+BJqE7ttNfntkv3oNWC14NQMprjH9zN7C81
	 QvkkMk2jB+KsBG4hPgSfXcEpcLW9w3OXQIPlHVuGLrUfAF6hFXrm+XFxPAogaE50dv
	 36SLZAz1uextFeDV73H0QddZ34zPX9fuMtOvcv3TrSUs+N6YmSo7IJToB4gmN96jRc
	 w/qyWoHEVWk4QOQKHwvt3ghKCsSfDyv/kWgumWYHisL0afVlRprvvwFFRKnm2QTP1w
	 mPrgUjLwKnQK0mMH96Na0yWuddHzHX0m7fMBwok4Veo5ipsS3/e/eYhVA07yEorfzG
	 nlz/13DD59cSw==
Date: Thu, 19 Dec 2024 09:46:15 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call December 18th, 2024
Message-ID: <Z2PdV_5WRhTNXGdq@8bytes.org>
References: <Z2G-knjoWeL2hLyt@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2G-knjoWeL2hLyt@8bytes.org>

Meeting minutes are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/39

Regards,

	Joerg
