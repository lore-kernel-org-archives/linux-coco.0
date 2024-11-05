Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2854134AC
	for <linux-coco@lists.linux.dev>; Tue,  5 Nov 2024 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794291; cv=none; b=EhEzU5t8H9rUpnRt0GkRhZ2w7Cz6yAh9lLm2d15SkNviRzUVueC3mjk00b7HCyoSQUjv7Zw6qhNPkJQa7B7rFsk5G20b30SLNKBF9Sry0SrDeCRX1NkSIy4zw7W2ML0OdMjlHFLdG2nfr5YSV//MmnnhvU2s7ZYx9e7HtRivfDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794291; c=relaxed/simple;
	bh=HAuTt1MTYy6QoFdQ+j5IEurxM+gGXLTif+l/B/fKdzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd+fM39e4qI4jURKgU6XsCQaw1yIAx1FiqG5HmulclbgMhEnIx9/uQ/7b/5y8hP+OuSLb0+1QRJM2DmaEAUj34kTJ9e+tzZGuAhyiULTPC/Fy9YgDNQyImWiFIQ9yaoBr/4HAt0DovAeYPtFRdYQnY3zbLbBPuRK4yRW3iwKtTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=mWnqpQGt; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="mWnqpQGt"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B32B22A958B;
	Tue,  5 Nov 2024 09:11:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730794281;
	bh=HAuTt1MTYy6QoFdQ+j5IEurxM+gGXLTif+l/B/fKdzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWnqpQGtr/RGVr3q2BJaOgMlNxflIkas3kPZPcgMTRZ3vYqhj1b+0Q6jk/YfOFTPV
	 9e0I87iaOuUp8lzqjwMAyIarVvL6BtxkoUL83tt29vBSjfxGUEf9ycABTFlkZdxVQu
	 BgFSR4sN3ns8u5CUJfN0mpV2NH4/uurfMiUwnEKj+02lqJFSCVc7tSXib4/HebMDEj
	 por2ZQszOihB6JY8xa79JDg7Y7wsWCmLsZOZKYx1GgTyWdASiM88TAkaXUSmehusge
	 bgVgUodrrgb6ZOzERc96Yqmj8sK05y3VM+fBQFUJsLfH5TTZUa3f7Zz+nyv6pLAt1m
	 CEw8nvlcSuACg==
Date: Tue, 5 Nov 2024 09:11:20 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Cc: Ziqiao Zhou <ziqiaozhou@microsoft.com>,
	Weidong Cui <Weidong.Cui@microsoft.com>
Subject: Re: [svsm-devel] SVSM Development Call October 30th, 2024 (!!! Check
 meeting time !!!)
Message-ID: <ZynTKKmMQPbL--ug@8bytes.org>
References: <ZyFPW7yg_EVUTlPU@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyFPW7yg_EVUTlPU@8bytes.org>

PR with meeting minutes from last weeks call is now open:

	https://github.com/coconut-svsm/governance/pull/32

  Joerg
