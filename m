Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448444;
	b=U+CXoBR8AtVaQSVlVVk3k7TypIE+cUO8DUoHIPeCTkEBei5K9UoxWKK++y+4HH4W5pg4
	 GK1NxsHFk1In2E4ysXBTQWDX2uqyoDEAgCJnAAIibrUovLfypaiMZCYWeOpB7jo5V+t1q
	 g1x+SF69tYhm/ucLzNZnKxEqXNEmvlzlBrqZTilXZaLfj0fh/ZDfMkasko4si0QFizvwe
	 b/TkXMXQkI9jii+DIGDX52Qt27Dm7dASkwQdWSpGrocdirRE80BKi3kt9ZVLYl3mW98Cd
	 7XAuNbg2bgVmQcyFNaA2H5iJEsARUnUmchUtDbLCBf+p5sFZ7iB51dR9z82ZX4p3MhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
	b=ZkMlUCtwEIDU67G1mQ1LuShbzYLL4/XuQ7G2uAsFBhj99jbmAqs3cvX0hElBy5kT2zzk
	 9JWRySM+YQt7huUSyy4Lnk8bDQWiKNb1Ulc59F5shpMx3com9sWq28v5t0xb4Jg3fnlmh
	 95bkfhymNpLXW+lHekomwjl8G+8TRq1RV7YqpSK5TBtjpj7a+l2d1SHObJjUmqkO2ihzm
	 FhkS+x02blQs2b6MMr+TCE1lXatqJSHSaOs6/CASlcdYbSGIrvfGdNemZKr/+BF1/eapp
	 ijppzOEJX4MyawjAsLf53xSq9KeMIAY4S6QVXNYJK85mPB25IVM61m8le+D5sNMUvXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CxFbkvU5;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334DB60A2608
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 15:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 334DB60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CxFbkvU5
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365d26ccbdso43397251cf.0
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 07:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795448443; x=1796053243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
        b=CxFbkvU5hWkZk5ASi+Fz8Jbz3PTa93SmxG74a4iPbdBeRW8kIRtMbhwz9iO+aNrouo
         5DTzv5DOcTv6avCdXhwjWHlb6bKkClvC3eiK0vrZN5p5W9E2hx+72EghEk5rhg5RqHiA
         /YC0DlKRfKoypRgFdYaghkU9Mag+P7695yFEcHMBO060WlL0N9Wvo1fHHjv5I9AemeM8
         PZCdUwn5Wvr3Jxjw+WY0qVeYd/nvlXvR86JivgsKZNS3U1mMTlnrrosG9eHwGCYo1Mpp
         w1RmsaAwIQA0Xghx2EX16sUQd9BZiw716PmEOSv4Z068TUqRW4umlgDtHG0iIBaE2GVB
         3syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448443; x=1796053243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxzVyVE4ai8Ea+LyIq1A/L2q3uxrmhBKTxjVeIPKjac=;
        b=flz1zkFgRtQ0A3thMiF1H5QMpY9EqbcV6lAqTUWADJZUox5sogBIfbLPh7PvGbKDDf
         zZ9mtylf69Zi0lTfT8UJr88HqY4NL86PJbhEQQ6fP8ICHbBmdNAgRT9HBkOY5kNVDmFV
         nD7CtopxxTfF1TgShkDhQnuKbF9X3s47DcQqodEumfeN6EATCt/8GGrKtoCI32IIC5wq
         G4t7IQgB3byhFyvVsA9+tb0ECxs17kmzBKPFI/cafcb/CCi7J1nxsAx1w6yvOpGzhjqn
         yX2+CE4zYHeZiH5cQ/tKLLIKKF9vVT1wjOQyx58jCXQWaOIrtsyUo2PMXPZQzzmlUC4m
         Th2g==
X-Forwarded-Encrypted: i=1; AL+hErGGoggbG1Ig2pr8U2gSkI3jRPMW+YU6wKA/W4ASSZ5vXQXkb/PbPZyQy/r0TqnUgFqsdKF3Tp1lP+wO@lists.linux.dev
X-Gm-Message-State: APuU4Z/q5f3sbs/J2lUd7DqzOzZ/C3axpxdNG2TKzgKWbPTaUlXA3Z93
	s6HsZZpIbRpBjpjlsZsrZEz63PJdombr+OTwGhUFOyyeiHFjM+kJqAFK0S5Q7Qkb+MU=
X-Gm-Gg: AZFdTZcIYO2KG3LdcJpZAtKrevgejigm2OUc/3hnyQqu16mU8tCNKER98VnlGgu9XfI
	2VXfveFJiOARCEuIvw3yciK3CHT+IT2PX9BsJ4H3j0zf8BC5CsMLGYHtgwTFXziOAPvI7tjj4yq
	W7sam0zGH4SFYMeAYp/Y0lmXRnLmfVl1GEDApv8wAI6p1Mgk3avjZodiL5rEI9DpyZ2r17WxeJz
	Q5Tn3K03pXWN8WN8RXI0mA02mWzMSxwPF6GANykJVDhHrxhUiXTJZAQxlbH/G8ahXtG6u0aETjr
	Ta+BebF3ADpm/69MjJXo7cEV8Tp2k9mEfjabcsFDSvAvfRsOfw6QU+LLv5AN253e1TIs4R8H7xC
	PhQfPLtGpppdJ/qU8zr3mStRxH4MVpzq9OZiXGPXl+z0oQekT2eJG680yda14uDvEFJjsFEwgGy
	lLZsnbu566mNdL0VHgmfgMxKGweOYUQz7s03/MtTil0AJ3+aIvwxX+HuQwv2rxaD6ob7HMAywlv
	WLUBttZHo9Io67iTarXjMOGGpa5KPOLcFojiql/I6nGZALrVxoaus/36UJcSeD0SX0QzchUEN7O
	MAqZsrm1GEKwgwJFa4kgwJbiwyHPY90NzKZnlUk/GOzWqn5v8Qj8erCHQJ//4XAZ+rb6x4qiKIe
	24UQ=
X-Received: by 2002:ac8:570d:0:b0:55c:bc0:63cc with SMTP id d75a77b69052e-55d768a2916mr224280231cf.6.1795448443241;
        Mon, 23 Nov 2026 07:40:43 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134796329sm107324056d6.2.2026.11.23.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVW9q-00000000t9u-0g9S;
	Mon, 23 Nov 2026 11:40:42 -0400
Date: Mon, 23 Nov 2026 11:40:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@resnulli.us>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	zohar@linux.ibm.com, aneesh.kumar@kernel.org, dave.jiang@intel.com,
	nik.borisov@suse.com, sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <20261123154042.GI179082@ziepe.ca>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
 <20261123151128.GD179082@ziepe.ca>
 <awRYr7yB8IWj7S3G@kernel.org>
 <awRan8ZELzpTwduV@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awRan8ZELzpTwduV@kernel.org>

On Mon, Nov 23, 2026 at 05:24:15PM +0200, Jarkko Sakkinen wrote:
> > > > As per the function, perhaps tpm2_calc_event_log_size() should be
> > > > relocated to lib and have non-TPM name like firmware_event_log_size()
> > > > or something.
> > > 
> > > Probably under drivers/attestation since that is where all the TCG
> > > formatted logs should end up. It should be 'tcg_event_log_size()' or
> > > something. Maybe a tiny module for it like we would have done in lib/
> > 
> > +1 for the name, as it is obviously more accurate prefix.
> 
> Location, I don't know. I was thinking something like "lib/tcg.c" with
> routines that are plain calculations based on TCG/TPM data.

I think we should not have new users outside attestation subsystem,
but the legacy onces will still exist obviously..

IDK either, but this is my guess..

> And perhaps for tpm_buf (both stack/heap allocatable), if Trenchboot
> ever moves forward.

DRTM users will route through attestation subsystem to do their
extends so the tpm_buf user would be the TPM driver inside
attestation. We definitely need this for ROT agility.

We should be able to build the attestation TPM driver without any
trenchboot stuff to motivate it.

Jason
