Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022506;
	b=5XtxvWEH64S0XMLgqjCeoWRhTXF3w3xfpUJ6JM3cbBvMMUkEUvELKUT0IuqrkkIr/Jst
	 l6GylDxAHhP1QZY/rB0ZOuVCjEW8M12MoL8/WqFjyjaKXx+z1Gnw14LvXlCT1QojY3MDV
	 Urvmzw3N+rBf0YkYQrdXXznM2l/bmLskF2cAEUJ/7UJJCIj6QYSkDYs8qFY1kjMHZs9YQ
	 xSLRVa6KS502J5h0qGTELpoALLM49CGRbCzAJ3zWqtWxEVFju0a4mO3hUZesvalcaANo9
	 6uTLsrPc7R672ypW4RuQE5l6l3JB31pcLTLMB3VRG5F/D4va/6KDyfKWvoIhGuNELtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
	b=q97KH5PBooAHxQFObBZ+SyZ+5kCj1X+FOjJvWYPMVzW7+F4+/LgP4AQhkbLmBVB5Yb8R
	 76MNrCP5ACHy4UW0ZSGUnqHSIym+TyXq+PeiSqgMgtrLyWO5N1t1pZfwzXhsglVQMAg1f
	 HeB/DupUUKixv7QntLXax6f9N060RRNJfnJ2oLLmaq/kAasQNiNsxlpsVqATq5nIbXPEH
	 xiQt/gGM7i+wK8xxaFJ++zlS/uX30yf6ZmjcCaxot8BT/vnbD47Qerv1zdB7zrqbdUDHu
	 bs4qjUZfrEagGjbAj5bt5Js4RG4e9p2L+e1AiXEab/YvbqkYi8+0epI5dt7xLfD+9Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2563606A31F
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 13:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2563606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a208d93758so35277955e9.3
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793022494; x=1793627294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
        b=bPO3ig9gHHTc+uTHBEjamW0ddd8E99V2ICk2kINvM0545o50r5SQFc2U3RRC0akeUo
         +i30zOS2nk5U/y/LmjXmqVmZV38QlQ/zUARY6Um1bqnGw0/J6kavMrq9ZjGcHkChnT98
         l2Qy/NGZcugwL/i+GcFwjeU/IVGc83GmzGlxpRjVH5rdrupTCy+0IkUtEp/xawH15ZXx
         gHtLtqHmPj1bTREMBtJpuMbCxufZA+3MW1vt4KdM2FTsXGBnToODewCWkp5ygmdZ2IhL
         gO23IlzFUDJkBhAQZezNCRZhIsYq2xyDZoZ5hStn6lfko09fYNyFUHLwF1MZwE8d0aCJ
         NIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793022494; x=1793627294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeiDIzKBgXHTvIB/FzTge64uqO1p8vq38QKemD1zDpA=;
        b=0ms69PSnrvS7PhkL6fpUiuBWel62CvBliQToDIZT6Ok911kmmsgJbsiE6QWal+CDlG
         Cckd4xa2rDJpAlS4iLamta2jbSKifnGIej77vUaolXDT3RqZ2v4/v4O+j9gGDA/pz4Bl
         bRb387QeYHULABoVXkj7xoB+vwtQ62dtqxIyZLXZX33D9Uh06hXlAYPh//RzHiQBz70d
         VVQSQQyfGQDnvuolhYiV2fELzUyGjajnKg7SsQenQg4uvjdhIB7pxe5P4RftsxkQ7C4v
         qysHJRPwdm6IsxxmErf8C05XueAR3J0ozr6DpkfAp64SdlK2+v6YPBnbTzC5rsZ4NYWS
         DZ8g==
X-Forwarded-Encrypted: i=1; AKwUvBzq4yA2yyJnDHh44KGzpV07MQQv/wP8Cn6uhTlozKbuKyDHXMKJKZDEtQXuEO95NcVHB7uvXeKLir9s@lists.linux.dev
X-Gm-Message-State: AFq9FYLiCKT+8Ti0utONc+rpzeQUFaadepklOCGCKndsRvM8SDyqOC/U
	eEOBOIV0VOQBS4WYXPav7YM5dJMG/xRz+90Askpy0uqThMxV/Git3ajCjHkm3CUPXxU=
X-Gm-Gg: AYBFou2mS+JC/XkYeVZ1tCEko3kGDxqBSRtGbL2IakFEteOT1yvF0WNgC4f0C0ue3y+
	i3clGmyLxuQmUbkg4hyzKhqYS/0zXD3bqk2KGzRRjwmFjygWEFAVBDD/rpjXKNa9bKMmcROICRA
	3gH5ToEHCyXHBcMxbJ4MEpRzMNyzMQ5q+5NtuGJxvF46PXXPhHgISTtoCHCKljIkzCg2HHSibV4
	c4Km2YpDpIl4HDLPQrre82SUI9PlvdQsvk0eDYt5aCJiITC+1KDsrP98vPRdcrfvOq9XAARk3/r
	+I7TwXEyDvGFbN8vijIRy+SzYIbejaNzXBMRB7RXTOVoijQ2FRE5UL5c4+xZy5hFt2YSEmnOAsc
	TPzrwowvnyG91zQyXkWEMTHVI/Aj0BvnFD5WH0wXmiYEqHbo+B338z8nTthakC+IfLXBy8w5xSj
	43mlnE3UBBwGcA74slB1Kqprtlnrgot/agkqJ0iwNjgXLJ5EmLWsBYYfL5XLHFvJx3u2U7/lr8K
	ga8YUwkNDWOWOENKXWNAx+E3IKM2oC+ikmk5YPFdI5Rh7Z+buNPpuwkZ6T+FK0Y
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr104469535e9.33.1793022493724;
        Mon, 26 Oct 2026 06:48:13 -0700 (PDT)
Received: from localhost ([208.127.45.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm107133535e9.3.2026.10.26.06.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:48:13 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:48:09 +0100
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
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <at9ZEDZl89V0jaJB@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
 <20261022184313.GD3381610@ziepe.ca>
 <attZl_0TNMDLgi4U@FV6GYCPJ69>
 <20261023142633.GF3977851@ziepe.ca>
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
In-Reply-To: <20261023142633.GF3977851@ziepe.ca>

Fri, Oct 23, 2026 at 04:26:33PM +0200, jgg@ziepe.ca wrote:
>On Fri, Oct 23, 2026 at 02:58:33PM +0200, Jiri Pirko wrote:
>> >> Jason did some nice handling in the fwctl stuff for
>> >> device alloc and hand over after device_initialize()
>> >> (I've copied it into a few places recently :)
>> >> 
>> >> I'd like to see something similar here as it made
>> >> it easier to follow lifetimes etc.
>> >
>> >This is really at the wrong layer.. Attestation subsystem is the lead
>> >subsystem, it should be allocating the struct device memory and the
>> >driver should see the typical
>> >
>> >  struct attestation_dev *adev;
>> >
>> >  adev = attestation_alloc()
>> >  [..]
>> >  attestation_register(adev)
>> 
>> Er, the driver would call attestation_create() which will be a wrapper
>> of ctvl_create. The reason is inheritance chain and each parent being
>> passed info to and doing its own init()
>
>We really want it to look like the above so we get proper container_of
>stuff.
>
>struct driver_attestion_dev {
>   struct attestaion_dev adev;
>}
>
>driver_adev = attestaion_alloc(..)
>
>Don't want "create" to allocate the memory, it is upside down. The
>fixed memory ctvl needs should be buried in the attestaion_Dev
>
>struct attestation_dev {
>   struct device dev;    // sysfs dev inside class attestation
>   struct ctlv_XX ctlv;  // ctlv instance
>   struct cdev cdev;
>
>   const struct attestation_ops *ops;
>}
>
>That's the essential skeleton of what a subsystem should look like in
>linux, ctvl shouldn't co-opt it, it should embed like cdev does.
>
>Look at fwctl for reference

Yeah, I understand the typical flow. I just wanted to benefit from the
fact the ctlv has the inheritance chain to reuse it for init/fini flows
alongside the private structures allocations. It saves a lot of
boilerplate code and hides it inside CTLV. I admit, it makes things a
bit obfuscated for end user (driver/subsystem). I'm working on
conversion to what you suggest.
