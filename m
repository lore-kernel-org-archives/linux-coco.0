Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D29218AAC
	for <linux-coco@lists.linux.dev>; Tue,  4 Feb 2025 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694811; cv=none; b=d5h/FphNLecYWo7/FIYsbB5PjEwWoREyYrn2i1apKgAjaZjszyPgcN9d/LmuPyNvYmDilAuegFgwRTvZ9S41n46+mKRrR14atSGm7N/iq4F8uTwL5Jg0+cX3dn9e07E1pM6X9x6ZBc+ZoyGGLqhFQSonJx/lSEgq0rxQjvAE0z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694811; c=relaxed/simple;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPV+4nKGwsw2Z+i5JVgB0sPZYTJkuLjQdkvDuGQcwpEMvgASE6ro7bX4F42oj1ZbRQLqBRgKeT+7XuIqY9LU02IjMzfQpltFYBQyiLHAzyDresoNSHR9Zk1o2zb0Y+Xv6pbUciSuo06yOZhuAhyzNBcYSCFwIQtSNrozvpkOuRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=UhsuEeeN; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="UhsuEeeN"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 28A87417B5;
	Tue,  4 Feb 2025 19:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1738694801;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:From;
	b=UhsuEeeNtA5HEAAnY2F/yMZf/HNvGLZ9ovXfuOncmCIDM4HnQRyjoUuP/F/AEmOFu
	 TnUziGuC/P+3MDi7yYzkCd2fXfK9SswI+wVfdWIk9wlM0vu3UEaK0kmqxqgN5TQIrf
	 vIQfCftpl4Ozf7F5V4AqNsmWkjxdCguIGlRGmsK67330ShsllZpR7IrbSY0fRoSWbM
	 mlGbBHtK6TAw0uvqbmre9SNErs2GbuMsN6GUR5xgvgaVumLM5o4mltTY2L8ohNckdn
	 XS+U/BdFwoDTYnPXyZL9/YyhQ/3BJyxOJp7xTP09SDxO2P/vx1KTTuvhGPGos6TuO0
	 shUQ8oTo8EE2w==
Date: Tue, 4 Feb 2025 19:46:40 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 5th, 2025
Message-ID: <Z6JgkP_FSbn4foYS@8bytes.org>
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
