Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129371CB515
	for <linux-coco@lists.linux.dev>; Thu, 21 Nov 2024 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732187168; cv=none; b=TcFzv03pb/OIaexSWBb1WSbN2NRgna3Ugij/ePAqvw1xfkmgpEVJ+SxBvQY/Q8T3TV8D2ykcT1QJDLnGUjuVTFqabmQcgagGTe+6Mp1dOHFULg/TyV85mM7xxVYq1xIFjiVdBBYA25VyryB67MZr8loH8LATNtTfqs8HFmwO5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732187168; c=relaxed/simple;
	bh=Z25uVMNWBGsE5OLZY7wkqXXjGeTUonVkPxTvuJGAi+A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwLBYYvew3FdRB6BvqVzFz1LlCQTNR/i66nSTuRhN9pnglce4hGTAJp+lrVnoD1UgTHCdelgD4sAmbznvtFmVXFts5z05azBklZtHeMg2abDzzcF7PV7XeZzpCxlDmACny8wXAdFzduna1BKGaZP7z8JSX0CqZa78hIrVYk16YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=RV0veguf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="RV0veguf"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 181512C17C3;
	Thu, 21 Nov 2024 12:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1732187158;
	bh=Z25uVMNWBGsE5OLZY7wkqXXjGeTUonVkPxTvuJGAi+A=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=RV0vegufrY6W6aJLUGnu21ousqF948s3fh587f1caHpgWvCRfkU7/9dP8wIKAg8MR
	 ZOFqwmYrZVXHG9c0RwHMJN3wyKL1GNnxLbIXxLTl0QmWQEt0k6/wWOhYxS+fvY6+Ej
	 X3fnk8thofimP3TTgJn0N3YwvaLd7t79Pgv3FqKyj2SumiIivLUOGFWq+LTbgO2GI2
	 94H3qRs+haqBcnoLA9VYUAeSaNQ/wETVssYoUrTxOJD4XOqKeNserNj9xJ5qqaLM0e
	 HSxyVZmKP92912IZitqS49ysNQeoomgv2iHZqs1x6Ssu4fWz/LjWebsjPLgJbhcumS
	 H7MZ7f721c1ZQ==
Date: Thu, 21 Nov 2024 12:05:57 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call November 20th, 2024
Message-ID: <Zz8UFcXqSjxeB5kl@8bytes.org>
References: <ZzzJ0-ROnSW0SZ1G@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzzJ0-ROnSW0SZ1G@8bytes.org>

Meeting minutes now posted in PR #34:

	https://github.com/coconut-svsm/governance/pull/34

Have fun!

	Joerg
