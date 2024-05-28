Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63B3178395
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716926729; cv=none; b=bSqwMRr8ZMPPn6M5dgDcW1p1CMZi+QaWeNLseCimCNBjmgquTitSmblS1gNjQIYvlfmNB+0L8QOhrF8HNbOurgpm6s1nmOPIDNFSQc8anD9nyHp0ZtRBqscW8AZTyAeCUcWF9VUfiQVMaVPOSEhyDHe3xAdudZZDQLj/L8qChJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716926729; c=relaxed/simple;
	bh=9xL5+BQFKhNxM4Tm4b7L5pxFt/xQkQAolbO8uYBPp8I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuT8P008INKzf1UubZGUROrv7n2WAmfnXHPS/bhAZcZlloHF1I7N2DqSnz/KF4wkdBA0RwVeMho6E8mJgy1xTi69IOpPvJr5dqiuj0q5IStMI6qUI8avd8s4WbfAr9qXP+ycXZdb3RZ0CULTg7NMDuijfNNGsD+vSrWY0WwN5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=rYGrFxu6; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="rYGrFxu6"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 25C521C27CC;
	Tue, 28 May 2024 22:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1716926725;
	bh=9xL5+BQFKhNxM4Tm4b7L5pxFt/xQkQAolbO8uYBPp8I=;
	h=Date:From:To:Subject:From;
	b=rYGrFxu6Xndchyo1vFiJct888+C6zHEQW4NsyQpi09U3udwoiUWILDebvHh1iVofb
	 xZYh2bjdtdu39t5TI3qvkkrJgIuJFHi3qjsW5grH8CZCENgjlnnadrEaU9ShL5TaDb
	 aOVYOhvWjbdEnykIHOUvqthps26AnkxZwt685PEH+WHaBPHFvzBNMLy4iTm+AJkeut
	 XEooAK16KctoszexjM6YiayavannJhssaegcSEJUH61dmNh35Po8EGgVNZ3Jo887SS
	 OlkRRUuPYyDU4z8R0YORdz8TgqYWmDaVdqzuDElDx52rkQgwOW8ysWRoX3Wyldlpeb
	 8YEDrCSX4mCzA==
Date: Tue, 28 May 2024 22:05:23 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call May 29th, 2024
Message-ID: <ZlY5A4N4S88FeFDQ@8bytes.org>
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
the meeting. I have one item for the list:

	* Update on my system call design work

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
