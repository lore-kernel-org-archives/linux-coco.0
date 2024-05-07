Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B987416C443
	for <linux-coco@lists.linux.dev>; Tue,  7 May 2024 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715098677; cv=none; b=WSee4TDJxmrZB6XXrC+WtdLzSnwBojyQLHAtgUGQ8lAmLE46ehflRdCHoGB8ePYFhVpexTDuXH0kNb5iZa/cE8IMBGruh0WwNv6zpZ8yXInycgadj9ds62DJaBncuBPKXeqwvArTCx52FvrUrSAafwlnIySuK8p3GjkOo1XoEek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715098677; c=relaxed/simple;
	bh=IODyIGAo30qJtQWj+nQr8Mqtmk43TvloX34LD9jo8BA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jh5CuQdi7Nc7nqhw7mnd/3G4GFV1gwmRSm7xiJFDwjDzSE4FQgtQFPfgfaCjTKYeJSyplrPINZ3umPjcHK/vjgEBfJhClNb4Lnv2teLv0/pEhgRjlANMR6B66fQyIx1J67njs0uDne1L3WZsI9mcBv1vl2ZYLPQCzhmbZAI8eks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=mn3yHZcX; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=mn3yHZcX; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="mn3yHZcX";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="mn3yHZcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1715098674;
	bh=IODyIGAo30qJtQWj+nQr8Mqtmk43TvloX34LD9jo8BA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mn3yHZcX2gCd2oOoQ8Q2DUYZyfeZoy+SkrJOXnE6WkHBZKNTb51tbUnCOcpBpdb/5
	 BY8b0WdxI3WSWpCETCLWnixzzaJY6xdtsqywZh7F25VdJEQDD28muMR57paeXEjhGH
	 9oNtwSp6br/xieFa+2IhpOCO+oZLrdFWPEhuQLMA=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id EF82D1286698;
	Tue, 07 May 2024 12:17:54 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id GqIrXwCVCALE; Tue,  7 May 2024 12:17:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1715098674;
	bh=IODyIGAo30qJtQWj+nQr8Mqtmk43TvloX34LD9jo8BA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mn3yHZcX2gCd2oOoQ8Q2DUYZyfeZoy+SkrJOXnE6WkHBZKNTb51tbUnCOcpBpdb/5
	 BY8b0WdxI3WSWpCETCLWnixzzaJY6xdtsqywZh7F25VdJEQDD28muMR57paeXEjhGH
	 9oNtwSp6br/xieFa+2IhpOCO+oZLrdFWPEhuQLMA=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 446FC1285EEA;
	Tue, 07 May 2024 12:17:54 -0400 (EDT)
Message-ID: <3d8b211a57a3c2bd9d3b59d5fb78cf626a229a75.camel@HansenPartnership.com>
Subject: Re: Confidential Computing call May 10: RTMR ABI & TEE I/O
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dan Middleton <dan.middleton@linux.intel.com>, linux-coco@lists.linux.dev
Date: Tue, 07 May 2024 12:17:52 -0400
In-Reply-To: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2024-05-03 at 14:55 -0500, Dan Middleton wrote:
> Zoom and other logistics at the link:
> https://confidentialcomputing.io/about/committees/#Linux-Kernel-SIG

So there is actually no meeting link button on that website (there is
on the GRC SIG meeting above it) and the Meeting agenda link doesn't go
anywhere.  You have to click meeting schedule to find out that the link
is:

https://zoom-lfx.platform.linuxfoundation.org/meeting/91985873585?password=96345a7b-9fec-4c11-a16c-c8fe78b4d113

I think a career in government UX design beckons for someone ...

James

