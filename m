Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC10113BC1B
	for <linux-coco@lists.linux.dev>; Thu, 27 Jun 2024 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482357; cv=none; b=Kl3Rxrwbhicwd9ogDUi66obyhYth8PtoxPBJVfghLU0M0av7C3229r4akG6NvPPBjciqnEuE9hL1+caR3nTdUrKiVuwV5yPj4sakb/nFOE5CRQs1xhrkm3iGY9qvNc+Fd6yN+lGk2tGzZg8jsn4z1vKCHLfoSXJHAhmSWqxJGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482357; c=relaxed/simple;
	bh=ZE5RlYGSFmYnUWlUtGOq4rsN0gJXmUD0Ips8uiH1p+E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMXw8qfmFVsASwLy6tBgE6c0ZswpeygWM7/OgOuL+VN9lEq45Gi2RO967KYrZOZqhWp4K6FePUKr58WQKIN/4V9sN37sDBFF8IWIe2Dajo7UcdbJkxrnv4qrs77g3aeigiSO3RnNS5PaWdYVo5v6s5AqA6ZCyiGEO3TxagLQsBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=nbIZzUoO; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="nbIZzUoO"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B1DF91C89A5;
	Thu, 27 Jun 2024 11:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1719482346;
	bh=ZE5RlYGSFmYnUWlUtGOq4rsN0gJXmUD0Ips8uiH1p+E=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=nbIZzUoOYnydiGMKldMO5Ksu3FiqmYc0h+K7OhbosmDJJvvWKh5APzOkle332N7ou
	 8W0l8aYfYKq6kE2XJJ7eruUPqGfM0/F2yPjoJw3xl1SWC0lhFUPEnH2Z79E0X7sXdd
	 Ns3eFqvhFo+Cd0lHZPdgQLKXdT0UXCW1D0jE3e/me+3l6Kay/H4KJ0K/+kuup+XWDi
	 1spd/6bW1d2ulpuO2d3mW+SF0SUvywEJH4uU2vcM6DLADF2F42nOrfLb/8W9RKRgnn
	 qrMg77TFqhWorii4zZaEVsvsUNjVo815QXAWFyJRfWionu/FBJUEjk+Il74V2GsSMc
	 qIR9M9udgKUDw==
Date: Thu, 27 Jun 2024 11:59:05 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call June 26th, 2024
Message-ID: <Zn036RRPSwwxy2db@8bytes.org>
References: <ZnrnXoCrIAMx_swN@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnrnXoCrIAMx_swN@8bytes.org>

The meeting minutes of yesterdays call are now available via this PR:

	https://github.com/coconut-svsm/governance/pull/18

Regards,

	Joerg
