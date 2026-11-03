Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698199;
	b=gi5KlcQUNrf3sdMERLGeu8t+9BVVLxN11I0lIflW+p16G89i2dBc+tc86GIupfzna2cm
	 xwVZ+/ehEZ/2SVgnWjpEpLgfgXiTj+08AUbPffCkyRggPMivoVfLUabyGI8LWdsy0Hwaf
	 llVfqzZGW0jrvylKf8bKdcJOvr5aoPn6wACXrpQAK3HhWWkcSz6U447oGeFLYIobRol9n
	 zORTkPGMelU9sccPG18duvB0tZNNVVDB4FaCv9cpyiffLxERtlKybV98GnqzfafbQuLnN
	 X8ENzR8ElPy7K4UU7MYPThkhX6e7OWgQ4vgC6xJvG8hSfp0Ubv+bKaEHQYwiV9uAmxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
	b=QVKeIkLFc4yC0DnuNM8Si1Dt9qo3A4YdzBbou9QvYPK4WR/ySx7VUNzU3z+8lT+i12M8
	 nPXtDCaVQg4/G7BCXQpemq6cp9qr1Nsutqkm/dVfxHu/IoP1glNkLitZfbc9JqmcXb5k2
	 bp+BvjCo0CdJbLe2+Cy00PYeGESK6vQY7PGAXu36ej117imwuPnwxXvtBmIVM7/d21WYP
	 VuyXu6y0lNnhsuPPdV7aV2zCYJoTKj3Pk0qW/hHXmxWhWR52bc8sy/lfQ41ETcTuaL+nY
	 kf+E69YCQ4UgECZykSYRlbUn5fPB5np92id7B7nf4aSvkGq5vD7NzngZlZktQyca3dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E0606A32C
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 09:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2E0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so4040785f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 03 Nov 2026 01:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793698191; x=1794302991; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
        b=H/0ENSKXDuFPpFkALBW1+2qxlLR6a5kd3oIXP9Vtt77eFZ9cvfSf61MFDdncbklrVb
         CpqFny0M27/9KvRvS1N5X5HRCJ6OZQCK2R3tJ4Ll1MemS59gVxhiJZ/7j1c0PVBW7HEj
         n0wXgxGOam/oNr4HWzKRzsvaMZGE1IPuTs1x6iFAWmEUnV24mCnx+x3bl6Oxp+GlaNt/
         zgEjIc+E62LblDqR6hhPCoXEJOBl9ug8h0YQlXECzsMuCOe+rvzNu+1WkG/h3pBow1OI
         qOQCOy7hxN5WGk/7FB0OKYKEN5xWB/btsl9e98C4vstMv6Ldan/lSsdxbZMZhKNoHSii
         OMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698191; x=1794302991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkFM9E5nfWdnLbDGQzZA+rThnrcRob04z1+EqW99MTE=;
        b=BdGa5yZ0TBymdBqtCWwhgzg9AMsBT/wffD7X9DNworAg5LLoizGYrNhSCTHeIVsK68
         ILUG8QF2sUN+JwUeHTFNKUleWbUCjRPuYW276oP0Nn8/5QffMCxpyzPrsBWbEb7athtT
         6VwNosu0RChr/oqT095Y5T8oyavHHvmTcCclVu2ux0mUmLzJ8hvWgW2mTzne0jNyf5zo
         wBo/OTvKS604N+p5c10AfUM1l31DEkoOJetX3h8zWkCScvVhGlr0O3UiW4cVunj7Kgxb
         bOGD97CfGSrs0EtmwqVb2s/bpXnBPUMnnPltTgkWx5lMm475BHnqR80z7nmQDUDbCkuJ
         crvw==
X-Gm-Message-State: APuU4Z9dQhu9eW7XObwoe8FV/rWYAYswcyYbQ+Cqb29pFGx+XrSZn/nx
	8xjTAOMru5ZyPFFYSANVdQflgmSAOZpf63JnyHZk9hPeFkckvmXhScTPm+WQovbWAms=
X-Gm-Gg: AYBFou3UXML3b3KsAFy4U177u5t1hsmEYYIxGIXx8jE+w3pHKY1yhMTWZ8G+kSgpd2X
	RinFU+0aZ2Za4YF1mEKy73UoKXKglQyEriN/eQXPhRulYIAMBialTGb3l9W1d3IQum1Mw4+DvUH
	3K8+sQKkn1HhkvnQZdXK7b8b2/CVsTefXcwQwq4MUlrTMfQPQnUliz7eXelO1ShKSnkeQVhsrh2
	NyMecVFZgbKzKVCqkWcgTCyAVa7cze8m5e31WImGLAKwqCTf2jsAWo3vG9+WrpVOqMADihbwLIS
	G9K2TjVpvfLc+tmAFOGRzPjnelgX2HXxAghMIsv9cb7udKnEesHgzD1GnZnN92aQNKWFhcfx+KR
	8Zb4mREwxKNrnoAqxJ67ZhEE4KD6grwp3Kn5Q2SYPPCPfGUgU5KbHqOglKSYvS4S2DtZy3Ow8hh
	dMCuNbKJqQFS10ZJ2FM33C0lhRaaRZcsy4Xrk41HDjhbMPMQR+yFLuJrWy3wyrTS0P8v9DI0VSf
	aLRPsNMuyS4AWnx61jt5pHARwlOs2hRlumViQGfXZyharPLy9OsBAPV1Hd/OZpdr7uFgAavBlxs
	LZakGBnBbYHvl0kc8+l3x+p3CDiSZaCVBaFW
X-Received: by 2002:a05:6000:26c1:b0:48e:870:7791 with SMTP id ffacd0b85a97d-48e6e30b824mr25816174f8f.26.1793698190820;
        Tue, 03 Nov 2026 01:29:50 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm25441683f8f.34.2026.11.03.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:29:50 -0800 (PST)
Date: Tue, 3 Nov 2026 10:29:45 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <aumogVKtYnY0QJ2r@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
 <20261103010537.GI3889730@ziepe.ca>
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
In-Reply-To: <20261103010537.GI3889730@ziepe.ca>

Tue, Nov 03, 2026 at 02:05:37AM +0100, jgg@ziepe.ca wrote:
>On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
>> >So.. how about could we drop the sets, use a direct description of the
>> >layout and do something else for the ID numbering? Maybe the numbering
>> >can be solved directly by only listing the names in:
>> >
>> >numbering:
>> >  - device-get.reply
>> >  - device-get.reply.caps
>> >  - device-get.caps.evidence
>> >  -[..]
>> >
>> >?
>> 
>> I'm still committed to implicit numbering. For "inline records" I
>> resolved it by having it encoded as a tree with 4 levels:
>> 
>>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
>> +-------------+-----+------------+------+------+------+------+------------------+
>> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
>> +-------------+-----+------------+------+------+------+------+------------------+
>>               |<------------------ record ------------------>|
>
>Fascinating idea. Sort of like an oid
>
>I guarentee we will run out of bits someday :) I saw recently we ran
>out of bits in RDMA :\ 3 bits seems like quite a small number..

Well, this is just for inlines. I think if user comes to the point this
will not be enough, he can use named record, as he probably should with
more than 8 inline records anyway :) Also, we can introduce "mapping"
mechanism to allow inline conversion to named record without breaking
userspace. I just didn't bother to implement now as it is a theoretical
problem now as I see it.


>
>Maybe increasing op to 128 bits?
>
>Maybe family/kind/index/field spread over the first 64 and then the
>Lx's over the second?
>
>At the very least there should be an escape hatch so that if this
>becomes too small there is a way to opt into some new layout and fix
>it without breaking everything.
>
>Jason
