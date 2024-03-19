Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA4280039
	for <linux-coco@lists.linux.dev>; Tue, 19 Mar 2024 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710853949; cv=none; b=aYwr6+n6PcAXP6hci8jYEQJ5Lk3AlIFrTQEcprCMmwHcEtL3UqyJl3u2UH5sps1rvxwOAQkMsqnO/r96WSa+1xcUHSCtXXSO//2zDgWOz2ixyepI7eKwn9n7QeLwMYOiicKfPQr/spw1fZUTSFqC864Cqow+UgQ2Zy0S20creiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710853949; c=relaxed/simple;
	bh=KtTY1vRYNAvCOPSh96eqSezTk9RjOAm75dFIb9H5Jx8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+vGszDu+P+DwVYiFcFwyiq5oO6LGQF2uVpe0gchdHBHtTJYToQhjPlxpuI1h/cqVpdkAeI776qAE2jdMwKURWS7dAQd42m/rLEh5JhYJSk8kTyC25y43yJ2WkRdwA0HN7WJGTsnuDE86heUz6ltN1f9AAil2e7Y+aFrIkwlogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=j0AkF1cH; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="j0AkF1cH"
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B05B41E238B;
	Tue, 19 Mar 2024 14:12:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1710853936;
	bh=KtTY1vRYNAvCOPSh96eqSezTk9RjOAm75dFIb9H5Jx8=;
	h=Date:From:To:Subject:From;
	b=j0AkF1cHi+aizii3MUbNLOQ11b28VrOjzr1U5Q5Ma4UfBb0qlEZ9fdduM37kVQHWT
	 EsJP2oG8N55Sqvf4tnfBy0ZsA2d775jCB3ztRNxcXHMsMqvEzY5kO/xz/TY+0600Ix
	 XE14FBK5sTozC+PHN0I2VZlteujiDXR6SSmmO+ap9J4akVLO5oojb5Ioinme1pmkeQ
	 0G29d7Vw9ExUqZSz/6phik8B0xElwi37pQaJ6FmEWUs2l6ySD8fZyn3Zyn8mo1yAyH
	 qrn36iBJ4kdSOvbMIQ4SzdyIOzuzbMEZTs4LRPlNWUPv1UyUWaV/kzfEH3nGEZyqw9
	 QhCRI1mkj60LA==
Date: Tue, 19 Mar 2024 14:12:01 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 20th, 2024
Message-ID: <ZfmPIXGDd-69c9xp@8bytes.org>
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
call. My agenda so far is:

	* vTPM merge
	* SVSM attestation architecture
	* Vendored dependencies in the repo

Not sure if we can discuss all of these items, if not they will be moved
to the next meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our shiny new governance repository at:

	https://github.com/coconut-svsm/governance

Please note that the meeting will be recorded and the recording
eventually published.

See you all there.

Regards,

	Jörg
