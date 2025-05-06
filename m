Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759A72639
	for <linux-coco@lists.linux.dev>; Tue,  6 May 2025 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530796; cv=none; b=vGfffAVZbXbDb5NI8fiyyglbZ8ratY57TzZxmHLRRQL4Djvu98a7Cc1E6tALZA2RQ3WIqTTiMz0t2Mt0VInSXLOYDIhXceO7o+38TmuP4gksTR/NOK6fwppefREUR3dCohKcNp0Xss/7NF3rgYoeVyp3sQVswtlJvZa7urkIzws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530796; c=relaxed/simple;
	bh=L/0tBLvdotzSr0mCCXPOKmtUk90V1JFkS32z0UASBow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3WBiUp4UviyJesRz6igSuw4eVsDGP9oZl2H+QCsMjKOvPAHgulnw8SWpgWErghX/ghZSchwFR0nVZV/qZx+l3YDeIAbnHjrEiwmJKa2xOvXD45fnE+ImAplgb7jVkdNIRmuvLjKjg3tq4cJIkIH0BGMwK3DAols30O0eZLobsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3JaiW3X; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3JaiW3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746530794; x=1778066794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L/0tBLvdotzSr0mCCXPOKmtUk90V1JFkS32z0UASBow=;
  b=G3JaiW3XWWsPs5OM3QuZ/wMuHuNg6TFtslkd6XBrLis0QEvy5+VEFpkg
   G3gm5DbML5csofYJQwIddR3ECawja2lMnPn6LxxAKcjUHe3keQ8Uy/byV
   T77cOSY6k7E+FuvNuOdlUJABSHqhIe4B5pqCziUcW/sKaV/3A0qH6oGP/
   B3+8LJiRx+tnQKkZIV9hsiWSAx7keUHUiqHn9Fb/IUf9c6rSPUmGYTFLw
   aqnqh1mj5lZAHb2w6HqaDUfGOksz01syV6q7YtRMSZOti3+JrgJR7Frlr
   mTQ9qCbGLhnYCNV5BSHbT1VH2N+VbX8fobJKWpMxX+jlIxUuzTkqRuySV
   Q==;
X-CSE-ConnectionGUID: R/LHXIeIQWKkATyknhm2lw==
X-CSE-MsgGUID: Smg77dwXRFSg/ZyvqB2nXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="65728323"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="65728323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:26:34 -0700
X-CSE-ConnectionGUID: huj7syngT8+YpRhNHSd7Ng==
X-CSE-MsgGUID: RLG6kC3VTNy+lTIri76euw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="139647495"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2025 04:26:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id A4C3E199; Tue, 06 May 2025 14:26:30 +0300 (EEST)
Date: Tue, 6 May 2025 14:26:30 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, xin@zytor.com, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/6] coco/tdx: Rename MSR access helpers
Message-ID: <ytnvnsmpx3l4hauayhaerhkj7n6gm6z4thjpv3fmtw2pnwfjwt@5exu3imowllb>
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-2-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506092015.1849-2-jgross@suse.com>

On Tue, May 06, 2025 at 11:20:10AM +0200, Juergen Gross wrote:
> In order to avoid a name clash with some general MSR access helpers
> after a future MSR infrastructure rework, rename the TDX specific
> helpers.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
