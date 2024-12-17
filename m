Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF0614A0B9
	for <linux-coco@lists.linux.dev>; Tue, 17 Dec 2024 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734459356; cv=none; b=LE+9/pOhWE5qj9x06B2qdGkkUqMr6sFcphmzziD+KoDW8S0pgvxOwVtInTOytP3nxRFVdMvtbfajyNmz0ATJhC03BKgVOuPRJkiirr3bOgBD+QEZQPugdELXew5v5OVbyYPnYS8PwMpBNzjwQWt/FvQwCmu1zt+Vnrht78V4c8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734459356; c=relaxed/simple;
	bh=bqiW3Tp60+aakrswDODifRSSL7zrqN/wwmNjZqLBg78=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXtSBSJdG8F5CWMa4Hym1zmMLH4AcQq1z3nUO//flITAJAI0nRwIVnMRl0c2otlBesuPzzh+lNnA67GchWgQPl4LAVsu7DBYoJmRhFEy1ZLWPMmJ5VnkiqiKb379H5XiUe+IZYWOkrC8ZS7bgm+tDfVjVjwZHP7JA1E3EMFmwvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=OFlQ8Pst; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="OFlQ8Pst"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B96392C1A5A;
	Tue, 17 Dec 2024 19:10:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1734459027;
	bh=bqiW3Tp60+aakrswDODifRSSL7zrqN/wwmNjZqLBg78=;
	h=Date:From:To:Subject:From;
	b=OFlQ8PstVWkliNDGDkb3GSeIJVhxC4ejEeX+eHiAF0tIPJ3BjIkIcObSUywm/HBN5
	 6aRl2tjzw5eFXW7UNt0BpOr0eQz5GE61A2TOliqXxwbtg556irHaHCdl1HRySjQ9oS
	 M/W797xS2CDitHbjF5LYhqbveQDzni02piU4vRiIb11vqFsBvpiBuUL+UWdPZpw4ht
	 39yUVDHKFlj4w87kVIsHgU2qx2P1mCrjzHip2I9KhqxY153w3oVESvzoX9TGJ9jVps
	 8o3o7/cuMCfahLa/b6t0zY11PAisVu8mHUB1nJQ2qYxcSTPDNxUVLiTxKkmbVRzoel
	 XyN5kNxDIqAtQ==
Date: Tue, 17 Dec 2024 19:10:26 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call December 18th, 2024
Message-ID: <Z2G-knjoWeL2hLyt@8bytes.org>
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
call.  Please send me any agenda items you have in mind or raise them in
the meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
