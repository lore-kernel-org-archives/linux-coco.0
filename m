Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5181482E1
	for <linux-coco@lists.linux.dev>; Thu, 28 Nov 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732780601; cv=none; b=VCUfBxyX/CM7v2lZXJIQLdfU9+T+6wpZpDUYU57q6gg/9DS2OjsagUjt/Yn+R5nk6S9B1zEdYAEwlDVZ3EGgUqS59l7tDgy/Qfmy79ShOi0ekgOpTKshpb2eYSL1SoM9gbZ2uRaH4bylp3pVsacs0IUYoycpP6yCBXJz/z/Um/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732780601; c=relaxed/simple;
	bh=w4PaPCfC5zmL0vEpJWaWYvSfI0HQ+HPOj8IZtzAw59s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvI9ynYw61IuLA28HULRuHs5/MI7/CB1glqUh6zW6IXxrZZAp/dzYUqiQrQ5Aq+5G8+O/NFbYcGoZ2Kv9auWZYilANuam/G2qALReKkuaxGKmRODW0Pf71iE+Ma6jjtOETxfCOghjzkHY4aPmc16JR+8hv/IjhmwhuQh4ckgJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=pmWLOkw7; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="pmWLOkw7"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A121E2C064E;
	Thu, 28 Nov 2024 08:56:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1732780591;
	bh=w4PaPCfC5zmL0vEpJWaWYvSfI0HQ+HPOj8IZtzAw59s=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=pmWLOkw75ZOGEcCES9W2cER8sH5kTLGgbq5B+ygCfsrkpyFvKCBDWo5xcZLYKS6C6
	 A9N5ZaRX00u0aBSNpp7oBFqBs9BBl3PxGzuEJxcw3/5n6naWF4FHFNgzLQmKgvv2r7
	 EyxmrGAXSB3rd3IbM3VZG5O8TxnY+lU+m1vlfAUgNMN7grAn2GHBU6UKK2VLOcoBsp
	 0HKbS9msk+IyaH/QIfAOctvY4uerB5Op9MZVStxxrCgtbhhkXTvfIyf1pM9jHk2GGX
	 Ih0yCtIkY097pnNB1pS6R1Y6zXaUsCude5gCk3j6MFYgUJeP5DK9dwmstYR4iZcEeE
	 dAzIUwjp12s4A==
Date: Thu, 28 Nov 2024 08:56:30 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call November 27th, 2024
Message-ID: <Z0giLivrUAqN8CKL@8bytes.org>
References: <Z0X5ebN6KE05gOR9@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0X5ebN6KE05gOR9@8bytes.org>

Hi,

Meeting minutes from yesterdays call are now available in the PR below:

	https://github.com/coconut-svsm/governance/pull/36

Have fun!

  Joerg
