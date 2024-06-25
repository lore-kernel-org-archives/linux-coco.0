Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2DB16EC10
	for <linux-coco@lists.linux.dev>; Tue, 25 Jun 2024 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719330659; cv=none; b=BcmopoRYsaijHvo3QdpfdpYSpje0o4+7ZQyxfMPlVZ6S6Jpd6vUsa7O9HD2SEn0L4137DOqwm/4cyhQfn4emRKJMgW+0k4EOGuSFkGK1ZPQi0FtN/EO5XidOnNEZb3ngp7CpMCvHcRHvHiv61CB9UL4BViybV/gXQ148vr3+dOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719330659; c=relaxed/simple;
	bh=wz2aYjOfMUUqZxkh8qiP5B0AJEQa6KNHi7TdwW7TE1w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWVeAD/5c4zQ+SMVuKtt3Wig2/Sk7T+SRLxsxV7op6xzEBD/VdRx/nVMuDfeOoMjiQ39ngqt3mEKqTNT01MzvQ0Mn0kY1+46b5H39psIZYauwR48rSwXczA6iSvejriRIO2jv4lR91cFQG0LAjOHWjrtJb4vCu0VDI4/ob20xDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=fMSlYiZS; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="fMSlYiZS"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E98631C785B;
	Tue, 25 Jun 2024 17:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1719330655;
	bh=wz2aYjOfMUUqZxkh8qiP5B0AJEQa6KNHi7TdwW7TE1w=;
	h=Date:From:To:Subject:From;
	b=fMSlYiZSEJLjCDyu8Kq2K+kldeqb18ZUzjtO7UZZpuRDwOTm+mTpV2wTkZgfn3VJw
	 y64ts9TTBja0/s5FCyiTCc6gbe2ntcDiagLEUBPclOdLBdosZyjD3WH/istTRenODw
	 BEVpTggeNf0JZ5EmyaSpeLm0IOaNAmGnWwEnWYAvmWyER6BvVxayiG29Dz7RJkmy2K
	 vfjvvXMmFPTVvKdeHF8xHSLsMBnoUhEolGP6oJBm4ZzhALsEsQryaeLiLNVkwO4A2W
	 pekKSuoCK830ZkPwBlT2gZpeeoY4s/2IVUMc6EAY6Pma36Elabhi4ckGg9JCE5V2SX
	 cXy8ggQFxSUGA==
Date: Tue, 25 Jun 2024 17:50:54 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call June 26th, 2024
Message-ID: <ZnrnXoCrIAMx_swN@8bytes.org>
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

Here is the usual call for agenda items for this weeks SVSM development
call. Please send me any agenda items you have in mind or raise them in
the meeting. Please note that I am on vacation the first two weeks of
July, so the next meeting where items can be discussed is on July 17th.

So far I have two items:

	- Announcements
	- Syscall ABI discussion

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
