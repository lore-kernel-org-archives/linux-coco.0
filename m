Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3195D84D29
	for <linux-coco@lists.linux.dev>; Thu, 25 Apr 2024 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714037586; cv=none; b=nLnQeUmdEiY3bnYA1Kp6sCKuYvojgMElBN4AKFU8t4SCGJUHxeUfwZHRN2r9WMmEzH6dZyJmxLv42cRlAOPbWNsN2ivvrPbG6IjSA7NDFPyVit9DsWW/6wgsGELPs7ZAEornhK5eHHpLv9ysMWGMtrrlsXluBmsMCCOwDDu0VNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714037586; c=relaxed/simple;
	bh=u/4guLVQeXGBq8kaiXMMGag+r/hqcdOc3mByxTbrnBY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3Nzq48V4DjVCAFWbwnIIUyNOa+JFNaue3HtZ1wVIxqLABQogQ3N4yEWMKNaEMizNpe1BnhKd/7JVg9BaW3t7UZeGUcLzZticEQERDyRr/7q8/yXxnEg6PFtDeU07loFFlBqzCMFxneGs+Xuv65mKDwhb9m/n67KVSEt/cwUCHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=5VZrM1Ji; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="5VZrM1Ji"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 020A71C5ABC;
	Thu, 25 Apr 2024 11:33:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1714037583;
	bh=u/4guLVQeXGBq8kaiXMMGag+r/hqcdOc3mByxTbrnBY=;
	h=Date:From:To:Subject:From;
	b=5VZrM1JixU1eaHNgQQH2yJkv7B2u3F2qeeR9S2TUMPvITvBUpeJiF3k0vQy5/yChk
	 36FBeLhlBEkgKFiFD3+lJ+jL5O5ntmcPq9llZzMt+k+fS92QMFksydpnsx7Qpup2n8
	 g73A3nkzN/0r/SKZawDJY8Tjszxqta4NH+pb8r2K3jyH7adYHcAwTGDpnA4dHjm74y
	 0M4whyd/GB4LPyTZLo+ibh7YSiAhzL3Ej9xgfFl5bbjbLMJ87iK59BW44pHBcjQxlN
	 V96DYOAOfuWORkscl5TqtgfNpaKtiP6V1jDMT6eagI/eoNKFW1GxfFAhSHbowQRxYj
	 bzwlSZdSC7V8w==
Date: Thu, 25 Apr 2024 11:33:01 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Sender: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: No SVSM Development Call on May 1st, 2024
Message-ID: <ZiojTfl-ElapCOIU@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As mentioned in the meeting yesterday, Wednesday next week is a public
holiday in Germany. This means there will be no SVSM development call on
May 1st and the next call happens on May 8th.

Note that the public Google Calendar is also a reliable source on
whether the meetings happen and at which time they are scheduled
(important during daylight saving time changes).

The link to the calendar is:

	https://calendar.google.com/calendar/embed?src=c_55a38f3460c638762a75d4fd6eda3b1cf455ec4cfd7f83201e3cbf817b420dd8%40group.calendar.google.com&ctz=Europe%2FBerlin

Regards,

	Joerg
