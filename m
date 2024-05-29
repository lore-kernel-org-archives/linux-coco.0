Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EE52F32
	for <linux-coco@lists.linux.dev>; Wed, 29 May 2024 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716966523; cv=none; b=Lh8ymc9gw3EONf3rP8TtCH5odhXrkh+Eb+8m6GsTze5yzJVM4eBZaU23DPCqjMgHTub97arWGsb5F+6kVJtL2RIAmtBtXUFe3e0tp2V7PfJUGCKjQBBjZcUdEhrAcpWdnc6oMbtgnnn7KpUaOCzLNDfUxmIK9sradhrnxZ4CcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716966523; c=relaxed/simple;
	bh=sU38rJ7co9vFhVuIK9XngYxErP5oUIyLxyiWqmpBfqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urfpqqu8DTtL8BNustdzSviADRE+GnRv4qg/M/kivPs6yRNl38KHTin72YOe3dvYXA58Y9yBtVBm2kG7YTYZ1iQvxOnxnRWiX9yrucFzMBaPj5jNt1rfJpF48kBjYSK4YlKtGlsSgB/+r6WHjVAZGoCdtzc1BX1+gLVqpNOdjUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=T06ckjSW; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="T06ckjSW"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 044DA1C73EE;
	Wed, 29 May 2024 09:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1716966514;
	bh=sU38rJ7co9vFhVuIK9XngYxErP5oUIyLxyiWqmpBfqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T06ckjSWybNdnLfLbGpg0dSIgV5IYwgnOsbZb6X4vhyXeWVv98YEOE0FEtdwXHyqD
	 CvZxCIjXApAKOF0mH5tJNcOBFfYSE7ht6/26//Rg7FE22cubu7JDwlO0/t7wXsUjqv
	 3ckRFsO3njaqsiXoZztFBD94OFDfxR4B5mKWpV9Y8BAQoErvycO/q/UDBpkMEW4dI3
	 abX5yYbzHSrtAXdm43D9pAqX4Qf/miMXFDvdIFzzxcRzufevnAgi1TN1PTyJgo3iAH
	 aIOCYWTBIFpuwfiQIL403XJ291IIDbIK/Hq7KTjKkpJuvU2hbfDjlS3JaHUaACA9Ei
	 /70xKHzGB1WoQ==
Date: Wed, 29 May 2024 09:08:32 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Cc: "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [svsm-devel] SVSM Development Call May 29th, 2024
Message-ID: <ZlbUcG0GRMOWV1dp@8bytes.org>
References: <ZlY5A4N4S88FeFDQ@8bytes.org>
 <BL3PR11MB64589F48AB63EA77FD06CDB38DF22@BL3PR11MB6458.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR11MB64589F48AB63EA77FD06CDB38DF22@BL3PR11MB6458.namprd11.prod.outlook.com>

Hi Chuanxiao,

On Wed, May 29, 2024 at 12:15:11AM +0000, Dong, Chuanxiao wrote:
> Hello, just wondering if the meeting minutes published at
> https://github.com/coconut-svsm/governance/tree/main/Meetings are the
> recordings or there will be video/sound recordings published at
> somewhere else?

The recordings are currently not published, only the meeting minutes
(which are created from the transcripts).

Regards,

	Joerg
