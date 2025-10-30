Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E039624169D
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822177; cv=none; b=Y7u8djCMi0taBZ8wDbZVdW7VFZ0KzWgDgFONlerATAkPyIEeJfbzvCg+zgiL8OvjmbXKUTHLzISdweByIcuvtHmvtMac8jw12FAyJdGXgDaz0FC/KrUDB7wFXkU5DR9sT/uRmK0N3U+WlIY9NfPmDiJkG8X0DQBfx88neGlBjek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822177; c=relaxed/simple;
	bh=PsSn0f/tjL8awL22xEhCimuKuSJy4vRFfPgE/UyuJJU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jPveIAOhMZLs+FqE7HV0lQhOzH4ObhYLEamMXB2gxCafKTX9aHBRCaM+AD0tdQX6JDnBazelHqFETB4eoOT962iNlXCfh3pWSlomi61gFEO/Fp7QAPrCAh6PFORTwxe8fcclEo7qaAdi9AocZfw033GCtA6dfWnZu47Xr6ycbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cy1PX4JGCz6K6Ct;
	Thu, 30 Oct 2025 19:01:04 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id BA0121402F9;
	Thu, 30 Oct 2025 19:02:53 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 30 Oct
 2025 11:02:53 +0000
Date: Thu, 30 Oct 2025 11:02:51 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-pci@vger.kernel.org>,
	<xin@zytor.com>, <chao.gao@intel.com>, Dave Jiang <dave.jiang@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 11/27] acpi: Add KEYP Key Configuration Unit parsing
Message-ID: <20251030110251.00002b03@huawei.com>
In-Reply-To: <20250919142237.418648-12-dan.j.williams@intel.com>
References: <20250919142237.418648-1-dan.j.williams@intel.com>
	<20250919142237.418648-12-dan.j.williams@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Fri, 19 Sep 2025 07:22:20 -0700
Dan Williams <dan.j.williams@intel.com> wrote:

> From: Dave Jiang <dave.jiang@intel.com>
> 
> Parse the KEYP Key Configuration Units (KCU), to decide the max IDE
> streams supported for each host bridge.
> 
> The KEYP table points to a number of KCU structures that each associates
> with a list of root ports (RP) via segment, bus, and devfn. Sanity check
> the KEYP table, ensure all RPs listed for each KCU are included in one
> host bridge. Then extact the max IDE streams supported to
> pci_host_bridge via pci_ide_init_nr_streams().
> 
> Signed-off-by: Dave Jiang <dave.jiang@intel.com>
> Co-developed-by: Xu Yilun <yilun.xu@linux.intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> [djbw: todo: find a better place for this than common host-bridge init]
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

Generally all this ACPI code looks fine (up to the TODOs Dan has called out)
One trivial thing below

> diff --git a/drivers/acpi/x86/keyp.c b/drivers/acpi/x86/keyp.c
> new file mode 100644
> index 000000000000..99680f1edff7
> --- /dev/null
> +++ b/drivers/acpi/x86/keyp.c

> +static bool keyp_info_match(struct acpi_keyp_rp_info *rp,
> +			    struct keyp_hb_info *hb)
> +{
> +	if (rp->segment != hb->segment)
> +		return false;
> +
> +	if (rp->bus >= hb->bus_start && rp->bus <= hb->bus_end)
> +		return true;
If you are going to not use the simple pattern for matching that
would have this inverted so we only match if we pass all checks
might as well do
	return rp->bus >= hb->bus_start && rp->bus <= hb->bus_end;


> +
> +	return false;
> +}
