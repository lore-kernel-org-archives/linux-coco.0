Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815030;
	b=eR895uOSlBj56eVEE6tSb0g1QLGbaxPkiCfCDXdi9ThZhb8NVkQEXnPa3NC62VZC7YVl
	 bkmUeMgunxOfo865Ehjwi9ZZarEsQuDCPUxzP3XNVPGXS850YuTJ9IBre26bIfWQ+ae8j
	 iPCd+nsyoOfq2aY7DosPABBXtgg1nVDOH/yLFXxCNwd7lYZtmxH4+V2GktnboyL8w+imv
	 n+8AQsoso1DCmJXdLAWY5zLzpPpPzRr+AbabR1dW+2GdjqE5NPZsf1Q/IVivs03xT2CD0
	 igzTtrLsRl5WBNEiXRJm6xsmW4DSVApHHtbY6/DITimWXG1/MumB1GAN1WJx2uopA7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
	b=Eu/8L/Ku8YJ08v6IJrON8RcB9uvDGMJpgKKiU3qEYyzPzbi7+U5k9UYuMfMkWl3BNJy0
	 tUbEyT2G60fyz0JCSOErsk8qPxRfmrKMzasGnepnWnsZu9Ae6evFV+/PPS3hDD1Ae86vL
	 VIe+XS14zlorUgoME++nk5KImX6f/SXfevC4IJDhI0nkJiku037makNlnyWISNXDwssTd
	 WabMA3LG63wrUQR7DKGUSjWf2rldV0TyWhZosNO8Pa86v8uDIVRSfsZcsFcnxjZvLFx5a
	 b5WSGB/Z3e5Fm78gD+2Maz1U+u+Azm93YJXVCUUjcDxlVF5cWsIo8EwGPzfrtGe2eQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MBRWrDJO;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017A8606D82A
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 17:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 017A8606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MBRWrDJO
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-537548b811aso7316321cf.3
        for <linux-coco@lists.linux.dev>; Wed, 04 Nov 2026 09:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793815029; x=1794419829; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
        b=MBRWrDJO+zx9Ig9ggBNqos7yIEgACrAFVqFyX/Ib/yrOxMFWGEM/WBGwEyNPY+uukl
         EbM0+QjnIuwSwk9WUW9mN1OSeoYbZwarsGoPOsj960cciGQXX3EXnNLGptSzbuUJ+aa+
         nFnfbOwKVyNYCfBX09ELjsx4VFrEc4Jw0dIuO/DblgR63etFv2FacG8H37eOCLp9HyLj
         8horBUAkJQZyg7AdQA7CtfI0XO4A80vJyHUJSV8xctUv535yvod71O2lO8ZSDYRIwamI
         cGk7m7yi+6L0VNPal9+W5DvNu0B81L4pdLz6ausNw0Kw4PUEXtW5oPJRuwoO25FDFoL1
         gfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815029; x=1794419829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6+Lf/8gHZf1IKHjq4H+ss02XIxxzMA/c7y+z6oAgJc=;
        b=tQBraMo6N4T7dGuto1Y6Le1ovA5QpspNdaXybu1e38YOlwUq1vzf4tSuQpyZfZSOqo
         Qlocs9rZexRLbrzk5dYDz6ZwehtmTKsrqaUDDj4p/TarDSL1U0yJhbI9HvmMIqbLFb2V
         OinFcYcnubuklnevCkRzq3CqYSuHNSEZsvKZNE2XDeD2PsI7+dro9NevCwqNfCgh7VqN
         rWouydvGltbADMi5IZDu/fg9c8TQyGeKR6yCJ2mTWHDfcOQBSyXHW2FxFuZHw/dpVLi4
         O20W4nhj9KairoDuVc8SpDl/+rJH/VCv+GArYbfUm0B8Gz0RBHc9xoytoMJsfPZ5kHyo
         i6UA==
X-Gm-Message-State: APuU4Z8iV/vL06QE6i1uFKmjrgW2mIcpzIoLCnlV63MzFq4xN/agH9v7
	dhQtStKGLIBM7tGzpQK08rsm/W9FkvQX+pLYbK/m0iTYfriGnEh2GyiQX62FGtvvONi41ydeFKG
	xLz1Q
X-Gm-Gg: AYBFou17scZmpDEwIH2K9fmN8yn9eJteCrViWzQhKWzrTScRlDWefE52TX8m440/75u
	jtP3hO4ogQm+wb9PpcxEx60lzuHTqsJV5pdEDvvi5h6yckWFI0EqrKvj260zg5zGq0TizhNJ4y7
	iUBNIT4ycrys2dPU75ZKwl8PSgiFFpV18TNsBtlQtJxoF+NRMVjFMNgBwW7o3Hf7NLosCBgtCui
	SsD3Z6dzUa7tPmzNQyMk+hIEoEeMWCjW0zeP3GukGrBRTGUJyQKls/w6Om/S2uBzpUTJRa0EDg4
	+34NcV52+YPyp7Ttev3DW/UnsAC3rU1SySE3j8STMWNjXy0i1k+nrVbJIFxweORUFCirRrXjr58
	Nb5ng/dQcqgIBSMWPG/1TUjDqj17Zib2dvt7wy/g4U7HelzojHHbvCagc6roROlBmLMS4QFjlU2
	5LrOkSWc9fF/JkGAQO67ZwbfBjprEbrbbbmMd9xQwni/dJ3Cj9D+6UDFbir0MD0yg0/gTZwstA7
	T4j9BtVkSNe0OEU/YDDNeWTtURP9Wp6doTEjYbLRAi0lS+ImVIFmBJ7eNEgiFgcqOeR7jv2IdHc
	xG3NDtpgDG6qIqODDqfw5V2rrrHigBGzDJb8ztH2x36fuFjdK8NOdujCTnGnhO0Hl94qqjpGd4u
	9aJyrp8M16g==
X-Received: by 2002:ac8:5f08:0:b0:535:baa:a78d with SMTP id d75a77b69052e-542b3a728c4mr272645741cf.10.1793815029017;
        Wed, 04 Nov 2026 09:57:09 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a6ca24sm30262291cf.14.2026.11.04.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:57:08 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOfER-0000000H210-48gw;
	Wed, 04 Nov 2026 13:57:07 -0400
Date: Wed, 4 Nov 2026 13:57:07 -0400
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
Message-ID: <20261104175707.GA3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
 <20261103010537.GI3889730@ziepe.ca>
 <aumogVKtYnY0QJ2r@FV6GYCPJ69>
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
In-Reply-To: <aumogVKtYnY0QJ2r@FV6GYCPJ69>

On Tue, Nov 03, 2026 at 10:29:45AM +0100, Jiri Pirko wrote:
> Tue, Nov 03, 2026 at 02:05:37AM +0100, jgg@ziepe.ca wrote:
> >On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
> >> >So.. how about could we drop the sets, use a direct description of the
> >> >layout and do something else for the ID numbering? Maybe the numbering
> >> >can be solved directly by only listing the names in:
> >> >
> >> >numbering:
> >> >  - device-get.reply
> >> >  - device-get.reply.caps
> >> >  - device-get.caps.evidence
> >> >  -[..]
> >> >
> >> >?
> >> 
> >> I'm still committed to implicit numbering. For "inline records" I
> >> resolved it by having it encoded as a tree with 4 levels:
> >> 
> >>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
> >> +-------------+-----+------------+------+------+------+------+------------------+
> >> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
> >> +-------------+-----+------------+------+------+------+------+------------------+
> >>               |<------------------ record ------------------>|
> >
> >Fascinating idea. Sort of like an oid
> >
> >I guarentee we will run out of bits someday :) I saw recently we ran
> >out of bits in RDMA :\ 3 bits seems like quite a small number..
> 
> Well, this is just for inlines. I think if user comes to the point this
> will not be enough, he can use named record, as he probably should with
> more than 8 inline records anyway :) Also, we can introduce "mapping"
> mechanism to allow inline conversion to named record without breaking
> userspace. I just didn't bother to implement now as it is a theoretical
> problem now as I see it.

Oh OK, thats interesting.

Jason
