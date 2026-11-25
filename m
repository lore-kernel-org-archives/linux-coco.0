Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590338;
	b=J9gO9MLasSfq/f1kSL89gftvO/NU52vsuup9wWIQvzk5mcQuJ0yNxHUUziaPpFRsmpQz
	 7l5iDq2q4/ccox1jogKCxZZnyFJh2jhxO95A/rJfq4YeBgXbo77u8PmFhT48HFb3WKIwt
	 gTbPxZTkdciNE/iSU0D+jN4i96vPloeeLmHbSdRxjiQNa8Qeuk5NqfM6VmMBcvlIF14ES
	 2s0g5YzQ6EHKX4uja2DoBa0zbhERsxcynup1jbftRsj+SMoMzWDOxE5XPbBkAcoGARGdd
	 9Amn8NfHlF7ShGIw7uZbvo8nWowlfJe42zKqoDVqSRKcro9jlVCJ43ETnA0SxIwJhpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590338;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XKpGxeZV3UAPEUKWirMhDVIlst3maSl/S53/O57z3mA=;
	b=PcOPpSn+GGe8bs5vpxkL+aVZi0Tucj5I3bPDoQ/Q249qyNljJynKwgSuZ51K8fWPeD6Q
	 B8erPPfq+5axNE4e55Cro58fFdwD3HFns8cVGtjGbhipSgLENYvDCPviaUkj2rU9k7zZb
	 juPMEclGaDwActiMYrKEBNAAKK/Z2qQSJ32lfA9RoKG/JlVKO1PDBKRBft0WbbDP2H6qI
	 RNlh0EvwjxaHgyGHpSjgi/SxYCsBIUtoBtK+vycQIWPOiYOaFw4a5xas5LLPcB2lGiqeN
	 gBv329WzwLgz0KRjz8i/fS8HASrzmUDUB7Zn1ch2uYukF9IRPP/6TCWDq8kKW9d2ihA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=golkQrt9;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B22606A32D
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 07:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B22606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=golkQrt9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795590338; x=1827126338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wlZJDkJmESKOMSXVmkNcXwFq5iu0FNt5SqGrsOrP5KQ=;
  b=golkQrt9QsEM9Ys5oKwRE2mYh8mCzd1vnlPoySkeWdbqqKK1WrTlutRA
   QDPf4S+0PqGOrUaH+zEeCAyKfuMQpx5UZkqZ51Ef5G7KDHlr7+RQFEWQa
   kvhMprjW4+i60iVsQN05GEiumFNEdnPji6awO7Jfx9jeRmqruwLg4OIFY
   +rX//tBhTY4G+NLsfxfwMpp9OYhhPDbnQd9wJ3CCL9qC+1XtmmHZj8Bd0
   P6jNtyhegGNxgQ4TEXYnv+3xWNfNdUQsXymEba7UAXcXo5ML6w11/eXt/
   NAL00rd6J/7hLRsFNmdp7D0ZVghJqSPvE75xWc2yAWC/+86brCSgTk9bD
   Q==;
X-CSE-ConnectionGUID: y774o32WR/uIopblISx3vg==
X-CSE-MsgGUID: g2aHiDJBQDWaFaiHwKkv6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4431285"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4431285"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 23:05:37 -0800
X-CSE-ConnectionGUID: 802W8KuiS7Sgw0xA88I5kg==
X-CSE-MsgGUID: 9COkDWdES+WUEDiexgfbuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12224181"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa009.fm.intel.com with ESMTP; 24 Nov 2026 23:05:31 -0800
Date: Wed, 25 Nov 2026 14:55:37 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Xu, Yilun" <yilun.xu@intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"Maloor, Kishen" <kishen.maloor@intel.com>,
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>,
	"Fang, Peter" <peter.fang@intel.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"Gao, Chao" <chao.gao@intel.com>,
	"artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH v5 3/6] x86/virt/tdx: Add extra memory to TDX module for
 the extensions
Message-ID: <awaGafN61s1Oi4nd@yilunxu-OptiPlex-7050>
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
 <20261111-tdx-module-ext-v5-3-c74f764abc3d@linux.intel.com>
 <CO1PR11MB48354ED95F53409835B9F49B8C442@CO1PR11MB4835.namprd11.prod.outlook.com>
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
In-Reply-To: <CO1PR11MB48354ED95F53409835B9F49B8C442@CO1PR11MB4835.namprd11.prod.outlook.com>

On Tue, Nov 24, 2026 at 07:54:00AM +0000, Tian, Kevin wrote:
> > From: Xu Yilun <yilun.xu@linux.intel.com>
> > Sent: Wednesday, November 11, 2026 11:49 AM
> > 
> > TDX module extensions need memory for their execution environment to
> > serve SEAMCALL leafs. The TDX architecture implements the extensions
> > in such a way that they use the memory outside of SEAM range, so the
> > kernel should add the memory upfront at initialization time.
> 
> The cover letter says:
> 
>     TDX provides a separate SEAMCALL execution *environment* - the TDX
>     module extensions - for those operations.
> 
> So the TDX module extensions is an environment, to support operations
> of various add-on features.

The TDX module extensions are the enviroment, the TDX module brings them
up as a whole. But internally, they are composed of several independent
services, each supports one feature.

> 
> Here "TDX module extensions need memory for *their* execution
> environment" - 'their' seem to indicate that the extensions itself is not
> an environment. sounds like referring to the add-on features instead.

How about making it simple:

  The TDX module needs memory to setup the extensions. The TDX
  architecture ...

> 
> later in patch5:
> 
>     Note that TDH.EXT.INIT builds all configured extensions. The SEAMCALL
>     leaf fails if any extension fails to initialize... If a nice-to-have extension
>     appears in the future, this can be revisited.
> 
> This reads more like 'extension' == 'add-on feature'.

The 'extension' == one service that supports one feature.

> 
> Could you clarify it and make it consistent in this series?
