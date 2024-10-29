Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A2A3207
	for <linux-coco@lists.linux.dev>; Tue, 29 Oct 2024 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236256; cv=none; b=CM9epd913ia2QPp4Oph7ztv5ameQqjn4/grIRmAfbyeWjFoNGJcwRrPK+K3y0u+Vr4mWImq/zh9yCJ++RZBz5Jr6TTGUPj6DaBT3QrDHHz59U9aMj28SXn4qZGZO9uJhxTCbGNSZ6hfQnP5P511OI6n4m7NQaJA9B+3rWnJdX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236256; c=relaxed/simple;
	bh=mZEcZ5tMVG96s6OBYwLAv1zBPXCCOM9vxdOZYmBvQq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mHH3C47K7JNY5ld8ll/T7hc7z+1htFj8oFp2fYtLmVwQOEo1Liiw0S3Tpjh65Ft34pCrTUFQyhe+DfmOtz+6TnLwgyjqTbV5i2V6DP/klfnACvQvX6iTNVM8fmlvgkFqN7DWw71hjYLwOUDALUjpoZWOYhvBTklB4Tur1FgvaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Xi1L9JJW; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Xi1L9JJW"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 375282A8EE5;
	Tue, 29 Oct 2024 22:10:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730236252;
	bh=mZEcZ5tMVG96s6OBYwLAv1zBPXCCOM9vxdOZYmBvQq0=;
	h=Date:From:To:Cc:Subject:From;
	b=Xi1L9JJWFdefUXv8OmLd7iHk4bl2wgM4Vbueahoo0SeplRZVmf70dKhJ3DOxPOboi
	 3AePguCrpveA8Mkag5TZgI5Ue/+fb2KHbW2fY9MxdwYIQvQ1vv7pZHKyq7DpzNSgjd
	 YToRK4qOtzdCRLKKTnms5JUHxLVtvAuevj/5LyYXNVfbl8tHZuf4uHTzNy4UP31m7V
	 eB+iTHJRW1oPx+7dGsH8ZkJmj5qyDGyjl5yoVsGbpssAODJjSiwMgDTS/71tXPG+6N
	 +pVUKFj/gNT7M2whWWYM3BXtCTEMDCFVqzMlZP3Lbs/ARG++SvaMpe39ym7sc2SLMs
	 cuQs6CLRYTubg==
Date: Tue, 29 Oct 2024 22:10:51 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Cc: Ziqiao Zhou <ziqiaozhou@microsoft.com>,
	Weidong Cui <Weidong.Cui@microsoft.com>
Subject: SVSM Development Call October 30th, 2024 (!!! Check meeting time !!!)
Message-ID: <ZyFPW7yg_EVUTlPU@8bytes.org>
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

!!! Note that the meeting is scheduled at European time and the EU already
!!! switched to Winter time. This means that the meeting time will be ONE
!!! HOUR LATER in US time zones. Other non-european time zones, please
!!! make sure to check the calendar as well.

This week we will continue the discussion from last week about the
formal verification efforts.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
