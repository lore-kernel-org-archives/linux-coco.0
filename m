Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372580;
	b=5mKygdVNT1c8PHuJRzfrwribWcRR0eW3Fimfp3yg8KQOZRcUMr5t2d4GLQjho8Zf/BNp
	 cE73mvERQT0FtHwbldYt2rcuqePyPycjDPKQl4FmYtL8jrfPQOC8E+oW+ZWYYAwbda2h4
	 UMle2QEsR8rKGc+ElPkLrRNSlSYM8H5Si27490vzfWfUZJ0ETbaxavVpG9g6mCqKSDnFy
	 DPB/P42fE06+Afy+UTx/T1WcHpAOTcbu1rWeiKyOy1PVU0jAz8CBXKeASh3UYUI2hN9lo
	 0JjgRu5jrhtGC5WdHS/xlGg1VoVES6Dr/S7QNSOGqf5x4EEg8ppK4L4d1RMqU6GFd9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
	b=fL4hytg04NwmktaB5sLp+ReaM4zDOnb6rv7FkUGwF6uxqBKpGeKgn2VoROjnQ7PgZwpR
	 MZ4sginyPlqNGXQEzwiSWlZvO91d3CEe6p2mhH0TR0oD+5NAG0w6haloTCoAAWX5xmsqi
	 RkexU5ATlKH1MS1hZqaxJNA267glYkGhBE1/Lzc4tRzR+MMLgp3lGmCCZhIhvVAKTvLrM
	 ujN6HeFpK5gJy2o7hJLRLBsSh2jzWFvDwQ7nmbnyLveZz/P+USOrWEasPZnUhT/0HB8oE
	 WvLWAhhE/iEk3nEm8lqJ83by9TdrdbzwVBvYHPrRk9fRkOK2Pa1UpCrt6Z/m7RuVTVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=dZpcezAx;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA0606A31D
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 15:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FA0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=dZpcezAx
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6262725e9.0
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793372577; x=1793977377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
        b=dZpcezAxZyLDW2VhP8lxjBNWPh1Eu2uy0Km2l8dMPwf3//B45+L6Tqkv0IoUwbVutR
         zM3ndGIE4Q72wObF1mFzM5ze8P1u+f8jVvY2PYq+eA3dgOjW0Qjd6mTe5lcOtne9Wlk+
         +ZCFwHwkiqgExBj6bqQg4rJbjeOQ3EFux7WPZjXuRGnZjEDgve45pUfu8PyRsuDRN5VO
         K2npMnbDFJ1cp40+qbLlSL5/5gBZm/MQfSTlJsb/s7mmM+kBKiUkWZfHWVkJGzGQjNWa
         JphYjJawCdUFpuzNFC39mjERISudCteBXEmPADOTuzMv4WqSd0+6p/1LMVn6REAnGV7U
         jQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372577; x=1793977377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
        b=i9h8m9umCSFcYbbmr9DaVHEqrw/7s1xt66PcE6qecd+yhtqtxAQRbmTWrFfKHuza+p
         lQNLwmbiiW/0JsPtQd0L2Tlmw17xn5FVDcUnrt8XpfS1SU4/Qz4vIRnNFs0gRfuBrdvA
         2zzzlCw42UkHc7gpXX0o2sOeJVqHr4fmnIycDkW+iFmvjKOG4SX4c1ZNgc/3TXiFrxoV
         Ij1LSUUfPIqkSHBmuex0+9IpmlKgJPn94k+w3RL0nQNY7cvhj3oT3hCwmQxaWLZ2jMMX
         u3d+kAiQsmwT88Lz0k8gvONQEIX+iu3YnAYIkkrYVPfacFv8LpCZ/DkfafhwaK9EFOPX
         pElA==
X-Gm-Message-State: AFq9FYJxLwyvVSaWqhvwF7pPSSUDS4OkYt8PwX8LMjZykABC/NTKC+J8
	CPjzMKCyuCvCgliOk94g5aNg0eWKUl33oJqmuKulvZgEOyeRWth2apRJAFU6Wl7uajk=
X-Gm-Gg: AYBFou0UOuYy59SBStzd+bheKBUYwt2Gr/AMQHayvF37ENV2x4iKZSVjSoB1RN4koJ6
	fTdafKZsUPmoH5LpEN8+GsP0iBKfS1Gae+3Sfl469QYZVAypgGO3mhyBPyEJugsRZo5BoK5+boN
	CCWkGOkBudzBrFDy3GpzhTunb5pTovUP4n0DDSqTOG4d9rVn/Tsy6pxNo8HHp0Ams25Aa1kEBju
	k0QnuW+mp9I0NAKWFXoCXpVoAtT+D/uOTbaU1pdA3WoacLqiAkDfBsc+lo/GC6aklqac7v1QZ3e
	wVvKEHOKt9+RGqnZJQg7cSshOXtN6ofprP7lzxBNOzP8pp37DP4sr0F2qPPwLDhzEJu7fOYPvE4
	wsP3LdcfLDaSgbZHgJie+rL4gjqqMGr1ff4jrXimYpbvoj2P/e7FdamirxKkiGcLYtu3vm5bbGv
	kzCXldrUKHF1UGgIrA7yTwFRuytvL/wY+OOrheD3Dgkq+d3vYBcJTW2PWqYNfnIb+zs1r0WbN46
	0lzG7v++BSdNKTHa78Nad7hrby+TIt5oy1GBrSPM4YsaI/DXZi713GzmWBZPJzFT5U8cfIrcaRA
	kHwWdabvFZfMTCfT4AonUkpiQ928V0QUr34laGwN
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr55863395e9.31.1793372577101;
        Fri, 30 Oct 2026 08:02:57 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm3623785f8f.36.2026.10.30.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:02:56 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:02:52 +0100
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
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auSxhgC30bubNJpI@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]


>> +++ b/Documentation/ctlv/abi/ctlv-attestation.yaml
>> @@ -0,0 +1,184 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Checked-in ABI snapshot of the ctlv-attestation family, written by
>> +# "make -C tools/ctlv abi-update".
>> +#
>> +# The checker compares this family's declarations and inherited stub fills
>> +# against this file. Updating it is how a UAPI change gets reviewed; an update
>> +# that removes or renumbers anything, narrows a bound, or makes a placement
>> +# required is an ABI break, whatever this file says afterwards.
>
>Have the generator emit a line showing the original yaml file this was
>generated from?

Okay.

[..]
