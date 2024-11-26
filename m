Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6941D8A0B
	for <linux-coco@lists.linux.dev>; Tue, 26 Nov 2024 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732639102; cv=none; b=RUF1qFJd8kmzL3Sm9s/ManB7Hr/fklT3SEamZInEWMf6cLF6beqJg/z/zhsxIoZm9HjqcrdFCy8tzc9O84/2FX6gHotMZhLr+H7rM0p7sq2u6wntVFc53jnJ6MIGZPhszhpM8HtfW7sq3q4d51SXm8QhzVmo6xfojagDHQwybxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732639102; c=relaxed/simple;
	bh=bqiW3Tp60+aakrswDODifRSSL7zrqN/wwmNjZqLBg78=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sS2TuIHjMjIJrvaLARGC6e+LpyBpMIuDcZ/Okr1z/L9fYhpXK6QGuWIltxSw5LZ0CUppLDUhKv6gTXYwO6Ka0YMicC1VPyoi5Nq4xmPiyn1HKtbhDDiw9uU8ITQxLDnVCWV18VNXHd9C5iJDQfjQg9Vngxqn6v58wJTsbi4IETY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=05vFRCKu; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="05vFRCKu"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B60BB2C2BC8;
	Tue, 26 Nov 2024 17:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1732639098;
	bh=bqiW3Tp60+aakrswDODifRSSL7zrqN/wwmNjZqLBg78=;
	h=Date:From:To:Subject:From;
	b=05vFRCKuQ2DbkMzgDWS6i2W1cvCweoqT+I8EtpMsEEcY8ysElyezjcN4Ptl6c2v4N
	 ZBnKa5vTXNnb6DpUy49F/iz+9ddDmX0C8PJDno2IkyV1ZEWLWw2v0h3TxWTDHk4SsJ
	 nnRmdfNBiutAnmOcYpEJPZa0b9yybKXusPoJ4XOc8aPg9fjZySdOd7J0hFy6GI/Qve
	 N4yfuSNGcdQP1pbUNV9BHva2uz+26NFsSWV7q9CIliyDHbHJNsbHsmIq2mp6UEsN5J
	 q+UUb6ViFPz7OGc4ExjhjGitaRZh+wd6hjB64Ikdx0dTSwHVYkEHHja5aVJfBSqkGL
	 FcrZZYwe1v2mA==
Date: Tue, 26 Nov 2024 17:38:17 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call November 27th, 2024
Message-ID: <Z0X5ebN6KE05gOR9@8bytes.org>
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
