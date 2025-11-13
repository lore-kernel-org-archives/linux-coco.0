Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD02D320A0E
	for <linux-coco@lists.linux.dev>; Thu, 13 Nov 2025 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763034542; cv=none; b=pigueCu9yZ6Y7g3NxfBFt30o+/h6KBMa1vyfMcrhcXfim38ROQHa3Xmz9qyZ4i8JkPaNAg3hTdHa/NuPTZ89KcGM9iRd5b5oaFqArgMRyZk2rizN9Mg2Uob72Tj2c5AUNyw73NxC6ggHjGvBhl4XPg/kG7yWtTgOkNfVw/h1py0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763034542; c=relaxed/simple;
	bh=a2g0IjUt34kU2RpiF+4FLlDER1grl/YUd6l7/XC5sj8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMnJP+HmPKc2QHQltnbi2mHb8peSghXYinlsVTLMX++To5UJVM2fKwqhlFvJD4c2eE00la7hi8prq4H0JpacH5SHk6k7yDhuryTFYAuvBRP22ZL34mxLc/dVEvCn8WQeaEMEQMQh0wgowhE8XW4Q7g5kwIKlv6mSfyHJltDrx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6dnf4kSJzJ46Zp;
	Thu, 13 Nov 2025 19:48:22 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B02341402F5;
	Thu, 13 Nov 2025 19:48:56 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 13 Nov
 2025 11:48:56 +0000
Date: Thu, 13 Nov 2025 11:48:54 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-pci@vger.kernel.org>, <linux-coco@lists.linux.dev>, Xu Yilun
	<yilun.xu@linux.intel.com>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>, Arto
 Merilainen <amerilainen@nvidia.com>
Subject: Re: [PATCH v2 4/8] PCI/IDE: Add Address Association Register setup
 for downstream MMIO
Message-ID: <20251113114854.00005520@huawei.com>
In-Reply-To: <20251113021446.436830-5-dan.j.williams@intel.com>
References: <20251113021446.436830-1-dan.j.williams@intel.com>
	<20251113021446.436830-5-dan.j.williams@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Wed, 12 Nov 2025 18:14:42 -0800
Dan Williams <dan.j.williams@intel.com> wrote:

> From: Xu Yilun <yilun.xu@linux.intel.com>
> 
> The address ranges for downstream Address Association Registers need to
> cover memory addresses for all functions (PFs/VFs/downstream devices)
> managed by a Device Security Manager (DSM). The proposed solution is get
> the memory (32-bit only) range and prefetchable-memory (64-bit capable)
> range from the immediate ancestor downstream port (either the direct-attach
> RP or deepest switch port when switch attached).
> 
> Similar to RID association, address associations will be set by default if
> hardware sets 'Number of Address Association Register Blocks' in the
> 'Selective IDE Stream Capability Register' to a non-zero value. TSM drivers
> can opt-out of the settings by zero'ing out unwanted / unsupported address
> ranges. E.g. TDX Connect only supports prefetachable (64-bit capable)
> memory ranges for the Address Association setting.
> 
> If the immediate downstream port provides both a memory range and
> prefetchable-memory range, but the IDE partner port only provides 1 Address
> Association Register block then the TSM driver can pick which range to
> associate, or let the PCI core prioritize memory.
> 
> Note, the Address Association Register setup for upstream requests is still
> uncertain so is not included.
> 
> Co-developed-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Co-developed-by: Arto Merilainen <amerilainen@nvidia.com>
> Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
This addressed only comment I was expecting to result in changes in v1, so
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
