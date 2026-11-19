Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066714;
	b=U3YiuZ6xuULxLtT6dvbn6ziGb72Y+o7b20qUw+qZ0ViMlGE01Ywdxsq358c629bj75Ft
	 85zMnehcJCTlXPekoRQ/uJz6dvsdXDalo5+SVfAWGFuYZUGtQwcsCqz5dvBu5v9yoPz2O
	 Efmixed5oIT9pDF24r04C4nNpMuUBONaSL/PNDCPA4yIjEz7+ISCV6uA/2xQOe4ZxcshN
	 ZI3c0qyoQzU7SI6vi4SkmrJuPdI6SOvKB8Ld6IZ6KoDbJXeYvPxx59aHQy5BeBA9ArKdw
	 Z4gIviz/6rMeYcoQw+Iok4sD1kXSjphYu3Ao6I3uGBm5oHv3nD+/xn8wo7pajc4ktug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066714;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QfwgZ2UU3p6kh7MSAj1RKc0yq+hEXqvPX6KlaPJKwRU=;
	b=fg8SllKijYuzw3lLEICXV53HrPpNuyjZcQiLWXyMmb9Snfc4pG+PWCAJ3E8DQTQysdvy
	 q+nAYy1Y4rVOAvDbvI3lWXRQY6Vfxvt10e/qSUVjDLRLR4M4aGkvEHG19t6kovCjqOl+D
	 oprv/Rdjx29Xec691saNnI9pvkuuppau/c77ZUOGIjzmIdQ8OqS+UalqzcF+2/VgIMRVt
	 lkqajpUdr5YmYaq1I/1i6Dctm8fvUufF+N6p5HBH4I1Cn8feE91WZIfZNw3V0WjVpSMBI
	 5LlQXKO1BvgvzckvQvsuc2l9AYwYqVuSWJNDsBr/k8VeVWtRrEyPPXaV+lGAiqq7JQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZzXcALvP;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E565606B423
	for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 05:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E565606B423
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZzXcALvP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795066714; x=1826602714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRinQjRHkW4U0zTnypLWeNN2CiIEFsQXaG25rZCZeCk=;
  b=ZzXcALvPmb2m4v+GMMfnaDOvHXC2THs1JBUQV8gY7EETpr3qF3cMOAvd
   nasc4pK+vrcSNKsIhb7983gqoQbjDewCgsNsaYrDGyGBOmFbVygEy8BzD
   OY9FET2pSzQLS6rkA4qjJ4A1dKjXu69G0fGG/mS2UWvbDTfvUfM057xId
   BaPAldrrajdaek4Txl/rdRw9p4/0GVNgXDJGYP81aA5I4uoqMXYsxLK/G
   Y1K1s7xNJE3NIzBOwv4OiIkypZaMGJnNn5S4BA2t9WmZrkXyf4p+9jBgv
   XxO0UbvfuTrEk91OK+JfNac9e0CpHg9Cj9pp4Qxpwa36kjJFfmJ3uUP43
   w==;
X-CSE-ConnectionGUID: W6IyHTwbQk2/xUHJQt52qw==
X-CSE-MsgGUID: xjUKLmN5S/WL/B0qpzC46g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3896958"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3896958"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 21:38:33 -0800
X-CSE-ConnectionGUID: OULyuR10TQC6J3AdE2XqdQ==
X-CSE-MsgGUID: yLN+pAyjQRyKUraKRfVpqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10674379"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2026 21:29:26 -0800
Date: Thu, 19 Nov 2026 13:20:21 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>, "Xu, Yilun" <yilun.xu@intel.com>,
	"artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"Gao, Chao" <chao.gao@intel.com>,
	"Fang, Peter" <peter.fang@intel.com>,
	"Maloor, Kishen" <kishen.maloor@intel.com>
Subject: Re: [PATCH v5 5/6] x86/virt/tdx: Make TDX module initialize the
 extensions
Message-ID: <av6HFbQIxxfmUJYM@yilunxu-OptiPlex-7050>
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
 <20261111-tdx-module-ext-v5-5-c74f764abc3d@linux.intel.com>
 <e658fad644d8f79afa77f48368f0dcd375554bad.camel@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e658fad644d8f79afa77f48368f0dcd375554bad.camel@intel.com>

On Wed, Nov 18, 2026 at 10:44:06PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-11-11 at 11:48 +0800, Xu Yilun wrote:
> > Continue fleshing out the extension initialization process. At this
> > point the kernel has provided all memory and the TDX module is ready to
> > initialize the extensions on the memory.
> > 
> > Initialize TDX module extensions via TDH.EXT.INIT. This process takes on
> > the order of 100's of milliseconds, during which the TDX module loads
> > its internal extension image into this memory and builds the execution
> > environment. Once initialized, those add-on features can use their
> > SEAMCALL leafs normally.
> > 
> > Note that TDH.EXT.INIT builds all configured extensions. The SEAMCALL
> > leaf fails if any extension fails to initialize. The kernel does simple
> > error handling - just fails the whole TDX initialization on any error.
> > This is OK cause all extensions are considered necessary for security.
>              ^because? "cause" in the use is more of a colloquialism. As a word
> "cause" is like "The cause of A is B". But sometimes informally "because" is
> said like "'cause" where the "be" is sort of sloppily dropped. So this reads
> like that.

Thanks. I'll check it throughout my logs.
