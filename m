Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82781DF73C;
	Sun, 18 May 2025 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747572575; cv=none; b=ke24NKw93aC/xcE8pIfKuIl6pYqJNSZOAKa4IVKAocP7EPbU7kS3B0EVITvb74WP/oiBaqWnjekOPgelaRaMPm5FGJhgENXdfHRERApQiOxmCuIB8S7UTMOZ7N6wfOPFwBX7yO7x+6hP5pG0kYdDqQTEp6OEI+9eXc2zPD5Pc/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747572575; c=relaxed/simple;
	bh=euC5PbXNjS2x0QacPIBKzuMlmM7Z9seXEnqXmFv9Xhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wgom6Ogt3SKvupL9SZlys/ShsvSn6F71J+C4agZLpqoXjofWQRdr+K2AWkn6uYtRk3aRXX8LQNfDQFN3rfeH76y43w+HujOUbH6Xw9Bb9ojhekyL/XoXWWwoPKMMZT5K4d92dLmPm/nJ4jHvpTIX4sGazdpiUI5M1JDUa2M2Aeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKCtNpha; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKCtNpha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747572573; x=1779108573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=euC5PbXNjS2x0QacPIBKzuMlmM7Z9seXEnqXmFv9Xhk=;
  b=JKCtNphaFvooDwWmkCfr+/4KCXh8ejQ8PBWJFjR6gn6DtcwNgZ6qS1s2
   YHhGQ+CC82ojphygM7Z4YbpsF3dYOKPxgBLrMjYNsM82CWVofZb9MphPP
   covYwTgdHgbgUhjRBdEXgPTbpWE8YxdqQCUqXmhymQ+cg0v0+XE8Z3UNk
   2IupeD/syhKODmV4sQ0WRoz73cMJtXVFnJGV8lfzcOBWPTAEixG4AGW8T
   32zORkAiFLEeuOAetKd+lE/TFczoxGQSDytmTmzabOA3xlnFPsaLHq37m
   rp/6GojhBrPUS3mDU0cdIf0a/rj79sc0a5+qEKIvx5VNUMDiDoQFrFL3c
   w==;
X-CSE-ConnectionGUID: qpMWnYIuR0q8k1139DOuqw==
X-CSE-MsgGUID: kqFTbU/hQNus0z6RWLwohw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49180772"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49180772"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 05:49:32 -0700
X-CSE-ConnectionGUID: LHLHb61RQ9qsKji1eIUIuQ==
X-CSE-MsgGUID: 3dPjZgDXSM6hzvY7ML/pGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139169168"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2025 05:49:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGdSI-000Knj-2c;
	Sun, 18 May 2025 12:49:26 +0000
Date: Sun, 18 May 2025 20:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	lukas@wunner.de, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	sameo@rivosinc.com, aik@amd.com, jgg@nvidia.com, zhiw@nvidia.com,
	Bjorn Helgaas <helgaas@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH v3 09/13] PCI/IDE: Report available IDE streams
Message-ID: <202505182032.CfUZnPyX-lkp@intel.com>
References: <20250516054732.2055093-10-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516054732.2055093-10-dan.j.williams@intel.com>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7515f45c165269b72ee739e6fc26cc2ef928fc1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/coco-tsm-Introduce-a-core-device-for-TEE-Security-Managers/20250516-135307
base:   7515f45c165269b72ee739e6fc26cc2ef928fc1b
patch link:    https://lore.kernel.org/r/20250516054732.2055093-10-dan.j.williams%40intel.com
patch subject: [PATCH v3 09/13] PCI/IDE: Report available IDE streams
config: i386-randconfig-r072-20250518 (https://download.01.org/0day-ci/archive/20250518/202505182032.CfUZnPyX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505182032.CfUZnPyX-lkp@intel.com/

smatch warnings:
drivers/pci/ide.c:475 available_secure_streams_show() warn: unsigned 'hb->nr_ide_streams' is never less than zero.
drivers/pci/ide.c:495 pci_ide_attr_visible() warn: unsigned 'hb->nr_ide_streams' is never less than zero.

vim +475 drivers/pci/ide.c

   467	
   468	static ssize_t available_secure_streams_show(struct device *dev,
   469						     struct device_attribute *attr,
   470						     char *buf)
   471	{
   472		struct pci_host_bridge *hb = to_pci_host_bridge(dev);
   473		int avail;
   474	
 > 475		if (hb->nr_ide_streams < 0)
   476			return -ENXIO;
   477	
   478		avail = hb->nr_ide_streams -
   479			bitmap_weight(hb->ide_stream_map, hb->nr_ide_streams);
   480		return sysfs_emit(buf, "%d\n", avail);
   481	}
   482	static DEVICE_ATTR_RO(available_secure_streams);
   483	
   484	static struct attribute *pci_ide_attrs[] = {
   485		&dev_attr_available_secure_streams.attr,
   486		NULL,
   487	};
   488	
   489	static umode_t pci_ide_attr_visible(struct kobject *kobj, struct attribute *a, int n)
   490	{
   491		struct device *dev = kobj_to_dev(kobj);
   492		struct pci_host_bridge *hb = to_pci_host_bridge(dev);
   493	
   494		if (a == &dev_attr_available_secure_streams.attr)
 > 495			if (hb->nr_ide_streams < 0)
   496				return 0;
   497	
   498		return a->mode;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
