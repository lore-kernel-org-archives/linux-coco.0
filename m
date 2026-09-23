Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616E5172C2
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168776; cv=none; b=HgJAlRZ/d/HDezsKYCPxWQvbowo0cfuASNZ7cMfqJcTz9QQejWOhP2SxXL5RcsbueYNdFs36afcb0urAvR8t0xgworETmysCYbhSeDMoQ85uDDmobEoejEVXDZYbACu+vd4F9c3SlNOqc7jGslE7FnF/Iv6Yvk53je6oJeUIXfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168776; c=relaxed/simple;
	bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8ZowKXtLOuMFFERxvY7dG6IeItPutozM0WvQcf7RCdnvkSq96kF3mh7Gk8e1d4sfqfK6p9f6QEwPgiXcu+kwZ36dIAUsR6zVb2PyaSxxIeBjIO2IQ3SVYthhbxe+V9eKVhPuk4y9rXESpGYSSyoB93YpDpCSuv+nzeFYHsFWco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=eCTbKQBv; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="eCTbKQBv"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so943682c88.2
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790168774; x=1790773574; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=;
        b=eCTbKQBvSxJTopQ7hizAXUgVCSMoLgzGCIJznBHhD+Pk9lhzW/XqpaLX0bpveLpW0R
         dzwOYriXIBzERszea2HrTy/4EeDDapgBnTFWIQ2YOsCaW3vo2dNUyQTzTQ02wZC2kIDY
         WsI2f1GZ5vF9oSTJcjKvc2o1vY+JOBCqUcsvPZnr/hFWzA6vbbzsE/1SIinmlcQ4yRSN
         xpy0iZ0Qk5UFIQsj8H3hWBpHBKp+fMu9FEO67WldVjLTeY4xCMk2NNEUYwDjkBzRcu1T
         ll0xuOGg1tfwvr6tT9PPSkaNq7E825yvN1F+kKE77AMpsvSXxb3asoUI6FQRCzCrLFny
         HmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168774; x=1790773574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=;
        b=zvnEwtNXw33kEAHQHVLaGAB81PGfvL/8CqctqfH15gkEt0pbYWbZy89wbjG0DnHuLt
         giGoJAuXSNN9Ys6f6XMcckgUFICejQMHskUbH1n6gayzODJrwO5p40KhCNAqTfH0RFR6
         9Waxk5dcMCyLdDv362XyEFy8VxLpBDQVqq7JbMbaXl2ZfZfVDz6fglveHRuJTLX4Pfkc
         fsph7y7y+KUz50k5G9H4if4jMn96ynNoCNe9NyqXfqs177vDrY9/XNM12olft+RQSDE2
         UU0Gx934bCKXH93+zTH/iJl7EGmYF0BZ26SbejXSLsxv72tQd90msfo4G8rngjhRRXQr
         1SxA==
X-Forwarded-Encrypted: i=1; AKwUvBxJZenU3cI6UyTwFU0kpzCUjEEHcNPaekml26cNp2AVPKaW/ydkCRIKr5omoDPvFPaGZ4hzGRerzEGG@lists.linux.dev
X-Gm-Message-State: AFuF++mlwXz5aTXkjp9jHkooOKhMueB9dufYFAuBX/DuezMv+lMhzXxU
	YcTNfSB+Gq2Scbm6Zpoh8mq2JH7/8ODlOe8w4uPF1WHLS3dfBgxsH1bilyfQLkEh0cw=
X-Gm-Gg: AYBFou1sGLhdB6E7X9Hc4whvlL2GVBid0Ag9DLVBWy5b6vOaZct0P2V9y7/87k3dfnW
	k1Q9fMn6pd6exbxw7BllbSwHtNZcmBedsO7ANAyEU5i9mR2vi/nX0NXEjWaviIe+rgvzc2pEoDa
	ohgBDGMMP8r4EpWnXtFpOcu0KgK9rzM5Sc7eZAZcIJ27BLRJSdqkPrwTRs0LRkXq/eLBbcyoags
	sXdA2pY8nXoUU5Qdng6NzaAXRZujCiPo2JatW3FkvVuNPbfoIVCxKlKsMmrOqNzKmIF2eh/LRbF
	SXC+hOwkAKH6474aNrXRAAbtZ5LFeJX90kyZ2MqovWrQcBpFJ5tnVbsbBRbfmqnisBrDvpwJhxL
	w67P9M+B5yHgNY3fYh8kGYmfE7mKIO9gvb3qvuLjKkyjIGtYwCYiwzd7UN4McNVZJ/7foqi1hJ3
	XjD7SG/i8ERWESBb6KUiH71kAvM44SAaYqtNXJ1cYPbVl4
X-Received: by 2002:a05:7022:1402:b0:143:2719:566c with SMTP id a92af1059eb24-144f9198b49mr2872815c88.40.1790168773123;
        Wed, 23 Sep 2026 06:06:13 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm10833873c88.13.2026.09.23.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:06:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9Mfr-0000000DZ6d-2NEP;
	Wed, 23 Sep 2026 10:06:11 -0300
Date: Wed, 23 Sep 2026 10:06:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923130611.GF1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOspFxWZ1DjgcAr@arm.com>

On Wed, Sep 23, 2026 at 11:40:36AM +0100, Catalin Marinas wrote:

> The simplest is probably to always zero in the backend and ignore
> __GFP_ZERO to the allocator. But it's probably only marginally smaller
> than passing a CC_SHARED_ZERO flag down. Get codex to try this as well
> and compare the diffstat.

For patch ordering I would convert to use the allocator first

The semantics of the new API should be clear

If you pass GFP_ZERO then the resulting allocated memory is zero

Otherwise the allocator does Whatever The Arch Needs to not leak
private data out.

Once places are converted to the allocator lets go see what is left
and ask why it is left and what API it actually needs.

I think HCH was right that nobody should be calling this in driver
code, lets aim to unexport set_memory_decrypted as an ideal goal

Jason
