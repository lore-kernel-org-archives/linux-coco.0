Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAB313DDC3
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820034; cv=none; b=dxXLFlJ47t8chQPbb0YhOVuIdI0jcvNoFF/vpOG3p+LJmNTQpQfhJdhhKWvQXzq53xTwzTCbxvhNYtuyQ0v46BOV/OpeLCLCbrTMmfUqDkaax2+Yi9ZHs1Cp/VwPmEPQVRfWdlEIZhsPKIzuk4572lWaziubOU+j7DC9gQ8XnqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820034; c=relaxed/simple;
	bh=cSZYzF/iDcqRCw0d2nrGpVH85ffngUb2ApA03sRi8K8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZf+6mbH6+XR54glvIJLCOuI/D0Wdg3lCX2hvFITRVDAal/Mgp/kKKgB+D+TSBz2Vl1f5mJ/URH/2LxAAgnUOBSB1aAQLYUXYBkfFRpd3Ih37Dapm11DRh+JyUtJGgd4p8mEEkV+bj01eMTmki781D7JHvMfgw8XX4w0wMOMDVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=xA7x/sKY; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="xA7x/sKY"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BBA7D281ACA;
	Thu, 11 Apr 2024 09:20:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1712820030;
	bh=cSZYzF/iDcqRCw0d2nrGpVH85ffngUb2ApA03sRi8K8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=xA7x/sKYtKgQtJmjgaX3nMUAOGezHU7+FwnSWvXyvgRUwqU515xi7sej1QBH3Qct9
	 wmotO9Bg3TmfZmg2iszXw1NcJ6aV0yKfES8Y4p/kPvYnKHLvqZBaeOvygIbL3o4iwd
	 m6FecvoFtEi/oKzGY2i2T+H6f1DxbXsUE7Zclw6JNI4DnOFb1LYR0VKpie05RKEP6T
	 IHES8qSJ2xXEgSVEGZb2HiS5yezKtN5llIRGlu485CVRpOzgTHciuCAm709giYqlLK
	 CB2LCNQB11ojiwT991FmgWBLIFeU0SeZOMPBzOxF4AO5ptwVNZHja5fX0YCzTACkuT
	 U62/Ppd9JIUkg==
Date: Thu, 11 Apr 2024 09:20:29 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] SVSM Development Call April 10th, 2024
Message-ID: <ZhePPeKoq-LzJ-Hv@8bytes.org>
References: <ZhZfWhyOQ4ZmTdVP@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZhZfWhyOQ4ZmTdVP@8bytes.org>

Hi,

The PR adding the meeting minutes for yesterdays call is now posted:

	https://github.com/coconut-svsm/governance/pull/10

Regards,

	Joerg

On Wed, Apr 10, 2024 at 11:43:54AM +0200, Jörg Rödel wrote:
> Hi,
> 
> Here is the usual call for agenda items for this weeks SVSM development
> call. I don't have agenda items so far, please send me yours or raise
> them during the meeting.
> 
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our governance repository at:
> 
> 	https://github.com/coconut-svsm/governance
> 
> The meeting will be recorded and the recording eventually published.
> 
> See you all there.
> 
> Regards,
> 
> 	Jörg
> -- 
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
