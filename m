Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA6F3064AF
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421938; cv=none; b=SNKJd2wrIub6gTQ8S0WzprSBQHTy25e6gcBQllOoSmeKx5muXaxjTsD7TkY+J98/8hGs31uSleC0crRInzU6hoqBru5fVmv71v7vVPP8+XF87AFWQmKr+T9aF1MHqTg8rPnnZ0YLYDkfNAHf9XUQrd5IBaTpdSG8vce1GKpHN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421938; c=relaxed/simple;
	bh=nwre8qDTyZou/IUnISFnT1IEmC8Z4soACb1PPUSqHIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATWqb/pR7j6Rs1JxHBFi5yUAsqebekWVK76PmNXUYUfLCuL6vw4Hcl3dqGuos7PzhUuiV5y0nRdQTktJWFf1UkrXLJautsyzHEJO71AooOY4H7z5bOIEfsM3LoVktvdtXfSWLwN7b2edOyqD8q6LA60S/ZN8NK9Z3Xv5Xux7DKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnMqmKOF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnMqmKOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769421935; x=1800957935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nwre8qDTyZou/IUnISFnT1IEmC8Z4soACb1PPUSqHIs=;
  b=SnMqmKOFrD8I0+IzZwGNLmKI6Fz3yhmTXDS1IN1TWVjgrNQUxcmi4WCz
   7XfmaRQddt7Im0JdLEeYPwKQYkmK8d0qZgX36BLedfaCFT9aiEaK6eSUJ
   54AHDO9OV26fm6KBDvTqNi4MOGk2SHSj704qV2Aq8u2FCLHiAnPkbeQ0a
   pQSBeTGNcmikQwZx2jm5Pk5zxTs7wDA8jAS4sJ94kpqFY9orSCK3dMCYk
   bu08lOfyXSJ1jRp4Uug0A505UfgqMECFPH7Z1zgSN23YJxomz/cYUKkHw
   2buyKS4BGneZqMyuJKrb+oOk9OEhUEhVuHxudEw/VvHfli3PVSjZN43EZ
   A==;
X-CSE-ConnectionGUID: ndJ0KMIsSJ6JV64WrlJnZw==
X-CSE-MsgGUID: uTVZ9aOHSZqMEQ26dTULJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96060196"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="96060196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:05:35 -0800
X-CSE-ConnectionGUID: DdECOedfR6igMO+j3qbajg==
X-CSE-MsgGUID: hSdRYevzTx6T22WMUR+gIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207699104"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:05:27 -0800
Date: Mon, 26 Jan 2026 12:05:24 +0200
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
Subject: Re: [PATCH v3 06/26] x86/virt/tdx: Prepare to support P-SEAMLDR
 SEAMCALLs
Message-ID: <aXc8ZOufsyWWsBw4@tlindgre-MOBL1>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-7-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-7-chao.gao@intel.com>

On Fri, Jan 23, 2026 at 06:55:14AM -0800, Chao Gao wrote:
> P-SEAMLDR is another component alongside the TDX module within the
> protected SEAM range. P-SEAMLDR can update the TDX module at runtime.
> Software can talk with P-SEAMLDR via SEAMCALLs with the bit 63 of RAX
> (leaf number) set to 1 (a.k.a P-SEAMLDR SEAMCALLs).
> 
> P-SEAMLDR SEAMCALLs differ from SEAMCALLs of the TDX module in terms of
> error codes and the handling of the current VMCS.
> 
> In preparation for adding support for P-SEAMLDR SEAMCALLs, do the two
> following changes to SEAMCALL low-level helpers:
> 
> 1) Tweak sc_retry() to retry on "lack of entropy" errors reported by
>    P-SEAMLDR because it uses a different error code.
> 
> 2) Add seamldr_err() to log error messages on P-SEAMLDR SEAMCALL failures.

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
