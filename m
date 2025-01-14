Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00AC1D5145
	for <linux-coco@lists.linux.dev>; Tue, 14 Jan 2025 18:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879829; cv=none; b=q9JgnIe9qcz7bElmI3S7fCIhBGSK+BTj+tDmmb/2g3MiOwHI5naDbVX3kpCkLi+CtY9zi1uPCyMR6b2z2ThR9nH0lj8gQOvPeOU4J+Mpv6c7+1wTveZ7448KEi000+OM9PhfVc2CwWygU26tJEyrUL1diT7da/+4VVKCAl2hAMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879829; c=relaxed/simple;
	bh=BFiSF6YU/NdhlztmH917Ny4DfasK07lCAdxTpT9ROXQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmJSjQfEEhj0PWhni6qwAGPuSv36RMtNx3EYkN56ktKq103RIKpbtM7XTqj/DDfjSy2cmp5nk74tS0Srm1L10Os16XlnJ0VI3+F6b8XQVfMUIEXQANPiivs3oVj2h60h5xFZ5gt/wVjs6wNzvfJhHc6jFc/6FVrCeLHfNrEuXDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=lysjbIjY; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="lysjbIjY"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B887C2E001D;
	Tue, 14 Jan 2025 19:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1736879819;
	bh=BFiSF6YU/NdhlztmH917Ny4DfasK07lCAdxTpT9ROXQ=;
	h=Date:From:To:Subject:From;
	b=lysjbIjYqNRcqLHbze7lIkjXaRsY8YHS9cO9rsXOdT8tMn/Di5yyvik6D3JPGfNeL
	 +8x6Sb5Gk5d2SXb3C69dwcOB9cZJ1fyFRbWSU4z+WKCDGQbR9Cl3qECvaZjKIYEMLj
	 uSnlC0QAnHHrkA7oxCv1hVyd5h5gI7vKFKgROB6kMGvxiwtiUll0+VliupBeMT/jT+
	 kI3FYRIDSwohQd0mvWDErbKJLfGcuDLWoqESmi7LrDQ5r6F6DsWj/TQ5GN/zWVck2N
	 ZdmD6edUf90lD19+rbo72pBFu2fJOYmTermoVPe9+78e91q5GnQUFjcqIslT0IwEKu
	 zGhOlksozYB7g==
Date: Tue, 14 Jan 2025 19:36:58 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call January 15th, 2025
Message-ID: <Z4auyrg-qgsGhM42@8bytes.org>
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

Here is the usual call for agenda items for the first SVSM development
call in 2025.  Please send me any agenda items you have in mind or raise
them in the meeting.

There is one item on the agenda so far:

	* Presentation and discussion of vTPM Persistent Proposal

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
