Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ACF5383E7
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179119; cv=none; b=dKLi4EN2YYbFYxdIIsC1BczU58tKfEutNCuGphQDV3/DOXPNT3rZgBDaqFMF8va44VfU4cvQG0oLHoPOQPA11ndK/ZbfC3qcTkQFBFz6PzupPsMrrY84jQfUB6GskjP/hGsxcpXlBtXh65fY0+LUoJQxbDYGQF82ItL9M+b8sbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179119; c=relaxed/simple;
	bh=0PfK8JMSkVzFLf8e2q/WRG4SF7QVJLAT8oXdBZ/vtT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhnUm6ILKbvD2Vb2yVg3vSkPd6pdHIBpTOLv/73wWHummXJ8VLJl9cfIbT+Z5VwXmQ2HB7PP/dYb55/rqt6SnNxB6kmkA4i6NUTLtDaXUSBJhZkdJ6dgaMHWnro0jpDN0MgdTR/8OzWMwQd9zCflNf1cct33O2dO2arJJs7zH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dND7mHFd; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dND7mHFd"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895eaf306cfso13702337b3.1
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790179116; x=1790783916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3dgsIcDJ8p5ZJDPUatobQL/ESNNZ/DHoKBc/ZFp4ms=;
        b=dND7mHFdq3D8KiP1XoD3DSdH7auqS79uZwBJU2+IqkXbBFPwJ/vLx/9wrMH/RKBh99
         wF1P8wefXqH8hH9FL/FnCHd1T4X4ZaL6lSHzRpHiS3oc1qm2vwLZrA2rytLeGMg1syzR
         kUOkj2gJ+Qte+IQiRYObkPtKK+OHQ7EwQUzOX95J7476Mu10Luunu01cUE8Z2sCpuynm
         nzMOPmhURk95Tj21RnY34ggy1FtpEHnW4+EpEj/IjXttrqHbqK6nwZ8UXqv5AFeZutF8
         1QxjsljcPgyIkZkY5Z1HQapvO0oAaiMWokOtyJ40MvtIDixiLbJiVsUb+058lRAc528k
         b2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179116; x=1790783916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3dgsIcDJ8p5ZJDPUatobQL/ESNNZ/DHoKBc/ZFp4ms=;
        b=HcRqEKDe2LGkY+pJYuTVYrt5hYvxJSDaxkMy/hkzvgg3m5uQFyPNL75UKfsK0Uvobq
         H1vF0O1g7f6a/WVmhUTeQ4HUlTRhSOjGNWqTSggQ3Ucmbl4ImasfFkecus4t2VF6EuQU
         H/K7Ldl45YW1y+nEyELdSyQJ8tE9i5sJAs7RndqzW15UxnLZQpEykVptfEbhywCn2hp+
         Bsggk87dCW26xhIvmT6ArMrOyZFXRsf+5QUgVMR0Ccx4iX1Pxi3B9B5pxQES2+fgTuOK
         hR7vKY1I5dy+f0auUxX/Nm8nNf4MCIGiuBVxrGzixrZMx9YH4fwX/nrLV0Z+qxJm6ygH
         x21w==
X-Forwarded-Encrypted: i=1; AKwUvBxiJht9nQXp7FxLb2rruq51xpMP/2HwcI7+sTHFziCUTzNZZsvzdR4ZTjAVqNnGUQN4nlDyO0c6hrzK@lists.linux.dev
X-Gm-Message-State: AFuF++ni4+SZ6X7xekh+f9D795xiv3flyMug6wj+jEqBqxb/gJWV1mcf
	Svmu8DnZahZTEUfVfVITdZY/n6GexJZH3Xt0Ujd/vamOlCFMB7QDFdgWiCTaSBbXBzc=
X-Gm-Gg: AYBFou2ODOLxSrP0uEAv2EM/ATVnxetff3/d4GYs/jDyRKYcIKwFQy9gyCbR9qxGHZx
	f7wnPVx/tmtn5n7Xtt6AkUtR78Oxjywua9LcgX4mPRd+5iKSRGz0hF3zTF2J8bBZgCJT/44IlJ2
	cfXPwhoSWc/TJec16K9pSQxXgo037oAgn//5vxnpD5cOYYxiK8+fXQYnOGZo0zew+eE5eB3j7wu
	S1AstMHaniqdAIdZDWO7iZWmn9A1VIkSBOiYtn22Fn6lqLob/GhP/EHl26VV/hqKz365CQy/Xn8
	QGTJDLzQzsUgSf1QPS0KUnJft8Tvi4kLIb0yeirz6aTB6rnpX3uWEkAyfVyrLbsgQazDORdXJ7r
	rxgutOk9gI2uIEfsAhWyigw8lcy9lTOWTXO2OYmlQT/7lfPFuVr5fKKV0OKu4S5hAZAGnUDfcFw
	KqMtlYV502nvsgyc7+KWu9nFwl+xLXmR1httj1vvExN+mt
X-Received: by 2002:a05:690c:f07:b0:89a:63da:fa90 with SMTP id 00721157ae682-8a45bb7ceb7mr18084857b3.75.1790179116666;
        Wed, 23 Sep 2026 08:58:36 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c72f3sm11900977b3.17.2026.09.23.08.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:58:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9PMg-0000000DwaY-36Ny;
	Wed, 23 Sep 2026 12:58:34 -0300
Date: Wed, 23 Sep 2026 12:58:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for
 shared buffers
Message-ID: <20260923155834.GK1540250@ziepe.ca>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <aq1sT2EDsGaomqST@arm.com>
 <20260918165754.GG11599@ziepe.ca>
 <yq5ao6do36jk.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ao6do36jk.fsf@kernel.org>

On Wed, Sep 23, 2026 at 10:31:19AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Fri, Sep 18, 2026 at 05:52:31PM +0100, Catalin Marinas wrote:
> >
> >> TBH, I'm tempted not to support this configuration at all, just fail
> >> gracefully if the realm page size doesn't match the host's. However, if
> >> that's a real world configuration, 
> >
> > realm != host is going to be fairly common.
> >
> > host > realm is probably not that common, I would guess.
> 
> Wouldn't it be more common to run a distro with a 4K page size as the
> guest on a custom hypervisor with a 4K or larger page size?

Maybe someday, but right now I think the 4k hyp is going to be common
and people who really reach for 16/64k are going to need to run !4k
guests too.

Jason
