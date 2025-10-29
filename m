Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789A354714
	for <linux-coco@lists.linux.dev>; Wed, 29 Oct 2025 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753900; cv=none; b=KGKF0hdMV0/TppY3K3fm6q6TJ8mChKYYhMMggKmNtMoNkE2cowXH9+edZc89CtksNlN5Q+ja6MXg4+c6576NEqoV+rzzte21ZEDIWT2y9WplLGuSi8K97mvoBj5xP5x0HwpbpyA89ftXfAAyxWuz3t7EcMCMhpgtPZ32nhAEXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753900; c=relaxed/simple;
	bh=sFeG0pbN+PiSWQjyclNNsHdzaeHkUzt6GEZVis8pqMs=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxPQb5sRmjqJ+7h7riOa/DJcNQgcxmT/WhLUO0u7UJkzjtETm7QeTo81idSlHxz694nLjJBgJpd9N6CqYL5cevK7FXEqm2p/nlMaPyknxJi8x4HBzjMDXifKf3zt7Kc3ZA0PA4+zsbGGg138owWjAHM7FBc2M45PgfCDmud247U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cxX673cClz6M4d6;
	Thu, 30 Oct 2025 00:01:03 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E3851402F2;
	Thu, 30 Oct 2025 00:04:54 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 29 Oct
 2025 16:04:53 +0000
Date: Wed, 29 Oct 2025 16:04:50 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-pci@vger.kernel.org>, <aik@amd.com>,
	<yilun.xu@linux.intel.com>, <aneesh.kumar@kernel.org>, <bhelgaas@google.com>,
	<gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 6/9] PCI: Establish document for PCI host bridge
 sysfs attributes
Message-ID: <20251029160450.00002031@huawei.com>
In-Reply-To: <20251024020418.1366664-7-dan.j.williams@intel.com>
References: <20251024020418.1366664-1-dan.j.williams@intel.com>
	<20251024020418.1366664-7-dan.j.williams@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Thu, 23 Oct 2025 19:04:15 -0700
Dan Williams <dan.j.williams@intel.com> wrote:

> In preparation for adding more host bridge sysfs attributes, document the
> existing naming format and 'firmware_node' attribute.
> 
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


