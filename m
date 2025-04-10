Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1361E1023
	for <linux-coco@lists.linux.dev>; Thu, 10 Apr 2025 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271319; cv=none; b=NwQEkYwe68lUOtcRug0q7sOc/3uL3eMFBvKW0ZqpJ7bRaJWBwrvJfJntPVet8igTzqra7xAlKPngS0FBNywyy8zTdvu+E1nmk/K/LhxoRw6jQ8iy0GjjQ3v8PzaNJMHVXNk27LwMbG2WmeAjmJUOUZUOCgMAptY2mRbqrNQVMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271319; c=relaxed/simple;
	bh=0tXZrsf6f4Aj+AalxpFjdwlgpHRdctYGl37Zkep3jmo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHfSFuT3nd/HwDr1MHIyYeAbXItNwVs08gqHGQ0Jd9p1SgKKQUzw35AU4LKSaSLrztKwqOJmKEU9lC92EPTpJ5+VbIGIePaA7SM3SiTmtNSJ21GpkDZrEouSmkYnbevLS+j2FzEvHA66nFoJ2829nJfwZTYXQ84IzZZTD3Wz9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=4onTOImi; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="4onTOImi"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 759AB47CAC;
	Thu, 10 Apr 2025 09:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744270966;
	bh=0tXZrsf6f4Aj+AalxpFjdwlgpHRdctYGl37Zkep3jmo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=4onTOImidi8vjtgI8Aw9wcf6qRkwPNqqTVxh5wTb/yFhLvauhchXd0ZsB/oRsu96H
	 jDcVZpFvH4Ye1QH9zBZDcmi3VHH0MuKYeCoS0XyZMrx9/zGttzR27YxBmWX58cEVDq
	 kfb/bc3HdzVO20ER0C7rncUUsLftMFhr5HWQ9SZ3LPZCMLqWBPTYDpbdYcIHTvGhmI
	 n0VpS5slduZPntlZYlR2x9vSJXKRphLXFYc8XT1VKYDCvhmtDOxTa87gA8Cu8k9GJ5
	 aiFPNXdDw97h3XhDj1LZF1h4nUkTj/PM6vWw92ybZqogD5pRN0rvNHM9D1l7YDNm5g
	 nKCJJNx2wCixw==
Date: Thu, 10 Apr 2025 09:42:45 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call April 9th, 2025
Message-ID: <Z_d2dUgvZ4vSNf7X@8bytes.org>
References: <Z_VgmBYq96ShGdhr@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VgmBYq96ShGdhr@8bytes.org>

Meeting minutes are now ready:

	https://github.com/coconut-svsm/governance/pull/52

Have fun!

	Joerg
