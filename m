Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2761BC23
	for <linux-coco@lists.linux.dev>; Tue, 23 Apr 2024 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713887910; cv=none; b=N2qGaOm9dOJldu4JJMf6YoiGdvh/TpVAfboHvxpUnNP+C5P/yrF4NCkK7XVOluffxu4ULXwg/mee5iZtDFlNrQjVIQ3eIRQQnHXg9OMRmCsWu4nKYHBYKEv4Gws9elRfN0uubu1lLC+z0xUbQyfdHqjyRsgbQbOLb89va0etHFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713887910; c=relaxed/simple;
	bh=OWW7MjJWEQCbbWZesM7QRxgaYgogV/i66VqnLeu8RZA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mgvr4xXXZB4TZPQphbNbfi4hH+tEEFSE1MTnixFUNvt8XDm3xlO6ZpLo9/LMWSOWLaPJcUWwtq0vSKkj4faGp0/qcKRgIyty+AiSTdLfdf9V3PQLHcKf6hh8autY9cOm8DySR2d+fQwk5+6KXLkxklUYPkScvdCl2dEHhTFDtF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=zpScNNox; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="zpScNNox"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A4E041C96FB;
	Tue, 23 Apr 2024 17:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1713887564;
	bh=OWW7MjJWEQCbbWZesM7QRxgaYgogV/i66VqnLeu8RZA=;
	h=Date:From:To:Subject:From;
	b=zpScNNoxDPHL8n0b3JtEPRB+nj11DZrDnE267kzv3oCkGJdhuGeLgU7de0QyC5U9c
	 ZDRxwV36Aw45G2m/Tbrn77J0CRX0uxMjgy3M0sFrY0hsYedNsQhYU/+cFb5xIM6JOY
	 tQAJZyW4aXPCDlqVKz3PwqaJcna+smgh01tcAzbw9aic0JRevI209hWgekD/Bz4K1C
	 UDJ5RzEqMgv+Jsy1krt6IparXeWtx/zKk4q5SFB33pom1Oj2GBK5+ESbREOnVngfEX
	 FilABrwh7TABDiHtwb87YdSpQlKQZF8oMzyOwtjjsOkEau8A0kACGWxgzCkEx5aeUG
	 3OyUsgWj3HZuA==
Date: Tue, 23 Apr 2024 17:52:43 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 24th, 2024
Message-ID: <ZifZS6_Rx8bTbceb@8bytes.org>
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
call. I have one item so far:

	* User-mode PR status

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
