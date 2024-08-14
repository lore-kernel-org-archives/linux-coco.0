Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6852F1AD9C0
	for <linux-coco@lists.linux.dev>; Wed, 14 Aug 2024 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723630675; cv=none; b=WpdRBrQgRhH1kkV3X9MiCcakfDkkZw04TIpx5SwIYtK9wU3iXYkeHlxfi3Fr8RIoVExi70LRYinZti96PQvuuy+FL1j5aFFM7KBHjt7urrh2BNfbCinV3qXe5/6NmlUtcvYzZjULD2drPVw8ec64RGTPpRtxnZsYfLWfZ3oZ9gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723630675; c=relaxed/simple;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huoxlTM2aBMOjFvc8ZjbD7pgR3vwf5Tg+1yzV+ejD0LuLbC1++6uUac1Gyhux9Wls8nsjE3KhkBaX+A18BJWXVxGW+84c5NmDpynDN8dybcUp9dZelXomkHWzL39NoXEhpr4hQW9wVb615Ly30wi0LktbvCh4KcS3gsEbERQJSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=R1whS517; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="R1whS517"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0F4402A59B3;
	Wed, 14 Aug 2024 12:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1723630665;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:From;
	b=R1whS517PY2I4jq2PNXaqer97usrRvH0DZ1ElQktVTno0HxWU3U9dS3U0Ew8biS6J
	 b1rCkToVYaLg27toqjAFKd1z920jFs1axptGOCyV5d0gQ2C/RSu2kjrkut5jf0i3RO
	 TtjdrV7OactpowZrRWhdd7V8U0yKTlfw7D5imrAHn/OlkxCf5OY0tjsKiAci3NURX6
	 R61YL/jkOOlPyHnmNt1jEd/NN9GLITKnWvsAoOadvSP5/okwRzpyI8j5p1/SPxy5xF
	 tM5wbMdkc/0YxXIg0u2J0Bwg6PzouAPAiNSF9W+zOc3a5hdIpoLavfqugadgllL7Cc
	 mpKOCkBdy8KYA==
Date: Wed, 14 Aug 2024 12:17:43 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call August 14th, 2024
Message-ID: <ZryER6RlLjgUKsze@8bytes.org>
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

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
