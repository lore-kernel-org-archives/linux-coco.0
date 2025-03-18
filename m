Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072571714AC
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742290292; cv=none; b=jkrzXpsTEJet7P4yaRVLhXWMWtw8eZUDbk5lDjWYJ7vNkNIKBex1uLZ8+18VIvg402nBWwARIIyiMKYWznBC/LmVfE0HXvijm4l21JQoRY/vuHpK0w42jzcOifquPfy9dGohfDJnYOb+LMySeODbRCPtt7ECBU6PNjlIaIHlN9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742290292; c=relaxed/simple;
	bh=gZErNhjR48vAPXebyx0gKSDzIAiHsdtJLMeu9qfxX3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugLSWde0fraXGHMfvud/eOKqjpz2mg/lK6zo5HylMf9tO0YkTa2WoC/VGhAaFO54aqv5cs/0jmHWESNfSY2+vOWAvZpnujcSuqucBynhYDQhjeMkvuWudo2VrBI3G6ZVrImqph/oBhqTQ9+P4q0sDysPARQ1Ou4d/zMQK8R/hk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5n9uka0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5n9uka0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742290291; x=1773826291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gZErNhjR48vAPXebyx0gKSDzIAiHsdtJLMeu9qfxX3U=;
  b=c5n9uka0SnaxxdCjYnM9PjAtSHi90aMRtPEZ1e9xy4Vxzsz9AZ5CBG7O
   TZs75NT+wupMAxj5GecWV2YFt3eejyGbTMXbz6CXjDJ1aoKH9GT54AP1z
   c7K8F78XqFRfHSm1I78Q8Fm3Erxm7ihcLU0z1Sy2IT6PRJ6AZhL0Q08np
   uxBLCfZqj3x3+xHnLnN6DOb8fU1kjoDPF2R7UJIK8mpFirj+4CRS2/oFm
   rJFJBymPSnanwKcjZMd3MHX1nmBcNQ02SToNJ2xoY4xeISgrSh1eijQO3
   jXDNO6ENm+uVvh2iUt0G3bbfyGm1Wu6WCcGJlwF1rQyUeHuW7to/BHPCh
   A==;
X-CSE-ConnectionGUID: CPJNbY0HTtW8N8gxOxSwhQ==
X-CSE-MsgGUID: PeoFXlBwTkiXwldkIy2FrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="47069398"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="47069398"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 02:30:51 -0700
X-CSE-ConnectionGUID: t6a5cyIcQaefTQk12nHkzQ==
X-CSE-MsgGUID: b4hPRYFDS12xSZguFhxkBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="123154267"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2025 02:30:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 70130214; Tue, 18 Mar 2025 11:30:46 +0200 (EET)
Date: Tue, 18 Mar 2025 11:30:46 +0200
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Dan Williams <dan.j.williams@intel.com>, 
	Joerg Roedel <jroedel@suse.de>
Cc: Alexey Gladkov <legion@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Alexey Gladkov <alexey.gladkov@intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Juergen Gross <jgross@suse.com>, Larry.Dewey@amd.com, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [RFC PATCH v1 1/3] x86/tdx: Make TDX metadata available via SYSFS
Message-ID: <iiqa3m57jrqlyy7qmydf7klkub7bqbn7gqjh2te2fyp6un3dk3@qik6uuao7dlb>
References: <cover.1741952958.git.legion@kernel.org>
 <ddbf49381eb5d1779e218e022ffc144db5da003e.1741952958.git.legion@kernel.org>
 <67d4bee77313a_12e31294c7@dwillia2-xfh.jf.intel.com.notmuch>
 <nvnjhx235xbsrnq3t6zbkgogsdizbigrlgqyx6muyj6k2g34gq@zzn6bqvoha45>
 <67d8cde71e75b_201f0294a@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67d8cde71e75b_201f0294a@dwillia2-xfh.jf.intel.com.notmuch>

On Mon, Mar 17, 2025 at 06:35:35PM -0700, Dan Williams wrote:
> Kirill A . Shutemov wrote:
> > On Fri, Mar 14, 2025 at 04:42:31PM -0700, Dan Williams wrote:
> > > Alexey Gladkov wrote:
> > > > From: "Alexey Gladkov (Intel)" <legion@kernel.org>
> > > > 
> > > > Expose the TDX module information to userspace. The version information
> > > > is valuable for debugging, as knowing the exact module version can help
> > > > reproduce TDX-related issues.
> > > > 
> > > > Signed-off-by: Alexey Gladkov (Intel) <legion@kernel.org>
> > > > ---
> > > >  arch/x86/Kconfig                  |  1 +
> > > >  arch/x86/include/asm/shared/tdx.h |  2 +
> > > >  arch/x86/include/asm/tdx.h        | 12 +++++
> > > >  arch/x86/virt/vmx/tdx/tdx.c       | 74 +++++++++++++++++++++++++++++++
> > > >  4 files changed, 89 insertions(+)
> > > > 
> [..]
> > > > +__init static int tdh_sysfs_init(void)
> > > > +{
> > > > +	struct kobject *tdx_kobj;
> > > > +	int ret;
> > > > +
> > > > +	if (!hypervisor_kobj)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	tdx_kobj = kobject_create_and_add("tdx", hypervisor_kobj);
> > > 
> > > So this "/sys/hypervisor" proposal is clearly unaware of some other
> > > discussions that have been happening around sysfs ABI for TEE Security
> > > Managers like the PSP or TDX Module [1]. That PCI/TSM series discusses
> > > the motivation for a bus/class + device model, not just raw hand-crafted
> > > kobjects.
> > > 
> > > My other concern for hand-crafted kobjects is that it also destroys the
> > > relationship with other existing objects. A /sys/hypervisor/$technology
> > > is awkward when ABI like Documentation/ABI/testing/sysfs-driver-ccp
> > > already exists.
> > > 
> > > So, no, I am not on board with this proposal. There are already patches
> > > in flight to have TDX create a 'struct device' object that plays a
> > > similar role as the PSP device object. For any potential common
> > > attributes across vendors the proposal is that be handled via a typical
> > > sysfs class device construction that links back to the $technology
> > > device. That "tsm" class device is present in the PCI/TSM series [1].
> > > 
> > > [1]: http://lore.kernel.org/174107245357.1288555.10863541957822891561.stgit@dwillia2-xfh.jf.intel.com
> > 
> > Dan, could you elaborate on what is actual proposal? I am not sure I
> > understand what 'struct device' can have info on TDX module version be
> > attached to it.
> 
> Confused, you do not understand that devices can have sysfs attributes?

I didn't understand what device it would be in TDX case.

> Documentation/ABI/testing/sysfs-driver-ccp describes a device object and
> sysfs attributes for SEV-SNP firmware status.
> 
> For TDX, the proposal is to create virtual device to stand in for the
> lack of a PCI device that fills the same role as AMD PSP.

Okay, I got it.

Do you see a problem having the same interface for both host and guest?
We obviously need indication what level we are running on.

> With the expectation that all TSM technolgies (SEV-SNP, TDX, CCA, etc)
> register a device, udev rules can trigger off a common class device
> uevent. That proposal is detailed here [1]:
> 
> [1]: http://lore.kernel.org/174107247268.1288555.9365605713564715054.stgit@dwillia2-xfh.jf.intel.com

Joerg, what do you think? How does it fit your ideas for SEV-SNP?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
