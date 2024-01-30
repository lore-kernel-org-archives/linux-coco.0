Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DDC5C8B
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628806; cv=none; b=DSuteE/PqVBJJUNy8GPBLnb+NWVeDcJy9Hm40cG2/DQfria4jBcwO+xXEnWp04MX/SO8oFPrMG3+r0KgpQRDJyYHDLxBS7jalriP+ezUpsa7MQ75/t7e4AvE3sMRr26TgMUTtQxM6UuiSHJPv/XV9NaLDqYF1T4VPl5yjco3H2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628806; c=relaxed/simple;
	bh=RDJuywBa8mKM0Mz/nW7YLrR/sd7UWiuAdnDmFhWOzBo=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=MAl0uslxf/fHR2xgBXvWIKGvqMjpnCNHKlVdChmbz6SX46navmNlgAEeQSYLm3avSN24GykGagOaN17rn4PV2jUodHQTgh904Yn/cfkB66B3v3Ya/C2MA2rfaZLwMUMn/NLjhEOqRAMQEDFVglTpcdXSW1eNldWYlz0ASvsIBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=tyFdzb8t; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="tyFdzb8t"
Received: from smtpclient.apple (p200300f6af22b000e03f7ecb16e15d4b.dip0.t-ipconnect.de [IPv6:2003:f6:af22:b000:e03f:7ecb:16e1:5d4b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BCDE11E1FC3;
	Tue, 30 Jan 2024 16:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1706628796;
	bh=RDJuywBa8mKM0Mz/nW7YLrR/sd7UWiuAdnDmFhWOzBo=;
	h=From:Subject:Date:To:From;
	b=tyFdzb8tzoh5rX6iCY0IEFIOiQ4n9iVRCmb/mjh54Ikt7toULPlk2slVy5ABw0Ubo
	 tUFMpN5Vx7EmqEyzGMZ5+f3nOBVdgKJ3CzAV9rvHOEbQOM4R5ifH+SNdCVcHBQJypi
	 Pmm0Oy5dFl2qmIVjUYrqWoGaNxJjppXKmu3o7rkjSbfojMYUK0p2pc7UztIbKTDBGW
	 RHAyU0j3ddzFOZNjKatrlsoxtfp1DClpp1nGcxYUR1jHGAiVy67Cnep86IBdxaCp9K
	 yA4KfuS7B5NEKtElg0f2MeNwaMdvOKYDGcktgvHbk3J+0oi+c5WUqGLybE15XoaL/M
	 c1j6VmTZAwBWQ==
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
Subject: SVSM Development Call Jan. 31st
Message-Id: <F0CA63AD-EE1A-41E8-8F2D-6181BF4CEB7E@8bytes.org>
Date: Tue, 30 Jan 2024 16:33:06 +0100
To: svsm-devel@coconut-svsm.dev,
 linux-coco@lists.linux.dev
X-Mailer: Apple Mail (2.3774.300.61.1.2)


Hi all,

Just again a call for agenda items for tomorrow=E2=80=99s SVSM =
development call. I have one item to cover among the usual round of =
updates:

* Licensing discussion; Moving from Apache-2.0 OR MIT -> MIT-only

If you have additional topics to discuss, please let me know.

Hope to see you all there!

Regards,

J=C3=B6rg=
