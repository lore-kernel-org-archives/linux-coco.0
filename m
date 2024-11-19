Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104D81D2F50
	for <linux-coco@lists.linux.dev>; Tue, 19 Nov 2024 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732037085; cv=none; b=tL5ObffwLPw1joeLGft4RpZmzSc+iDQWeOCAuiQMHpBft3CuIYtb03LXTPmwjIvUBtJaCMhIf+8fJze4IVeVtvZWq1g1oVpUnwyzcPl2/xudO/Te8EW0xwuj3raUNt6GVtK9qsyVU6lQLJvK9d7fmslh6lzzyep1EwucL3mVCAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732037085; c=relaxed/simple;
	bh=F4RNofEwSU92UgBEryV+kXQ2nLsLK9fSPNJFSbkV5iQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0J/TRw57KEf13KFeZD6HwPev7mZp2Zj2+BCuHdUHh05mCFNdCxdnI1HulBK/xKcAjB9wIDsDMpUJybix+p9uwPsACVbyB+Lg0hEf7QhRk6GXAJscvi6lUvI+e4JZwW+znq2Ck//kYAcUFpLOIy0TUbDCMBrtEKh27rqOvC6af0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=l81bOMmQ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="l81bOMmQ"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7149D2C0DCB;
	Tue, 19 Nov 2024 18:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1732037076;
	bh=F4RNofEwSU92UgBEryV+kXQ2nLsLK9fSPNJFSbkV5iQ=;
	h=Date:From:To:Subject:From;
	b=l81bOMmQy40O/7BvWQ+/XpHphy9krMua23saGbehOhhbr/J37VOzmKwOayIsmqp5m
	 yjvjwtPd4D8hRBSknpi/OLhT5twSB4BTMtpxhOl6DI+3V3XwOn2q6J+irFcOHX7A10
	 fmQSQjw5Z6dVXWg3OUCtQHXH5wLzi6n4qUyl3Hw5ecqgAc9GuNPUeW8vQmcjuYSFt+
	 ASed0qnsufR7PRZNqE4u/hTR4FH3eWqmznshEDbWuUqttPowgixIXHVe8qZzrKcLd/
	 zWigr6AToIWOrebhjkacXPh00GrEi2dQ7VePgBFPs71y40EWWogvT/1re62H2Q3QRH
	 5zOb7R8r1/GmA==
Date: Tue, 19 Nov 2024 18:24:35 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 20th, 2024
Message-ID: <ZzzJ0-ROnSW0SZ1G@8bytes.org>
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

I have one agenda item so far:

	* Build system PR overview and discussion.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
