Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11A914884C;
	Wed,  7 May 2025 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596692; cv=none; b=ngz17gcauDPLnuA09tbsLdWGrsSFoLWdcC0+2++26JL2Nf4arU3C1DgIFPcdkQIqXr7YRbXHf/Z7yZ20wrpT6iVAM9LPipscH+wBi1VLMbDxUEybhJAPH1bfoXCzhwIAGP9+oucgJfX2UomVk6ZaoNEgS+9JDIDACiV4YAfVMAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596692; c=relaxed/simple;
	bh=dET57/3w7AB13kQwYH18hcOd/6ONv+xqKFslnB4Aw1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdfMC87jIEbXjLAGTAvPBExX07WDbUvt1SyHmBrVyjK0++2MRkcuv/tEHlXn2g/zHvU+hH/WU+NyFmDxqf5LE2knKXtZa/fWLkfSHspPbxV+B53yqkt0HahbRZsc7pafdSLldyDg9aJGV1orDnmqI77n1Sdleyo5mmKd0K6jtsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U45b/3yM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U45b/3yM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596691; x=1778132691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dET57/3w7AB13kQwYH18hcOd/6ONv+xqKFslnB4Aw1E=;
  b=U45b/3yMJ6ui7t36H472iOw8EiS4BqR9+sDz2yM9va6dRA+UwEp3c006
   mjaPcMgfIqnkODrs7nzSYmFVDb8+bZcXbK8P9FOftFIu0MA1Eq1oczsz3
   1ptKfuzXtzwVtSCYlB4zg8LuE+PbBRnyjPL2wC2t+HR9vF8jbaHpCQ91T
   qiyBuP8JesNIy7hPqMXHAWO9yRtTSZar8VSUCBvc0jr+wPdg8w6xqCrvt
   +26j77kocWa0pnEFtZ6CjuBQUceT6pbovm8PQQKooMMic7C/oe5qqwXFN
   kU1TXXmCH8JBN61/gZTh749AIJFLPIwGXjyZxCdglRBOI022h0iY8DRmJ
   Q==;
X-CSE-ConnectionGUID: C4OEAXB0Ty+AE7RUM4A1PA==
X-CSE-MsgGUID: Dmxqm59oTpmTtn7xID62CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35932873"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35932873"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:44:49 -0700
X-CSE-ConnectionGUID: c4D2Ws4lRaymkTlaqFHm/g==
X-CSE-MsgGUID: ocnwfwJRR2WLdCgnFPKUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140959206"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2025 22:44:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXaF-000769-1E;
	Wed, 07 May 2025 05:44:43 +0000
Date: Wed, 7 May 2025 13:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org,
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Subject: Re: [PATCH v3 2/2] x86/devmem: Drop /dev/mem access for confidential
 guests
Message-ID: <202505071309.Aa4vRJxa-lkp@intel.com>
References: <174491712829.1395340.5054725417641299524.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174491712829.1395340.5054725417641299524.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/x86-devmem-Remove-duplicate-range_is_allowed-definition/20250419-080713
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/174491712829.1395340.5054725417641299524.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [PATCH v3 2/2] x86/devmem: Drop /dev/mem access for confidential guests
config: openrisc-randconfig-r073-20250428 (https://download.01.org/0day-ci/archive/20250507/202505071309.Aa4vRJxa-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071309.Aa4vRJxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071309.Aa4vRJxa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/mem.c: In function 'open_port':
>> drivers/char/mem.c:604:6: error: implicit declaration of function 'cc_platform_has' [-Werror=implicit-function-declaration]
     604 |      cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
         |      ^~~~~~~~~~~~~~~
>> drivers/char/mem.c:604:22: error: 'CC_ATTR_GUEST_MEM_ENCRYPT' undeclared (first use in this function)
     604 |      cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/mem.c:604:22: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/cc_platform_has +604 drivers/char/mem.c

   586	
   587	static int open_port(struct inode *inode, struct file *filp)
   588	{
   589		int rc;
   590	
   591		if (!capable(CAP_SYS_RAWIO))
   592			return -EPERM;
   593	
   594		rc = security_locked_down(LOCKDOWN_DEV_MEM);
   595		if (rc)
   596			return rc;
   597	
   598		/*
   599		 * Enforce encrypted mapping consistency and avoid unaccepted
   600		 * memory conflicts, "lockdown" /dev/mem for confidential
   601		 * guests.
   602		 */
   603		if (IS_ENABLED(CONFIG_STRICT_DEVMEM) &&
 > 604		    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
   605			return -EPERM;
   606	
   607		if (iminor(inode) != DEVMEM_MINOR)
   608			return 0;
   609	
   610		/*
   611		 * Use a unified address space to have a single point to manage
   612		 * revocations when drivers want to take over a /dev/mem mapped
   613		 * range.
   614		 */
   615		filp->f_mapping = iomem_get_mapping();
   616	
   617		return 0;
   618	}
   619	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
