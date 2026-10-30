Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354000;
	b=Ubsmutz/NB3uJ0Ww/jx6GmQSJg5+PtVCNOiV9UE5kpxg9NUGZ9xndDwl+I3mkIqY0Pna
	 MUaL3DiuYoswT+3d0la7XCBuiRjRHtqrhn8bcRpX3ML4vMHkDBllkQvjKQ/lgz3LUy3pz
	 gsdr+6h8v1lpB83N+Bz4KMVnRoiFkqdSwcFvIxHZn492OdXxkQ80q/KQw243Dgy9QSYZ+
	 r6uGZ8cRViiegkDBpfJ6ZkHEKR5LaZR0Xp7lkX8k+LeZ3IV7EPezIEvIn7gBo+MpWqm2q
	 6qvxgSYP+bVBANTipeiYKSZ7LPhH5jbO3OFVxb+gn8wnuO4EhKZWI6XfSz+tYHSDd0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
	b=aBxFwg3Fo79xbPkGNeohTKLRAyQFRwJ8iE6By6m0fpoohnBAcvtFIDhfkRPY5Af/MCxa
	 AyFH8geYqX8gV0iHCqJlvWpU/wMCIkEeisKEIFdn3SVaVsiMZ1GhM5GHLZ1tdXgtz2jeU
	 Ce6/1cJMmYSqOPc6ZQ4s0yfxJ+jVbZXXUnw4XiQs2krseNMPA+x7TWaCbpKWKUsYepMW2
	 Ab5Ia4EhiGKAjqkZSm+m2HcE/8CFTs+ZyGTyF3jr+BLZQo9ndNJ5M2uBQbBsJN9cHEJhK
	 i+E2f/0PKKW1y0nPWSnJ8nQkbUR3y4ULOWMRwowTTvMoAWfagP7Yd+oROx4rhsJidog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Xk18Lzib;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7D60A2601
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 09:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B7D60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Xk18Lzib
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso5108185e9.3
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 02:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793353997; x=1793958797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
        b=Xk18LzibqlJl1npEv1HwL1zIdGSZ48YOguD9MGlCgRKUNp3B8x7x3NZupgoMy3ex/d
         79mmRpxFtvMZHeVyMlKBJnBkwUfOGOtzg3xZUBrEIJfai9i9Vlz0oce/iMMXtXH1Nvyv
         J7h6TAfMM960WahFq5+xuE7QizJewnUNHZM0u77fwqrwWGayoHehbei1Oeboui3GaYxs
         wbM08DyLxnmg0tNJkKK+DoR3qU5jLSB3Z/sl6GZGtkgVTjApuSE7u2JdNjDrTdL8Ppdr
         AdMVR6B071vODpVJ4DhSDIAtUNZU13zlZLPT6tH9WwzPTVFeCrS0ekOFhd2g04ituj81
         xzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353997; x=1793958797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2sVz2kekigEwFuAjOAkuOKnCrnayEOdl/QGk0rPw5eA=;
        b=UdGTUGARRr6ZI1qg8hHfbhEEi2UWsunrVA2yTMPFHTCb07HRenta5Ph/LHQsXYTBs0
         yDXn/Ng1DXRLMT4IpCd3M+BZVN5dzWoaz4QZg4iVwbQLWoFJ4YFgS7DjPA8d3exbhmPE
         oWiQ6TIE1M8nD+lECf6vaWIS27l4EwgpEW65FqG6tCW23tf0PhA6puzrHIQuGT9WknYx
         p82vWfr2HsQoJ2oJJHyD9LHUJvOzj+J0E0SfhZ3mEvKkGcA8HOukZG3NGEV80BWcrIi6
         gSk51ngIsJy9dkDrWVUlaRH5+eeOB5ZPEIFvveE/T6rxj0Br/Yc25ymAqEV28lcM4LEb
         ZH/Q==
X-Gm-Message-State: AFq9FYLJX3TVsD3PmeueI9rLDbtHb8w7W4sPEyznhnWdaHzi/3pRi85U
	hGYjRYkAPUQvGaA2P6qGH8FNz3LNT2Z+1QOaLRPQF7E8WhD8LbPl61c8gNozpnB5Wc4=
X-Gm-Gg: AYBFou2mC5OFAF2B13zQF/x7OKAGbpajDOgxW8fsLJdi7j9Ra7fpesY4HY/UD7DGuAe
	SeX/SqtwCkNrWTrHkqeVFOQXnzNIIrFo10qyQ4a6rqGtmsLXqa/+HR2su+yiWS/DLUkVUO4HBga
	ONcVtm8ejU0ocVyEUTOZpMDMp5Rfau7KMEnNH3zc0KFRYDpoJAvTi6wbFto9cBjASq0rGSzBgUj
	jdrLq4mxevsr/w8QtQj1kWW5acETFMVBD6Gyv8aF3zyUjPQEdpP0B08md+DfIVFb9xy+GC1blFS
	a2ozDc3Fzxhde4mxY6EDZymYEN8+U7FhIQ5jXRhl30cvOi6ORcwXIp3qSSzgD3Lx/84kNRnJJ68
	NAqRIt2GKiC+TDMF+nhjXDnOgNYNKz1NQp10dgX/5Sb2FjNOyy8xD8M0ZAt2GiWvnT+h6r09u+k
	w06NOKPUnPJl3vXWO9ws9OhqjVnrK23UYfomsjjHw4J8PqXiV+SfNaqJnajqHFaRnZ1LlJTba33
	3t+XCt9vvCdlZQNu/efrsTyg8kxXf/znozFlh9TK3VXXr9tXwaDSqiRjPg4xT53M7cJKjkboJFc
	mz66ljUy3Z+1q5BLVQtPhqX2iIyTDglIp3KzTF+Dx4gOOvIHmsH1ObKeFx8=
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr37419475e9.32.1793353996568;
        Fri, 30 Oct 2026 02:53:16 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm127578065e9.4.2026.10.30.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:53:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:53:11 +0100
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
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auRmMPfaFINUIchi@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
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
In-Reply-To: <179302367452.58760.11808905856343064399.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>
>This isn't even that complicated, if I ask AI to explain it in a C ish
>language:
>
>struct device_get_reply {
>	struct {
>		optional struct {
>			uint min_challenge_length;
>			uint max_challenge_length;
>			uint max_total_output_length;
>			struct {
>				enum blob_class;
>				string format;
>				enum representation;
>				uint max_length;
>			} objects[];
>		} evidence;
>
>		optional struct {
>			flags mr_flags; /* read, extend */
>		} mr;
>	} caps;
>
>	struct {
>		/* device-info: filled by the derived family */
>	} info;
>};
>
>I think the yaml names are not helping, calling everything attrs
>everywhere is really confusing. At least the transition into a nest
>and an attr-set should be more clearly marked in the yaml..
>
>The yaml would be significantly better if it was layed out according
>to the actual semantic flow instead of artificially being twisted into
>this need to put everything into a linear list. AI invented this:
>
>device-get:
>  request: {}
>  reply:
>    caps:
>      evidence?:
>        min-challenge-length: uint
>        max-challenge-length: uint
>        max-total-output-length: uint
>        objects[]:
>          blob-class: evidence-blob-class
>          format: string
>          representation: evidence-representation
>          max-length: uint
>      mr?:
>        mr-flags: mr-device-caps
>    info:
>      $extend: device-info
>

I have it implemented like this (with small changes). Looks great!


>So.. how about could we drop the sets, use a direct description of the
>layout and do something else for the ID numbering? Maybe the numbering
>can be solved directly by only listing the names in:
>
>numbering:
>  - device-get.reply
>  - device-get.reply.caps
>  - device-get.caps.evidence
>  -[..]
>
>?

I'm still committed to implicit numbering. For "inline records" I
resolved it by having it encoded as a tree with 4 levels:

 63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
+-------------+-----+------------+------+------+------+------+------------------+
|   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
+-------------+-----+------------+------+------+------+------+------------------+
              |<------------------ record ------------------>|

Renamed "attr" to "field" - I agree that the original implementation had
attr everywhere. I got rid of it.
"group" is now "record". I enlarged it to 32 bits to accomodate:
1) kind is one of: named, request, reply - request and reply is used for
   inline op records,
2) index for named records (pre defined)
3) L1-L4 for inline records

rfc2 will show it in more details
>
>-- 
>Jason
