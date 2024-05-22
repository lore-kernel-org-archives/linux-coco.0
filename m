Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92EB80C15
	for <linux-coco@lists.linux.dev>; Wed, 22 May 2024 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716370039; cv=none; b=d1PIz5DQ+qrly65+ef/dSHjBD1ajgWvzLYMp3SBPkXRyvjapDiCiKsdKO+o5RhAEbSNDztT1GAm6fv/lcgw111RLWuwC8b6Xe47MWHXjwzyU28kjlg816StkM7djwS9OJQ8OXlkurkfLTygvly3+PMYLUuxMhLtp0hYA3N+tBZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716370039; c=relaxed/simple;
	bh=RoplFNauQdxp1pK/wTezPF35FtGWsUH3NbqdPjaNygw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0V7J8/heqKJh8kmJcBNB68RV2yqZLNkDfuAcn3UdkX3VfqiNExfY279tXEr7Il65oVAYbOSzhyCgIRAI3bx1UP8NR+9NjlQTLFdDuID4yn3H50ROXzIuj8H81VSYVYTAuIuApr4TjalHxWsT0FtY2A+6Mx6qPeNRTESnLarGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=18lRxJrK; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="18lRxJrK"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2B0431C0B84;
	Wed, 22 May 2024 11:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1716370030;
	bh=RoplFNauQdxp1pK/wTezPF35FtGWsUH3NbqdPjaNygw=;
	h=Date:From:To:Subject:From;
	b=18lRxJrKXAd9V+a+F+OSxuB+n2YLX1c1rZqfKo3Mvc15duG17SF5dJqc8W1bIdR7X
	 iemkU1tsqUeBKUK26DKHckruws46P37AFkNy9btGBKKKXvBmhSDmdM1hPfWaPn94GR
	 N8+NmqWFXIYx008X9u9+vtMfvnM8/ISgBOE5Q4wS1cH8eBeI9RP6DqU8ueR2u9J5KS
	 9KiFKOMjj2+aZrFSglwBqd+PAQH7CBMi7/5IvsZsiQG3Xt32nUO1orvYff0RPMpiaq
	 4G8Fo1fB0E9XRQzxfYIB5YZLMepZwlpVPFMIFi5PN9enuMxNS3jut0XJCY8KQbTj1M
	 aEryN+PhZVmjg==
Date: Wed, 22 May 2024 11:27:09 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call May 22th, 2024
Message-ID: <Zk26bUSiu-OJaQ4X@8bytes.org>
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
call. I have no items on the list yet, but looking at the incoming PRs
and discussions there is likely a lot to discuss.

So please send me any agenda items you have in mind or raise them in the
meeting.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
