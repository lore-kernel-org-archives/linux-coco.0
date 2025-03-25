Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85AE19EED3
	for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921825; cv=none; b=Hqc8+e8JPM/pVCnVucWw0T+g0YRpU40Ub8XCTWUKSbbYgAd+qO+2dSj0Z5Yg2wsVWG1KrIcTDIjMNrlkDNzg4JCIqvAJMEJKZzgG9n0z4qOG1NfMMVBlnqyS0kzKtDnzIJWipFUBZ7qoZ2LIisv7hZElU1o4CJEw36Ll4ck/YBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921825; c=relaxed/simple;
	bh=jeIaURlpEfriHyNum0Wc31wnroHqSmKcvmDc7EAl1HY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=piI0wP31bHJXAn7ctysaWjnXGdX4DBT+34t97Ooiz1M0RHnRhxPSAEudMTPFym4qMt8cwAxJD1lLqjKUkxGhFRnLs1yrc4v3z0xLlvljL7xEb15TM6FWPqjtDDt6LoXcoVvYIwmAIvuLbhRt+KZ6qFCMOifYewoFnnLTngnORaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=7Y1SoOey; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="7Y1SoOey"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1841746B53;
	Tue, 25 Mar 2025 17:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1742921815;
	bh=jeIaURlpEfriHyNum0Wc31wnroHqSmKcvmDc7EAl1HY=;
	h=Date:From:To:Subject:From;
	b=7Y1SoOeyWWSJDZvJkpWevLwK1BXvZAPPP90zsfjKhwAgpCgmIGcafxKHM7544IBUK
	 U6b0JJ3+O0mjnRgUjbIcVhbRe5j/V9GmNs4iCXUmsBj2MgLew6RKDWwKIKru7AUNdo
	 ai1vnCDDKWs1XTmY8DZBi6em+Tm+9UxCgUaZidshtOmsEfZ5K2USxC+7Q2rfs0TeLl
	 C4wjT93YxFYPrE/BGilrVUnbYGsasflKqd0ci+Smpr+m4jI+WyDXL0ucenO0MfKKmt
	 Tl0KOD6RO7IKv8R7xXN2Ogy3CrjJOn0dl6/43PeBPUgVZArjz0KpMFgunVAbB0IS/e
	 x9AUqmYFQPUmA==
Date: Tue, 25 Mar 2025 17:56:53 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 26th, 2025 (Changed meeting time for US)
Message-ID: <Z-LgVcs66nVpAd7x@8bytes.org>
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

The US is already on summer time and Europe still not until the end of
this week. So again, the SVSM call will be an hour later in the US this
week. Next week timing is back to normal.

Otherwise:

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
