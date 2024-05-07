Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25978161313
	for <linux-coco@lists.linux.dev>; Tue,  7 May 2024 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715096176; cv=none; b=gwrN3+UWxaMC75yT64oGtQqnt0MZNA8TbQxh8Ix+KlmH+dXRjK1tpgFMfcQMFjWwwBGOF6JdDVIzOO+6y+goOOrA4T3LeytaJNeLg6/FAkm+9MbqrQV+K4K9klTpqqwkecf7kBJXa5qpRa0AtRJI2ZVyxeJNxarefXhum6/3p9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715096176; c=relaxed/simple;
	bh=1lXgGB0wiDCgyx4/aJqwlDng64yBX2vav+1p70bCa4Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHWHmWrVBIDnfo2xtqu3e6yOBZ0oaVhXf18rkBhbST5fzLo49INUjXrUHEsNEN3QUdzWtJ5mml5NvOpeQmdUDMEdVCnMQae4gq8l8R9G8vndkLsRucm678QwQzMrOTI9aAfuYIL7KHBOt4G172qEeU9zf2IhOypOLrNPYzDE19E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=i69WYCDH; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="i69WYCDH"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 103E21C0CFD;
	Tue,  7 May 2024 17:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1715096167;
	bh=1lXgGB0wiDCgyx4/aJqwlDng64yBX2vav+1p70bCa4Y=;
	h=Date:From:To:Subject:From;
	b=i69WYCDHxjw6eZKhg9agknS5+OpAQ9my8JwdtaSYGSY3ayNMtnOR5YXoEPD+PnnPc
	 nF/e42/FoPWCjmY2sGmBUN+Af+jv2sv96M5azrV8KUa7H3GvRiJ7Ifo0hTN8Hk6FnT
	 GSZ7afspqry1bvzhS5UTkxfOQRmfJ04SRLJK6OybvUw8oWoF08bEtFiZUoGxMelqMX
	 TMMOF8fAnKndYArAs0rHLz1rt5jusgTESdOebbRdJ+1LRVCrl6YXhVrlUORjlR9uop
	 q/a8LTytwR2bZGJHy2g1q7MPArNXNzrS/1HOFcuUBxbJfsIpmf7rj6gEZza0+GLqbp
	 Su6pOiDGhpefQ==
Date: Tue, 7 May 2024 17:36:05 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call May 8th, 2024
Message-ID: <ZjpKZbSjYspLSKVG@8bytes.org>
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

Here is the usual call for agenda items for this weeks SVSM development
call. There is one item already:

	* SVSM-on-TDX architecture discussion and next steps

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
