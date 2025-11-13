Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2433133DEFE
	for <linux-coco@lists.linux.dev>; Thu, 13 Nov 2025 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763033325; cv=none; b=EA/KTyoZD3JniMJymHuMQWfUiBnSr0sykr7k+wOJIi8v3kmjntUj8xZ54C4vkrJ5Cc5WeFhnzQ6t/cUsKDd32LP5DePuY/a5DsuKusLvRdB4y2fvy9RPCwwSHserpU1y8H4l+kEbD3mt7GUPWklJd1jKy7QWHXSIT7Kt+pcFISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763033325; c=relaxed/simple;
	bh=hFIdchMz70SRW7I6tXRAH6ooNypVtLfMibRNFhxHWqw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuVWZ1ci/Ay8Hdv6qH6UncYoymxLuiPcsGVHO2ek6NGwMEzWYyJ5id/uBSvDDgcYlgKnRMgJMdH6N6RPfz4kiD2wMENGpMr/pclkRX54/G5yXJZHDJiQfxQDn4qPw4MgPYhJPgCD6bD2rQ4qo5LIgWD7a1T0XfUe67i0HEb/x84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6dLH4jPczJ46rT;
	Thu, 13 Nov 2025 19:28:07 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id AAC7F140277;
	Thu, 13 Nov 2025 19:28:41 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 13 Nov
 2025 11:28:41 +0000
Date: Thu, 13 Nov 2025 11:28:40 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-pci@vger.kernel.org>, <linux-coco@lists.linux.dev>, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/8] drivers/virt: Drop VIRT_DRIVERS build dependency
Message-ID: <20251113112840.00002faa@huawei.com>
In-Reply-To: <20251113021446.436830-2-dan.j.williams@intel.com>
References: <20251113021446.436830-1-dan.j.williams@intel.com>
	<20251113021446.436830-2-dan.j.williams@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Wed, 12 Nov 2025 18:14:39 -0800
Dan Williams <dan.j.williams@intel.com> wrote:

> All of the objects in drivers/virt/ have their own configuration symbols to
> gate compilation. I.e. nothing gets added to the kernel with
> CONFIG_VIRT_DRIVERS=y in isolation.
> 
> Unconditionally descend into drivers/virt/ so that consumers do not need to
> add an additional CONFIG_VIRT_DRIVERS dependency.
> 
> Fix warnings of the form:
> 
>     Kconfig warnings: (for reference only)
>        WARNING: unmet direct dependencies detected for TSM
>        Depends on [n]: VIRT_DRIVERS [=n]
>        Selected by [y]:
>        - PCI_TSM [=y] && PCI [=y]
> 
> ...where PCI_TSM selects CONFIG_TSM, but fails to select
> CONFIG_VIRT_DRIVERS.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511041832.ylcgIiqN-lkp@intel.com/
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Seems reasonable to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
