Received: from smtp-fw-9105.amazon.com (smtp-fw-9105.amazon.com [207.171.188.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B312620C00E
	for <linux-coco@lists.linux.dev>; Mon, 19 May 2025 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653956; cv=none; b=o0IAc5rZ/s1/eRBpmETkj3X2KxBJfzdWy/pKUe+llk/LmgrWgONTLkpQEQnWGoBpNm7i33ZGBDAh41hqqWrKfS7pRyhcqD0FG1JqWoChX0fdhLyAWFmIOgs47GnvFVNG6YMs990km1UyvWchDInNH9UVjqIw8xi621EOr4+3VCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653956; c=relaxed/simple;
	bh=TXhlqTxDjPQU0/WS5vOXRw68WEo6IQcEKqGOA0J0n4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D1vSLhYhPRpa2UkKVTE4XHRwJzzkHIrEofGZBwRBxERo9jCEbQKiT+kFtch5NUecwEY09sMoFazt/Qs2GlDt4K61JniNga9WSd9irAhDZNVwIHgK3ZaNu8hjYRTgIbiyTuwgWf/lFstkZ2kMIPz7QJ9yhOhgHZS9sDmEiafxzhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=PDdo35jF; arc=none smtp.client-ip=207.171.188.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="PDdo35jF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1747653955; x=1779189955;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TXhlqTxDjPQU0/WS5vOXRw68WEo6IQcEKqGOA0J0n4w=;
  b=PDdo35jFD3Felc6g+LB3ABN95SkNwfrIgRDEjqUSa14wFfHsNXaeT6XU
   uz7jH9ECAILpEvZRFMjJaQDPdU83LE6PvoOxLXhIMZ1gBRU8kENND3KsR
   suFl2d59YhV2x6Pr04lBuyM1SKjA+4/AUjjCuaBF2720ubAE+tURVjscZ
   Ss1kymMWKL8T2EPQHuRVOnq8ciQzImxiYHKPZn4j68Pc82cAHd5WZV2nz
   dhQQ6fftAb9jcgItJjvEGl6mlAUQ60fb+J+JbF4LCleVip3QdojyMmwQh
   fAtDcI+6Sw6OQfE/3mJIPnN8VIYN9m5YcLQtRQXw545CuXRMvNWx0W+bc
   w==;
X-IronPort-AV: E=Sophos;i="6.15,300,1739836800"; 
   d="scan'208";a="21275029"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9105.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 11:25:47 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:62137]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.53:2525] with esmtp (Farcaster)
 id 98d062e0-381c-40d3-9ee5-7e11a7b98b3f; Mon, 19 May 2025 11:25:46 +0000 (UTC)
X-Farcaster-Flow-ID: 98d062e0-381c-40d3-9ee5-7e11a7b98b3f
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 19 May 2025 11:25:46 +0000
Received: from [0.0.0.0] (172.19.99.218) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Mon, 19 May 2025
 11:25:43 +0000
Message-ID: <95a3e3ca-4fba-411c-b979-4dc8ecc1f902@amazon.com>
Date: Mon, 19 May 2025 13:25:41 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
To: Ani Sinha <anisinha@redhat.com>
CC: Dan Middleton <dan.middleton@linux.intel.com>, Dionna Amalie Glaze
	<dionnaglaze@google.com>, Steve Rutherford <srutherford@google.com>,
	<linux-coco@lists.linux.dev>, Vitaly Kuznetsov <vkuznets@redhat.com>, "Joerg
 Roedel" <jroedel@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, Jon Lange
	<jlange@microsoft.com>, "cho@microsoft.com" <cho@microsoft.com>, "James
 Bottomley" <James.Bottomley@hansenpartnership.com>
References: <CAAH4kHZ2yO3ju_iJinR9y4BDXXdWBnEP1wcv09JWMzaqp1ZP+g@mail.gmail.com>
 <CAK3XEhOs4ijnbqmv8UrNmKN4=nv6+_A7fESLibGBRR9u8rXi6w@mail.gmail.com>
 <87frifm75c.fsf@redhat.com>
 <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com>
 <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
 <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com>
 <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
X-ClientProxiedBy: EX19D036UWB003.ant.amazon.com (10.13.139.172) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDE5LjA1LjI1IDEwOjM3LCBBbmkgU2luaGEgd3JvdGU6Cj4+IE9uIDE2IE1heSAyMDI1LCBh
dCAyOjU14oCvUE0sIEFsZXhhbmRlciBHcmFmIDxncmFmQGFtYXpvbi5jb20+IHdyb3RlOgo+Pgo+
PiBIZXkgQW5pLAo+Pgo+PiBXZSBhbHJlYWR5IHByZXNlbnRlZCBjb25jZXB0cyBsYXN0IHllYXIu
IElmIHdlIHdhbnQgdG8gcHJlc2VydmUgY3JlZGliaWxpdHksIHRoaXMgeWVhciB3ZSBuZWVkIHRv
IHNob3cgYSBzb2x1dGlvbiB0aGF0J3MgZWl0aGVyIG1lcmdlZCBvciBhbG1vc3QgbWVyZ2VkIHVw
c3RyZWFtIGFuZCByZWFkeSB0byB1c2UuCj4gSG1tIG9rIEkgdGhpbmsgaXQgd2lsbCBiZSBoYXJk
IHRvIGdldCBhbnl0aGluZyBtZXJnZWQgYmVmb3JlIHRoZSBkZWFkbGluZSBvbiBKdW5lIDl0aC4K
CgpJdCBkb2Vzbid0IGhhdmUgdG8gYmUgbWVyZ2VkIG9uIHRoZSA5dGgsIGJ1dCBpdCBzaG91bGQg
aGF2ZSBhIHJlYWxpc3RpYyAKYXZlbnVlIHRvIGJlIG1lcmdlZCBieSBTZXB0ZW1iZXIgNHRoIDop
LgoKCkFsZXgKCgoKCkFtYXpvbiBXZWIgU2VydmljZXMgRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1h
bnkgR21iSApUYW1hcmEtRGFuei1TdHIuIDEzCjEwMjQzIEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1
bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFt
dHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAyNTc3NjQgQgpTaXR6OiBCZXJsaW4K
VXN0LUlEOiBERSAzNjUgNTM4IDU5Nwo=

