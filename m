Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5B910A25
	for <linux-coco@lists.linux.dev>; Wed, 14 Feb 2024 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707894933; cv=none; b=fSrUuJYn53h1jYd2wK4HQA/RUZP1lf7tdiWJqWyUrLmLCMo0thhcSL6z4E0NdgfvYiWmrCP4dWM/GjS/afPnCwEwsQbS8QJiVoTt3QIWd6pRyaLWyctxIRN2UnEJDhkZdNmERVQ4jmancIFWmufQJD/hW0X1yJ9tEOM8IzQ2fJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707894933; c=relaxed/simple;
	bh=Hbv5GAP+7DYh8DNlLo8Utw+B07SB7s5j/Y9np0ob9+M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U4RkE5unpOtZldhNz/+eZMcy/Wpggkga/Q2s2OMHOrHhXNU+ZI3Nmq4J2rOdpen7jRyJEW4WQNq3yHL+fkpGo+q4TRMuWI0vik1eaclDv+cSKZgmfP007hFopaIu4Mfxo3spKikGcdRlbakyCc9GGg7+IF40BhxXQkNFHaLHjeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=xYBXtYTR; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="xYBXtYTR"
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EE4641C5D08;
	Wed, 14 Feb 2024 08:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1707894923;
	bh=Hbv5GAP+7DYh8DNlLo8Utw+B07SB7s5j/Y9np0ob9+M=;
	h=Date:From:To:Subject:From;
	b=xYBXtYTRhHIUT7zYzW9DoQMOcGPkVzw90ivrcfL++f76wzr4rQZza9eEoR+dZfkLr
	 s8WN6NgTR+z/HV3ykyJ4qStS4Kd1CZdTLyBxXvSRLpAdT9YIeFlwe7RCUe4WyKVFkq
	 5SpLtckSpPc9Ls5TcrR+fABJDyTSPPMu6YQswuFx2YBLG4qNidPnZEmV3uOPtfZxoF
	 yvYhxaSsXNFVFMq3fUcuF7qzX7RT01sTxue1QV2Sjj1b4QZ7AkePoAKmgIYir5YoXE
	 yX7ro5EUsnm7sQ3MVMmNegKL3fTUC/wYeDwB+gD4FzH6pE9u9K5t8hBC4s9Oy9l+d7
	 CNSqdF7s5Rmcw==
Date: Wed, 14 Feb 2024 08:15:20 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Devel Call Feb. 14th, 2024
Message-ID: <ZcxoiH2tYenFpUhJ@8bytes.org>
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

here is the usual call for agenda items for todays SVSM development
call. I have one item to discuss:

	* Move to IGVM boot by default

If you have additional items, please let me know via email or in the
meeting.

A heads-up for NEXT WEEK: I will be off next week, which means we skip
next weeks meeting.

The meeting today is at 9am PST/12pm ET/6pm CET. Join using this GMeet
link:

	https://meet.google.com/ppv-xehx-dvb

The public Google calendar link with all meetings is:

	https://calendar.google.com/calendar/embed?src=c_55a38f3460c638762a75d4fd6eda3b1cf455ec4cfd7f83201e3cbf817b420dd8%40group.calendar.google.com&ctz=Europe%2FBerlin

See you all there.

Regards,

	Jörg
