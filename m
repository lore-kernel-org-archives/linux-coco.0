Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0E6188CB1
	for <linux-coco@lists.linux.dev>; Tue, 25 Feb 2025 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518207; cv=none; b=sx4HOk5QM7RC0YxjmrIOW5TSHrRBlnM+DgVUXwNUkV7VPmKvNYHi/9nZ1z2/uKIL9F9NqtkXtLV3dRCAMiBHUIF9Wy0vlACAnWczJ3xq6yQHGzJMq27IyIV7kIEWWU6G7WFVoOckIlMvKrh4Qt7uCEElswAEeaokL/QRd7CGyXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518207; c=relaxed/simple;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wn3RxW2+/UDZWttHuQhI2AddyI2GCNJaQRa4JU+TwYqX6M4ZRqqxkF9IWCttt0uJn2K36jyIOHLUmwwWUQtqI+hwCHii5m96d9gHyKcitIowWJhodzT9NUgGAODq5TZO0sqwzpesk7W4fX8fcel47bzD4El7vC5mPiGsnA9sMsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=OotB0Rnm; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="OotB0Rnm"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E56C541A0F;
	Tue, 25 Feb 2025 22:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1740518198;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:From;
	b=OotB0Rnm1B+YPJ2HnUXZ8D7w9hTbleRvaXJfdasMcLVh9QaTMbNMteJozFmIWgMCy
	 SkAeIR7EOBMd008nFWW17O1RJdVW3imdvxz8PQO8/dbPrqTr0+aT1AXSn1cJLHzCkk
	 2Ym6oNRij+cWXP+jTsmk0A/FWH23m4Uz/iapU77QYQq4LT5Pg5fyszOMaxIAVJ7ntl
	 KerfJSdIoSWkx5QF7yI+Fsgs2FM41WRab2Jp4rXNWMISvVq1AgVo9fZei64JKHBB+m
	 Cywbg2mQZyU8visWi+iR24urE1XSU1wt/BcbXD1rVGi5lzpjf5z97yFaLt9QuDCVy4
	 oo597Vcjyap5g==
Date: Tue, 25 Feb 2025 22:16:36 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 26th, 2025
Message-ID: <Z74zNJjPvsnSlotP@8bytes.org>
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
