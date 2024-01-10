Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FFC3EA8B
	for <linux-coco@lists.linux.dev>; Wed, 10 Jan 2024 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="mdsYt+ox"
Received: from smtpclient.apple (p4ffe1e67.dip0.t-ipconnect.de [79.254.30.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B17B01C1087;
	Wed, 10 Jan 2024 10:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1704878836;
	bh=5/aWsEdqNaLSTgedFMZrFFXDQHMDeCUyKoKCsjKn61Q=;
	h=From:Subject:Date:To:From;
	b=mdsYt+oxvnkEANzfEqLCeLZPw4/GjBnK+qxc73pceaEb1GYcfQHw4//UO0p5rrcW/
	 aHvqOSq3Vg0pa/X/O2jsJTczt+B9oWmz8h3cQ3owLS7Bj2blIKnjpJqns4XoCakpnH
	 9HoLQA/KtW7uedG1Jymh6d+EibbdfI0ae66V/RTGwYUKBX7ixiglIVBk4YZRXJ9WwE
	 //jiw14gdRgzc5kc9AA+pBX3AzrKbUyMW5/POeeepm7xMB/RWcpjqgTczD3m2W0goN
	 V4Q/K9Yocp3OnswSD65++f2wtqsmMFkcHLI11CR0jkdphINfXyLVN4XWh2lzZlLMtU
	 BBZY+vxORXwLA==
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: SVSM Development Call Jan 10th, 2024
Message-Id: <85D412BA-48CC-4005-89FC-F3A97F9717C9@8bytes.org>
Date: Wed, 10 Jan 2024 10:27:06 +0100
To: svsm-devel@coconut-svsm.dev,
 linux-coco@lists.linux.dev
X-Mailer: Apple Mail (2.3774.300.61.1.2)

Hi,

Happy new year!

Just a reminder that today at 9am PST/6pm CET the first COCONUT-SVSM =
development call of the year will happen.

Please send me your agenda items you want to have covered, otherwise we =
will just do the usual round of updates and discussions related to =
current developments.

We will meet again at https://meet.google.com/ppv-xehx-dvb

See you there,

J=C3=B6rg=
