Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A4A21CFE8
	for <linux-coco@lists.linux.dev>; Thu,  6 Feb 2025 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830951; cv=none; b=Mx/lKyEUcKDSIxR9wF/+szuCCuhyJxMODAvuVeZkoCZOZP+dnFbCQonzYh4ZIYB/nqtOKNrgRh90FgMYk83AnMAhFfVoIJzm7ZpwyKJu+3bQfDqEA/r2WmJFuahOTwYtg1xyCUSFMHpXHdEEi7urIDENehVLHZ9jXHACK8Ymi90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830951; c=relaxed/simple;
	bh=qH5l2FufBw69zV8ubJLbp+CleZsOIHojAcuKAqLDxvc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EG6KyYtg8hy5jmh2RT4hYNsdcHjgKpTIiFeWM+pWPlDtBHqTxYQXBXZk1zJRD42E8WEwu3zSXF8KjaFubdXSEnowIqd76w0Txsd3cbJXBGjlUPddQVoUPS8aecgNnQkNiMnkRIQK17pjBxZuaNJWB/NS+hoWZAR8kujBHMp17pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=XT+kDo2D; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="XT+kDo2D"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8156141842;
	Thu,  6 Feb 2025 09:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1738830365;
	bh=qH5l2FufBw69zV8ubJLbp+CleZsOIHojAcuKAqLDxvc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=XT+kDo2DXVh5sL+g0Y6Sh5g1v3MkI6KdV/roGf0pzVqLPPCynolk2bmJy+B1ip2vo
	 FY2T+z4YFZZyY/EcA9fonnaASNXAkXGyLgWUmmhUKnXxfvC+qxEdqGslkCN5u90Hqr
	 vJv5ZbxRlYIwBO8tivhuh4aW46xuOIDzfxY/OGxRjPLYRi529SJjj0QfbQgyKdGiIU
	 kxZLvlqlPWCVZMFNvb9YjVALEmpLzLUTfMIFUolv6cDwBTC83vD/8wirxbV6+aMY2+
	 4uDGCzS7M2ub5epFIEmJxP3NR78Q9XU0eVXzIYEcDgWnHDp5J4XuV2Vd4qSfRaFE1j
	 67L51GVZJ0mMw==
Date: Thu, 6 Feb 2025 09:26:04 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call February 5th, 2025
Message-ID: <Z6RyHPHpfBn4VR1m@8bytes.org>
References: <Z6JgkP_FSbn4foYS@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6JgkP_FSbn4foYS@8bytes.org>

The minutes for yesterdays call are available in this PR:

	https://github.com/coconut-svsm/governance/pull/44

Cheers,

	Joerg
