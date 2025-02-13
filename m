Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011BF20B80D
	for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433817; cv=none; b=Aq8DjgyZcpCde6JNKMAuemzwovAurMRmqZgSHUCBL6U36HWHAY7G616xK6Ejx9kqQ5EUn3nyafBnfCdIgnXWNCH9pjIG9enjFyXFPtzbYf/YwrzUPU6A2NQAJQ21umI3IycE+g8/YXFcWPWoP0vnpfXcNvodMmNLAWIrVvnj8YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433817; c=relaxed/simple;
	bh=d3ZARNFUE1EJF5tV72E5wWXFW50wieJoAQnTX57wi3E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFRJVNEcViMCYoZlaBuEp4O9U15R9w2eDgNnwjyHZ0ayWn6cIU7M86avhNiJV//Vy3QNFgOXPvJ9t5sF3FZTdqoQNqStM5eqb2Rt2VMAqA9o7kWr+7RISRmTG6jed1BDa9/yY4h2ora57KenkyzYq+bLukBWof/u0TKVC3wiJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=DLPCk3L0; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="DLPCk3L0"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D7AE7413DC;
	Thu, 13 Feb 2025 09:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1739433813;
	bh=d3ZARNFUE1EJF5tV72E5wWXFW50wieJoAQnTX57wi3E=;
	h=Date:From:To:Subject:From;
	b=DLPCk3L0zbxLx883WfiypuFS0a1Bfkfd4Dc8zAKWsYrVafQk10UF4MGE7H5Jl+j8c
	 57CZAPHf/Nd56QLdWxkFcvY3BYiCuPxFkbvxlrX75jHH2HWC266Yfj5vtb3gjZyST7
	 d9iW2FbCquo3oSegBTpc8Xv5bCzdgZONSp1lvs8OXGgbnuctuVX+LDZdp+luOyC9Wa
	 4yfK7qMwBfG/229tBkx1mkBvDAURPzVyqDxm9FRAxssiIR3liGLaclOOsQ5TF61xEy
	 yuyb9cAipIb46pfcquzjO/XLBDLB6dH/OQYOAh+n9phg1SO3kBYkBRmLBEdV2Y+coA
	 suUQSqhvlkM/Q==
Date: Thu, 13 Feb 2025 09:03:32 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: CCC Kernel SIG Meeting February 13th, 9am PST
Message-ID: <Z62nVBlbA_9Rnht-@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As discussed in yesterdays SVSM call, there is a meeting of the CCC
Kernel SIG today at 9am PST/6pm CET. On the agenda is a discussion about
an architecture agnostic approach for Guest/SVSM communication.

The meeting details (Zoom link, ...) can be found in the CCC Calendar:

	https://zoom-lfx.platform.linuxfoundation.org/meetings/ccc?view=week

Anyone who is interested in this discussion is invited to join.

Regards,

	Joerg

