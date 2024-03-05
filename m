Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FE741760
	for <linux-coco@lists.linux.dev>; Tue,  5 Mar 2024 22:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709676167; cv=none; b=G7s07XouZhVGR5YTIWAKVEY/jREk/HQPD6KMD9AmOzrQw/c8V73nCgvalgNqDa6odyAdmcj13oxy3Y651QFaG5Pu4UyMXh/DaFBqfQwHU6mk16HQj9PfsHp7s5EdMFSBXv6JeMdiRL6N81Qg+tpXXSM1kg2IfIYPROPeAfnBjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709676167; c=relaxed/simple;
	bh=HkIcF+dkaFKtjzBFwAQbeAtGTgoAMcfWJvQ1UsJP2IU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzUGYCc/LISLYJGq3Roa+qmZCZpaQEjlIW4mbGAtkjf2l1rbL5RgxWhtkTwslrCJVvaIEBGBrP4H6nGaG2zJX8gm5b7G2VVMecXTXmuL84IWSSBgRpuLElWp8GV2FQL6SsTip3nfPAqviXT5lKs5myOmVwTuplWUjmdV/E0Op0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=dcRLHExf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="dcRLHExf"
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0D5BE1C803A;
	Tue,  5 Mar 2024 23:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1709676163;
	bh=HkIcF+dkaFKtjzBFwAQbeAtGTgoAMcfWJvQ1UsJP2IU=;
	h=Date:From:To:Subject:From;
	b=dcRLHExf8i+yPYpu4Z+I9JYlqJ6XK/CkbpKNo/4EWZCaC7xJSITkNpE+CUCAVt5vF
	 Eq3XoQBW7Sq7+HvTxTBrlfkh/lUu4xabs12xLLUOJjrbbLlj6+POQ/FTpkjL1tCiAo
	 zPQk1bqHmWBhxE/LUaQrxMWDj6ysHe3Gnl69Euxk2P8CJb8JAiKsC6PI2AJNnOKZ0F
	 0IFTSqYJKPnX5RLXODvkWSOPbrMD58/L0l9/mQbkm1UC8MGoRrvHNgxb+P7sOmQwfe
	 w0k/s6IhoJHC1N4mhj7ruWf8v411NJK5vvV6RFBB1GHtfSlXup49w3Rsv9otOiPcIp
	 CLp9B79kPv0FQ==
Date: Tue, 5 Mar 2024 23:02:41 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Devel Call March 6th, 2024
Message-ID: <ZeeWgVCN6ZdRGxJ3@8bytes.org>
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
call. I don't have any particular items yet, if you have please let me
know via email or in the meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our shiny new governance repository at:

	https://github.com/coconut-svsm/governance

Please note that the meeting will be recorded and the recording
eventually published.

Next week will be no meeting as it conflicts with the OC3 conference.

See you all there.

Regards,

	Jörg
