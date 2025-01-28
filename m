Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D1CF9F8
	for <linux-coco@lists.linux.dev>; Tue, 28 Jan 2025 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076139; cv=none; b=crmsuEGKpsfNA+/LlVGxzRs6MhCOZZCZE9pKm+qcA8++I0UDGajJ2eRQJsJD9lc5AgWvpwgWHR7UbgGC78DPJ31Z+mc5GyADi3XO3BCI0Zs+To9hWDV+wrotqewiU0RHIRM9EUXprnnDXZ5uEdM72H4rhe8At0jPp+/P990Hywc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076139; c=relaxed/simple;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBGTRWCBs2RVOBCopsbC9E9CZH43xnIdu3w/oWAQVz772IpZF8Lj4wFeP/XlZo19ynjuML0OvO8iFGhVeZ9bt3SJzc4uTOhYIpTd+rLk6GfSszD+DhHObvSC25kpncSmetd4LrwbPFb+C82bcXowV8U2zgIp1cYPvRXu52RpoaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=SyYsI2FU; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="SyYsI2FU"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9163940B76;
	Tue, 28 Jan 2025 15:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1738076135;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:From;
	b=SyYsI2FUxY+xbRqsuUr7bkHPejez4zVvH8aQzCpwitF6bvK7ZWce5I6nBWJT+23mk
	 Pq1APuaH4IIPfBEFVe0WoNdWk+cOdbR/LZ5YCuBVuDEbPIw2QCaPrayrbCCATrJoD4
	 ywJn8KP44VH3b4awGm2nYJSjqvRGDjD1uXF659p9Q8biYQG6GxAU4DuNFyvh6rWieN
	 2zP+8GNs6ycSsiKqTFCvghbeg7H7UoJlmD5n0OEpUWFoMqSCNJvGwCoG+g1cfE1aqA
	 IzE6zK0787JwAHGAC2IGs0ad5GyHWjjhNORQqjlturNJ5TDLvGnJnnFQAKboe9xAEg
	 wyqD/Do5QkuhQ==
Date: Tue, 28 Jan 2025 15:55:34 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call January 29th, 2025
Message-ID: <Z5jv5sC5iurutj7M@8bytes.org>
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
