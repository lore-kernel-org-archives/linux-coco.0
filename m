Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFFA15FCE1
	for <linux-coco@lists.linux.dev>; Fri, 10 May 2024 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715334636; cv=none; b=GL05PSmLvFfZWBsvQ00/kwdzSPhUVhnP9nRAjyq1ANTaRjx4C6ykmPFfGUF4teLElMzK19Fq5nk/KbyEDmQPUFBXWLCF6OQmf3HiWDvqjdK/0wu7U7lF0G+U/neBXVT9VeIKS9ZjPTMvZWziJN+OrVZKm61gxwu8adp322DYGeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715334636; c=relaxed/simple;
	bh=oiveYv+RYuknU7qUV1tRy4eTHD1j16KBsquhMHWRLPQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tbk9ebm8tneJaHIuO9YK6dlzp5xXm1GpccvvNHKo9KrkEAwQM5ZaWuEzytaBFRyxjsUlOXeWt3XSypQ169eTrYFg7/Ej8FVAhrLbBiSvBsPxqNnXoIz3rFjFWurCMcJQR0oe9wmExGQw4pOX1lrFmBFQWt2Ns3jPRIoMeDO5Tw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=MbHoGe8y; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="MbHoGe8y"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9115C1C278C;
	Fri, 10 May 2024 11:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1715334632;
	bh=oiveYv+RYuknU7qUV1tRy4eTHD1j16KBsquhMHWRLPQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=MbHoGe8yUquVdpC8bQhghjBkJkzS7icqftTC58jMNK2l0AVDh5Fd36vmfc4ygjPQT
	 qLRRcSZN3pL1mqXuyYvE6KqIp96SqsVHexaw7DaeFJOjj/UvZPP213RqAJAWDAtvYe
	 Ys39po9F/b3oUjKUQIy9nvPPpN+NYgqxJmxmiRXSWYfbSwBXjdOOu02nbdvhlAcmAp
	 0IUuFSg0B2Z0ddi11bRjv/J9rnC/hn3goZfs3MGZTcNTH6FDKXdHEV4M53A3QixkQa
	 +DuGzVoUarqJG1L9/r0EKsBkjMhEYfA2guyn4ylMJM+EDZLg7qByPaX+h3JKiFyCW9
	 KQiIZzFnY2QAg==
Date: Fri, 10 May 2024 11:50:31 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call May 8th, 2024
Message-ID: <Zj3t53c-3QB5rZAZ@8bytes.org>
References: <ZjpKZbSjYspLSKVG@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjpKZbSjYspLSKVG@8bytes.org>

On Tue, May 07, 2024 at 05:36:05PM +0200, Jörg Rödel wrote:
> 	https://github.com/coconut-svsm/governance

The minutes for our meeting on Wednesday are now sent a PR against the
governance repository:

	https://github.com/coconut-svsm/governance/pull/12

Thanks again everyone for the productive discussions.

Regards,

	Joerg
