Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B611422DE
	for <linux-coco@lists.linux.dev>; Tue,  4 Jun 2024 20:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717532279; cv=none; b=Dtf7BXjohfzUTszuyj8+cZooFJzAslMtwh+3VZP0DbnCDXOtd0dozIjzpe+/KlRn1qGjbzzUn+FExIQuoaGKEvR6u4XnYA8RRzXqspv2+QmVy5Yq6aTjXcq6/k+Frrl0Edb2JpIFpJYp/kbtPar4JTnnveOYTOOwK7fkR97SI9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717532279; c=relaxed/simple;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sw4HQxOzjLhfX7LMty7dEZsFctc3jLMsbCMPaew0bakMUU6HwICPQW4vFYPhuwVM9zbnjGRmhlgylLpsNoMVLnU1ZvM/dBYqZmmyOx11FQ7YXM2f2aoTRrPimveVPrg7A4xKXJn/OmYlXs8OVBZ+jm7T3ywrJsmCg8xBmazrR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=7+/+Hfy8; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="7+/+Hfy8"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 68A601C3F08;
	Tue,  4 Jun 2024 22:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1717532274;
	bh=3ig6zYkBa9LMELeBsEaVPkcweqDWFopBMxnen3S2vXs=;
	h=Date:From:To:Subject:From;
	b=7+/+Hfy8eu6vhQs6l908vysJzICvVQyXcubJt0OQhmlgVyRUa5hL28QbXW7yVyN+z
	 vdE3GNTBe02L4JRmbzBk26ppme8ZqIh4k6rJczUsh8zWQhBi3MbllHV8sceTuFNJ41
	 gV15+1BrTyKkLNsxUyk68ojVyk2hNh3DjzutZzamgA7e4IsS8zQ0hgTqHR5QA8trM8
	 3TbwODKmK0tZJ+ijV/0DFp9pH1obLwvtsixi1veMV2/tJX+MaXC/7brJYBydkYtgkW
	 rArvgoNMM71jhphaxic1ZIG32QMaTiwLGwcEhDfpHfZyePkSQNQvUquJgvITiUhJMY
	 WMyJtaKMZL8GA==
Date: Tue, 4 Jun 2024 22:17:53 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call June 5th, 2024
Message-ID: <Zl92cXKqMmLkiKfq@8bytes.org>
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
