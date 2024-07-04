Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378804C6E
	for <linux-coco@lists.linux.dev>; Thu,  4 Jul 2024 01:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720055807; cv=none; b=JNiJNmfEGO1uBfKS2uQTxc0bRgDhINliYfpJK8SqsdRwFHY19mZpmlksrBL43pGqqC0EdmTQ2CBN3gDaHnMl6zm61kM2f/ewMNuoIBWKIyvYGDyDMjwH0mbvq6Lc6XM5gzAcIOYoV2D+6q5Ovli0SCc6mh5WPbLw1sM/VaS5244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720055807; c=relaxed/simple;
	bh=KpNGbsUIZRQumfhpebBtSgyMktklNKtqJPwOlRNLUeU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jg5eEYM6NoI8qkzhKZQFYcZbuaJyp1peiN0+XVomRNA+2+6zDpy56PGAGYRlVZ+TTmpcS8cFObJ6NfB5kp1jX6Az7BzIGB4BxuNKikJvUgzymvfuyBiIqiLEcAkGkIVqRSghMtZe+5vw/OqlTDVsjMpcz/KM4dkQyfKTVyDa0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>
Subject: RE: [PATCH][v4] virt: tdx-guest: Don't free decrypted memory
Thread-Topic: [PATCH][v4] virt: tdx-guest: Don't free decrypted memory
Thread-Index: AQHawjpactR/NxvTmUOe+t6nsYTm9rHl1o5Q
Date: Thu, 4 Jul 2024 01:00:44 +0000
Message-ID: <468ea253c2b641dc826bce5e219ff0e6@baidu.com>
References: <20240619111801.25630-1-lirongqing@baidu.com>
In-Reply-To: <20240619111801.25630-1-lirongqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-baidu-bdmsfe-datecheck: 1_BJHW-Mail-Ex16_2024-07-04 09:00:44:853
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.51.45
X-FE-Last-Public-Client-IP: 100.100.100.38
X-FE-Policy-ID: 52:10:53:SYSTEM

> In CoCo VMs it is possible for the untrusted host to cause
> set_memory_decrypted() to fail such that an error is returned and the res=
ulting
> memory is shared. Callers need to take care to handle these errors to avo=
id
> returning decrypted (shared) memory to the page allocator, which could le=
ad to
> functional or security issues.
>=20
> Leak the decrypted memory when set_memory_decrypted() fails, and don't
> need to print an error since set_memory_decrypted() will call WARN_ONCE()=
.
>=20
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---


 Ping

Thank

-LiRongQing
