Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D48225D6;
	Fri,  6 Dec 2024 00:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733445865; cv=none; b=nl05uW+cQBPce1MHgq5NUymDwx7M5HpQtd4/S8+D1R4rRKHbW+cjJiTpDNnDTBK+nd6jUzBz0/+NbDc6z1itqbTwzO0xIek7M0fGN5QEnga/6nlyXONrABNRMHg2BCX0qdVlvNcON4s6USRcTOgISERroQYqU17AkXZqyh5cF9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733445865; c=relaxed/simple;
	bh=Sidk4+WOsBrKg86yCRr3g4nK7EJBgB78VBra7RMrLzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwizS/Ha+XU/Tg55JdV2+hAsyaNOt85ZZucLveae2JVXixyokyBZuzA6BxxhO0PAW5ZxUp9D5O3zmrt38yZU0pf7sIMUuvSDgNvQuPIIYXfoOHkIdxKPxg7Tly1sC0DAFH6/bVpFmhFkpEe8zY2l+aCvmuRp4XtPcZ1muU87gJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KA23ZvWx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA23ZvWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733445864; x=1764981864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sidk4+WOsBrKg86yCRr3g4nK7EJBgB78VBra7RMrLzc=;
  b=KA23ZvWxsbqlsRCEF+PexgxtILyZYLouLViqzAa7BZROJa4ixeglCjeo
   zBLKJDgCMtLwGbGL0drZKz6/piyFo1gFZHAKBGi8Emoas9DXvdhVG+Hdo
   dP1ZN7dvrs+9l5NfjEXUcs2kVhEoOcSFwxlWn5HI7fwOY+8M5tT8QGX7s
   zVzW8CkQA5nauFWc1EddiMiKSWo5XqFHCbXEMnqTrvpD6AEe3nytoI7Lu
   gU0DrIwE+g5BWySeyDzSzA6V1LQuR8SUjlk5bued80FU75ay8u9Q0eILa
   dRKxyJGK/dtzKKsucJAoQvu3WP2eOc+IxyDNc1ClvtwLaMUpqBYLGjtEu
   w==;
X-CSE-ConnectionGUID: ODoNV8RQR4yOrdHXk8kfpQ==
X-CSE-MsgGUID: JTkMnCUzRca8HdsKNwUPGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44259046"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="44259046"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 16:44:21 -0800
X-CSE-ConnectionGUID: rDXGsGaSSxOrpoN+GxkWww==
X-CSE-MsgGUID: byBQqlKARMChaF7ZpjPhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="99081065"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Dec 2024 16:44:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJMS9-0000Xn-0T;
	Fri, 06 Dec 2024 00:44:17 +0000
Date: Fri, 6 Dec 2024 08:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Helgaas <helgaas@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Samuel Ortiz <sameo@rivosinc.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linux-pci@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 09/11] PCI/IDE: Report available IDE streams
Message-ID: <202412060857.Kn0HyAFH-lkp@intel.com>
References: <173343744869.1074769.12345445223792172558.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173343744869.1074769.12345445223792172558.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/configfs-tsm-Namespace-TSM-report-symbols/20241206-064224
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/173343744869.1074769.12345445223792172558.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [PATCH 09/11] PCI/IDE: Report available IDE streams
config: i386-buildonly-randconfig-006 (https://download.01.org/0day-ci/archive/20241206/202412060857.Kn0HyAFH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060857.Kn0HyAFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060857.Kn0HyAFH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/probe.c:597:33: warning: 'pci_host_bridge_type' defined but not used [-Wunused-const-variable=]
     597 | static const struct device_type pci_host_bridge_type = {
         |                                 ^~~~~~~~~~~~~~~~~~~~


vim +/pci_host_bridge_type +597 drivers/pci/probe.c

   596	
 > 597	static const struct device_type pci_host_bridge_type = {
   598		.groups = pci_host_bridge_groups,
   599		.release = pci_release_host_bridge_dev,
   600	};
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
