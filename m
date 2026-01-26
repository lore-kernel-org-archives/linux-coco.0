Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BF32E14C
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421711; cv=none; b=IAQrla6bDwNSBnUvZPVRIU0pdrtF5RK1WG/Jsg8uUncQXmDL9wHCDQ47U1yLs5T1XkN1SMX0tPo7nWXER3ZRazrF0+gTGaiPCE4PbecIRHzqYdK5R+VXdKbGVz53xyVw2xLvz+z58zn1+D8haF1M0gT7NyBacZifQGzFHUXPwzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421711; c=relaxed/simple;
	bh=bOCd0ZHllasfPj/ztR5bLnC7yLyDKWN+0vftUX4v5RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjDZlV84541vNhDiZwG7KOly8v6AQJWcubg9ndMAdazAVSXjSXBRPj/EatC8bfsd2/yHi6DbArtMpHjaiW+ImZzO79mRkU+0+wpq0J5J1SYjRcrdg/bIs4yH/DOv8DK5SADrElHRncEy5dBTJ031X22pQGPBzDYPcIlCVd92OVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C92AuVkw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C92AuVkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769421710; x=1800957710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bOCd0ZHllasfPj/ztR5bLnC7yLyDKWN+0vftUX4v5RU=;
  b=C92AuVkw3M01/vQ2e1keLDxMZI2tAvwnjUZRhTaHM41mVmZf8yZwTZwv
   IIdx1ETKK/7IjPIT8ULynEOd/OI+DkOpuqt9VMA7RtkbyKczveqG0nSug
   2eVlHQwSRyHL8H7uSodQ9MxalozjdUG40+IhPAgRu6H3sSjp7IlRyQwao
   0TSjiEMex0TWO9vN24Wf9qjt1ETYkefpj4z8X2GFxvSXluCU9Ltonk6/6
   zazE8zEH2FqIr6K2pSxZcl4aXmDWKgYEzsc7G1NVa9gFrFF8GwmqzajxB
   zRiQglmzmRTwAbhhZyMfOkMydinBr6tzE7XGQGRCl7c5/za+W+wFNnrgM
   A==;
X-CSE-ConnectionGUID: HYUcWkXyQrO2sndFHp3BUw==
X-CSE-MsgGUID: u3zolW7lQHyBn9XNc2K0rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81706695"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="81706695"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:01:50 -0800
X-CSE-ConnectionGUID: RXkXX/pfSveQb4SpZDVfqw==
X-CSE-MsgGUID: +Z4N4Jq3Qu2mOZ0v2IDneg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="206874940"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:01:40 -0800
Date: Mon, 26 Jan 2026 12:01:37 +0200
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
	ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
	yilun.xu@linux.intel.com, sagis@google.com, vannapurve@google.com,
	paulmck@kernel.org, nik.borisov@suse.com, zhenzhong.duan@intel.com,
	seanjc@google.com, rick.p.edgecombe@intel.com, kas@kernel.org,
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 01/26] x86/virt/tdx: Print SEAMCALL leaf numbers in
 decimal
Message-ID: <aXc7gZ__XJ5o0JDz@tlindgre-MOBL1>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-2-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-2-chao.gao@intel.com>

On Fri, Jan 23, 2026 at 06:55:09AM -0800, Chao Gao wrote:
> Both TDX spec and kernel defines SEAMCALL leaf numbers as decimal. Printing
> them in hex makes no sense. Correct it.

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
