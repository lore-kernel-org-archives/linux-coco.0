Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CC620DD5A
	for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739437255; cv=none; b=q71THgwJHwsYs2smjPBr0TTZmhGH2vMQ9rOzPZLIc1OZXAy9S4cJcPYA6vbFILlgY+M+vgoBzY74HSGG4sN5iTvvNGnbxWXC+birfVBi7BQ5D7czHMA5DgjtsMHoLlNH+9csMZDCnyU4XlVOWDgtLcbcgrars2OQzfy+0fBuDc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739437255; c=relaxed/simple;
	bh=L6N8Ltxr8yu40S+YDm03VrceuP6sqzoQNppaE3JUdVU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5CRx2uM8XuJBjSHQ6clZk/Qlx5rlUHfp6EPBfIBr6YoCefyhUy/gs6ASC1VeisDjsWh5PJTCyWZKtRPsAWoN5nLFzfawp94zlziHNqDqpBITuuSaDJgF6BiEsgC0opEIs05vzqrl25FZHr5fWIbKsiwfuukoaolX2EujhBhuAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=awa51ebQ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="awa51ebQ"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3889941F22;
	Thu, 13 Feb 2025 10:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1739437252;
	bh=L6N8Ltxr8yu40S+YDm03VrceuP6sqzoQNppaE3JUdVU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=awa51ebQHzlD4eBN36XLadY2qOfMP4znR2vdykatOQbRMfuTOph/umGRHNZowRScl
	 M3ly8gfp8ddI3bc5cVt+fGFGtQrysxRVaZtVNLzWGjtTNNSYS3jQrDJtg1BndF9jzv
	 ksMMZqgONAwevc1cYFcuUOU2emNBVV59XbMMe7I/uY6LQm+SzHVLEIcVQ8WpJe1zqt
	 KZYOo1lBNwIPCRiSOSZjd7LfIsugIB2wSNzjONso/o5ihyIFWZGb127nFHlYugtnJq
	 /JWTYIMRyTCOLamkeE2H4BanhveM6nGzAGqAvMtas8mx9PnvOnDBkc96PskEtA549G
	 ZFtfFEpFRFzwQ==
Date: Thu, 13 Feb 2025 10:00:51 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call February 12th, 2025
Message-ID: <Z620w09dlxZhwwmm@8bytes.org>
References: <Z6t6vQDVr9xYTlqx@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6t6vQDVr9xYTlqx@8bytes.org>

Hi,

The minutes for yesterdays call are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/45

Regards,

	Joerg
