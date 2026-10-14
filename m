Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B4748AE00
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964894; cv=none; b=itpoS4M9qeP4ZBv1qvsqcuiKy6iPzEiyBYLfIBNXe0lGB2/+wjXEgO2e2a0yrBwLYg6fuuIrLN8cWdX90rmHO68zVANjlyroyE/+B0P+K67MXTMr4cpjQEKf8Z/uw7l324E0K5EbXAy7nMAIL+goL9TumTsRfvleWiFDx/e27z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964894; c=relaxed/simple;
	bh=ehAJ4mQn7AwRSnhRv6wz6Qrp3L+776YMt4En2m5NC0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDiMcbhM0w8uFLxFIJKYY1jtNA8U1uSjED7UydGZzWCy8lkP9bWBROa0u3Na3BgA7bZSWTBuBs6lawtgBpdkRZbcyej21mut5DEBnKESwKvcLCzwspncwdqcWW0VRSQH4W/AmW+tbiDytmD/93rp4oVWdSwrhq5vLzuzU6Znk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkYhAn7w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkYhAn7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791964892; x=1823500892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ehAJ4mQn7AwRSnhRv6wz6Qrp3L+776YMt4En2m5NC0w=;
  b=AkYhAn7wkoflcrQgXu2w5KPs34FWwMPk2Ybpfn3frORqOe5eReY5nK1b
   CPShR7P/g/+S6jZ9FoDuZrXOMQZGTlela6v06idvUKRuH4J8iZ7Dlga0d
   JZdwb8hSIYaodTQKjzTbd73l0H2UJQOEnul0hkvrK84O01Fk5ZQ/QLF2e
   fQXFVh16ijS/gAV2BzdLHPpXb9ZCC1Kfj5HNpSwAbaZ6VxD/UheKOZ8aE
   liiMOrhi06F1jmioCQ0EoGd4Z/s3hmkq3yzNrjd7BqqPiwjYxBDBy9rmF
   FrlpXCE1Y6jEt6Jlz6UXV4FhiQUcnrys0iJvdx6AolI+VnEH3ADnlNO3L
   w==;
X-CSE-ConnectionGUID: K2tbIr5TROKkz+hXeoXMmw==
X-CSE-MsgGUID: iCNlKZMaTZaBTwhUbneFKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="711262"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="711262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 01:01:25 -0700
X-CSE-ConnectionGUID: VWoIb3qMShCy0GZF+6D0ow==
X-CSE-MsgGUID: sWZxeolrQlGlTDN1PWgF4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1379081"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa004.jf.intel.com with ESMTP; 14 Oct 2026 01:01:22 -0700
Date: Wed, 14 Oct 2026 15:57:20 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org, binbin.wu@linux.intel.com,
	tony.lindgren@linux.intel.com, rick.p.edgecombe@intel.com,
	nik.borisov@suse.com, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH v4 08/10] x86/virt/tdx: Remove tdx_global_metadata.c
Message-ID: <as814KkSL7PlJ6Zz@yilunxu-OptiPlex-7050>
References: <20261012094754.27702-1-chao.gao@intel.com>
 <20261012094754.27702-9-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012094754.27702-9-chao.gao@intel.com>

On Mon, Oct 12, 2026 at 02:47:35AM -0700, Chao Gao wrote:
> tdx_global_metadata.c held the script-generated metadata readers,
> deliberately kept in their own file so that generated code stayed separate
> from hand-written code. It cannot be compiled on its own because it lacks
> the low-level SEAMCALL wrappers, so tdx.c #includes it directly.
> 
> Including one C file into another is unusual, and now that the readers are
> maintained by hand there is nothing left to isolate. get_tdx_sys_info() is
> the only function still in the file.
> 
> Move get_tdx_sys_info() verbatim into tdx.c and delete
> tdx_global_metadata.c along with its #include.
> 
> AI was used under supervision to review code and workshop logs.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
