Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420328;
	b=T+KPMJq91j3nBt3a3Gg9OnUnxORjQwWDcFj4diKqWMgTIVCriy7AZ2cXCt4uekZscttK
	 54aN14PTPLZNM4CgXDSIkqIx8GDTzCx+btARVpGjBMvLRCLuIpivaj+SDl8SH2V3TBpdV
	 C3wRMiO4UgH86v45Yd7cxSxN43aHqbQhogttLmRiTzYkSmElTfjkXpUzVldzKgEej99U9
	 oNaHnjJy3kAogOWqMSWI4sWvsVXTl7G37wB46+zcEtMLdCVrzFE+uGIpzRDWK3GgIr2Dx
	 +Ar0ApfYW6060CBiV+V9RMTK4nTi84MuEr8GymbKDg3InZ4BGhvuJiPxBDF50D0vrBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420328;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=k/cLt6sLs/i57UjSMAYGmUyFLydITmwhGeX0xPWPgS0=;
	b=pLiTVHr+48G1H2O/M2csiPXafJAoSNhCFMVCGNkmaQbvqR3UYI1jSq2ILrAAfkdtYyYT
	 FPJE2FgNSPHN4Tbjn5qUwaVEk+lHLAnCAVe3OAP6FbqJAanPuORaD3DnM2oeOXtskVPrl
	 l3yVr5wPkgspHwiNn3bqkSPZEUbPokRmcsH3/cbXuulldiuxU25QZ/wPdsefD5wrr/gqj
	 2xUHPkaH0dpe3sdi2e+90FdwNVXmhEFEWIKQbpOs2NjNM2pb0+//O8Q1ZqNlWnCx5BWpj
	 ZKqWgPRN8eFfSXC0yhYOmEUGpzPMtwpACrBl8PLIJczp8cYNJi7tPvWb/zJORjpzq7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=My9E5fxt;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF9606A31F
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 07:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AEF9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=My9E5fxt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795420329; x=1826956329;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=k/cLt6sLs/i57UjSMAYGmUyFLydITmwhGeX0xPWPgS0=;
  b=My9E5fxte1lnXHEZB6P0y5PtNheYmtNAlBq2WyyFJYzCp8ghNT2cThwi
   WvpoBg42g8OeTery2amYeXdUDNSRt9wICbXti08jK/g042Kggykahs/FP
   Qr7oQRJfS27EBvCY6idHe12bLCz1R0ItY2Peyx3vg4SOc28soKxGxdCSI
   0h5UTi24gK1axJUrPX6qcWMBNCQUfs0mHKXfWAszYlBSxH62/hzuHsV3D
   djLPX2FdLYM0s1CL5JAFEbpMl6goA21AwPOx3F1NW6VHAHlR2J6RxsQ/7
   qTcJ9DBBv3omIbm7y7ME3M8yJJqqy3gpimvCc4S5dJFUTHp4Hwrc83R1q
   g==;
X-CSE-ConnectionGUID: ymkCk08kSg2Ho9MNEMViFg==
X-CSE-MsgGUID: iy0KRecFSaKkMxWcru8u7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4089507"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4089507"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 23:52:03 -0800
X-CSE-ConnectionGUID: SaASRl1uSRaMxGCpBNNV4w==
X-CSE-MsgGUID: Mg5Yn3UlTi63srEUJBum4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11568566"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 23:52:03 -0800
Received: from [10.245.244.212] (abityuts-desk1.ger.corp.intel.com [10.245.244.212])
	by linux.intel.com (Postfix) with ESMTP id D8B1C20B8CD1;
	Sun, 22 Nov 2026 23:51:55 -0800 (PST)
Message-ID: <31de312c72b2c4ac3b937c91005e24cd0631c876.camel@linux.intel.com>
Subject: Re: [PATCH v5 2/6] x86/virt/tdx: Configure add-on features on TDX
 module init
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org,  Kiryl Shutsemau	 <kas@kernel.org>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen	
 <dave.hansen@linux.intel.com>, dave.hansen@intel.com, kvm@vger.kernel.org, 
	yilun.xu@intel.com, xiaoyao.li@intel.com, sohil.mehta@intel.com, 
	adrian.hunter@intel.com, kishen.maloor@intel.com,
 tony.lindgren@linux.intel.com, 	peter.fang@intel.com,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, 	chao.gao@intel.com,
 nik.borisov@suse.com
Date: Mon, 23 Nov 2026 09:51:54 +0200
In-Reply-To: <awPtUgf+YZ0xfD6v@yilunxu-OptiPlex-7050>
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
	 <20261111-tdx-module-ext-v5-2-c74f764abc3d@linux.intel.com>
	 <d012c58931efa38a782ac3484ea930d05a6407a9.camel@linux.intel.com>
	 <awPtUgf+YZ0xfD6v@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-23 at 15:37 +0800, Xu Yilun wrote:
> The get_tdx_usable_addon_features0() in this patch is enabling all
> add-ons that *the kernel supports*. And this policy definitely needs
> explanation.

Ah, that part I missed, apologies. My suggestions were based on an
assumption that this patch does not enable any add-on so far, just
adds plumbing.

Thanks!
