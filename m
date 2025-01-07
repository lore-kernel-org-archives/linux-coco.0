Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088F41E47DD
	for <linux-coco@lists.linux.dev>; Tue,  7 Jan 2025 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265322; cv=none; b=hKk3jp7wlfrk9LtVe18jkqIzCdbbifDjJ0BZZtQGuEXR69omPa3iGlIg1q3iU7Z+nOiXvyIjVUelpHb7hOYHSiQgdxlT4A4Wm28N2jSlGXrxngFEvFPX5QfsQ6JxKtfmzMhSj6iIC7pwVpygh6wb6iIMev4kBQB4IDRITPP+Pbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265322; c=relaxed/simple;
	bh=X9q4em3x5WTw+abS6vep81x+TH6agoksM7fOc+NqwdA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7KhIk/4LCF38Q4n8WWpjsXLQQ9UGmPyVFMVRcoREie8bVX/9sFTL0nZ5dhWeOk+lVwrrOCsOrLmu0QA+8r7LHLgx8E3Jy+yXc1r0SUEpZRfkvdwbZVimDRmBU2ze4NngsB5Q47SEw48Tzd3Xy93yuSO/fSayC8DAWAdgDy6Wl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=nX2xj+SB; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="nX2xj+SB"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2D2C72E001D;
	Tue,  7 Jan 2025 16:55:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1736265313;
	bh=X9q4em3x5WTw+abS6vep81x+TH6agoksM7fOc+NqwdA=;
	h=Date:From:To:Subject:From;
	b=nX2xj+SBONb6Wap+aVWGOV+PZB1IUZdKKgTOQ5HIGJT2LAjudPQYqMLbY8RDjlN+g
	 rwia3oJbmI08Wq4stqvRA6S8UU5xe7Gs09jh5V3nlyUqucMliBMn1qNsYxpPJ4d+4w
	 zHQMAZuirj690Av/wj/Sv+fyuPzP2Rs17MaT2UsccuHZyrJ0ZYsUp07oOJXb0i7HY/
	 2zTruJSUnzUzZUkDqaI1q6b3DCzOqR7ZF90AAfp0dclSn0KAMd1FLFLH1HbFa8viqO
	 n7fWC1asS8jlBzg475vyjvUYpNn7UKUXfW5gDO999WOS71ZKxEHBilBoVWuZ/GoXwP
	 mOKiBum6Edm8A==
Date: Tue, 7 Jan 2025 16:55:12 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call January 8th, 2025
Message-ID: <Z31OYDtmN3DRe3oN@8bytes.org>
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

Happy new year everyone!

Here is the usual call for agenda items for the first SVSM development
call in 2025.  Please send me any agenda items you have in mind or raise
them in the meeting.

I have one item on the agenda so far:

	* IGVM support for QEMU.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
