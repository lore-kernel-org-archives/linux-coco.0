Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B67143C4C
	for <linux-coco@lists.linux.dev>; Thu, 26 Sep 2024 08:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727338595; cv=none; b=YOrmX7QeqoGJ2z7EWaSOVWfVn2/3nlQhpxKtPLEw8aVtNZNO42EY4iBfSu2olMCdQujYjPWPegApaf+RK31k3lweS+OY+GjkpDayfYO1DQI0DlvmT14hrWjWgbOECP4c8Ypr4UZ1F+bnb40CX5szQkdM69B/xlLFmM9askk0rDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727338595; c=relaxed/simple;
	bh=OySh2EG9ccXsP4vkFBhXdNUYGqpdFGEScmN3jscia08=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKxf5iocOW+NH/qkAdjjus2sNRTm+sOeLxMO/cjd5hovYrmvsUaX/oFCKqCjfjsx+H544vfdUXMaUeYQeTrbQXFVmCrFFzAY/JItBW3unDT8VGynFo+EpCGyOLi9+GRkn/4WaUog8vIhRFkGiRWqpwmu6aPxUPsN17Skm6foNSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=XPnlB2Cf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="XPnlB2Cf"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 81BA82A01B5;
	Thu, 26 Sep 2024 10:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1727338576;
	bh=OySh2EG9ccXsP4vkFBhXdNUYGqpdFGEScmN3jscia08=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=XPnlB2CfTcm592LPhrorFexRaSq3Avw+kTmsWSIAfwxzyPJIfne1AdjA6KLhBrsNg
	 D9C4mHKRZf/vrf4UdvtbSY1qo9iQLIwVOo/BN4Iv9QoXlp27xEahNr32mZAuXxfKOQ
	 ajxXqrlzI07kkudBgwlDz/PY+GRvdHvaUi7XH2kt7Bm846JsyD2U3XFOPL3ZDp/ooE
	 SNOcvWpj0hIPiGeUH3QseTRU4uawNMSJx5ijz8y+8P71e4VS7YSKIbjE9to4v8Jw5r
	 vntfj8COVwCL7uI80CkEF+6v4VooKkXxbMTFyefhQKPIlyHYz1OklUT526pDek/aTv
	 BZuOnYuyGDNOg==
Date: Thu, 26 Sep 2024 10:16:15 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call September 25th, 2024
Message-ID: <ZvUYTx2vVe8YXbDV@8bytes.org>
References: <ZvO8-t7VtVeZGiLp@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvO8-t7VtVeZGiLp@8bytes.org>

The PR with the minutes is now posted:

	https://github.com/coconut-svsm/governance/pull/28

Feel free to suggest changes as needed.

Regards,

	Joerg
