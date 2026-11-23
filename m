Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401304;
	b=khyR3L5kx+xTfUpwiByf3HLoffa3tSi3vmCWKS/lPrXWxj6F3gbvJj8JATptireN6mpw
	 cfkzNay34MPXuWq9ykUeuCfXzoNAjJ3dIz+VIWg6bbpkUwa47Ic5PDTeevOkehAjYGOso
	 QjULJ8ZBTQ/UYxvubYQS71zlvWzTZ2r9EHg9Ej2gUgkqYFNv6T7S/pIjgHy6k9ZbTZI9y
	 zY1nxe6XwoD4T65bd+N+lUkFno07JJK63tdihpcV0W0igXnGjuK5cVScX85m6sUCIfOda
	 Dyg+IPnNHAsBF278FAB/KPHrigKI00pN81EFvDOM5jx/6jgXPlR8Dy1d1L8Bq+CFyBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401304;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IClq2zx0t9nl/+OAEZUcB8PCla4/Usk03hEIYwIa3f4=;
	b=hY96/+csua0sa72GzKTbs5tM4Zq9T6ByEffbkTEC8S39NsITy9UaExRt1hlFRw4fc+es
	 y2eP5zl2SHOFg0wrRKiigNn6ff9+jlkSFGYgkzdrNPByc9NdS/sr2xJW3ZQOBKn75ZVG2
	 LFCnEGR9W34sL6nbt1GL6vmw2tJD3naLWKa4HuDH2kKjUWcs5L6fmX8xJYLX7Vec/0Go/
	 rgtP7lzJA+HZbGMqFPT7um1IWQVrMqmF1UZ+Oesbh2rsyVBx4VksB2GgnKyfxEbYHu/bL
	 Mg4KObElXBP5yliPkqolYAOCAJcugjhghX/DpdIZn+8Ip8TJK2zci3vbCz6nkHXEm2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lFkUCtYo;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B39606A32A
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 02:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B39606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lFkUCtYo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795401303; x=1826937303;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=rdrXQWedAdGPA0+XecnWUwLJdtHgt4V72paQ+Sh2Tls=;
  b=lFkUCtYoCE3iwno7Ro69cbaaKBryYgF/vcKqt66G+WFH6xHVxXsSdT30
   1qU7qpkLmiAFZIXHmt5QJCEfgzkw99m1yOs+TITDNLRllCV4w+Y8C5oxm
   LIUXWIdw70DFCTB6eNpU+drFj0EfWJAJzXRVk8MjTcVYvsaxcCPVQlhC8
   OQRNFzpXvBmuh5bk6ByvA7cYw9pHHnOz3pAEM35d2qkyzXppjwwx+nAGB
   jggvD6rsHqGyYiB3V0rrKDnG6pk1VPpgCmSwQ+9QXlR+LcpIACFkAjf8Z
   eF0Gv8Ke6PoDUcN23z8jfFxcer9GQim2AmFwQXcfT33cSRWnjNTawtk7Y
   w==;
X-CSE-ConnectionGUID: 2gdnK9KDTpiTmlj8T9bxRw==
X-CSE-MsgGUID: dcbkFQ3NSuSMiQScI80Oxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4229608"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4229608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 18:35:01 -0800
X-CSE-ConnectionGUID: UqKA0dqxRjuv+U4loQVl1g==
X-CSE-MsgGUID: A/FJp4vbR1WORl1nIkpXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11180445"
Received: from unknown (HELO [10.238.0.68]) ([10.238.0.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 18:34:54 -0800
Message-ID: <b403ad25-1cbf-478b-ae68-43b0c4677260@intel.com>
Date: Mon, 23 Nov 2026 10:34:49 +0800
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
Subject: Re: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
Content-Language: en-US
In-Reply-To: <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/2026 1:22 PM, Xiaoyao Li wrote:
> On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
>> Build private MMIO descriptors from the TDI report using the PCI TSM
>> MMIO helpers and accept each private range through TDG.MMIO.ACCEPT.
>>
>> Keep the descriptors while the device remains locked and tear them
>> down on acceptance failure and during unlock.
> 1. The changelog talks what it does but not why the patch is needed and what is
> the design consideration. E.g.,
> 
>  - why choose to setup MMIO in the .run callback instead of .lock?

I will split this patch into two:

 - allocate and setup the MMIO in .lock() callback
 - accept MMIO in .run() callback

This allows to re-run the .run() callback cleanly, without concerning if MMIO
range info has already been retrieved from TDI report or not.
