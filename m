Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2919313DDB9
	for <linux-coco@lists.linux.dev>; Wed, 11 Sep 2024 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040594; cv=none; b=OJAEe/9SNJa88jeC6D5Yw/YeYy1cmTacLwRA32y9+GAS23of3283mvKLzVTDdeOohz/5giHUhUXfMTAy9L+7Iz1cv79hKX8xKbN2lK7s+jkun2wrkByspiHt154ebq6YD5n7kZ1e93XAfhuDugHSqrUym2L+3ihGC+l/d4DdShM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040594; c=relaxed/simple;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qu6zaXXswGl3nKpRsEMNngiCep/Vxh+yauLJO7Rm7PSdi7uEQlpZb5moTK2C0RPJG0fmXroGJIihpAMnfRbZVUD5RSeDpyIqLF4+rD7dfMGmYGj10cSTiwRj4IxmLBP4kHAGLcPRAnzpX3vK3ng1aLcRH7Lg1HA2HvupU4TKTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Q3cByKD1; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Q3cByKD1"
Received: from 8bytes.org (p4ffe1f47.dip0.t-ipconnect.de [79.254.31.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7A5372896F4;
	Wed, 11 Sep 2024 09:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1726040585;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:From;
	b=Q3cByKD1koVxUsrOMIPBPfU7G9U4HSJfKnfcHcJq4y1OA/6xO21MlDeO5boCf03Zz
	 NxX4/L96TXCjp/v7mt74vBj0rbkWeCUvIX8Ah4WGWgtMP4M9VnAkSp7cLl4JNjphgf
	 E+R8XxtAiW+hopClhuL1dvVDzyDR/e1vymeG3fRVrkZJdG2SDYLG/bDPYkKDiyWns5
	 GoaQwWFUTwAScpCADjLZsGVqrtIoVF0u79bX5v8klaGv54mevkrNkTzi7/5Vpvv525
	 57UgiRwXcWks06LsfKYZepIMcYi4csyGQdYg/cC+O8tZtpO26gWXtY9LsXAD2lAXlN
	 CA9f7mRVQMJ/w==
Date: Wed, 11 Sep 2024 09:43:04 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 11th, 2024
Message-ID: <ZuFKCBNUG-rFr5-e@8bytes.org>
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
