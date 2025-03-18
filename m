Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B9E1EB5DB
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 21:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742332498; cv=none; b=XhO4nKXOxdzw8FqZbEn/feVH0Quwa+yxyHj4bT/iqpctNkeF1i+AyKBwFu31e0jAtforhZfUEnV+YKvifIRGZ4qbDaAI6Zcw88nrgtspa+F7fyVUEKFvKR9cJKcBn36t+g4GEn2fOszndvZ9qwvUMEdxL879WZ5ErfWMbVh94/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742332498; c=relaxed/simple;
	bh=ZCfik4mCQXbsrOYhxhrqelhA7RdZt7nJJxnhzSYRe5o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cCavQ3J1e9xQfTmCyi6MXn4y3RSCmLBE5FPKm6J4LePVSmmp773O4Rpj7nONNKqAeZdkyRE36Ow2vGDjFYu+F1EAn1eKyJbDyduUTvD/iIwusaMIKrGfz9JyAmj45QdZUh/jQ7haRSbWFqiBGD5EvWrnEiifmzsOqvr5/U6rE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=2Up/O6g1; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="2Up/O6g1"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BD3EA46184;
	Tue, 18 Mar 2025 22:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1742332488;
	bh=ZCfik4mCQXbsrOYhxhrqelhA7RdZt7nJJxnhzSYRe5o=;
	h=Date:From:To:Subject:From;
	b=2Up/O6g1oLEIF44f6L3C50y8uZdAm4BNe81PDrJrCYN+zW7Z9UbU4MbGC25TGt8M3
	 BICTd3Kf1/LTY0cRCHIOZ5hhFcee0HQqTwZqvodXcp8oyNPLp9M2xaKPvudScQBSmI
	 aWX8KALYOUiFziY7J0/5H1dVdTnRVAuZ1+JoQZZ8jmXROsNU5JoahpPVdBwSINnWhM
	 ZUFIlPHqYtShPqc7Fsgt41QqaC5msOnkDtm64TIzTk9pjOXdkqsMvwZGMN1ZM2ra8t
	 NGFAp+63fKYeVlVodf6tj64yPL7sGKiy0SSBu9K1qGGwvGaengbO/XpnSkCNbh0hB4
	 AeqaJPpLze/bg==
Date: Tue, 18 Mar 2025 22:14:47 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: [Canceled] No SVSM Development Call March 19th
Message-ID: <Z9niRzPEzTiy11FT@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Unfortunately I have to cancel the SVSM call tomorrow because I fell
sick over the weekend. The next meeting will be on March 26th. Happy
hacking and stay healthy!

Regards,

	Jörg
