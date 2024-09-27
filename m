Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997B113CA81
	for <linux-coco@lists.linux.dev>; Fri, 27 Sep 2024 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452936; cv=none; b=jwhlJ3BoBthdPdxgNZpTosekG9k1GfQnxCW/GB9vqLVQ1zj/zIpXZu/L8oEKeWKEFP9KfNZIrVuCvRwnmuFzwomilqrknFRnVuS3CBS7XdbUixxECoXDnLTDbnzZmjFkDvW2fpZU8TydU5qz3Ry99bRLwTGbXBhsCQHYJ/M16DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452936; c=relaxed/simple;
	bh=X+WMHZLR4xYP/eAXqZd8apwitI9y3OXIqBtRHTi4GLc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cmHkaS/2o894eQfcYeZObv10oVGDbD6cQy3PMxLRVHvkxsHs8gUVAhJXZzTqz2jo5twQS+3YDAHUiCgpul6KQxufWBBDb4npo7CvtwJXfXxLjsN0DCsckzA6V4tQXs2SXr69i9fDcVI50HkDNxm1flpFrvgTgUQP3RgNJ4tOv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=ACEoECZM; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=ACEoECZM; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="ACEoECZM";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="ACEoECZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1727452934;
	bh=X+WMHZLR4xYP/eAXqZd8apwitI9y3OXIqBtRHTi4GLc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=ACEoECZMmVbV79s6pRgaN+vzhhM9RMSoyZUaCrINJQ0jnGsyui4R6n+fzGhTYnKwC
	 4cd/Jrs2wVrP5DI6cuoObZ6efUGEsc+jdOQt+YWkPEmZFepmLX33zar4m4mHan6Qns
	 ROxLhKbP3JqSnF2ANIsIRgxHsjiz31kVDU7YJBoE=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id BEFA61286DFB;
	Fri, 27 Sep 2024 12:02:14 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 4Y1JX5PTOTYR; Fri, 27 Sep 2024 12:02:14 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1727452934;
	bh=X+WMHZLR4xYP/eAXqZd8apwitI9y3OXIqBtRHTi4GLc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=ACEoECZMmVbV79s6pRgaN+vzhhM9RMSoyZUaCrINJQ0jnGsyui4R6n+fzGhTYnKwC
	 4cd/Jrs2wVrP5DI6cuoObZ6efUGEsc+jdOQt+YWkPEmZFepmLX33zar4m4mHan6Qns
	 ROxLhKbP3JqSnF2ANIsIRgxHsjiz31kVDU7YJBoE=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 2EB761286DE3;
	Fri, 27 Sep 2024 12:02:14 -0400 (EDT)
Message-ID: <4065661639dd917f3410e51c23a65e4bb88fdaf3.camel@HansenPartnership.com>
Subject: Re: No CCC Kernel SIG / device security meeting 9/27
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Quigley, David" <david.quigley@intel.com>, Dan Middleton
	 <dan.middleton@linux.intel.com>, "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>
Date: Fri, 27 Sep 2024 12:02:12 -0400
In-Reply-To: <LV3PR11MB84582F1DDE696387B6272874E56B2@LV3PR11MB8458.namprd11.prod.outlook.com>
References: <7a2e450e-bc83-45f9-ae86-b1872ae0aa23@linux.intel.com>
	 <LV3PR11MB84582F1DDE696387B6272874E56B2@LV3PR11MB8458.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2024-09-27 at 15:52 +0000, Quigley, David wrote:
> Are there any recordings or some sort of record of what was discussed
> at the miniconf?

The broken out recordings should be uploaded within the next few weeks.
However, you can still use the livestream recording:

https://www.youtube.com/live/8XQwzUZxLK4

But it's monolithic, so you'll need to know time offsets of what you're
looking for.

Regards,

James

