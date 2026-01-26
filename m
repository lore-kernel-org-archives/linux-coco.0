Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB8F32D7F3
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421742; cv=none; b=FHOo4H1sffu6jYXOUP2pXy7YyREqhWUdjQRtgnIBZHj1NpA+ZMjXa6n92GKZjrljwGQhNurazqZU9MdFDrWYUcfxDz8+juNqSWCQWubJIGEad6PZlh1r5o3c0OJG7ZcY3wVlpe4LZnvoqfTJMp7E/tSiy3MzO0LauOA0/Q6BnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421742; c=relaxed/simple;
	bh=wCnUpBD6UHOquyVRWIUEon70kOrWeqJRLV7w/fMtX3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ji6kFAW1MNKahO6UBOxy5LRlovTBVFlpGJ2CtkTsYS50o7+quCg9t67N42Q/zbnJ3pZu9I0N2lEJNM+89s+4TVGEwq/fybq/TV9xM5NRR/iVB3h1gaxEwlU85nqMyVC0rGSsuIKZfhuKg3MeO84ZDmSbhwBCNI3ag+XuNC8//9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcJF+FmS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcJF+FmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769421741; x=1800957741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wCnUpBD6UHOquyVRWIUEon70kOrWeqJRLV7w/fMtX3Q=;
  b=LcJF+FmS7coCJ1NWYtXqJ504DLF2HPzkWFA2qgYp6fhzSEaeY0sxobP+
   CKpI5IfuhwtTpyxRg+9Z9NVQxhP1ubJMljZ/UZZ1ZMbfkOBPjidmJJpNw
   iE8EOGcHsY/b194aVgu9NbArmacE+FH57CRq2eNehy0lBmKhpzCvCk6gL
   gYHxJU/CguvSpP6mwGs5681JYL3SNIb+6yl8oMUYbUW/7etqT+Xc2WtXP
   rkwYYO31KnMXVXzXpugdrzHcXqhUWYru+RAu0nR/62fpgV1CYpJJqQ4m4
   nM8wAat39yIs/2NxElkKMeoeYwAvGfGuS22OipxT/bLYqXYGhHe+HV1Ni
   Q==;
X-CSE-ConnectionGUID: wxkdvTMITNOEkRPWa2smcg==
X-CSE-MsgGUID: UysmwIWOT2q/kDs4VU+vKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70500578"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70500578"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:02:19 -0800
X-CSE-ConnectionGUID: MdRXogEXREuECtNDX+g+vg==
X-CSE-MsgGUID: FyQWIZOBT8CF3GQbsg1ivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="211733713"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:02:10 -0800
Date: Mon, 26 Jan 2026 12:02:06 +0200
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
	ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
	yilun.xu@linux.intel.com, sagis@google.com, vannapurve@google.com,
	paulmck@kernel.org, nik.borisov@suse.com, zhenzhong.duan@intel.com,
	seanjc@google.com, rick.p.edgecombe@intel.com, kas@kernel.org,
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 02/26] x86/virt/tdx: Use %# prefix for hex values in
 SEAMCALL error messages
Message-ID: <aXc7nuw7gokj6zvY@tlindgre-MOBL1>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-3-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-3-chao.gao@intel.com>

On Fri, Jan 23, 2026 at 06:55:10AM -0800, Chao Gao wrote:
> "%#" format specifier automatically adds the "0x" prefix and has one less
> character than "0x%".
> 
> For conciseness, replace "0x%" with "%#" when printing hexadecimal values
> in SEAMCALL error messages.

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
