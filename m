Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF31B46DFF7
	for <linux-coco@lists.linux.dev>; Mon,  7 Sep 2026 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780061; cv=none; b=QJhaNWlVEUZ3P+9QVn/2aFiyh+v5aZqsCd1/gUqPeXoPhuyk1HQ5cJpP0Itt5O/WYLwdo9pU6WP5T4Xc5Oh1SoZv0PnbckLKaMAEir2lzpRYLyYUgtJA5Tfl+Pt8/cr3siaNyiaVwm7uXQ7+eZS4s8wCHJ48ecnP4SUH5cqnATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780061; c=relaxed/simple;
	bh=3xYwyiFqI+oPMMxVQR36OSf5t9Nu6Dp63Jwgu+jol4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0e1g+EMBqv3KEK8pcJQLrr/Qnzlpo4xCi6NQNYFZ0zOZe/ou34BOAUWN7IL26kMHpkL6zGc5Alo8f9J2ocrJ0qaXs9PYN7ORiUSKch3ZQCIv5unSdua+xeav6W7GYEZj02JdJmy2EqqLRi2sfp4OaLQq/6sO55ImkIGhWfplZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMOy++Vz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMOy++Vz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788780056; x=1820316056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3xYwyiFqI+oPMMxVQR36OSf5t9Nu6Dp63Jwgu+jol4c=;
  b=AMOy++VzeeNPqoSiwo7AszF81+5kItua8nFiq1UzG0KtY7oCfSJGWexy
   Iko4rEtxMQKzIrhrAKO2EfPJ6qtBTjCn6oDMxEwLujUPrBidZhZ8QAVPe
   OEo6B3BIIwaf/Hsbd4O5q+DBwCESvJOYR9Sk9syuDnVEj+I7Gfq3Shq1u
   Wp84yDpg2IkNkHHR0+vOBNZIWfJ7xr8uOZmJ4Zeno8dsWcNgugOrU+RrI
   lIq+s+hgucxuk75+SrnaL0YeGOwbKHZKEtjLXO5MSWGzq3f/K/ds1mxvK
   BKBOXHMyR4iuT6VqeMM9z17+KjFSIPjffOIBeso91Co7PHpMMnGjVJP+4
   A==;
X-CSE-ConnectionGUID: D+SJ8tnDQ/KdzL06NCnA2g==
X-CSE-MsgGUID: hgxGmvYZTcmp0Oe9h8I81w==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89200834"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89200834"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:20:53 -0700
X-CSE-ConnectionGUID: 0etPjfBVRy2LZBwfgJq9cg==
X-CSE-MsgGUID: fMzm8kKRQwi0is0pY2vqPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="274836654"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.57])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:20:50 -0700
Date: Mon, 7 Sep 2026 14:20:46 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: dave.hansen@intel.com, dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, kas@kernel.org, nik.borisov@suse.com,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v5] x86/virt/tdx: Formalize SEAMCALL leaf version
 encoding support
Message-ID: <ap6eDuCtcQ_GjTbI@tlindgre-MOBL1>
References: <20260901105436.461823-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901105436.461823-1-yilun.xu@linux.intel.com>

On Tue, Sep 01, 2026 at 06:54:36PM +0800, Xu Yilun wrote:
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -122,9 +122,11 @@
>  #include <linux/compiler_attributes.h>
>  
>  /*
> - * Used in __tdcall*() to gather the input/output registers' values of the
> - * TDCALL instruction when requesting services from the TDX module. This is a
> - * software only structure and not part of the TDX module/VMM ABI
> + * Used in __tdcall*() to gather the input/output parameters of the TDCALL
> + * instruction when requesting services from the TDX module. "version" is
> + * encoded in RAX along with the leaf number. Others are raw input/output
> + * registers' values. This is a software only structure and not part of the TDX
> + * module/VMM ABI.
>   */

For better readability and a few less lines of changes, you could just
add a one-liner to the existing comments:

Note that "version" gets encoded into RAX along with the leaf number.

Anyways, I'm happy with the current version without changes. The patch
cleans up the version encoding issue nicely, so:

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
