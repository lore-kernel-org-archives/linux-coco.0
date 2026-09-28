Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921B43FC5AE
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636919; cv=none; b=a2uksrwtaE8SNPteq1GJbVLKJiwQhjbnx/RiKzUX+zuNhruEs6ykUU0m2x8Tx+vugh8P2jmtN9FFG5guMSZPgguvVAnCd3mO1k58AeG90SCVOafqSr9tdDJTVZcTHWM+LVj6XlzJvavxWsF/jKEBXcCyF1C63rzFpbLLn5nVeKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636919; c=relaxed/simple;
	bh=0nWeG7gLZ/H7cWQa/8TVyUSe9M/rW/4Yls/RoHMrSnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfXNoEUh4MIIqE5v9qAAVZNeCEtx0hk2QHQnDhqfoRVd84k0nw/sVlZZ+Ht+Z4rybACNfqwdwNbHNl9VhDmmtYaEU0FSy+Q11F9RM4a3V4Y0BLP/lojZuevfyLuq6ZXUAMn4IrNN8bAzv6e7of1WG/fSUHhD/ggp+eeu/W4ZCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HAeUAGV2; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HAeUAGV2"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3413069aa25so2346663eec.0
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 16:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790636916; x=1791241716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77Ly/kE6ea0uAMR6LixnKC4rocy66Cjich0gHdqD2Co=;
        b=HAeUAGV2oWbaGCBvxP0a0vrPMwiXQksarFptTXXXst0tgzSx1XFVVRpYSNIZBoaKTG
         vs6SjCN+blJ3e7TeN6dirN8fk0mDTdOHMZQZQcfByDJiWiM5gY3bDiKtMsOw4dxue4Ds
         PM46tahyrltUNz/fOCmjVgh9lN1a988nHCeNGdM55n8yaLjeSTXqShL/8zU58/JjnNDP
         5Z461Kie4mZiqiq09M4kMqVZiTHijEo4kH3wy9ESvO1FRVfMB4Mkw2xwEMjpLN7HaxKt
         X0rXqjiRFfmA9NwLnLQXMWnvtuYmouwDZttSCq7CIjNtF0ULgZpL1y+TIE2bvIPyXSxj
         WsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790636916; x=1791241716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77Ly/kE6ea0uAMR6LixnKC4rocy66Cjich0gHdqD2Co=;
        b=wKwMfWDUynMsSrzhLNz69okTVz0RcF24fWqGXQHl+yIheFE1vU00Zbh+dvvieK+FeU
         9cy0rqRRMZI/AhEIfhWqMTHcOBKk4Owscq3H6URiLT9IvLpB5bgqH038hAA+GFxA5MVg
         bkKXJ8Hr/8pCKLAX/LnLs8IgAczkUvMnhlObFsSt2GQPM+V4zhHt+iMnqXH3+MZ7BZ1c
         uHUCW8uG2HM6b2cmwskaM7fTIXxnUMVCCehN+jbwLj/0arpL6bX4lTEHfcK46xMKCoVV
         2HOKd3sQ8LMEeBUQhujXKYTBofgmPBgH4px38MZLMhcT+RCl6qaJcHCk4WNejSkV2PfG
         24mA==
X-Forwarded-Encrypted: i=1; AKwUvBz0ZaTthuDntza9UPBHE5eDBiMyMDDBDO5POMKSD7Mta/v4DKPy2bBTAc+cK79u8Xwop+p0g7Z1Zuz6@lists.linux.dev
X-Gm-Message-State: AFq9FYICvOE9iISkOB634FfBaHueoLknfBq9m9mVDknikB+IrRwNL3he
	WeMLr7F54UKAs/yJ5tDCeOn+lzB6uDmsH6Pqc8wGbtkQu4nafu2FBZBlM+lc5PtacK8=
X-Gm-Gg: AYBFou17JGYamGsow2/zZccCPh7DL8AGq9ax736SpiLtNhaiNbS/AxinOg6rKj4ambO
	lO872pWMpPrMHY0FPAPc6l/q6NcUboNj24maAEmXjwQzwcj6YmINNfwNMWZMMl3I4y1FTmlpUuI
	I8qKFRFs6u3BNTXo+wgSJAj6rZZhT/EMjpo+Sd1erZjzvN58rGiDM60bqMMWuLTL0VrQPg1r5aB
	6kkrlyW8xwCKun0NgWcw6kXDS7mTYVHbQjlDJHhGR+E6pjA2dbAtUoz/bW14U/0tgWy4rtDn+SO
	iHH0W2+F1gRukk/tGbvBFbm8CoKGidwn21xbj3L2mqnXM6sgAHfi8mhEzo3VWHqS1vcc7vhVtsI
	ROVwc5aScrzZbljbt3JtgguZCsKVlD78b1+I+aNBHHAt5nqUsxIP9lRlsT5Uh/MZJkPUSH1oheo
	1ih3VOwoM/6puwZyhJplzlBuJX7n1GD6HeWBOKemZ30reP
X-Received: by 2002:a05:7300:d58d:b0:34b:354b:79b9 with SMTP id 5a478bee46e88-34b355ad91amr317545eec.12.1790636916413;
        Mon, 28 Sep 2026 16:08:36 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347328dd123sm9211297eec.13.2026.09.28.16.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:08:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBKSY-00000007uAr-1P1O;
	Mon, 28 Sep 2026 20:08:34 -0300
Date: Mon, 28 Sep 2026 20:08:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sonang Patel <sonangp@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v6 11/11] PCI/TSM: Add reference-counted contexts for
 vdevice providers
Message-ID: <20260928230834.GL163130@ziepe.ca>
References: <20260917140159.1163281-1-aneesh.kumar@kernel.org>
 <20260917140159.1163281-12-aneesh.kumar@kernel.org>
 <arq2Ql3-q9EApe3X@sonangrm.nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arq2Ql3-q9EApe3X@sonangrm.nvidia.com>

On Tue, Sep 29, 2026 at 12:17:30AM +0530, Sonang Patel wrote:
> On Thu, 17 Sep 2026 19:31:59 +0530, Aneesh Kumar K.V (Arm) wrote:
> > +		if (is_pci_tsm_pf0(pdev)) {
> > +			if (pci_tsm_disconnect(pdev))
> > +				pci_warn(pdev, "TSM connection is still in use\n");
> > +		} else {
> > +			tsm_remove(pdev->tsm);
> > +		}
> 
> What happens if the PCI device is removed (e.g. sysfs remove, surprise
> hot-unplug) while the vDEVICE/TDI still exists?
> Since removal cannot be refused, should the remove path still force
> the unbind/unlock?

vfio prevents that. It currently will block the sysfs remove until
vfio is closed.

If we ever decide to fix that then vfio would have to tear down the
iommufd vdevice before allowing itself to be destroyed.

We don't need any lifetime nonsense once we are inside an iommufd
context, its existing locking scheme is very strong already. tsm
should not be allowed to change while a driver is bound, and basically
I shouldn't see any refcounting or locking in any of these paths
stemming from a bound driver context in iommufd.

Jason
