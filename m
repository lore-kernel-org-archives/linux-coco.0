Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADD14A33E6
	for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085840; cv=none; b=pd3DE6puv9XoZ2UXR/x4rAAdY08xD0FsKDit6QFJOV6W8wKj0lKaeIiiFygPrjzAKtu5a/CyQIwXNkC+Q8r8t3AYWXYO08djVimljZ5LwpDVObOhow4lOjmDorw9fj9srocfmZjVqp3/hlC8bbpvBVvUt0gUp/meMT1FQ+U7hQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085840; c=relaxed/simple;
	bh=OLr+uTnUVK7S9B5QUknUbFXuyG9qUE76WCenfq8svv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myvTQwPD/Ivkx0bryWBFUsACSSYJCrH8/5LzmXTurAWvMa16c958/mKu+KjI4pb90yz/zvmVgxMh0bM2ZVjb9n9PTvBjdw0Eo3FffnFtrbTfKfr6CWJzP0xtdoo4ez7MmBui8LCt2XyCsfl9d/W33P6XYCkbIZ269tNXCaZZZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EsgfNtYV; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EsgfNtYV"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93efc0452b5so123372985a.0
        for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792085829; x=1792690629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLr+uTnUVK7S9B5QUknUbFXuyG9qUE76WCenfq8svv4=;
        b=EsgfNtYV+GSoPlnrFqOrBGmVhHix2R6QbQL1ylIYy5rnoCv6Fyr8C8e2LAJJRvq3Aq
         KP8j/x5GrjPs/2nlGBzQirxhpCFR2dsV1x8kb2ZFJlETTCiWvfLospiv7FjHIw1nc9Xn
         9sHNpDMGp0Y+0bSkT7ULOcQIzMrdqtOy7mi7SSDCUQTp3+MAplwHVbqxv/8d90uRGc7q
         X9nlPp7tG0cOevj4ROx6V3ilBtujiI6C5Wbp9d5fxZrIhnvnYbXBW7mN3xTbsvBPMM2s
         EP0qTDrxh/AfTQRmKIoBS1O0Xp/URxUNC5BcRYNVpqY73yO+tdUksecQnc2XB3617bkz
         j0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085829; x=1792690629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLr+uTnUVK7S9B5QUknUbFXuyG9qUE76WCenfq8svv4=;
        b=FRoY0FdqIQzpoJJRX7ABHwJ96wIztHmJCcc+PDI6lXDXZOxw/Cj3u4Kb5tOez8kHyC
         q5Se5Ts+BrW2nL2HJKk2O69bM8bMGF9Cgtc4VB9KOMZcZer7Y1/AZTdm+mxqnjqLGtfG
         3C6VcEQsmIJ6/olpe8hKOuJanUx2tqx7vO0PrqmLdLsFHqwvZGPr5WX8gssAjqyRajAf
         TuLxjgCq6ymfNeuT+JHhS99uuf5UCFAT7rwaiWMJ+7XpTbz+V3RibRcQE8h6PoZBFBUZ
         LFrmJcSlHcjGd0KAB/NzYQg9eWuIjyRmE2nMWYogwcxMPTZuOOqd/3hAX7py8wZkE9Q/
         mDCA==
X-Forwarded-Encrypted: i=1; AKwUvBzpv0cfWOQ/G5p1RideKu6k2DM1gPz0eIBnA5y4D6Grqyxx2jZhUmnBWbWDM3GX5zwwB1FoKwjdky6H@lists.linux.dev
X-Gm-Message-State: AFq9FYLekn26o7tQ4Uu0pkkBLUrZ9SFBz0SO5Zk3fASHwzAu2YB45BAA
	zYbQTuCuWiAO/uG9yxkV4CnbMM0WPpOrP0GMV/roPpd3bme+onHWFxOnMBBgv6F5Ivk=
X-Gm-Gg: AYBFou16jy922H/NLmDch0A5neW2rnxdYP6xvtO1AqQfr9+b1PY07EBz6eacjaNL0q5
	VXxk2jbvdE72m/8MQo2RIsDNjlAiecveGOpSjK7xisQ3FGulqxGK8eIaCNQ/kmokWD9Q2owkq7z
	qcXL7GlwuasYxHpmiF+7z98TexX3iyfitEc+sVSa0VrUbseXMBDL839ESjJW/AFV3C0OjU0mWmf
	s4sknqzAQIsoKOV5vDjJEDAAxcpHi9baHGGT4BqOZagSuu73lb2HQX0R0itUoeZM/VnWkdsp2IJ
	mt4WZI7MsIJ8AcyOXYrN8JpkjC/KBM2Es9eNUVg6aBX4mc6/HIJ908A/7dbEcEDV7lViMpCKfPR
	GZI0vD8wbE9HShkDvUd40W2cqfcXHDXp0fG+7cF0mXAEl0dIxYJfcMxIPN59k8huSNODSinPu+r
	r88z6hLsZBHBAnxHgEkfMUtTV6FoD0zT9SCC4r6y6on7Pxqs9IfHB0n9FgsX+09dtDQUY8TR2zl
	fV0XKEgQvBja/JB8CRbLdgQEc6os1ArP6RG/LvFUvWh3/17HOgVVKFC
X-Received: by 2002:a05:620a:469e:b0:93e:c12c:fbce with SMTP id af79cd13be357-93ec12d06a0mr3209910285a.74.1792085829213;
        Thu, 15 Oct 2026 10:37:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5086fe3sm818646485a.37.2026.10.15.10.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:37:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHPO7-0000000H6B3-44RG;
	Thu, 15 Oct 2026 14:37:07 -0300
Date: Thu, 15 Oct 2026 14:37:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
	x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	Kevin Tian <kevin.tian@intel.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, xiaoyao.li@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] coco/tdx-host: Initialize trusted DMA on all
 capable IOMMUs
Message-ID: <20261015173707.GV14213@ziepe.ca>
References: <20261015010705.1973284-1-baolu.lu@linux.intel.com>
 <20261015010705.1973284-5-baolu.lu@linux.intel.com>
 <atCPY6LzHd4y0Ywh@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atCPY6LzHd4y0Ywh@yilunxu-OptiPlex-7050>

On Thu, Oct 15, 2026 at 04:31:31PM +0800, Xu Yilun wrote:

> An alternative could be, bringing up one IOMMU when an associated
> device requests link encryption. Then a no-tdx-support iommu fails the
> encryption request naturally.

That is what ARM is planning to do. I think it is reasonable to
trigger creation of the secure iommu when the TSM is connected to TDX.

Fail connect if the iommu could not be created.

Jason
