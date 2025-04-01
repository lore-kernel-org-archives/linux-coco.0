Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AC57DA93
	for <linux-coco@lists.linux.dev>; Tue,  1 Apr 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522728; cv=none; b=Djmtcpo1sZ5NA9dX3Ka8fv+IQGCMc9cls4lNsLbkxOtFgrNUpdi2SG6dT/U29veC7FdgDmCq9tP5kSBfkaIi7jtqhwN1+C8MjQ2Ff56cYuOv2O7gJIQa+Q0XNdoXWwWnMyRA42agtTTKcZ0ibvVKYfeNjhY/mOlqNVYBcpICTD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522728; c=relaxed/simple;
	bh=z+4WICW1h3JC6/hseNyo0eFe/4uubqM+i0L3DRSiD5c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WBEUkevZQ20pxyNZHQInXV8A4typG30EP2bIDd/B8BM55fHkj38zEkinagDNMiAeHB+wT8ErqMdJPSfL2MT6h0qIlkFUK2OOrqTrabFC1Qdia51YLbDt1JuM0mlrlnsmByFm1QnC1p8Qf5XCNnOZDIxcEt6/hrRogfpPGj6f3tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=lvHhZ7xJ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="lvHhZ7xJ"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 08C73452D5;
	Tue,  1 Apr 2025 17:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1743522719;
	bh=z+4WICW1h3JC6/hseNyo0eFe/4uubqM+i0L3DRSiD5c=;
	h=Date:From:To:Subject:From;
	b=lvHhZ7xJqh8LzovQjrfg+DQSGAyBtJJFRS6cRsfA7nnBNCkvIdsux4qoXdSd0gMp0
	 VqVixOEgMZQT8Bx0ov6+mi4VZb0rjuaPn37dWLJpixKtiYmp71Wg/TSD/tRTKJDUIa
	 JLDsaimcgWWdb3ZYA1RnMPtC0oIlI/wkmZVFu3D+cWAtVg3Ix4qvQ0jgXPENighsG5
	 TmNtiBXTRPj27A3P/ATG942FH5KyTb/1w+vc81dG92lKQOAltxWWtsFjo1MGUBR8vZ
	 4/32wGsPDgh9E9ulk65tvomgLwSIk6OQGep9T18DUgB1eY6hjv8rWB5o48uFMItEFF
	 NG9xmwt157UmA==
Date: Tue, 1 Apr 2025 17:51:57 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 2nd, 2025
Message-ID: <Z-wLndJu1CM_K64R@8bytes.org>
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

Europe switched to summer time as well, so meeting time is back to
normal for all US participants.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
