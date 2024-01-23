Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173485F879
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706018094; cv=none; b=jlR3bfUeTy2lrhbHrndH4bDF+MWMKCBCXOab4v8CFBoyi6gS5kyWN0wHbKbwTOBxBi9KnhhoBVA29WPYJKNfNr17E3h4YfGkny3SaZ2xLWOl+wdTjUYZJyAkAxpHCcB7XytmiXPwZPMs8bB7cH1wjXsXNoxtAtWZF28MbqZregU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706018094; c=relaxed/simple;
	bh=kIhddweTcIeFUAYqwxqnA64ysrpyfTuGB5HAcdECEw4=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=HQLMJVz2kC4bdtksVZnrORyLuvmiXnRg+5oPfbIii86Z3bS7/OKyOBll5KM1G5NEAYGo+1ksW/2KerDRaNRRCQU1YYM8B+/EHxl7PTql+b+RCbnPmdGkaSMoFr/CUD+0SECcupPpPENGbyeWJyPwhH1pD1mtMXxWGt9TNM1QWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=47lrksYW; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="47lrksYW"
Received: from smtpclient.apple (p200300f6af22b000080785fe5849c4ab.dip0.t-ipconnect.de [IPv6:2003:f6:af22:b000:807:85fe:5849:c4ab])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 156C91C3656;
	Tue, 23 Jan 2024 14:54:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1706018085;
	bh=kIhddweTcIeFUAYqwxqnA64ysrpyfTuGB5HAcdECEw4=;
	h=From:Subject:Date:To:From;
	b=47lrksYWdZvtGq2rdylx9YSYFogWvT2PjY+dOD0TiMbKHT/IhQT7Nn7r9Lgj11Sc6
	 AYBjgoPVSwoYJYh4LBMmOeYjocBJRr8SLuu/txWUGpsqTVmXldE0q2ZdZ0u8RoFoVW
	 mrkxXolksWERqHXzF8dVBFjo26yw3LaccS+583sx6LmIhm6LfoTAU73w9ursMokYqu
	 4ct+AzURHKXOyBa3CMX0ILZq+nBnDDNcF4Y1hMBxjgbP5+LCya40MSz4fCeY7UMSaJ
	 v/W79y1Njt56/5NY9WQ3I4gUl+5LPKCvG5v8EGHByshWCMbdTXS4de1uqbnWFKAfMy
	 LbZRtN5WpzXnQ==
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
Subject: No SVSM Call this week
Message-Id: <23465154-D6F7-4E1D-9083-1F10430866BA@8bytes.org>
Date: Tue, 23 Jan 2024 14:54:34 +0100
To: svsm-devel@coconut-svsm.dev,
 linux-coco@lists.linux.dev
X-Mailer: Apple Mail (2.3774.300.61.1.2)

Hi,

As mentioned last week in the call, I have a conflict this week and have =
to cancel the SVSM Development call on Wednesday.

See you all next week!

Regards,

J=C3=B6rg



