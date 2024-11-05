Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A307DA7F
	for <linux-coco@lists.linux.dev>; Tue,  5 Nov 2024 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730826261; cv=none; b=asfIM01u7WdtDmJV+xjCEYyE9+nTgeXVt/3nNeLK+efREoag8RWIeKwy+OtwvAzYwnttZJg9SYCtQYdvhFZwIOEE/NL83qAu0ZlnFhnQ/ykNMBwKiGqX6tf7agzDUB3Vf30+lg8tRQAN3J3XlHSEdoV3CwqCY+l3AGjN8xS3JMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730826261; c=relaxed/simple;
	bh=wAkliHU1QVSkjYp0jkGcjlTZWGhyFl3c+7v3kBeqAAQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGqCOeyDfdLZhd2bwlf2Jdkp1kaATI8fI618l2YsWqPHg+0SrlCi2KqeqJXxbG2/88hQPSgiOWLrpglKX6PHtm8VzGn/2heCOXU+2HCZ/8SeUwX7LO5sKcfGkElu6EqgUvXJaq1h2y4uAV+k0tIRmIdV5Xyaa14OHesApFBX9Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=g+vSQK7v; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="g+vSQK7v"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 00D312A98A7;
	Tue,  5 Nov 2024 18:04:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730826258;
	bh=wAkliHU1QVSkjYp0jkGcjlTZWGhyFl3c+7v3kBeqAAQ=;
	h=Date:From:To:Subject:From;
	b=g+vSQK7vWexT8lWNseC/9sb85Uu376BTWyoT3dv2zVhavctqKD1YnSWujqQTO4NbZ
	 eZnfZOquP+p0EyAYGTkkwj/TU+VX6CEnsQbirkruteLqc6bbWl7G0QHHdXO5YAUcrx
	 7O2Xz9geN5N05fxHM1TPncchugL4OtCmgZ4E/nbEpPAzPyz33mDbd7btwXrvqw3XD7
	 jRXQl46/RoDPaQ9ypNWXZfviACcfwbftHFPBkIIxotUD2kam2TFayZR1VQ3KQmXofm
	 G4bFYcH6TEg8a58CCLDaZRooLOcdhhscjrlvhzO5YnxG+Ai6dEh9K7FIPpOc5ejEWR
	 kmLCuPw8w2UzA==
Date: Tue, 5 Nov 2024 18:04:16 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 6th, 2024
Message-ID: <ZypQEMu0tgeVttBy@8bytes.org>
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

Currently I have two topics on the agenda:

	* Release process/naming discussion.
	* Page (in-)validation discussion.

The US has switched to winter time as well, so meeting times are back to
normal for US participants.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
