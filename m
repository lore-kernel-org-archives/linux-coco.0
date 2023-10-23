Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF02257D
	for <linux-coco@lists.linux.dev>; Mon, 23 Oct 2023 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2LqzBO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698075340; x=1729611340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rh3WIkroWfusSZh8pyM6xIJoI8clu8Gzvxh74Q9Cu1A=;
  b=g2LqzBO7lUkK+TqvVbjTvrLpqffO40v25+HehJvEEVpRXpG2zR4aa7kG
   EG7IHWt+2tBWO091OSSC3huC5viRyVcb3oRUQI9wuedFvxzjoX+S7wwH8
   xVSJ3pgozd13KpXGAiXUw8ZD9ONyMimn0Vzx8kt6DfmCcgNcJaYKe9inT
   rbYFw6IP7aRq+bjVmI3ZzX0JV5nUV9nawg/Ae2beJNl97Y/a0ogCGX3b5
   8+ZsIH9VPaOKZwj4oVPiiDx9U42v0AP4wUdRlPVbxuS80dvu7hyI+9jpY
   XUmWIz8IYUxf174qazM2jmtJC/Dpyu0dxnvpVjxBc9n9vWKOEoljyhgtl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385762198"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="385762198"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 08:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="828480810"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="828480810"
Received: from swidman-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.211.241])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 08:31:45 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id D62B9109B10; Mon, 23 Oct 2023 18:31:42 +0300 (+03)
Date: Mon, 23 Oct 2023 18:31:42 +0300
From: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"Christopherson,, Sean" <seanjc@google.com>,
	"bhe@redhat.com" <bhe@redhat.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCHv2 02/13] kernel/cpu: Add support for declaring CPU
 offlining not supported
Message-ID: <20231023153142.bes7zxcjc2soihsl@box>
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
 <20231020151242.1814-3-kirill.shutemov@linux.intel.com>
 <0a29fef814e51a2aa0030ec9cc97366718859411.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a29fef814e51a2aa0030ec9cc97366718859411.camel@intel.com>

On Mon, Oct 23, 2023 at 09:30:59AM +0000, Huang, Kai wrote:
> IMHO it's a little bit odd to have two mechanisms in place, even in this middle
> state patch.  Is it better to completely replace CC_ATTR_HOTPLUG_DISABLED with
> the new cpu_hotplug_offline_disabled in this patch? You can explicitly call
> cpu_hotplug_disable_offlining() in tdx_early_init() so no functional change is
> done.

I can. But I don't see how it makes a difference.

> Or I am wondering why cannot just merge this and the next patch together, with a
> proper justification?

Because the very next thing reviewers would ask is to split them :P

> Btw, IMHO the changelog (this and next patch's) seems didn't explain the true
> reason to replace CC_ATTR_HOTPLUG_DISABLED.
> 
> 	Currently hotplug prevented based on the confidential computing
> 	attribute which is set for Intel TDX. But TDX is not the only possible
> 	user of the wake up method.
> 
> "TDX is not the only possible user of the wake up method" doesn't mean we need
> to replace CC_ATTR_HOTPLUG_DISABLED.  E.g., other CoCo VM type can also select
> CC_ATTR_HOTPLUG_DISABLED if it uses MADT wake up method.
> 
> To me the true reason is the new MADT wake up version actually brings the
> support of offlining cpu, thus it's more suitable to decide whether the CoCo VM
> needs to disable CPU offline based on the MADT wake up version, but not the CC_*
> attributes that is determined by CoCo VM type.

No. MADT is orthogonal to CoCo. It can be implemented outside of CoCo
environment and CoCo platform can implement other wake up methods. It is
not up to TDX/SEV/whatever to decide if offlining is supported. It is
property of the wakeup method implemented on the platform.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
