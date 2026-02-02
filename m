Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73F2BE7DC
	for <linux-coco@lists.linux.dev>; Mon,  2 Feb 2026 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770018671; cv=none; b=JmPCZiIZB6yAzgJW2S4szmvohAQVEWbYIx0HRdoXgToh2KkwwbL8hTtUh7t44aD6a4aBTqSSotvfTCtT3SCbeS/vWfHqDIrEDUT05h9nMusS58LdUpF5oJMxlS0lwJvgwb9ejhgGUOQp1IVZeRLI7v/3B6FNs5n/acWTlq6VD/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770018671; c=relaxed/simple;
	bh=O0+prLIDP9EOVtAq7fhPLEt/qSodZ9oGj9fgL+MyYO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpyG5i7Jo2U1nI4YLzWFttB8TOSU4q0M7FIDDgOYFeVZKn3iIgzvXE6GN5c/8u8KQn7167ME0/Tdpbm4W402zxB5nyCL08NxXNYWf2vwKmVjI0hvTr5NYJApke+V9O4DkJa0TKv6I3uAB1ngnY8HfkaCBaesvRX2zYd5FHfbXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3q8CHIw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3q8CHIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770018669; x=1801554669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O0+prLIDP9EOVtAq7fhPLEt/qSodZ9oGj9fgL+MyYO4=;
  b=I3q8CHIwbjl2MuCY5OmgcrrGbyk/tfHmEiI2TsTXJCJIClbUW72tg7l/
   c+8G3JqauslFSmTvr+FSFfJtkVa0ugwGKr0B+avP390NQuzqMCt++QTTF
   uYuL/CgV8TMRltujvwVkjDN5cJTVEVDrXJ8HvqSzrDXU4ObTgEnsOz2tC
   eScmVWLB91pmG5ou+0GDyOgRgjrYp4iE/dlHgO7JLuNhVdvDSQrh905kf
   p3mCfaOUqtO4GANFTDCDcS9o2bI/vCWEHLQ8Kov0zF6mzz6juCdCdQrnf
   VhmXCRIhj6STXlCisrbyalbqU2N51f+0LUYlJivTRUu0zndwevreu2xlt
   A==;
X-CSE-ConnectionGUID: grCDQ6ohQJ2wa0w0tOv87A==
X-CSE-MsgGUID: RSeO373uT/OCzlOnJQtwiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="81909850"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="81909850"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 23:50:48 -0800
X-CSE-ConnectionGUID: 0uhux7NhTw+tr/xgY1kJtQ==
X-CSE-MsgGUID: 7YPpESU2TTGCuSu4En8U4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="209523773"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa007.jf.intel.com with ESMTP; 01 Feb 2026 23:50:42 -0800
Date: Mon, 2 Feb 2026 15:32:17 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
	ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
	sagis@google.com, vannapurve@google.com, paulmck@kernel.org,
	nik.borisov@suse.com, zhenzhong.duan@intel.com, seanjc@google.com,
	rick.p.edgecombe@intel.com, kas@kernel.org,
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 20/26] x86/virt/seamldr: Do TDX per-CPU initialization
 after updates
Message-ID: <aYBTAadWNyb8h06B@yilunxu-OptiPlex-7050>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-21-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-21-chao.gao@intel.com>

On Fri, Jan 23, 2026 at 06:55:28AM -0800, Chao Gao wrote:
> After installing the new TDX module, each CPU should be initialized
> again to make the CPU ready to run any other SEAMCALLs. So, call
> tdx_cpu_enable() on all CPUs.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>

Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
