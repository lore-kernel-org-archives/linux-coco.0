Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA08F2233B
	for <linux-coco@lists.linux.dev>; Fri, 10 May 2024 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336250; cv=none; b=rA7LwAO3NoAtLJeidphAyu9ANoUdfA418A+pGP1ARe3Jbov58JcjerVPDhJJfyobhjmxTsIrqOHCpyFOJU+FZaMtVT6G3NmhgQ2a54eDIDsVWh2lW0VNU7DOXGZQNXzbMigyZ7v1NxSON1p/l1BE4gIq/7Vf0hayFn45kpyz0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336250; c=relaxed/simple;
	bh=gw8UmHQ1FmnL0vaSor6MhpqNM5ASt2xxiddrAJWrGZU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDES7ARhYoigueA440QWGSifKaWHL7tjhzpKJdy+eEfXhklwe+pCwrvWAMdz+qol6tO+KN09aV0J94iv3O6y01IYd6m/ec7rL4pzbSYgz89De45YGrXtYSKWSGyh06B49hi806B5a+clSHJVp4Jv0pRfKdmUBN7hLnUDEtaHkVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=gMsjjDMe; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="gMsjjDMe"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ADAEF1C2843;
	Fri, 10 May 2024 12:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1715336247;
	bh=gw8UmHQ1FmnL0vaSor6MhpqNM5ASt2xxiddrAJWrGZU=;
	h=Date:From:To:Subject:From;
	b=gMsjjDMe0tVzO4M2wNzI+lt+b6kFf/CWb4HXUsTqLzMyLGbE1EbnzF+4nwofao6ID
	 zgqUzrUuSQO83FPa3/2xKSa34XiX+A7LUBvRc5rh6SkstdnDguaMKGeViKkjrLwZkG
	 viaSigzihl7qm73KDf9Sc+jof11hK8iE21EXKitCO5SIAktK1bLegWRx0/82oSL3tI
	 6BQwKNJQjz/03x99+imapFbZomiPKKxx4C/yUzIcej15Jlq+aai3OKL39BkxT6cA1X
	 8fFtCW7QZXaZ68m2fGoDMBlKYo7gEVRVVJTpj2CsBFkE6U5mq3kyrlgyLwC/6tjm2f
	 dvqbZs9w50tWw==
Date: Fri, 10 May 2024 12:17:26 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Development Plan Document
Message-ID: <Zj30Nqq3OS58DwpP@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As announced in the last meeting I am sharing a development plan
document which lists the in-progress and future work items to get
COCONUT-SVSM to the envisioned point.

The list is very likely incomplete and I am sure the document still has
a lot of room for improvement to become more useful, but I share it in
this initial state to discuss it early and align everyone on what is
planned.

The starting section lists the first priniciples I apply when thinking
about design choices. All following sections list work items.

The document is on GitHub in Markdown and PDF format:

	https://github.com/joergroedel/svsm-governance/blob/dev-plan/draft-development-plan.md

	https://github.com/joergroedel/svsm-governance/blob/dev-plan/draft-development-plan.pdf

The PDF version has a TOC which I find very useful. I encourage everyone
to have a look and bring any suggestions and questions to the next SVSM
development call on May 15th.

Regards,

	Joerg

P.S.: The PDF file was created with pandoc from the Markdown file, so
      the later contains some special markup which is not compatible
      with GitHub Markdown.
