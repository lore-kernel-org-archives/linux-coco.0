Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398E477655
	for <linux-coco@lists.linux.dev>; Thu,  7 Mar 2024 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709800311; cv=none; b=GKj8agRxUUHQ4PVG8LUSt6ih2mxxgf98sreQCefKPBcs/jlT8IX4XpMvU1SiiITA2bNm2QQUCDm3JsAYh2yK5WYBn2J3bvrVOKk+Z4oSgbeBA+e/DUTDqQnq8lsRe0RGOUgqAR3LIgsLO/yhfhPn1vOPLxUx2SQcEatro884VGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709800311; c=relaxed/simple;
	bh=vXTs41bjQRFr0NZpR0bYMldr+PxUr2wxz9uHifRaK7w=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3obCNPyZ2ZKpNlmpFSxsqEhFE5nyx01u5Z8QxegqkkeepsvMUBNaU17y6M6cReBYPcJuQzGmv9XScwkwpEpD/ckpCzS0nuJeZ639TtA68NVOFW/2RndpmXqtd+ZnGM+1aONmwazSBdeED5h1UfJkHUUzDzO21xKgi/1YY9v5NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=rsyI9CLH; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="rsyI9CLH"
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AE5FA1C46CE;
	Thu,  7 Mar 2024 09:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1709800307;
	bh=vXTs41bjQRFr0NZpR0bYMldr+PxUr2wxz9uHifRaK7w=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=rsyI9CLH7taRzELRHE+i81eB+H9TmPq2+AKHPiVCX8ZDBdUKfIt6Z0tY+3hVim6i4
	 rHP4cHr86V/l2rrjaz/xaqpt/vC1I8SjmrR9HWjDUrZ/qIhR8iGrwty23w+8lg9vsn
	 layIZQW0cGo6rDi4J0mWBVNZPmAYJlcjBQEKjJK9GZXHTCr08NW8mhs6Ggmdk24699
	 2v8L9jTdutUQ/7PasNDFjQd3tv3IlQ5VgU2+UOdvkzjfLgzxU7Rno4FGBtv6Be/c9t
	 1UWQmSugaGaYzCezEhfb1eHin8UcY3v1Gis28m7iE+ntnpBTbVzK4OB4hVGbOdg1Hr
	 49XLs97aQ4Ucg==
Date: Thu, 7 Mar 2024 09:31:44 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Devel Call March 6th, 2024
Message-ID: <Zel7cDwzRdbWBqUR@8bytes.org>
References: <ZeeWgVCN6ZdRGxJ3@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeeWgVCN6ZdRGxJ3@8bytes.org>

Hi,

Thanks again everyone for attending the meeting yesterday and the
productive discussions.

On Tue, Mar 05, 2024 at 11:02:41PM +0100, Jörg Rödel wrote:
> 	https://github.com/coconut-svsm/governance

A PR with the meeting minutes is now open for your review. Let me know
if anything is wrong or missing by reviewing the PR.

I will merge the PR on Wednesday next week, given all objections are
addressed by then.

Regards,

	Joerg
