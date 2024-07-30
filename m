Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5265C1A257A
	for <linux-coco@lists.linux.dev>; Tue, 30 Jul 2024 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353739; cv=none; b=egcu1Ktw9ryfNXTpsZcfreRGTXuSiAJr2ac4giufevFRz17JYBiunrQoksFkOe0p3AZOwS9gCWTBJvLQG+wG5HTnQRak4FDmMlfKRdIxO1YSolDj3pJMGRr0VzkUfvxNTkFgWux/NLAzXfeBx2LVtrXFvYCw2bLsjPZbweqE+IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353739; c=relaxed/simple;
	bh=tTsbuTQ00zysgE3cSRK8WQxOxnwDtfkoCjHJIkSZWJ8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T5mEcI1sUKp8g1KESInYg0w3vOwI+BvnhYjDUWZ82y59gsejYeSYYrMAL9+XUXKjSEGZnYYOh6u9xzgcc/F8+3ASCxn7NY87mxpBPj4aaNlHp7DjYk0PYmhvRwjTrC74nOfQmYG9iw1Zv9yZzS0W0EjPAINbCrb/ABr2nqQr9cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=1Fp3PsCe; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="1Fp3PsCe"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D8B882A41C1;
	Tue, 30 Jul 2024 17:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1722353347;
	bh=tTsbuTQ00zysgE3cSRK8WQxOxnwDtfkoCjHJIkSZWJ8=;
	h=Date:From:To:Subject:From;
	b=1Fp3PsCe3qMSB0fzurtkl7cy52B04yadXFgnqcDDAV7NkV3vgAomsccqw9ZVQCaoZ
	 hNXRMJUqCmlbi2Q9i8S2+hrXEYnWxsfvWsbrDSKEodk2xMQRZNN9a4qTlx6mzr0N0v
	 8TMfmimQfM7HsqbsUYP6ZAyQooSKIg3jfpcWdYwytL+FELT4RjxEqDccn0SgSTaUFE
	 yUn5+krf8S0Ew79MqC3H8bicRsUUR3ZY7H0Lq8cJFsAhzEv/JBcIQ27p7N1fqoMnEc
	 Bf/I/nsAtmErAYZLhfJ5bz746st/m0YIOqbvmqX4UOfHA4wtoUa5O8AmYTXRE7nZE6
	 /xgpmH344gSpg==
Date: Tue, 30 Jul 2024 17:29:06 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call July 31st, 2024
Message-ID: <ZqkGwtfMx_OisW6q@8bytes.org>
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

Currently on the agenda:

	* Can stage1 be removed?
	* Pros and cons for requiring specific stable Rust versions
	  (tied to PR #428)

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
