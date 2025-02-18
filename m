Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C880286297
	for <linux-coco@lists.linux.dev>; Tue, 18 Feb 2025 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739915502; cv=none; b=mwS7FQFJ2oy4daT35XmTeU+wXbilVBUNDIksKFoNGEFuT4s+Ss+6T88+gOb62H/fLwVtfMApxbWW4ZzcO6EWSqPtMtm728VZOoJFoDlwRHFE3FTFDSfvmt0GpvW7E4dh8L/KXp0+ZSteHIEGBBGjxF8RLKQwnNINPdL6vMEHYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739915502; c=relaxed/simple;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RV8pkRPyYcM9I4lw+w9tI9b57Diig1x+A0iCRU357SWPLKZKGjyBT1/154c4wohl8D1NZk4vV5PLD6y6lRjY88eBYn7RIQq4SJIn3U9n75bymnMqm/C1hzuPs3zGBb2kccK0g4XKlWFippbv8cgVDKkjqKiPXcNPQa4pDGgrr0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ytINmC1o; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ytINmC1o"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A744142CCA;
	Tue, 18 Feb 2025 22:51:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1739915492;
	bh=HpMgsmYmsp7YzjV1SnDY9CliB1CGj4Kn6fZ1unPZ0Iw=;
	h=Date:From:To:Subject:From;
	b=ytINmC1oToCJIyWloswdqsIj9BgpLlRecBARJCHSCs9iF5btjyBAeIKhZUkQ9SLcV
	 D2sQkZTA9AyPAi9KdbiTANkfK9rMI8ZwtV3fQiazF3x/tFYzx/cNcPjyyEKtSLtViz
	 cxqB1yWOjGBMkAF7sxszybSl8In+BP0bUpThZs4Y7aaMdp81AlE8aRDBM0+FnDhiwu
	 MoHkIUxmD6gnx5OY2aImMje6lqaML+YafNf2mMAlIhB4DHXBaa1L4ekvXq0AtWEvNT
	 NFowPxWGhjvqN0q6iiz+Sq5PjglVnWfS3Fp4qBLS3iWp9M+uzJHcq8lJpbMoZbIs4o
	 V4PtCknx/Qs8A==
Date: Tue, 18 Feb 2025 22:51:31 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 19th, 2025
Message-ID: <Z7UA44UQxp27TnAB@8bytes.org>
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
