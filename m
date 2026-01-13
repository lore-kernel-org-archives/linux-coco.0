Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95243093D3;
	Tue, 13 Jan 2026 03:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768276419; cv=none; b=nrAtPbd6DcFPysi3tYZBy+Pg/bd14k9iNY+EwbuKHANUCKGvB/92q1ni1EW7V7hYZQxbjmywbqqUUQBtz4X/F7Jc8w9K0Ub/Zy1AueFdTc7T7EOiZYbRaMojq60zoSzGokXMUujY3evaQGeD1rHa1991SqQk3HMhfRacyhd0Hf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768276419; c=relaxed/simple;
	bh=Mffo6pT405RBQgYZIVLC+IUbRqcWM9QOybQuMjtdUNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHaLOcZ4Frh26IsUsD6+D8yMGRGz1p0otJ/JQd1KeZTOVevzYnwLktu/Qvf20B53JPs57t0R3piTjNfdHLTqhWh0TYweuO1CwLW44/YC3KI6gke/TgxjEfyVBc8viXPzD2Qdjhf8NiRhZ41p6Gkjfp3aBgUL8x50pNkqJ2wfJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0WG082T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0WG082T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768276418; x=1799812418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mffo6pT405RBQgYZIVLC+IUbRqcWM9QOybQuMjtdUNU=;
  b=G0WG082TSyM6cdfVYGuG/aWdy3H8SiLXkjgFBC8LGd2Rv3S1gLzMMJQi
   TTxn0r+DSqsRnDGxjqRGGNjxccaSWJlURZeKUlDb5Vjgv6zrBe9B3eoY9
   Xl+Nt8r9e2ZIa+kugKH9SQP5zX3UTSjbpNv2p+JcYRJVz4qtH5lBqhsOy
   j4WrobD6LNsDbtrTUNeVl/tWb2VdbZGTN7cn3qzuXLULU0AJ6hIsjg/ab
   tVGRilL359ojgefiTvQSkrz/Lo+wV+0cWRYU5R7CN64rlSEqeG6vZz1Xu
   yB5OrLRDuiVou8j3rlSwKShbgEkDemkJFdlfAx3LjaI0pkpXafiQ4eNhk
   A==;
X-CSE-ConnectionGUID: 0f+L9N6GQKePAJ4o4Iz3QA==
X-CSE-MsgGUID: yURVxs7ET8SR3wYCp0INDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69613556"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69613556"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:53:37 -0800
X-CSE-ConnectionGUID: o5DUd1t5TFauLTFAU3u8cw==
X-CSE-MsgGUID: kOoAowsbShG/pISUWE2Ttw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227496204"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 19:53:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVTH-00000000EBW-1ukE;
	Tue, 13 Jan 2026 03:53:31 +0000
Date: Tue, 13 Jan 2026 11:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Pratik R. Sampat" <prsampat@amd.com>, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org,
	ardb@kernel.org, akpm@linux-foundation.org, david@kernel.org,
	osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com,
	prsampat@amd.com
Subject: Re: [PATCH v2 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-ID: <202601131156.Kfi0QLIm-lkp@intel.com>
References: <20260112202300.43546-2-prsampat@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112202300.43546-2-prsampat@amd.com>

Hi Pratik,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/x86/core linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratik-R-Sampat/mm-memory_hotplug-Add-support-to-accept-memory-during-hot-add/20260113-042631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260112202300.43546-2-prsampat%40amd.com
patch subject: [PATCH v2 1/2] mm/memory_hotplug: Add support to accept memory during hot-add
config: s390-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131156.Kfi0QLIm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131156.Kfi0QLIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131156.Kfi0QLIm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory_hotplug.c:41:10: fatal error: asm/unaccepted_memory.h: No such file or directory
    #include <asm/unaccepted_memory.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +41 mm/memory_hotplug.c

    39	
    40	#include <asm/tlbflush.h>
  > 41	#include <asm/unaccepted_memory.h>
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
