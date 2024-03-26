Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB5023CB
	for <linux-coco@lists.linux.dev>; Tue, 26 Mar 2024 22:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711490577; cv=none; b=ZcTVhXqSUbFg0+OO0HzA/sZfUFi+0wKYTtt1EJIkOvd7SIsOy5pk1asXiezjFd8+oWWJvITZJTEtnjGeOr2cuSiukJW8oxYqqcNX32oBDCo79xe13zEz5VaAHeHDHVLs163l+PvXfGo9ngrGV2baYR7erPvl8XWYC2CiDlha9aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711490577; c=relaxed/simple;
	bh=P3DXFyzwz8jHC5kc++zBatCXMn3hvgrvpzhmKOPCw0I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tV6t0lHlbSMJ/j9jfPqSkHyvRbOmcBuyORuxzlOHeo9RasjGHvInFnvNqYY5WZvgIPW/Woigmd1PblBMOqo4v+0pMPNKkDYWG5LaJlk4VDb/sf3vnFwaKRus/nzVLnoraFM/WI4WKQs/xgFXSHP7pDugxCkbZ+u7ulTQ18GgPaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=239EdJ32; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="239EdJ32"
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 74A5F1E9668;
	Tue, 26 Mar 2024 22:56:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1711490191;
	bh=P3DXFyzwz8jHC5kc++zBatCXMn3hvgrvpzhmKOPCw0I=;
	h=Date:From:To:Subject:From;
	b=239EdJ32zhXkgtS7C2LjSqpPueuDs9GHtsYdwEthYwjcmkTmmDDAJNhSxdVuVMBSU
	 +unTAkpSdHdMALJn5udty6nyZIyBMzOXx3aXGYoE8EAb8V5eP+5Bz7TvjfbzBbDck3
	 fUHXQD3X+5b4KIkjARGVfE25E30evcQiG4jmsteXmvfT5X8mGA01nDlczkfE3S1/dX
	 8b9FTgICGUwlA+gbH7Y7/5PBQubwvjrwj4aP6xDoFeoASVwUDJv5sXCxtn1NBVDck8
	 mkPcpMwSylt5wp6gwMk52lVnuvaOWXoozkzzp7J2lIJhZW3myQ635bPzwhwZBgVC5d
	 c6YQEMQ1/mxrg==
Date: Tue, 26 Mar 2024 22:56:28 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 27th, 2024
Message-ID: <ZgNEjFQmGlrTTEcS@8bytes.org>
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
call. My agenda so far is:

	* vTPM merge status
	* Vendored dependencies
	* Fallible allocators

The items we can not cover during the meeting will be deferred to the
next meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
