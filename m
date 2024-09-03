Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC09518A6A3
	for <linux-coco@lists.linux.dev>; Tue,  3 Sep 2024 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377047; cv=none; b=T6/tXbpdzdXjrKy2JohzaDYv3wWHxdOOuoIFos/DmFWFiOCagi/E3YsToyPA/Ptv/l4ZW3NlTX0w2R1z2N8FbymK8hNtutEHTxk7i9jO2LaDIBeEE8tSpUJOdJLvTEU0v4OFDl1INKIX+Wnmxn/apNSewUimwGEryVDS2WUg6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377047; c=relaxed/simple;
	bh=GGhUW9fvehn2LonobaUCXXzd5H3jeUwORedzANqFD4g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZVm7ncw6ZeLUtYd536xJu7f28Shi2UlU8QjgueMxbivBKwEsOGs2zGNo2p3ubbhxcUVprGYMQfB3iHMiFmc/z51WpS9Je3k/FJIZgz8xPEMFbE5QxkHxJtPMQteAPB2+9nwK+gehyW8w31HjBlqFSoZA0wthbyH7m3Zw1H5TD/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=7Cn4YHd2; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="7Cn4YHd2"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 67AED28820E;
	Tue,  3 Sep 2024 17:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1725377043;
	bh=GGhUW9fvehn2LonobaUCXXzd5H3jeUwORedzANqFD4g=;
	h=Date:From:To:Subject:From;
	b=7Cn4YHd2D/6WpeIJtJESG7C27P8/Rm9UPotLl6IY2PjnxRBI75B21TL8zWGiHWJhC
	 Ux1PyDW/LvbseJyyRQvlb3n0iVpAS48RA5BVy41nxQlS4xv3aqhFr7joN9ze4SyEcv
	 A6U8nfpJ+KmLqOYlQ6jNidBdK3qOyt2KjLhPNqSw5N/0WZsSf2VM5Smi450iKsgYbV
	 7mZJXQYUdySToS5kWnjMOqiXn6wLK74+qGrSsdBkdw/0GNIFjjq5Eo1hSvPLhW+5bq
	 vkJg/ahBfohrSDS5as3R729XzWRgN5LFOvehuF1rmjSXoHizGJKprduLSfLGkg4Zkw
	 J2qpj8DTx7WNg==
Date: Tue, 3 Sep 2024 17:24:02 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 4th, 2024
Message-ID: <ZtcqEhX5tnf4q5yj@8bytes.org>
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

We have one topic to resume from last week:

	* Early attestation document - Status and next steps.
	  Link: https://docs.google.com/document/d/11ZsxP8jsviP3ddp9Hrn0rf6inttNw_Pbnz0psXlxlPs

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
