Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E8F1805F
	for <linux-coco@lists.linux.dev>; Tue, 12 Dec 2023 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1pspVhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702377218; x=1733913218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XeplGklgHLJxoovt/kg80zc3J0HsmV+8BKBRljb8r84=;
  b=H1pspVhejhhSHfQigV9I+f4foiRCqvH8e/XZfvt6o36RXoMdnZ0E9tYo
   C5cyQLLghR/iz5BxMCgdkhoj7E2G+GOBnwSxLhzt/AhfErwEg/vJZ3895
   2NV6rtowSVwwtKkTrReZZwhwzD6hz95aSSlZ+CNkNawd503qDsPqlb5WC
   HmsFPIeE39B+dUjh9cfmMBcnvqATEh+piMf1mqItCAN6Ez72LJZqmSNwN
   NAOMZJLDnLQG8heKKQ0guT+fXK2UzlPBjBpTW8WfhlbbuZsijLmJpTiNh
   EZYy3UCPipqWZSn749vLwmXDPhVOiiNYzeo64InTYMjDe4Pbw0QIGOlt8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="425910173"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="425910173"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 02:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="14912358"
Received: from adamjame-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.48.205])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 02:33:35 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 9BC6710421C; Tue, 12 Dec 2023 13:33:31 +0300 (+03)
Date: Tue, 12 Dec 2023 13:33:31 +0300
From: kirill.shutemov@linux.intel.com
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: mingo@redhat.com, tglx@linutronix.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] x86/virt/tdx: Remove duplicated include in tdx.c
Message-ID: <20231212103331.pyuuz4ffve4g4zv5@box.shutemov.name>
References: <20231212003825.70297-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212003825.70297-1-yang.lee@linux.alibaba.com>

On Tue, Dec 12, 2023 at 08:38:25AM +0800, Yang Li wrote:
> The header files linux/acpi.h and asm/cpufeature.h are both
> included twice in C, so one inclusion of each can be removed.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7713
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
