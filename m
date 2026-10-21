Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589026;
	b=wpqVdMKTzmJTekC+DQ7w0aveNun8M8k+IiJ5eFsRaV56CQsyEOWqg2cy6M7Nk2qBxOsu
	 sJZVR9uZPu/+bj3bnZB7x2nCxnUg3x6NK8aEwfzKWhF8EMIP+EzLoBvwdHSYubSEXC8XJ
	 kMsb1KlZXrLTrgLuVVldHbGsWHomyHUW12nG1WlMW13ien3IJw49SeuOjTQUbrHKMPUUQ
	 dkCYxiHy9yAi3BF9YzR95iKHlwDaWw4XhznPPHf/4saFcueKg9xMZiZIgR7wG1Dl9Sari
	 L9dfuRO8rNimFfvAQhM0UuiLJutCPWg/Gy3pxGsY/ML+znVjzj9IyTkSGldC7R+/ivg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ENEgiLYyZC1rCnAzeRub371bt2VgRo0VClTgBaXb9SQ=;
	b=rXKnazxxEfZ/8YCrt9cGbs1bBZRFxqJveXJGOBnzXiezgizEeTlu3iPL3SN6lMMetkZV
	 fQXgmk80pX0/k9cN5muWLsAPiSY0Wtp0SVT5Twx+umJ15FRK/lESy5y6It28uJP0WZ7AD
	 ZG5r2NzZPZURNCW4JLTX4zf8NoaCHLPeqNV5U+CpnLKyLyYO/da+QhucHeM/xkYEca863
	 Mn/T4Yry9Bs/M3Fr7eQwCPyUZAV82G1udx4fEXWpiFGuvevi+423Lh9erU8hACHkIa8yt
	 dhOlUa7ICUgu+TOh5jGYsb45IZQkbN1HFwRAdkLNpCGAue0AxT/cc59xxcbcd00YbIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=d5eYwt4f;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB9606A31E
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DB9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=d5eYwt4f
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba357a1929so736983e87.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792589023; x=1793193823; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENEgiLYyZC1rCnAzeRub371bt2VgRo0VClTgBaXb9SQ=;
        b=d5eYwt4fVm5GK2d5UvTdbjTTPGsdC0LzEN5pq3AzhGOPYaywu8UL9SCrOZUjEQFmzz
         nyyvCRz3fi8PohxFBSwPH5+CNAyDJ74TwnwthoKXbRZwc2E7L9R1sj2VNkO0Ln46ocK9
         povT+CK4C5BtedeBYO9d4MScX9lMoCxxwaLgKXglQ7h2Ap6sfQlmlj/58fSTI4Goda6s
         TJLjmdxwY8WQikVCSF2PNwG2xi8Zmb0us1OaX7BSD9j3WxB99JJoDGhJ3n2tpkoSPcTP
         rnra4qAO9rWeWpDo1TyoFCQz8ib9RpYTQ9vVJj4931HftXKZKG47ROHeoOIAaL0/5hld
         +AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589023; x=1793193823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENEgiLYyZC1rCnAzeRub371bt2VgRo0VClTgBaXb9SQ=;
        b=GK+lomw9E0rFkbN78cuyS3Uwv8EPvUd4zmuQoinMrhb2NZEAfC1GP4I6QUoylH06es
         K3VqX3DIsHZAw9QoZGVGaFsm4cw8lpDlPJE4TD2+qgK+zS/Y2+tzRz1kcFgH0d9tUnky
         +YPqvNMtIJa8v5RLHbRLILT6lcEKSnZ8OoOH5mvqbWSkxNU6CP4vXnRcUwcVFCy7Y74e
         M18cy3H3Nrwh8vmKGEbMrFR6cCZHntvvAUhxvN/Ldi2A3caQ1QW6e2V/KrK48WCcjJpF
         rxOYM4Fc1tBM5hDLX582mDA7Qwc4qX0lnUdtdi5fme5SZuap1fbImJN/RkOQkaYQOzHD
         N2PA==
X-Gm-Message-State: AFq9FYJrzT9EE55vOMcm4zX2JDo1LCWBnguTt4zsomHyGjh9mYpFC61o
	VMkOCgs9VgtYOo8M/c6gjgAoXkjFfJInitG5ypBjdr5RM2FKOXxYBxE3Dptu5nf0vo8=
X-Gm-Gg: AYBFou08jLF8jyccf4bk3StvMJhgqKNtAO3VqAMSpLkXbkSUBa8mbhFV35RN1Ris5MV
	/Mkq0vOnYegKvVAlWLRcN1wC4dfSYB0vg1QhL7T/HM5IGdmY055uBQ2pNQ7XnHao7grlpqgewwX
	1dccfxohoMCaCmQA/RB6YN7srEzq6DYZRQ0bIHNiCPAdPHj6atXb6LpfZO93emxDhl4p3jbL2Ea
	s0Xkn5wx93OykjvU2avt5XmjDoiJkSh5cxUPvyXrwjf4gMnfbX7qXQMgb1GxTg9J3SIX/PxE7OG
	7LKPNwKuE5IVS2uNoNdTdfJj1VJKeumVTEerY+mTVna6pcETYbvr54ted85lUEl7q64H9VV9+8i
	zFkCpf/MhGQjl6YUwUHizedFjRx2Wb3rTxi20N5XSGKBr/k2JHTvTvRdSao7V9chrsD0fNqO4P9
	wuxBXGjlv9eqDI24uWHKHXRHuUgYmUyReuh+Sydfa9GZF6Ss56B6ukMdLkysB97n1oBcVC4ElEt
	xNVVAWO/XgbKMaxoCZWcvSIPsZi4ZGJbDVpdc5Mk1xSfEoe+zd+qeZHOim5IdqzMag=
X-Received: by 2002:a05:6512:3c8e:b0:5be:55b6:7a92 with SMTP id 2adb3069b0e04-5bfa1c2d635mr792386e87.30.1792589022381;
        Wed, 21 Oct 2026 06:23:42 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4a4f5f04sm2718501fa.32.2026.10.21.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:23:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:23:38 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 01/20] ctlv: Add the schema language and generator
Message-ID: <ati8DWgQb23dV4Dv@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-2-jiri@resnulli.us>
 <20261020233132.793b7e97@jic23-hlaptop>
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
In-Reply-To: <20261020233132.793b7e97@jic23-hlaptop>

Wed, Oct 21, 2026 at 12:31:32AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:34 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Define the YAML schema and append-only family registry. Add ctlvgen to
>> validate specifications and emit kernel and UAPI outputs.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>Obviously you asked for broad structural review and this isn't that. I'm terrible
>at reading code for just the big picture but feel free to ignore the small stuff
>in this reply.
>
>My python being even worse than my yaml I'll only say that
>part looked plausible to me!
>
>> diff --git a/Documentation/ctlv/ctlv-schema.yaml b/Documentation/ctlv/ctlv-schema.yaml
>> new file mode 100644
>> index 000000000000..38fd56e6627c
>> --- /dev/null
>> +++ b/Documentation/ctlv/ctlv-schema.yaml
>> @@ -0,0 +1,359 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://kernel.org/schemas/ctlv/ctlv-schema.yaml#
>> +$schema: https://json-schema.org/draft-07/schema
>> +
>> +# The syntax gate for a CTLV family specification: permitted keys, their shapes
>> +# and the closed sets of keywords. Anything needing more than one declaration at
>> +# a time is checked by tools/ctlv/ctlvgen/lib/semantics.py.
>> +
>> +$defs:
>> +  name:
>> +    description: Kebab-case identifier. A dot is reserved for selectors.
>> +    type: string
>> +    pattern: ^[a-z0-9]+(-[a-z0-9]+)*$
>> +
>> +  family-name:
>> +    description: Name carried by family discovery.
>> +    allOf:
>> +      - $ref: '#/$defs/name'
>> +      - maxLength: 63
>> +
>> +  selector:
>> +    description: |
>
>Really trivial but nice to drop | where it doesn't make sense to
>force line break preservation like here. 

Okay

>
>> +      A named attr set, a whole attr group, or one exact attr as
>> +      "group.attr". There are no tuple selectors and no cross-family
>> +      qualification.
>> +    type: string
>> +    pattern: ^[a-z0-9]+(-[a-z0-9]+)*(\.[a-z0-9]+(-[a-z0-9]+)*)?$
>> +
>> +  selectors:
>> +    oneOf:
>> +      - $ref: '#/$defs/selector'
>> +      - type: array
>> +        minItems: 1
>> +        items:
>> +          $ref: '#/$defs/selector'
>
>My yaml is terrible (and all learnt form reviewing DT bindings which are
>undoubtedly perfect :) but random LLM agrees with me that you can simplify
>this as it's a local definition.  I think doing so makes life a little
>easier for reader by indicating it is thing defined a few lines up.
>
>            $ref: 'selector'
>
>I don't care that much though.

Okay

>
>> +
>> +  uint:
>> +    type: integer
>> +    minimum: 0
>> +    maximum: 4294967295
>> +
>> +  integer-bound:
>> +    type: integer
>> +    minimum: -9223372036854775808
>> +    maximum: 18446744073709551615
>> +
>> +  max-occurrences:
>> +    description: |
>> +      A finite positive count, or unlimited, which is reachable only from
>> +      query replies.
>> +    oneOf:
>> +      - type: integer
>> +        minimum: 1
>> +        maximum: 4294967295
>> +      - const: unlimited
>> +
>> +  unit:
>> +    description: CTLV-owned unit, matching enum ctlv_unit.
>> +    enum: [ seconds, hertz, bytes, celsius ]
>
>These are used in here?  I'm sure some are but guessing not
>all of them yet.

Nope. I just want these to be part of the initial schema as it is not
omitted by later family implementation by accident. Easy to pick up by
AI assistents I believe.


>
>
>> +  attr:
>> +    description: |
>> +      One attr declaration. Exactly one primary form out of type, enum,
>> +      flags, attrs and blob must be present. optional-attrs and recursive
>> +      may only accompany attrs.
>
>Maybe worth the yaml gynastics needed to enforce this rather than
>just putting it in the description?  An LLM fed me something when
>I sanity checked how bad it would be and it's only somewhat nasty...
>
>Bunch of:
> oneOf:
>      - required: [ type ]
>        not: { anyOf: [ { required: [ enum ] }, { required: [ flags ] }, { required: [ attrs ] }, 	{ required: [ blob ] } ] }
>
>lines, though I thought there was a more compact way to do it.

Okay, will try.


>
>
>> +    type: object
>> +    required: [ name ]
>> +    additionalProperties: false
>> +    properties:
>> +      name:
>> +        $ref: '#/$defs/name'
>> +      type:
>> +        description: |
>> +          Primitive payload. Integers are always 64-bit, and a bool is one
>> +          byte holding zero or one.
>> +        enum: [ uint, sint, bool, string, binary ]
>> +      enum:
>> +        description: Name of an enum definition; implies an unsigned payload.
>> +        $ref: '#/$defs/name'
>> +      flags:
>> +        description: Name of a flags definition; implies an unsigned payload.
>> +        $ref: '#/$defs/name'
>> +      attrs:
>> +        description: Nested payload, given as selectors.
>> +        $ref: '#/$defs/selectors'
>> +      optional-attrs:
>> +        description: Further nested payload whose placements are optional.
>> +        $ref: '#/$defs/selectors'
>> +      recursive:
>> +        description: |
>> +          The nested payload is one attr set that may contain this attr
>> +          again, describing a structure of any depth. Only a query reply can
>> +          hold one, since such a nest has no maximum length.
>> +        const: true
>> +      blob:
>> +        $ref: '#/$defs/blob'
>> +      min:
>> +        description: Inclusive minimum of an integer payload.
>> +        $ref: '#/$defs/integer-bound'
>> +      max:
>> +        description: Inclusive maximum of an integer payload.
>> +        $ref: '#/$defs/integer-bound'
>> +      length:
>> +        description: Exact payload length of a binary attr.
>> +        $ref: '#/$defs/uint'
>> +      min-length:
>> +        description: |
>> +          Minimum payload length, excluding the terminator of a string.
>> +        $ref: '#/$defs/uint'
>> +      max-length:
>> +        description: |
>> +          Maximum payload length, excluding the terminator of a string.
>> +        $ref: '#/$defs/uint'
>> +      unit:
>> +        $ref: '#/$defs/unit'
>> +      scale:
>> +        description: Decimal exponent applied to the payload.
>> +        type: integer
>> +        minimum: -128
>> +        maximum: 127
>> +      max-occurrences:
>> +        $ref: '#/$defs/max-occurrences'
>> +
