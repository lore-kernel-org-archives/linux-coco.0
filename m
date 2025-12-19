Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9182F6199
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766143120; cv=none; b=e70pDzSno6VO5tZnXh4O6wSZyPn0ZwKRxAZ2pD0uHSJEeA1SEjbxDJVPbOTAhQynO+JrRtTuJZPHmyB1P5fFZOYDtR+X8GCQI4yR27v3+52Q6nBI7vYBcEZ6Df4bPkeVvF53GWSfjdf0NGsH/uso6ggxHO1jOLxqUo7aoM1zaPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766143120; c=relaxed/simple;
	bh=NHolfz4XzXR6zIHhuwax5OUL7/pF4kuUuASqumpMD1M=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t5on8PMCP7xWXY4Wz8rc0pzbn/Qsc+WU0rQ3zkSB8ng71vgzYcy/e1AgKuYgf2p1wSXKzN4w0cFxMG3g2EnCq8fqCi/GwSxZsecmOh9Jntjq//5fNHNY3BoBIVnrxf1wAAbjC0sFc0dJaXMSiuFscEK8QwSdJfJ9V4Qzd/s2mBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXlQ235hZzJ46DS;
	Fri, 19 Dec 2025 19:18:02 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id E9D1640569;
	Fri, 19 Dec 2025 19:18:34 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 19 Dec
 2025 11:18:34 +0000
Date: Fri, 19 Dec 2025 11:18:32 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-pci@vger.kernel.org>,
	<chao.gao@intel.com>, <dave.jiang@intel.com>, <baolu.lu@linux.intel.com>,
	<yilun.xu@intel.com>, <zhenzhong.duan@intel.com>, <kvm@vger.kernel.org>,
	<rick.p.edgecombe@intel.com>, <dave.hansen@linux.intel.com>,
	<dan.j.williams@intel.com>, <kas@kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH v1 03/26] coco/tdx-host: Support Link TSM for TDX host
Message-ID: <20251219111832.00004a6b@huawei.com>
In-Reply-To: <20251117022311.2443900-4-yilun.xu@linux.intel.com>
References: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
	<20251117022311.2443900-4-yilun.xu@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Mon, 17 Nov 2025 10:22:47 +0800
Xu Yilun <yilun.xu@linux.intel.com> wrote:

> Register a Link TSM instance to support host side TSM operations for
> TDISP, when the TDX Connect support bit is set by TDX Module in
> tdx_feature0.
> 
> This is the main purpose of an independent tdx-host module out of TDX
> core. Recall that a TEE Security Manager (TSM) is a platform agent that
> speaks the TEE Device Interface Security Protocol (TDISP) to PCIe
> devices and manages private memory resources for the platform. An
> independent tdx-host module allows for device-security enumeration and
> initialization flows to be deferred from other TDX Module initialization
> requirements. Crucially, when / if TDX Module init moves earlier in x86
> initialization flow this driver is still guaranteed to run after IOMMU
> and PCI init (i.e. subsys_initcall() vs device_initcall()).
> 
> The ability to unload the module, or unbind the driver is also useful
> for debug and coarse grained transitioning between PCI TSM operation and
> PCI CMA operation (native kernel PCI device authentication).
> 
> For now this is the basic boilerplate with operation flows to be added
> later.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
All very standard looking which is just what we want to see!

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
