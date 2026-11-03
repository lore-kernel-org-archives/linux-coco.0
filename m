Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667941;
	b=GvqxW/5n6IhO87g2tTYSlz4GXGBIr86ewfXD0na+XcxFlMmgMcyYkQTOxTs2rw29TkzX
	 ilBTX/ekgzBwHdqfPUAV0aXUnXfFXqK8j7K9Hm2WiWPwjubbX3e8cjiIUfaLU85E2c3tT
	 plf4ugrwc4+O98kXNxtcqneI2LfVCRABpZIR2Rfng+JIhPJtxr0orhRxbx98IZ3kVeaVv
	 4knprTO56wKyPIKFLOr1FgBxm0rFWvIU/ex51BwomKosW19w3QAk8rC9g23UF7yunLI0Q
	 VRZTNLHNkZ2Jm81hvrSWXAYlhAvigyYBCeshNwYkvp+TVS0RG3dJbWpFETOLLzIFcpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
	b=26IMg9gGzUpTIkJLhEcN2Uznuph1V8IvIc/q+TP8QSSxH7xyonmmyuu2YALqNbpQ0Vhz
	 6F8SnGnwRk3OF2Sbv4pdOPxoPNfoKKiYuQa7kpJX2aPNOMuy5UhNESHCbcHOQC1Clyil0
	 ReXwmdhAxmfGyiysb/PjJtoEppWGj8NrZKeW7gBxERMjkK/N7eHvl4uqHXWXFb70XbQYF
	 SfcyVyCyzePXNnD0pjWPj+0q0Wjs1leS/6T6voXPJpT5bnjZd4RXHMMA86C5WjlOoWgjx
	 O3YgiwO+E8Q1P7AqHv5+yJldmhPBf8xVmCRpXz2AmAjemgRZSCBSQaSbgAlJ7/fJ92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=G29Sgx9z;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDA1606A32C
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 01:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDA1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=G29Sgx9z
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53c4b82919fso57276201cf.0
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 17:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793667939; x=1794272739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
        b=G29Sgx9zc0lxMFwPP1kTddog7TDnAZDNflgf2KblUzEgCX7l6L9lFfP4pEobanZ4jF
         2mywjPSLFo3s3NgrxpI1zoypjnNtndccnPEIEkZkQG8Yf71ojep6m5W5+FrFquc/iCdK
         yHSqHuj40/ZyEULEngC1jIIl0631P+naqBQuNX9nzQJRFhfz6EwGKPwEGk2GbNHZ7bzF
         JosbZT7oNISrtsMHCVMvhXUZ9NzxKN3mFAtqbv0PxYbWZErQwy0RdCEmKztWHyLaTqqh
         mwBrmb2gaG4s3/Z1Ct4nemBbPadplbc3htKECiamTA2FgVD02GwjY1vgj2Y5DiSyYwYr
         6TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667939; x=1794272739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
        b=JrCxxm6ApGfrJcZ66bZUa3aR24pjACZLlKTo2Y0tz2KK3O7CrDmPQ8xHU6xmILsWwY
         tNEhlxnycIpwW7n7qNJBsVuedVxUzoyMFxW7tc6pfGp9esHdzAe/JB5/UmtbC85lZZg6
         gG91M6oOaRWV1IHg9t580CmF8gydIhKqKvOjUwmkFRuJqoSFS+eEY1TWIK61ETRRy5k9
         kHzVQgIkqKCA6HD30RaRiKzGRWdad2M1eXdlVjvGExjiRIE0yzjK7URGAVD3dkpzc5cx
         pBBsEl/7fFp+1eZodz6vN6b6rRVjYA6AgvzqBKkSJ88MrKescH2+0Zq3tsoyTCgsm/N9
         42IA==
X-Gm-Message-State: APuU4Z/PcrZQ6tN8jZTU8qQqf1TBbteW3O2OZ4hXJaYOUGomtaQEx4aR
	Rz54tTyQ7gA+IhVVRTaWVgf5TeJ/LfBLLziRKVLJG3DjcA837Ssg93lO43GmweXBtc4=
X-Gm-Gg: AYBFou1vQtFgUnS6+hbhc0MqeNi0e90aw3zv09To5tpc/3wYFFe5YbZXe+wM7oCijvN
	h4/klCXgiOwk7C64PHdUtbrFRsEwJkYG1Q/QDGNipLFxekw1vAWmjebCbeh8R8yqhybzo9pqAT0
	SlprSBF7um5FaOafZfXTzQIpVnj/wqUpWm3oeEnjYRzwuN46A6gPxD6Q7AXG5bAgIwJ/Y0Wm5K5
	hJRJitipr1+hWvR6J40ThBRxSERhV6/HcuX1pHsOKbyFvKAFapUX5+pvQtSM4XHow3OX+64hoXF
	u+jxFz33lPfE8VoMELt0GN7cHl/wSXsGQ/P9Utn02Jtlzsp9/ZPg02Nc1FKOG4gYqWtTrqopRF+
	hUajplCLJuwLWJBhGRZJOYZmIckyAp4Ul/SxpY77fvIOGDwlPdDnOvrISXCFgcShmdINp7Pz1rB
	K783ekmZWOYFIY7Tc353WE3/PpMME0G0Q1J8uk7xdZa7IAfAmJgZs5zYAv3iCJ5i4CqUH7AwbdX
	2uPg8SlLFmW4HWU0ex2NP8tjZjqlX0RafRFi4yhTAcPhBAIEbrESioKknMzp58v9B1tA0mwfveY
	mEEubTRzkWUZ40jZGuGJOSY/hFw87ytFLDkP2MqwUHbOeeQT7gf2BEXn0aN7g1FcwqKghtcV7ew
	kPrUB+o/gbw==
X-Received: by 2002:a05:622a:4017:b0:536:64f4:45e with SMTP id d75a77b69052e-542b7525e13mr187886741cf.50.1793667939125;
        Mon, 02 Nov 2026 17:05:39 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb57669sm12221861cf.24.2026.11.02.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:05:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xO2y1-0000000BIml-2jCU;
	Mon, 02 Nov 2026 21:05:37 -0400
Date: Mon, 2 Nov 2026 21:05:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <20261103010537.GI3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
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
In-Reply-To: <auRmMPfaFINUIchi@FV6GYCPJ69>

On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
> >So.. how about could we drop the sets, use a direct description of the
> >layout and do something else for the ID numbering? Maybe the numbering
> >can be solved directly by only listing the names in:
> >
> >numbering:
> >  - device-get.reply
> >  - device-get.reply.caps
> >  - device-get.caps.evidence
> >  -[..]
> >
> >?
> 
> I'm still committed to implicit numbering. For "inline records" I
> resolved it by having it encoded as a tree with 4 levels:
> 
>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
> +-------------+-----+------------+------+------+------+------+------------------+
> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
> +-------------+-----+------------+------+------+------+------+------------------+
>               |<------------------ record ------------------>|

Fascinating idea. Sort of like an oid

I guarentee we will run out of bits someday :) I saw recently we ran
out of bits in RDMA :\ 3 bits seems like quite a small number..

Maybe increasing op to 128 bits?

Maybe family/kind/index/field spread over the first 64 and then the
Lx's over the second?

At the very least there should be an escape hatch so that if this
becomes too small there is a way to opt into some new layout and fix
it without breaking everything.

Jason
