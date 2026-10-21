Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590895;
	b=gqXYZLrWsNyLs0MFhgwZck7zlmG5yxYwj1FRY+aF+anjlqpP5OWZVOt2lxDqSKUZCNj3
	 qQox3umX8Zh3WRPWRmuX9rhxXS573F02Iqhhbb+ndLvISW/GxDLuClgkxUHOV8GU6DE29
	 CvmKLlWBN2+Y4hgVDPBC2RwwPIe7Zn2Gsgfim08fMF+zRo89hGDUaVlmU7FHa+NFnSCUi
	 I/yY5Er+PuWdQ5BJaQm9DCc/oZ6pSSQnZOvFIl87sJUJNVXsvVCEsmo1dS/TvanhgupEY
	 QLUP9kDUrwtTF38EHKMR/MtGCgh9G+mIWWpZDNBwKpi44ovribc7nGhau+KIcHyFlDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=c8NANzTMJV28RCMd27ShXdH01N2IwKbSedeFEkSZyhI=;
	b=bIbr1d+unmZgPspsiGQE3vqLHFO1oPddNxp++4W3U+AsxTdgECrrK12sP8rfphAY/CBW
	 5YM+EjfwbmsYcDvx/OFb85itAuHFG4TqFOxN8HrshGga/rN6iQcfKOSMfML2g4cpgYiWK
	 llFykIRQAgLEkQqoxPjovDirxkFdvwLwjpfWKbkqG0aaiG9FdKKRbkruMEQCzTwrvWDrp
	 AvHN6Gvf0z6wuUjffl8+BnJUVyso5cO95U5ezpCVF5uXoC4PMXzB8ywliT0d7//x04WGP
	 6h2W7PuacTk5dlyO7yYEjv5CFoBGNcMloAOSOh3o7zIsuUw5FJAUruselkcsOYxh+9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=P2xy5FOB;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8DF606A31B
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=P2xy5FOB
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso2558260a12.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792590892; x=1793195692; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c8NANzTMJV28RCMd27ShXdH01N2IwKbSedeFEkSZyhI=;
        b=P2xy5FOBIE0m1+t43E5Q04OPOOEdrOImxxpUhKTabV3C+PuFtNhrNtrIiqYsroZFeT
         Tc7uC4TprnmlSsKl8ZybsBNH5ztHuhkSUFuXCQwW2xZaW1r8cyAzlkyDhnXR8xjsHbmW
         jUK6vnfCJdZPtH8MUrX7aeXkhrgJp4kWBcvnpMSNvUJ0HyNEDnedlKVJMgiChanLhxff
         DayUxhZoAewTP/Obnf5TkFlzMyiDE30a/0bTgHKmAGeLPqDbo03GEXw/nysFVyiQ7ChK
         H+9mYs3Uz8479bbfTMN5vt1hEhEz7DQe+LNmszHIVr+GE8R/B150do7Qqpre+MZh2XHG
         on7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590892; x=1793195692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8NANzTMJV28RCMd27ShXdH01N2IwKbSedeFEkSZyhI=;
        b=Vb2XefjEvkoNslzNz4qZ5R54iZivJjhK66Vc3okVQVAToFdGWsnOOIUffWkOtX7aUN
         zbFoxrTYK/b7Adz50ZnPaEbPuOZNJ5KCtVOz3CZb+XfjDw2TXQRe6a+Pg3ARl2z3eP7F
         Jp93VrEHDj8qhgzdPWFUTKCDTCDyDEoQBvFY/sFcoGOCVrb6Tnn+AmPzCcQu0wo7TkOq
         hKDjIcL7+KpWr8i5+5cuubyciUzO4J+TEaRDlfrIvNp8cWU9KKR489uBeufI9h/GuEdQ
         IeZAFoWBu7B5V/xiOFo/B33QFgxJKjtLgHmmXmQVMmMjHQpcbkGMSFeEDOqFuSXjC3Fi
         dDMA==
X-Gm-Message-State: AFq9FYLGhCvKAkvJ/8hrheH0wDY3Ws/xRsVQ/rNvddg1az5LGQekPIAM
	+AJhQw8tsmDq1+W34EDPSf47v4JGWf+bSwFoCBNtWhxAKQx10XCVrseapHpJ2sfreo0=
X-Gm-Gg: AYBFou3w4IKPOQCQH214ek5t8TuT3vJZkOyM7fGXc31qH2LuuDy/XaDTD6SBbFUfmkA
	8LVpr077/XQvWaSb9XNdM7k/THIWdlH4aheO+jjFH9j4wxllKFLY3kvae01BXCkTqXWnqacVj/Z
	BmAXkG0uWDA8S8TLv3o7+sZSllnikkeBZsFs/taS5zFPNcrb8gyNPfxKyl/Ka5N9mGZ/4uf3k8/
	PBtna1tIRH28NfZPmU5EwNC/vk9zR4TUVbl2tkPrKRt15PHVdVmQldL9HBZ4FHW1fYdC7c8aDB8
	V+CN602zlp1pRpLttFVfoLfbhVtCL2oaOGaRpmHZL9itWsLH3bquGck43XXZ2JNG9XjrT4P/MUw
	ZCEnSpH+Wx6n0G1qoOgPVAlwHkRlca0dQmCg60sdGH3WeSzbqLYjUE1j4KUboiHV9ch6WwjeLDQ
	p17ztGyCe5ud10iTmEsLekROnhGbtlW8gxMc14WS3CwutziTzZ4ELbjXKQp4tE7WKbgowcGn/W0
	L7zdpvf35jCpJt0hTTKxGkzzsW16EePyuv1QODgUG+UOfvSHokbmHY94gA+8jbbwt4=
X-Received: by 2002:a17:907:c30e:b0:c41:2ab8:aa3 with SMTP id a640c23a62f3a-c4606e91924mr434637166b.32.1792590892298;
        Wed, 21 Oct 2026 06:54:52 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcc5sm7387366b.26.2026.10.21.06.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:54:51 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:54:48 +0200
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
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <atjDlIBMg3dmXxHn@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <20261021000003.71f78d99@jic23-hlaptop>
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
In-Reply-To: <20261021000003.71f78d99@jic23-hlaptop>

Wed, Oct 21, 2026 at 01:00:03AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:35 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Define CTLV's common TLV transport, ioctl, event records, identifiers
>> and limits. Add the in-kernel API used by family implementations and
>> generated code.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>Minor stuff only.  Some of it moaning about toys we don't get in uapi
>headers that make kernel code 'so elegant' :)
>
>> diff --git a/include/linux/ctlv_family.h b/include/linux/ctlv_family.h
>> new file mode 100644
>> index 000000000000..1ae4d3a536f7
>> --- /dev/null
>> +++ b/include/linux/ctlv_family.h
>
>FWIW I fully agree with Jason that sometimes it is worth burning
>some lines and even duplicating things a bit to avoid too many
>complex macros.  I didn't have anything to add to comments on this file
>at this point.  Will see how new version looks!
>
>
>> diff --git a/include/uapi/linux/ctlv.h b/include/uapi/linux/ctlv.h
>> new file mode 100644
>> index 000000000000..6bc0d1a296e6
>> --- /dev/null
>> +++ b/include/uapi/linux/ctlv.h
>> @@ -0,0 +1,183 @@
>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
>> +/*
>> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
>> + *
>> + * CTLV transport UAPI: the TLV wire format, the op-execution ioctl, the event
>> + * record header and transport limits. Schema-free; a family's constants
>> + * are generated into <linux/<family>_gen.h>, the root family's into
>> + * <linux/ctlv_gen.h>.
>> + */
>> +#ifndef _UAPI_LINUX_CTLV_H
>> +#define _UAPI_LINUX_CTLV_H
>> +
>> +#include <linux/ioctl.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct ctlv_attr - Attr header.
>> + * @len: this header plus its payload, excluding this attr's trailing padding
>> + * @flags: CTLV_ATTR_F_* bits
>> + * @attr_id: complete attr ID, or CTLV_ATTR_ROOT for a message root
>> + *
>> + * Attrs are aligned to CTLV_ALIGNTO, which is why @attr_id is __aligned_u64: a
>> + * 32-bit ABI would otherwise align this structure to four bytes. A nested
>> + * payload is the concatenation of CTLV_ALIGN(child.len) bytes per child, so
>> + * child padding counts inside the containing attr's @len while a leaf's own
>
>Whilst I get what you mean, leaf doesn't feel like a clear concept in this
>comment block.  Maybe 'this attrs own padding does not.' or something like that?
>
>> + * padding does not. Scalar payloads are native-endian. Within each request
>> + * root or nest, occurrences of one @attr_id are contiguous; different IDs
>> + * otherwise have no required order.
>> + */
>> +struct ctlv_attr {
>> +	__u32 len;
>> +	__u32 flags;
>> +	__aligned_u64 attr_id;
>> +};
>> +
>> +#define CTLV_ALIGNTO 8
>> +#define CTLV_ALIGN(_len) (((_len) + CTLV_ALIGNTO - 1) & ~(CTLV_ALIGNTO - 1))
>
>Could this use __ALIGN_KERNEL() from uapi/linux/const.h?

Okay.


>
>
>> +
>> +/* Set exactly on root and nested attrs, clear on scalar attrs. */
>> +#define CTLV_ATTR_F_NESTED		(1U << 0)
>> +/* Query fragments: set on the root and each nest logically open at the end. */
>> +#define CTLV_ATTR_F_FRAG_MORE		(1U << 1)
>> +/*
>> + * A request attr, never the root, that a device whose schema does not declare
>> + * its ID skips whole instead of refusing the message. An ID that schema does
>> + * declare is held to it wherever it appears, so this asks to be forgiven what
>> + * this kernel has never heard of and nothing else.
>> + */
>> +#define CTLV_ATTR_F_IGNORE_IF_UNKNOWN	(1U << 2)
>
>Doesn't really matter but could use __BITUL() just to hammer home this are single
>bits. Places like pci_regs.h have started doing this for new things.

Sure.


>
>
>
>> +/* Implementation limits, not wire-field maxima: raising them is compatible. */
>> +
>> +/* Request roots, action replies, query reply fragments and event roots. */
>> +#define CTLV_MAX_INLINE_MESSAGE_LEN	0x100000	/* 1 MiB */
>> +/* Includes the error information root. */
>> +#define CTLV_MAX_ERROR_LEN		0x4000		/* 16 KiB */
>> +/* The root attr is at depth zero. */
>> +#define CTLV_MAX_NEST_DEPTH		32
>> +#define CTLV_DEFAULT_QUERY_REPLY_LEN	0x10000		/* 64 KiB */
>> +#define CTLV_MAX_EVENT_QUEUE_LEN	0x1000000	/* 16 MiB */
>
>Pity the linux/sizes.h header isn't in UAPI as result is we need
>those comments on what the sizes are.  Ah well, never mind.

I already eliminated all of them. Some are kernel internal, some
userspace internal, some I moved to introspection.


>
>> +
>> +#endif /* _UAPI_LINUX_CTLV_H */
>
