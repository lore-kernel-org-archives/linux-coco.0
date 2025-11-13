Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4BF33B943
	for <linux-coco@lists.linux.dev>; Thu, 13 Nov 2025 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763033366; cv=none; b=mNkgc1nhuPvojhiEGqRZnjqgky0rYwg4c9xsiKeqj5WrLlY7WrRm+UOLXjkOJXIAo2dCucTO2nY2Mclg3zeyG211xoWkRe12DrJ8c9GsCWTn3bZAJaM4URaEDd4ioNwVGKRhBQY/ZZhECEKwdIBi0giWBEC8YoxVZaJfotKOcxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763033366; c=relaxed/simple;
	bh=h1A8KbP52e13WYR2WHgxGIGt+4osW6ow5F016C5qqEw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R4mPFS+KBJ+2Bza89Kb7dGyY9mSEDTG4BcWn6bvQGutvIa23tILjpmzPlIpeK2f36LqFSt/rlLhtYikstO8/00s7H0ePgeaoXcCwzXLEyNVC7GWyLM+PSJ5Dd/zoLDq0I35vtmKRpTMrm7ydFLjPALA4JW6ybEoJfJNCl/XOnbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6dMK3b3VzHnHCm;
	Thu, 13 Nov 2025 19:29:01 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 6BDF01402F1;
	Thu, 13 Nov 2025 19:29:22 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 13 Nov
 2025 11:29:21 +0000
Date: Thu, 13 Nov 2025 11:29:20 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-pci@vger.kernel.org>, <linux-coco@lists.linux.dev>, Xu Yilun
	<yilun.xu@linux.intel.com>
Subject: Re: [PATCH v2 2/8] PCI/TSM: Drop stub for pci_tsm_doe_transfer()
Message-ID: <20251113112920.0000011f@huawei.com>
In-Reply-To: <20251113021446.436830-3-dan.j.williams@intel.com>
References: <20251113021446.436830-1-dan.j.williams@intel.com>
	<20251113021446.436830-3-dan.j.williams@intel.com>
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

On Wed, 12 Nov 2025 18:14:40 -0800
Dan Williams <dan.j.williams@intel.com> wrote:

> Just like pci_tsm_pf0_{con,de}structor(), in the CONFIG_PCI_TSM=n case there
> should be no callers of pci_tsm_doe_transfer().
> 
> Reported-by: Xu Yilun <yilun.xu@linux.intel.com>
> Closes: http://lore.kernel.org/aRFfk14DJWEVhC/R@yilunxu-OptiPlex-7050
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
