Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E6214B950
	for <linux-coco@lists.linux.dev>; Wed, 25 Sep 2024 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249678; cv=none; b=dzNlzFkl55YxDI9oTTv6IKW6bkO9d7JurJTcb+aIZ5rDeaBqSoMQQoi4/U0Ea0C2i/ECeCBUeo7nmrihTXfYpS5G9Hysu7MRYO/sNg9VkFvPmwlsdePU0mPB+ew79dVc318BQzwl32qyuF7D4HzKt/ZIRT+XA9lPKOjuu4K2JtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249678; c=relaxed/simple;
	bh=VlkJHuV84wy7yAJCeQTXs9o4K5Yb1zMAEd77Ri57VpQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xt0uSTTGdmLea2sD1J1c+/7CmOum9LUy3WXx1n836oOTkWRMioa+bj8rPsPRqI6zYwcjp33QynPwuNuWqVBLlnd/X3hLILcwp42aS7XjkHlcl3jfYI4Ju9boraUL89fgeRqueff3wioKGjQzoijDc/JChKgZWPcF262KKlpHv0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=oeKv1aXo; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="oeKv1aXo"
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 722842A5EC2;
	Wed, 25 Sep 2024 09:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1727249659;
	bh=VlkJHuV84wy7yAJCeQTXs9o4K5Yb1zMAEd77Ri57VpQ=;
	h=Date:From:To:Subject:From;
	b=oeKv1aXoJ8abKx1SllrTGdhHfWDB+pHrxs+oW6AGkfyqtkyGbioHackKcghtBR1KZ
	 mZkeOSnTZXKds2zZDznQdMkFuweXE+Yp8cWpgGLy0zC1sTEQZ9wgIk9U8yU75e2Uqd
	 DLaQRVhBGyMRyIyv7B0AAFbaKusWQPLaGWs7aDq/UhiNyOV88ngUhFK/a5qxVz2RLs
	 y/qhd5Yw+aWfqX7kXuDHxEWMNlT++hb9xglh/ZCpi7+h2avpRUWHX7OfRV8m32Mn2f
	 I5PlwZfhZJGfX6cWtFTKTkAJxmpGn+sm0TwJ3RXRu+iNQ6O800J1bCTzh7oW7MTl+2
	 5ACNBfrNjG8ng==
Date: Wed, 25 Sep 2024 09:34:18 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call September 25th, 2024
Message-ID: <ZvO8-t7VtVeZGiLp@8bytes.org>
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

I will give an update about what happened at LPC and KVM Forum related
to the COCONUT-SVSM project for those who were not there. Of course
others that were there are free to chime in on this :)

Details of the meeting (GMeet and Calendar links, meeting time) can be
found in our governance repository at:

	https://github.com/coconut-svsm/governance

The meeting will be recorded and the recording eventually published.

See you all there.

Regards,

	Jörg
