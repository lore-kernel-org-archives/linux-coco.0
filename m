Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58C3612F1
	for <linux-coco@lists.linux.dev>; Tue, 23 Dec 2025 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766485574; cv=none; b=hP0bQQJc1IYKSfPmTsRZZKL2fIhN3APPyYetIE9PHfO3WQItPhC6dDU1tU7bjk3bR5/cttCN8weoyhxn43NuXOJvzuYtqskcogzGSCjXUQWfLAoKNbrTW4ksBqAAban1VXBZMhaa/SgBGorj1cdQ9LWiK3va3gnmq1yPmHbmuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766485574; c=relaxed/simple;
	bh=DZSmaqOKTpdLaqUk8h2iDgNeAYpywbVMX6m2VxRPyTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI9j0ZRdo/k39eb1ZpCysvUDt+RskEQcBRY2ZW9l3nICQTSHTdghYw2C1ufQnoUJyrngE4SOEskVlTpAdX+4IER7+MajbZjfqAb881BsWLsTLguE4ruuDXCK1N/MH/ltEoxPRl/Ohxn/94Gs57ejqsT+B1bQVaI0yk0X1Xww1c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqI5E1L2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqI5E1L2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766485573; x=1798021573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DZSmaqOKTpdLaqUk8h2iDgNeAYpywbVMX6m2VxRPyTU=;
  b=IqI5E1L2F29L/brHqky17GfQEF8NRImbg2fjXB/K5pm46PRAfXFKui9H
   G6neGA1xwnTzv96EsZMc1V8uaXXBSnFbDMItormT9uXmuNISwMTWe9wbV
   y919Cb//gvSozq8lTE7lOitwjoTlIjFYnPnLAKHqsXaB9NJdezbCCyBTG
   EHBQmHSh2Lcco6350wjBKdWjZOPH8n3Mw7RRrXdQ4gc42V4ekf1R7EVoA
   ZfXtJU2ED/5dAfZAAijT33lUtD22a6Zk1tp26WA1B/S6sqlVhCkx5EnwU
   vUYHzSt2tqms5I5wPa31VbDWIsRRKOrQJgOGERkjMZfFtfv7oRsZI7a0p
   Q==;
X-CSE-ConnectionGUID: ggoDfOrnTYiW5DF1ysa6Dw==
X-CSE-MsgGUID: xz9mDFXDTZmYEpYsVCXovg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70910096"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="70910096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 02:26:12 -0800
X-CSE-ConnectionGUID: BzPN5HZMSwyorlPYN4zhew==
X-CSE-MsgGUID: nG28A0AcRNmvR5Q4ryTqvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204272968"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 02:26:09 -0800
Date: Tue, 23 Dec 2025 18:09:42 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com,
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com,
	dan.j.williams@intel.com, kas@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 11/26] iommu/vt-d: Cache max domain ID to avoid
 redundant calculation
Message-ID: <aUpqZjqANRcSko/z@yilunxu-OptiPlex-7050>
References: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
 <20251117022311.2443900-12-yilun.xu@linux.intel.com>
 <20251219115309.00001727@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219115309.00001727@huawei.com>

On Fri, Dec 19, 2025 at 11:53:09AM +0000, Jonathan Cameron wrote:
> On Mon, 17 Nov 2025 10:22:55 +0800
> Xu Yilun <yilun.xu@linux.intel.com> wrote:
> 
> > From: Lu Baolu <baolu.lu@linux.intel.com>
> > 
> > The cap_ndoms() helper calculates the maximum available domain ID from
> > the value of capability register, which can be inefficient if called
> > repeatedly. Cache the maximum supported domain ID in max_domain_id field
> > during initialization to avoid redundant calls to cap_ndoms() throughout
> > the IOMMU driver.
> > 
> > No functionality change.
> > 
> > Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Missing sign off of the last person to handle the patch. Xu Yilun.
> That makes this unmergeable :(

Will add my Sign off in v2, thanks.
