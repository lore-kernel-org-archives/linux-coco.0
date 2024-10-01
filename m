Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550B228FF
	for <linux-coco@lists.linux.dev>; Tue,  1 Oct 2024 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727796744; cv=none; b=u8oDLI84u9P7vpBC281CnJ9nHUAZQlNqP75jGuxIj8aVuxGkgzoWsZ6zaqg4ujvceP0m9w/TB4LFK9Leu9RURCIQmg7kvBxN9mxLD9ToMrRYfDTDZmPa4vsb1y1XXnaoz7GQSgoYoj/NjjkxvAScH9c9+hVawFTqQ0HGyezziog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727796744; c=relaxed/simple;
	bh=Me/xZXswu65KS/AftujS2K0S9xnSsRHt0/yng1FkWHE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9CKAaniTjskQiANCE4vt0Fa/dYv7Z6d5Ua8eqsyejb3FlaUZk9P3UhMp1vLYW5bbTuV5M+pRrIKaHWbqDD2j3MuAUKRKdj005y9ORWEu6knZieOObllKgXe18E8Ic6kD94VHLKfJnFQhuj7pq5GXNvERT76mZQk1iRY63181rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=hSoRM1VK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="hSoRM1VK"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 45D462A6267;
	Tue,  1 Oct 2024 17:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1727796734;
	bh=Me/xZXswu65KS/AftujS2K0S9xnSsRHt0/yng1FkWHE=;
	h=Date:From:To:Subject:From;
	b=hSoRM1VKD4idLkIBFjVPcXVLpyhjokS/5nTH3YZs20EurEawvheM2w/cz4OJHsiS/
	 5aCLhOyxsuf+28ghfYAjFalz5dZ1kdUx9ViEp4o2BRQh5S8WVhA3OqBkKetfkaccxB
	 5FREWRQCJfNH+MVQ2J8PE0PmaIC+kq3DY1jhSX4EhNWwNSd9XrN34btrHhm8ercLBs
	 OmliX+zGuYuuCIQHXeXiZyF6yHgdFylDswCyESXVzQZkqmLuDIRyC+2uq0u2SWKTMP
	 wRQ4XQhtdprFtVa5ng4FD2+JuNKmraUvDq9peUKjHGmvCwrF1+jNmfg0uEIFjuNV8J
	 mjI8jNFWmzyHw==
Date: Tue, 1 Oct 2024 17:32:13 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call October 2nd, 2024
Message-ID: <ZvwV_eEVNqhNpgky@8bytes.org>
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

Note that next week will be no SVSM Call, as I am off for the whole
week.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
