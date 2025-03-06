Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34E018C332
	for <linux-coco@lists.linux.dev>; Thu,  6 Mar 2025 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251305; cv=none; b=Y6QFQAVL2LDOhVVnKKKzYHOsssC+IOdHqINQfavRUPfqn28Y983jP/vF69lZrdkJdwOw5iR9lH7IkhSLoKGtkFo2Ef1kxEnvQjklOvDBwZ6sF344aWbK3Oi9mPlE0UJ3KxcuN+RsXtp/TDMGJUzV5dQuC5iD/BRGFyalRwine60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251305; c=relaxed/simple;
	bh=Z/Mdft8hOPGxfgQHOzw+nWsF3o2FCEvgA+AA6KKz4aQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqK9vZSq/AuHaWvz/3QPkY5JEQzyHwxDFsXKuduLajgllMrlnHwkxI+ezR7NtHht/XrYEo4vkSlyjfAGB24QZkI9YOqnJB6qvXCtqTXoI+gN4WZgQHFEui/ldD07gLLKjydBpNyjcV8lD27JXlQ/BU3jRvqVxd71uw8wb3faiKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=2/SCusvf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="2/SCusvf"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7DCCE43007;
	Thu,  6 Mar 2025 09:55:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741251301;
	bh=Z/Mdft8hOPGxfgQHOzw+nWsF3o2FCEvgA+AA6KKz4aQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=2/SCusvf3+n+bCCOdmqTMm8g2LVUb0HnbB371wI06gsPErNlAIgMoUnihPQ3BN3fA
	 RUEBh9vVonCxzlZTBtTp6hEBNskPwrg2mChFONkSQiEL+25NNsamOzoAkBU6N76WlS
	 tVDuhP50wFgua1dSOc8Ae4Bx6O74M6xseaoISQbLQEJnDZqA4n1R4KiJfbOGS0MGWC
	 HCguNocTEhMZwim0bHQ8aulYFGdZfazfJZ2t7cISUS/PVjt7PoEWB24zlsfoAA+IuU
	 16/xl6N9qHEm2KJ1iANzq/9Rb0b50XPMBjH1n8x7J6cQvnQI0knYrDfRenGWxSUm0O
	 Ecf4+jwZvZFVA==
Date: Thu, 6 Mar 2025 09:55:00 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call March 5th, 2025
Message-ID: <Z8li5JEfdogfJO_4@8bytes.org>
References: <Z8dM9Tp49ZFR50lJ@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8dM9Tp49ZFR50lJ@8bytes.org>

Minutes are now posted for review:

	https://github.com/coconut-svsm/governance/pull/48

Regards,

	Joerg
