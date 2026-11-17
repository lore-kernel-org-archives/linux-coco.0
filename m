Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912340;
	b=eyW6OBQxsFl4lv/xRKwjbO3Peuohzeo95p2N7AbBeq93CKR0spl+0hhKzpmPE7SyhU5Z
	 xnCr/LiLiOlQbwkpcq0HZmYJSzOxsrI+qDCt3FY1zAPj0b+NGxb0viuEBBIvvOaBG0jzy
	 nDIIUvS0v81TSxH/I3q7869RRb7KRfvOyuZcvbjPtpGqUJeqOB4caB5SfvSWEFhdtPkRZ
	 Dkx6UbkrSygJ4tMBNVw2IAUrPBJV0zNDwxjxxgorKA8WOmfg5nOzl1k0rN0zv15/Tk8Xr
	 rJfBbkAXK7oZl4qoSjOKy4xUZoXMMSoCIO5/1Q7T3Vc8NSIDW71lKdigb8I70eoHpIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912340;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+QOfZWAWfuxgKbStyVvWkdAdsygA1smra+vivVT1w/I=;
	b=u7ixv+dQ5y5SNBfes1q5XcM5+09UwCkXOqs2mDacProdZHDXzRPWOqeRst2btkPkGGvu
	 riSTJVU4MDWD3D4/VVjhI9LmU+sgskrw9LQ9zKXMJD2y89vrIWQY4uNcEs2LdJCDI3PQE
	 47FIBcgVWHS9edoRqiyGIQXHI4pZINraPrjvDjqiSj+yT3BVsqcW+Au/dEO+Zsb4HnMRs
	 QelpyQekrYqzgFnwWdoJ35kGtTgIC8R7/9XHx0iigvDi0eOXGnTFg7KKcRkR2ZtPAZ3Y/
	 4dL3J2++g+daALWEsxLc1EALDtuvq9yDvSCf8TfyYQ7h3x6URKYO0X8tmhQ1mfb7tHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzWGHHgp;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0DE606A31C
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 10:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzWGHHgp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794912340; x=1826448340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tV++jvHacqiiQ1xuEHsqeJB+olHXNyNtM4oKWmXmp4Y=;
  b=IzWGHHgpg+tOw3iOu4MXL3DquFE1+uGOtNixpH0R77OComVG7rIULMQi
   4CwRo2ooox3jL/5mex5xt4VFFMtPOOHw7TuvmuZtFg3VkBWsrFqrlrvTx
   e0YrCqqeSljSkb4knhaAFpxZAp2tNszzkfDcHVs59Fptv8I2UInksH4TN
   Kab33S/pfhW1AGB0fZ4a6jW8MEYnUAmCq9P940QGRMstyZjD17weBMrAY
   /v/joj34x6ZuhHXGpoWSYLt5MJ/xfzBvOUn7MzY9w3siB2ZL1+Ve0LSuz
   tnhMiq7LIfeEDn8P9WOBj53WMTUptvMG62djc/tcwcauBpWn1V1MTmqD2
   g==;
X-CSE-ConnectionGUID: 0F/HgkrtTEefRtDAiu9KEA==
X-CSE-MsgGUID: TPaAGRRPRRewBGbZUOCYBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3601193"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3601193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:45:39 -0800
X-CSE-ConnectionGUID: e4RQ87EmSrqW1D+kS1axpg==
X-CSE-MsgGUID: deuFrh1ATdKTC7VLwxn02A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9742682"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 02:45:33 -0800
Date: Tue, 17 Nov 2026 18:36:45 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "aik@amd.com" <aik@amd.com>,
	"Gao, Chao" <chao.gao@intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Message-ID: <avwuPRylKEs17+UV@yilunxu-OptiPlex-7050>
References: <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <avW3jZYB5/L4WaGL@yilunxu-OptiPlex-7050>
 <49b19bcfa1b0658cc0aa5cd280acb439bbba8287.camel@intel.com>
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
In-Reply-To: <49b19bcfa1b0658cc0aa5cd280acb439bbba8287.camel@intel.com>

On Mon, Nov 16, 2026 at 11:57:23PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-11-12 at 20:56 +0800, Xu Yilun wrote:
> > > > > 
> > > > > For errors that indicate uncooperative or buggy host, we elsewhere warn
> > > > > in
> > > > the
> > > > > TDX wrappers. But in coco, not handling an error in the caller can be an
> > > > avenue
> > > > > to attack the guest. So I guess we would commonly need to handle these
> > 
> > The secure firmware should guarantee the attack can't impact TSM
> > security.
> 
> We had some issues in core TDX guest where if the VMM lied to the guest it could
> cause shared pages to be returned page allocator. Due to an error not getting
> handled properly in many callers. This led to a debate about whether we should
> even handle the error, or just panic the guest if we see weird responses from
> the VMM. Ultimately we settled on a warn, due to the face that panic_on_warn
> should be set. For x86 code at least, we should be consistent.

I see. IIUC the problem is not the VMM lies or not, it is the guest
itself not be consistent about the page attribute: The caller ignores
the error and see the page private, but the guest PTE maps it share.

Actually the guest can't tell if the VMM lies by GHCI return code,
success or failure. The guest could alternatively ignore the return
code, update its PTE and return success, later the HW can guard the
inconsistency between the guest's view and the physical state when
accessing the page.

Of course the GHCI error detecting is useful to keep system stable when
working with benigh VMM. So I agree that we propagate errors and handle
in the caller for TDI LOCK/ATTESTATION/ACCEPT phase. But I also feel OK
to treat UNLOCK as always success - the kernel rarely fails on exit.
As long as the guest doesn't mess its own TDI state tracking, we are safe.

> 
> So it was more about exposure to bugs then higher level issues.
> 
> >  For DDOS attack, the guest could always move the device to
> > untrusted mode.
> 
> DDOS attack?

Sorry for the typo, DoS (Denial of Service).
