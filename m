Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B2306D2A
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422598; cv=none; b=ukC26AqBQaQC4rX6H7HgfBIg6cHoJCo51NOAh8c7z/kHUJxUHEv7zSIWSexfEcQrn7puF9oZn0ZmckWwXn/E02FGBOol3/YIFp0Va4yspCp4oCO1Nm5t6q/Ir7QrJWw64Owsl1kCvICF6L0ZXnMzxqbhGNMd4sRiH6oc4ZfvjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422598; c=relaxed/simple;
	bh=upqJG0mb/UgBMLpqOxXHyNZDH9RXuWR+enIz3PWmenU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rl0Fzyvc8Ncse1D0r91A4+839U6BCCIDzumF4YKbpRwatc4FignJqJKCBT8gCP3G8kNaBAfrv6roHdwhKZnoX+bWSxO8Y6/iB90+wVzFMFC1qX1oTgGeJjfwpEYKUjAWZ0t7rr+cPiRyfuzdU41M7HE/cPgnrM/dgLaO6bmp0Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoHtafBL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoHtafBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769422595; x=1800958595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=upqJG0mb/UgBMLpqOxXHyNZDH9RXuWR+enIz3PWmenU=;
  b=EoHtafBLsgAmbs/zU4dE+m4RZNP2b/cFYlMxmOLmMM6xpVJwPjRuaGZq
   H2blrKWKvrObtMWk0lqTkHpJXfqt0N/nQCvUnuHhiypyBFGq9KEd2ANsZ
   eAU4f37nin9r73xvNqHsIx4uJgynP5y1eA6+2MawR8IBSg/QY2FxzWjTa
   /LVzvprjfGOU7KW9fxRrwdTugrZJ+uTES/BH41ULq/QKVdSlQZTpr1Eif
   ekrpNfkyuD2wHZy1QgakaNPoPalMZyfj+eifRWIXONT16h2iTALcvy9WC
   I12XEuMtRpgG4h8HZzfs4A7xKrpb6QsCx0eTAJYueuOt4SVJbK3zQNwgg
   g==;
X-CSE-ConnectionGUID: sK2EGw8wRwSxNHVsS90zWw==
X-CSE-MsgGUID: kL4wYa5vQVywkAYKBDaNDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96060839"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="96060839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:16:35 -0800
X-CSE-ConnectionGUID: rLYSWDcASnelEJ8i4nDXLA==
X-CSE-MsgGUID: fxnPEguqTQWzt5RCiktQbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212118051"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.55])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:16:27 -0800
Date: Mon, 26 Jan 2026 12:16:24 +0200
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
Subject: Re: [PATCH v3 11/26] x86/virt/seamldr: Block TDX Module updates if
 any CPU is offline
Message-ID: <aXc--OlFUhlgf6vm@tlindgre-MOBL1>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-12-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-12-chao.gao@intel.com>

On Fri, Jan 23, 2026 at 06:55:19AM -0800, Chao Gao wrote:
> P-SEAMLDR requires every CPU to call the SEAMLDR.INSTALL SEAMCALL during
> updates.  So, every CPU should be online.
> 
> Check if all CPUs are online and abort the update if any CPU is offline at
> the very beginning. Without this check, P-SEAMLDR will report failure at a
> later phase where the old TDX module is gone and TDs have to be killed.

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
