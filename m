Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488648;
	b=jUM4A3q0M4o2XwFMzg6E53OJu+BfzQeZI25WHXsECaTVoDCpCfanccV1RPSAcycCq3+o
	 dWvlR2W32R/KJ4LRThOKLgxJpzJ6jmb4j86+ap/ZVwJ2ykiLnNf1MI9eeL27W1Jrfz68k
	 6MaWdScP9ZG8AxjfvmZCFzdC9MTSAP36PPfMKpmgyRJqBaQffk4r0OBjylWoLd5ZfuksW
	 pFA5VeVAgbPk6r6JS/eqFC+3kxT/p7+wZ+R4aq1WBuAl9hDE2VzmRsJ2qcLXFa37011dg
	 oI/A7o3nfNj5IeEniGLgelMoDwdryqUB61NnHoxcl7Ib7mZ09vttSeszIPTe5MkPdKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488648;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=MuQWnkjdMm72dOOJi5IkGwcPnf9VPtgB8jgmhfg5EXI=;
	b=ss3QjMn6L0oY2jz7lpNUSe1HPtzGcSef8dkxfSoOD2wqpAXLhIqw/zP2LwzpBmv/b9CH
	 HOqP1TCDUZVHQ0j764Xnb5l7fycDLzJRxKAkKvpIuNdxINDkdmofD+Tc5nlKUUa0H617B
	 f5HHKThfFvfqvn9l889ptKYLx6GB/rchNp8m+tKwtkVW9OPl3VsfyqjzsN5tsDtmQfhFE
	 CiBqgPagotvBH7YpiCGo0QhcplDAb2Oc5KeoXoclL6N0UgmSC1dyWyl/ioz1fRsiLwcCg
	 NfsGgrsnC1y6gcCbyJ9PXv5A/bCmEsSx5uMCQJx5JxqAuc+DFOumGFYk1xm2up6yTbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CrqSnbAC;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8031606A31E
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 09:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8031606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CrqSnbAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792488648; x=1824024648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D5PZ+RfFqFxvF/dVjIjLDkqTgbTugFZua1E7IT+H4M0=;
  b=CrqSnbACfRUBJrT4HjX4Hcdy+TLoSlPKW+CyIKt//sCg/290eBqGegqH
   o5jSm3uVcQ/7rM5un7HgZTGMuZnfn+xM1kEPXHq5ibJQqcuxtFH7dE0H8
   lxMdZFqmao8jgwINLgVAS0ftmywKR/jCcEwr0NnJvC2YTDguvOIdphA5b
   BpHy7Ym5NcL+OgZriLFmi/JsZmdoYGU/QMimwfDkKEIFOVFv4h0jkzn8c
   kTVrHs8TW/ccSKrY/Ib/a2M5QYs6UZz/M0+z6YAvT5PWsc96izoqLaZFw
   77x+L+jezAb2yb6UU3edS4Yd/LSh6iZWwNclWwl7ehlEoi9MprDLNc8qc
   w==;
X-CSE-ConnectionGUID: dNmafHQfS3ugTZW0kjGXXQ==
X-CSE-MsgGUID: JCx/E0a7RmyBCoIIpQnomQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1080339"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1080339"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:30:48 -0700
X-CSE-ConnectionGUID: BxAfkFYcRC+lgeJZGTFB3Q==
X-CSE-MsgGUID: vD5gFVUkS16QRQR3dyExQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4583349"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.72])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:30:42 -0700
Date: Tue, 20 Oct 2026 12:30:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dave@stgolabs.net" <dave@stgolabs.net>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"dave.jiang@intel.com" <dave.jiang@intel.com>,
	"alison.schofield@intel.com" <alison.schofield@intel.com>,
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
	"iweiny@kernel.org" <iweiny@kernel.org>,
	"ming.li@zohomail.com" <ming.li@zohomail.com>,
	Richard Cheng <icheng@nvidia.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	Srirangan Madhavan <smadhavan@nvidia.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [RFC PATCH 3/4] PCI/TSM: Derive the coherent-range IPA from CXL
Message-ID: <atc0wO3ZYGg2WUXc@ashevche-desk.local>
References: <20261005070252.84810-1-ankita@nvidia.com>
 <20261005070252.84810-4-ankita@nvidia.com>
 <as0zRXh5f5kjULVI@ashevche-desk.local>
 <SAWPR12MB9992673082391212DC2F41A6E2B0672@SAWPR12MB999267.namprd12.prod.outlook.com>
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
In-Reply-To: <SAWPR12MB9992673082391212DC2F41A6E2B0672@SAWPR12MB999267.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 20, 2026 at 09:14:21AM +0000, Ankit Agrawal wrote:

...

> >> Assisted-by: Claude:sonnet-5
> >
> > Assisted-by: LLM
> 
> Do you want the model dropped from the tag, or is this about
> format? I followed Documentation/process/coding-assistants.rst
> Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]

Do you have old documentation?
It even got a new development, please drop that tag for good.

1e035297ffda ("docs: remove Assisted-by references")

-- 
With Best Regards,
Andy Shevchenko


