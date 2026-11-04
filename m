Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820701;
	b=eN07L4dDeSeXsm9GoDt6Ruf4RHk6ezMx2a6L+84MRo5oMug3K6SlRcP6GkhzB8GcrsHb
	 4JhXGVLqQKLec/M8PJ9Z9MgMQbCTUo4K3cUD51CVDEsAVa1DkeRJdrf8Vp0pzXlADW2zV
	 CWdd8ZatsnqzOuFl9bp8hcUkwnuy0rwKmgoFhg3c+T4LnvbShssQ5zDflfk1TD04yDgya
	 B0lTfJAa6Oe9CjDPjC8Ri9iTLd2c/kLNxWIzakLZtNSYGtGdoeuPYeObTNcncO3zMuX7i
	 c/4OcTsSHyGBZENBRfzHwXsH4y2tzEYir9tty1RCAETtfwknuJyzXI0BwrTb1XFkQAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
	b=hXvUFPzBmFEmqgATHgymhkG8gaUzbcucbeUSXoZQKoxcZhJrsVeVq1zlOyBQLrVlYDug
	 0KtNJOsjAVPsmgs1ZvPH5A+qdIfqOlU4y7gKvU8ee4fAG+vI6W7Fva5fSKM3y2ui/Mlrg
	 NEw3TdFpuLRYBx2jrTSHWyHHMIkwt1FGVL7wYI8xFEYS6JK0I6plvLYxirEcQUOxjJGct
	 dQfeD8/AaQ7+exi6wY8oLPt1J5pdUJ5Itz9YrXetEucYVj12ObgpExmW0VsxCkKRgEnkX
	 S+A8OmuLjM8BkrhRLmep/2IgUYRCUeaz6R6pv1nLG1FP85G5UrtvqwXwW/lfGTEqcpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=aZF2fgHy;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60522607816D
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 19:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60522607816D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=aZF2fgHy
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f2f2edb19so100098885a.0
        for <linux-coco@lists.linux.dev>; Wed, 04 Nov 2026 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793820700; x=1794425500; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
        b=aZF2fgHyE9mnvl3X61e2VkPAHfCrMPOYdf5ZhTibRly+mKA/yoqmTwxaXAme/LnatB
         U330YTlRa0eLsuh43WR+VsEFLuqG0Wm6nrhzwZcabJnen5PMk4ajZT1qSDw4S+qA4Kds
         pEhUCts9uYOBN6QiIb++T9QJiOMjWWepwmd9hXBA/DfEXusvFTyJiZfolHwdqqUPTj4v
         ICON4Bpc/+Y4G1AXsvBhL9RrrdDeM5V6MZQkQ0ggVB5Rd9CEDrz85HO1vIGPN10kMl6t
         6X3bQQd5UWPjDTsYMhGZR+dabKwDz9WlIjfaRNPWoRWsXpp/s6xXuwjv82eIWJT+UxTr
         tCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820700; x=1794425500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
        b=GspmuP54x9VXTcHApU0UIfOVjb0Iyz5K5mtAIrRnzU48u0f7oFMFjqYMLPEF1GDzg6
         zZWNNT4tS3fZI157gkj8LehPF2G4dj4oxQyH+Hok5IGS9Y8x6awAzkLfOQzZ5nEOBWPd
         id1QKgfdR6+4V/KBRZze/Un6d0Jymlbjp4I/YrOz/bH8oIQb5tAmnAePRLDtZWRbCrBC
         l8uH4WiRu1gKUtf2wUgSzAC5JHaCsG5VwIh1rQ480Pm6lUbtl4ecTjzTFIyg9fTCKDpN
         Ds54TTSabfk0wBqxu9UW+yEijZ73jS3vuyQxEpjlHHKid6pygDAjbF0PPj2DwmGk+QgM
         dHHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5W5+1w+GfbFQ5g6pYfxkWnt+lvDoec5RH0XvtFLv+UgE/LBtyRzSR3u8Zi8Rk8jJfisgKl4VVm+A8@lists.linux.dev
X-Gm-Message-State: APuU4Z9HWlyeN0AUYzRSWMZwyfoyOPoKHWq6NpHN40v4UicePjr3QasD
	N+9Zqg9+lmJ/HhojF6zI7Y6D2KxUfU080A/Zvh3qg3l3eXZxpiAvuvIMxpBSmaRo0Cg=
X-Gm-Gg: AYBFou30w/sC7guz9kw5sPmJRXZSccTCsW64CQX06asuoRfOpXrr9/uOJ3atf2nJFZV
	dZZlPwwSeMlEJWWxByEjxNP1amBIXPB7FG5M9wmW//622zoM+6rrOEsFv+1WLvegE/BW2B1FAmv
	TOxsqJKstY6Cv/4Y1BeZW2QS3hl/uEyvkjrrP3ujkgqa+IJXrrCzljxDbzrKTjMOT5AO5I3zpJi
	iO4uEbjeus5J++4TQFwoZh6bTOymB4v6kOuCXmimuXhL94Fao2teP/u4+JIMudKYxpKBeYA7p7Y
	OPSnHneJYPNx0fe5dP9T7IDSYRPPhd6sX7xhNQmCju40BF/dOc1699r2RKFjf6/dMI/iOcTQd/D
	o6pSNhKF1qJH7sxg7AwJcB/z8A2ucIwYwya6IWPMVlZiwjqOg3rUyzwuujC75YNeZvidp2xEDcS
	pCguQPuyShU6ihET4dar2+CzyIAV+xQk5E8308xcO9zwE8Owy5Dh+/mnX4TnAW0/Cyw6vjFGM7j
	NL3ex0NjjgEnTHY+xGqgYViz4isyOlnGQDcYPruIbdoog54INiEf7Nzu+NY/tK/gqmSpShwj6ta
	bYSHtVbeGOL2NfRUX4r1po1YeZkK02LFgEZPBS9Tw0ahrh163ZFWat6Tq3bNYho+lWGZ9zko1yd
	+Oq3G9gTeVA==
X-Received: by 2002:a05:620a:1a24:b0:93c:6534:d04d with SMTP id af79cd13be357-9442167725emr2767779185a.35.1793820700269;
        Wed, 04 Nov 2026 11:31:40 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4844991sm278199585a.28.2026.11.04.11.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:31:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOghv-0000000HG9b-0zIw;
	Wed, 04 Nov 2026 15:31:39 -0400
Date: Wed, 4 Nov 2026 15:31:39 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <20261104193139.GB3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
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
In-Reply-To: <auuBjRjQwXl7UvvO@nvidia.com>

On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> On Wed, Nov 04, 2026 at 09:46:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > VIOMMU_ALLOC currently requires a nesting parent HWPT_PAGING even when
> > the selected vIOMMU implementation has no use for one. This would force
> > implementations such as the following Arm Realm vIOMMU to create an
> > unused parent.
> 
> IIRC, MSI on ARM still goes through the NS pathway. So, it wouldn't
> be "unused" if the device attaches to it (or its nested hwpts)?

It is unused by the RMM VIOMMU. I think that is what is Aneesh is
explaining.

> By dropping the nesting parent from VIOMMU, it just simplifies the
> attachment to an S1 paging hwpt, right?

Yes.

The VMM must always maintain a S1 paging attachment that is the
identity map of the VM on all devices, same action as when there is no
viommu.

Jason
