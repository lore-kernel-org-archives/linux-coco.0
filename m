Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059637;
	b=OKu3zQCaIJozsNoDWnnEOfh7ouS0EqHn6Ztg0B+PPnO00tVS6+qXsjvUGtYbMfvM4Clb
	 Jve7Yo9tsrYp+wbJOl1qwdgYb1Vmr2VikyxPwiBLFp/FaxTZ+ResEwCM/NLBzuzJ+tH8t
	 f+TNv3uE3EeqxXZnnfAoGRstccRAq95I0vXx7Q/k1HvkKC/9kISKXVvGVoFWCb72vM7F3
	 kc0tqs6/WWpj/D/xS74SI9enWK9ymFjB7uRph8EPbcDCzHCHbrRP37av1hTSRZewpJbuK
	 wQ5VKaek8M2mN1Iqonq450OwQXUOM6bSWobz6Ah48qg3noalMgejm22ekjSTYjAegUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059637;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NI0va50cDCKMHdfqKJQeS8LALWOya2PyFi/22nDA7R4=;
	b=RjKUPaZtR40H9aBgXD3atEkEsuUt2g3XvRH+IOB5WR9zGxJ6ZxQH5YaqTKLYbZkT9NMF
	 CVOWBASrKsSL3Kv8Ehmdq4mkNwbmqgmBKzaz5nCdBVADjo4YiSOreyY1b8z2+tjkUFwRX
	 1rb+dC6RBJu+r4yksIipETxtMg7AHWjm4JEfkJGhNNZ8/IvLKMkqTEL/KWgigQ53XTwVz
	 q1oUYLj5FZJUlH27i9OmENGp8t/NbGy0AulHI8bBlDJkXPTl1Y2iaDlTM/ouca2ySRp6n
	 1jOsHi0yz1MpaDfocnBLEs99w9sa2JzUpo413pmuUI4UAWlR5Iga0WAiuf+kVZVeqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HrcvmuaE;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDDC60A5BCC
	for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 03:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FDDC60A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HrcvmuaE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795059636; x=1826595636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bIsDMXZZ/vjl+EXRlXLqewlTe/KOQScQ5HwofszCNrY=;
  b=HrcvmuaEOrAixQX3vBQqCgWbPM706eq2XTNt8ryRPe1ODxzPE0hH2U+Q
   xy7zuLXOhiNlmVKQ2k1rGJPELxoX5aXpjDTjJ8XvYAQbu1R4LY01KcOJN
   zlVIqdD6qXmpk07xc/tJ3+2K0nQ43xc9Poy83u5ezCZPw6W2aaebl6xGH
   5P4Mt5pPVrVcPCzjBNOYQMiMKhiUlnHLlvh/JMdm4m5A77oCEE+EdTlKi
   F2nh9QTkx3N0pcAb5CiaB3/5hbnIQfGJhEx3koDM+xfSzVLqiUVbHtmti
   1rL4byhpDVXuHWGvLTsmcV9Odj8M10gyQNOiPQPCJI9Fr8eS8sX0g60a+
   A==;
X-CSE-ConnectionGUID: JjnUP70SSqyvPXS+wuSkvA==
X-CSE-MsgGUID: jU3S/yaFRFqnIWbYvVWiNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3815643"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3815643"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:40:36 -0800
X-CSE-ConnectionGUID: ec5JIMXARAOxobLn3/RyVQ==
X-CSE-MsgGUID: E+fGsanTSTaf0YBIbE1NhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10225183"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2026 19:40:32 -0800
Date: Thu, 19 Nov 2026 11:31:28 +0800
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
Subject: Re: [PATCH v5 1/6] x86/virt/tdx: Move TDH.SYS.CONFIG operations into
 a wrapper
Message-ID: <av5tkGyaCEuWdzyF@yilunxu-OptiPlex-7050>
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
 <20261111-tdx-module-ext-v5-1-c74f764abc3d@linux.intel.com>
 <cbc0c92dba00c04fc538f40795c00f94c53d5bcf.camel@intel.com>
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
In-Reply-To: <cbc0c92dba00c04fc538f40795c00f94c53d5bcf.camel@intel.com>

On Wed, Nov 18, 2026 at 06:51:30PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-11-11 at 11:48 +0800, Xu Yilun wrote:
> > TDH.SYS.CONFIG is currently not wrapped in a SEAMCALL wrapper because it
> > is not exposed to external callers (such as KVM), also because the
> > level of TDX ABI details needed to perform the call is low enough to
> > flow well with the calling code.
> > 
> > But as more configurations are being added to this SEAMCALL leaf, more
> > ABI details are leaked into the surrounding caller code, which decreases
> > the readability of the caller logic. The first case is that the Dynamic
> > PAMT (DPAMT) change [1] tweaks the R8 argument based on whether DPAMT is
> > supported by the loaded TDX module.
> > 
> > A follow-up case comes as the TDX architecture has evolved the ABI to
> > introduce new leaf versions. The host must select the version to call
> > based on what new features are supported by the loaded TDX module.
> 
> It is not totally clear to me what a leaf version is here. Like is it a new leaf
> or (as it actually is) a new variant of a single leaf.

How about:

 A follow-up case comes as the TDX architecture has introduced a new
 variant of TDH.SYS.CONFIG by adding a new leaf version for it. The
 host must ...

> 
> > 
> > Before the version selection makes the caller logic even messier, move
> > the register ABI operations into a wrapper.
> > 
> > The original changelog was written by hand. AI was used to help correct
> > grammatical errors and polish individual sentences for better
> > readability.
> 
> Looks good overall, but weren't we going to drop the AI blurb? Oh oops that was
> a comment on a different series:
> https://lore.kernel.org/lkml/03cdc774-7fef-4d0b-82f7-126288636f3d@intel.com/

Yeah I saw this thread. My reading was that this sentence "AI was used
under supervision to review code and workshop logs" is too broad to be
meaningful. I have cut this sentence for this version, but keep details
about how I use AI to refactor logs.

So can we conclude that if the AI usage is expected, then we don't write
it? In that case, yes I should drop it.
