Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013741;
	b=zt9nzSv43AFwjwPLnl/C6dpeqrJYZtQnEP6ivZjykuYQJiTNQesPyd6Xrv6ByAvIeO9P
	 aEHbHOZUITSm68RpxTE94MBWUgPvh0WQDZeax0cH0ByJp+p1KCw1VbL/MLT8ISbZjTITS
	 XcssrXChYMg9jprKA0px9izU3XrKFWn8HnlmMe+RjwJ3AIczOACqXHvx6L2EyApc7X1Ji
	 vpMbdmtzW0ZoHppVz1TCEFPZ3mRnUzue8kq5Drg12RvAWFaktUpk4t7sMv1q45AYl2Ptp
	 reGmymDM9f6pxsehFUAqAU8SMuLnIv3ajFY914LofP4Dr2v/7RGHNQWsEY7eLQCmaGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=A1AMia2vi1QSpUOJn8VNp1VkrqQ7LwCEUZO4G/j54mE=;
	b=SEV3x4sY7ABotXuPSU1JCWSrUHVJv275f16/FviIwwFQZb7IShI7tVfwisr0pPcpxbcu
	 4D9CwulmoMbl/0EdBrYOxiR4cJFCJ1GWMfFymJa4j+6H1ynIqogu/TFJWWbmBGFR1BocK
	 YpbmBFYTlaNNyIv7r73k8CUMCtnUkoFhcgZKL4LcXsOyv2dKo3cJ2rHh59qu1jvAal70f
	 SVtFfOzsenYsgglu6p2qhZXtOPRxLYsfLWCAX4v1B5VXCR1koeFlcs++t31ZVbOq5O0bV
	 vWOzTG/HXDYxnmohgeOGISReVkqkAlCJrwbeUaDImAlTT8XH7DahpPDYRjPtutEbVsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b="L5/y9n7I";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27734606A335
	for <linux-coco@lists.linux.dev>; Wed, 18 Nov 2026 14:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27734606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=L5/y9n7I
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8470d7d430fso564232a34.3
        for <linux-coco@lists.linux.dev>; Wed, 18 Nov 2026 06:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795013740; cv=none;
        d=google.com; s=arc-20260327;
        b=iXtGMlMLPcjLumK0whFEDdu3DVSms+ChisM8HuSFkoGC0tVNJks9vbmnx16qqoQyt2
         2Q36gH4Ya3mPGQLQG8AxZJBSUwq5H7V6ZieGfwxNksdsypAbSFOQ3+QsV8pTz0kmzJx1
         fMc9WdMira2jrTsri8ah7ZxS/jm9GNNuJmAvCzDTqoRAEppLWPYR7rYfiHs62ml9C6S3
         HclYsG11vwY+0jzc8m3IZVB9sGRlw2eYI/MzFnphY7lhuUb5yJPCkmT9mbRshQHoSI1R
         dKgPfZqWIJIyjxkGSO4cV/p5BIfF9T321wFPvN9Sr3zXoIpJizAAWMBwHvz9qA3ziVhM
         ZrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A1AMia2vi1QSpUOJn8VNp1VkrqQ7LwCEUZO4G/j54mE=;
        fh=yFpd4tLzeDKNqe5xvCGfFfpBG9biZxmAc41/imsruDQ=;
        b=j2LAdEJ7Q3VbQh0DHuC4YtHrgNbUIYgRkftrCPxlFfOhs/IhDF7AGtqbVMD5Lx5OWv
         uempK/vstVggVPF19uk3KM7J+3qg9eAWp0ou6SxcTzgtn98d3Mz9SyMGuM6zhEx3uocn
         7joCNZIADI+xgm7Ny1aiBzgcULTxlt0HDs7McX9C4hbdAfDRkiXLCKO5nnytyMZO1u2t
         GBWu93DToKuZJ4C5ANbycQAWuYtjoSo2K9pK4Z10/psuPkbTffcapUQoaUloaE8db4VY
         dHWKvBO37A3Wmp+z6EFLi16du22870AKf5xk1q0tU0BQFpvOMVOU8gFdR/zFjrdNyyns
         xkbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1795013740; x=1795618540; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1AMia2vi1QSpUOJn8VNp1VkrqQ7LwCEUZO4G/j54mE=;
        b=L5/y9n7ITAYsnVmQkg/zBJbX0gGzEVgTFqh2XGSjTbscXvEeLiKDhiy/JsFjlvj1Su
         WM1RyWPobdBDAELY5P+2pInsr6dg7q2Cj1JQSt1CstIbu9o6S3nIQ9k4utGZbsaZNbzm
         Jorz/dhj+mmOsEELSxNd56dYLTBAnwIEZqsUau1eXElRqXME2o8p7Ajdfm5A+EAKebqf
         ghpEgVyblQ8nUB9+GQxAWNxAwJRCNbzXJbWqSZwmnsvSBizmQgDhFB/BzVcReePhRWKS
         62FrhR1+kDvPgkLiGkNUKArlpoP4kNco7gCJWizHaIEuJ5Kg8LpJjaOj8J7I+rNdhp8A
         s0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013740; x=1795618540;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A1AMia2vi1QSpUOJn8VNp1VkrqQ7LwCEUZO4G/j54mE=;
        b=pVuHtrcpZYi95/ARMDISaYztIyKcxviP4acb2v12e4nNx6hSJXZzWYPRsU9qhYbrPb
         kXXEDxglp/NLFG2y4FDTyWa7nvlFHQqRh6jB1buPA3TM1TEFqttAQWA9bUezM3EPs3Wi
         5GOhW0N/43YqPT/MJfKyvxCpwAEkwVwSDPKhBixmfHMGmAWfQFpS5/s5cXPSdqVyTVw4
         wU3hbB2mfG6+o1kWtZR06x7nz8GDFye23T/XU0o8ysCcXEZz/iwgDIydvZJc4wbDDEcG
         /cSwoLyaU5q+YEFUshzMqXUYa/X9A4qkVIByQAcnG0RjWS0osJl7smICK5acDgkAndvC
         7n6A==
X-Forwarded-Encrypted: i=1; AL+hErEc/C6O2HXpQYxaoo5CIb0+d43ojMtjgdsvVlv6gNmncqpb2b8A5JDofGE/V4byt1NTmi8t/NQtPPdV@lists.linux.dev
X-Gm-Message-State: APuU4Z/gYDc2KmLoIyi4aqB26tnKD7ehCAbXNNPnmgx1wP1Tf2l/wVcT
	6fAQ/UY7WO+jfm7JpyyBqP4io5HNonrIimjixQk+fRjEZc8NK/CqYrxl5ANlxoBd+4fHOKYu9AP
	14okhLCn2bcfvk/ap06YL2GFHb03mAUb4MInk5bXYfg==
X-Gm-Gg: AYBFou3zLOMIgMtlabzYYuXXHxPOYXtkuRR9nJM5dyoiHlV3xNldBxjNJt1yzXcY89b
	AbnkF57LRyaEzk7/ZOv0ovrIHGkyLORg4vGGZTt6JQDbEcOfcwc4cdj1WO3Y40nO5T2MbXU6z56
	n9AymQqru/GRdp81RCYpJQxd45Y4woRcq4c57HY4Wyo3TA68m51Q1hskbodRhwpXPGNxML43lSL
	WCgvThQJn8pybtCsEFJ14UopHADcydVp11HZo6S7IbGbR/1BOOWW2BVC/VpsBGEab3kFy4TluQI
	ieeSAa0pOUvb+PPNSAJgydlbHrJaZQNsbUZaRjwV2gX5KFUhfRJPcMK9lmAfQh3D/Wp559na+uF
	Mw6xXCkMZPOHpdi5MApIOmo3uAYKdAoFzae4wxUbrCCcOZVEXnOUPMNN/WjhaCtM0V8e/9Wry30
	77bIuwfsNjtXbzTQ15pUVt3ux9Y5RaaNz6uKqYIX5HR32QLdrwn8POGMCncksDxoITMhhjkYSk
X-Received: by 2002:a05:6830:2b24:b0:844:4959:e856 with SMTP id
 46e09a7af769-862f08f6d8fmr2997887a34.11.1795013739853; Wed, 18 Nov 2026
 06:55:39 -0800 (PST)
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
 <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com>
 <0f9ba1a6acb57a8c126739175b4e38dafac08c9d.camel@intel.com>
 <CAKV3HMMfx4APmardWdtL8yhirXMuuBQMZ8xrtowHNRnTKXNRiw@mail.gmail.com> <86f99f3010775eeff6269fd9bb8f4edac10a7d85.camel@intel.com>
In-Reply-To: <86f99f3010775eeff6269fd9bb8f4edac10a7d85.camel@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Wed, 18 Nov 2026 14:55:28 +0000
X-Gm-Features: AclHuK-d2hbNILXughUCStMRcZnLFB956aXQFG2DezCp6dotXFDkjtwD-G3N_ds
Message-ID: <CAKV3HMMjyHig6LTiCsXKLvgvsW+0GVitCc0ziBD9RNxH2TAuvA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, "Miao, Jun" <jun.miao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "djbw@kernel.org" <djbw@kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2026-11-18 at 01:28 +0000, Edgecombe, Rick P wrote:
> I'd think a simpler shortening of the time would be better than something more
> advanced. But...

OK. In v4, patch 2 will replace the backoff with a fixed 10 ms sleep.
Patch 1 stays as it is. It fixes the timeout check and is marked for
stable, so it could also go in on its own.

> Shouldn't attested TLS just be used to set up some other key such that
> subsequent connections can be as fast as normal TLS? 0.1s is still kind of slow.

The 0.1 s was the total for ten clients connecting at once. Each Quote
took about 8 ms with v3 of patch 2 (median of 120 back-to-back Quotes at
HZ=250), and quote_lock runs them one after the other.

Our HTTP proxy already does part of this. A client keeps its attested
connection open and sends all its requests over it, so it needs one
Quote per connection, not per request. What is left is the first
connection of each client. Many clients can arrive at once, for example
after the TD restarts. Today the last of N clients waits about N
seconds.

We don't trust a key from an earlier attestation for new connections.
If a later connection relied only on such a key, a leaked key would be
enough to pass as the TD without any Quote. The recent relay attacks on
attested TLS used this kind of gap. In CVE-2026-108269 (CVSS 9.1) the
Quote was bound to the TLS key and a client nonce but not to the
session, so an attacker with the TLS private key could relay a genuine
Quote onto its own connection. Binding each Quote to keying material
exported from that session closes this. The exported value is unique to
each handshake, so it also serves as the nonce.

> In the end I think quote based attested TLS is not normally expected to be fast.
> So is this trying to optimize the wrong thing?

It does not need to be as fast as plain TLS. But the second is not the
cost of attestation. With a local QGS the Quote is ready a few
milliseconds after the request, but the driver does not check again for
a full second. Any user of configfs-tsm on TDX pays that, whatever runs
on top. The patch shortens that wait. It does not try to make the Quote
itself faster.

If that works for you, I will send v4 with the fixed interval.
