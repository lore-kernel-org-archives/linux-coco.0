Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BB612B81
	for <linux-coco@lists.linux.dev>; Thu, 21 Mar 2024 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711011841; cv=none; b=hV2y6ww5x4NReK/2svXDCvuC9B5vsjrHAOU1UdvooUItPauSiNeMHjZmYr/BQl4aH8ash3ChNGyxXlxdl77mawTzzQCL+wsfBk2cKxsx27/JOg7N5DiNBGgIfC1qGQRAL/ZrITbr1wXJShy/1N5f9KHHUvnZG7d35c/Si40GPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711011841; c=relaxed/simple;
	bh=AJ3BI9q3sqKDu5mZLBaz+AdZIMACsA/POWCGQanq/RE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktr1F7gcgNR5y7x64FnWF5mfSzzZUthlhz7CI6+oTN6v10WKhvgZV1QjOM0UV7+UaONodjn5GVsXGG17MLx9E8o5MgLpw3g2x2FB6qPjmNVutNTT7od3Wyu3lp5NmMvW8/ZUiGFlAPJGptLRXelj9UqIGE2sevU1CRcpUGv02vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=nSPiLIax; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="nSPiLIax"
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9FB2D1E238E;
	Thu, 21 Mar 2024 10:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1711011830;
	bh=AJ3BI9q3sqKDu5mZLBaz+AdZIMACsA/POWCGQanq/RE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=nSPiLIaxZ+LLoglHBDcJluvfG1FQtkd1qt4asVpNl09PXrYEHUAMVh/XfhDOWZKZG
	 +kkzeuuGzoO/gHKoLLbFx74YSSKqhCR1B86wWdGj+O0W34BcXDlcJK2n8T5Ye2FYCE
	 N3F4+QPZg/pkOYOKK5qgCWlAEOtiSN3Yb9xl7zEYLHWXu9neq3G6Nm8ngPUH8ygluY
	 QKgwejwnYVqQYnPk3Fjgo3sOzEQzWhwfA1CeSx/BObf8/1kcBPZM6vI0nOB+6ydzaT
	 T/h652XqvvDMtVPlOnaqLvSjy2i/ub5Sy/pPmWk17Drj9UVlPXDECL1ylZ2YyFzVH7
	 oRK+C4SjIMWQQ==
Date: Thu, 21 Mar 2024 10:03:49 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call March 20th, 2024
Message-ID: <Zfv39SFXe49LyQOs@8bytes.org>
References: <ZfmPIXGDd-69c9xp@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfmPIXGDd-69c9xp@8bytes.org>

Hi,

PR with meeting minutes from yesterdays call is now ready for review:

	https://github.com/coconut-svsm/governance/pull/7

Regards,

	Joerg
