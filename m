Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEA64B402C
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639033; cv=none; b=gjKA41pizlLeuMKN6O3FatfIPF4EYaqWck1le3tb0LBEKWRCn72xaeGXGYJ5InSdXZIkJrLO2nxh1uJTR76jDwnSqT0fSgE+p5CZFjS43nqDq2edyRGTTtufwErdmzOtxEkaZp/XqxE7Or9/e2Nh1/AJHVKScK1D9QBeyApOkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639033; c=relaxed/simple;
	bh=MystT138xR+WElV4qva3izvJ/ENfjI4PQpKKdQVx3Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVCREdrm0MDHrgHpudGaTOPRe52A9YUANox+Ocf2Dacsjyeeb+Ky8ZtaB66KdRer7BiJSKHgSsHDCDym9du2E01KQmAr9FMtU7R0QRkSEgSl41UUibWwt6Oq6UHrxjcygZkaKf8Lc6I3s3yLE4CUtZo2ob2vw25xHc/9s2ciT2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UrIEyXDb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UrIEyXDb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64CA61476;
	Thu, 17 Sep 2026 02:56:53 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D5AB3F7B4;
	Thu, 17 Sep 2026 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789639017; bh=MystT138xR+WElV4qva3izvJ/ENfjI4PQpKKdQVx3Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrIEyXDbpHvb5imXK3xXbqGf5/C6i3JpVnVkFA+MtaiCw5mMgwu8X4D2s4knT/I/m
	 8Vwg8qziKHCebU+u33vXQ8N08svoxwaD7gtz9TagLvJ9oqoHpIMUS7+D8VzxO5+twu
	 Xdhx6ch6nqtHlax2kAvi9DKw0cVUiVRWuJL84ByM=
Date: Thu, 17 Sep 2026 10:56:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <aqu5ZI6433cV2PDy@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-8-aneesh.kumar@kernel.org>
 <aqp2DRInEhzpEqAc@arm.com>
 <yq5ald911e4o.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ald911e4o.fsf@kernel.org>

On Wed, Sep 16, 2026 at 07:39:59PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Mon, Sep 14, 2026 at 11:35:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> >> new file mode 100644
> >> index 000000000000..bf177d636b92
> >> --- /dev/null
> >> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> >> @@ -0,0 +1,10 @@
> >> +What:		/sys/firmware/cca/realm_guest
> >> +Date:		May 2026
> >> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> >> +Description:	Read-only. Indicates whether the kernel is running as an
> >> +		Arm Confidential Compute Architecture (CCA) Realm guest.
> >> +
> >> +		The value is one of:
> >> +
> >> +		0: the kernel is not running as a Realm guest
> >> +		1: the kernel is running as a Realm guest
> >
> > Does this file ever read as 0? It is created only if rsi_present and
> > always reads as 1. That's fine by me but we shouldn't document 0 as a
> > value. More like if present, it always reads 1 and RSI is present.
> >
> 
> For now, that is correct. However, the two checks could diverge if Realm
> guest support is enabled only after additional checks, such as version
> compatibility.
> 
> In that case, is_realm_world() and static_branch_unlikely(&rsi_present)
> could return different results.

They can indeed diverge in either direction but would we ever end up
reporting 0? I also think we should gate realm_sysfs_init() on
is_realm_world() rather than rsi_present. I know it's the same at the
moment but it would read better if we just did:

	if (!is_realm_world())
		return 0;

and realm_guest_show() just return 1.

The file description could be (without any values 0 or 1):

Description:  Read-only. Present only when the kernel is running as an
              Arm Confidential Compute Architecture (CCA) Realm guest, in
              which case it reads 1. If the file does not exist, the kernel
              is not running as a Realm guest.

or something along these lines, no description of value 0 (well, you
could say if "if the file does not exist or reads 0..." but only if we
envisage a use-case for this.

-- 
Catalin
