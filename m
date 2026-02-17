Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D53C33993
	for <linux-coco@lists.linux.dev>; Tue, 17 Feb 2026 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313842; cv=none; b=F6inNCj5ouvfkHDGOX/pnGB19NsiRQWEySQam5hqjBo0xKKfdtplJv5zXHHqmubXm1Hi4r1ilaBcOFSjJngwZyJuIjv9YrNSCB6OD6om6QUTQP9UaZyU215W/Gz31xX55tyk0Fa1VpJLD8QtWN2v/nM59rBBAaJn5teyTL6Vf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313842; c=relaxed/simple;
	bh=XSWmQ5Q2T83opbinLmZ8f9am/l/FKUxJwfKSpZTC5NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2Z3Nf6Ez8dfBH/7XNcpvu66hCcTMqT3OxLX0Jj88Kd/vHDa4t9NluRXLxlUPaTdQvtK9vKQLTo6GtoLGZeQoqwleg4TjpJfDW6El/jComV2rOVzJ+FCVupZd1UllOCLi6prB/M1jcIVkHX/aLQk97W3YdSv9T2T7To27Grl84M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7Vx1oyi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7Vx1oyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771313840; x=1802849840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XSWmQ5Q2T83opbinLmZ8f9am/l/FKUxJwfKSpZTC5NU=;
  b=Y7Vx1oyigFAaRgx+oEfXpn14jK5eKciPt9xCIk4hZtJ/ztUULyx3cbWS
   XTZ0VwbNKdNzlqYPu2+NUJk8ihjD4x3Cykf2orIEjjRp+MycxS63W1reh
   D+222sR71e0cZrFhTF8McLULjbMuIXuhTl676POxyOJzR9P46TWW1VoTr
   oNkwyIpCrJi7O99yFTtm2MRzzY+1ZKmmi5BnlcdlBxtiivRwNFkm8EUx8
   lqpwK/5wyKoUYlh52rO2tHOisMe8b44toe2qdLstSqFmEVpyHVefKKOxE
   9I6ZBeVg+9zG2N1kRXPQaQ3KZaZy/IXLmNLaklanC56aJwaI+jPGpAPSv
   A==;
X-CSE-ConnectionGUID: b9b+7O+gToqGXOWtY7UZ8Q==
X-CSE-MsgGUID: cSDGrU94RuixcnVU02NsUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="71401331"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="71401331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 23:37:19 -0800
X-CSE-ConnectionGUID: LdqnNc1GRH+1x84n5vz4Ig==
X-CSE-MsgGUID: VWF8P4W1TpSoYC5SMN2w4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218342646"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.23])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 23:37:14 -0800
Date: Tue, 17 Feb 2026 09:37:11 +0200
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com,
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com,
	dan.j.williams@intel.com, kas@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 06/26] x86/virt/tdx: Add tdx_page_array helpers for
 new TDX Module objects
Message-ID: <aZQapxvo1zijUl0L@tlindgre-MOBL1>
References: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
 <20251117022311.2443900-7-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117022311.2443900-7-yilun.xu@linux.intel.com>

On Mon, Nov 17, 2025 at 10:22:50AM +0800, Xu Yilun wrote:
> @@ -296,6 +297,257 @@ static __init int build_tdx_memlist(struct list_head *tmb_list)
>  	return ret;
>  }
>  
> +#define TDX_PAGE_ARRAY_MAX_NENTS	(PAGE_SIZE / sizeof(u64))
...

> +/*
> + * For holding less than TDX_PAGE_ARRAY_MAX_NENTS (512) pages.

The comment should be "For holding at most TDX_PAGE_ARRAY_MAX_NENTS.."

> + * If more pages are required, use tdx_page_array_alloc() and
> + * tdx_page_array_fill_root() to build tdx_page_array chunk by chunk.
> + */
> +struct tdx_page_array *tdx_page_array_create(unsigned int nr_pages)
> +{
> +	int filled;
> +
> +	if (nr_pages > TDX_PAGE_ARRAY_MAX_NENTS)
> +		return NULL;

To match this check.

> +	struct tdx_page_array *array __free(tdx_page_array_free) =
> +		tdx_page_array_alloc(nr_pages);
> +	if (!array)
> +		return NULL;
> +
> +	filled = tdx_page_array_fill_root(array, 0);
> +	if (filled != nr_pages)
> +		return NULL;
> +
> +	return no_free_ptr(array);
> +}
> +EXPORT_SYMBOL_GPL(tdx_page_array_create);

Regards,

Tony
