Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22BEF9E8
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459320; cv=none; b=nhlbhnrvjMfrKoFKaXJTUfvZMZPtrDcVV3AEMxfSVQRy6lmhF7Y5mG7+uB7H/GDsgSLWwUAz8YaUjrwEzVMuolZ0bKvP4NtrI9uWadk52toyCoVDC5E6sey98KXt7UV07iWvea03C3BZHJomsvn6kYEiYS+EFXvgQkDS+TAFfpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459320; c=relaxed/simple;
	bh=Wqmvo2+Tnp4brAnfMEyuQtRgJlQtBdsfVtX8wQTFtbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJ4fnjU9+Mjz957OTH4BdrbgmGw3XMOWo51a6C3eNYdf0g0VefgJa9qNaUowGkcVqAOF+pQLypXIs0OYtMPCIAfdQITGb8Ljh++BGrbETcj27Bvk2TPLfoXCIzv2Ntn198P1NWmR/It/IzdfC5mLLtUR3Pp05vOGA9S/EacBwCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n03hC6Q0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n03hC6Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768459320; x=1799995320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wqmvo2+Tnp4brAnfMEyuQtRgJlQtBdsfVtX8wQTFtbE=;
  b=n03hC6Q0YclBXHEmcgbJaDb76sql7ydJN6cQoyNP/UJ5xsWAC69YeIQK
   kxyf46GsUDynisxxJJOGQaAqefDZX5mEjUViAGxRlGrcepjGVDSaB+7n/
   9dSaA8kxwenIUzoU1aKyV1nECrwBfB42RC+3uN+2l4AxpOClyWfkRfDd+
   ogNgbMetroBwrbknkMAXoPCzrIWOl6tw2o+t96QD+zzbSpnmpQM7NJ1sd
   XCCzMmSO7SEWMP+qtlmh5XvpQRm1A7s7DCcVT8Ed4HqbACQUb1WtmL5ZF
   9txP0kQS0vvKYLxAfmm4BsSndG6N7cLxTMWPcwl9TO+0F0RSbB/73tXYK
   Q==;
X-CSE-ConnectionGUID: YrjJap55Svuu3BUc1jnh9g==
X-CSE-MsgGUID: P31SScqeStSIdUILKwBVXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="95240075"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="95240075"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 22:41:59 -0800
X-CSE-ConnectionGUID: JxFqSRTBSAiO1VbJi5HT4w==
X-CSE-MsgGUID: 2JPlTpdsToS+i2cV9+5s6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209348155"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 22:41:55 -0800
Date: Thu, 15 Jan 2026 14:24:22 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, reinette.chatre@intel.com, ira.weiny@intel.com,
	kai.huang@intel.com, dan.j.williams@intel.com, sagis@google.com,
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 16/21] x86/virt/seamldr: Handle TDX Module update
 failures
Message-ID: <aWiIFlbrGqBjpyvX@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-17-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001025442.427697-17-chao.gao@intel.com>

On Tue, Sep 30, 2025 at 07:53:00PM -0700, Chao Gao wrote:
> Failures encountered after a successful module shutdown are unrecoverable,
> e.g., there is no way to restore the old TDX Module.

"e.g." is obscure. To me, the following sentence is explaining the
reason why the failure is not recoverable. Maybe "i.e." or "because"?
