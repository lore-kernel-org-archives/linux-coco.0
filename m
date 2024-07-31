Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC691AB502
	for <linux-coco@lists.linux.dev>; Wed, 31 Jul 2024 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722440938; cv=none; b=iPNJYU6L0qnGP7ArXfiuxyLZT8+Jr7dqoyJnJTlLy3sBRjXcSZgYUv1xlelKlaN/PFKzmgVqAp6rZJZAKD0XldbCMKhnV7UeHq6/YN2QbkSKYhfUwRpU2+mSaiOWlrCr/TuTFLg8qV8LwKzCYiLMNIpuV8SnmMscZdyCCvBG4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722440938; c=relaxed/simple;
	bh=8MtVYQJyzMjuD2LgXZtF07C/Bqsnrcvv8Udx91o/HFI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGGabFsldlQ0GUh9iSLIxwMOeMHDgqOohyxmzNK6larMznGvYoMy7weF6iBFxAGUXcdddPVjlWngtNNN7QPE3P73ia/dH8p5pISocjTZ5uMQKFIwCQdw6swTORreEFY74IIT1nVq9fFxANfnhtlD86jDKQfhsfENgt6Tu/7y7CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=eT+ie6iw; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="eT+ie6iw"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C92562A3E44;
	Wed, 31 Jul 2024 17:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1722440926;
	bh=8MtVYQJyzMjuD2LgXZtF07C/Bqsnrcvv8Udx91o/HFI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=eT+ie6iwguyM33hgurpNTC/3FxV0Q4PtwG9x5PrL9PgyHQE4wSMiRIYO0eD806YH/
	 HwYAhVKJdxrduTbD395iKaVGLS3DQWbOImmDDgYXcJ53eVH/Q90JLkmeRL9Xt2g3rc
	 d0eP/Sgf7Dy7j4HezMyeBudSq6qWEDCWnNHbsC56tGGlOoF2uxSQEbfc1W8omqPOSV
	 WI9+u5tryHLpctbGrZ5jGKCHw/KCdoYsi3iTomDfkRiMRTeRxRo1WTRZZOP1/TzNSg
	 F5D6YKrkAPNoyMyKd7NPHbHPMsqvRZ3C2ZptRQ72ioN8zADqZZYmXadaLOcz4AZMAV
	 a0mAcxWO5HM5Q==
Date: Wed, 31 Jul 2024 17:48:45 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call July 31st, 2024
Message-ID: <Zqpc3dbqxorynrHy@8bytes.org>
References: <ZqkGwtfMx_OisW6q@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZqkGwtfMx_OisW6q@8bytes.org>

On Tue, Jul 30, 2024 at 05:29:06PM +0200, Jörg Rödel wrote:
> 	* Can stage1 be removed?
> 	* Pros and cons for requiring specific stable Rust versions
> 	  (tied to PR #428)

Two additional items:

	* SVSM BoF at LPC?
	* Stack unwinder issues update
