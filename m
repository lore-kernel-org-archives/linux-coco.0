Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1723B16F83E
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195314; cv=none; b=U9kyH+JSHN1NN0rVo5T81gwbeAnfowzQXdeodHW8L/JGO/0Dj4lYwHmYGQO0NJtZWhWyspl4ZV14em1Fss9DX1qJNztw3B3XLJ/sFOhd2Ek1Ii3Av8gyTMRMTXZibSLNWv4+0F+mb/n0HVYIwByhMVMsxDSky3ILEZvkKBa1QOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195314; c=relaxed/simple;
	bh=D1vCetl9fXFNm3p4yN6sjVIB++BC7YKYsEGkFzcfCQg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LZw0s9gbD939x+d9aWEItL0EUvlglk7i5KKxRFFOpBOp6YE7GYQEMuojNEIVq9jVMDaMdQNJtG8b7ockQa8VhRlkDwuGE4f2lzGkcBCWOYwSYYUmZIdeeLdE9jeBuwxkRMEn+YRzSvtYopDpdA1c+oCVW4+rbZ51PuRnFE6ljhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=TtyZMiQf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="TtyZMiQf"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 268641C80A0;
	Wed, 12 Jun 2024 14:28:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1718195305;
	bh=D1vCetl9fXFNm3p4yN6sjVIB++BC7YKYsEGkFzcfCQg=;
	h=Date:From:To:Subject:From;
	b=TtyZMiQf176RxxUF+iM4KqqJE0tcnlp0Z7HVdq9aEdpNcf3Jwu7EZLoNT69BxCT8p
	 wq1NNZXvXF4YXUYsygIJvArAku8xFGB3P8eKVT4TDkJwzGSv1kgDFhtWk6KG/XHBzF
	 QFYIIkA+YCqY/DSe15uHyIpu9JUFHs0xVzaKN/KA+dLb4xk5zlAR1YRoOl0wL23L+0
	 FpZdkE2EQDOq0BFtX34lvYm2tCRbTB9NglgdHQnvDJvJSnmmN1j5L9jFGxwV339e8/
	 FcO1Ikn5i+88QmNuF0QtF3PGhMa/V+vskQy9vJXc0GP21qdgwfZ4X3UxQMFGpMXY5s
	 +kvoZk9v65jNA==
Date: Wed, 12 Jun 2024 14:28:23 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call June 12th, 2024
Message-ID: <ZmmUZ5-DoVjKtoE3@8bytes.org>
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

For now we have these items from Claudio:

	- What does TPM locality[1] mean for the SVSM vTPM?
	- Is there any SVSM boot event that we want to record in the TPM
	  PCRs/Event log?  E.g. a SVSM configuration, the OVMF hash, etc

Please note that there will be no SVSM Development Call next week, as I
will be at SUSECon on Wednesday. Next call after today will happen on
June 26th.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
