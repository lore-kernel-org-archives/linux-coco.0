Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C1D83CBE
	for <linux-coco@lists.linux.dev>; Thu, 25 Apr 2024 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714037297; cv=none; b=IeZVXB7IgaJW5VtGWbgv22UAEATrRgegko1PyHiUZC/5ujUX26NSWGEkrDgU/vJiLKo1X8F2hd40WYHXqHkZQXDvqmmlhUunEYzMT0EUjVUOGYt9U3/WHlWu8EMaukVvnpElurdqluKRYPN6sekpFkT3L1by4A3E8Ct3oyvQxYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714037297; c=relaxed/simple;
	bh=uoR8w+ewrcsE0CliJaohWXEiluvyU3OhWtqEkw/9aos=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS0N5MockkItM2AdwnBhpdC8gXlzrWJJEbFtcZB2HqTVWb9956vbQOIHLTKQmgvhMZY9M9Ntx893sIhrVpDZqlccw/lUbguZ+6BlUwyssOA1+SDl6APZF9X/5F/lcwTFVKAy3aC9udKRdLSTeDS1VgbOsX1LxZhJz5Pg19wEqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=5g7/6JXb; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="5g7/6JXb"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 94FA71C5A0C;
	Thu, 25 Apr 2024 11:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1714037288;
	bh=uoR8w+ewrcsE0CliJaohWXEiluvyU3OhWtqEkw/9aos=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=5g7/6JXbCUJ3eOKPJobUHry0dHWhge+DKs3f+InbINEbuRGuZrinUrd+VNE6K7e2e
	 Ypv7lTRVWWqP9wvh2xMqmlxAiBwGwBJ2TJzp1zQJ8Kb5aL6/jA4JzmjhP6LDxTkYQQ
	 P0T1mjb4vHvglM1kcf4FD0UrQASM9/qPvb5GK/0UYN388oGKo9opR+YfnF9aZ0LWMw
	 cAIXtR+/mILzuJcLJPGw7fb6zsmBIbdAa+o5EVaIoC9+5uuY8PgpQCOTffLKz+BvK9
	 EUSAw4ftS9qkVNnDy7J60y9vbObqvkeOYLlopUmndHSmO0dgrqTrgGN9EgQnKLBAqi
	 wnUeboIcndchw==
Date: Thu, 25 Apr 2024 11:28:07 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call April 24th, 2024
Message-ID: <ZioiJxe3N0IDQTsj@8bytes.org>
References: <ZifZS6_Rx8bTbceb@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZifZS6_Rx8bTbceb@8bytes.org>

Minutes from the meeting yesterday are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/11

Regards,

	Joerg
