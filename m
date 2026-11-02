Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623752;
	b=LOPqhvWebGT7mcuQroALfmCqjJrK/vP+0bTvWZCvxJQg2fzxB0WQgAt/OElw6qScDAT3
	 XVTMrUfyN8QThlNemsPrB+iRSjULFoyjIGcNF8KZvqApDV334kb7+Es+uQkQYPOYlu7ne
	 D7yGMg6D7vj7eA9A+HKBdk5maqk1peL6aDlyJH44RMmnLvRp9mjWmuYhRjFVyJGdrXicJ
	 rX5fm6BCJxQPo/JKUO0sjg0vIgX4id30JZ7DGuC1hi8KaQ3WHC6xZ/rUChdsHBuppU3gD
	 FmeSpwR9wG5qejHYt+Jxx6Kj1GbK3PUMY1lwHMqwfGJUM4mN7RxoD2FDZdf8SCgPxFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
	b=l0JP2g/4Pj3yKQT/SqGxufw9BpIYxCYqx0oEyDw32c+vu1EkSfmSP1lmKqW9F+0ZRy3Y
	 EAmhRtE97/TCMOk32dgJwUebhPaES+m3G9cB+7VHITJqNAm4e06BUJSPoR5jUGjOs7QzC
	 TsCl5mFOHYH1VubQRLOKGszxwAc6CREqspGm9rhq7krHYGNoSn3kAv9cNC4dYFhgDHz7A
	 WXI6qCdwDdW1HPfZjju+ztTd9NmEbMAEYsCkIEBr56mwao+RJyBTZXb+rz9W5USrLvexg
	 v/gCjjwICrtYB4Xnr3dstaei3OvRbwjoOCjp4zb1RK8HpP3hnowRTE0DavqkNbPpU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=aUd+m5gk;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33060A2602
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 12:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B33060A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=aUd+m5gk
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2608817e87.0
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793623749; x=1794228549; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
        b=aUd+m5gkI4S3tuC9Qyqej3r4a+dgf0UB7yQCB3E+1P4SwdETFs5yofHok2tXUPxUOI
         MIJJ3oOBE2DOyTqlPhmrwhleRNfU/uJXZ8ZzmA8Cb3mWXmpj5n0aA0R6yFl2PqPl22Va
         DNPCvK/DvXpwDUkH3IbH/VWnib+Lup6coZA1aeLXHnK9j3JOOEBHaxz02hOrhdgPKFLH
         Bb1iIzM6EPv7x25bJ+vGtoFeu6RucMtgj+7vuypAKpaYhscYLS03Pvm5n5+SQI9SWTD5
         Wor464hjU+EdkMlvGLHZVgFzeoumFmx6OY0sQjkMg8nZJP/SsJf15La1HAalmX0LQO/I
         y01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623749; x=1794228549;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
        b=wk82rVo74Rj+aMfcRh5KyDTPt7a0OoQcTFfudqdlO9h/U5XyxH2D4r/vjSkCSLx+aY
         ecUfwFbhnZUlqLiecSDwwEAov6fVn5ODYa78+H8SXPtimLuLAW5R0PNPYPnMNJoEJau3
         mOSlmH+KVtnI+VVGeO/1q84Lp+R1da70+ayd1h2wOKHltOP2tEBnv0ya9SOd7PwZ3efC
         Pll4V8eu79SEy1iUv8+6vv3HWVBmI667mqzNgIhRhzB+nQ4jV43JAEfG09Gzcr9LrH2k
         stTTnc5vUMlbdkM8Vft0Ap792fRvZiCy/E9xg7hKQS934a96M/UJjv1vrnJpQkab5dvK
         pgLw==
X-Gm-Message-State: APuU4Z91BhdmNrun4ghhKaKhcPVD3VQ+lymq7T0kdTh81gUd/ImDvX/3
	2l8JupOsWx2VgWdbNZYxNTYhrrCd3iDEqyBFaVwDY83xZfGDhwBGHefOzEAHKKTMlLU=
X-Gm-Gg: AYBFou2bXgV5RUUNlWMrMCGBvftYb1JQuPT/WKw3cCc0Vnc5lEBVOLdObfwTMfQ810Q
	AJ0kOtYUZR8Z4Eczxfk60nyBvP7tptFmUBMyPp/yaTJNMVHFZLWUOosGEfIXWFTFXiJ8Ud2ojRG
	2WV9OZcbyYu8Bl9Oug+GD8fqAB43xWQo9TidSws1iYm73b5v1KNjmvbTXdDnn8AqkpxFMnEGFEO
	dBMeROihn1Q92cd0ol2AHxmkZkQh1CeX8BjdNdF03Q/MeOAdXgG3xyVqQzeiKDVnjxbisH9is48
	DCED5SndnHEdWQfcAY/yO8p8FpCkGnioElrR7KQROW5f7cceqLDhxtUIXYPqGT1kANAP8rkaiJ+
	NyNZaN1WJ4srHcaZEDmUo9NjCt02wbF6phFkqZHIi3KHRaa+fqdGXqtCXS7fbDYihlbDYG/e5qu
	IY/XghIRHIIGyidaWS0IQtrVVKQgJJyfezun7n5baK8d4Wup76Yyhcyi+frqu6JrP8fiWYRrcv0
	k9VT/vJ0Y/3iIMBDewl7BYRupg1Yh9MR5XmEhoFmk6JjXBP2nIUx8BdWV+f52RM+Ul/owC4v2Nd
	k5d5cx7a3yuoY+YGyyJIbydWTA1rB6eOu8PHX1Q=
X-Received: by 2002:a05:6512:158d:b0:5bf:e799:c7f3 with SMTP id 2adb3069b0e04-5bfe799c920mr1589103e87.61.1793623749527;
        Mon, 02 Nov 2026 04:49:09 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04ee003sm1638014e87.7.2026.11.02.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:49:09 -0800 (PST)
Date: Mon, 2 Nov 2026 13:49:05 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 10/20] ctlv: Prepare event queue support
Message-ID: <auiGL-Xq72i5K8FT@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-11-jiri@resnulli.us>
 <auCbPdoaMq9oWoQ_@e129823.arm.com>
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
In-Reply-To: <auCbPdoaMq9oWoQ_@e129823.arm.com>

Tue, Oct 27, 2026 at 01:38:21PM +0100, yeoreum.yun@arm.com wrote:
>Hi Jiri,
>
>
>[...]
>
>> +int ctlv_event_emit(struct ctlv_op_ctx *ctx)
>> +{
>> +	struct ctlv_device *ctlvdev = ctx->ctlvdev;
>> +	struct ctlv_event_record *rec, *next;
>> +	struct ctlv_file *cfile;
>> +	u32 len, wanted = 0;
>> +	LIST_HEAD(spare);
>> +	int ret;
>> +
>> +	if (WARN_ON_ONCE(ctx->file))
>> +		return -EINVAL;
>> +	ret = ctlv_event_finish(ctx);
>> +	if (ret)
>> +		goto out_free;
>> +
>> +	len = sizeof(struct ctlv_event_hdr) + CTLV_ALIGN(ctx->output.root->len);
>> +	scoped_guard(spinlock, &ctlvdev->events_lock) {
>> +		if (ctlvdev->dead_announced)
>> +			goto out_free;
>> +		list_for_each_entry(cfile, &ctlvdev->files, node)
>> +			if (test_bit(ctx->op->event_index, cfile->subscribed))
>> +				wanted++;
>> +	}
>
>Suppose at the time of here, the number of subscriber is 1.
>However, before calling the ctlv_event_deliver(), another task hold the
>event_lock() to register new subscriber. for example:
>
>
>Task 1 (emit)					Task 2 (new subscriber B)
>
>wanted = 1
>unlock events_lock.
>						Register subscription.
>allocate one record
>ctlv_event_delver()
>
>  grab events_lock.
>    Deliver former subscribe event to old one.
>    new subscriber B will call ctlv_event_queue_event() with NULL.
>
>When this happens, new subscriber B would receive overflow event
>via ctlv_event_queue_dropped() though it was registered right before.
>
>Is this intended? It doesn't make sense that subscribe B receives
>the overflow event in this situation...

Not intended. Will fix.

>
>
>> +	if (wanted) {
>> +		ctlv_event_copies(ctx, len, &spare, wanted);
>> +		ctlv_event_deliver(ctx, &spare);
>> +		list_for_each_entry_safe(rec, next, &spare, node)
>> +			kfree(rec);
>> +	}
>> +
>> +out_free:
>> +	ctlv_event_free(ctx);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(ctlv_event_emit, "CTLV");
>> +
>
>[...]
>
>Thanks!
>
>-- 
>Sincerely,
>Yeoreum Yun
