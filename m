Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B2718FDA9
	for <linux-coco@lists.linux.dev>; Tue, 20 Aug 2024 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724168851; cv=none; b=JFEXQIg0cnf0mkOhBW73//0krtlAlSQh9AAo2G/Sk1o0J0kuPpshTjLvD2YGdB5knS1MZsLsJn3SU6MW3YDwGE+zyVgpd2bjuICQ4mUJo1lscDewiZHerp0O528ebMT0X5RHFWJJchcCcP6Jvj36Q4eplZoNk2auTyq7GHcGmZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724168851; c=relaxed/simple;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbTUymIxAPhJalDbc2bRf0Cvt2yCzCsPUolSvPGxJroWM7EsMJlOCyuVpcjkPoTOd11n9d4AtfapQfJRYPQjmN9pYjSwzz8GEO8t/jfje6T1hk6CGjToWfTBqriE7qm5znq/326tRQsQXvZ6gGZdX9+k7sFXuToijeu2uXbIM0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=DLBoFDOa; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="DLBoFDOa"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ECCCB2A6CF2;
	Tue, 20 Aug 2024 17:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1724168842;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:From;
	b=DLBoFDOazFfl/Hj8rBIieZ4o2YR5DRhh5iJrFL1PneAk/hmJSA0ssDHV72KDQ0hL5
	 AQ3BV4cnTGLTyM+TgQdET0pujRJ2nAHpOynqE/CvH9HBGG5p+rv9+SwLbWV9H/V5hU
	 TMM9uWou+lYzlrwwEL7vnZBEBmPwqnOh6SBvjCsMfklzJvvDbv1PwnNhR0pRXHlbVT
	 j5HL6bg+N5kqJLZhNil/TVJ9L8JD69CZIkqBOq9soyX/bA4kFmNrO+Dqo0kb2sK8f/
	 OzfNI5z561cBMBleW0BPedmEdsa+kysVF9AGSsPX9DR4SKpG7Cow521JefhUzDENCj
	 nBtOMqwiA9XQQ==
Date: Tue, 20 Aug 2024 17:47:20 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call August 21st, 2024
Message-ID: <ZsS6iBEj5qmJh6Qt@8bytes.org>
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
