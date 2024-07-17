Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A91517E91B
	for <linux-coco@lists.linux.dev>; Wed, 17 Jul 2024 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222397; cv=none; b=beWbW6q+Da2c1bUpeUSHqwVeFmQcZ0PJeh140orUwpSHtXCN95QzCsR5ElafIb3lEy5O79AN4y08noTCFfhq++u8875qy2HzsUO9Nw+A1dw4ebUteKNJQEyyVuqpI1EBPo3PL5KF9I44q7xtJTOyNo84r2W0y4qnetgPyE/8wu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222397; c=relaxed/simple;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXPkEQLZz+GMFUsHeyTVp+z/SxiZAHjZIFYPZzZpX5E3g70YnsM1E5Q4DDMpaJPPPtUqmd7mqtuB7rg3PTGDbgAjBc/0nu/2m7Ax00QPq74vd+b0+5URCjyXapk3TD6tKb2PfhKczRaesPcnSpJYCzqFVcGaB6uLySXHIRXb0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ake+VLlG; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ake+VLlG"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6F96A1C49F9;
	Wed, 17 Jul 2024 15:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1721222065;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:From;
	b=ake+VLlGCB1vIZcKrWwtVNqtkNzJ7xhorzPnKWEmpRqJ5svIhwVI/skz0LxnUBHMw
	 oJgiv3/tk/DPJH6Y8m1RH27SlUIQxRtikeuK/PZvFLlMAoByz8z9zZMEKM5ocQorjP
	 JId6hZQ1eJ1jTHXNZMUEwSkXFWLMDWLme+UryqLoRrqH3pf4sCNwP+2LZiZr4c/gZx
	 aml9Yl1YVxiQK5EDbF4AyhUVBEtqkjm/E8q1C1KGriJYQKaZiYyyMZjTJBWVHk5300
	 sJZBX9aLxAopROvW7U96yKDVWvmGvw/YozVdcqmh1FORVWGUMx6/PYup9+v/uj2qbw
	 cB+5CrWvk56ag==
Date: Wed, 17 Jul 2024 15:14:24 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call July 17th, 2024
Message-ID: <ZpfDsB66UnU9oodo@8bytes.org>
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

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
