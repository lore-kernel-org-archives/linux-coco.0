Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39290148314
	for <linux-coco@lists.linux.dev>; Thu, 16 Jan 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015691; cv=none; b=QL9jVdGEzaaIxz4lcRvfoBEfClnTEe24jim32tXKEb5LukcwUsBdsOKLkzxsATELeNBSy9dDnK9b+8wZ6yHaQv2qhIVoCWchGWcDuof+5ZdGqokeUVYwwSfadyR0QJsKBllS8cCtSW/+ezfpiJa4epVDHXXnn/lyQK88pzXie1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015691; c=relaxed/simple;
	bh=sCE1wCMAZrLhE6x+xrX1Iz3kZ8aZZ81qikE0NlKKSDo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6Gr/NDFUBfwvyFBvFLPQu2hADPxiCSjTJwS5UsHeeGsmsZeNwak6ny9DqhOvLUii3NO5VEGyPk6uv6DxYR6SV7jH+2hO8yo4LN7q9rTgQNSJwxC3F7FwYCeYFmfisynRsX7PRMoaarjznV3EdFkV4u6oDVGnM9ukSMack5T1Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=sVAJWYBV; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="sVAJWYBV"
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 600C62E003C;
	Thu, 16 Jan 2025 09:21:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1737015682;
	bh=sCE1wCMAZrLhE6x+xrX1Iz3kZ8aZZ81qikE0NlKKSDo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=sVAJWYBVNkM66XnpcMj5u7avqOvYap0KNWRHcVXi1GAekX+t6+mGc66G8Xc+uBxsG
	 gF9gh3lERHukcgBkMmhg5pVLj6LV63xuo8L9sPS+yVs0iRJqGvu+s88u0MXI9H6Hd4
	 ODZyj8cdATYhyyIyW6TlfZynAiJyRv14O7pBYCX2tzB9oxC2ZqtNLGe4IuNoZuwMhV
	 TotqXMlZimKGvUoz9Y/vrvjqv4uE+L745YTTYnA33oZouCVFUwUE8jonUJLbtWQ6kX
	 leYopoiutkHJ1e4Xv55vqQb8lnrlfo4IFBChO1Ranmj0QhCbgjsc50pP0nQMQ9hWl+
	 LHHsdm/O1NU7g==
Date: Thu, 16 Jan 2025 09:21:21 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call January 15th, 2025
Message-ID: <Z4jBgYyZtfkOnVyL@8bytes.org>
References: <Z4auyrg-qgsGhM42@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4auyrg-qgsGhM42@8bytes.org>

Meeting minutes are now posted in this PR:

	https://github.com/coconut-svsm/governance/pull/41

Regards,

	Joerg
