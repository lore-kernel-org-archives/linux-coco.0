Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35C039FE5
	for <linux-coco@lists.linux.dev>; Thu, 17 Oct 2024 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729150486; cv=none; b=JWld0s54Z6nwXvs0m6BlHL5KE9p+SWX/YDqxg3oXUKADSwmPTGU726aDqkfwgr4MAkVENWdrPpsiC9rl3i+rEDGRjfflSe+3wC7u3rJYg2BskWSbdebDpi8s2xK3ZplliO+aCCsDLttczkqOHvtWTDYTOs8SYyIv0VOeC9KJtUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729150486; c=relaxed/simple;
	bh=V/UDoVIaLrl/ycMPKq3Cb5sn+E9HgFvSmh/H0zILLg4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONESsWKNxgG3FNPtldAdxx37wrGsIrm1EdNUkDFRYeQfUqDtpv/vOMJSRBA/PPvEa5GWO5G31E5TXqr+adtIag+uTS3mlx4Do2H7xZbi5KWwah+3Hlz3LQ31NC4Gehag2gqLZNpJ1ZJVMx4C0SZqGNfYV5QZOZ8Yqc9N282E13Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=lGSfiibP; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="lGSfiibP"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id F293C2A01B8;
	Thu, 17 Oct 2024 09:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1729150477;
	bh=V/UDoVIaLrl/ycMPKq3Cb5sn+E9HgFvSmh/H0zILLg4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=lGSfiibPkJ52cVaXb5QCeMOS3Lsd8tpSEyMte5B76pLdwYWwZiX0xGbTXJejvn7uP
	 AyA6X+IReFs60O6/U1ZLI4kTNR4OK6wCwGxBWIIwR6iPLrUXNQVmj/mWi4FeTiOfhc
	 7SY5B66cY0lMKBCIsSEBa3ISyFaEa8SHtSb8Y3VfqCLtRIm23Bcc2iAWvqESDWTXfO
	 Il2N9HYDZzU2q2+X+SfDBh/2yQJCcrjyYw1zXf4kHQ28P3hUTVHrdCpdpkB5goPBkB
	 XxV/tvwebQKUfaplGQig/lZ2fVXIaOVbYuIS5oHcEzOB+SaeIjsmd4zCF19aUJkagh
	 WixWKHA0OFNNA==
Date: Thu, 17 Oct 2024 09:34:35 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call October 16th, 2024
Message-ID: <ZxC-C0Pf96XukT4u@8bytes.org>
References: <Zw6PLUNF5hviin1s@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw6PLUNF5hviin1s@8bytes.org>

Meeting minutes PR is now posted:

	https://github.com/coconut-svsm/governance/pull/30


Joerg
