Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657679;
	b=D8SCm0CH5QPB9gPkkGuLq6TOUZDJXIKvCGBWv5/MCkaJONLrbUK9kgHdmOknlsJHktd7
	 J3DWY10Nc0SQo+0vMB/DlrpVALe6ZWBoLYH0m8Ycn1YtB4Jb/sKqpcY1K+TsdRWRn9LCf
	 w3ZxAgh+9uPvqNp/373IRTBlvPzjZbwA9FCtFd2X5nY2kD6RDKtdbEXf4swg9z5dFMK+Q
	 Qs3wgLRnaHRExx4T7CILaNeT7VE4XbHWPjsSyzhPHU9jqtYhQguW8OnEvKjC2RWMl1seq
	 ugNkpSYmCED9nco4cv0x06a/3+0nE2aScv3dIp8BiSpc6UWXJcaI6aj+oe7nbXRhjtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=asTQwS3Q/pIZmKtVtb/ZZcYojtRdxCAchkNTDOljnRg=;
	b=5NITP+JREsWH+JdQhvVZeS68Le4OynpfvS5fo+nR++bo9HraQVrSz9NDLqaJJc7NXoig
	 PHduW9efe9al58EWZ5HBjoKb7o58X1pL4lJYD4tcMxH8U886+r/PgIXXU5fuXKcV1uB6g
	 dqRGpSN4J1fIEL9pS7zFNE4l2Uh1ZtDL5/yIFJiL6o63+jjx0pDYddGyGE4K5RWG8DnjQ
	 BuEJD7n85LDbf38Zh5ZuXvqYeUrJEnD6mk+QyN6YDikeUA1ma/S4eM9TkDqNV2I44eiWg
	 39m0ARXGIA4E/K20Mo89o2BQW94cQqGG60fHT0GnWT9S/9CKIss38i0aumTOUVMW4Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=rzMWUbxb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DE5606A320
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 08:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=rzMWUbxb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20c923847so261985e9.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792657677; x=1793262477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asTQwS3Q/pIZmKtVtb/ZZcYojtRdxCAchkNTDOljnRg=;
        b=rzMWUbxbXpRa8105K+wzqsxaBCdOQ10WsIo9rLklyxEz0rUBmpWcXi18ka0bqIt35c
         mZig8asUhxYsYFz8JRepB3Z80G0J9QnyCmkMO5u4EIkC7CssOGj+sMYZoF3kPlGyPJZx
         kxHeUvHnDgBC1S8dqhLAQLIAttiHaXztSF94cwiU1hm73ObK/2csl7RCf4/jV/GtmZfg
         pep+FWmPR5Sd71W+XvU8Ii6X/Jo7IYQFomwR62PPv5NEvhIA+j0GaYmGCX99dOrEZWT9
         VHNDrfuoV+Krg52+tdgU/ZoV1XPL20dD6hn9/MWb3ck3RYC5iRYENFs8LBImSNspZNhP
         7aWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657677; x=1793262477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asTQwS3Q/pIZmKtVtb/ZZcYojtRdxCAchkNTDOljnRg=;
        b=W7X+TQL7aQel5NSGfDQS0R+IDOon/qbzUhgL5SxiIfYDV0xGF1uMq/m5B+7yVb3Yfy
         yheDuiwmyyj2kYOMYOuGPq4Yk14Js1k+LcWWMe5W3BpDRl1qDoUhNKRClQS7+cXe4KDn
         IDCRMemDF0sVKLFwswwPl6PCzPLIv4EHK/48s86ZwtIzdO6tDXXnY1y9Aj8PLrVYEcK3
         qba9zr9yZlTpZuHXP1QvnrZNf7f2dEY/lXRz1yIRsDG4SxKRB6e9OHyO7BjSp+1PdG7C
         k256c7vbeNsNsjnOyEZDSXI/Geel033bOc1Ma7asSLa7iqi2hKCsY3/iOmDGmELLEIaw
         /Z+w==
X-Gm-Message-State: AFq9FYKPJ6ifU+ZHwFfSt/mSGkR1Fqa0N2DEIVGcpUfWJnIptzcVOnZV
	hzyFsT9wb/k3Gqom+9rBkeZX8Mzxw/HlnUVTHnJmdf5O+JvlwTcBRnf2b3UIYHifjRI=
X-Gm-Gg: AYBFou2E+D3r5smOOYbuE8lt5EpUa6UAPzxWi9zIJICX1oSskJcsM0dfIZ6ldPxhWmU
	oZ+75WxBDN7SXzuYVRIupCVoAgSjqrq0r052n3NCiea7QIgwgY207EApCRx+Fnk0PZ2NoMSruUe
	XiWka4kBBoDCiuTffvGy0vvlWeMDqz88Ty9ih93pFq4XKvDeiupX44ykZ3ys9H/7XEm70VbGRJN
	eURd3qcWvL8JXd5Vcn+4jqX0XC6M9Zx2bVmC3CxTwXB7sIN6nTfrPFLn6YH3iRyNwyha5t92gEI
	mDqDjaMjth8FybbkZjGHG+ixQyZKqVcXi0ex7PEcvzY3vKRd81Q+Vn9S8DK+cikgAOMvO9kmhXe
	1rX0txOIyOmkkrCDQQ6WW0xACGglbFIEWOymCNtwBmPEKM7we0vlvav59H0p7HN9MofM+cyjjn/
	+ICoaBvO2uaiAUOyF4WXIgkY/zoE+wTUCReSkLMjn3aQG+u6iMDzB/imBE9XVMQrJm4aWYvARrP
	Njnp0V22/jTfbpFxwT355EGX3cs/5mLUHKsGmyGasN9CcKI6RAJ2iO0xHrsK17l
X-Received: by 2002:a05:600c:524a:b0:4a2:994:5750 with SMTP id 5b1f17b1804b1-4a209945818mr14069445e9.32.1792657677030;
        Thu, 22 Oct 2026 01:27:57 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258426f4sm10865456f8f.54.2026.10.22.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:27:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:27:52 +0200
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
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <atnIDx6qmLe-geb4@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <20261021014324.58376589@jic23-hlaptop>
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
In-Reply-To: <20261021014324.58376589@jic23-hlaptop>

Wed, Oct 21, 2026 at 02:43:24AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:38 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Add wire walking, request indexing and validated input accessors for
>> generated family readers.
>> 
>> Keep CONFIG_CTLV unwired until dispatch completes the module.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>Trivial stuff only. I didn't attempt (yet) to check
>all the walking code, just get a feeling for what was here. 
>
>
>> diff --git a/drivers/ctlv/Kconfig b/drivers/ctlv/Kconfig
>> new file mode 100644
>> index 000000000000..aed3243c55fd
>> --- /dev/null
>> +++ b/drivers/ctlv/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menuconfig CTLV
>> +	tristate "CTLV character device TLV UAPI"
>> +	help
>> +	  CTLV provides character device UAPIs described by a checked-in YAML
>> +	  specification. It owns the character device lifetime, the strict TLV
>> +	  message format, request validation, reply serialization, the large
>> +	  payloads a request describes rather than carries, per-open event
>> +	  queues and runtime schema introspection, so families only implement
>> +	  semantics.
>> +
>> +	  If you don't know what to do here, say N.
>
>I'd not say that.  Overly cautious for something we expect
>to get fairly extensive use.

Okay.


>
>
>> diff --git a/drivers/ctlv/message.c b/drivers/ctlv/message.c
>> new file mode 100644
>> index 000000000000..7e5742ba8f70
>> --- /dev/null
>> +++ b/drivers/ctlv/message.c
>
>> +
>> +bool ctlv_message_input_rebind(struct ctlv_cursor *nest, const struct ctlv_schema_tree *tree,
>> +			       u32 node)
>> +{
>> +	const struct ctlv_message_input_scope *bound_scope;
>> +	const struct ctlv_message_input_nest *indexed;
>> +	u32 i;
>> +
>> +	if (WARN_ON_ONCE(!nest->attr || !nest->msg || !nest->msg->index))
>> +		return false;
>> +	if (!ctlv_message_nest_index_ok(nest))
>> +		return false;
>> +	bound_scope = &nest->msg->index->scopes[nest->index_nest_scope];
>> +	indexed = &nest->msg->index->nests[bound_scope->nest];
>> +	for (i = 0; i < indexed->scopes_count; i++) {
>
>	for (u32 i = 0; ...

Okay.


>
>> +		u32 scope_index = indexed->first_scope + i;
>> +		const struct ctlv_message_input_scope *scope =
>> +			&nest->msg->index->scopes[scope_index];
>> +
>> +		if (scope->tree != tree || scope->node != node)
>> +			continue;
>> +		nest->tree = tree;
>> +		nest->node = node;
>> +		nest->index_nest_scope = scope_index;
>> +		return true;
>> +	}
>> +	return false;
>> +}
>
>> +
>> +void ctlv_attr_next(struct ctlv_cursor *cursor)
>> +{
>> +	const struct ctlv_message_input_slot *slot;
>> +	const struct ctlv_message_input_scope *scope;
>> +	const struct ctlv_node_schema *node;
>> +	const struct ctlv_attr *next;
>> +	u32 next_nest;
>> +	u32 next_offset;
>> +
>> +	slot = ctlv_message_cursor_index(cursor);
>> +	if (!slot || WARN_ON_ONCE(!cursor->attr))
>> +		return;
>> +	next = (const void *)((const u8 *)cursor->attr +
>> +			      ALIGN((size_t)cursor->attr->len, CTLV_ALIGNTO));
>
>kernel code is allowed to rely on void * arithmetic, so this can be
>	next = (const void *)cursor->attr +
>	       ALIGN((size_t)cursor->attr->len, CTLV_ALIGNTO);
>
>container_of() for instance makes use of sizeof(void) == 1.

Okay.


> 
>
>
>> +const void *ctlv_attr_binary(const struct ctlv_cursor *cursor, u32 *len)
>> +{
>> +	const void *value;
>> +
>> +	*len = 0;
>> +	value = ctlv_message_cursor_payload(cursor, BIT(CTLV_SCHEMA_BINARY), len);
>> +	if (!value)
>> +		*len = 0;
>
>I'd kind of have assumed that ctlv_message_cursor_payload() would not
>set len to anything if it returns NULL.  Thus the default *len = 0 would
>be intact.  From a quick look that seems to be the case making this
>code a little odd. 
>
>Perhaps overly defensive or keeping an LLM happy?
>Same applies on some other functions.

You are right. Will remove these.


>
>
>
>> +	return value;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(ctlv_attr_binary, "CTLV");
>> +
>> +/*
>> + * The room is measured before anything is written, which is what leaves a
>> + * refused attr's message exactly as it was, padding included.
>> + */
>
>Having a trailing comment in a file rarely adds much or indeed
>even more rarely gets read.

True, will remove.


Thanks!

>
>
>> diff --git a/drivers/ctlv/message.h b/drivers/ctlv/message.h
