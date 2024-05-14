Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCF317EB8B
	for <linux-coco@lists.linux.dev>; Tue, 14 May 2024 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715702451; cv=none; b=M+JIgHv//l5goPyZAnvcghQa3KhvObA/dyq5K+DwhKJxK6TTac55oXHqpm8Ee2nigwMs/jZ5s6PbjEpiOEfJ6mx9dHnRUmtYdO8ojQmIwZrFKjQfOLsLhNXDQKT4wjPTCNEM9DkfS6FCrMM7nbHhTGP3/3EEB+nYo38rnyzuSgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715702451; c=relaxed/simple;
	bh=Hpp6fgN3L9gypjhuFx309Q4EPNU6LYjFpjyiAU0csV4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8NiJi86Dm6jZ6iUjxWY41Lv+tA8AxGQvVdXE4hCsbsOQLJJd8VnOj9OGhypasiUR96JovQbTjh1myKzxVXDIO7V/F8jJYyH4psYW3QvOBUrJ4Mzoe4fQzvPSfluIxHoefJikwXNK8t9l92IQ3VmldPmbCkxNcyxEie0gH1pULY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=nt3ibWVh; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="nt3ibWVh"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 27F1A1C4785;
	Tue, 14 May 2024 18:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1715702446;
	bh=Hpp6fgN3L9gypjhuFx309Q4EPNU6LYjFpjyiAU0csV4=;
	h=Date:From:To:Subject:From;
	b=nt3ibWVhXBJV7vwdb579xXwLCxQu9gtVVrHjTQZXuz0sHIi4cVjrHTrhip+Dqkk27
	 JnmxgCUmTqvHrI9jkXWE0/E7HXnzHUD0ZqIiFCN1G6sYi0DCRRjLlZFf5fNPGySKYk
	 mHOjZ4K/p58uQRfklzHo3eRqMADdIXtzb/1Y1TH8klSeK6I6qCRqb+TM1CWslX2E3m
	 enAIROw1EmSFnPZ3QgfXdGt2AcsHWtId8m66YcEH4izbJ5ErdjxJjBJaEb5CA/l5x9
	 OJ1dMgzqboVvgJiAN3/7mxBXeJaQPfsABbGOSD34yprTmpEnxmqXsIvhWj4gVRJzH5
	 xaG3kMJg3QxIQ==
Date: Tue, 14 May 2024 18:00:45 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call May 15th, 2024
Message-ID: <ZkOKrTyR-ohXjyYL@8bytes.org>
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
call. There is one item already:

	* Development plan Q&A and discussion

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
