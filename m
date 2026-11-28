Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858541;
	b=X7k9+UTW6GUmQbBvF5FSdjkULrBtYSDg3/yJ5+91ZzZxDKjzGuskH06H4HpLWlvJWO+f
	 6T8z/xFS5bR7/gWoJqYTxtPy3X9kbf4+7HZsaa7vPOY1WNGNd1znZsHme99eO2FOqWa3n
	 RMx9LkS4vTPYg39vV3bOqvqamP4p2f3Kj5K19wKRFAqM1qTGHbmSzGWRMoZ0hZIh6lPGb
	 IU97L7J5JzZRO5sSaOCYwC2ct0zGkk7wMbORglphwE/xlEyTTtCY0GiGfxFrPJr+sa/H8
	 FEflbJuoi15MaUb59gFOVYbNWTD59Wo5qdcc6Hgk1nPIDoxCr1AhFvJU8E1cmbkv99A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858541;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=T2jo7pM/6PDKnuisVriJGAxNf7QVeypBzzf9JQ7D540=;
	b=KlyhPuq0k4PVm6Q54GhTDkMKCj+HorP+hto/XLRF3lOTd2FkaVuH8BF4CvXavhN+2xlq
	 eZPW+6JA6se6AY4lUBGqb6irVu1O/gAsoywPyN22JTB3qcoWY7ZF8vjZMiq35niwN8Cqf
	 4BehHhAiuRj7O4QPUI2RnDzqyOZHEj+K2FVtew6WrKyYdD2kC6NMCFq9mcQdmfduMacuJ
	 r+Pqd8CKXePoeZkPnu02VunSOJDG9U1xk1pPf9FCEc/Mnln7fWIv8JNP1QgsPMBEnpT+I
	 tqU7AjJKu/E51tn3+GnsTQ30PI1YZeaOUYSYp1XZfZwW+bGdEQDfYve7FfrmyFJzcqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LdryvvZu;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9553A606A324
	for <linux-coco@lists.linux.dev>; Sat, 28 Nov 2026 09:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9553A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LdryvvZu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795858539; x=1827394539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=07w0okp0bbzLim5DmVtzpzZVh8uI3qagnYo0AvkQVWc=;
  b=LdryvvZuQzPKmZ/98WxkmNiyICldqeDzc26ncxlEhlHCVgcrZ6Qj0JGl
   F2De/PvBOxRndqw3VC+Y5hUqy4iW6EL9AWhtMFZF5XavzgZVt6PODQkhI
   N3kacuFbIZ9ra5EjJyxb3+83XCGdLb/ZPEJiYCCIDUNPad5iASA8SjJh8
   FYH2oSx7QTF7JnR+Ms/QJID0JwPUw/JJyQkO6lIpeaNXYhe2BV5uxMfB9
   YegKXSJLuk3QfWfvgYQQ6sZLtcgjUXEEMSFhX4FX2salQxVn0RDSn96Iv
   oGOYWjsyzrjKrqSWqH7mDH8I4MlWVWvGJXWjWXRTRmF/vWcgmtmeEwzN6
   g==;
X-CSE-ConnectionGUID: 24vFZaIwTb+bhmlYNU6s9w==
X-CSE-MsgGUID: Q5kcq0AhQSK199ugscDwvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4738041"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4738041"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 01:35:39 -0800
X-CSE-ConnectionGUID: hGnbJ2ZiSgSwVdoz/Xcf7g==
X-CSE-MsgGUID: +LUksoF1TZywYXT/SAzF2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="13151248"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2026 01:35:35 -0800
Date: Sat, 28 Nov 2026 17:25:14 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Gao, Chao" <chao.gao@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"Xu, Yilun" <yilun.xu@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>
Subject: Re: [RFC PATCH 2/7] coco/tdx-host: Establish an SPDM session with
 the device
Message-ID: <awqd+kqYabFX3xO7@yilunxu-OptiPlex-7050>
References: <20261116111037.3478844-1-chao.gao@intel.com>
 <20261116111037.3478844-3-chao.gao@intel.com>
 <ac7befe5081a489172d87402e55355852a9e62ac.camel@intel.com>
 <awWKRJQ3_rIgxJVC@intel.com>
 <30852ad50fb3085de04145342aaf1caf145488fe.camel@intel.com>
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
In-Reply-To: <30852ad50fb3085de04145342aaf1caf145488fe.camel@intel.com>

> > > > Pass the messages through two pages per device, one for each direction.
> > > > One pair is enough because PCI/TSM serializes operations on a device.
> > > 
> > > This probably needs more explanation.
> > 
> > Several functions of a device may want to talk to the TDX module at
> > the same time, and each of them may need SPDM message exchanges. But
> > PCI/TSM serializes all operations on a device, so the pages are
> > allocated once per device and not once per function.

Correct. But we don't have to mention "per function" serialization for
now, this is for secure passthrough of the TDI. For link encryption, the
connect/disconnect operations only targets the device (physical function 0).

Though this is not the answer to Rick's concern...

> 
> I mean there is a buffer for request and a separate buffer for the response.
> Once the request is sent, why can't the same buffer be used to read back the
> response? This may be a lack of understanding by me of DOE.

I believe it is possible. The DOE protocol defines serialized
request/response flow. And the pci_doe() code does so, the entire
request payload must be sent before receiving any response payload.

I didn't try on real TDX module if tdh_spdm_connect/disconnect/mng can
work with one buffer, but don't see reason why it can't.

> 
> > 
> > @Yilun, let me know if this understanding is wrong.
> > 

[...]

> > > > +	ret = -ENOMEM;
> > > > +	in_msg_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > > +	if (!in_msg_page)
> > > > +		return ret;
> > > > +
> > > > +	out_msg_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > > +	if (!out_msg_page)
> > > > +		goto out_free_in_msg;
> > > 
> > > Maybe dumb question, but why do we need two buffers for this? After we post the
> > > request can't we just read it back the response to the same buffer? It doesn't
> > > seem DOE code is setup for that though.
> > 
> > pci_doe() takes separate buffers for the request and the response, and
> > so does TDH.SPDM.CONNECT.
> > 
> > > > +out_spdm_delete:
> > > > +	tdx_spdm_delete(tlink);
> > > 
