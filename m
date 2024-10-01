Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7754F199FD7
	for <linux-coco@lists.linux.dev>; Tue,  1 Oct 2024 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772643; cv=none; b=YmaQM+egARJcv+z/WMvSdbnx0Or7nolME1XeX8cWHxJMRGg6helU0ayeIl/asTtuYUbd5RDw/Fw11zL5jyKL1r+iNJQ5t3LhRv5czYO3Em96uWIIk2UE4tDCC4n+j9ZQPq8uhVEJf/gOBtM/EPWOjRLdi7ntdHU7plSVcVDmCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772643; c=relaxed/simple;
	bh=HXDhBHmqz0vZeL69ULX7aOPCg3eFUYtnpatG3NmdMrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u5hGeow59cFPlEMacg71CMifgN4JKWoaurNEtQ54oLjbMLZaGgwaQSflT0rWvzp8EgGJjn8djGQBhK8ZI6gjV/pRz8ap6LFcNZhv3686Fj+bZczty3COz2Ba5WQk3QyZP++xsK1pJLd3i0408htPGtXqJPapmYJDQhRwTlHfdSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=HNw9XUNK; arc=none smtp.client-ip=99.78.197.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="HNw9XUNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1727772641; x=1759308641;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HXDhBHmqz0vZeL69ULX7aOPCg3eFUYtnpatG3NmdMrM=;
  b=HNw9XUNK1I1LsBBrEmNYqJ0oDQNtKKE6VpFM/UWr/VV1dBsOKvKZdbuw
   Rm1ILbRBBa03hdke6neP3+B/eBVXzYgQZKxotHJcw/LiQzWPuDWQF1h+x
   u0Uu3Tx8VU/lm+S3ICU+GYLVRwcNkevuEHGvLXzGPaogTT4R37JX3Mqnd
   A=;
X-IronPort-AV: E=Sophos;i="6.11,167,1725321600"; 
   d="scan'208";a="133388571"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 08:50:19 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:39394]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.191:2525] with esmtp (Farcaster)
 id e2c1057d-023f-4ed9-a17c-d3e62806f5a2; Tue, 1 Oct 2024 08:50:19 +0000 (UTC)
X-Farcaster-Flow-ID: e2c1057d-023f-4ed9-a17c-d3e62806f5a2
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 1 Oct 2024 08:50:19 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34; Tue, 1 Oct 2024
 08:50:16 +0000
Message-ID: <665c5ae0-4b7c-4852-8995-255adf7b3a2f@amazon.com>
Date: Tue, 1 Oct 2024 10:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] configfs-tsm-report: Introduce TCB stability
 enumeration and watchdog
To: Dan Williams <dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Michael Roth <michael.roth@amd.com>, <x86@kernel.org>,
	<aik@amd.com>, <elena.reshetova@intel.com>, <pgonda@google.com>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
X-ClientProxiedBy: EX19D037UWC001.ant.amazon.com (10.13.139.197) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDEzLjA5LjI0IDAyOjI2LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gT25lIG9mIHRoZSBwb2lu
dHMgb2YgY29udGVudGlvbiBmb3IgZW5hYmxpbmcgcnVudGltZSB1cGRhdGVzIG9mIHRoZSBURFgK
PiBNb2R1bGUgaGFzIGJlZW4gd2hhdCB0byBkbyBhYm91dCB0aGUgZmFjdCB0aGF0IGl0IHJlc3Vs
dHMgaW4KPiBjb25maWRlbnRpYWwgVk1zIHNlZWluZyBzdXJwcmlzZSB1cGRhdGVzIHRvIHRoZWly
IFRDQi4gVGhlIGdlbmVyYWwKPiBjb25jZXJuIGlzIHRoYXQgdGhlcmUgaXMgYSBub24temVybyBj
b25maWRlbnRpYWxpdHkgcmVncmVzc2lvbiByaXNrIGZvcgo+IHVwZGF0aW5nIG1lYXN1cmVkIFRD
QiBjb21wb25lbnRzLiBOb3Qgb25seSB0aGUgVERYIE1vZHVsZSwgYnV0Cj4gbWljcm9jb2RlLCBT
RVYtU05QIFBTUCBmaXJtd2FyZSwgUklTQ1YgYW5kIEFSTSBlcXVpdmFsZW50cyBldGMuIFRoZQo+
IGRlZ3JlZSB0byB3aGljaCB0aGUgVENCIGlzIG9yIGlzIG5vdCBjb21wcm9taXNlZCBieSBhbiB1
bmV4cGVjdGVkIHVwZGF0ZQo+IGlzIHVua25vd2FibGUgYnkgdGhlIGtlcm5lbCwgYnV0IGl0IHNo
b3VsZCBhdCBsZWFzdCB0cnkgdG8gYmUKPiB0cmFuc3BhcmVudCBhYm91dCB3aGF0IGl0IGtub3dz
IGFib3V0IFRDQiBzdGFiaWxpdHkuCgoKSU1ITyB0aGlzIGxvb2tzIGF0IHRoZSBwcm9ibGVtIHRo
ZSB3cm9uZyB3YXkgYXJvdW5kLiBUaGUgdHlwaWNhbCBmbG93IApmb3IgZmlybXdhcmUgdXBkYXRl
cyBpczoKCjEpIFJlc2VhcmNoZXJzIGZpbmQgYW4gaXNzdWUKMikgSW50ZWwgZml4ZXMgaXQsIGlk
ZWFsbHkgaW4gVERYIE1vZHVsZS4gUmVsZWFzZXMgVERYIE1vZHVsZSB1cGRhdGUuCjMpIEluZnJh
c3RydWN0dXJlIHByb3ZpZGVycyB1cGRhdGUgVERYIE1vZHVsZSB0byByZXNvbHZlIGlzc3VlCjQp
IEVtYmFyZ28gbGlmdHMKCklmIGFuIGlzc3VlIGltcGFjdHMgeW91ciBjb25maWRlbnRpYWxpdHkg
cHJvbWlzZXMgYWNjb3JkaW5nIHRvIHlvdXIgCnRocmVhdCBtb2RlbCwgeW91IGFyZSBhbHJlYWR5
IGFmZmVjdGVkIGJ5IGl0IGFmdGVyIDEpLiBZb3UgYXJlIGFibGUgdG8gCmFzc2VzcyB3aGV0aGVy
IHRoYXQgaXMgdGhlIGNhc2UgYWZ0ZXIgNCkuIFRoaXMgcGF0Y2ggdGVsbHMgeW91IGFib3V0IGl0
IApkdXJpbmcgMykuCgpJZiB5b3VyIHRocmVhdCBtb2RlbCByZWFsbHkgcmVhbGx5IGNvbnNpZGVy
cyBob3N0aW5nIGluZnJhc3RydWN0dXJlIGFzIAptYWxpY2lvdXMsIHlvdSBkaWQgbm90IGdhaW4g
YW55IGJlbmVmaXRzIGZyb20gbGVhcm5pbmcgYWJvdXQgMykuIFlvdSAKa25vdyB0aGF0IHNvbWV0
aGluZyB3YXMgcGF0Y2hlZC4gWW91IGRvIG5vdCBrbm93IHdoYXQuIFlvdSBkbyBub3Qga25vdyAK
d2hldGhlciBhbnlvbmUgbWFsaWNpb3VzIHdhcyBhbHJlYWR5IGF3YXJlIG9mIHRoZSBpc3N1ZS4g
SWYgeW91IHdlcmUgCnN0cmljdCwgeW91IHdvdWxkIG5lZWQgdG8gY29uc2lkZXIgYWxsIGRhdGEg
cGFzdCAxKSBpbiBzdWNoIGEgVk0gYXMgCmNvbXByb21pc2VkLiBHaXZlbiBTRVYtU05QJ3MgcGF0
Y2ggdHJhY2sgcmVjb3JkLCBJIHdvdWxkIGV4cGVjdCBzZWN1cml0eSAKcmVsZXZhbnQgcGF0Y2hl
cyBtdWx0aXBsZSB0aW1lcyBwZXIgeWVhci4gSWYgeW91IGFyZSByZWFsbHkgcGFyYW5vaWQgCmVu
b3VnaCB0byBjYXJlLCBub3RpZmljYXRpb25zIGF0IHBvaW50IDMgd2lsbCBub3QgdGVsbCB5b3Ug
YW55dGhpbmcuIApJbnN0ZWFkLCB5b3VyIGNvbmNsdXNpb24gd291bGQgcHJvYmFibHkgYmUgIkkg
Y291bGQgZ2V0IGNvbXByb21pc2VkIGF0IAphbnkgcG9pbnQgaW4gdGltZSwgc28gbGV0IG1lIG5v
dCBleHBvc2UgZGF0YSBpbiB0aGUgZmlyc3QgcGxhY2UiIHdoaWNoIAptZWFucyB5b3UgY2FuIG5v
dCBydW4gaW4gdGhlIENsb3VkIGF0IGFsbC4gSW4gbW9zdCByaXNrIGFzc2Vzc21lbnRzLCAKY3Vz
dG9tZXJzIHdpbGwgdHlwaWNhbGx5IGJlIG9rIHdpdGggYSB0ZW1wb3JhcnksIGxpbWl0ZWQgcmlz
ayBiZXR3ZWVuIDEpIAphbmQgMykuIEFuZCB0aGF0IG1lYW5zIHlvdSB3YW50IHRvIG9wdGltaXpl
IHRvIHNoaWZ0IDMpIGxlZnQgYXMgbXVjaCBhcyAKcG9zc2libGUgdG8gZml4IHNlY3VyaXR5IGlz
c3VlcyBhcyBxdWlja2x5IGFzIHBvc3NpYmxlLgoKSW5zdGVhZCwgd2hhdCB3ZSBkbyBieSBjcmVh
dGluZyBGVUQgYXJvdW5kIHRoZSBwYXRjaGluZyBwcm9jZXNzIGlzIHRvIApjcmVhdGUgYSBmYWxz
ZSBhc3N1bXB0aW9uIHdpdGggY3VzdG9tZXJzIHRoYXQgInVucGF0Y2hlZCIgPT0gInNlY3VyZSIg
CndoaWxlIGl0J3MgdGhlIGV4YWN0IG9wcG9zaXRlLiBXZSBhbHNvIGVuY291cmFnZSBhIHNoaWZ0
IG9mIDMpIGZyb20gbGVmdCAKdG8gcmlnaHQ6IElmIEkgb25seSBwYXRjaCB5b3UgYWZ0ZXIgZW1i
YXJnbyBsaWZ0LCB5b3UgY2FuIGFzc2Vzcywgc28gCml0J3Mgc2FmZXIsIHJpZ2h0PyBOb3QgcmVh
bGx5LCBiZWNhdXNlIHlvdSBwcm9sb25nIHRoZSB0aW1lIGFuIAplbnZpcm9ubWVudCBpcyB1bnBh
dGNoZWQuCgpUaGUgY3J1eCBvZiB0aGUgcHJvYmxlbSBpcyB0aGF0IC0gYnkgZGVmaW5pdGlvbiAt
IGEgVk0gY2FuIG5vdCAKYXV0b25vbW91c2x5IGRldGVybWluZSBzdGVwIDEpIGJlY2F1c2Ugd2hh
dCByZWFsbHkgaGFwcGVucyBoZXJlIGlzIHRoYXQgCnRoZSB3b3JsZCBhcm91bmQgaXQgY2hhbmdl
ZC4gV2UgbmVlZCB0byBhc2sgdGhlIHdvcmxkLiBTbyBpZiBJbnRlbCBpcyAKcmVhbGx5IGNvbmNl
cm5lZCBhYm91dCB0aGUgdXBkYXRlIGZsb3cgYW5kIG5vdGlmeWluZyBjdXN0b21lcnMgdGhhdCB0
aGUgCmVudmlyb25tZW50IHRoZXkgYXJlIHJ1bm5pbmcgaW4gaXMgcG90ZW50aWFsbHkgaW5zZWN1
cmUsIEludGVsIHNob3VsZCAKcHJvdmlkZSBhbiBhdHRlc3RhdGlvbiBtZWNoYW5pc20gdG8gbm90
aWZ5IHRoZW0gYXMgZWFybHkgYXMgcmVhc29uYWJsZTsgCnByb2JhYmx5IGFyb3VuZCAzKS4gVGhh
dCB3YXksIGN1c3RvbWVycyBnZXQgdGhlIGNoYW5jZSB0byBsZWFybiBmaXJzdCAKaGFuZCB0aGF0
IHRoZXkgc2hvdWxkIGJlIHJ1bm5pbmcgb24gYSBuZXdlciByZXZpc2lvbiBvZiBURFggTW9kdWxl
IGNvZGUgCmFuZCBzaG91bGQgbm8gbG9uZ2VyIHRydXN0IHRoZSBvbmUgd2l0aCBrbm93biB2dWxu
ZXJhYmlsaXRpZXMuCgpUaGUgaW4tVk0gbG9naWMgc3VnZ2VzdGVkIGluIHRoaXMgcGF0Y2ggc3Vj
aCBhcyAiSSdsbCBkaWUgaWYgeW91IHBhdGNoIApteSBob3N0IiBvciAiSSB0ZWxsIG15IG93bmVy
IHRoYXQgeW91IHBhdGNoZWQgbWUsIGJ1dCBteSBvd25lciB3b24ndCBiZSAKYWJsZSB0byB0ZWxs
IGFueXRoaW5nIGZyb20gdGhhdCBpbmZvIiBpcyBub3QgZ29pbmcgdG8gaGVscCBhbnlvbmUgZm9y
IApURFggTW9kdWxlIHNlY3VyaXR5IHBhdGNoaW5nIHNpdHVhdGlvbnMuCgpJbnN0ZWFkLCBsZXQn
cyBzdGFydCB0aGUgY29udmVyc2F0aW9uIGZyb20gaG93IEludGVsIGNhbiBwcm92aWRlIGEgCm1l
Y2hhbmlzbSB0byBjdXN0b21lcnMgdG8gZXZhbHVhdGUgd2hldGhlciB0aGVpciBzeXN0ZW0gaXMg
ZnVsbHkgCnBhdGNoZWQsIHdvcmsgdG93YXJkcyBjbG9zaW5nIHRoZSBnYXAgYmV0d2VlbiAxKSBh
bmQgMykgYW5kIHRoZW4gYnVpbGQgCndoYXRldmVyIGludGVyZmFjZXMgaW4gTGludXggd2UgbmVl
ZCB0byBlbmFibGUgY3VzdG9tZXJzIHRvIG1ha2UgdXNlIG9mIAp0aGUgZXZhbHVhdGlvbiBtZWNo
YW5pc20uCgoKVGhhbmtzLAoKQWxleAoKCgoKQW1hem9uIFdlYiBTZXJ2aWNlcyBEZXZlbG9wbWVu
dCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFl
ZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAyNTc3NjQgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAzNjUgNTM4IDU5Nwo=

