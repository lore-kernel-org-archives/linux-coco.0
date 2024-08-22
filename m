Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A9149E14
	for <linux-coco@lists.linux.dev>; Thu, 22 Aug 2024 07:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724311137; cv=none; b=ap6FXNjf+gHGPd8O6LX64bkhhBwOgrhNutPkPW3QVuAQj5HvMrBfbW611/YI+kLVzGCcQOj1A4tkiAkGwqEqffhRfqGYoEpefxqK5Wtb85MPe0FUPOdKw2aO0xhtt/WjVeH5n21TEe1ooIK3InB37/XrgFGGXNebEaSd5URpJOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724311137; c=relaxed/simple;
	bh=tfl7e9ln0DuxlxyoIi5X/enDl7DGnBRipVB5MOrRhlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqapDqbE9tQDzFh1aUoenPl3OTXTxoEGGnhTkKqTj3UzzS786TLXisPh6reLZ9cbKpjpdWkGYdQG7maGRUT4jxXn6QRJygjQWo3nezrdkeDBapnYnOkQ5pczWiaCBk3fieK/JrfnVl12gjSdB+lzq5JEJaQkFjstWtoID8C06kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7orw/cl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7orw/cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724311135; x=1755847135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tfl7e9ln0DuxlxyoIi5X/enDl7DGnBRipVB5MOrRhlo=;
  b=f7orw/clf/cUH6D7H2HSIgkFj6JzdBI6XrERqOii5rFKarGCWyX2YuMG
   Qryy6fNHn9BrI8HrAE4HwsSQt70dTITrRM3fO+3kbP181U1RD/i/cbfyB
   cHK2HQON+AkCi4JwsiHnQ5I+cpBV0l35IKEuSrPFR60aueUNuZQYr7BOG
   aEXLx0DBXj3rXpNEwHUAcVHOtgAKf36YQh72fq0BdJdBdVhMlIdZaVBCn
   gzR01wmC338PI8S5SEpa+YrvY9mmsoRGlLgtoTrnotXnJwKkXxgVY4sFV
   RYqziuCmQT7ORi2UMZHSxBxtIyK2RnLK97M0sr9mbcVhYhM0ZFDSPkVuQ
   w==;
X-CSE-ConnectionGUID: apE96tbCRVS2yHMqWRQB7A==
X-CSE-MsgGUID: ke76PhVLSQ20kdSYgvK8Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22840546"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22840546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 00:18:54 -0700
X-CSE-ConnectionGUID: uHu9euKUR4ear3ekZrTPcA==
X-CSE-MsgGUID: knW/xHHaQ2SE9X9A41QeWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="61884582"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 22 Aug 2024 00:18:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id EEF8F43E; Thu, 22 Aug 2024 10:18:47 +0300 (EEST)
Date: Thu, 22 Aug 2024 10:18:47 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Yuan Yao <yuan.yao@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yuntao Wang <ytcoode@gmail.com>, Kai Huang <kai.huang@intel.com>, 
	Baoquan He <bhe@redhat.com>, Oleg Nesterov <oleg@redhat.com>, cho@microsoft.com, 
	decui@microsoft.com, John.Starks@microsoft.com
Subject: Re: [PATCH v4 3/6] x86/tdx: Allow MMIO from userspace
Message-ID: <ur5ocxcpe33kw4qp5k4wrlgnxvgnj4a33wydwxibysfgkqh5aq@z5fm6fdk2266>
References: <cover.1723807851.git.legion@kernel.org>
 <cover.1724248680.git.legion@kernel.org>
 <41b77c0ad25ceed006d59ba259b3c2f0a7ee74e5.1724248680.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41b77c0ad25ceed006d59ba259b3c2f0a7ee74e5.1724248680.git.legion@kernel.org>

On Wed, Aug 21, 2024 at 04:24:35PM +0200, Alexey Gladkov wrote:
> From: "Alexey Gladkov (Intel)" <legion@kernel.org>
> 
> The MMIO emulation is only allowed for kernel space code. It is carried
> out through a special API, which uses only certain instructions.
> 
> This does not allow userspace to work with virtual devices.
> 
> Allow userspace to use the same instructions as kernel space to access
> MMIO. Additional checks have been added previously.
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Alexey Gladkov (Intel) <legion@kernel.org>

So, you've picked up Thomas' Reviwed-by, but lost mine? :P

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
