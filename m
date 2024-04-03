Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E0313848F
	for <linux-coco@lists.linux.dev>; Wed,  3 Apr 2024 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712143231; cv=none; b=sVBTEiwfkz6nyilN55xJnagm4u9pQb1DS6AMsdlM9T6Kc8FsfMV7XFV/KvZl1WyOzibTa9pPZCpxCFJo2bGO9CF1ibV6ISXWHBLhjKGohnB98MgKgYl0eVcjF0zcVW2HDq1S2ly6CJxnOxdiFUsdhi5BmmNRV06yWynrRUICBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712143231; c=relaxed/simple;
	bh=Q+0d3QLYSAKT24pMf5w49gK2Ew6aWzMbitLv1/LRZtE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=keLgYRb0I/oWSpnAh6M+K5s2B1niQuum9eTmxxSSuqA+DCzVVFcXs++8eTaSDHR1WjbqE+WFNgz3/BE8wEmq5CyzNCqWWllqgMR9GvJ3qGFFAMlSGqXb3IYQp2jh/5HV88LxsiVSMTVg4axq+asrdwH2/d4bIaofzPUa+IT/50E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=jLqOZlkz; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="jLqOZlkz"
Received: from 8bytes.org (p4ffe1eea.dip0.t-ipconnect.de [79.254.30.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0C6362818A6;
	Wed,  3 Apr 2024 13:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1712143221;
	bh=Q+0d3QLYSAKT24pMf5w49gK2Ew6aWzMbitLv1/LRZtE=;
	h=Date:From:To:Subject:From;
	b=jLqOZlkzbxwS0415SiTutxRuSAFFLq+aG1UvTGtdfomwYHft6xjBO3NmWT4rfAzDP
	 1F6ep4ilSPpfqh60X9Jm1wRCEDugngFrXxxbISbnxK0IyU84R2dgjDRDsJ+WCN4GsG
	 l6JUNl1sCEaRk9exATF96zAZiUABc1QcAcpkQUOcuDUtAV2pZZdBCchgR+fQAmj5TM
	 8Q1/GbC8OVuCvM0cUCJ5XFKy4qfaWL0XSiTVRtOrFQ3twXLJ6pFISU4PVUB5nOyAND
	 He4ZSdP7XQvvWykQ44aGIERJbo2RyEXEjZbzt5CDb2rZqazf1k756AWBJnQqmAjbrj
	 3mEdvvYfOltuw==
Date: Wed, 3 Apr 2024 13:20:19 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call April 3rd, 2024
Message-ID: <Zg07c6Y5a_Ak5oXs@8bytes.org>
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
call. My agenda so far is:

	* vTPM merge fallout
	* Security issue mitigations

The items we can not cover during the meeting will be deferred to the
next meeting.

Please note that Europe is now also on summer time, so the meeting will
be at its usual time spot again. The definitive time is always in the
Google calendar I shared below.

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
