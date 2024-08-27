Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B49618654
	for <linux-coco@lists.linux.dev>; Tue, 27 Aug 2024 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724790785; cv=none; b=JqFBxNDDzAPP9vicuxEbP20eD981GLJ8qIK1yMpCbv5mEya7K38zVgPjuj4rZZf5eX9Tkf0UTVAKEn6Y0+Q0NAC0RPD4+fihUYRwqFZ/6/q+N48sbr59tsfcdhZOSARmjnZDxtDcfo4XkR3NYuIqkRglTr9TTaYd+5I4dyjSKRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724790785; c=relaxed/simple;
	bh=5DC8ApCS4PQtNj6gDHXl1riZo4+mA0NpscXhWCWvNGE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B70dMv4aPahLtx2maMPsGeqDeTFQQzMfw+BU93WloGqBnrGNfuGcp9fsB1mXa/082sYSLFT90hc/d0DEz8qP4osj3+yxM5HZcl5dcCBElYGtpFv1LBjToR6nPMAqJtJcSoO2B8pcu2FbJuRNiasJUdJcZWtV34rfYK0QkzCbYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=6YES2SGi; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="6YES2SGi"
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 57606285A43;
	Tue, 27 Aug 2024 22:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1724790781;
	bh=5DC8ApCS4PQtNj6gDHXl1riZo4+mA0NpscXhWCWvNGE=;
	h=Date:From:To:Subject:From;
	b=6YES2SGibQg+ybfsNuj3ff493N0H1SvB2Hbq/nC3eqaBYHb3gIciDfSai476IS7FH
	 tWh60j/tJVa07Ovw2ERAth2FfLve8XYqlHT6cjwaLV3gbtyhXym+W4CiEd9EKWnNdL
	 Q90LzPwGj36oMlSBcJWztb7zUeH2ZRmeMHoq2uPvWTYSSWohknUveR6zQ+sZySaDjT
	 MhG41Jq1UUIaRoH8xMbTEbTebZzdmCbenH/V7Wfmr8LDprzfaI69fVLh6I7M7+o3nH
	 TYcQEzZCd0F7Py59ZlDvXaJaYL64s9YmQQ2OwZtGRZdaguX9cNDdvxoYtJih+PSv1s
	 oX49ohUphGMTw==
Date: Tue, 27 Aug 2024 22:33:00 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call August 28th, 2024
Message-ID: <Zs43_I_cewEo6efb@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Here is the usual call for agenda items for this weeks SVSM development
call. Please send me any agenda items you have in mind or raise them in
the meeting.

We have one topic to resume from last week:

	* COCONUT Project Logo discussion

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
