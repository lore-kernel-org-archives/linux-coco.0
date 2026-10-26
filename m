Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991083;
	b=IA/jjvz+RiGBVCZoJMpsSNO2Dhh8U2ChekbivcsMeQyTvO8ZuUPSO9MmPvquiQaqS73K
	 9SyQzXyu2oSc0oWN0SDRVLnOdciCq44Q4DUafpgg0iLfCiZ+jZAbkxD08aKr7yEAPFtlp
	 tASeH2SPIBeQbqp0paqqi0G60l7WWdbrUiSo9H7hso/KhRU0am71Hd/3tr7j8WnkwBJbN
	 XLDA43gq2eMgTQBWm63AzH6bkeDOlHmRELE2aUknZjgOBj5XsMir6NPU1RIyqw5bXB6lI
	 mSkqlAntQ7E/6JlyOQj8QSu/zVp8cscg/21KBAR/7YNuMx6jnflZNGT6cYb7pz6mz6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CAP3pImyasVPHFJHhGSvq5YXqLG+iW+fojFBPuLjqCM=;
	b=XNa7dAsyaUnv5vR/WfGUvjs5Er4y9CIFTS2htWGQlk9mLCc8/WOtYqDyy0U91Lx8fsPl
	 IVSYtWmUTlqBeb09rijicutFMSZHtlG2tEZ3aIPwc17vOPZVaujvdwrvEu7wM16ThL52C
	 PM8A2ju8bk7859qkXnZbtKKTZsXItSiYGRItmhwngTVhf/lwpgwdBQcdTzfwhyDsrbCy1
	 y0vkCBflIT0G/4Ui4G2rmuDJSvNsMS4SDSKVqoZMw+RRPHG30nZFn0A0iNIHVbd6s4MqL
	 iniY2THgUCDuoBxrSN6MA0hiwFIv4ZZqXOsbN7GI71fuvLwA4dAIMJQe30VuotyrkgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cYMd5a0Q;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665CE606A31A
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 05:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cYMd5a0Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792991083; x=1824527083;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h1Ol9v/7Yz5OguXGslXMs4aKABkZAC1Mi5rLoDEa5OA=;
  b=cYMd5a0QQ0PwcLhuq+ymzP9ZUNiwyEXkAfDvgmjvjXS7rJH8lcoOBB69
   Ytwdc6E7BxSkUihFEQl14fgN5O0QKWdVmt2OfSm3QT4dVTYnS+BEj6R4u
   K/G7lSnXDTskSGx04c3JUMgp26Fh1vYXFcSb+eo8ZNzZZ++mRAHVqFOTH
   yrKn0RsdUk5oAU+yXaU8+AuFd2ncbYQb4khWuDubyC5IVfbL9YVUqBjUN
   Bivhk+YtUuUf82dS+5ML50KvhpostFTT/JiKQCq/DzdnYgBuByVkre+wk
   pEyaS4ObyRqMn+NOqjH1cLLukJBs7Ad41jDW5pPKXuJ4m2Oh4Jz1rIBBa
   A==;
X-CSE-ConnectionGUID: HNsddHPoQ1avCPQ/JVqO2A==
X-CSE-MsgGUID: QggrOD5zQPOnBUqU3prv1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1658894"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1658894"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 22:04:42 -0700
X-CSE-ConnectionGUID: O2Tqdz1zSfO9tCynJ3rThg==
X-CSE-MsgGUID: FE+amqo2SzGSHUwWGrOcoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4114745"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 22:04:37 -0700
Message-ID: <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
Date: Mon, 26 Oct 2026 13:04:33 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-10-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-10-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Retrieve the Trusted Device Interface report through
> TDCM_OP_GET_TDI_REPORT after binding the device.
> 
> Store the report in the PCI TSM device evidence object and free it
> during device unlock.

It doesn't talk about why the report is needed, and why it needs to be stored in
the evidence object.

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  drivers/virt/coco/tdx-guest/connect.c | 45 +++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> index e36515fc43ef..d5934e8c0089 100644
> --- a/drivers/virt/coco/tdx-guest/connect.c
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -217,8 +217,35 @@ static int tdx_tdi_read_state(struct tdx_devsec *tdevsec, u8 *state)
>  	return ret;
>  }
>  
> +static u8 *tdx_tdi_get_report(struct tdx_devsec *tdevsec, u32 *report_sz)
> +{
> +	struct pci_dev *pdev = tdevsec->pci.base_tsm.pdev;
> +	u8 *report;
> +	int ret;
> +
> +	struct tdcm_ctx *tdcm __free(tdx_tdcm_free) =
> +		tdx_tdcm_alloc(pdev, TDCM_OP_GET_TDI_REPORT, 0, MAX_TDI_REPORT_SIZE);
> +	if (IS_ERR(tdcm))
> +		return ERR_CAST(tdcm);
> +
> +	ret = tdx_tdcm_run(tdcm);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	report = kmemdup(to_tdcm_rsp_data(tdcm), tdcm->rsp_data_sz, GFP_KERNEL);
> +	if (!report)
> +		return ERR_PTR(-ENOMEM);
> +
> +	*report_sz = tdcm->rsp_data_sz;
> +	print_hex_dump_debug("tdi_report: ", DUMP_PREFIX_OFFSET, 16, 1, report, *report_sz, false);
> +	return report;
> +}
> +
>  static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *pdev)
>  {
> +	struct device_evidence_object *tsm_report;
> +	struct device_evidence *evidence;
> +	u32 report_sz;
>  	u8 state;
>  	int ret;
>  
> @@ -237,6 +264,10 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
>  	if (IS_ERR(tdevsec_bind))
>  		return ERR_CAST(tdevsec_bind);
>  
> +	u8 *report __free(kfree) = tdx_tdi_get_report(tdevsec, &report_sz);
> +	if (IS_ERR(report))
> +		return ERR_CAST(report);
> +
>  	ret = tdx_tdi_read_state(tdevsec, &state);
>  	if (ret)
>  		return ERR_PTR(ret);
> @@ -244,6 +275,17 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
>  	if (state != TDI_STATE_CONFIG_LOCKED)
>  		return ERR_PTR(-EIO);
>  
> +	evidence = device_evidence_create(0, HASH_ALGO_SHA384);
> +
> +	if (!evidence)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tsm_report = &evidence->obj[DEVICE_EVIDENCE_TYPE_REPORT];
> +	tsm_report->data = no_free_ptr(report);
> +	tsm_report->len = report_sz;

it looks better if TSM evidence sub system can provide some helper instead of
manually operating on the obj. But this is not the problem of this patch.

> +
> +	tdevsec->pci.base_tsm.evidence = evidence;
> +
>  	retain_and_null_ptr(tdevsec_bind);
>  
>  	return &no_free_ptr(tdevsec)->pci.base_tsm;
> @@ -252,10 +294,13 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
>  static void tdx_devsec_unlock(struct pci_tsm *tsm)
>  {
>  	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
> +	struct device_evidence *evidence = tsm->evidence;
>  
>  	if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
>  		return;
>  
> +	kfree(evidence->obj[DEVICE_EVIDENCE_TYPE_REPORT].data);
> +	kfree(evidence);
>  	kfree(tdevsec);
>  }
>  

