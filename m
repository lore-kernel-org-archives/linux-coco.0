Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50B30DEDD
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 10:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769424761; cv=none; b=LyP5BxiQcin1r0ehnaW2LB4vNcd08Ej+Mi/GvDrnDxnp5tG2Jfqpi7WsHn3xmju0XhGhnoEM3tOoanmRgaXTrZ+JuXluUq7srjjPc7VDUGOD1u7WlcJITvxxpUSPNmMzZqfWce7aBOkvqqePR8aHPF1mPKd/GVdxZViyp8rV9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769424761; c=relaxed/simple;
	bh=ijnodV8LAOxWL3In+5gpkwjsBhsNW/OSaWcj40K0cOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXgZ9poEyF0lu4FHqMFiLYHVmbmpgLd8I1/SkKt22najc424BkO9qqkWQZJzPRN112FHgMgJZk6/+0l67IB23FYA/6K9gRwQNf4jkQFYMwaU9CDNhDiRr/OqyTMCK4DVHsPt6LP7lXCq7FdPvNrDNTVYXkFYkQMY004YitJJufA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdXD+HLH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdXD+HLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769424760; x=1800960760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ijnodV8LAOxWL3In+5gpkwjsBhsNW/OSaWcj40K0cOc=;
  b=ZdXD+HLH4EjicSYvTs19G6jQSpj5DbvwNEW4tOS81HycQrqiZx2H2a2b
   AgG+0Gj+LnKavqAmB1Yzy2ehJSfCwxSF8Ra066mkZ2pTqePfYd1xSFF36
   qh54c+sFWekVHfOgQaiBU1xLhNQgp1ObxDILBX51WmRkrgJTYaQX6Lfil
   Z9dSts2Coehor2VkFy3Ghw53A+owOFDPo+nsqSrIa44dj2FWgtxHbwlvf
   N6pupsyMV0jfF2O2bbYPVOI9Rh/LAEjqkMj5xqRGmS0MliCBKa4Y2dgge
   EOjvDpX0CruOmOtyvv0CjImY5fr19YSamsgl1K+ydo7ct/rxl5FrSxDSQ
   w==;
X-CSE-ConnectionGUID: KfkpkeWFT/SxGhxes6ueww==
X-CSE-MsgGUID: rLYBKvq8RkSQT+CbEkZQVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="88180346"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="88180346"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:52:39 -0800
X-CSE-ConnectionGUID: fDwZvh8rTRec/6DiFhbHnw==
X-CSE-MsgGUID: pHab7SjIQNyBxcS8GdG/rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="230600695"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:52:32 -0800
Date: Mon, 26 Jan 2026 12:52:29 +0200
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
	ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
	yilun.xu@linux.intel.com, sagis@google.com, vannapurve@google.com,
	paulmck@kernel.org, nik.borisov@suse.com, zhenzhong.duan@intel.com,
	seanjc@google.com, rick.p.edgecombe@intel.com, kas@kernel.org,
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 19/26] x86/virt/seamldr: Install a new TDX Module
Message-ID: <aXdHbaVQAqIQyWpA@tlindgre-MOBL1>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-20-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-20-chao.gao@intel.com>

On Fri, Jan 23, 2026 at 06:55:27AM -0800, Chao Gao wrote:
> After shutting down the running TDX module, the next step is to install the
> new TDX Module supplied by userspace.

Maybe clarify the next step part a bit with something like "the next step
in upgrading the TDX module"?

Otherwise the description can  be a bit hard to follow if not seen in the
patch email thread context.

Other than that:

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
