Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EA36088F
	for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741713232; cv=none; b=rXWNy401yAGDtFt+sl+bE3+jqpBOrna/18NNaq6oNYBwnY086CXncLg38DZ64weN6FrOQgnjk4ueAWdHvw7exDsiU7T/SqAYv+NRhmVRL4ciN3Ny77uRRUdXYVzsc3KwDbv+ScZ63nIl4ssD/xONKtdKye4iZW2oP74neXidX1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741713232; c=relaxed/simple;
	bh=/fBZgkJEL5wUUGzQGkc5Eq/RgKaQQFa0MH8wEPk/S2E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iDHyLD9twBpHP8Y5QkAaJF7d85zUxkA9Ta0qYNeq2yf/0ih4ZEku9lwgxpMPqH2kX1EbhzoO5mQyKkhBVAuvBzsicf0vD7t8H0USDOPJAoYqATmHJHsqDZ3pYHqR7eIkYtJ6i6P+e0ew3D1HvAU8RPBYXBSsVpd/T1kLVsvFUPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=UBQ9RIpd; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="UBQ9RIpd"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4F3DC452C6;
	Tue, 11 Mar 2025 18:13:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741713229;
	bh=/fBZgkJEL5wUUGzQGkc5Eq/RgKaQQFa0MH8wEPk/S2E=;
	h=Date:From:To:Subject:From;
	b=UBQ9RIpdCKq03FchmKsgOFIU0RhHDkEVpThzZE8M7N5aipIcre3wXTRbq+5ao/WOC
	 Ob80pcjpiNh9y+63oJjS5RrurwtCx0NKPxX14+1RWV2FLjp4CyUFrfTUeYfFlUl6cc
	 wJw4fhVhFvSEDOqJSG6DOrt2WwplWgc42BZ0zWkytmWaFa7NpI6ERLHp3j2473Lspa
	 Ys4X1VCjcCIAlOJzq1CX1m8jBVcMDnPxBSCz/tgogoOgU7urE6kYHguzsJhsyQ8ijx
	 adSwzDgmfWMpaMl7x5p+XhXy48m4LDOE8117P7aELFymlL6aAyoIoTRuGtUvdJEXEV
	 nUS9/x/RvR8/w==
Date: Tue, 11 Mar 2025 18:13:48 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call March 12th, 2025 (Changed meeting time for US)
Message-ID: <Z9BvTJSoc166l2cf@8bytes.org>
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

The US is already on summer time and Europe does not switch before March
30th, so the SVSM call will be an hour later in the US for the next
three weeks. If you are in the US, please be aware of that.

Otherwise:

Here is the usual call for agenda items for the this weeks SVSM
development call.  Please send me any agenda items you have in mind or
raise them in the meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
