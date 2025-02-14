Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62D6FC5;
	Fri, 14 Feb 2025 00:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739494556; cv=none; b=ac9IT/IK2ZLWLY1isSD95umaOpuOc0nW1W9WNM5Cu9VHss73/4jHnWgA1rjl2YY4+QMGK//AIvGlZXnIPUGMJXo8mkDpMmcBfC7HhivDEnlLh5NmqMynd7P9wWt2hblnbNCfcNh/M1cXenHQtDLMj/Y3zlCLJMKQgH3eFtoS+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739494556; c=relaxed/simple;
	bh=xVMsNL3oRPIShTD32393oiFY2QHSrhABEYEfaUhgvsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgsUWrDOOBB4L68gYiFDLtvsmnPhZPDeMu+Q2aEEN+kEpcZhOM6o4flBEXpQJwTocgnB0lwblr9hmkCGcXnO0VIclsrWfjszNE9J/QI4uUkTMw9gf47/Dmais8ISdWwDAqfg2veLg9sd5hPqrek5WxJeT4Pgxt3qK7NlnaXAdNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp4kIUbJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp4kIUbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739494555; x=1771030555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xVMsNL3oRPIShTD32393oiFY2QHSrhABEYEfaUhgvsw=;
  b=Qp4kIUbJVMs0Cof3GcW2Stu/xAkxw3olsOMt0XdnHh1JCQrQ5hEtSwvb
   HJ0zdx0PhfQXJeRNiR780pmIb7ddYpehAAH51RjAn9aDbCe6kJaDJfQC3
   gkSRY5eDGvxAXmnlyHJc/AKSB/pxD9lY/BPnCfuyiha/om++/q11LxTIH
   RPWciHZybjCaGHnVfLy53uwfxx4ybVuwerw6wtmDUZJuWibCeGLS9CWKy
   P4wmvZLhpbzEd65KyCm4koCk/vr5t6agGPDBQ/sJYhwnaSgHY6ByH61ph
   /PBcLM6okdJsdC5FLevbFfYTUiKI0tgMEdlz4Y/4UiGN4GBScbPmQXsi6
   Q==;
X-CSE-ConnectionGUID: vFd53fRORfq1DyXsLIQE5w==
X-CSE-MsgGUID: L4NQ/KPUTFKiw493bD0lLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40154378"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="40154378"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 16:55:55 -0800
X-CSE-ConnectionGUID: qQsBAxi5RO+D8XBr4PV+2w==
X-CSE-MsgGUID: Z8joHWw4TtGx5DHJUIzPMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113830199"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 16:55:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tijzh-0018t1-11;
	Fri, 14 Feb 2025 00:55:49 +0000
Date: Fri, 14 Feb 2025 08:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Cedric Xing <cedric.xing@intel.com>
Subject: Re: [PATCH 1/4] tsm: Add TVM Measurement Register support
Message-ID: <202502140854.9CZ1xPmC-lkp@intel.com>
References: <20250212-tdx-rtmr-v1-1-9795dc49e132@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-tdx-rtmr-v1-1-9795dc49e132@intel.com>

Hi Cedric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-Add-TVM-Measurement-Register-support/20250213-102639
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250212-tdx-rtmr-v1-1-9795dc49e132%40intel.com
patch subject: [PATCH 1/4] tsm: Add TVM Measurement Register support
config: nios2-kismet-CONFIG_CRYPTO_HASH_INFO-CONFIG_TSM_REPORTS-0-0 (https://download.01.org/0day-ci/archive/20250214/202502140854.9CZ1xPmC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250214/202502140854.9CZ1xPmC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140854.9CZ1xPmC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_HASH_INFO when selected by TSM_REPORTS
   WARNING: unmet direct dependencies detected for CRYPTO_HASH_INFO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - TSM_REPORTS [=y] && VIRT_DRIVERS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
