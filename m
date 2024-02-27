Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085A138DE7
	for <linux-coco@lists.linux.dev>; Tue, 27 Feb 2024 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709068430; cv=none; b=rHvd5ZNCsFPIB+gY4Vr1moVLRQ/r+U4MVmAgCAHWcyMQ2AhINqntfCkxy4J3yUbNsU2DDa1CLqLIaMG6K9H3hwMKBTkPpJvZ7ileDGTghoj+3QjY/8CbhTJ7q7MBDcpjQSRx1mpkr3D574x2KZWQ3i+rwKnMiRKQi61Z+ski5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709068430; c=relaxed/simple;
	bh=fgGXEIHKAQ6AVGyFmJKoFVavgCwqWxfUAdkGFgNJzTM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+9ru01ud36+TJqFWP99OZ3pYKyPjBd0MhCrxGZq21fYs+SwxX5xr4Eomg41d1O+8DiRhDAq+rs3KrNXqVx9YcIs82IZwj6plPAbDL4ujH3Kk+ivJdJskEh9/YBxuoKQ282pP5JzH+gG32KgmL3ShDmv4tflKq0nhJsPVHMlNhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=pAajOW6O; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="pAajOW6O"
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9A2081C4D1D;
	Tue, 27 Feb 2024 22:13:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1709068420;
	bh=fgGXEIHKAQ6AVGyFmJKoFVavgCwqWxfUAdkGFgNJzTM=;
	h=Date:From:To:Subject:From;
	b=pAajOW6OGNQcAoLB+nSFN/qTUKQylBXC7u5VpC7rr2uhL53b/QmQp31FkICaOsulF
	 /EAwGaXdd/ApQNFDrvVqAI1xbwS97J6fFGCqI3ZRKKbMZaBnf0QhsyaRfkWBl4F/sz
	 OtmD9pQqJtIK3lh+tsTJmIWEBo8+/a1W4RXuAXV8ak6eWfUE6nfeHLGpekB8RVz2XK
	 A/LpZ8z7BZMimpX+vsh6mgjoFVUeXzdun9Ik7NiEk0Jv7zFQ8g9TCK/+V3vvs94w6K
	 h5dnIqmUpSCtqVZZk9THZwJfrTgp4WREIabj0tEj4ld5HX9zAQqAoL/i+ZVTSgtUvZ
	 FMUS/aIReaMlg==
Date: Tue, 27 Feb 2024 22:13:39 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Devel Call Feb. 28th, 2024
Message-ID: <Zd5Qgw4vAr_Rs7r0@8bytes.org>
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

here is the usual call for agenda items for todays SVSM development
call. I don't have any particular items yet, if you have please let me
know via email or in the meeting.

The meeting today is at 9am PST/12pm ET/6pm CET. Join using this GMeet
link:

	https://meet.google.com/ppv-xehx-dvb

The public Google calendar link with all meetings is:

	https://calendar.google.com/calendar/embed?src=c_55a38f3460c638762a75d4fd6eda3b1cf455ec4cfd7f83201e3cbf817b420dd8%40group.calendar.google.com&ctz=Europe%2FBerlin

See you all there.

Regards,

	Jörg
