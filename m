Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9312511235
	for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750683; cv=none; b=ig/zNehBn4nvlFaczVTST7veHJfFKGB8ygUvqsrmEA0jjDC/mNU+8Gz9p7xKPWBq/qJWUhpP7S5u+ezd5LEJdJXuYQjdWakTcsWysIlDnMHy00wiRVNpG6cpX9/d3Ey2qtEjURtxBxJpwmfA3S37HfurpTGLWMc/GiZK/tLEf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750683; c=relaxed/simple;
	bh=6pCoeSjfIM1AWSdeWFfupOCaccy7EnX/IEuPyibjz0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VX1SKtyUpwrgTk0oyoc/JHCPd3KnVyHMX3NTG6tdruDfK7xOPo2h1B90L+tcysvrqiegbH807Vzoi2YxRJMDtuK6wBZJUduJkQh9ffi5ye35CA6mBFqpQAjCAl1WZ/Q/bBJBjAFwgiZMQgh20VQezHE2OFIxRky6tO/W1Bbiwko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EYyE62iZ; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EYyE62iZ"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76906adso12081561cf.0
        for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 09:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789750677; x=1790355477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xg8bxcCx9Xplr0VksHoJCXIx7eh2ZBKcRPIgfCbqvCk=;
        b=EYyE62iZOx9YOxUvHZZavua+NH1hUoSwUO4Kq+WoEYAleNzn3SZ+6g+YHgvPmTtRy1
         Jzxp9cx7FI48pc+CD7Rb1ptMU43a0u+V83twfnWU6ZsuyCqD0ywyoS7Uu+m5r8sN7d94
         SVsiVwo6DLVGpt2soH24COATMfVo8w1EkIKw+n1ay5klN6/wbyb8S+UUPMc/IdnlqTiG
         IP2d9jvJepWxHM2KoaCdOPuw0w7jJu/kGOEl+3GqCMrl45ZvDI/m+NuX4sMTapFAKCNF
         Wnfae0zz7mXMvlv5GV+65gKp2A5uxC1GOQqLHQlFSkWly2ekhmHjBIw5iA6UU20yqez2
         T7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750677; x=1790355477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xg8bxcCx9Xplr0VksHoJCXIx7eh2ZBKcRPIgfCbqvCk=;
        b=aiaTtlxNp7Rk6yeHBSfqHDWTsFPU9+CefJqOC3D3n6ZeC/HTTlM1hfWzYJH9d6+iCF
         +Kkx7fAZmnyQowcDyH9TTITlmab2D1IqnpiaMTvf+BYHMPciAUYTQQeb8lqjBiOvIDHw
         HDMzTxWZ1MyDlYrkCdWy/QAW9iseJea+SUx6A8+S1fkRvkjQXK0k86CCAD4g/wYX6Xfj
         yVtv/O6ml3Vfo4Ggzk9nYKOQw3g2DWrbo+HGu7rLEyzMO0WhnhFC4Q45USTQ19yGoj6C
         Td48UnvRdCYXRqtueyxCAhtS2Ee4FgHecyEmOut43xoobG0zJecLDjgZBRGHUczHwJsD
         5FUw==
X-Forwarded-Encrypted: i=1; AKwUvBzsdwHHm8uMbBwWCenvrzdez9d1I2DwRRvFshWFWVHJFTBINC114JH4Fl8lAu+bJ1mH2IUOUEiHMMef@lists.linux.dev
X-Gm-Message-State: AFuF++nLZWne5ssBZaRTav1KMDRqShq1JIQw7N5y01iytYXxZux7em1X
	HphUz1rMaiM1PPr2DbfCaBP3IF8wsrRPADWfjj2yuXsIHBM7EeOSgAcdL3Mm04zh2Lk=
X-Gm-Gg: AYBFou1GG5GSJHtfP1HJ/ftowXIT13dcQa/tpobAJLlwQcpQWdzueioVbjv4zCgZCcb
	H4mJ2AlxE3twD37pW0G8etBGKl2kNESt2sc/fpcq3yzEtgnAAvkfkdr9nvSYgpLsWS452dn56wF
	SxZnvLzZHrWtcne5YuIAioerygPwr3IHXlILShWtJ/YUARGUs4jCSocdK8msu6kTbaJkKW98fRM
	P1HC+Bju2JBkJfQUmLeFtxAHxYjPS+OufgMjo/q9hsPSQ4I9d/rMDIbgVs6utyCjgFqLesnbDNu
	z/Yh+KbV6KfajF5TrQ2iNaikFry9hE8I0k9AgbCsgbKMrhybd0CaMJMVlsl8EA7KbIqfV91FfvE
	SxPA464iGgnOG0HuUCbEY1+OzgqFQx7Znw+DTho+VDnNlkCv81A7vGkbyoUKZAsBd2F75EdML4q
	FR41ihS82W8BYvEcguOxq0g7KQlAHwJhiWOlJh1WQnPowRuH+nm7avHNDlziLpzeOzZVndrkcQR
	vHn3CDiSPodfgIPpmkjaiQgQVYXgCQtDRo0sRL9ffMZxVW0ddD/ogrT
X-Received: by 2002:a05:622a:60d:b0:530:9bb:54ae with SMTP id d75a77b69052e-5329e259e51mr55816971cf.15.1789750676599;
        Fri, 18 Sep 2026 09:57:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae2c6a33sm1773871cf.0.2026.09.18.09.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:57:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7buM-00000001zBN-2BHs;
	Fri, 18 Sep 2026 13:57:54 -0300
Date: Fri, 18 Sep 2026 13:57:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for
 shared buffers
Message-ID: <20260918165754.GG11599@ziepe.ca>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <aq1sT2EDsGaomqST@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq1sT2EDsGaomqST@arm.com>

On Fri, Sep 18, 2026 at 05:52:31PM +0100, Catalin Marinas wrote:

> TBH, I'm tempted not to support this configuration at all, just fail
> gracefully if the realm page size doesn't match the host's. However, if
> that's a real world configuration, 

realm != host is going to be fairly common.

host > realm is probably not that common, I would guess.

> I wonder whether could we leverage the swiotlb mechanism but with a
> separate io_tlb_mem as a shared coco allocator with the right
> alignment and use this pool when force_dma_unencrypted() instead of
> specific alloc_pages() with adjusted order.

I propose we fix the far too low level set memory decrypted apis into
proper allocators, with APIs that can handle a round up. Then see
where we end up after that.

If we can hide 90% of it in an allocator then lets see if we can open
code the rest.

Jason
