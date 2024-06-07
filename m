Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916619149E
	for <linux-coco@lists.linux.dev>; Fri,  7 Jun 2024 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717776333; cv=none; b=NXB9CccpP2rlbvE761Dt0vD45QdBGar9riTwSbLXdMqC5EbKnWLZcOn2CCFz4TW8qqVMfMJpwjoy91EIVB00ro4TXH4r5vCARSfuaK9e3U0vyF7i92/X487wxywA7PJXMNf21JgU2PqPkyCZtwfdof8BZUDJkKoCfJORUROTiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717776333; c=relaxed/simple;
	bh=C9OeTpXNsHdQB14LLUyUy+eNOSep1ztWqo9QF7X7cu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SG1upwYR7SEL3CAoDleNPYZ4MNoJ3P5TUlG4qonpsptfzHzh3CGUkqC5yQ2RR/8xrc+aOa132Ysnb5IrIiDj+RRf8oS/9CK5HmX9SbUlQ/n83GAxtURasx5eEmlAyid4SzMk4Bme8LSI7Sk6L9NKA7+MtSpWPIR5B4XmCjsk04s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=kZYqqXj6; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="kZYqqXj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1717776332; x=1749312332;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=C9OeTpXNsHdQB14LLUyUy+eNOSep1ztWqo9QF7X7cu8=;
  b=kZYqqXj6yfC2fddYBfPsUFLeBUJpt68d6AwAFIBrXEzftmgP8WEaPxTs
   v651ueUQzPeSz9FKaAa6C6wCgDFCOz6MPuth2IqfvApvXJoOcbfh0F3lr
   9KZbmqQHRbEPSuK4uhuDdQysTzmZ+Ei1ab6fXaH8BMx6DaIZLBgYkgfU6
   0=;
X-IronPort-AV: E=Sophos;i="6.08,221,1712620800"; 
   d="scan'208";a="731418211"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 16:05:26 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:39383]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.111:2525] with esmtp (Farcaster)
 id 275c2c30-539f-4f4b-80b3-e7e5b5ff8411; Fri, 7 Jun 2024 16:05:25 +0000 (UTC)
X-Farcaster-Flow-ID: 275c2c30-539f-4f4b-80b3-e7e5b5ff8411
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 7 Jun 2024 16:05:25 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 7 Jun
 2024 16:05:23 +0000
Message-ID: <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com>
Date: Fri, 7 Jun 2024 18:05:21 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Confidential Computing call May 10: RTMR ABI & TEE I/O
To: "Reshetova, Elena" <elena.reshetova@intel.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Kalra, Ashish" <ashish.kalra@amd.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
 <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
 <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
X-ClientProxiedBy: EX19D037UWC001.ant.amazon.com (10.13.139.197) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDA3LjA2LjI0IDE2OjQ2LCBSZXNoZXRvdmEsIEVsZW5hIHdyb3RlOgo+PiBIaSBEYW4sCj4+
Cj4+IE9uIDAzLjA1LjI0IDIxOjU1LCBEYW4gTWlkZGxldG9uIHdyb3RlOgo+Pj4gSGkKPj4+IE5l
eHQgRnJpZGF5LCBNYXkgMTB0aCBhdCA5YW0gUERULCB3ZSBoYXZlIGEgQ29uZmlkZW50aWFsIENv
bXB1dGluZwo+Pj4gZGV2c2VjIC8gQm9GIC8gRGlzY3Vzc2lvbiBHcm91cCAvIFNJRyBjYWxsLiBF
dmVyeW9uZSBpcyB3ZWxjb21lLgo+Pj4KPj4+IFRlbnRhdGl2ZSBhZ2VuZGEgaW5jbHVkZXMgUlRN
UiBBQkkgdjMgZGlyZWN0aW9uIGFuZCBURUUgSS9PIG5leHQgc3RlcHMuCj4+Cj4+IEkgaGF2ZW4n
dCBzZWVuIGFuIGVtYWlsIGZvciB0b2RheSdzIGNhbGwsIHNvIGxldCBtZSB0aHJvdyBteSB0b3Bp
Ywo+PiBzdWdnZXN0aW9uIGhlcmU6Cj4+Cj4+IEkgd291bGQgbGlrZSB0byB0YWxrIGFib3V0ICJj
b25maWRlbnRpYWwga2V4ZWMiIHRvZGF5OiBBIGtleGVjIG1lY2hhbmlzbQo+PiB0aGF0IGFsbG93
cyB5b3UgdG8gZGVzdHJveSB0aGUgY29uZmlkZW50aWFsIFZNIHlvdSdyZSBpbiBhbmQgcmVjcmVh
dGUgYQo+PiBuZXcgb25lIGJhc2VkIG9uIGEgcGF5bG9hZCBvZiB0aGUgb2xkIG9uZS4gV2l0aCB0
aGF0LCB3ZSB3b3VsZCBoYXZlIGEKPj4gdmVyeSBlYXN5IGFuZCBjbGVhbiBtZWNoYW5pc20gdG8g
Ym9vdHN0cmFwIGEgVk0gaW50byBhIGZ1bGx5IG1lYXN1cmVkCj4+IG5ldyBleGVjdXRpb24gc3Rh
Y2suCj4gSW50ZXJlc3RpbmcgdG9waWMsIEkgYW0gY3VyaW91cyBvZiB0aGUgcmVxdWlyZW1lbnRz
IQo+IFNvdW5kcyBsaWtlIHlvdSB3YW50IGEgbG9jYWwgZmFzdCBtaWdyYXRpb24sIGkuZS4gYSBt
aWdyYXRpb24gdG8gYSBuZXcKPiBDb0NvIFZNIG9uIHRoZSBzYW1lIHBsYXRmb3JtPyBJIGd1ZXNz
IHRoZSBkaWZmZXJlbmNlIHdvdWxkIGJlIHRoZSBhYnNlbmNlCj4gb2YgdGhlIG9ubGluZSBtaWdy
YXRpb24gcGhhc2Ugc2luY2UgeW91IGFyZSBwcm9iYWJseSBvayBzdG9wcGluZyB0aGUKPiBvcmln
aW5hbCBDb0NvIFZNIGZpcnN0LgoKCkFsbW9zdC4gSSBiYXNpY2FsbHkgd2FudCB0aGUgVk0gdG8g
YmUgYWJsZSB0byBwcm92aWRlIGEgbmV3IGVhcmx5IAptZWFzdXJlbWVudC4gU28gdGhlIG9wcG9z
aXRlIG9mIG1pZ3JhdGlvbjogV2l0aCBtaWdyYXRpb24sIEkgd2FudCB0byAKcHJlc2VydmUgcHJl
dmlvdXMgc3RhdGUuIEhlcmUsIHRoZSBtYWluIG1vdGl2YXRpb24gaXMgdG8gZ2V0IHJpZCBvZiBh
bnkgCnByZXZpb3VzIHN0YXRlIGV4Y2VwdCB0aGUgbmV3ICJzZWVkIiBmb3IgdGhlIHRhcmdldCBW
TS4KClRoZXJlIGFyZSAyIG1haW4gdXNlIGNhc2VzIGZvciB0aGlzOgoKMSkgTWVhc3VyZW1lbnQg
cHVyZWx5IGJhc2VkIG9uIGluaXRpYWwgbGF1bmNoIG1lYXN1cmVtZW50cy4gSWYgdGhlIGZ1bGwg
Ck9TIGlzIGluc2lkZSBhbiBpbml0cmFtZnMsIHdlIGNhbiBwcm92aWRlIGZpcm13YXJlK2tlcm5l
bCtpbml0cmFtZnMgYXMgCiJzZWVkIi4gVGhlIENvQ28gZW52IHdvdWxkIG1lYXN1cmUgZXZlcnl0
aGluZyBhbmQgSSBoYXZlIGFuIGVhc3kgcGF0aCB0byAKdmFsaWRhdGUgYXV0aGVudGljaXR5IG9m
IG15IHRhcmdldCBlbnZpcm9ubWVudC4gSSBhbHNvIGhhdmUgYW4gZWFzeSBwYXRoIAp0byB1cGRh
dGUgdGhlIFZNIGFuZCB0aGVuIG1lYXN1cmUgd2l0aG91dCByZXBsYXlpbmcgYW55IGV2ZW50IGxv
Z3MuCgoyKSBVcGRhdGUgU1ZTTSAob3Igc2ltaWxhcikuIE9mdGVuIHRvZGF5LCB5b3Ugd2FudCB0
byBpbXBsZW1lbnQgVFBNcyBhbmQgCmluc2lkZSBhIGhpZ2hlciBwcml2aWxlZ2VkIGNvbXBvbmVu
dCB0aGF0IGlzIHJlYWxseSBwYXJ0IG9mIHRoZSBWTS4gVG8gCnVwZGF0ZSBpdCwgeW91IGNvdWxk
IHVzZSBpbi1WTSBtZWNoYW5pc21zLCBidXQgdGhhdCBsZWF2ZXMgYSBwYXRoIHdoZXJlIAp5b3Ug
Ym9vdCB3aXRoIGFuIG9sZCB2ZXJzaW9uIC0+IGV4cGxvaXQgLT4gdXBkYXRlIHRvIHRoZSBuZXcu
IElmIHdlIApjb3VsZCAicmVib290Ii9rZXhlYyBpbnRvIGEgbmV3IFNWU00sIHdlIGNvdWxkIHJl
YXNvbiBhYm91dCBpdHMgCmNvbmZpZGVudGlhbGl0eSB3aXRoIGEgMTAwJSBndWFyYW50ZWUuCgoK
QWxleAoKCgoKQW1hem9uIFdlYiBTZXJ2aWNlcyBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBH
bWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlz
dGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0
IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAyNTc3NjQgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBE
RSAzNjUgNTM4IDU5Nwo=

