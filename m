Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D931F419E
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741114624; cv=none; b=lsMYPrHNq8XIt599wOOOHLZ7zx2HqWr/dkt21SJTyKXew7kUcY0GD1NZ2I/6C5KosjhIDFTpCBIsxDnkwYu6uPp+SL5LQcVtNeBXPAVr++zH4i2zUNmM8VM2ZqGI18qrQBHf34+v2fxhN73+eTgDiwBXT8Zvb/XQqd27el0tRiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741114624; c=relaxed/simple;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSrZ1BlPbk7Ebb96NuGsD1RLRn9uziU8wQl+KBCojBwhuvhURcEs05Nn+OMyR0rI0tlJ+v8M3rqc2hGwz+Iolad2BmmfwituDG6iJWa1ee7VfJT54c8qEF/eQnlgu59hZZajOHwDdUZGeHsVSWNsUZ3eieIQRkQvSp1WDd6Z020=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=T5pKGvIL; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="T5pKGvIL"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8A09E44512;
	Tue,  4 Mar 2025 19:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741114614;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:From;
	b=T5pKGvILVPxyoR8hiCHTVFEjK9tI+wdAgf+vppIJ83K1urFhF7OjYcOgrJ6VkVJHd
	 p5S2TXMiomKOKeK9QYmwmc3oduRN+HFCF0fr1Z1CDrLS0RLqUik6S37OHpwI7SSthy
	 MN0rLnWeATn3EPhE+N6XZF5DmBiaIShB9YchxSxR2xJk90gAzdJ+fqCNG4cOKSJvVf
	 +YcBB1wAXIJZwWe4lwqkuk7tgKQ7lu9/eF7IG+JoaUCWpoODdnT7f98cso0GudyQOC
	 uM/P/fe+nNK4DSm3IvJFu7NNz1/Rw/5B4hUAx/CNzIEERyZsj+pokNBzZF/MeCGtKC
	 GltXezlGeE0mw==
Date: Tue, 4 Mar 2025 19:56:53 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 5th, 2025
Message-ID: <Z8dM9Tp49ZFR50lJ@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
