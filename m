Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694385;
	b=070C0XNKLoE0F6/JUc+j0uZ1LrHPvyzMz69lfFhWFCjbtOJ8H4aek7MMRXHhK/LAM4FR
	 4pSiM8+ad2w+tJzcWhngkgF/+C5HzTe2jnQBVOgNJ3STDAiyexLTLUU+v8pMxWxTpSUzv
	 FSS8EtaYjtUhHPx99YreAGsppJLYSJCSSvrrDo2e+dMA/RYXSj8TkI2XDFHggdIyvzCNo
	 DnKBQcmNDTIoIz+zPQEBCKNeqdqNqdwaw13+zZ6o7/sz5dPBT6EXr/t+KhRWnMlV3di01
	 ywY7Pl++YbOuJPlveA3PL8LAs4vjCh/IbsWDQDXlh2SCAdSCjJibxPXjt+QTerGF0Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
	b=SH/VevoiA2XPgSNyJGhflUUwMMR/z7FV9PNWYvGRsExQN9kEM9s9nKaZYoOKFs9S8KY5
	 aC+O54XmOs3NYXLXy/E6xGTwDWyEjMCNQeyFIbgeEW3SqTho4GF8g39iJFTsMZ8X7N/iL
	 lLpJj7/Rx2s498+tWHWxW3kYJurkL1s4pIYd8gHP1uFzXeZj8PNvEItEX/TtfRJXlEX8n
	 S+MEu76lSjfrScMlyARfIW0FgqOedv4UPP6XgfFstPiTiZX8JEfblagLUNhrrgMEWt6xJ
	 xIXamou0mhpPEmZ9LElXLXCJv6e3YcvsLAPgh9viPVTNZ7U/p8arFBS8Phv9zSUP8vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FnII480T;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002B606A32A
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 18:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7002B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FnII480T
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917b78dfe30so2806606d6.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 11:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792694383; x=1793299183; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
        b=FnII480T/WgWwwoYLbam6MUnjNFVdtpB6p8tJm6dtx23hR7UvFkQUwO6fGHyP3/uE1
         1WWg2OKvStmeCbD9cA/sHGctMcHWaDjuyv86EdjvhYm1IqDqGeL2hNhcPjcC5ZiBMS/Y
         ooEXrEIQFyPV2ArMCsZEFnxQ+N4OzDHPO7NddhB7WOAlrVpnKRhwT8ffC58g7omxEUyb
         9gcUy3F5wRFggxheV03sqLdTahczK8wihl0WvPpAYBwPueKkxl70gkQ4n3/RuVDpJiQr
         qyBTYuwhZ6qpn4N99Ta5SdKux/79+Vq+gt8Qojj+d1hHoxk4gIhDczijhkTWvExSDUh+
         odZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694383; x=1793299183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OyEIFFGQJwoM3H+g7NU0Vj1plI2Oe4JZLflWIJCYwE=;
        b=AkHinx3sXHLc2NpV7vETzYWjHBsCzlq1ydyeUntE0hJjrvbOkotgfB24t4yZrTUyzX
         43cE2u0Wf4Gu5Dc3cpAwLysvPgX9nlUP9QBdvy2RnUDyGV207oZWJ7pf4SAdoCT3yQ13
         mxFHSaNbDMPncJx3+0QhxPifvn3ypwyNTlXup30TRZzhHWb1BBAM7W7tArOR1WKDPDjs
         t7fOI0NxBoNq9chWOCb7iL0mGSdjScHZC6Vl0a/dbAovYMG3GeaM+rySJLE21ARf2zcE
         lzwyoV+XNAxenLmtDM46rWMHby0zn1BSwE8fMNa057mQUqchi+1bcUk3AOY+wQDpTSLI
         z41g==
X-Forwarded-Encrypted: i=1; AKwUvByk32Cect2FyfRci9QlpZ8BboLuiYodqwoA4xu2stSsd+QX+Bg8C3bJzu8btEVs0AuRx9JAPDalVtBx@lists.linux.dev
X-Gm-Message-State: AFq9FYKImw4IgXXYiZZmGFfSh77uIBCG3QpT7hk+GQbuZU9jJ8N5h5AE
	mCxxmN4WK3TnO0jJx1DLa5ziOi8AKMQKGYuroZxIQESg3HWNeFfmKM9k2BaOnEAdcfc=
X-Gm-Gg: AYBFou2li+M2xa1T5/n0XJSD7TwporZc5myx1XCygSd9cB6UJ1vIZUm3y+0+ls4+WvH
	oCHLM55EabmKI9COG5M1VMMAAPnC54a1k6wJeJ6KZA1GbCQvpWNrguqtYTe/6VNAGuJY8yVuuDU
	D2bPtrRSfom+aKAEuFCBLydot45fgtzNETB4c/62UwVnKOIIuQs6zK9wK1A25P787LpFLzWYUpy
	LuGYUFZ8hgr9UYIliPeR9YCAzqVWVrzjcKY5jVJEQHMbarcBoxSb3ScgqRkblniYuKAggJTb9VP
	qgZJSyJIoJ3DwtcEHjKkjDkx5JprYW4MmpYoBW2oDfrLOCvDr5LsFPPcFmoOVa85MmckoQypeIh
	RnbJiQ+3bs4BwOrbRenmLnz1trdsDL1YItS5xG6OyPFzZ42gboZ8r7DT4+uY2gNQkol8bWnyaPx
	1+MOSGC3BUwhg9b6eF13argmIPwzFseExifSZvwFMBPq9aaZToy/buUYxrOPFZgYspS8q5XyNfV
	rB7prROIaT6xAbl3e8Mdtbt6rSeU5WVQAoRXMNypWlLaNgxD1kBILlSCtDu0ApmnoCrqvv/fpQW
	i5mUQJhu+Odya3pC76ShqyvqmPZhurTAx2FSfA==
X-Received: by 2002:a05:620a:40c3:b0:937:d6e8:59b0 with SMTP id af79cd13be357-93f6f79bca2mr59757485a.10.1792694383306;
        Thu, 22 Oct 2026 11:39:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fb82a5fsm19367685a.8.2026.10.22.11.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:39:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJxhW-0000000FjFr-0C75;
	Thu, 22 Oct 2026 15:39:42 -0300
Date: Thu, 22 Oct 2026 15:39:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <20261022183942.GC3381610@ziepe.ca>
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

On Wed, Oct 21, 2026 at 01:43:24AM +0100, Jonathan Cameron wrote:

> > +bool ctlv_message_input_rebind(struct ctlv_cursor *nest, const struct ctlv_schema_tree *tree,
> > +			       u32 node)
> > +{
> > +	const struct ctlv_message_input_scope *bound_scope;
> > +	const struct ctlv_message_input_nest *indexed;
> > +	u32 i;
> > +
> > +	if (WARN_ON_ONCE(!nest->attr || !nest->msg || !nest->msg->index))
> > +		return false;
> > +	if (!ctlv_message_nest_index_ok(nest))
> > +		return false;
> > +	bound_scope = &nest->msg->index->scopes[nest->index_nest_scope];
> > +	indexed = &nest->msg->index->nests[bound_scope->nest];
> > +	for (i = 0; i < indexed->scopes_count; i++) {
> 
> 	for (u32 i = 0; ...

Is that allowed now?

Jason
