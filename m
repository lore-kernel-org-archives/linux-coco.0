Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147561E288E
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602653; cv=none; b=hErWFpX4Ql6ytD/nosASenW4lxbI//mcs/TGYO4tqlVeDpJbsoaP4J93A94vRnVZlEe6lJIaB6gDYlIgkWR78LAewyqZIbnqtVlWW6w0hmUiFdhaRPJSVajQu0NfkyEJHoeV/Vozh3hIEv8WdfUXvujBRMJYQSAsloGxA70DGxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602653; c=relaxed/simple;
	bh=wowowWmbKUGlBRD5hK/8QrMI8tMRc31cllPJLQ+/Ivw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Szt1YWzZcP23wL4nGTxWXhPBDwt5h8evgAZaFfe0QuGe0qe/ePn4nxPrp3ZRaueIVuDWBCnRYx9blqYn3vFJbcdqesQM0sbKRKLvX6apqlaE5Nbu4mTknmCqeofzYVxvoQB0GtFGlKJdO4MNmxO2Z4wuwQRILKRklLZ6Tz2MTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=KCzIyqMq; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="KCzIyqMq"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AD6AB2A4C02;
	Fri,  2 Aug 2024 14:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1722602643;
	bh=wowowWmbKUGlBRD5hK/8QrMI8tMRc31cllPJLQ+/Ivw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=KCzIyqMqhMWvhuijsqxyK59LMXN/1Cw6hLmzJBxFvVwIuXYbXHInvwCB5U2K9Vzkz
	 Iu7ubvejbGOHKdzTV4YPF0U5F5NJdBnnJJeSHC1XWRSBonAriK6ql2f8iazSz9zdEu
	 ywPW+fBc81dxXNg2UDQw53TCOV4qu59iIJakkW2F3l/yW5eiW35SaIxykt2EVX3ObX
	 ipj2Ok20TO22oenlQMe6lhu9aUqzxrYhvVhlzeDBrWVKf70+QpRJ2sW0nknQt7AjG4
	 nl9POHMGodZmrmNLlO/QfA2xqLY8PFdtwBfrFxgCICMjS9XtA++dQbsi37ieZ0BPrf
	 b5suubhoVJ8Lw==
Date: Fri, 2 Aug 2024 14:44:02 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call July 31st, 2024
Message-ID: <ZqzUkjD10E4Xe_s_@8bytes.org>
References: <ZqkGwtfMx_OisW6q@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqkGwtfMx_OisW6q@8bytes.org>

Meeting minutes from the call are now posted as PR here:

	https://github.com/coconut-svsm/governance/pull/21

Regards,

	Joerg
