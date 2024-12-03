Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E76B1FCFF5
	for <linux-coco@lists.linux.dev>; Tue,  3 Dec 2024 21:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260309; cv=none; b=O3wFHMd2jO+iJmmFQkQCJdl8eMZFlD5uaW98NKQTAVetb4FCAm3mUkRGDBzezdsR06V2llJcjF6OSWrNWdNgenXmDZkf9ktogykrLTXCRsJyUVVxFYoiN+P9AGe85FY8iDsIkgnVg3Hzeo5yLG89gkgUywsOaQlMw6dRbJpajYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260309; c=relaxed/simple;
	bh=bqiW3Tp60+aakrswDODifRSSL7zrqN/wwmNjZqLBg78=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tf4MFYLM8LKGxkH6I9vvgRvuc+5QA7d2GxX7etNKuiOpD1cTZSGKLvxDfbx1MAI/EMNE1ve4qJScO9Z4DZNglfAF4e8Ea8Ktg7AOwG+stLTkhkrfRAQkMt2nf8TIpPqBZ/ZUtb0ln1oqplWBGhF/mr+PpmTtjXBPFHrXez2JWHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=mA/0SIlM; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="mA/0SIlM"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9CB052C1E71;
	Tue,  3 Dec 2024 22:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1733260298;
	bh=bqiW3Tp60+aakrswDODifRSSL7zrqN/wwmNjZqLBg78=;
	h=Date:From:To:Subject:From;
	b=mA/0SIlMp8CdR97bPmo9mT3Mxw4BmPuUV7p8EcCOH0Q/NZq4I454nROITi3HTG2+y
	 GAcRoO6eMqk7/FUmMKtvW1Yqi5/4rkthzv77jHVR6Tcdvus3/JC14kwnf75fRw40ZP
	 EAgbLEAI18XtKJ+7VE+xqfyjZDJ6DYLOIflWMPqmFa6xMMvKbSon7KzjxFWWC5Rnpu
	 qDUFaNhp2CR/o3VxCZ6FgSo8NJ7fmJceORS4jIboj9fYUlXv8TMgH419qdLCe1Tnzg
	 YzPYIMUcP5SGDbIOgFBmCBA5NrLWDOiSjcTw9ivVM7g1mAYJ0+Eu5n3UcBmMEPOl/N
	 wg9bz/y2cPNLg==
Date: Tue, 3 Dec 2024 22:11:37 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call December 4th, 2024
Message-ID: <Z090CQ10_c1nk1Ld@8bytes.org>
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
call.  Please send me any agenda items you have in mind or raise them in
the meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
