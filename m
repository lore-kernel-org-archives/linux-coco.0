Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED5220BB59
	for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731447440; cv=none; b=S1NaZ9Jzw8GE4Lrz0Q4lBciJS0utjCH182sSVnx80LgtG6fS9RKyeTGST+m23ayUYENIhXZeAv84sPx1mzbL4kwWnFhx/S5OcaK27wAqd1+0PxB/fJo3VLRk7Mbhu+T7Qr8gHQHZkY5D8/Xx6mSXyFve0eLbReh1KVvCl196uzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731447440; c=relaxed/simple;
	bh=vldeaghzSNdolfYlEdCtOmCRcztk0Yb/KxZz+ypNlIU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W+aOZ0vI331sYYL04ElFGYs0BxLjMsS7THwgyA/BXWNLjEfJK0Am1Zsyt5C37z9hvLlz+cr2JEcghyi55GGNMsFzVnKEM0R5X3+chLkiWr0BVyCgZsz47CHzfQjSkZ+thw74ZANV8LZk+6g38q7vSWwxJQOqCEExXTWTluu+FLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=qWyzErEe; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="qWyzErEe"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 56D962C042D;
	Tue, 12 Nov 2024 22:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1731447431;
	bh=vldeaghzSNdolfYlEdCtOmCRcztk0Yb/KxZz+ypNlIU=;
	h=Date:From:To:Subject:From;
	b=qWyzErEenKtRlH/rmOVWuhsdbG84jlTxyjTXklfMG49pnemImckt/0riccVEz9EnS
	 hBRBnWQarvxXEz7D5iNI/4q8hB9/khu14+LPNLBdZIvVxjGaMEk46IQHCxwBES9mJC
	 bAjsELTfCdSokaIMGq9m3ViU9cGQAErSCPYNxaQJMYxgmvm5ioHQCDIE8V+3REHiMk
	 26adOFiVtqzo2A0IxHycr9KO/Zr3ge6wZPYshrik5cKFK6bq7+FWMW0XCxQ9c0Zc8C
	 Gfe3oZXepuL+RzZGAlQrz6sZvmNpBHOelBbBZ9o97KKACSRGC8CWOeNTN12gpZxvea
	 rfK7z26G1ChXQ==
Date: Tue, 12 Nov 2024 22:37:10 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: [Canceled] NO SVSM Development Call tomorrow
Message-ID: <ZzPKhnIxtcsh_tMB@8bytes.org>
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

Due to a personal conflict I need to cancel tomorrows SVSM development
call. Sorry for the short notice and hope to see you all again next
week.

Regards,

	Jörg
