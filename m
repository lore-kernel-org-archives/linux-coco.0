Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417805;
	b=eLylv8D+w3ZXYquo1/mERAKIp5XH+3EzuCpQ8TJgEmI6uJTehAcW566CiNcPmMB2f0t8
	 HecfTISxK8TdHuSb6pEkDaHNkHVphDB72+j340LwCo2zTRw2i71TS1EOMB0sdL/yMzyu5
	 fbZ622blvCix8R0faKSY4PT7jB06Pn41BNbmSEvrGOaCuH42JHeq0Y9o/mg08AEuO7hMg
	 Rbl2VOjnNrlMWw+KsOPFpgYUhnW7QvwnMPH2hzrs3xTqL0UcGYue9+QaV0UZiv/r52q7Y
	 DCgyEkWAHyADy4my3ZRdaMGhBxVunXZFXAdkBhaFEhJQhxTuIuzX160QWm3VvTF9q2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417805;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Mc75NFpbRxzzIwWJ8CCnT2l1oCuJRiHbJaR6G/yXCvM=;
	b=45sY+4ZsEXM+sTQNCpfmWBZ2Y2R5/h/sTamY1Np9HmmOty0qlQvrRM1/ForBoqeC/TIf
	 uZVU2I4SrI+93V7n1SjYsFWE+n6+HxUcLmkPLk9wioZDeVPXI+GS1fZsk6qEWYFQeVGHI
	 26LbNukYTgktnTgoWevaFdDGA9wKhaHJ0lg+1czB5dWD05pIRrfOJTPbi/9pv9Shvwa7T
	 FuX9ICU8jyLzmyJfpYtYJLyRTORIJqLN29w6hk9hq4dgRaH/bGn4PG9KSePkpUgff6j64
	 8OR7SI3JoCKGtYZ19TSsuytZdgSJaAbFvPDbXM0qgCNTvq03SF2hhVqoHQEGeUTb8+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JE4TLWjA;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC7606A324
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 17:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96BC7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JE4TLWjA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794417804; x=1825953804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RZ0vaLA8sc1p8PfnxnpTBwN213VIpWvjXVmbbJQ2Xp0=;
  b=JE4TLWjAJBoMESyPufcU1ciE89V5yLRuF86y7VHEZpx7rWgfXEDJ1Ep6
   F/3AO/0t8CyRZBk4dfmxkJHoNVUJ3EPg+ow168/szuevldCYqkp+6xKh9
   fuhsJuzrb8NjKLDlaDm1FXiu4mTxz9SVRuJ0ndMT+NjX2xSN0UToW1J4b
   xQLyIQfD4mzM//tUz4TBUHwh/8RnjRMFXvDazvURV/zWR5eyYydm9baxP
   HS4cHlYtl+agfcHvNurocOVVGvL168axF9oTURHougdtubAoMceRVGlAE
   USZcb4htmTbxT27FrdVE8POcQ3HqK2RZzAaXjDwnw7qMDsKvyPjIlVu9C
   g==;
X-CSE-ConnectionGUID: jOsM0GYKSfapPL6cZ3cHNg==
X-CSE-MsgGUID: 7RXMb1E0STSkiyQno7uhEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3225155"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3225155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 09:23:24 -0800
X-CSE-ConnectionGUID: /3mmSiG/TZif2qCOeBhiZg==
X-CSE-MsgGUID: b6ZS1m5UTbW5pNkd/tOQpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8542441"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2026 09:23:21 -0800
Date: Thu, 12 Nov 2026 01:15:20 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Van De Ven, Arjan" <arjan.van.de.ven@intel.com>,
	"Xu, Yilun" <yilun.xu@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>
Subject: Re: [RFC PATCH v2 1/2] x86/virt/seamldr: Support large TDX module
 binaries
Message-ID: <avSiqAfMX1Rc/SOc@yilunxu-OptiPlex-7050>
References: <20261106132159.1551365-1-chao.gao@intel.com>
 <20261106132159.1551365-2-chao.gao@intel.com>
 <0ee3d9592e4e73bd0e5bedafc836033fdfc9f120.camel@intel.com>
 <avQf9L0CYU0LfgJh@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avQf9L0CYU0LfgJh@intel.com>

> >> Thanks to Yilun for the idea of allocating the chain pages together
> >> with 'struct seamldr_params'.
> >
> >I'm not sure what this means.
> 
> I previously allocated the chained pages separately, as many as the module
> needed, and linked them from 'struct seamldr_params'. Yilun suggested
> growing 'struct seamldr_params' to include the chained pages, so a single
> allocation covers both.
> 
> I will credit Yilun with a Suggested-by tag.

Thanks, but I think we drop it in next version to keep the tags simple.
As the review goes on, more and more suggestions come, we don't record
them all.
