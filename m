Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0924E6CDAF
	for <linux-coco@lists.linux.dev>; Wed, 23 Oct 2024 05:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729660979; cv=none; b=Vbe+DfSqr0ISte/QihQaehG4LTLh8zniJNMQCJpP+FMqDIw481Ysu2W0bCKicMbrv6/XY9CBn7OU8C7qgsVZgxlhRWzorW2tSnfaSYAlk/8Xlebt9eQxc1BvUJCAa9h9W9DymvPkNMTrJ26MZKElT/MZZi+uyMPpNhugZHHz/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729660979; c=relaxed/simple;
	bh=jaVX81z53p5nscHZi4FViOOFnlI7ZuqWEq2t0nMA8rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uM99XX4w8rgHtiULnN5DG9fdsG85UPr2hofpS1nDJLjrjuPxlE0UFbkUSx5AfAhzOlH1BelU1SovgbkcmNHTpURle6bUEk3U1L77LZCXc6qrhqrs2EV+7avuh0fVB6hnnIs7zMKCGQta7xli9WvrlUZyRSIQ6VYayPBEzKbPVQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=sZ3QyFk2; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="sZ3QyFk2"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D035D2A85FF;
	Wed, 23 Oct 2024 07:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1729660964;
	bh=jaVX81z53p5nscHZi4FViOOFnlI7ZuqWEq2t0nMA8rs=;
	h=Date:From:To:Cc:Subject:From;
	b=sZ3QyFk2kEFuTPhfwHh/O0N1OmeJNILjcWZXEHxHmZ/gAtRbpv37u0Yi+FI/BhiHF
	 P4rkRnHsGTUrY2UM6dypwIhdHJVH6K91He3A95O4iu3uqe4mfQtD5HqXq7Y45al6FA
	 wh2AigoXhQWnpnEZBm7Xk6YHP9HkKMIRuDn8eNesmryQ4LC8PDkZ2SfLBbITaWFoE7
	 SxAFK8xBVJ3Xn+6+GP36rbD3FOZiV7O2iYRZznMqHUPdY/USu6HmanUKYzZBIZr57r
	 qNae5oncCE/1j8/hr4Y92yRHC51dOW9uxZdcpFiQDTxrBkpd9T0ReRJZLLOB117yng
	 rzwisSab+bUqQ==
Date: Wed, 23 Oct 2024 07:22:43 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Cc: Ziqiao Zhou <ziqiaozhou@microsoft.com>,
	Weidong Cui <Weidong.Cui@microsoft.com>
Subject: SVSM Development Call October 23rd, 2024
Message-ID: <ZxiIIxuWHa_Vs28L@8bytes.org>
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
the meeting.

This week Ziqiao Zhou and Weidong Cui from Microsoft research will give
an introduction to the Verismo formal code verification project and we
will have a discussion how this can benefit COCONUT-SVSM:

	- Verismo Formal Verification presentation and discussion

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
