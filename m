Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DFC39526A
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388350; cv=none; b=TZ97VGkQYO/efcUhWmIqbaWfZiq5jXS71+VOp8jRGRyhZFScEWJY/IlQdebTubp4Dp7DCYSu6W3HsiJqaJULUNpvvTkdl/DQlGDO26YybGz4oRsYZHN6XLH7o3MwD1Ig078p6YW/eb3ZsdlgVKXjQ9FDdmq4kFX6QBCnGBEiz/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388350; c=relaxed/simple;
	bh=yl5OIkDe6G2ULgAVWjcxT/qaKqmvsIxh93J+qisWnCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmRf61jnNpDvvgTCKWT9/uwebNNgqAjmANPGAuiSQpBT0g2Ax8adY8kXPtwsgZioNQ84LwjRY6Dr64A5PgxgMDOj6n4yNrPRuNo0foQQ220OvHpy44EGOluYRWpAbvwxwrKOJtI6N1/dMdLUjtd4+br97f8rLK9CXNNkWG7F16k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c06QmZMa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c06QmZMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768388281; x=1799924281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yl5OIkDe6G2ULgAVWjcxT/qaKqmvsIxh93J+qisWnCg=;
  b=c06QmZMaXpvFO78T2Ap2N6Li4WciXRwretgldXZ3n0qXKkZ7DqyjhrUr
   ez88WJex0yTs7Ga9tZd04Hh003SDPTbWd7b5jYXk16qqCLIukiNZxlUm7
   XKbmExq/D5qA+xdCtlNLDljXIlqSoIPaGzjV8PeKxtpUKq/dTygu/1Qnd
   PncIbahyaVHSiHL8LrWWsy9QndsftDoFfhHGiYLVWNzqHMdiqDOz4ZyYE
   e7PxFgd+zPS299DiCtZUW7OOz5HSqVLlZ4/FB1mXFViBegeiRUFwqdEcN
   6JiDkA8xTvyYIETUy6Hy5a5Ck33HGOmKilm/cBtKIbmH/E+0jf9npizNY
   A==;
X-CSE-ConnectionGUID: DGGZLSBOSnuH3BOJVBB6Hw==
X-CSE-MsgGUID: B7vQD4SmTKe/VNvLVMI8Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="79980414"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="79980414"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:58:01 -0800
X-CSE-ConnectionGUID: or9SFu30RuO78ojd3MGGWA==
X-CSE-MsgGUID: GF64hqTzSyqwnBi+6lqSPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209108727"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 02:57:56 -0800
Date: Wed, 14 Jan 2026 18:40:26 +0800
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
Subject: Re: [PATCH v2 13/21] x86/virt/seamldr: Abort updates if errors
 occurred midway
Message-ID: <aWdymkCJrSG+zMfz@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-14-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001025442.427697-14-chao.gao@intel.com>

On Tue, Sep 30, 2025 at 07:52:57PM -0700, Chao Gao wrote:
> The TDX Module update process has multiple stages, each of which may
> encounter failures.
> 
> The current state machine of updates proceeds to the next stage
> regardless of errors. But continuing updates when errors occur midway
> is pointless.
> 
> Add support of transitioning directly to the final stage on errors,
> effectively aborting the update and skipping all remaining stages.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> ---
>  arch/x86/virt/vmx/tdx/seamldr.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index b074630d42e3..fca558b90f72 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -235,6 +235,7 @@ enum tdp_state {
>  static struct {
>  	enum tdp_state state;
>  	atomic_t thread_ack;
> +	atomic_t failed;
>  } tdp_data;
>  
>  static void set_target_state(enum tdp_state state)
> @@ -249,8 +250,16 @@ static void set_target_state(enum tdp_state state)
>  /* Last one to ack a state moves to the next state. */
>  static void ack_state(void)
>  {
> -	if (atomic_dec_and_test(&tdp_data.thread_ack))
> -		set_target_state(tdp_data.state + 1);
> +	if (atomic_dec_and_test(&tdp_data.thread_ack)) {
> +		/*
> +		 * If an error occurred, abort the update by skipping to
> +		 * the final state
> +		 */
> +		if (atomic_read(&tdp_data.failed))
> +			set_target_state(TDP_DONE);

Could we immediately move to TDP_DONE once the error happens, i.e. no
need to get all ack for current state?

> +		else
> +			set_target_state(tdp_data.state + 1);
> +	}
>  }

----8<-----
  static void ack_state(void)
  {
        if (atomic_read(&tdp_data.failed)) {
                set_target_state(TDP_DONE);
		return;
	}

        if (atomic_dec_and_test(&tdp_data.thread_ack))
                 set_target_state(tdp_data.state + 1);
  }
