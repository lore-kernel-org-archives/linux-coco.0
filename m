Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF4B33AD9F
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810386; cv=none; b=kk/B8jmvmWnEhWEeGJ4M2Qh7TPLKSBY8DfUyd2+ILJImV7osxZayDTbyldDm/UputhMj01VD0sxuHGzkW+qls3QMUaLUe9o9ajC5wFqK5z5N9R/1K47OpbHj266yx430YPx79HFHswnCY924WNyJ3v73tTsQuERqBWnt/Gs4FbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810386; c=relaxed/simple;
	bh=JRVFlFti6RQS26zzqATSJWs5ScqOeMeP6L0Xnp1VpA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9Yg4twqFzoO2xpfd7ZVO8jo8QY0bUlQzR14hRa5uVgUwop4dWKMOuAWS+CCTe1vY9X5YKCBS++CRxqPlKpa8FsYaW2V1cKF0kfdWdhZiSgAiKrf0mOU0GB9bI3+spu8MuH6vmHIP81h49hZOu8ilpP8VwFVMkEJ/bBhb/lk0SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SziWn+0G; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SziWn+0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768810384; x=1800346384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JRVFlFti6RQS26zzqATSJWs5ScqOeMeP6L0Xnp1VpA4=;
  b=SziWn+0G/siBRsy4tOKR133j2yEcL9j1fSeYjOlCQlCiutsG985K9hkA
   Euf7Ox97vL1ukGOPMydqdfD8I/1HTs6M7E+9kNl8wjvw7j206B05LZTle
   xy+cHjM12V9olHRMh/IrwLBSUGywmdx5Sg2Tga9Z87nLpsmiOhGeK4/28
   DKCAJuMhboqtIwJm6Wz9VZKRilQHDHuzbuiEkq5rNUDg22pOn4i/2K5uq
   q+d2jV+nYXfBkt6/2TlMORquaA1LShTFugcYROG7p+22r1ub0jgk4F1Nk
   TaXD3mMJYiIYjKknrQ66Q5zAj8GqoDOL1fz5uO5/fXEsMJFjuXYXw1RAg
   Q==;
X-CSE-ConnectionGUID: m9c07ANcQfiOsMfVCUT8uQ==
X-CSE-MsgGUID: b7KO0HBjTTuGKHpcPtuOBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80738719"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="80738719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:13:03 -0800
X-CSE-ConnectionGUID: 0lZ31phJRhG5kCbfyESufQ==
X-CSE-MsgGUID: amCx/Nv0RCeFaqoXnDHZ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="236494493"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.249])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:12:58 -0800
Date: Mon, 19 Jan 2026 10:12:55 +0200
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org, x86@kernel.org, Chao Gao <chao.gao@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 2/2] x86/virt/tdx: Print TDX module version during init
Message-ID: <aW3nh8n6I8rJxPXl@tlindgre-MOBL1>
References: <20260109-tdx_print_module_version-v2-0-e10e4ca5b450@intel.com>
 <20260109-tdx_print_module_version-v2-2-e10e4ca5b450@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-tdx_print_module_version-v2-2-e10e4ca5b450@intel.com>

On Fri, Jan 09, 2026 at 12:14:31PM -0700, Vishal Verma wrote:
> It is useful to print the TDX module version in dmesg logs. This is
> currently the only way to determine the module version from the host. It
> also creates a record for any future problems being investigated. This
> was also requested in [1].
> 
> Include the version in the log messages during init, e.g.:
> 
>   virt/tdx: TDX module version: 1.5.24
>   virt/tdx: 1034220 KB allocated for PAMT
>   virt/tdx: module initialized
> 
> Print the version in get_tdx_sys_info(), right after the version
> metadata is read, which makes it available even if there are subsequent
> initialization failures.

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
