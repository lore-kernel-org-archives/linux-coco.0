Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA40A125CD
	for <linux-coco@lists.linux.dev>; Wed, 10 Apr 2024 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712742244; cv=none; b=f59b2PdSen5A3cQoeVQMTjm9IPMEQHm3VKw0XhspV8i0OXL6QYbsC6gCS65OQ1JWOi3HPZg5RMhO59deWwyJ2MIki89C5r0j5xhvMy/L2gyLvgzG1B1k74Usu3fVNsfBHgjJVWBn9JGF3DqmTI4cq7GMw6bqdu4L3Ss48YS/9wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712742244; c=relaxed/simple;
	bh=Du6d+4K2uSuGLJ6RxdHzex/2jByGFhyn0QEIDqOMQkM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDsil33Ks2LRlOmBmeS+ihir0FZF8PZqznt6JcOOY2Y0kW5/uyB4F9KYXWUATC56pj88qIKFnCaWqwbId+Fp+f7yuqg3zWjEGng2YfV6oUuJJ80nezF1t+UeITblqdHiUhLzQV3pMPrnOKtwLDbr+arRVW+JG26/2FWuD5vMjLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=OMvxnkHx; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="OMvxnkHx"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 65E22281C79;
	Wed, 10 Apr 2024 11:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1712742235;
	bh=Du6d+4K2uSuGLJ6RxdHzex/2jByGFhyn0QEIDqOMQkM=;
	h=Date:From:To:Subject:From;
	b=OMvxnkHxyyejQkt1QzYcdDI+fUl+e8TaZ2b9ZIWuEbifLE8Llt5Nsu2lV8pAqs5uA
	 ujyztaTLxLRGNhCL1lYAzvUUvMLiwlkxf30cfi56pQPZBVB9n2Acme18oZBxa3xzt1
	 Eq6RgtZs/nv7Dj52gj8qaeMwqAJiCCtq7NOPQW63IdYzUGebyIAxhCRfWwxF/sRWDU
	 xqyq8U6ogw3A7brJwCNKpoePSOCo0GfTVi+gDtIHd4rdzCTCn6YhzqfJ9LHclrKpJH
	 GyafV4wgaNBXH6Kd6ezesLarapo/2mELUkoZu/3IlrzTwqpM853PopEIStI2J6Z6JM
	 AXCDQbQBl5zZQ==
Date: Wed, 10 Apr 2024 11:43:54 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 10th, 2024
Message-ID: <ZhZfWhyOQ4ZmTdVP@8bytes.org>
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
call. I don't have agenda items so far, please send me yours or raise
them during the meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
