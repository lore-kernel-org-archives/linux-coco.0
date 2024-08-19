Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32313E898
	for <linux-coco@lists.linux.dev>; Mon, 19 Aug 2024 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724064401; cv=none; b=ATs4WOOVXU4YFMTDt8eh9OBvI3zGQNUdiWoKT7zJvcarTgf4FU5m7lfaNjPW/JiBqhCbg8zagC/hGrIamXgUHAnmdIUdG/zkTh48xWYkg7CUBRkJhoovKtffoslXCUfI10BXxfCm5UbYg7UftQQgiyIBWLDN5Zc5C+FRq5xiynA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724064401; c=relaxed/simple;
	bh=Yu5nTBsgUn2Xtj84XKelv1HG3KAz/acK86oeD6Eaopg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIRa0C8ljUiI6Iv/KJCZS4EQgKf4ZCKnHctvUGaaMqXTbeRva4zLErWn1V8M+/nzecAYwZ+PJjaOcrUo0j8J2le8rxEVxE8pF//SIDPDvPLfvwzrIv/Gydy7iO+PXcWVdpHIl+uzCkQcBK6w8ikYnR27a7FDWI1EWec0NUogVGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Osn3x+p+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Osn3x+p+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724064401; x=1755600401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yu5nTBsgUn2Xtj84XKelv1HG3KAz/acK86oeD6Eaopg=;
  b=Osn3x+p+FSqJHhXn3sifDimX4Imi1wJ2IVGNUhVikE3NSl214TY1Ccft
   nW7vuivd0OSyG7A7c/yF/BqVK8/F7O+vTMmSpL1uF+2Wxn+yPt7Xb4oGD
   rmbQZPkeO5rmyZuQBLVSAojnKLeL3VgOieiHkmDnqDh+xq7Cy7ZRomCJB
   +bxtU6Fdm/B/z3A4yN9nSZxE19qIdf+fK9Z0X93Rw3ZAo49BeyCekTzeg
   A7qkPVEVK2ybKyTomMcL3bT/dKhPPE1rah0t0cqeMA/otecpjMhtnzZtz
   CciPBHK/nJkOYQrVU4W9x4PTtsLgpi/BhqUAMKjFFDqV36lUi956EQVMp
   A==;
X-CSE-ConnectionGUID: AQP2sXVwQQaAbRGZPiUsIg==
X-CSE-MsgGUID: znvYk51aQ7mLkR1V+Gah8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26058251"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="26058251"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 03:46:40 -0700
X-CSE-ConnectionGUID: +WUgNBaaTSO5YPdUPdu8yQ==
X-CSE-MsgGUID: OyVTecAgRQyAfZxBdqPfZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="60313074"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2024 03:46:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id A9D9C2D8; Mon, 19 Aug 2024 13:46:34 +0300 (EEST)
Date: Mon, 19 Aug 2024 13:46:34 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Yuan Yao <yuan.yao@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yuntao Wang <ytcoode@gmail.com>, Kai Huang <kai.huang@intel.com>, 
	Baoquan He <bhe@redhat.com>, Oleg Nesterov <oleg@redhat.com>, cho@microsoft.com, 
	decui@microsoft.com, John.Starks@microsoft.com
Subject: Re: [PATCH v3 03/10] x86/tdx: Allow MMIO from userspace
Message-ID: <kzd355wuaf5bphybast36u3svr76glvxr5fni6vfiiwbc7zotv@uikypstswh6h>
References: <cover.1722862355.git.legion@kernel.org>
 <cover.1723807851.git.legion@kernel.org>
 <2a79d86c268d934644b8e4a5a8c59b4699fa0015.1723807851.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a79d86c268d934644b8e4a5a8c59b4699fa0015.1723807851.git.legion@kernel.org>

On Fri, Aug 16, 2024 at 03:43:53PM +0200, Alexey Gladkov wrote:
> From: "Alexey Gladkov (Intel)" <legion@kernel.org>
> 
> The MMIO emulation is only allowed for kernel space code. It is carried
> out through a special API, which uses only certain instructions.
> 
> This does not allow userspace to work with virtual devices.
> 
> Allow userspace to use the same instructions as kernel space to access
> MMIO. So far, no additional checks have been made.
> 
> Signed-off-by: Alexey Gladkov (Intel) <legion@kernel.org>

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

And you seem to lost Reviewed-by from Thomas:

https://lore.kernel.org/all/874j867mnd.ffs@tglx

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
