Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595566;
	b=386aP9GX/2wXwzSmWppxbxt3ViHDGOyKIpbFVSqRnulDA1qZhpa7eZTEcT6juxg+J/qa
	 xA9xf4zlwq8AVUDLfQPb7Ni3SmDdAsYtXeNsojWP1HydTYT+H0ywehdItoL6UfUxz+qgM
	 a9YL6GFkBttZejJ3oFEEXiZOr663PEeGRMo9YgQIvVFwSzGJFijjo9x5jcelbN8/QkxfS
	 NUL9oX5euZJq64Hnl3tStlLSHxCls8BueViyFszA1M8BED0LkvPi9bxt1NPJc0B4lT3Be
	 jTI+ymxXO/BpKsmFMgbVf0VBdZ31S02+L2tf3tKMTC14y4QVqwsCSeXU0L3CahGVdPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595566;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GAOySOHOoFjqZrbmfCpijN96GPPhw/OBWtHM7Ffexhc=;
	b=GHl5LXoBIBhCySjoEm6Rk65Ux7sBx/pb07YpYcnNlTZPlf5t05RCz2mmNCehmvEZTOZF
	 2H7BPOOYAx5aYee4OAla3CF0n5LUuCLp4DDSL9IoP9DNTl89s8xuS5VAj5f88QJ50HOMf
	 HISwya2p+wMAcoC596VSDVaT9GCzZf/2/sgK/WRlYOCGDE8JWbwTMLXEg2SgMBoycERou
	 xbOML2sIwi+2PUekbeas/Z83ufjltZxjrvGYszlkt3QGyz/1C0tWTRJub/5whXK/Dz77P
	 ir2k+zsVIZtJJp6YEEJZnK3/Hc67Rd2z2jM3pfeX+7xWDKclv0xKkmYG+Jv3mBjHtwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DdnjSSw8;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59242606A321
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 08:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59242606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DdnjSSw8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795595565; x=1827131565;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=K1iPVDxUPDjUuvcvkZmJZhqUId9+4mO4x264Dfop09Q=;
  b=DdnjSSw8yAPKdzAgJF+IulX40/fZNfD/Pp366dZ63EHZqyB6JkU+Zxkn
   OPHmJryqWMcTpJBiEs/XJUzFqqwP25XprQMfxsTVrabdAN+CBLO9U1Xb/
   wQkK8VQqaHnq/+ZFGdoGUx8+D//XbGiJINgp3mDRahDm3FcXbTszDu/BE
   PHzU/QCnDUAbDU0kqoCUiJdZkLhVexZ5Lp5JPM1FeWZ+xmsX7RiSopAQq
   9ylWgI68AAWRbViP64lDF9MfzQ5v0jGvHlj/UgiW5t5y5yQG1trB5OmK2
   dYrFSxf03PjFrgZmFMpYDTNuqqnNBWcZVaONWp4+PQgpKwJh23F+DqXZz
   Q==;
X-CSE-ConnectionGUID: Igx/9UyATBO60A90UDhFEQ==
X-CSE-MsgGUID: 2kEUhDLITBSir3VtBwo0jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4440955"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4440955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 00:32:30 -0800
X-CSE-ConnectionGUID: 6qz503orSnSHEvWM3SqqlA==
X-CSE-MsgGUID: HxXi03GUQgWrFXYjonGb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11593068"
Received: from unknown (HELO [10.238.0.68]) ([10.238.0.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 00:32:25 -0800
Message-ID: <5b6837a8-f8bc-4e7f-8419-01853eecd531@intel.com>
Date: Wed, 25 Nov 2026 16:32:22 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org"
 <x86@kernel.org>
Cc: "Hansen, Dave" <dave.hansen@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "kas@kernel.org" <kas@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>,
 "Verma, Vishal L" <vishal.l.verma@intel.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "Tian, Kevin" <kevin.tian@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "tglx@kernel.org" <tglx@kernel.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>,
 "Gao, Chao" <chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
 <8acf514600526e3a2b0af151b0fa8a7b7a779c81.camel@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <8acf514600526e3a2b0af151b0fa8a7b7a779c81.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/25/2026 3:41 AM, Edgecombe, Rick P wrote:
> On Tue, 2026-11-24 at 14:01 +0800, Xiaoyao Li wrote:
>> 1. The requirement of R8-R15 are reserved to 0 on TDG.DMAR.ACCEPT.
>>
>>    This is the first leaf in TDCALL/SEAMCALL that explicitly requires some
>>    unused  registers to be 0. Without justification of why it must to be such,
>>    we are going to propose to remove this requirement and it helps drop the
>>    PATCH 13.
> 
> Ah, ok so the problem is we need to make sure those registers are saved in the
> wrapper, if we will set them to 0 before SEAMCALL. So the seamcall code doesn't
> clobber the callers registers.
> 
> But I tend to think an ABI rejecting reserved input is a general good thing.
> Since SEAMCALLs are not fast, I wonder why care about optimizing the wrappers to
> save and restore the minimum. If we just always saved and restored the general
> purpose registers, we wouldn't need so many wrappers. And then when TDX module
> wanted to add new SEAMCALL ABI we wouldn't need to do the whole version
> selection thing. Just pass a new bit or whatever. 

So we reserve the unused registers as 0. When new SEMACALL ABI is going to be
added, just directly extend the reserved registers and allow them to be
non-zero.

This implies that value 0 becomes the ABI indicator, or value 0 represents the
old behavior in the new ABI. However, this simply doesn't work for TDH.VP.INIT,
as the version 1 of TDH.VP.INIT extends bit[31:0] of R8 to be the 'X2APIC_ID',
where value 0 is a valid value and cannot represent the old behavior.

> That would have simplified the
> TDH.SYS.CONFIG changes for DPAMT and add-ons.

It works for TDH.SYS.CONFIG, because

  R8[16] = 0           means Static PAMT
  R9 = 0 and R10 = 0   means enable no add-on feature

where value 0 means the old behavior.

> So I'm thinking that old seamcalls were maybe incorrect and this new way is
> correct. Yes we would need a new patch, but what if it was a simplication patch
> that got rid of all the seamcall variants and just always saved/restored?
> Consider those premature optimization. Any problems?

I agree an always unified saved/restored helper is a good thing if the
additional overhead is not a concern. But as commented above, reserve the unused
registers to 0 doesn't look to make the SEAMCAL/TDCALL ABI extension easier.

>>
>> 2. Add 'TDI' to the names of TDG.DMAR.ACCEPT and TDG.DMAR.RELEASE and maybe
>>    rename 'DMRA' to 'DMA'
>>
>>    TDG.MMIO.ACCEPT has already been renamed to TDG.TDI.MMIO.ACCEPT in the latest
>>    public TDX Connect API spec, to call out its scope is TDI. It's better to
>>    add 'TDI' to TDG.DMRA.* as well to make them consistent since TDG.DMAR.* also
>>    operate on TDI scope.
>>
>>    Besides, DMAR means "DMA Remapping", which is an IOMMU capability. Without a
>>    virtual IOMMU for guest, the guest should just care about the DMA capability.
>>    So it looks DMA is more accurate than DMAR.
> 
> Ok.
> 
>>
>> 3. TDG.TDI.MMIO.ACCEPT requires TDI to be in the ASSIGNED/ACCEPTED/RUN state.
>>    After TDI is bound by host via TDH.TDI.BIND, the state is BOUND. It requires
>>    guest to call TDG.TDI.RD read the TDI_GET_BIND_SESSION_ID, which changes TDI
>>    from BOUND state to ASSIGNED.
>>
>>    This is a hard dependency for TDG.TDI.MMIO.ACCEPT not to fail and it's not
>>    mentioned in patch 12 where the call to read TDI_GET_BIND_SESSION_ID is
>>    added.
>>
>>    The SESSION_ID is used to ensure the host doesn't bind a new TDI after
>>    guest attests the TDI without guest's awareness because the SESSION_ID is
>>    verified in the following TDG.TDI.START. And making the read of
>>    TDI_GET_BIND_SESSION_ID to change the state machine of TDI from BOUND to
>>    ASSIGNED, make it mandatory for the implementation.
>>
>>    But it doesn't make sense to assign additional semantic to a metadata reading
>>    behavior in a specific phase. Instead, we want to propose introducing a new
>>    dedicated TDG call, e.g., TDG.TDI.LOCK, which needs to be called by the guest
>>    to lock the TDI after it's bound by the host, and it returns
>>    TDI_GET_BIND_SESSION_ID on success.
> 
> Yep.
> 
>>
>> 4. TDX_PAGE_ALREADY_ACCEPTED is listed as the possible return code for
>>    TDG.TDI.MMIO.ACCEPT while the description of TDG.TDI.MMIO.ACCEPT reads:
>>
>>      If the page is already MMIO_MAPPED, skip the page.
>>
>>    They conflict with each other and lead to confusion.
> 
> I'd think if the page size is incorrect it should return
> TDX_MMIO_ACCEPT_SIZE_MISMATCH. If it is already accepted it should return
> TDX_PAGE_ALREADY_ACCEPTED. In the case of mismatched size but already accepted
> page, ideally it would return TDX_PAGE_ALREADY_ACCEPTED, but it would be ok if
> it returns TDX_MMIO_ACCEPT_SIZE_MISMATCH.

For private memory accept, if the mapping is not accepted by the guest yet:

 - when accept level > mapped level, SIZE_MISMATCH is returned so that guest can
   try accepting at a lower level.

   TDX_MMIO_ACCEPT_SIZE_MISMATCH is also returned for MMIO in such case. They
   are consistent.

 - when accept level < mapped level, EPT violation happens so that host can
   demote the mapping.

   There is no behavior defined for such case. But I think the reasonable option
   is also to EPT violation to the host to request the host maps at lower level.
   Forcing the guest to a higher level doesn't sound reasonable because the
   guest might not want the whole range of 2M MMIO is accessible by the driver.

Regarding ALREADY_ACCEPT, we need it for private memory because a successful
acceptance of private memory will clear the content to 0. TDX module don't know
the intent of the guest, so it makes sense to return an error code to tell guest
the page is already accepted without clearing it. If guest wants to clear the
page, it can do it itself.

But for MMIO, there is no such clearing semantic. Skip on the already-accepted
MMIO page and return success seems to have no problem. Besides, private memory
accept is operating on a single (huge) page but the MMIO accept is operating on
a range. Return ALREADY_ACCEPT would increase the complexity on the output to
tell the current status but without any real benefit.
