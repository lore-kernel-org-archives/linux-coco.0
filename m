Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B92B1714D7
	for <linux-coco@lists.linux.dev>; Thu,  9 Jan 2025 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409500; cv=none; b=ENqD0XRDca3S12DgxXrSeC67zeONKTmG0P5XiTCCPKsKy4oU0Iu5pzfKBUcC6ClmTzA518X1VKABJBdOc/ouHK3Z+NKdMSSPoYL5UHJv8f542VX64QE4VHNP73zVo0nD/iFv2/qJzcicUFzEWXeoRx2rN7TbfuX8+VX6f9YHvFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409500; c=relaxed/simple;
	bh=b8y0kyWdoODg7vbWe7x2VurwchytxfMo5pmjduWf28g=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tavwQByJUY7gg5wVALeNmwsV4c41SuGR+sgqbGh/pe/tGf6WWyDjUItPo7qcuC32zo86LTdhx68x+oolDdVFgeT1L6TyM/WBJnuyAN52YnqtPRFY7CL2E9XmLt+amz1036Bn65sn6We7fLU/A2XjTsFHr9vcp9jRLH3lTCWYvKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=QiCL8kgQ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="QiCL8kgQ"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id CCBA42E001D;
	Thu,  9 Jan 2025 08:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1736409485;
	bh=b8y0kyWdoODg7vbWe7x2VurwchytxfMo5pmjduWf28g=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=QiCL8kgQ3J0ylWU0t5U+erEL0hAvKOFx/PZVAVMfZxTaOT+eU9bj/Yoq9MQ5zZxUE
	 86b4ssObsia2Cj8yDGlE1gppnhzJltlkPbIihXI5O9vUcfk//Mw7gRP+haSqb1hsNf
	 fyg3EV7r3qYijnzHI/FhWppLlEgidyfLerSghuMAcVY6MfxQldc3OOcXtLQjwaGILv
	 2oHC42MSoH6rx1G7owEZLW/oGrJGSeLbMvlHmmjP4eT11FT7WTEE7+SaMMsZIUWc44
	 GZKSfS1OVO7QB5aUz8DFPM25CnK959njY1AmrH72rZ2aMmUqXoNZ51zLR+Az0pXxaC
	 oG8cx3Yqn4beg==
Date: Thu, 9 Jan 2025 08:58:04 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call January 8th, 2025
Message-ID: <Z3-BjM3PXxsfTrpN@8bytes.org>
References: <Z31OYDtmN3DRe3oN@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z31OYDtmN3DRe3oN@8bytes.org>

Minutes from yesterdays meeting are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/40

Regards,

	Joerg
