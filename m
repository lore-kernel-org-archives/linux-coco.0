Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0662942A
	for <linux-coco@lists.linux.dev>; Thu, 16 May 2024 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715842883; cv=none; b=CBVWnNzmrKeBsmN5GBgVbpbNU8ITsSc9Zqz7VUgtxC+AeZEOWDx8VyFb3Ac0roxXAPertvzd7MS4aPMTyEhc+ZQGMJAwJOuQTsvGD09ADges8dL2iFX1Scz19tNvA2bJ/10PymTisr0pk3lJp7fY0n7+ulHrP4i3mevz+wJMnF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715842883; c=relaxed/simple;
	bh=w6DGOhCOnfeakkFQ3j858KsPOoi4zWvjYxfJqMQXZL4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5ZPFcGrlpa7Q6mD9PeYsQ0GqbzLMS233eOKfR16uX8mmBQNoVjqvGTONCWwbJHzc2IJ2fvQIpwgp5w/+roE0lIo+L4ZRKx3Q+6pVIeIlPk1QY1uh9dkrVD5+EB7zyO2+s0GPuIFlEzCn/gUyTO3kLi6jn07IXgb9wplnsw5xZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ipUcJB5G; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ipUcJB5G"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D46551C5A5C;
	Thu, 16 May 2024 09:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1715842873;
	bh=w6DGOhCOnfeakkFQ3j858KsPOoi4zWvjYxfJqMQXZL4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ipUcJB5GS8TEjzizjerj42M3KXzA7QG53WQGQDeWvOGL7ttkMo8Gr1zKnTc/n5/y8
	 AIcetDVmvKFl17sHnM77iJAUOMEOgDJvLr/35T+T8qC/wR9RzA2rjAWC9FHsJ6GkK8
	 BWSzTr8yteL/CZfirsdIgrzYvehTWu+JW106SrTbWbY6Nja5JZUornIijAzfsU+qF7
	 eBA9BR5Bkm0j/NOcws3JoTrx8TYBG4a119Wg+dm6QswzEBrcaWeizRDt8SOKUqkyLI
	 yG43ibEWuQUfaqP+UCXWUe9YggkxCmehPBltem+JM9n7uLjnan2vZP73nDN1U8IQc6
	 WGlDa0rgqbh8w==
Date: Thu, 16 May 2024 09:01:12 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call May 15th, 2024
Message-ID: <ZkWvON_Ib_7eA7YR@8bytes.org>
References: <ZkOKrTyR-ohXjyYL@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkOKrTyR-ohXjyYL@8bytes.org>

Hi,

On Tue, May 14, 2024 at 06:00:45PM +0200, Jörg Rödel wrote:
> The meeting will be recorded and the recording eventually published.

PR with meeting minutes for this call is now live at:

	https://github.com/coconut-svsm/governance/pull/13

Regards,

	Joerg
