Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E552F20CCF6
	for <linux-coco@lists.linux.dev>; Thu, 12 Dec 2024 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733991925; cv=none; b=hGqSe5ABQVR+5UX7j0sD+sLsXjGGDhqWKyttnkicvlAbOk3P9hDuZk6AlO6DDTXtkG7eOoNjYwF6haDRHiJiDSsXaiIRAshGVx7BjjnUtQcwa5QHR1PcOibQzxShizunJRZHlZYSbHo+pIfp31xGxqdzFGlfUZSVQv4utYFiq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733991925; c=relaxed/simple;
	bh=b/q5GebJ1vfsxTV4j0i/tkj+n7u9d2GWphMibyjSqdA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gu9ZriokBCiC8fHGvO+Fu0drqtN/q+oK6cadNKM5+RpcU/aCEYSRjYA7WRFV3pzJq7hq/EgkNALnq15+h8RzPOtkVjxdr+N6IucXnwrK7ft8kYce1hTMKUL2V6XdQUDJZ//IP5Axi7qUik314B3L57vU1Oa1zeXUKKh16tcupYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=nUfB2Xly; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="nUfB2Xly"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1EA682C1B3D;
	Thu, 12 Dec 2024 09:25:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1733991915;
	bh=b/q5GebJ1vfsxTV4j0i/tkj+n7u9d2GWphMibyjSqdA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=nUfB2XlyJn5lVcUtwv91mNNTSTVT74F5kHeSwAdsl6SMnMqhg8K4hRuaj97LyJEmP
	 1x40jHhhGTlkQBRpQ25HPgCaCnEAXoWWub1PJnnVGHKtDKgyzwt2NkieTG/SLxHPuy
	 er/sOFvayILAv4hgnhyP8XcUrcPjHPqVJAuTo/so+ijn4aHFfpIftFeLcstUrwBdse
	 2xGC21DImGKT2XO8JJt/Om30hMRqyzqNZzax8UX4s1p5OnyqdUwljzwFko+kBud9GM
	 fC0IwLlahjGf3fnRqV9TvH9sefidPadlVXlSGtB8YHIzTRoTJIG1slaEhsyf7MhxRD
	 LH5/gO1o6aHsg==
Date: Thu, 12 Dec 2024 09:25:14 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call December 11th, 2024
Message-ID: <Z1qd6oEvsMFe5bYE@8bytes.org>
References: <Z1iMgi1TOgv-sHtZ@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1iMgi1TOgv-sHtZ@8bytes.org>

Minutes are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/38

Regards,

	Joerg
