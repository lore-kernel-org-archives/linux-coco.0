Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9B3229B12
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458791; cv=none; b=iGRneQeyDxR+kiZRKjUW0idYp3sTJobKe5Z5ZcRrI2EUtMCUI1XztSGccPrvNwl/CCZk234qNxZ66ZBylDTkNY+7GslC7PKZwSxyw/IxiEvJwY6thiiVe5WN4mupq6LurenXl9hKTwkVUNOJ5zOU7GrN0Udo76O/d+15gUVOV0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458791; c=relaxed/simple;
	bh=yZUimOoHmv0ik3baWDbguEWecCCv19VJW1JuRTwAAYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ryl7cVTDCh/hTplbyI6WS48YF4soit4QQQl984HDQxWAq1yj1oH215SQejNjLVQe10UuSjMkc8XhySiitbeBqNcsqEBpDls9HPHSQctU84fZhYwbHXuCxUzrPWstIhpwMh+4o5gW81BPZnu1nXr0/QPe8w3AHWwPSEysON72GjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgrF0aVe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgrF0aVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768458789; x=1799994789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZUimOoHmv0ik3baWDbguEWecCCv19VJW1JuRTwAAYY=;
  b=UgrF0aVeli579Yc8FVGI9zugVu9dFZ6NNExlnrNwYsQwnptUVVJ5Iq5o
   4JUaTKdkkqQIAkIfL9rK6O1VqO1I5JWBNURF6N5S3dQQsk0XjTING3rsU
   SGSW0bewzRJ9yGnOA1XR4WE1mlMNbabDk56G1AtL2Zf87xdIYaf5R7auI
   hhLG/MrST2tx2j0F+lZ5aKM73ND/X1w/A17B5DfR7pb4dQRn8jPUv7RSk
   G0ddjYwDuthrCukQPWYcQNvMceYnKM6Ftk2kx3cFERIFbJ6WhUX6eoVNt
   7mM2SiXgC97jLCA6MLtbKP5tJzwkrU2h4UWP73lea96QqTv5/qUSU2/ao
   g==;
X-CSE-ConnectionGUID: 7UVdx+gOSlWp8YqzxtV4/A==
X-CSE-MsgGUID: LdGoBINQRiuxlTqib06ODA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73394021"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73394021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 22:33:08 -0800
X-CSE-ConnectionGUID: 1SSIop+7RGigC2GBgZ2D+g==
X-CSE-MsgGUID: 3ZMb65SATI6zhCoIz4RPbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209380760"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa004.jf.intel.com with ESMTP; 14 Jan 2026 22:33:04 -0800
Date: Thu, 15 Jan 2026 14:15:31 +0800
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
Subject: Re: [PATCH v2 17/21] x86/virt/seamldr: Install a new TDX Module
Message-ID: <aWiGA7sOPEs+7ifs@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-18-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001025442.427697-18-chao.gao@intel.com>

>  static int do_seamldr_install_module(void *params)
>  {
> +	struct tdx_module_args args = { .rcx = __pa(params) };

Is it better we put the definition, or at least the value assignment in
case TDP_CPU_INSTALL? This pattern always appears here for a seamcall
wrapper but this function is far more complex than that.

And the .rcx = __pa(params) also confuse me a bit. Better we name it
e.g. seamldr_params which looks reasonable for seamcall arguments.

>  	enum tdp_state newstate, curstate = TDP_START;
>  	int cpu = smp_processor_id();
>  	bool primary;
> @@ -297,6 +302,10 @@ static int do_seamldr_install_module(void *params)
>  				if (primary)
>  					ret = tdx_module_shutdown();
>  				break;
> +			case TDP_CPU_INSTALL:
> +				scoped_guard(raw_spinlock, &seamldr_lock)
> +					ret = seamldr_call(P_SEAMLDR_INSTALL, &args);
> +				break;
>  			default:
>  				break;
>  			}
> -- 
> 2.47.3
> 
