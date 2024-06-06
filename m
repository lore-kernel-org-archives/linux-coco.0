Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132AA38DE0
	for <linux-coco@lists.linux.dev>; Thu,  6 Jun 2024 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658691; cv=none; b=sf02FtZlH3I3HoU/Fo7er+qrFklJlDk3UYHdjeEMs3IYiOVQO0WASdQ+CnzmkiHQ2shkFaZdAswcGboRX7PGPEBXF5v5Lkg6sFLj3u6NBOaIyCMGndxJ1RI0pPYGQpAwSaMZtHfqKhs2GZd58I0w7nBouGRfq0xN3e9vIdKa7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658691; c=relaxed/simple;
	bh=8LTQZTxhICq8niqcrx7i1siMM8hciJ6gpRJ0g/69OKU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ob38pl4Hden8FS1B9/tRwwQISqGarmCOulDccQmhaIW73amLjD+QMRHMFhqebePEwbaBjqJ8CFj6TAO1Hj/SkiKElHdFJBvZ9jCOWQZ0IWIe5F3JFZf9aDBqqYT1Bx84Q9WV2UBSQNCfEBK8A8auYJ8y+HuyNAlv+/l9psfPl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=63ZJE3g3; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="63ZJE3g3"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B37AD1C53B8;
	Thu,  6 Jun 2024 09:24:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1717658681;
	bh=8LTQZTxhICq8niqcrx7i1siMM8hciJ6gpRJ0g/69OKU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=63ZJE3g3rXpFZBEAWoLZeAqDmHthlS3XRB39egSFGcW5V62NxvaGFGk52VOYz912f
	 CqNU++drzjEhj7vGmIQh8ZA4r6zvzFDI5Km6xMTDvhhBzHAOJUGAr1YOb/kBclqwxJ
	 up1PHZrj/BBL2IIs77BopDGFRq3pgG8bRNq5uJ8iOI4Yz70eLFL2Fpp8oWL6UIfyCM
	 fgWoaL0/r0ok35Px+zVXq5KV1VMg+8Ek6IqDgpNXYusq5A4oGPTFsbaUm7eYERr3F9
	 m+EGfT+yoADiS8ePZYVARCsEJ47v26+5GojAzd9tpJ9b0vooctab2FLSBWDh/0dFDX
	 OJCRtxikAUbmQ==
Date: Thu, 6 Jun 2024 09:24:40 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call June 5th, 2024
Message-ID: <ZmFkOCa6u-9MG5n7@8bytes.org>
References: <Zl92cXKqMmLkiKfq@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl92cXKqMmLkiKfq@8bytes.org>

PR with the minutes now posted:

	https://github.com/coconut-svsm/governance/pull/16

Regards,

	Joerg
