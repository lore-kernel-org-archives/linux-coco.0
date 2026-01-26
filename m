Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB032330B17
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423339; cv=none; b=RfGjkwHYLbKNYS+09WVBdTZwuNmmHks+aWoX6Nej5NaLZJqlrnHacpGWtrQrovCzDbUrUaNB0/6S93zUb+quagI9EGV3TGWU9E59Yi017Gg0fGsM/q82ZE9BW5ndNIVKOAAhXE9g21JpPUYpG0EhvTMUAhxjGM+2Zo6V4yNoAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423339; c=relaxed/simple;
	bh=bhG3gelob0jmBkWsdn8PSBSfhQbeTB63h3+j1LDrLzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxij91fcQk0QpdW7XPqjMNJMZPe21/LB0YRhMpNtI8ccNzJMSX9LYXAlVKV+kS33ZZvEQipfWwF530D9E6llRW3c9gdS15fYs/8+G6DVMn+JV4L1wvXSgc89msNs7VovqKTW2slN4opRMXHIjnTTFkN97oMPnOS0U/2lgUgggVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A553/T4i; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A553/T4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769423337; x=1800959337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bhG3gelob0jmBkWsdn8PSBSfhQbeTB63h3+j1LDrLzg=;
  b=A553/T4i7SG2AWXuR0TTwT0eTSkJXC/yWw6XSWvxxH/12w5iMnLiM6uZ
   BjSMGeQXMhm4sGHRb1RLsHgKr+MVvroVUY7+60XuQNU8K9Gl3fp4FGXqN
   4wpL6vPktW5yKn7Kx6VS3Txdq2Rn5/OAOp06JJkCQ0DW2hzhRY7i80hd+
   72MEaxyN3jWWSd60S5XqYd0JoG647x8aK7JoLgFUqWdyShoPxIYx1CDvf
   YtLp8J61OwELSvfREWZEJE2ZT/XuymNlb77C0znOMp+9/zCIgIPtisyVQ
   p8l5EoSJ6Ewcq1bFc33M3Xry3XTfwKYxOH2yKetUbE67elZkosJKKa2jn
   A==;
X-CSE-ConnectionGUID: ThkiAYbKQGGNAkDStvY9Dg==
X-CSE-MsgGUID: nKDqrbP3RIiBY73XbbO3Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96061531"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="96061531"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:28:55 -0800
X-CSE-ConnectionGUID: R+VAUD2tRu6HjQMScxaVrg==
X-CSE-MsgGUID: 2slZUXjlQii4kQlJeWwFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207248608"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:28:47 -0800
Date: Mon, 26 Jan 2026 12:28:44 +0200
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
Subject: Re: [PATCH v3 14/26] x86/virt/seamldr: Introduce skeleton for TDX
 Module updates
Message-ID: <aXdB3F6xaDxjpE5N@tlindgre-MOBL1>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-15-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-15-chao.gao@intel.com>

On Fri, Jan 23, 2026 at 06:55:22AM -0800, Chao Gao wrote:
> The P-SEAMLDR requires that no TDX Module SEAMCALLs are invoked during a
> runtime TDX Module update.
> 
> But currently, TDX Module SEAMCALLs are invoked in various contexts and in
> parallel across CPUs. Additionally, considering the need to force all vCPUs
> out of guest mode, no single lock primitive, except for stop_machine(), can
> meet this requirement.
> 
> Perform TDX Module updates within stop_machine() as it achieves the
> P-SEAMLDR requirements and is an existing well understood mechanism.

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
