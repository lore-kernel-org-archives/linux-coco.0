Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760173;
	b=rkSOiy6nZSkvHfeqB5MS1Csoa4dkCm7EAPkr4GuatWfO0r7H+eU3EreJq1K3VmHv9ObC
	 G0UbXz6Wem9vkscJhbFzC6YYsZpRk/exvlIbuj/S/xjYm9aBqE+35pn1QovMTinW2tamT
	 PSGJQo4TAgofYmD2W58iszIfW8fniOLaA7xd/RpXjXmR1f0JqdtV8bVLpUgYliT3kZPSn
	 rLxUyZue3PrT40Agiow2cQXq+4YMQpERi/bOosBCWKWtR+unl+UpIkri5lgeKmNjFkrwU
	 ryCOaVoybskDHJRsihSXy1/P9RjyxNafyZQfaXHtbv6BtjP7UwV3jVH3bcqnoXMgmgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
	b=kNrqiPzM7NaVURU9RSr5CY5TC7zk5unnr48Nr5cw9LMOqw3Bx/5zEUbbFON73FbKaSKl
	 WUGwIuQ/I/R0PjYR3SnngTuNIndqYPQNIyja5jt2APse5Bv8d5xMZUse5TWOPza1Rv7ON
	 d6+QqcoGsLVytv+g68JS812B8geA8WznWD+78pbw2sqximy0nvpflFLPr87P2mHhwlFkf
	 cQ1qI8IWY2toDQys/J84sI6b2SLaT0wl8w30nHtyseT/WsQAj6Zv0PL4uuue2Nm5w+WXW
	 MvFmIRT1bYa7r45CRRf5PN2is4Y1KNwo2fs6uGS1VU7MPhxY0qC5tbXO+lcTMZj3kkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A62606A31F
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 12:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A62606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a218ffa23dso1951705e9.0
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792760161; x=1793364961; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
        b=vAXhVtTYQ+lVtCMDE71D+9s3Wc3Sg5dJWQShXE1k66J0Te6/AumFIPWH0Stal9D//N
         HznEf8CL39XxHMZAlbxSQEJqfjTRUCF1t66/ArC0h0ku5C8KY5uPt+B1sNjrkWXr9QrJ
         GmTNfYpy5dAhquBv6QzsgIOoU6uK5az2F/GCvBPtT11gBNyhN+/v0ki8U8p/3VTa2BKY
         RoDLTDs/4F4+DSi87wJEUUfXZewDDt6Y7mo/kT1UULfJFjJng10w/UmFhRM1N8EDiCY7
         q2g5oMx0/DyXg0ixbXkvA0QybCsncuAk7XtZup9q+Ttr7mXfwRd7ot8uc0cXVbm8Wrsn
         x0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760161; x=1793364961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4u5HTj0vYNkfyVy/ejdHIe5/AhW56e/aHgAn7wANgbM=;
        b=RpuGUQMc1znqhbP0CtQ5iTS0dOWom+G/2++cjJ5CZ2uoTPf6ZsxGbApLKJVfXfFbz2
         hy0+5tUzpXi4BpEH+zQbcswFFcnk7G2F865uYLrxfAX2vPVmh60JQLkMN6ys2pwgh1em
         wpYyXPGW5u+hopscbLmB7S7mBGkM28PdV7E7PODCDhVg59RN3MYb8Ol/pH1aOj2i4vCk
         h+X77qi2ow28nKp5TAM4V4UZDT1WFj+6SUEl/IyKJNTL18wick6AUZWB2tuG20GjtOSS
         yn1bDghenzqooRvVjAhNagvHlr2xgoH9Wa/cFdUX0rqE482YPbte6f4uusf2lHkLpMuv
         Wlsg==
X-Forwarded-Encrypted: i=1; AKwUvBymFIWDor1WUqvUjY2tKurdnGsyxpg+sFqvc4iXzpKUmSyC9eXPzV8wi+kMrJziGSv5+7VQYSA2etzH@lists.linux.dev
X-Gm-Message-State: AFq9FYIXNPcZQ1IYR7ueiE6miSkfCHqipDaoaqxG58j+AP6yI97NU3l7
	6hQsAs1lHNYhDHov3welhogCrJz1UDJPtK8de+55yGSjJxq0kexdrzZcLKHQZ5Lvbvg=
X-Gm-Gg: AYBFou1p650si8tR1Z31DTIyit0u/jVBDmBb3tXUJTnq9IyCWgwUhr614ouZjruLQDb
	G89UKGiWIEbhSd6DFNQxkKsDJum9h6kflb2dDiJWDuqFgzD/VqZnCQZVFB6ipyPioVF7OJllSrF
	XImSkTo8zhEBvBhu1kJJ2JCAPqRK5A+tQZa6JDuoJOolfBUudQtG0rRWWpGl8fuh/K7O87Pm/fk
	mvBBGnfQQY+24oT7cTXGFvqIfMnPN7WrOYLIAcgGEsXBIXyzl/NJBQ1W35F5ID8hFXjtcnReUdw
	Vi/30+Uf5QuIF+jwzMl0Gv2rgYGuoIL79/ALfwnYUFRknFC/LZtzdBVvdLFyX5GC0I9PuvT4d6k
	w82MOV8FftAx7eW7S9/JmnjibGb+9+9wwJvxeQ+4NR3+zHYllY+/Nqos/NXXBzdqYkBIlC625lt
	99R3yHcqcHMWKyt7U2jUjL8dVucFfLHMo5eG5dO0UmIX1f6SK2MhnH1ul5U35drnChGYn6DCilH
	Pbq3yUbsj8TjL5aLzCOJwdGFj3LXpLsmk9pogvhFBLjkygQbkPPmJxXBt3s2vPjuQ==
X-Received: by 2002:a05:600c:354b:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a211ef95e3mr38623785e9.32.1792760160732;
        Fri, 23 Oct 2026 05:56:00 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cd9d232sm3594475e9.4.2026.10.23.05.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:56:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:55:56 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <attZPPNPIgF-DH4r@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <20261021014324.58376589@jic23-hlaptop>
 <20261022183942.GC3381610@ziepe.ca>
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
In-Reply-To: <20261022183942.GC3381610@ziepe.ca>

Thu, Oct 22, 2026 at 08:39:42PM +0200, jgg@ziepe.ca wrote:
>On Wed, Oct 21, 2026 at 01:43:24AM +0100, Jonathan Cameron wrote:
>
>> > +bool ctlv_message_input_rebind(struct ctlv_cursor *nest, const struct ctlv_schema_tree *tree,
>> > +			       u32 node)
>> > +{
>> > +	const struct ctlv_message_input_scope *bound_scope;
>> > +	const struct ctlv_message_input_nest *indexed;
>> > +	u32 i;
>> > +
>> > +	if (WARN_ON_ONCE(!nest->attr || !nest->msg || !nest->msg->index))
>> > +		return false;
>> > +	if (!ctlv_message_nest_index_ok(nest))
>> > +		return false;
>> > +	bound_scope = &nest->msg->index->scopes[nest->index_nest_scope];
>> > +	indexed = &nest->msg->index->nests[bound_scope->nest];
>> > +	for (i = 0; i < indexed->scopes_count; i++) {
>> 
>> 	for (u32 i = 0; ...
>
>Is that allowed now?

Yeah it is! You live in the past, same as I do obviously :)
