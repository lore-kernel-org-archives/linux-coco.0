Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659847;
	b=UMrROB/Y9x6CcthB5bVqD5MwZU5G8qlhLwvgwwaDhWx/2eEAK6X/yxhvKh9TfAd1PmwM
	 hHfmh1MPmmE1jKXoZf9lNCWH47RgKtIsfhWN0YGorcmPIastUh6dEzz7+yoM1fEqmgy/S
	 pzYsArR1u1YUoqOTYe3ZIZ4xK93u+IWz8nFG//QbyCrbQRubk7eJHRzxtjLAe9x/FWDUu
	 5j04ghxQI3nEV0HShU+sKh/NLA3qtn1D3eIQMOYq0jJc4yS7PqjZW0UxJG97tVPdnhJYv
	 RfHmhoJHQwUjHFwuX8bWp1QeugAOuLMtkE+RvYOJCncoKETbSTQsXLxMLJ/L2icsuTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ywQR7I909P3DB3xy2MhLfJ7Uj6kbu1uDVGYoaUPJ8FQ=;
	b=z08zU53CxXIUJqCPiUmsHd3pCpXwHiAcHDR++MVbY1DGAa/FxFZ/J+eTfvR2ZqElMLEs
	 cvTZJGEdqYNH/hZNf15lJ4ddQi8OHAVpxjzM1uLOKWya27TvomU04lwoPXEMPw0NlHocp
	 hnnqGNY2TsNT2EpgHk/pnRPQJK6C9vJYXHY3bEb+Zgj2Ei/b6gY0VpIFwrAHnCL1PxOZ/
	 Jichzq1gE/JJiXDJjlLSBzQ3j6KN+UMS4VRrAbpj7EmcPQqDlXiIpm1fOsuvBf+MfTOo5
	 +wKq9UAGhnznz0N4kOakyHXfuG1EDEDfh2bE6ipPoRL516WMFyRMxJxU8AGqw7aU/5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=BMcvjdUp;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90C606A31E
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 09:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF90C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=BMcvjdUp
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b060ec084so1209912f8f.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792659845; x=1793264645; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywQR7I909P3DB3xy2MhLfJ7Uj6kbu1uDVGYoaUPJ8FQ=;
        b=BMcvjdUp48SI1wGg1hVsb99tAYt9tsQq8d0z3vqAMQZXTiFcRoOYcH/f+8AwCd6jMi
         vk8Z8EEBB4crK78ZW4YyhLeoA75q6ILkYECHKHhtue9zXBKPeCsQy8GuTyo5VAXFgohM
         G+9i0wjGyCEfX/oJHTlblf+WJegxBfuoxh4cRrF2gd6lFRttRi4TtFnmop+RGIAoELjG
         JFpw2CSvd7h5KjB4BtvnjdUS5+YKQWQEp1NXz/9fsiOa58ZjN/XCVjZ+B3g3zzSbqTsB
         5kEZaJq5HU8idA/iPOIe45IiEplAVqar5fgoejLYUKZegFmkDFQJ7aVQFI2PdJNcY2QM
         G//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659845; x=1793264645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywQR7I909P3DB3xy2MhLfJ7Uj6kbu1uDVGYoaUPJ8FQ=;
        b=BWPijf7cDZbR8kdKDZDLkvE2sSpBhsMUZFaFKyLNLLwwav0CAqlFFZD0XBVsHSyHGQ
         BLsqd+PjEhNGBVILbEdVEfIQ+S9FuE46ChJv+ZRuPwh2J5375X/CvEu3iu+ZoQjEe2FE
         fARR82Xh6zHh/saoZaL+JURhVLwI+OZGMZ9w090OegB1Y9hCjrKsnbJhb1Yafpj9bTjl
         dK4Xi6PbXK0lm9qjuwix2kOYFta4lATvjlRQJEipL7L9+4Fkq8QlDss1XKFgref53rGD
         1vxAxXizlDngSMfWtvZkV2PgSjl3T4SWY6o59G7El9BWzzfk7GAqoRbI69LVyAUb/AdI
         AM6A==
X-Gm-Message-State: AFq9FYKkFYuprP5fh2TYCnTzjDkXDBpGUNRm31+uNcGbw2xh4GiXYgK8
	d6M5B+uHKSipB0agSEAaNVdZ1dis8izvpSsHYiceFZ3hGbG4kcpEr8fHI5weKt54AYo=
X-Gm-Gg: AYBFou0g6HXwtpeYr+QpQxc4JEzzIhLJdjwtliCCklhX8K7UFrzlXme8miKyPSxKDui
	Oms7Oc6O+ZgRv2aJomkdlxaNUkVWPYgR1jvBd3Hi2gun3/z+uZvKtgnDMBZtH7EVAAwW60niSTo
	NrzoZ8vIU47h+oY/IMqcgXBargB3kwExb/mKL5Pfy0Ft0INA2hWsKouDuvzgocWJqYVEMI2/p60
	jkpDwZtCHBeZYI/DgSQhZBF/asw6CFd3sy5ICxdOGf8GkkmjyXU3SqSw5b/mGPIyXBgTjA5Oa9h
	9iGMotO1zJXr//Cw0bOTHLEqq1lHRtKOY13FRVrALZEveCNdsMnZvZ7trFFrlauhx1f3ahHaYbT
	vPqSIFFu4j4JYop9AYl5h8qb1aGOoAnVaMnt+1TWHLszVA/XlhhGeKse1mcMkngHDh4MYsCdaqW
	fWsOIYpoMaJLsGiRaMs4jLdD1MBp/VR8bMVU8J6TxIL5o/jabeyJT7aB3qpieK0RQedxmIjmeka
	ksfsr4F9AeKGZ9aTDMMU5dNHM8QcvFMZNsJORpEacndRh5uikNDzdyEm7RUy2XdXVEK2+XDZUj5
	AZAGx3fzsQ==
X-Received: by 2002:a5d:6f11:0:b0:48b:9d80:53a5 with SMTP id ffacd0b85a97d-48e2649399cmr9647538f8f.10.1792659845013;
        Thu, 22 Oct 2026 02:04:05 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2a034fc2sm7010484f8f.5.2026.10.22.02.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:04:04 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:04:00 +0200
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
Subject: Re: [PATCH RFC 10/20] ctlv: Prepare event queue support
Message-ID: <atnRAOJFuw8WqQ4Y@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-11-jiri@resnulli.us>
 <20261021021208.6909d4e3@jic23-hlaptop>
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
In-Reply-To: <20261021021208.6909d4e3@jic23-hlaptop>

Wed, Oct 21, 2026 at 03:12:08AM +0200, jic23@kernel.org wrote:
>On Thu, 15 Oct 2026 16:50:43 +0200
>Jiri Pirko <jiri@resnulli.us> wrote:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Add per-open subscriptions, bounded event queues and event creation for
>> CTLV families. Add the generated root family kernel bindings now that their
>> message and event helpers are available.
>> 
>> The event and generated root objects can be compile-checked here.
>> CONFIG_CTLV remains unwired until device dispatch completes the module.
>> 
>> Assisted-by: Cursor: GPT-5.6 Sol
>> Assisted-by: Cursor: Claude Opus 5.5
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>Nothing fundamental - just a few passing comments.
>
>I'm running low on time, so will take a closer look at
>this in a future revision.
>
>> diff --git a/drivers/ctlv/event.c b/drivers/ctlv/event.c
>> new file mode 100644
>> index 000000000000..0f68d33e031c
>> --- /dev/null
>> +++ b/drivers/ctlv/event.c
>> @@ -0,0 +1,713 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
>> + *
>> + * Per-open event queues and loss reporting.
>> + */
>> +
>> +#include <linux/bitmap.h>
>> +#include <linux/build_bug.h>
>
>cleanup.h given you are making quite a bit of use
>of guard() in here.

Okay.


>
>> +#include <linux/ctlv.h>
>> +#include <linux/ctlv_gen.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/list.h>
>> +#include <linux/minmax.h>
>> +#include <linux/overflow.h>
>> +#include <linux/poll.h>
>> +#include <linux/sizes.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/string.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/wait.h>
>> +
>> +#include "builder.h"
>> +#include "device.h"
>> +#include "event.h"
>> +#include "internal.h"
>> +#include "message.h"
>> +#include "schema.h"
>
>> +
>> +struct ctlv_op_ctx *ctlv_event_create(struct ctlv_device *ctlvdev, u64 op_id,
>> +				      struct ctlv_cursor **reply, gfp_t gfp)
>> +{
>> +	const struct ctlv_op_entry *op;
>> +	struct ctlv_op_ctx *ctx;
>> +	void *out;
>> +	u32 room;
>> +	int ret;
>> +
>> +	ctx = kzalloc_obj(*ctx, gfp);
>> +	if (!ctx)
>> +		return ERR_PTR(-ENOMEM);
>> +	scoped_guard(spinlock, &ctlvdev->events_lock) {
>
>Generally mixing anything cleanup.h with gotos is
>a bad idea. Tends to get Linus saying your code needs
>restructuring even if it isn't an actual bug.

Okay. Will rework.


>
>> +		const struct ctlv_family *family;
>> +
>> +		if (!ctlvdev->events_live) {
>> +			ret = -ENODEV;
>> +			goto err_free_ctx;
>> +		}
>> +		if (WARN_ON_ONCE(ctlvdev->active_event_contexts == U32_MAX)) {
>> +			ret = -EOVERFLOW;
>> +			goto err_free_ctx;
>> +		}
>> +		/* Admission pins the op until emit or abort. */
>> +		family = READ_ONCE(ctlvdev->family);
>> +		if (!family) {
>> +			ret = -ENODEV;
>> +			goto err_free_ctx;
>> +		}
>> +		get_device(&ctlvdev->dev);
>> +		ctlvdev->active_event_contexts++;
>> +		ctx->ctlvdev = ctlvdev;
>> +		ctx->family = family;
>> +	}
>> +
>> +	op = ctlv_op_find(ctlvdev, op_id);
>> +	if (WARN_ON_ONCE(!op) || WARN_ON_ONCE(op->schema->type != CTLV_OP_TYPE_EVENT)) {
>> +		ret = -EINVAL;
>> +		goto err_put_ctx;
>> +	}
>> +	room = ctlv_event_len(op) - sizeof(struct ctlv_event_hdr);
>> +	out = kmalloc(room, gfp);
>> +	if (!out) {
>> +		ret = -ENOMEM;
>> +		goto err_put_ctx;
>> +	}
>> +
>> +	ctx->gfp = gfp;
>> +	ctx->op = op;
>> +	ctlv_message_output_init(&ctx->output, ctx, out, room, &op->schema->reply);
>> +	ctlv_message_root(&ctx->output_root, &ctx->output);
>> +	ctx->deepest = &ctx->output_root;
>> +	*reply = &ctx->output_root;
>> +	return ctx;
>> +
>> +err_put_ctx:
>> +	ctlv_event_free(ctx);
>> +	return ERR_PTR(ret);
>> +err_free_ctx:
>> +	kfree(ctx);
>> +	return ERR_PTR(ret);
>
>Two different error paths also tend to indicate code needs
>a rethink and maybe splitting into a couple of functions for the
>different stages.

Okay, will do.


>
>> +}
>> +EXPORT_SYMBOL_NS_GPL(ctlv_event_create, "CTLV");
>
>
>
>> +
>> +ssize_t ctlv_event_file_read(struct ctlv_file *cfile, char __user *buf, size_t len, bool blocking)
>> +{
>> +	struct ctlv_device *ctlvdev = cfile->ctlvdev;
>> +	struct ctlv_event_record *rec;
>> +	ssize_t ret;
>> +
>> +	/* dup() and SCM_RIGHTS share one serialized queue. */
>> +	if (mutex_lock_interruptible(&cfile->reading))
>> +		return -ERESTARTSYS;
>
>	ACQUIRE() magic should work here and let you do direct returns on error.

Okay.


>
>> +
>> +	while (!(rec = ctlv_event_queue_take(cfile))) {
>> +		/* Drained, and the device is gone. */
>> +		if (READ_ONCE(ctlvdev->dead_announced)) {
>> +			ret = -ENODEV;
>> +			goto out_unlock;
>> +		}
>> +		if (!blocking) {
>> +			ret = -EAGAIN;
>> +			goto out_unlock;
>> +		}
>> +		ret = wait_event_interruptible(cfile->readers, ctlv_event_waiting(cfile));
>> +		if (ret) {
>> +			ret = -ERESTARTSYS;
>> +			goto out_unlock;
>> +		}
>> +	}
>> +
>> +	if (rec->len > len) {
>> +		ctlv_event_queue_untake(cfile, rec);
>> +		ret = -EMSGSIZE;
>> +		goto out_unlock;
>> +	}
>> +	if (copy_to_user(buf, &rec->hdr, rec->len)) {
>> +		ctlv_event_queue_untake(cfile, rec);
>> +		ret = -EFAULT;
>> +		goto out_unlock;
>> +	}
>> +	ret = rec->len;
>> +	ctlv_event_queue_consumed(cfile, rec);
>> +
>> +out_unlock:
>> +	mutex_unlock(&cfile->reading);
>> +	return ret;
>> +}
>
>> +static int ctlv_event_subscriptions_set(struct ctlv_op_ctx *ctx, const struct ctlv_cursor *request,
>> +					struct ctlv_input_ref ref, bool subscribe)
>> +{
>> +	struct ctlv_device *ctlvdev = ctx->ctlvdev;
>> +	struct ctlv_cursor attr;
>> +
>> +	for (ctlv_input_attr(&attr, request, ref); ctlv_attr_ok(&attr); ctlv_attr_next(&attr)) {
>> +		u64 op_id = ctlv_attr_u64(&attr);
>> +
>> +		if (!ctlv_event_subscription_find(ctlvdev, op_id))
>> +			return ctlv_op_errorf(ctx, -EOPNOTSUPP,
>> +					      "op %#llx is not an event this device emits",
>> +					      (unsigned long long)op_id);
>> +	}
>> +
>> +	guard(spinlock)
>> +		(&ctlvdev->events_lock);
>
>That looks odd. 
>	guard(spinlock)(&ctlvdev->events_lock);
>is more familiar form to me anyway.

True. Will fix.


>
>> +	for (ctlv_input_attr(&attr, request, ref); ctlv_attr_ok(&attr); ctlv_attr_next(&attr)) {
>> +		u64 op_id = ctlv_attr_u64(&attr);
>> +		const struct ctlv_op_entry *op = ctlv_event_subscription_find(ctlvdev, op_id);
>> +
>> +		if (subscribe)
>> +			set_bit(op->event_index, ctx->file->subscribed);
>> +		else
>> +			clear_bit(op->event_index, ctx->file->subscribed);
>
>		assign_bit()
>
>> +	}
>> +	return 0;
>> +}
>
