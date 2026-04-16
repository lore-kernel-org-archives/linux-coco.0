Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ADD3921CA
	for <linux-coco@lists.linux.dev>; Thu, 16 Apr 2026 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331629; cv=none; b=huBijYu87WP818QfwJ9vpEm4QKEojgSxbvQ/m+qUDalDf7SEK1u1O2BiFGadYuWVe8BdnqxBEQEhyqF4nzEJp+lpcmkrD1RlC7eXwklybej2QKePKIQxudzZzgPVw4PSFNvnWTNGOGnRKMKrDA/lIzwfbfzM+dDXulNBywnELjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331629; c=relaxed/simple;
	bh=odh4Ab4M7olPu40lFM1McLaJy3hd4bYZoX7Q+SGAqJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPcy4tTA71SN/ts/MiinPcPIMnxXT8776toa4Lzu6WkzO77gbwbfCabK+8m/TiW3UexdP3qnhNEHDh6n6967YhEsy8Qb2WFD3emsRxbNLuLxb+H6y3PDkdwiJA4Ek7+KpSaOTiC0M+YTiE4gNhgNKkNHlLooKlE2KHk82ti2HuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sh1gU0cd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sh1gU0cd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776331626; x=1807867626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=odh4Ab4M7olPu40lFM1McLaJy3hd4bYZoX7Q+SGAqJE=;
  b=Sh1gU0cd5YurGT3spvllJ4nghut4qtW57bMGu8IQBYROnq3OIufz3xJp
   YOLatzhCINdh+1qy7xwZEd/Oef2JX4S1QGTY62D78+Hya/U15wynmrwtZ
   st79ycd+od2ekvZrJ47zmVkS233PLlpH9pDMVXXIet+0VdMNXy52jKzvL
   9mEgkAhRh6jtjjkJfHktoRlhxBZbU9Ou+RNsRVjajSsT3u3lsNoBXg5HZ
   ihqX0Z1MVfX+DIXKMJFjNN60AqwbLkTH7oWa8lCSyp5hqzZamIhtJvYLq
   LwjBOCmVlBR2vkPlxQddq3HvpHaqp5VFv8acAg/8QDn102k/OiU5xWWFj
   g==;
X-CSE-ConnectionGUID: E46RtyuCRsSa5uR1nR3gCQ==
X-CSE-MsgGUID: slpyrZ5vRFOPVFuEvQtQXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77400039"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77400039"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 02:27:06 -0700
X-CSE-ConnectionGUID: H4y1wzlFRZGJbgKx1rFaKQ==
X-CSE-MsgGUID: Ac030fLqQkK/Nz5K07C2vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230611680"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2026 02:27:03 -0700
Date: Thu, 16 Apr 2026 17:05:08 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, x86@kernel.org,
	chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com,
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com,
	kas@kernel.org, xiaoyao.li@intel.com, vishal.l.verma@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/31] x86/virt/tdx: Add tdx_page_array helpers for
 new TDX Module objects
Message-ID: <aeCmRKJ7ULcnAM3m@yilunxu-OptiPlex-7050>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com>
 <20260327160132.2946114-4-yilun.xu@linux.intel.com>
 <69db0916ba63c_fe08310034@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69db0916ba63c_fe08310034@djbw-dev.notmuch>

> > A main difference is HPA_ARRAY_T requires singleton mode when
> > containing just 1 functional page (page0). In this mode the root page is
> > not needed and the HPA field of the raw value directly points to the
> > page0. But in this patch, root page is always allocated for user
> > friendly kAPIs.
> 
> I think this undersells the fact that "singleton mode" is a premature
> optimization that requires complication to take advantage of the benefit
> (sometimes save a single page allocation). The Linux implementation
> forfeits that small benefit for the larger gain of cleaner kAPIs.
> 
> > Another small difference is HPA_LIST_INFO contains a 'first entry' field
> > which could be filled by TDX Module. This simplifies host by providing
> > the same structure when re-invoke the interrupted SEAMCALL. No need for
> > host to touch this field.
> > 
> > Typical usages of the tdx_page_array:
> > 
> > 1. Add control pages:
> >  - struct tdx_page_array *array = tdx_page_array_create(nr_pages);
> >  - seamcall(TDH_XXX_CREATE, array, ...);
> > 
> > 2. Release control pages:
> >  - seamcall(TDX_XXX_DELETE, array, &nr_released, &released_hpa);
> 
> It is simply a bug if TDH_XXX_DELETE does not return every resource
> passed to TDH_XXX_CREATE. The only "leak" case to worry about is that
> TDH_XXX_DELETE fails. In that case it should be "fatal" (TDX_BUG_ON,
> system can keep hobbling along, but panic_on_warn() would not be
> unreasonable). If TDH_XXX_DELETE fails it indicates some catastrophic
> misunderstanding between Linux and the TDX Module.
> 
> So the seamcall in this case has no need for @nr_released or
> @released_hpa, those should already be known to the kernel.
> 
> What is missing is an architectural guarantee that TDH_XXX_DELETE
> success == "all resources you arranged at TDH_XXX_CREATE time are free".
> I would hope that is already the case and AUX_PAGE_PA is only an

Yes, it is already the case.

> unfortunate distraction. If it can ever be the case that CREATE and
> DELETE are asymmetric on success then that needs to be corrected and
> Linux will wait for a future module that can make that guarantee.

Agree. Thanks for this summary as well as the singleton-mode one.

> 
> I think that cleans up a bulk of the logic here to abandon caring that
> the module tries to remind us what we are releasing.

Yes, I'll delete all these "released page matching" logic.
