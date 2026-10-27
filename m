Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096254;
	b=R8nOksDwzOHx/ZIeVflcwbEwAd5lzj+BPd+yDd7d3i6vIwm25AXaJ4aTUV7WDRaa9EdJ
	 1A8ALNoIAGWLlbMdz9cUbov+abOy/JpV6qVwpb1nlM49F1tf2IQ6d0zKUWKNJkA1F40XF
	 gPEJJbW1ew95VOVl8GU6ohViZ90w35L2XDbz0YGL2mOTlMTHwVydE7SaSiZHVVQn5SyuP
	 +6hX0rfgSAtHwWE9CTta/0+SLRF8jV00PMXksjleq8nrQmJ2L0LpixYlXKtUa4IE9fYDH
	 WHUPkoYcDgXhd7VNgdMv9kWqoNmSuB8xVxR3WZ0sux90/XmhF0aGkZUeeO4V1ISs2ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
	b=4K1kaiWBCtUNs3wKoBS0zqZQf++OvXbskMmSsAScInRvgKX71sXJS30pvo+Ol2gPAQgf
	 8DpHwPlu7OZDaiXeaWuTh5qtIKKoxis0fkeCDKyFlYjF3OUan3qOTcqkGQIBvNEWwnNdv
	 DfEfCFmYJoa/xVsBFB3q43DKyQKZQFDHghFFiN5kZYw78HjEQB8LcB8N61rsA5yVBdMnY
	 feVsTKfDBRSqZm/GU2zYDXx17UD78HW1N9Z0nSGyqO7xcepfWDUKN1N4o52P8uGI4T+G/
	 MkSjDoStWM1sk1udgAXBHIRxIU5gX6cKwPd31D1dSOt4dE6iaW8aH+GUS3FeDtOu4SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=psKF4nWx;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14ED606A32D
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 10:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D14ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=psKF4nWx
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so30880415e9.3
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793096251; x=1793701051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
        b=psKF4nWxEeBo6T6q+3oApGKcRkgAYcooEgrN8gbBsVChM80WpnAqvwK+oJd5dpct9T
         JmPC1cEisIq6JQeV5LPp6bYy2EsUG1Y9VOav5PmyBQ6Nr5YJQi4F5uS0F4HRgor2BSxT
         x74ldocLR+ZGedrBacAP0yxi6+LTAhcc7UMOC113jv0AhiWMulTZRUndjYoSzmnySzLE
         3IFTCUXol97jrSmRpWN3vuN4t5bmUnSpr8/z0Gab7hFooGAYyZ5mqVsMMtCQ7g2PbWHB
         qU2Nv+pNbI5TpavIoo6AC9aVjMsdyNBhGeGPmXlfwK2lxvDnlmeICHsoRAGyiM3/BgHo
         eqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096251; x=1793701051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
        b=RM3klM1uzw0XuB4ec9o3IdnasEJRx4weVuuqFbxtdx8OZsRzKPvsQcMG2x3wJvx8gd
         qUp+LO/CAw8R+89bQjsc3BN5S1P9nxK8AiwFBz9SNLutzC1PgDDWqXBJpALRoml1v5v2
         EyQ++9dwS4tdRdIOTwv6fQZniaBwgv8m/M48WBsNW1V5yLoThSV3GcHWNvpKv0fbwIJP
         5veNN4yd8k87c7rOeWEulQ1K94pj4HJ9kkm/eV+q8c2YU1ocAAhyxuO9teylvCNwRkJ3
         m7GN2YFh2YKBLyaOiqYLdNXxzmRT1/1T/Ugn+ArX7dbyXvl66SFGQw0kUSNWUf5raxP9
         WMYA==
X-Gm-Message-State: AFq9FYKBuFD8SvKGnCtkhMBxsiJM4l48cETpwjOejj69cFHYNkmv5JGz
	6iuE5rvXQeRgjcrOLmvnxuwV8Emw5XdZpSDWZEV8ltT7QPFF/qj21oPvbiAxPISUP30=
X-Gm-Gg: AYBFou1rG6aZuNNKeBYripdn9ebe2y7tQLjzIFG+FjyT0lOwuWUAuV96P5YeAQm/Hyh
	xT7fOaD8UJxE0w7AfjbQ3mjIoq37dDQ9NdFQys7/9eOZADh6lLCPRkWC8E6vXnsXvNYq0RE9SIW
	cdyIAgnDoGtzz7Lr1M4YQM6iXQip4ARx5zPqxagXhOh3q9+ak/f1h6+nH6s/vPSfU9E/uuIho7r
	DKD7BMZQGkdNehIQiz7Duwb67iM/yZWWBZcBNbiOhTaM/i17IWa+RZl1fDaZ8S1gXsrcA3sIWME
	enYl4QcXnENswSujdQK68RMCMuoNiVTRqbuw/QAiGMr6H0qw+iXr5++Akhc6PuBhPswkJ10b2hy
	2qvVGHtq1JKcI3lnYzLW5dy2rAY8sZF3MmDWGPM0PT8FS9DpezQ+Q94laU30f6Z6uEX6mhSDkrC
	vQJ1sEXiZeLFVNYljANB70O33MptshkWszP3l3R8SOk7HTodVHxMG5dM9YEi6+ok65wG1jz2f/c
	YoiVwfZ+h0DNjAfrmwCD/dv9Un8kvgEBw7HsFg3k5Jh6tPIGOqMitvYL4Q8tw+e
X-Received: by 2002:a05:600c:4704:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a35acc2ea1mr170116035e9.35.1793096250940;
        Tue, 27 Oct 2026 03:17:30 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm271453735e9.15.2026.10.27.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:17:29 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:17:25 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <auB5yxcuA50kg5x4@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <179302367449.58760.13616210130636541456.b4-review@b4>
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
In-Reply-To: <179302367449.58760.13616210130636541456.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 38 lines skipped ... ]
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
>This should probably just be a simple selectable config instead of a
>full blown menuconfig. ie one with no description. Since this is
>really just a tool for subsystems to use every subsystem that uses it
>should just select it.
>
>So:
>
>config CTLV
>   bool

Makes sense.


>
>
>> [ ... 159 lines skipped ... ]
>> +static bool ctlv_message_nest_index_ok(const struct ctlv_cursor *nest)
>> +{
>> +	const struct ctlv_message_input_index *index = nest->msg->index;
>> +	const struct ctlv_message_input_nest *indexed;
>> +	const struct ctlv_message_input_scope *scope;
>> +	const struct ctlv_attr *attr;
>> +
>> +	if (WARN_ON_ONCE(!nest->msg->request || !index ||
>> +			 nest->index_nest_scope >= index->scopes_count))
>> +		return false;
>> +	scope = &index->scopes[nest->index_nest_scope];
>> +	if (WARN_ON_ONCE(scope->nest >= index->nests_count))
>> +		return false;
>> +	indexed = &index->nests[scope->nest];
>> +	attr = (const void *)((const u8 *)nest->msg->root + indexed->offset);
>> +	if (WARN_ON_ONCE(attr != nest->attr))
>> +		return false;
>> +	return !WARN_ON_ONCE(scope->tree != nest->tree || scope->node != nest->node);
>
>Maybe wrap these invariant assertions in a helper and we can compile
>them out?
>
>  #ifdef CONFIG_CTLV_DEBUG
>  #define CTLV_ASSERT(xxx) WARN_ON_ONCE(xxx)
>  #endif

Well, yeah, that would probably make sense.


>
>It helps manage expectations around WARN_ON. I assume these have all
>been checked to guarentee they cannot be triggered by users space?

Sure.

>
>-- 
>Jason
