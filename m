Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794656499;
	b=F52lce0IWRES1aDYxOjIbWFAjsXCQ5e4VeSe0Immfybl8pP9+IBPaBcmbvGu4UDhQrKF
	 NB7aQazMrqMFNC5z+U8eX4hG7Lrren+hZSW5yOHb+GsND+IL6lO1A+HN8PI3UCD417cYO
	 3Ifssp6vQ5F+JPciJwR3J14yNBdbf79OLCPDe2j/6woppVGIV+NYHcLDwdss1kpfp2Ajv
	 czmauThpagcWoOzOSzQtG4rs/HqfC+LN5AqkteIKJQ6CjQi8/c/cU0FqO1ZAzfo9HXlka
	 oVuabpQ540u4meLC2be4u+j+97bmTbvYdnM8Rld2kwxfxb6Dv5plTGmxzew61Uh+Zaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=a/fji4ANglWLhnM1b925r1xDhw6BBJRmXgZEro3KYGA=;
	b=3fmpmHUZ1bIFvHTJCefFkSvaOk4tFPOSSMDNESvKmrlyddEf/U4qFHWoSm+e2mMAf/kG
	 hnZMULTr/cj4z5sR/Zx97UdSBwYDrvjzkQrpOvrLYyXzLeg5RH7aobJ9lOtqW56IMJ6X6
	 llCXjlKkrpE6l4GoP5Ffsm5yWvNMkPDLmCn4WdaLN/4lX5vpSrsQ+2SLNDOjaZUnXszkp
	 CwlUZDGkQ2qamEhStX3SL/HAdky/ZB3AkaVK6SfZmJNRynAysuuurCNrhzQDkkRmP18O+
	 ySwX56gDpYxvFMUwWq5Qcx+TkJYzItw45kpPLlJZitSnK2Jx0X3lI9ZeWCeMqDvSsmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=KXbcpJeh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB2E606A330
	for <linux-coco@lists.linux.dev>; Sat, 14 Nov 2026 11:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB2E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=KXbcpJeh
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4911df1e196so1617717fac.1
        for <linux-coco@lists.linux.dev>; Sat, 14 Nov 2026 03:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794656497; cv=none;
        d=google.com; s=arc-20260327;
        b=eVCbqk7ZJlvYSBtXjcl1bmyeTqYzc4EMNzW0+n+d0mWVTGExgV8b8h3G7KAeRol+o2
         omwsm3WHmyNGeEjqTYYR8Sf/SdxzhVZk9EOunEXC2vlSa6xo5trFYYiOMnukiely1JEE
         Mq2jCZSqfZjNO8bW+tijVb5pSRr9r8RAPMg6zwaOcoSyHH7gvC0nb+kjMN7wQJ/OPLs7
         5r0L2yrBp/Wfzu2d4INhaUHl6Q+PU2aa6aUEC6+Rps5UUgO4AS26UjW2ZsyC+MQNL1CU
         MCcalTF/hKCqJawcLJxYRvo6TpFG/cSUKyv9BzsMuaT+7csfNQ60sCQxl2lf/7wxLLqy
         J84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a/fji4ANglWLhnM1b925r1xDhw6BBJRmXgZEro3KYGA=;
        fh=7ky/XPeVnzTfLle5CyuQRgAlXOKpw2qAPR3nTop0yIc=;
        b=IH/LZG1LmJlntbYjGE2MMD7WZ23/MfrSQD7KK+jQyV811tk6CB1i8jusyIDvViMv8g
         M3G9MPtm5qul0smC365Ij11CJWDSBnJOddY27zutyUGcFeF+PPiKYcf6kQlFs8hPb8aJ
         tfFBZwk+k9TegGimjTqOy/jV1gqyMlaNnpuzPBt8MNtAeyvhabTMjdHDHUC1jC1ER12g
         L7e4ZsMCxbmgCNwuTvr3v9QilpKG6HRG/RgzSQ0yVgf0PbcA9UtfdbNwrqcnQ3xQAWSb
         y44bnS1hJtCgRlta3eyLxUNBxnNAMAY1Sd/cME5mX1wUCnCMP1AZzpUjaT9++Ptx2RhC
         TWOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1794656497; x=1795261297; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/fji4ANglWLhnM1b925r1xDhw6BBJRmXgZEro3KYGA=;
        b=KXbcpJehYNNJMVEFAgQbl9DHELh+Fj3wo4aSxHfsZ2GjUTSz8XG3mPtIzRjl8ZK97M
         wLjKNtxBMxeDpw0V9JryYLyh8g/3F+7y9oReC6fFnbkDwykcSfVmKbQJasWWptUmFQ4n
         YQ7BO6Vdv0BaaU3EmlMdN6oK/XLOrRIrxnGcl7Ltueuyj9TA0U5GcqWPxbUkHrEe78m6
         LXDxtvlQ/cm+srr+rcgQM97wUoBtkbor0VFjr+rNg9tUGDFMJ9NpZfpqASzYI/ufMUWm
         bfVVc7or38ND4bNaStfAFFJkO4sd3M65+PMGgIUpxnFWvqkWX1mXqVneU7wgN+hiwP2L
         3X9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794656497; x=1795261297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a/fji4ANglWLhnM1b925r1xDhw6BBJRmXgZEro3KYGA=;
        b=UHW4SMZ+VzDtXmcm3awlyzoku6i8uBg59JBkWVVOmRFzsnRGVBTfj06mjBdMDgG9Wk
         sEtOCrhAlhuUpknadSrQRjsLuFJ07YNEo4xjarC5sSe4rbn1Mo75ZidN+t1lSfKpvvwJ
         YKTp1nnPGTGi9xtOY86OhIPHv+KBNiPRfaUlHALNHlYvriwiaMF6AyND474CnGErmcWI
         ZH9n8eosKpPlxKCgObXFjxH8AJBfMi7lVALUtqW4vFGd0m7yXBwCI1U5kIeCZWVD+jdl
         xlsFMJCGpADy6CDDIuZM8MD1Yfb+7IkM2aWdKA6TBQJTHjpEIf9S7YE3ZUcJHy1bETsI
         IhWA==
X-Forwarded-Encrypted: i=1; AL+hErEKOPlF0MTcq4zBHPWge92gKl2gSFUEC8yp9lis9SIOq7inwKz59a7SkmyMB6NNSdCoLndvxOXXhhQ/@lists.linux.dev
X-Gm-Message-State: APuU4Z+jPRbDxPHvxmH8gvJ6cRjfNEjaYCnPxEhY7zM2f/oNSp66L8Ri
	eMKvN/35tpmunsW7kMaWGZgjpn3qkFPrhQ8+TziLUtncJKDPZpe6tFzgzVJQvO6pEdp1q+l1o9p
	k7Sha86LJJS3QTS1tHJ/QsBvkafACeoHIvujliKkW7w==
X-Gm-Gg: AYBFou0sEq34dxno2Zgli90bUVS1IGUFte+dOLgTFdziZ/uud7EYZJam2D/oDtwZhdQ
	ilTbax1nhHrmgWgXsRy+wJrWwX4qyUsNAO4tFPFrtif8I7LAQLRWcrgnp29sqCxSiXbnOGBFDHO
	Ilv+pd3XmAq0Z0te0jqUq8CABJNUPKnwH68iVST34nwVR5zklYBvxv8WzoW8Vm/SBhTk7Qq8WSF
	uhF2gj/AHhSYRMaJ3dHJ6l4njm8PlttLivsINHtkVkOPKi522gJ9WL34sdsmQ+7cXmkoeCB7o/Z
	Kn/ajz6soxBQJYAtKuBHHggM+H6uFmoPq3ijEBrScvz1ZlB7gKoV7sHTIg5sa0hoejfc2DdnelK
	EgqGqMFIe62dyKIbfsQx8ADtIlHNV0RYu4xGKtlVKJk26klzh0cryzv0zhWcT+qayKUXMohk4Jo
	19vMHdBNlWYjPc9kVyhZjHeiQhiZyDi4f1zFsKbmXdsS0f/iPqVTix4epyWOZGKtO7EqTkNFc/
X-Received: by 2002:a05:6870:6c1c:b0:4ad:7ef2:6005 with SMTP id
 586e51a60fabf-4afdf445b53mr4823353fac.11.1794656497656; Sat, 14 Nov 2026
 03:41:37 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net>
 <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com>
 <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com> <0f9ba1a6acb57a8c126739175b4e38dafac08c9d.camel@intel.com>
In-Reply-To: <0f9ba1a6acb57a8c126739175b4e38dafac08c9d.camel@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Sat, 14 Nov 2026 11:41:26 +0000
X-Gm-Features: AclHuK8iaDFWSE6FVS5GEQtiGzXP5xPODgzuL6kYZ3-GR4mSvXxwjBpv9blLgS0
Message-ID: <CAKV3HMMfx4APmardWdtL8yhirXMuuBQMZ8xrtowHNRnTKXNRiw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"Miao, Jun" <jun.miao@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "djbw@kernel.org" <djbw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2026-11-13 at 17:33 +0000, Edgecombe, Rick P wrote:
> We do expect quote execution time to change, so this may not be optimal long
> term. The exponential backoff could limit it to 2x the real quote time. For a
> long quote this could be pretty long.

The backoff is capped at 100 ms. The 2x bound only applies while the
sleep is still doubling, which is roughly the first 130 ms. Any Quote
that takes longer is seen at most 100 ms after it completes, whatever
its duration. A 10 s Quote returns by 10.1 s. The current code adds up
to 1 s.

> I'd almost wonder if the guest would normally be happy to spend more cycles on
> getting a faster quote.

I think so too. The cap is a single constant. I can lower it (10 ms
would mean 100 wakeups per second, and only while a Quote is in flight)
or replace the backoff with a short fixed interval. Tell me which you
prefer and I will do that in v4.

> Can you explain more about the quote use case you are targeting?

Attested TLS. Right after each TLS handshake the server in the TD sends
a fresh Quote. Its REPORTDATA is the hash of the TLS public key plus
keying material exported from that session (RFC 5705). That binds the
Quote to the session, so it cannot be cached or reused, and every new
connection costs one GetQuote. Requests are serialized by quote_lock, so
today a TD accepts about one connection per second, and ten clients
connecting at once wait up to ten seconds. With a local QGS the Quote
itself takes a few milliseconds. With patch 2 the same ten connections
take about 0.1 s.

Session binding is also the fix for the recent relay attacks on attested
TLS, so one Quote per connection is becoming the norm.

For the long term I have event notify working on top of this series. The
driver uses the interrupt when GetTdVmCallInfo reports it and keeps the
polling as the fallback. Over 120 back-to-back Quotes at HZ=250 it gives
2 ms median, against 8 ms with polling alone. I can post it as a
follow-up once we agree on the polling side.
