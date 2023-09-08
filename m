Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607FB19F;
	Fri,  8 Sep 2023 00:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694131541; x=1725667541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1NcPYdiM0hvvDlVn8clbFgQP3ij1ceNFZwkmKqROmuI=;
  b=C36atgye6pxiTHoySb8mK72NqLqZKoJNVVLHrOzWwOa6ybV1uKuu2alG
   YcxDblsIKyvIBwOgbBo8ZhHji1Vy3WSoz1ZQpFSD7iP6jV3Cp1h6rUmgI
   7ciU88ofxts8EQYEibIGDmuAd8tZ7jRpMpN+xm/jwKcaykk+nTXfjbYAa
   KTLhu8jX7rsbbKUdd90K2p8/7m5/ilKpqiphwnKT7IAMQdobm9XxjMZys
   mQrt10mnhmqie6wfEErsFWoo75SM4i07VPa4aQRGY5pJHVBrTNPXiJ6Rw
   Fq+Q8c5dMby2iJ6802QDXyn2YR5k9DM5MQD0EXZRbIn53uRHxMMbDen2Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="441533654"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="441533654"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 17:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857090883"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="857090883"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2023 17:04:40 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeOzF-0001jT-2w;
	Fri, 08 Sep 2023 00:04:37 +0000
Date: Fri, 8 Sep 2023 08:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	Wander Lairson Costa <wander@redhat.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Qinkun Bao <qinkun@apache.org>,
	Guorui Yu <GuoRui.Yu@linux.alibaba.com>, linux-coco@lists.linux.dev,
	x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virt: tdx-guest: Add Quote generation support using
 TSM_REPORTS
Message-ID: <202309080741.ua24EU6S-lkp@intel.com>
References: <20230907025405.2310931-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907025405.2310931-1-sathyanarayanan.kuppuswamy@linux.intel.com>

Hi Kuppuswamy,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.5 next-20230907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuppuswamy-Sathyanarayanan/virt-tdx-guest-Add-Quote-generation-support-using-TSM_REPORTS/20230907-105752
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20230907025405.2310931-1-sathyanarayanan.kuppuswamy%40linux.intel.com
patch subject: [PATCH v1] virt: tdx-guest: Add Quote generation support using TSM_REPORTS
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309080741.ua24EU6S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080741.ua24EU6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080741.ua24EU6S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virt/coco/tdx-guest/tdx-guest.c:18:10: fatal error: linux/tsm.h: No such file or directory
      18 | #include <linux/tsm.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +18 drivers/virt/coco/tdx-guest/tdx-guest.c

  > 18	#include <linux/tsm.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
