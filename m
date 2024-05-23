Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D20B13BAFE
	for <linux-coco@lists.linux.dev>; Thu, 23 May 2024 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716452894; cv=none; b=BFM98MZwx6s14karqQJPO6hAJ4C/hOTSrihOafw21SnEiVYr7EQ7XmMBAkw/isE3ZN6A/H1FO/L0F0IoaLLMzQSrRZBiCZtSE9j/GUXY4NW9cajvYu2LmDjyM8Syw5SwaH+7aDeOhYxQfHwuNU4Jcrv7VyFp2I/XJ2xj7ea5mAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716452894; c=relaxed/simple;
	bh=ZrYz/54evGHy7jqG3edY2Ii8hc+9wZsBaQmflxFOrlE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPMxDM5zSqdQjog5smRkIfOzxfmcmuE9FrdUC8r+XWhSPULs4IndLUuh+osMDxP60j5F9MZspBt09kV9TykxLWtS6LyM4GGcaMLFC0sDyYb5j+a3tFpjxqWV5sZUMKKW6QcEPiROMfY3PxVXsiOSEvfOm1JDV1lPijlAQ+Wvp70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=6vO8AUFP; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="6vO8AUFP"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AC5471C0B87;
	Thu, 23 May 2024 10:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1716452890;
	bh=ZrYz/54evGHy7jqG3edY2Ii8hc+9wZsBaQmflxFOrlE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=6vO8AUFPYPXP5j+CDA6YkEQfp6IVk09Lsq9qMkiQc9s+9zon+ODdSO3uFwBXsx3VF
	 viVM6HIM7EFxC1U3yG3E9eIvnOh9idgZAkkKXm801G7bfoYBjMJcU1uV1bPW7u3Wng
	 olXcjmy0/MB9FoRlu5e3Tb2RlsGEgkcLSJsPimTo0mVuFlnLXH/ZMgb/g4DJGN1bg6
	 D/kDxkQk7c5lisTIXe2EW/ZA90Y1qRushSEOitVrXk9xZ77fdZgGVZdZclhrqdLacX
	 Uje7tATtoNM9EM/GHQERGiAPuT7Azt/RXyDfCG9cPmoOjVrewoN2S7i08YgiadPkQh
	 71HVhw2O7ftvw==
Date: Thu, 23 May 2024 10:28:09 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call May 22th, 2024
Message-ID: <Zk7-GY3uYMjw89Xc@8bytes.org>
References: <Zk26bUSiu-OJaQ4X@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zk26bUSiu-OJaQ4X@8bytes.org>

Hi,

The PR with the meeting minutes from yesterdays call is now available:

	https://github.com/coconut-svsm/governance/pull/14

Feel free to suggest any updates, especially if the people who joined
via a meeting room want to be be listed in the attendee list.

Regards,

	Joerg
