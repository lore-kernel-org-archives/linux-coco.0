Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F474051
	for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 12:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.48.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021377; cv=none; b=kEZ0Ex2KGJO3VhJh25qjM373/pEU8tTykQcPhQjJ8ztwNPoEd11N64gCF2K4LH6p8DZfX5raYx8CEqqUh6Lo2Ph+cyb8Kaue+Zdic0YyNd8QVKzecPTrAW1fCLBSyEv2wiLaAHXx77aij7kKEtATiE2OCZVDmytcwyqw5a7uEeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021377; c=relaxed/simple;
	bh=4i9KagyjC98TKztyLA7x7/ffAiAcKbjdkn9nwUz3/qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RACvpqenAocAkT1BNK8kCAjKTtYIr6YM/SuNeW5kDR5W6LylyUmOwTx0/yBFGtCprhqjO+5UB9BhVnVvPS+fzQ87ZVB9Uhm2Z7ZVDUd5a+fYc+Jz7My8o07VM6mfTtzoZJhc8sDNHGqPU5ILAMyew5sM5pz/GFGLa3Dfz86iaO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=kRatbaCr; arc=none smtp.client-ip=52.95.48.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="kRatbaCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1718021376; x=1749557376;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=4i9KagyjC98TKztyLA7x7/ffAiAcKbjdkn9nwUz3/qg=;
  b=kRatbaCrM6LWBcoZ8jGxEvCPQkjUmJJ7avyEzhkHMhlcfBraYN611NmP
   DrHb5s0THSbHvTg994EWdpLPr6MdJNfnXmVVgua//auOdUBaBOXbRC7am
   AHGwDQlCZg5uwMgB7IB3RCKwP5LAJgHf2tMSuuVpDrcnJ3d+U0s5KF2/2
   g=;
X-IronPort-AV: E=Sophos;i="6.08,227,1712620800"; 
   d="scan'208";a="402291761"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 12:09:33 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:47901]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.133:2525] with esmtp (Farcaster)
 id 090d3776-f94e-4e98-862c-2ea0e11f3c35; Mon, 10 Jun 2024 12:09:32 +0000 (UTC)
X-Farcaster-Flow-ID: 090d3776-f94e-4e98-862c-2ea0e11f3c35
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Jun 2024 12:09:31 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 10 Jun
 2024 12:09:29 +0000
Message-ID: <e1a22a93-bf58-4aa7-a94e-9d2907f2ef02@amazon.com>
Date: Mon, 10 Jun 2024 14:09:27 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Confidential Computing call May 10: RTMR ABI & TEE I/O
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Reshetova,
 Elena" <elena.reshetova@intel.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Kalra, Ashish" <ashish.kalra@amd.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
 <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
 <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com>
 <88ca715e6234bd7d09cee1b0cb7682cc3e15ed3a.camel@HansenPartnership.com>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <88ca715e6234bd7d09cee1b0cb7682cc3e15ed3a.camel@HansenPartnership.com>
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGV5IEphbWVzLAoKT24gMDguMDYuMjQgMTY6NDEsIEphbWVzIEJvdHRvbWxleSB3cm90ZToKPgo+
IE9uIEZyaSwgMjAyNC0wNi0wNyBhdCAxODowNSArMDIwMCwgQWxleGFuZGVyIEdyYWYgd3JvdGU6
Cj4+IE9uIDA3LjA2LjI0IDE2OjQ2LCBSZXNoZXRvdmEsIEVsZW5hIHdyb3RlOgo+Pj4+IEhpIERh
biwKPj4+Pgo+Pj4+IE9uIDAzLjA1LjI0IDIxOjU1LCBEYW4gTWlkZGxldG9uIHdyb3RlOgo+Pj4+
PiBIaQo+Pj4+PiBOZXh0IEZyaWRheSwgTWF5IDEwdGggYXQgOWFtIFBEVCwgd2UgaGF2ZSBhIENv
bmZpZGVudGlhbAo+Pj4+PiBDb21wdXRpbmcgZGV2c2VjIC8gQm9GIC8gRGlzY3Vzc2lvbiBHcm91
cCAvIFNJRyBjYWxsLiBFdmVyeW9uZQo+Pj4+PiBpcyB3ZWxjb21lLgo+Pj4+Pgo+Pj4+PiBUZW50
YXRpdmUgYWdlbmRhIGluY2x1ZGVzIFJUTVIgQUJJIHYzIGRpcmVjdGlvbiBhbmQgVEVFIEkvTwo+
Pj4+PiBuZXh0IHN0ZXBzLgo+Pj4+IEkgaGF2ZW4ndCBzZWVuIGFuIGVtYWlsIGZvciB0b2RheSdz
IGNhbGwsIHNvIGxldCBtZSB0aHJvdyBteQo+Pj4+IHRvcGljIHN1Z2dlc3Rpb24gaGVyZToKPj4+
Pgo+Pj4+IEkgd291bGQgbGlrZSB0byB0YWxrIGFib3V0ICJjb25maWRlbnRpYWwga2V4ZWMiIHRv
ZGF5OiBBIGtleGVjCj4+Pj4gbWVjaGFuaXNtIHRoYXQgYWxsb3dzIHlvdSB0byBkZXN0cm95IHRo
ZSBjb25maWRlbnRpYWwgVk0geW91J3JlCj4+Pj4gaW4gYW5kIHJlY3JlYXRlIGEgbmV3IG9uZSBi
YXNlZCBvbiBhIHBheWxvYWQgb2YgdGhlIG9sZCBvbmUuIFdpdGgKPj4+PiB0aGF0LCB3ZSB3b3Vs
ZCBoYXZlIGEgdmVyeSBlYXN5IGFuZCBjbGVhbiBtZWNoYW5pc20gdG8gYm9vdHN0cmFwCj4+Pj4g
YSBWTSBpbnRvIGEgZnVsbHkgbWVhc3VyZWQgIG5ldyBleGVjdXRpb24gc3RhY2suCj4+PiBJbnRl
cmVzdGluZyB0b3BpYywgSSBhbSBjdXJpb3VzIG9mIHRoZSByZXF1aXJlbWVudHMhCj4+PiBTb3Vu
ZHMgbGlrZSB5b3Ugd2FudCBhIGxvY2FsIGZhc3QgbWlncmF0aW9uLCBpLmUuIGEgbWlncmF0aW9u
IHRvIGEKPj4+IG5ld0NvQ28gVk0gb24gdGhlIHNhbWUgcGxhdGZvcm0/IEkgZ3Vlc3MgdGhlIGRp
ZmZlcmVuY2Ugd291bGQgYmUKPj4+IHRoZSBhYnNlbmNlb2YgdGhlIG9ubGluZSBtaWdyYXRpb24g
cGhhc2Ugc2luY2UgeW91IGFyZSBwcm9iYWJseSBvawo+Pj4gc3RvcHBpbmcgdGhlIG9yaWdpbmFs
IENvQ28gVk0gZmlyc3QuCj4+Cj4+IEFsbW9zdC4gSSBiYXNpY2FsbHkgd2FudCB0aGUgVk0gdG8g
YmUgYWJsZSB0byBwcm92aWRlIGEgbmV3IGVhcmx5Cj4+IG1lYXN1cmVtZW50LiBTbyB0aGUgb3Bw
b3NpdGUgb2YgbWlncmF0aW9uOiBXaXRoIG1pZ3JhdGlvbiwgSSB3YW50IHRvCj4+IHByZXNlcnZl
IHByZXZpb3VzIHN0YXRlLiBIZXJlLCB0aGUgbWFpbiBtb3RpdmF0aW9uIGlzIHRvIGdldCByaWQg
b2YKPj4gYW55IHByZXZpb3VzIHN0YXRlIGV4Y2VwdCB0aGUgbmV3ICJzZWVkIiBmb3IgdGhlIHRh
cmdldCBWTS4KPj4KPj4gVGhlcmUgYXJlIDIgbWFpbiB1c2UgY2FzZXMgZm9yIHRoaXM6Cj4+Cj4+
IDEpIE1lYXN1cmVtZW50IHB1cmVseSBiYXNlZCBvbiBpbml0aWFsIGxhdW5jaCBtZWFzdXJlbWVu
dHMuIElmIHRoZQo+PiBmdWxsIE9TIGlzIGluc2lkZSBhbiBpbml0cmFtZnMsIHdlIGNhbiBwcm92
aWRlCj4+IGZpcm13YXJlK2tlcm5lbCtpbml0cmFtZnMgYXMgInNlZWQiLiBUaGUgQ29DbyBlbnYg
d291bGQgbWVhc3VyZQo+PiBldmVyeXRoaW5nIGFuZCBJIGhhdmUgYW4gZWFzeSBwYXRoIHRvIHZh
bGlkYXRlIGF1dGhlbnRpY2l0eSBvZiBteQo+PiB0YXJnZXQgZW52aXJvbm1lbnQuIEkgYWxzbyBo
YXZlIGFuIGVhc3kgcGF0aCAgdG8gdXBkYXRlIHRoZSBWTSBhbmQKPj4gdGhlbiBtZWFzdXJlIHdp
dGhvdXQgcmVwbGF5aW5nIGFueSBldmVudCBsb2dzLgo+IFdpdGggYW4gU1ZTTSAodGhhdCB5b3Un
cmUgbm90IHJlcGxhY2luZywgc28gdGhlIGluaXRpYWwgbGF1bmNoCgoKVGhhdCBhc3N1bWVzIHlv
dSB3YW50IGFuIFNWU00gaW4gdGhlIGZpcnN0IHBsYWNlLiBJCgogwqAgYSkgRG9uJ3QgdGhpbmsg
eW91IHJlYWxseSBuZWVkIHRvIGFuZAogwqAgYikgQmVsaWV2ZSBpdCBzaG91bGQgY29tZSBmcm9t
IHRoZSBjdXN0b21lciwgbm90IHRoZSBjbG91ZCBwcm92aWRlciwgCmFzIGl0J3MgdGhlIGhpZ2hl
c3QgcHJpdmlsZWdlZCBwaWVjZSBvZiBjb2RlIGluIHlvdXIgVk0KCgpGb3IgYm90aCwgdGhlIGVh
c3kgc29sdXRpb24gaXMgdG8gYWxsb3cgYSBjdXN0b21lciB0byByZWJvb3QgaW50byB0aGVpciAK
b3duICJpbml0aWFsIGxhdW5jaCBtZWFzdXJlbWVudCIgZnJvbSBhIGN1cnJlbnRseSBydW5uaW5n
IFZNLgoKPiBtZWFzdXJlbWVudCByZW1haW5zIHZhbGlkKSB0aGlzIG9uZSBpcyBlYXN5OiBpdCBj
YW4gcmVpbml0IGV2ZXJ5dGhpbmcKPiAoaW5jbHVkaW5nIHRoZSB2VFBNKSBhbmQgcmVkbyBhIG1l
YXN1cmVkIGJvb3QuICBTbyBoZXJlIHlvdSBoYXZlCj4gZXhhY3RseSB0aGUgc2FtZSBtZWFzdXJl
bWVudHMgYXMgdGhvdWdoIGl0IHdlcmUgYSBjbGVhbiBib290Lgo+Cj4+IDIpIFVwZGF0ZSBTVlNN
IChvciBzaW1pbGFyKS4gT2Z0ZW4gdG9kYXksIHlvdSB3YW50IHRvIGltcGxlbWVudCBUUE1zCj4+
IGFuZCBpbnNpZGUgYSBoaWdoZXIgcHJpdmlsZWdlZCBjb21wb25lbnQgdGhhdCBpcyByZWFsbHkg
cGFydCBvZiB0aGUKPj4gVk0uIFRvIHVwZGF0ZSBpdCwgeW91IGNvdWxkIHVzZSBpbi1WTSBtZWNo
YW5pc21zLCBidXQgdGhhdCBsZWF2ZXMgYQo+PiBwYXRoIHdoZXJlIHlvdSBib290IHdpdGggYW4g
b2xkIHZlcnNpb24gLT4gZXhwbG9pdCAtPiB1cGRhdGUgdG8gdGhlCj4+IG5ldy4gSWYgd2UgY291
bGQgInJlYm9vdCIva2V4ZWMgaW50byBhIG5ldyBTVlNNLCB3ZSBjb3VsZCByZWFzb24KPj4gYWJv
dXQgaXRzIGNvbmZpZGVudGlhbGl0eSB3aXRoIGEgMTAwJSBndWFyYW50ZWUuCj4gVGhpcyBvbmUn
cyBhIGJpdCBtb3JlIGRpZmZpY3VsdCBiZWNhdXNlIHRoZSBpbml0aWFsIGxhdW5jaCBtZWFzdXJl
bWVudAo+IGJlY29tZXMgaW52YWxpZCBpZiB0aGUgU1ZTTSBpcyByZXBsYWNlZC4gIFdoYXQgSSdk
IHN1Z2dlc3QgaGFwcGVucyBoZXJlCj4gaXMgdGhhdCB0aGUgU1ZTTSByZWluaXQgZXZlcnl0aGlu
ZyAoaW5jbHVkaW5nIHRoZSB2VFBNKSwgdGhlbiBtZWFzdXJlIGEKPiAicmVwbGFjZSBTVlNNIiBy
ZWNvcmQgY29udGFpbmluZyBib3RoIHRoZSBvbGQgYW5kIG5ldyBTVlNNIG1lYXN1cmVtZW50cwo+
IGFuZCB0aGVuIGRvIGEgbWVhc3VyZWQgYm9vdC4gIFRoYXQgd2F5IGFuIGF0dGVzdGluZyBzeXN0
ZW0gY2FuIHRpZSB0aGUKPiBvbGQgbGF1bmNoIG1lYXN1cmVtZW50IHRvIHRoZSB1cGRhdGVkIFNW
U00uCgoKVGhpcyBvbmx5IHdvcmtzIGlmIHRoZSBTVlNNIGRvZXNuJ3QgaGF2ZSBhbnkgc2VjdXJp
dHkgdnVsbmVyYWJpbGl0aWVzLiAKSWYgaXQgZG9lcywgeW91IGNhbid0IHRydXN0IHRoZSBtZWFz
dXJlbWVudCBhbnltb3JlIGFuZCB5b3VyIHdob2xlIAp1cGRhdGUgcGF0aCBpcyBvdXQgb2YgdGhl
IHdpbmRvdy4gRm9yIENvQ28sIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgCnRoZXJlIGlzIGEg
dmlhYmxlIHdheSBmb3IgdXNlcnMgdG8gcnVuIHNlY3VyZSB2ZXJzaW9ucyBvZiBhbGwgY29kZSAK
d2l0aG91dCBkZXBlbmRpbmcgb24gdGhlIG1lcml0IG9mIHRoZWlyIGluZnJhc3RydWN0dXJlIHBy
b3ZpZGVyLCBubz8KCgpBbGV4CgoKCgpBbWF6b24gV2ViIFNlcnZpY2VzIERldmVsb3BtZW50IENl
bnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNm
dWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4g
YW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDI1Nzc2NCBCClNpdHo6IEJl
cmxpbgpVc3QtSUQ6IERFIDM2NSA1MzggNTk3Cg==

