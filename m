Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F55038FB0
	for <linux-coco@lists.linux.dev>; Thu,  7 Nov 2024 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730969410; cv=none; b=j0bEjZqbPUYEEOupt4TakUmLt9W2BBJxZusmx8DS70aKMXl7LyB4uUvEx+Di46MiUNq7DCJIVplyYS3zFl0dYKxtZD/j8W5mIx1JVrwlW5SAGzUW7I6vYvBp0tzSbPa+8As7sLXsz5XtP5/BcSCTtAHd5m64tydueDMWoY6hXtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730969410; c=relaxed/simple;
	bh=+44c4Hfx/OtIYTiKCcOoh2TywYFITNTBS89Q/GEUTQA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiH8eUrHmXcravDLop3uqiqHJyuMZsV5q7nXE8RcfWWZEgOFar/yvLnhICAJhRIm33PAUwRnoE2KH+Wf2aifGPywX+gmS6f0kbxDZxzavI18THQ9G/qCEDCp03wxycdD9tA2RfRShZJriEgCEAiLY/sFsbPIEHAXkiRuqtKEfNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Zm80ubIG; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Zm80ubIG"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4B5C02A9B86;
	Thu,  7 Nov 2024 09:50:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730969401;
	bh=+44c4Hfx/OtIYTiKCcOoh2TywYFITNTBS89Q/GEUTQA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Zm80ubIGp+8nu0taiQ8MbxPoiFcbyHQu9Mc24ynkpvc1K6PNtArNmQ5Tvab2FH1Qj
	 K5+UYnkkoCB2nNctfH+4ryz/rjXR5O+wHrdkYRmYz5UZ5FVv6N8FjNxnnkQhE1CCwB
	 C6DKV+56PaMLekAt79rqLzA0JwbrZpBxRs/IicQelGbJ+ziqf6a51r0tkykmbKdVra
	 ZoUih+nDHtTdlpqryvggUeL/+Ppd+aXG85eag8eItxdHvct4C/FvIoJO99bX8u8nsS
	 0x60GAaIVBmcuKmOuHvakrZKCczZ8t+6WM9di3XA4emojy27e9b6n1bcWB3+nGYV1z
	 rNbrr7f1QE0Uw==
Date: Thu, 7 Nov 2024 09:50:00 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call November 6th, 2024
Message-ID: <Zyx_OIuMSd_bZlEN@8bytes.org>
References: <ZypQEMu0tgeVttBy@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZypQEMu0tgeVttBy@8bytes.org>

PR with meeting minutes is now open:

	https://github.com/coconut-svsm/governance/pull/33

Joerg
