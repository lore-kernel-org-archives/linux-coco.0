Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A9423D291;
	Wed, 16 Apr 2025 22:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843445; cv=none; b=Lw3ufOwraaaiROY/n57YVxiEE+DRlyB3JgFZdZKE6KW1MmrjBd3YklLhtYZnrRD86bzoAceLMVrycx0+ejFs2OJRKEy0whIwCsqLDsJb6cO/ImidtzWsN29ngJrDZsB9GbsUs4MUUqAcExY9clD1ZG7rw3bLLhWan0JUR634Vu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843445; c=relaxed/simple;
	bh=ud6izSoDKqdwP3xxxNF9Fdv/wdvU4q/pqZfe4RU1lnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxFmmhlTnCFVw3xooeD5J99Caqdn4FmdBvyj1G6TcAM5HrxwoFSQrb3weFRlhHgNsBBGDjPG7w7x8nZIZvyFkVth4rwlMYgd4EB+OtxkFzlAE8lM9U71y5md3XA9lRT7sp9XTcQVIO+b2XRWNPPtV2JRxAmYBxS+fyIJ5QgaJi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYgFr5b/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYgFr5b/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744843443; x=1776379443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ud6izSoDKqdwP3xxxNF9Fdv/wdvU4q/pqZfe4RU1lnw=;
  b=LYgFr5b/FgQwytfB089n06nouogbFN5Im4ajpZVzcL0PqpfRjSQNyHMI
   jR5sPqrQYtZ6O/8uXV0Afeozn4uqhjyChhzQLlhTv9U5/7smKvOFn9ZzU
   JnPEiIq8Jijmxo1ig48/rTP7xOlOjWjopcAqFhWvjFP3LjlDG8IgfKk3C
   U0ag6mHzcDw1FP+2aIIH+MNzUSMoVrytOb+nYI1KBrirafvVy1R7iRKeS
   oYKlNET9swZ3yoFBvvolA2ngDkZv57JvJPpdNmpavz/IQO8ogeFuP/Fo6
   LfSGRa5TkoGreXYOXrnpfdWMK/ZY5mLs6un9OVYabbgHJAKzUpd7mW6Z1
   Q==;
X-CSE-ConnectionGUID: 6WCCroZ4QSq9FgeWZBsBMQ==
X-CSE-MsgGUID: BvNs2AEUTFGdPgEPnz+zHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50062189"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="50062189"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 15:44:01 -0700
X-CSE-ConnectionGUID: 5K15DnS0TTu3nIdvNqPkJw==
X-CSE-MsgGUID: 2Hd9URidSvW/9TWO8i4lGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="130379979"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Apr 2025 15:43:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5BU2-000KPW-2w;
	Wed, 16 Apr 2025 22:43:54 +0000
Date: Thu, 17 Apr 2025 06:43:32 +0800
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
	linux-coco@lists.linux.dev,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Guorui Yu <guorui.yu@linux.alibaba.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dan Middleton <dan.middleton@linux.intel.com>,
	Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Cedric Xing <cedric.xing@intel.com>
Subject: Re: [PATCH v4 2/5] tsm-mr: Add tsm-mr sample code
Message-ID: <202504170616.5A5XCLVI-lkp@intel.com>
References: <20250414-tdx-rtmr-v4-2-7edfa8d98716@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-tdx-rtmr-v4-2-7edfa8d98716@intel.com>

Hi Cedric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8ffd015db85fea3e15a77027fda6c02ced4d2444]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-mr-Add-TVM-Measurement-Register-support/20250415-060059
base:   8ffd015db85fea3e15a77027fda6c02ced4d2444
patch link:    https://lore.kernel.org/r/20250414-tdx-rtmr-v4-2-7edfa8d98716%40intel.com
patch subject: [PATCH v4 2/5] tsm-mr: Add tsm-mr sample code
config: nios2-kismet-CONFIG_TSM_MEASUREMENTS-CONFIG_SAMPLE_TSM_MR-0-0 (https://download.01.org/0day-ci/archive/20250417/202504170616.5A5XCLVI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504170616.5A5XCLVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170616.5A5XCLVI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TSM_MEASUREMENTS when selected by SAMPLE_TSM_MR
   WARNING: unmet direct dependencies detected for TSM_MEASUREMENTS
     Depends on [n]: VIRT_DRIVERS [=n]
     Selected by [y]:
     - SAMPLE_TSM_MR [=y] && SAMPLES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
