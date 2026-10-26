Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792982767;
	b=KnyP6Hu8B105QICoWWWzygwbeIFY3btbXnnM56MvWGHI9xQmLaxGMFM8DIXJLySkxgRd
	 3KcwpK2I525uE0EOEIDQm0fNfF7f2NwXXM1zS3Zw20xdt+cnO69Ta1yaEEmiz4rP26NJm
	 DkOIlHM+3JVWRg7b8XssD86yk2KVZAptJRscZwGIxSkhoMxzk+6iOpKfATzHpZMgvoOsu
	 w8AZZNM1QmmKlAi78o88fbiLUI283HXIQAGFGqvGRXGB16cI2Ty9cTT4cBV4Mw4ShKCV6
	 TIe+5Y0IKtP7Gl94Gw4vI4ywuWCAF48WrDCv7eRwDSElWnpgcW1F3+9bZAYkEisF4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982767;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XRfnuEsJW9eDd5GuL7N/O5hmfaaecsLCtwYXZEW9g80=;
	b=gZGhW3bO0Wpzh3l7VJXN2NdFsyuqqv2GJ9M013mig2nA/LddkyvcL7JDh+0ZTywHgCHH
	 BQf0IRwPbHQ51yOMCA0/1yEAxhmrw1xZLEC8+mA5jGPH6BjDqNNV87NxGZLj7GOUogaow
	 rJr8hFwytIcrwNWyMppxi6ZPQyWwsUtK9SF9tzMKU0LlUX4xEZoE/NeKrpRjCP1c8PpbY
	 w/RfYLuZJTzG42Hn7daUHZF1UW35aw6yyVz1o5WAkr6T9mqQW5sfmM1jq91spOlJjFb1G
	 +KsANPHDRrL7KSLvRRpPgMNeRIZSn8OMLK1pENPidAVRhzFeLsyNTASkcRCzj0MPhFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLbJ2xY7;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B21606A31B
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 02:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B21606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLbJ2xY7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792982767; x=1824518767;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Vx2Xy4UO042Wl7uGcitnlICH98I0IbIOo3F00Ac4d3o=;
  b=hLbJ2xY78IhD+qhr/5hvdzwHAlvi0ePNp/Ex0d1fH3LWFyWyZYmJbMz9
   WtsYxtBjnawrAPWFQJIFfXqvkNjODEXEllxnA0+8X3emgNPLmPWGbOSbe
   QrAl7O5qIUvfj7T37ngHYP3DdvM0uaqnAmiycBOtoSfnMavmhymebwYxV
   cDNHcVtWk4YRxeuHa31opENApKeo5qzeHDHIUXaYVZpKHXWQJ/twZXNvG
   c969YVrUMt/8Tp7sNYRk3+xQJxRjz3zQ5+FS6oKjDvhrUEMfWcBCQs2MZ
   RAjoMX2mVNhunJjahzJcCYSXrWi1cnFCCLXQBovs4qbCW3kxC2ZC9uDLd
   g==;
X-CSE-ConnectionGUID: ICFwCoawRfiEbAcUV1RdEQ==
X-CSE-MsgGUID: cB01LjJESjygeLSsHSgV3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1747795"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1747795"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 19:46:06 -0700
X-CSE-ConnectionGUID: o4UIRS6rSMiC92R69qvb0Q==
X-CSE-MsgGUID: lwC8IMYySuiObT2VTV5vmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="5975772"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 19:46:01 -0700
Message-ID: <2b1f455e-e432-4439-8fc0-3b29548c45d3@intel.com>
Date: Mon, 26 Oct 2026 10:45:58 +0800
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
Subject: Re: [RFC PATCH 07/15] PCI/TSM: Track Device Interface Report MMIO
 range index
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-8-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-8-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> TDX Connect's TDG.MMIO.ACCEPT interface identifies an MMIO range
> by its index in the Device Interface Report. Preserve this report
> index when building pci_tsm_mmio entries.

If we are going to report it to the TSM guest framework series and ask that to
contain this change. It's better to put it at the beginning of this series and
state it as a prep patch instead of burying it in the middle.

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  drivers/pci/tsm/core.c  | 1 +
>  include/linux/pci-tsm.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/tsm/core.c b/drivers/pci/tsm/core.c
> index 19ad35f2da4a..3efb9c10d44b 100644
> --- a/drivers/pci/tsm/core.c
> +++ b/drivers/pci/tsm/core.c
> @@ -754,6 +754,7 @@ struct pci_tsm_mmio *pci_tsm_mmio_alloc(struct pci_dev *pdev,
>  		entry->res.start = range.start;
>  		entry->res.end = range.end;
>  		entry->tsm_offset = tsm_offset;
> +		entry->index = i;
>  		mmio->nr++;
>  	}
>  
> diff --git a/include/linux/pci-tsm.h b/include/linux/pci-tsm.h
> index be9f78ca2c1a..e5d9d7af2701 100644
> --- a/include/linux/pci-tsm.h
> +++ b/include/linux/pci-tsm.h
> @@ -165,6 +165,7 @@ struct pci_tsm_pf0 {
>  struct pci_tsm_mmio_entry {
>  	struct resource res;
>  	u64 tsm_offset;
> +	int index;
>  };
>  
>  struct pci_tsm_mmio {

