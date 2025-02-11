Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF8526BD8E
	for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291335; cv=none; b=IlUFWmxstxWPjNkegvWWEWyXwe+G6yQnpDPOrQaVCYbmof2zxg7XNakeibtJD2u1wIx/1hL7RIXoPhiexBdXdVZY4voSz3DUsbl+A6NE2JZUPj37UtrmAtxajgh5AGO6qozhaloanvfrrAcoigH41zIIEY4Z+YhbIu8iwZ7f4cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291335; c=relaxed/simple;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aiovj7lCdvFP7Yji0HA/Z62U4LdhavcjXPMU9brwB5FKHVtjlwUk0RV7tkwceyxCjzxgGH2a68CDfRobBvKDG3qgdijkiT4s0WmloSGb6cn4ZngjFGO5/s6UnJ3ZcLJjK+kZ8eXzec/J4t/MNh/+Ut4h2ns3Fly7fbP9vnojPbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=UzN8+ljJ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="UzN8+ljJ"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4B56541F6B;
	Tue, 11 Feb 2025 17:28:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1739291326;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:From;
	b=UzN8+ljJOpSBhT9ZXazAHl4ec3YUlvwPv4WRHh3/3orqch49k/m3Is0ouaFgxGVE8
	 6zdtKC1uepzm7Z+Uk7Cnw+o59LkrSABBstB1jHFHClhOUbImAGLxKXAaRWI0uykF5c
	 ZOKLWpKdJjBFiw37zzDdoJPo4iJAYVNoqABLpMxcWS6DYWMz21upElZ7remhLbalWN
	 Cnym8IYLZJtfaUdNF0xsDqZuO689f3DhGk5ptTolFE5KS9/+sOtoXmKt2/zGcAiMy+
	 626o/impcVYy2tytaE7UJEdqgLEwswgDdRpzJYOKUHevw9/HQbHi4mtAR7t+hd7iQl
	 QOrAv2iwDfaSg==
Date: Tue, 11 Feb 2025 17:28:45 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 12th, 2025
Message-ID: <Z6t6vQDVr9xYTlqx@8bytes.org>
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
