Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com [207.171.190.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ACB1DFC5
	for <linux-coco@lists.linux.dev>; Fri,  7 Jun 2024 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.190.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717770297; cv=none; b=s9E4EOO1tF8L+RADhJJntpAoOotAcVZ9Bx9Kl134KZfZ5fXsAT+KLzggZSbeHeQ0wFN8sfZG5ADr6llPIwkhI6hYS6fViBEDWoAlgObLpfGFkYR9qk2EC8fQWnFFDaH/9RX8S2s/a98jc6ACOiL+QIQtQpmKmRmraiPN+LbGMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717770297; c=relaxed/simple;
	bh=IUPwPMIJbZiG2Sl2pBP2cbykst4lAZExd5Bb9wWSXwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eBOFUHva03yXdVTNq0Yj+iNgd0uGrMm6Q/y9Db79Dh/AyDzBXrcYMBOc3zufXD9QOdZgl7cXsZdjunkbFoRd45nDcWgA9Kfs8fJ5Bw48ZvWFqHsdwC3sHhd0irvzFN5fBxxOqLmSjqqdcpea90AjL31fW0Q6W31dosvUtPNTHMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=lqB4ia80; arc=none smtp.client-ip=207.171.190.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="lqB4ia80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1717770297; x=1749306297;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=IUPwPMIJbZiG2Sl2pBP2cbykst4lAZExd5Bb9wWSXwo=;
  b=lqB4ia80Ss3/rCqn6rKDA4csb5s2L3UCNxFINTYPJZPn0/I7/EClrCDK
   ez2HLl3n+qBmuSGsqO7Cs8F3ezie70K+kba12k6794Ded1G7xYqL4WHda
   YaD1ayPSNTCWhmY++B9yMP+HA4/Nhq8InCl5Pw6xO1B+EsOGw3nr5RUOC
   s=;
X-IronPort-AV: E=Sophos;i="6.08,221,1712620800"; 
   d="scan'208";a="349122288"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 14:24:51 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:26982]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.12:2525] with esmtp (Farcaster)
 id e691e329-edf3-4bac-b9b6-d1a9c6f4bad4; Fri, 7 Jun 2024 14:24:48 +0000 (UTC)
X-Farcaster-Flow-ID: e691e329-edf3-4bac-b9b6-d1a9c6f4bad4
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 7 Jun 2024 14:24:40 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 7 Jun
 2024 14:24:39 +0000
Message-ID: <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
Date: Fri, 7 Jun 2024 16:24:37 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Confidential Computing call May 10: RTMR ABI & TEE I/O
To: Dan Middleton <dan.middleton@linux.intel.com>,
	<linux-coco@lists.linux.dev>, "Kalra, Ashish" <ashish.kalra@amd.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
X-ClientProxiedBy: EX19D044UWB002.ant.amazon.com (10.13.139.188) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGkgRGFuLAoKT24gMDMuMDUuMjQgMjE6NTUsIERhbiBNaWRkbGV0b24gd3JvdGU6Cj4KPiBIaQo+
IE5leHQgRnJpZGF5LCBNYXkgMTB0aCBhdCA5YW0gUERULCB3ZSBoYXZlIGEgQ29uZmlkZW50aWFs
IENvbXB1dGluZwo+IGRldnNlYyAvIEJvRiAvIERpc2N1c3Npb24gR3JvdXAgLyBTSUcgY2FsbC4g
RXZlcnlvbmUgaXMgd2VsY29tZS4KPgo+IFRlbnRhdGl2ZSBhZ2VuZGEgaW5jbHVkZXMgUlRNUiBB
QkkgdjMgZGlyZWN0aW9uIGFuZCBURUUgSS9PIG5leHQgc3RlcHMuCgoKSSBoYXZlbid0IHNlZW4g
YW4gZW1haWwgZm9yIHRvZGF5J3MgY2FsbCwgc28gbGV0IG1lIHRocm93IG15IHRvcGljIApzdWdn
ZXN0aW9uIGhlcmU6CgpJIHdvdWxkIGxpa2UgdG8gdGFsayBhYm91dCAiY29uZmlkZW50aWFsIGtl
eGVjIiB0b2RheTogQSBrZXhlYyBtZWNoYW5pc20gCnRoYXQgYWxsb3dzIHlvdSB0byBkZXN0cm95
IHRoZSBjb25maWRlbnRpYWwgVk0geW91J3JlIGluIGFuZCByZWNyZWF0ZSBhIApuZXcgb25lIGJh
c2VkIG9uIGEgcGF5bG9hZCBvZiB0aGUgb2xkIG9uZS4gV2l0aCB0aGF0LCB3ZSB3b3VsZCBoYXZl
IGEgCnZlcnkgZWFzeSBhbmQgY2xlYW4gbWVjaGFuaXNtIHRvIGJvb3RzdHJhcCBhIFZNIGludG8g
YSBmdWxseSBtZWFzdXJlZCAKbmV3IGV4ZWN1dGlvbiBzdGFjay4KCgpUaGFua3MsCgpBbGV4CgoK
CgoKQW1hem9uIFdlYiBTZXJ2aWNlcyBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkty
YXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBT
Y2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJs
b3R0ZW5idXJnIHVudGVyIEhSQiAyNTc3NjQgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAzNjUg
NTM4IDU5Nwo=

