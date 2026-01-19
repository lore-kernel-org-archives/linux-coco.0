Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14602ECEA3;
	Mon, 19 Jan 2026 18:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768848073; cv=none; b=V6vPjwGchwx2ysCY67jR+oHqHjmf8nRrcVjPU4RQjztuJjlIwMWL2i1tLSj5iZGCR2BLz95WE5eJkAeqyErNUmghLpYeotOJ4ff2BBnzdlICVrKMXJtkl575L1+JOpeQtO+pT8MZwUBeHavlcteNTXpn4NuCyuX9KiW8uTKjF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768848073; c=relaxed/simple;
	bh=QcM11rkwgqR54cWMF4Ry5O/lkvAKnGedpOaB4gdmyds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQCjRKk1xCW3mXAl/8hvyRK5uUOKV2f8DWm/mwN2MPKey+wgL3X5METb+VfF1RxDGoKCyXMniUuFqpF5BMybEMpnKOQMTydC2WPSOw5+zZmm0muJgcdwSDBB0SYWoJOfxRJ1/RfVXXsMW/DLbt45xsIemxGm0Re3YPap8qDONDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6v+aHGF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6v+aHGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768848070; x=1800384070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QcM11rkwgqR54cWMF4Ry5O/lkvAKnGedpOaB4gdmyds=;
  b=b6v+aHGFb6Tlv8y0qWpeJaEJ3z5BBGvja0tDhyOB4mEABTdCBSeDx44W
   u+1bSD0UbnVo/+M/0pDxJVTzjhL8td5E7yIKip3TTvG1FWIVEDBM8JweT
   qhFwciWg+Kg7PKnl8GRokaYMaJG3I0ucCX97jJouGZTotNjIhIHPf+OMd
   GHi5Z7qZSGv193mJ4QYTp+7p5RzZNqmeUWDsE3s4sZsznCf2cUG6dzxjW
   KwmyNeH7Ocv39ZivHprqSEA1w1kKXMoHjdWiqAoVBnGvRw6jEaGyItMYs
   mXvhQUpvYADIuPNpZEp33Fm743riyUgzd50So95St0/AlzuF3u8CqHMeQ
   g==;
X-CSE-ConnectionGUID: i36ShY5rR0ex3O5KURspXg==
X-CSE-MsgGUID: VoszFYLCQPeO9kJ5fqWYOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87478104"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87478104"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:41:09 -0800
X-CSE-ConnectionGUID: bFoh48EvQxacr/wGvQxdWg==
X-CSE-MsgGUID: n5lUR5CAQburQGzpBCfRqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206280975"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jan 2026 10:41:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhuBS-00000000OBN-3CRR;
	Mon, 19 Jan 2026 18:41:02 +0000
Date: Tue, 20 Jan 2026 02:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Salman Nabi <salman.nabi@arm.com>, vvidwans@nvidia.com,
	andre.przywara@arm.com, sudeep.holla@arm.com, mark.rutland@arm.com,
	lpieralisi@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ardb@kernel.org, chao.gao@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, sdonthineni@nvidia.com,
	vsethi@nvidia.com, vwadekar@nvidia.com
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
Message-ID: <202601200225.cTYuYwRI-lkp@intel.com>
References: <20260119122729.287522-2-salman.nabi@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>

Hi Salman,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.19-rc6 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Salman-Nabi/firmware-smccc-add-support-for-Live-Firmware-Activation-LFA/20260119-203221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260119122729.287522-2-salman.nabi%40arm.com
patch subject: [PATCH 1/1] firmware: smccc: add support for Live Firmware Activation (LFA)
config: arm-sp7021_defconfig (https://download.01.org/0day-ci/archive/20260120/202601200225.cTYuYwRI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200225.cTYuYwRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200225.cTYuYwRI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/smccc/lfa_fw.c: In function 'get_nr_lfa_components':
>> drivers/firmware/smccc/lfa_fw.c:179:16: error: variable 'reg' has initializer but incomplete type
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:179:43: warning: excess elements in struct initializer
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:179:43: note: (near initialization for 'reg')
>> drivers/firmware/smccc/lfa_fw.c:179:35: error: storage size of 'reg' isn't known
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
>> drivers/firmware/smccc/lfa_fw.c:184:9: error: implicit declaration of function 'arm_smccc_1_2_invoke'; did you mean 'arm_smccc_1_1_invoke'? [-Wimplicit-function-declaration]
     184 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         arm_smccc_1_1_invoke
   drivers/firmware/smccc/lfa_fw.c:179:35: warning: unused variable 'reg' [-Wunused-variable]
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_cancel':
   drivers/firmware/smccc/lfa_fw.c:194:16: error: variable 'reg' has initializer but incomplete type
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:194:43: warning: excess elements in struct initializer
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:194:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:194:35: error: storage size of 'reg' isn't known
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:194:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'call_lfa_activate':
   drivers/firmware/smccc/lfa_fw.c:220:16: error: variable 'reg' has initializer but incomplete type
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:220:43: warning: excess elements in struct initializer
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:220:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:220:35: error: storage size of 'reg' isn't known
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:220:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'prime_fw_image':
   drivers/firmware/smccc/lfa_fw.c:290:16: error: variable 'reg' has initializer but incomplete type
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:290:43: warning: excess elements in struct initializer
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:290:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:290:35: error: storage size of 'reg' isn't known
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:290:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'activation_pending_show':
   drivers/firmware/smccc/lfa_fw.c:360:16: error: variable 'reg' has initializer but incomplete type
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:360:43: warning: excess elements in struct initializer
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:360:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:360:35: error: storage size of 'reg' isn't known
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:360:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'pending_version_show':
   drivers/firmware/smccc/lfa_fw.c:434:16: error: variable 'reg' has initializer but incomplete type
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:434:43: warning: excess elements in struct initializer
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:434:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:434:35: error: storage size of 'reg' isn't known
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:434:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'update_fw_images_tree':
   drivers/firmware/smccc/lfa_fw.c:586:16: error: variable 'reg' has initializer but incomplete type
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:586:43: warning: excess elements in struct initializer
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:586:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:586:35: error: storage size of 'reg' isn't known
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:586:35: warning: unused variable 'reg' [-Wunused-variable]
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_init':
   drivers/firmware/smccc/lfa_fw.c:619:16: error: variable 'reg' has initializer but incomplete type
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:619:43: warning: excess elements in struct initializer
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                           ^
   drivers/firmware/smccc/lfa_fw.c:619:43: note: (near initialization for 'reg')
   drivers/firmware/smccc/lfa_fw.c:619:35: error: storage size of 'reg' isn't known
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^~~
   drivers/firmware/smccc/lfa_fw.c:619:35: warning: unused variable 'reg' [-Wunused-variable]


vim +/reg +179 drivers/firmware/smccc/lfa_fw.c

   176	
   177	static unsigned long get_nr_lfa_components(void)
   178	{
 > 179		struct arm_smccc_1_2_regs reg = { 0 };
   180	
   181		reg.a0 = LFA_1_0_FN_GET_INFO;
   182		reg.a1 = 0; /* lfa_info_selector = 0 */
   183	
 > 184		arm_smccc_1_2_invoke(&reg, &reg);
   185		if (reg.a0 != LFA_SUCCESS)
   186			return reg.a0;
   187	
   188		return reg.a1;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
