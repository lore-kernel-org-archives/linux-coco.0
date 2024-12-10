Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEAF224AEC
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733856391; cv=none; b=XK+kKEJ5lXhcBgprjtYuHuip1Ekz8AN7qRBjGT1JIqhbHpKg1ZQWJV79Pi/yYmzluW0NE5JRK4yO2ksWFrM9czlfOvYrQWBAZs/gmRzro6IYNZY8DmK/ozH5IG5aSy2oOjUnFd3lJlTMLhOEvY8sE5byFnoPRv5Y6UTjvJwAIbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733856391; c=relaxed/simple;
	bh=ZNDed6cJTJkX1bPsgO1sgDXNXg63P9FbLmzKwFAaLwA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L2SziY07Wv24kIJIkVpwr/MrAWBoVI1UcQP+C5Hp7+1PllKHfdXUZYuuu2ZWQ8TUqlxojzqplmvN4pMnUlNHNLrIZvmxKmFcc90Os8TjcKR9XF1X1BBrrZACL5FAENQER6ISdVM53z6EQrcUJlhxK+QYUvMulB6wSN+P7PLhi3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Nzu/wt08; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Nzu/wt08"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B11262C0E20;
	Tue, 10 Dec 2024 19:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1733856387;
	bh=ZNDed6cJTJkX1bPsgO1sgDXNXg63P9FbLmzKwFAaLwA=;
	h=Date:From:To:Subject:From;
	b=Nzu/wt089YrTdZYX6ISgi7a7FL9c2ONRjrTSgit+XnnVVHFtjfJ7BFquvEygs1vhi
	 +neSSqPaWGZYFXP2+rFFBJaLbSngZasP+Kg5ORD7iw8IKNKex9r6RQJsJieFi8UoXy
	 7xfJlx5JTaeSOWEzMptG38wQIk0MORxR8deVKYmrA7+Jmmm6Cw0A9okzSMyJQKtxNj
	 TRCMQZqAUpaSqjcnsYwzNzgA0ikC38KitUZCAguU+GfZqjbWada3JtaAhrKfeQK+oK
	 yJyrMhz9xaMeOoLyfGw0uud28T9SlghrhW1+i/iDaYWGxnxMY5SlYHD+JBuxiMjKDq
	 8M2M2stMwu4PQ==
Date: Tue, 10 Dec 2024 19:46:26 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call December 11th, 2024
Message-ID: <Z1iMgi1TOgv-sHtZ@8bytes.org>
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

So far I have one topic I want to talk about:

	* Rust allocator crates for user-mode alloc support. I'd like to
	  hear if someone has more input on that, I have looked at a
	  couple of available crates but have not found something fully
	  convincing yet.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
