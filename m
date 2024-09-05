Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3191E1925A4
	for <linux-coco@lists.linux.dev>; Thu,  5 Sep 2024 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519257; cv=none; b=Nk7CJu6cclBujIyt0hJRppjBjiGItuTlRug+WzX0z+T+SfUuPyhy9VJZO7J5DE10duAi9yqNGw4yrBQLYLkVe9icBri8uNRFbBTgT5GXAFaCXqVhAZk76by/O0++aj6VEiemXQhlfWdNWyH3m+juHxkbSCwiZq6jqzgQE8TC4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519257; c=relaxed/simple;
	bh=vn15mP7ZdGStupXsSrkd1JvzUNi3XtuF29PdYSjcZt0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtuqZ+08Radrp0IRStaME+v3wUcshBSF8e80CBNRp61aBS9yDOxHav9FoBEKjaUEo4jWU0ETUFPO6dJL7ZLa34sK2Xk8qmwK68dt7+wHWaJgGBiDytQqY0wW/NCp7y7470dmUWmlyKez9DpUNUVn7J446mFsWFvu8bOYfdn+mYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=DT8o0Bvk; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="DT8o0Bvk"
Received: from 8bytes.org (p4ffe1f47.dip0.t-ipconnect.de [79.254.31.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C9598288927;
	Thu,  5 Sep 2024 08:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1725519253;
	bh=vn15mP7ZdGStupXsSrkd1JvzUNi3XtuF29PdYSjcZt0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=DT8o0BvkhhaLOnHUaSuRJsW6ivoaupL54sp+2DKKPtEtlH0OG3vwkVyeGdWWXjBti
	 ay4GsY9Hza/EFbeAMH/H4rSkxsejQyjCoG+d5BkllqheoT/2Uj3wryf9SvJLMU5Uhl
	 o15UUhZJWJXtn1QCdF2KEHjFYfCdYRwQ5KvNkNUQnzwJ9lE5n/BUjz3/bCIpjCyIye
	 IqKxzhX+DWmHteDsSUhgojNdBxKnNz1BDAPuA4e3DoUcCpkm70T4DWin7vv0Tcw9LA
	 w+FiHRsXFgmEE6ONKgYOGIMwccNjfoVcIYTIRSHXYIsAU9/KWRfUq4B5yk4zrMrhCd
	 HaZHTvuzLPZvA==
Date: Thu, 5 Sep 2024 08:54:12 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call September 4th, 2024
Message-ID: <ZtlVlHA6Dsxg1TqN@8bytes.org>
References: <ZtcqEhX5tnf4q5yj@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtcqEhX5tnf4q5yj@8bytes.org>

On Tue, Sep 03, 2024 at 05:24:02PM +0200, Jörg Rödel wrote:
> 	https://github.com/coconut-svsm/governance

Minutes for this meeting are now available in this PR:

	https://github.com/coconut-svsm/governance/pull/25

They do no cover every detail we discussed, so if you find something
important missing please comment the items on the PR so I can add them.

Thanks,

	Joerg
