Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B619D88A
	for <linux-coco@lists.linux.dev>; Fri, 14 Jun 2024 05:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718342358; cv=none; b=NbqmKbkRwE0EYJZibeRQ1GR5/g7DsnUHCMLlAU+uh5AnsVe70Dfqd0DqZ2LxQJmUBk+WttEVJRFfws7it6krXGrVxAhAqSeb84+Lrq0xW5dd4mfomBzOqIsNFQ8ivC9E7YnlRRnQgdWr5AjYvs+l3gkgu2AFZoNOp0/7Hjs6CN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718342358; c=relaxed/simple;
	bh=kLOlM4j9xDodwkdZwxKcldY5vQNxE2UIxGyG9ICNiLw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FaxJB7S2+UrV2AW6YNi+0rTC4GIeA7U1RoxLcHtvydU+QSmU3dkO4htfRyU3dEJpAQHOfRrOHVDfwE2MX6R+GvLeo5yDIKmzgpTE8s3fOm8AbgZj0c4hf9aF7yl8VPMytXFh9lPC8Cn1+C/t8UUxusiqj+KHywsepg8wcHs6IRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
Subject: =?utf-8?B?UkU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdIHZpcnQ6IHRkeC1ndWVz?=
 =?utf-8?Q?t:_Fix_the_decrypted_failure_memory_free?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF0gdmlydDogdGR4LWd1ZXN0OiBG?=
 =?utf-8?Q?ix_the_decrypted_failure_memory_free?=
Thread-Index: AQHavYORdaoCkGZZM0S/mvvPPMdwh7HFV1GAgAFZoXA=
Date: Fri, 14 Jun 2024 04:48:18 +0000
Message-ID: <f6813dfbfc7c41d580656826724f5f9e@baidu.com>
References: <20240613111931.43123-1-lirongqing@baidu.com>
 <0f6752d0ff95ba9d4fdafdfba1b37c9a140c773d.camel@intel.com>
In-Reply-To: <0f6752d0ff95ba9d4fdafdfba1b37c9a140c773d.camel@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.51.54
X-FE-Last-Public-Client-IP: 100.100.100.38
X-FE-Policy-ID: 52:10:53:SYSTEM

PiBJbiB0aGUgb3RoZXIgY2FzZXMgdGhlIGdlbmVyYWwgY29uc2Vuc3VzIHdhcyB0byBub3Qgb3B0
aW1pemUgZm9yIHRoaXMgZmFpbHVyZS4NCj4gQXMgaW4sIGRvbid0IHRyeSB0byByZS1lbmNyeXB0
IHRoZSBwYWdlcyBmaXJzdCwganVzdCBnaXZlIHVwIGFuZCBsZWFrIHRoZW0gb24gdGhlDQo+IGZp
cnN0IGZhaWx1cmUuIFNvIHRoZSBmaXggY291bGQganVzdCBiZSB0byByZW1vdmUgdGhlIGZyZWVf
cGFnZXNfZXhhY3QoKSBjYWxsLiBJDQo+IHRoaW5rIHdlIHNob3VsZCBzdGljayB3aXRoIHRoYXQg
cGF0dGVybi4NCj4gDQoNCkkgc2VlLCBJIHdpbGwgc2VuZCB2Mg0KDQpUaGFua3MNCg0KLUxpDQo=
