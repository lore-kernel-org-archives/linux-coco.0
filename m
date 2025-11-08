Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926B821C173
	for <linux-coco@lists.linux.dev>; Sat,  8 Nov 2025 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762619409; cv=none; b=I6chd7t8A6Kc31rdVFwIbg8YO5cjI5mKtUeCZT+FY1pmC3pG1Yfd2DG8lkqx42ihEVnCMGFeP2/FflQVxuBEv6pHcY044hjMFSXuuZ+5fP74kXapCHR/rPYxd6EcqJ2hYmF4voca6X+WFZY5koHzyGwx+ejVLBA8QDP5bf+3sTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762619409; c=relaxed/simple;
	bh=KLATWUqwVXbxBZdEjJ7uo2sQ3g7+y5KId9IwBrf7ewg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIpse8a+UrqTOGmi83pof/tWK/NethK39II/fFfXCz72ov0ubB0dffAdJ+ZnXXQcdqBwmwW+SqM4MlrjHqBsK3QelyZT8UyDBcHyIoZhywHyi2H752I+fp5//9EHQ1qS7B0ACYxov8NsII8Sc9128uspHmRKxeCli5ooPZKeAT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5F54Awa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5F54Awa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762619406; x=1794155406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KLATWUqwVXbxBZdEjJ7uo2sQ3g7+y5KId9IwBrf7ewg=;
  b=g5F54Awa8t0XWhva1czrPURNJzb7NpDNHvdT5QxPGZtWeECrgfWHC7hP
   mUuxNhzjBi31WRE/ylsEIBnPJzG3kDcuRLPtEpVk6PX728A/A7GnAcIxD
   Mo3BV+EWQiwG213JMo7AoCzporXQ3reW4LDzO1PXj1s+hVY0M1dsU0a7P
   qQyJglTDKXxZl7Cpf3g5qDQbVXijbkhSgz2NBjw2N6k+qAXZMo/OLblHu
   LlFsXlgr9fwQMs1nfWX676QrnZrrLFePmDoCKXDdYs/mghUj77VzN6lS/
   FanHGMOe/OiPf2jRF6FOTB6kUBEvMvbNOUOhw86QVl6x4Umj0VJh4iMb9
   A==;
X-CSE-ConnectionGUID: vgqgl6/bRg61LPy87wuB5Q==
X-CSE-MsgGUID: fWOP1Q4GRNWdFC7Smk3r6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64438589"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="64438589"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 08:30:06 -0800
X-CSE-ConnectionGUID: xty1xsjLTHCr/+TF0W3FVA==
X-CSE-MsgGUID: GmMbBg13Te2Tg8IoY3ThUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="211728746"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2025 08:30:04 -0800
Date: Sun, 9 Nov 2025 00:15:47 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-pci@vger.kernel.org, linux-coco@lists.linux.dev,
	gregkh@linuxfoundation.org, aik@amd.com, aneesh.kumar@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v8 2/9] PCI/IDE: Enumerate Selective Stream IDE
 capabilities
Message-ID: <aQ9ss3oK7ds4Srd9@yilunxu-OptiPlex-7050>
References: <20251031212902.2256310-1-dan.j.williams@intel.com>
 <20251031212902.2256310-3-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031212902.2256310-3-dan.j.williams@intel.com>

On Fri, Oct 31, 2025 at 02:28:54PM -0700, Dan Williams wrote:
> Link encryption is a new PCIe feature enumerated by "PCIe r7.0 section
> 7.9.26 IDE Extended Capability".
> 
> It is both a standalone port + endpoint capability, and a building block
> for the security protocol defined by "PCIe r7.0 section 11 TEE Device
> Interface Security Protocol (TDISP)". That protocol coordinates device
> security setup between a platform TSM (TEE Security Manager) and a
> device DSM (Device Security Manager). While the platform TSM can
> allocate resources like Stream ID and manage keys, it still requires
> system software to manage the IDE capability register block.
> 
> Add register definitions and basic enumeration in preparation for
> Selective IDE Stream establishment. A follow on change selects the new
> CONFIG_PCI_IDE symbol. Note that while the IDE specification defines
> both a point-to-point "Link Stream" and a Root Port to endpoint
> "Selective Stream", only "Selective Stream" is considered for Linux as
> that is the predominant mode expected by Trusted Execution Environment
> Security Managers (TSMs), and it is the security model that limits the
> number of PCI components within the TCB in a PCIe topology with
> switches.
> 
> Co-developed-by: Alexey Kardashevskiy <aik@amd.com>
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
> Co-developed-by: Xu Yilun <yilun.xu@linux.intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alexey Kardashevskiy <aik@amd.com>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>

Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>

> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
