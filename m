Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D266D13A888
	for <linux-coco@lists.linux.dev>; Wed, 27 Nov 2024 06:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732688738; cv=none; b=bDVdGBCsuAseWDTpl/9pq7r2DAQleRqc5rdIzpFVTpSgU4d/tu0Jr1zpxxCKnmYd/2tldNR8d+d7maiTUacx4tzXVdfT24ptMXvDs2QXyGjcYYxZFxHxI2Jlv4q21qQXZyCgqSAUq3gXiIEHxGZMBZA79fgDsnzkjM3WDc6aH60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732688738; c=relaxed/simple;
	bh=plsu8w0YbBQI9aipW0Qjjq8IFy3X7ljp5IOLV3PJlYg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n/nOjNGNrdfCfPcPcx/mgvh/Ip1YAeKssXPxOVs9VHmTDwz5VruwBKowWOs0xCaEmDGOqRsSnKU04bEfKo8cfwpn3+lE855MWUugM+XTWbaGP87NbY3ptu5u7cxyoMupCpi0rp1f7nTURQ/J2jL33Wo0sLGNi2pgVtyc8VNn5cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXVt2NF0gdmlydDogdGR4LWd1ZXN0OiBEb24ndCBmcmVl?=
 =?gb2312?Q?_decrypted_memory?=
Thread-Topic: [PATCH][v4] virt: tdx-guest: Don't free decrypted memory
Thread-Index: AQHawjpactR/NxvTmUOe+t6nsYTm9rHl1o5QgOXPFSA=
Date: Wed, 27 Nov 2024 06:25:08 +0000
Message-ID: <517c39d0ded1475fbdf6d648542f023e@baidu.com>
References: <20240619111801.25630-1-lirongqing@baidu.com>
 <468ea253c2b641dc826bce5e219ff0e6@baidu.com>
In-Reply-To: <468ea253c2b641dc826bce5e219ff0e6@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-baidu-bdmsfe-datecheck: 1_BJHW-Mail-Ex14_2024-11-27 14:25:08:468
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-FEAS-Client-IP: 10.127.64.37
X-FE-Last-Public-Client-IP: 100.100.100.38
X-FE-Policy-ID: 52:10:53:SYSTEM

DQo+ID4gSW4gQ29DbyBWTXMgaXQgaXMgcG9zc2libGUgZm9yIHRoZSB1bnRydXN0ZWQgaG9zdCB0
byBjYXVzZQ0KPiA+IHNldF9tZW1vcnlfZGVjcnlwdGVkKCkgdG8gZmFpbCBzdWNoIHRoYXQgYW4g
ZXJyb3IgaXMgcmV0dXJuZWQgYW5kIHRoZQ0KPiA+IHJlc3VsdGluZyBtZW1vcnkgaXMgc2hhcmVk
LiBDYWxsZXJzIG5lZWQgdG8gdGFrZSBjYXJlIHRvIGhhbmRsZSB0aGVzZQ0KPiA+IGVycm9ycyB0
byBhdm9pZCByZXR1cm5pbmcgZGVjcnlwdGVkIChzaGFyZWQpIG1lbW9yeSB0byB0aGUgcGFnZQ0K
PiA+IGFsbG9jYXRvciwgd2hpY2ggY291bGQgbGVhZCB0byBmdW5jdGlvbmFsIG9yIHNlY3VyaXR5
IGlzc3Vlcy4NCj4gPg0KPiA+IExlYWsgdGhlIGRlY3J5cHRlZCBtZW1vcnkgd2hlbiBzZXRfbWVt
b3J5X2RlY3J5cHRlZCgpIGZhaWxzLCBhbmQgZG9uJ3QNCj4gPiBuZWVkIHRvIHByaW50IGFuIGVy
cm9yIHNpbmNlIHNldF9tZW1vcnlfZGVjcnlwdGVkKCkgd2lsbCBjYWxsIFdBUk5fT05DRSgpLg0K
PiA+DQo+ID4gUmV2aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGlu
dGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogS2lyaWxsIEEuIFNodXRlbW92IDxraXJpbGwuc2h1
dGVtb3ZAbGludXguaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExpIFJvbmdRaW5nIDxs
aXJvbmdxaW5nQGJhaWR1LmNvbT4NCj4gPiAtLS0NCj4gDQo+IA0KPiAgUGluZw0KDQoNCg0KUGlu
Zw0KDQoNCg==
