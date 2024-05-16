Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA27B2EB10
	for <linux-coco@lists.linux.dev>; Thu, 16 May 2024 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715845770; cv=none; b=GEW6D5jsIJt+6F/yCb+pslQS60Ai/apZv88/V+xdSmR7jJUTJvsE6r8JMFuk03D1ndFSKL4ENWdzK87+hFMig6GTyEb9Oz/a5WVx1CQYEisfVw+4eUsmK4eAR3MS4YAtWne4BCxdQeinwsO4EvgTNGJRIaELiQQ3kQ8LcxhAshk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715845770; c=relaxed/simple;
	bh=UcOuOA5cqyB+RsOxwi5nj+77IM0DoGfY5pPBvs2rHd8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efMsCCN/CQ1P+A3UoLcHr+xwNTPWD+T+nRfBNmTlciYlrclUpH0sC5rbNEF5UKaYxag9HY33wSmqA3R0cd+9CtePh8WUgqCRMhJzFIi82qZvVi2Imzvg2NTeNyk5UfxZYTl4G4UG43mD0PJKblzc4mjg2OJIPg4vJ7EIAtWBP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=QCxiHpWV; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="QCxiHpWV"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 791D71C0BB6;
	Thu, 16 May 2024 09:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1715845766;
	bh=UcOuOA5cqyB+RsOxwi5nj+77IM0DoGfY5pPBvs2rHd8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=QCxiHpWVe4IlT5Dl6I1LijpkNizxSKLMEEEiM5525vPy7TbGVZwNIAwQiyXAYZR7/
	 HHQR0bkTWMCNS/rLX02DC/VfAN+waxnkRflruI5uz2cSZs/UFfnBxnVqM7dN2b+WIg
	 ogs6UQaic6b3aGhQQHKvxFuY2II1G4qOqKVP45W3W25iyGMIC4VvL0f2i9vyEA4A1I
	 mL6TTuBXCCBmkOq+1LbXebtAH80nEg4Hp0ld1lLj5FPHa5I7eqEhwQJ6yhYfAP1H1V
	 LoA7Kg005YluU1abPB2UbPVEMYmd6sf7W9t1Uw6t5YbKgoi2GwA1pJyz+IkEwtpONQ
	 86GjX/N9a436Q==
Date: Thu, 16 May 2024 09:49:25 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] Development Plan Document
Message-ID: <ZkW6hVW6F2KJqIpV@8bytes.org>
References: <Zj30Nqq3OS58DwpP@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zj30Nqq3OS58DwpP@8bytes.org>

Hi,

On Fri, May 10, 2024 at 12:17:26PM +0200, Jörg Rödel wrote:
> As announced in the last meeting I am sharing a development plan
> document which lists the in-progress and future work items to get
> COCONUT-SVSM to the envisioned point.

As discussed in the last meeting, I opened a PR adding the document to
the SVSM repository. Find the PR here:

	https://github.com/coconut-svsm/svsm/pull/344

Regards,

	Joerg
