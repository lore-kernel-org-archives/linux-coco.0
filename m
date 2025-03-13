Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E598178F54
	for <linux-coco@lists.linux.dev>; Thu, 13 Mar 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741854770; cv=none; b=HIuSgrTZBE3empEEjvCk7VFh6cRxTjNcHvPIjXacVPCbRhWcvaiSUq/pjoVRnc2V2I6C/byrBilhWdHydFsKUtZvWAkLe5ij2ZR9LSkbnoEDp4oLovn2vgLoB9eYlVCXLAxiBhoKWUyZkaWm5Zcu0QukY7w5YR3cK5qnIVDnEJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741854770; c=relaxed/simple;
	bh=kvUxETHvn7msvKKOPebbGkRkV9LKiISeZoAuG9nRD44=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEB06tEQJeWaefCLOgb7N4wmVjRq5Id05rd2vp0itZNhohGFxNzxHowjQGkgFraEpkyztf49m47ZBYDT17VLTCgZriurdAnv0em8Wb+TzUdhWaBoi08Xe3+rKgPkf9oZFhHFxrPfqBD7c7S95hwlxHqlBetHooDDLyQZ57ZWQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=aIldMUs9; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="aIldMUs9"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4FD1345206;
	Thu, 13 Mar 2025 09:32:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741854766;
	bh=kvUxETHvn7msvKKOPebbGkRkV9LKiISeZoAuG9nRD44=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=aIldMUs9oHkysW9LQj0HD/ez27HIvwANW+M+sjtJ790oDcJWFGpdHL45zTzYHSw6y
	 QdLWt113qFARaGC/yrTPW/VooLu937MGYNv6PHKZWxbn6aMbFJvhCFiJZqFeh9p1LS
	 Sv32B9PoZBdFMeuUykp+poHx1nBBPRw5maD1ouJNQDWbvYFCJfWXJnvIzFeXc8OkAA
	 9kH480vSgtYPUPrMqLu4+cYG38dchL1u36RuBsMyrCAxo/rfQ0pkaQWGqb27vP/Rt9
	 Z0xWQCD8/eh9KnWB08m927IdidASUbRkIpSWQRnK59Zz4GrW9fVv16Ck31WCNBKqYt
	 eNpRGKFeXO8Pw==
Date: Thu, 13 Mar 2025 09:32:45 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call March 12th, 2025 (Changed
 meeting time for US)
Message-ID: <Z9KYLYOSroBWSlQu@8bytes.org>
References: <Z9BvTJSoc166l2cf@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9BvTJSoc166l2cf@8bytes.org>

Meeting minutes are now ready in this PR:

	https://github.com/coconut-svsm/governance/pull/49

Regards,

	Joerg
