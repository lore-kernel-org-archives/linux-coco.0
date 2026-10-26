Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001026;
	b=XTspHtnidTZzG8/YY5hP9qmARsmoAiagDXFpOSdFILiETlc9f9t8UdiiDWi4Y8cUU2Gb
	 4i96D421ZXc2Ju2+LFJ5tY0YkqAoHQF7JcmR+vRrBBKXqJtUm3sbFyg0zBfUvZkYUZqLS
	 +2LLCZMPR16uwzHsmAMe51VVBU935Fsr0VW8bE7LtBGR7bGayISKPTvAeOynAI6h4nckm
	 Yn2K90YtxYhkPfVqj1IMV3ClO9m8EhyDc9zQP/7U8kQkSrRZ9dfOXQohWiV7u44xvKeZQ
	 eBDesXIReAmZ42Y2/RhTCYnam24FTHS9mE6+vdHPUI9IK1NOXBORe1h+V08HdRrZldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001026;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/8Nfa8ZvhcxBCeEQYtMEiwr7Pt2NnxZjTkwqiUDch6k=;
	b=RzbMXw/Zo7kHeyJtfyixdHuFe16ZWBciA3hcBehiJU5UWKREQEXIp2WgU9mQjdnT/9Jw
	 RRaOeOw0fkONzjCQNjUK99jS4ZZA1cU6sRjjV0y6yE/d+e28KG1/Pu5sfML+NIIUlEdsF
	 MB1YKJb9HbftWbBBJVvj2K8ImD2sjPDh1QBFDC4fRVuxG9n+c3E6HJXFU88AP04WywseP
	 q2xyv2tvwRwW6wqtKP38/7jz6iSRwJ2EuUCRFwlwczokwy9KlHEjO128XDd5+CBp+LhdX
	 Nq7q5PCQACYFmTHmgwQDkNPGsgSwoG/bGEekakvN3esIEWspb4e2BWhOgPbaUjruGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YFSoeg3C;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CBD606A31B
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 07:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CBD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YFSoeg3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793001026; x=1824537026;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ypr1y4OAt1ajVjc3EN9jMN03ZJtAjXWvwbJYIgIM4CM=;
  b=YFSoeg3CKXXltUmftiw4T0brg1JmiaWoqu2vE/J0HRy3zfhv73dRVwnH
   dEXhZNWCO7Z9UPp///lArGXi26NnSVZV+oP8LCFNeuOZ1y3TkT/rGjoQk
   p8ZL2hFk7JOxjD9V3wULLcDFgBWr2E2wsUEA3L1V7L2njh7kSOHvx8T8Z
   RPJAmF9jgV4F2iHWHjBC8BUJoiFqcAmbKr/JYZ8Uvm/r+5ET4tpmOAuqd
   f3hk2HLAX1hEYs8Id4jevcxRtqT+5VYfb8H1wa9jwQHsFoBfwLZaCqKVX
   3FSOdWJMVkXVZOXLyJG4VCWf5A9uE2U3wFGjLPejhx8xOPjBL+p6cSRYn
   w==;
X-CSE-ConnectionGUID: Wvo0MyYFRI6eQlWjAfrHfA==
X-CSE-MsgGUID: CmIlnO4QTRGQCcjBZ2IaPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1670406"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1670406"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:50:25 -0700
X-CSE-ConnectionGUID: zavmyGjdSfaR3xUCQhfbMQ==
X-CSE-MsgGUID: aeLsWiS0RsCnda2uclnjmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4175053"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:49:33 -0700
Message-ID: <de19ab97-c86b-442b-be23-c921c0831542@intel.com>
Date: Mon, 26 Oct 2026 15:49:30 +0800
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
Subject: Re: [RFC PATCH 15/15] virt: tdx-guest: Accept default DMAR entry
 during PCI driver attach
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-16-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-16-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Before a TDI can perform DMA to guest private memory, its secure DMA
> mapping must be accepted. This happens during driver load stage after
> MMIO acceptance and TDI activation.
> 
> The enable_dma callback issues TDG.DMAR.ACCEPT to set secure PASID
> table entry to present state and target non-partitioned TD.
> 
> The secure PASID table entry is cleared in unlock stage implicitly
> so disable_dma is a no-op currently.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  drivers/virt/coco/tdx-guest/connect.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> index a9d41fd38b64..b328caac0a49 100644
> --- a/drivers/virt/coco/tdx-guest/connect.c
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -427,10 +427,26 @@ static int tdx_devsec_run(struct pci_dev *pdev)
>  	return 0;
>  }
>  
> +static int tdx_devsec_enable_dma(struct pci_dev *pdev)
> +{
> +	int ret = tdx_mcall_dmar_accept(pci_dev_id(pdev), 0);

after going through the series, I have a basic question on guest function_id.

Per TDX connect API spec, TDG.DMAR.ACCEPT, TDG.DMAR.RELEASE,
TDG.TDI.MMIO.ACCEPT, TDG.TDI.RD and TDG.TDI.START all require guest function_id
as input parameter. However, the guest function_id is specified by the host VMM
on TDH.TDI.CREATE.

So how can the guest ensure pci_dev_id(pdev) is the value that will be specified
by the host VMM?

This is a strong contract, while this series doesn't mention it at all.
