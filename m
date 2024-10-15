Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386253BBF6
	for <linux-coco@lists.linux.dev>; Tue, 15 Oct 2024 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729007410; cv=none; b=vEZMbqykdvBczFhCBwyceByxCI42rcDAZISF6iAcwczm7ilv/E4xuqBqxkdBcMcjQr0ozKwZw4l/hpt0mpKDu3eCl+o0mGVi+X4HtWXt+Db+LDNvedw8FI3t1D/uNEBhw90EXsGUt5y5dR+WfB428FPtwU8wHjxCi+V8+s8503M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729007410; c=relaxed/simple;
	bh=X3omtTaqM7MPcUeto69H7xS6O+r+jCuV69wewPBSqww=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JU6eDoQq9hE99U8qOlOF+ZvE/Xc2NUdyZVmmUVjT72L9DZ8QrVHaOIB7D/f0MrQr/zz4tj3Qkx14NY6FbtsUdF/ai/AzJNJRdOwFnFQdvnLPAZZDiqXHhl52b+czVoEsQbCYi6RF8N8hVlQ7zay2CKtLwJvQZK+JUDJhAnvwlVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=dIza3KEP; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="dIza3KEP"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A43D72A79EB;
	Tue, 15 Oct 2024 17:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1729007406;
	bh=X3omtTaqM7MPcUeto69H7xS6O+r+jCuV69wewPBSqww=;
	h=Date:From:To:Subject:From;
	b=dIza3KEP44ODgCy5IoKgGxMoXesl27G9YoH5CLnnsU3BoujcVScuxRBMNOx8P1WnY
	 YA4ApR39/XQhb20Y6rh2V/+IIFqc2dliOCzDLzGZWPiQIRI+krWnZndNGTpV5Z5zlh
	 DSe7pPJtUAhq2w99DuCaQDNn7y/hkUhYYvPYllMkIrd1G3xeZ1U8LqaJbKg6KPa+C/
	 hvlW5YQNh6UfBGFj7gsM3rTrKlpVysv/oyQgyu+TYgH3aY1UcA9uTYonySX3FGxpk1
	 Mt+3k+YplIsmyylnhxdPwFLEaV4VmhlM3gcU4lIcac3NnYQ7MFQCpNSCUGmBtvdOBb
	 UUWD8sf2yl84Q==
Date: Tue, 15 Oct 2024 17:50:05 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call October 16th, 2024
Message-ID: <Zw6PLUNF5hviin1s@8bytes.org>
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

Currently on my agenda:

	* COCONUT related OC3 submissions
	* Rust version bump

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
