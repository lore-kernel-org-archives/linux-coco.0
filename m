Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D2633999
	for <linux-coco@lists.linux.dev>; Tue, 27 Aug 2024 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724743280; cv=none; b=M3NOxwyu/i6YluN1YmgsApAwYEJ9Joh6EAPgjYvH9xwgh3x4LyH0t2vGzebYOJmnPh5A/M+Ug5Ekgtto/qd63fesAxW1XfiCmPQtjwK9Y0GtT3/+X4/Prj/60CV4663styB7D+ImYouTDun3ycXqN1x8ZNBtXKv2aT/EtC5Hwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724743280; c=relaxed/simple;
	bh=yNEFa8w6jic120i8vvbEqKyPpX/uJzPQATV6A4n7evY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIZXKr+VLuu23VTqxqzIt2y3LaY9YQaUwkqKVVAXZUvCwid1itthFXG9UReyRlnVd6goGeMIhqf8LMz3bJ3b6/kvo23ZnyrhsRumA2IKThYDOVpG24s4do2c3pKLombUJNj/PZlB28UevisEWDLMVZrtHy9boBsuKf4ruHR74ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=btkxD4jW; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="btkxD4jW"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7DF9B2842E6;
	Tue, 27 Aug 2024 09:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1724743271;
	bh=yNEFa8w6jic120i8vvbEqKyPpX/uJzPQATV6A4n7evY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=btkxD4jWRAQqoF8u9I1+6GXyD8agQSjYEgxzqGC3zyoMDTQy4wLZVhw2CaSX4gFTQ
	 8DrrVlOm/znrz1Dq/V0/GbRO+l9jZKlV43XqFAQCPW6NP0yu6k+2JiWQGoZX0mrMko
	 YudrJosWLx71Ju0BgQ4W97Q3u0hyvU4mRaPK0Ya0HgxvFRHshfZMlYXV52TmlBigEv
	 af2m+GkaquUCIe746feyGzHw6Lha8wh0bpQ1q0cVfPrNdw4v8N4Ifyjf9z4DHkyRV5
	 Nb6UTNz5aw575Rk9sruB5gVYBzXiZ2S3O/ox+6yI9e0G9ERxzJvqLcbaJm1ipEOeQm
	 ZNp3/1TDPxPzA==
Date: Tue, 27 Aug 2024 09:21:10 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call August 21st, 2024
Message-ID: <Zs1-Zo3IYpOgJw4R@8bytes.org>
References: <ZsS6iBEj5qmJh6Qt@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsS6iBEj5qmJh6Qt@8bytes.org>

Better late than never are the minutes for last weeks meetings now
available in this PR:

	https://github.com/coconut-svsm/governance/pull/23

Regards,

	Joerg
