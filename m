Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD3530171A
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422385; cv=none; b=SrIrnA5jUURSozz0lY5PnFwj//8IwyMh7FkbXE71F4EgZQpsageic+WkS+CzgHQFppFJ6M90KX60fG1o2Avma3nGgpet0kTTzXFMSRj3ja95ws8froY68kIw10n5DqacGgO6/h2Bih+Yu/jn8x5kqcHY/Z/Mba0uEEV8gLk++9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422385; c=relaxed/simple;
	bh=J6A7ySS6HYk0DsnK8Q23En9VRiQYoCADqpenMan2tko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lASx8N7DMu+BXdIUAewP5/FFI5rscTBnGqUZs6grOLLvCE9Jw/7ixdsOY0bTxKI7YBCnKAtTLTxbvu5j+qXybG0J8rhLxj9x9CYj0pweM3yg+vomPgl+ZA6oXh/HKIIftno884n+zZm77YRj3C67WGwtAZtcsOWbmY0PFsoZk3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFAZX/Zh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFAZX/Zh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769422384; x=1800958384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J6A7ySS6HYk0DsnK8Q23En9VRiQYoCADqpenMan2tko=;
  b=JFAZX/ZhHMayaqzuvElgInsxctigvnU0p4LOBka55n8msnaNL8AfCUTF
   pwtsJEt9lBzGjkedFaxvvaNNMkq14QhuYmCQdC18AS2/2qDMtZY1jjB65
   rejYJxd+zlggKxDGtkUL+dsGfjXC8LV+mAPyVzbXQoRQ+EcOIuqs4Z48T
   fog1KRRiMkOWbuwiU08QSpiOSdAhfxYft0tW49RET0wEOJ8nizuTXHptf
   3djvLDX+IDSIiRqzf9+mfrVc7DEl5v2bbU9Xkj5+8wwtQlwLQEWuHaV5S
   e9I4gTJ6XjhXDrvt7mr8liQoS1RrZSIVRG5o37ERYHb6sP+2v0pX92ulV
   A==;
X-CSE-ConnectionGUID: J43SAdKcSOyMKFw133B+iQ==
X-CSE-MsgGUID: ElDIZmW2RNqo4KJrJf3pLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74464527"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74464527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:13:04 -0800
X-CSE-ConnectionGUID: n0apX0F+T26KP9yjpxDjVg==
X-CSE-MsgGUID: 42ocGnlFRa2ng8X5TKXaBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207447142"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:12:56 -0800
Date: Mon, 26 Jan 2026 12:12:52 +0200
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
	ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
	yilun.xu@linux.intel.com, sagis@google.com, vannapurve@google.com,
	paulmck@kernel.org, nik.borisov@suse.com, zhenzhong.duan@intel.com,
	seanjc@google.com, rick.p.edgecombe@intel.com, kas@kernel.org,
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 07/26] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
Message-ID: <aXc-JEhy3Quwe7r8@tlindgre-MOBL1>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-8-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-8-chao.gao@intel.com>

On Fri, Jan 23, 2026 at 06:55:15AM -0800, Chao Gao wrote:
> --- a/drivers/virt/coco/tdx-host/Kconfig
> +++ b/drivers/virt/coco/tdx-host/Kconfig
> @@ -8,3 +8,13 @@ config TDX_HOST_SERVICES
>  
>  	  Say y or m if enabling support for confidential virtual machine
>  	  support (CONFIG_INTEL_TDX_HOST). The module is called tdx_host.ko
> +
> +config INTEL_TDX_MODULE_UPDATE
> +	bool "Intel TDX module runtime update"
> +	depends on TDX_HOST_SERVICES
> +	help
> +	  This enables the kernel to support TDX module runtime update. This
> +	  allows the admin to update the TDX module to another compatible
> +	  version without the need to terminate running TDX guests.
> +
> +	  If unsure, say N.

How about leave out the first "This" above:

	 Enable the kernel to support TDX module runtime update. This
	 allows the admin to update the TDX module to another compatible
	 version without the need to terminate running TDX guests.

Other than that:

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>

