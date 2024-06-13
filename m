Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39F813C3D6
	for <linux-coco@lists.linux.dev>; Thu, 13 Jun 2024 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264487; cv=none; b=gSQ4rHKJzl4+rRzWHGJaxO4L6s817imEaHq4WZGoEU2onK7yNcDx+qlLTx0FTK7jWHarWqndsaFCLnDRDDsW1tqAcBEc+R/PUcWvvJxcFLaprRMIkr1ML58s/ChbKzNMMSHLE5EztKdzVFVLA0TLnzEZEQzu50kkgwQ+0Eky428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264487; c=relaxed/simple;
	bh=tpVOXS6Ad0diK19e1sIcWrDZVkiKAHP4wYKANUD5TuQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVS6ycZ01JdCahLBO+8RY58Qs40qOcJwE+iNjm+JNPg2u2/Sy93DIK1mrzi0o6kRqQGhMdpWxrlzM0gOIy2zlQd0L3Uq7obXVWruXYQW+LWtl7j67hX3zmsXE0OHPirs+CdwXEVRuXcAtEkAjNz7OQdaZhiJ+imU86kKIqgP8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=F3s/yeVK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="F3s/yeVK"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6BDC81C6D08;
	Thu, 13 Jun 2024 09:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1718264482;
	bh=tpVOXS6Ad0diK19e1sIcWrDZVkiKAHP4wYKANUD5TuQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=F3s/yeVKXx3sBOdOCghgXdvzWRX8wAOF2lzPjnld90As5Io5gtfAD6FAD/KWrp6Hk
	 BCVAYPu3RLgTLUSP8mn41kzOVHxol706Gl1v1IZTqM7qkiXm8tGpT4FQzqjprXE5J/
	 Ko/BeRjvDte4tlDY5XOIhXKF+KDiP3yiFN6xSadfasELgAPumWcanZ4neMhS9LZ+p8
	 eD2V4WAlQYxqDDHncyyEwQhz9O4P8pWVh8KEYYAvuegS7egEQIYX8yJ+CNebyk9iJ3
	 OtCQUN88HQABK8INH682Ow95pXc791OoPDZlYRD164cVHO3Rbr0i20v5CX3Eu68YSZ
	 lnXf8KYDKWsog==
Date: Thu, 13 Jun 2024 09:41:21 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call June 12th, 2024
Message-ID: <ZmqiocRs5IbBKooi@8bytes.org>
References: <ZmmUZ5-DoVjKtoE3@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmmUZ5-DoVjKtoE3@8bytes.org>

Minutes from yesterdays call are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/17

Regards,

	Joerg
