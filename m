Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680615;
	b=f+59Q6qkJxwYgxfijxqTZh657Opd8Ja2mY3ybUsv7Go5ZXqccdF3eAceEn2sgxam2SQR
	 ESBpmBsLzs7ETaGd8lf39qRhVkepiD+HG+0IEgw1fPxCUBrI1FAqLEwlf6aoQASRuNH/+
	 KuKU29Magg97rSXcjLE2ZKE79ETjElHnj+yIR+t0OmxzhbYwwlr9zRLAxzrze9ey4a8Ft
	 Loy7H+5d4b1O+UalMfHK0PTxZSu6S4BugoPjyEsJ7ZhYsvIruzhOLivDl355HXrlaPH50
	 8K6ssV1R/hIGVhH/0SkXEk4EG2y+GsW3TEU3INqPdppbizrGW5DDGNQDv8mEwwWSLKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680615;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NSZ/5tknTniK+hABgavJZWei7Qcx5bOH7BLj51t6rCo=;
	b=VyY/nXO/wT30kOqe1B+mbXqVyqZ504hgkaOH3DTdvmcWrqPFn4RZ/9ZOdPlGgAEHJxZp
	 C/itWH09UR1zH+QEkJOraynB9JxU8gIIETSBAEHyIO9UEV/M2Jw7p6A+/7nyXfaFVXz8N
	 x7yEpJ6BK92FB3VV05wjrlD4U2CrNapH1YBMl+RQtRck0WIqD/+TW5RNUo7VUTsYkoKkk
	 Nczx4+Zr8TOPR0r59NBl598gkzuk5aeYe/aOio/+PBiMHqyHVzEuQDySamYMH7Mz8MLbr
	 EmzIKhLP+5jMR2eltFi3ZXJVCPaj53QRODo2pT4iLjwmmpCBXoOOOSSw7ZmbZA6KAaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379AC606A31C
	for <linux-coco@lists.linux.dev>; Thu, 26 Nov 2026 08:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 379AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795680607; x=1827216607;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qTXS6YzU5JKBNXUMDXqtypPM3AhkfLKmFSkYIsprXLs=;
  b=QBlArL1MnyBkAokI9gYb3vHoNmWKV58ymv1GkUE1DGMaP0lYalmNmNxo
   pYuBiiP3yduLleZn2KsxviHtzHT8TD/krwJikwEfWytI2cGdVD0vnTDv1
   JLHZ5gIq/+ADjVYBW2wvNeQ/ZTzR7poWM8E1ocfwes7VwWJ/9wXMpQuNG
   KnMz2k6getsg9DoYgr1s3LX3+BmCneFAGHCR/8pjVK3obj6S1zYAfY/f8
   dUaYVcQ1VmrzLS6hfGF3FJ9kJ9n8ZNl7hTkndLA7LYor0++VeA/MQTHSl
   Nd5tilciNPpDa3AIX8TG+UntezHWfmn8qlpPdam5j+w1IyY6eUAolf02s
   g==;
X-CSE-ConnectionGUID: Z0at5XjLSRWFQ0SEgs8uaA==
X-CSE-MsgGUID: hKPjpsSzTvW5ZOcnvPpXIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4594625"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4594625"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:10:06 -0800
X-CSE-ConnectionGUID: 710jmm1ATDWyHhU5dZ5mQg==
X-CSE-MsgGUID: vBDbsdyZS7acLKD7JVVXxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="13879634"
Received: from unknown (HELO [10.238.0.68]) ([10.238.0.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:09:57 -0800
Message-ID: <b87c690b-9be1-475a-a63a-eb0d7825d794@intel.com>
Date: Thu, 26 Nov 2026 16:09:53 +0800
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
 "kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "Peng, Chao P"
 <chao.p.peng@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "Verma, Vishal L" <vishal.l.verma@intel.com>, "hpa@zytor.com"
 <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Gao, Chao"
 <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>,
 "aik@amd.com" <aik@amd.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
 <8acf514600526e3a2b0af151b0fa8a7b7a779c81.camel@intel.com>
 <5b6837a8-f8bc-4e7f-8419-01853eecd531@intel.com>
 <244d504ddfefd2c2bfc17da62f71685dc8b4205c.camel@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <244d504ddfefd2c2bfc17da62f71685dc8b4205c.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/26/2026 1:47 AM, Edgecombe, Rick P wrote:
> On Wed, 2026-11-25 at 16:32 +0800, Xiaoyao Li wrote:
>> On 11/25/2026 3:41 AM, Edgecombe, Rick P wrote:
>>> On Tue, 2026-11-24 at 14:01 +0800, Xiaoyao Li wrote:
>>>> 1. The requirement of R8-R15 are reserved to 0 on TDG.DMAR.ACCEPT.
>>>>
>>>>    This is the first leaf in TDCALL/SEAMCALL that explicitly requires some
>>>>    unused  registers to be 0. Without justification of why it must to be
>>>> such,
>>>>    we are going to propose to remove this requirement and it helps drop
>>>> the
>>>>    PATCH 13.
>>>
>>> Ah, ok so the problem is we need to make sure those registers are saved in
>>> the
>>> wrapper, if we will set them to 0 before SEAMCALL. So the seamcall code
>>> doesn't
>>> clobber the callers registers.
>>>
>>> But I tend to think an ABI rejecting reserved input is a general good thing.
>>> Since SEAMCALLs are not fast, I wonder why care about optimizing the
>>> wrappers to
>>> save and restore the minimum. If we just always saved and restored the
>>> general
>>> purpose registers, we wouldn't need so many wrappers. And then when TDX
>>> module
>>> wanted to add new SEAMCALL ABI we wouldn't need to do the whole version
>>> selection thing. Just pass a new bit or whatever. 
>>
>> So we reserve the unused registers as 0. When new SEMACALL ABI is going to be
>> added, just directly extend the reserved registers and allow them to be
>> non-zero.
>>
>> This implies that value 0 becomes the ABI indicator, or value 0 represents the
>> old behavior in the new ABI. However, this simply doesn't work for
>> TDH.VP.INIT,
>> as the version 1 of TDH.VP.INIT extends bit[31:0] of R8 to be the 'X2APIC_ID',
>> where value 0 is a valid value and cannot represent the old behavior.
> 
> True it can't always work, without some reserved bit becoming a selector. In the
> case of seamcalls that is basically the seamcall version thing.
> 
>>
>>> That would have simplified the
>>> TDH.SYS.CONFIG changes for DPAMT and add-ons.
>>
>> It works for TDH.SYS.CONFIG, because
>>
>>   R8[16] = 0           means Static PAMT
>>   R9 = 0 and R10 = 0   means enable no add-on feature
> 
> I'm making some guess work here because I dont actually know the history...
> 
> I assume that since r8 already had some bits in use, TDX could just define new
> bits in the register. 

Per my understanding, the key is old spec explicitly defined bit 63:16 of R8 as
reserved to 0. So DPAMT can extend bit 16 for DPAMT with value 0 meaning the old
behavior, static PAMT. And it can work without increasing the leaf version.

> But then TDX extensions wanted to match the extension bits
> semantics in the register, and so needed a new register. Which then required a
> version selector in case some VMM was passing garbage in the register. Instead
> we could have had one register that had all the extra TDX module features.

yeah. The key is old spec doesn't reserve the R9/R10 to 0.

>>
>> where value 0 means the old behavior.
>>
>>> So I'm thinking that old seamcalls were maybe incorrect and this new way is
>>> correct. Yes we would need a new patch, but what if it was a simplication
>>> patch
>>> that got rid of all the seamcall variants and just always saved/restored?
>>> Consider those premature optimization. Any problems?
>>
>> I agree an always unified saved/restored helper is a good thing if the
>> additional overhead is not a concern.
> 
> I think saving and restoring general purpose registers across a seamcall would
> not be a big overhead given the amount of other work happening during a
> seamcall. Probably small enough that we could not even have to measure it to
> make the case for the patch. Any counter points?

No. It looks doable to me.

IIUC, you want us to set aside the decision of whether to remove the requirement
of "R8-R15 are reserved to 0 on TDG.DMAR.ACCEPT". But to explore the direction
of unifying the SEAMCALL/TDCALL helper to always save and restore the registers.
If the unification is accepted, then whether "R8-R15 are reserved to 0 on
TDG.DMAR.ACCEPT" won't matter much. Is my understand correct?

<snip>

>>>> 4. TDX_PAGE_ALREADY_ACCEPTED is listed as the possible return code for
>>>>    TDG.TDI.MMIO.ACCEPT while the description of TDG.TDI.MMIO.ACCEPT reads:
>>>>
>>>>      If the page is already MMIO_MAPPED, skip the page.
>>>>
>>>>    They conflict with each other and lead to confusion.
>>>
>>> I'd think if the page size is incorrect it should return
>>> TDX_MMIO_ACCEPT_SIZE_MISMATCH. If it is already accepted it should return
>>> TDX_PAGE_ALREADY_ACCEPTED. In the case of mismatched size but already
>>> accepted
>>> page, ideally it would return TDX_PAGE_ALREADY_ACCEPTED, but it would be ok
>>> if
>>> it returns TDX_MMIO_ACCEPT_SIZE_MISMATCH.
>>
>> For private memory accept, if the mapping is not accepted by the guest yet:
>>
>>  - when accept level > mapped level, SIZE_MISMATCH is returned so that guest
>> can
>>    try accepting at a lower level.
>>
>>    TDX_MMIO_ACCEPT_SIZE_MISMATCH is also returned for MMIO in such case. They
>>    are consistent.
>>
>>  - when accept level < mapped level, EPT violation happens so that host can
>>    demote the mapping.
>>
>>    There is no behavior defined for such case. But I think the reasonable
>> option
>>    is also to EPT violation to the host to request the host maps at lower
>> level.
>>    Forcing the guest to a higher level doesn't sound reasonable because the
>>    guest might not want the whole range of 2M MMIO is accessible by the
>> driver.
>>
>> Regarding ALREADY_ACCEPT, we need it for private memory because a successful
>> acceptance of private memory will clear the content to 0. TDX module don't
>> know
>> the intent of the guest, so it makes sense to return an error code to tell
>> guest
>> the page is already accepted without clearing it. If guest wants to clear the
>> page, it can do it itself.
>>
>> But for MMIO, there is no such clearing semantic. Skip on the already-accepted
>> MMIO page and return success seems to have no problem. Besides, private memory
>> accept is operating on a single (huge) page but the MMIO accept is operating
>> on
>> a range. Return ALREADY_ACCEPT would increase the complexity on the output to
>> tell the current status but without any real benefit.
> 
> In the past discussion on private memory accept, someone made the point that re-
> accepting memory should be fixed in the caller because it could be a weakness
> used to attack the guest. If the kernel is confused, the host could zero memory
> for the guest as part of some attack, or the new caller of accept could be
> surprised by un-zeroed memory. This came up when the memory hot replug bug that
> was eventually fixed in qemu partly to avoid allowing survival of re-accepting
> memory in the guest. (and caught by the already accepted error code). We
> discussed if the guest could handle the error by simply re-zeroing the memory
> after a double accept. But then the debate was whether this would cover up bugs.
> 
> I think a similar case could be made for MMIO, which is probably the purpose of
> this error? 

Re-accept of memory has the effect to reset the memory content 0. But re-accept
of MMIO doesn't do any harm, as I see it.

> The guest could get confused about which MMIO address is mapped at a
> particular GPA?

I'm not sure. Guest doesn't care the mapping between MMIO and GPA. The TSM and
secure firmware will help validate that the host VMM has mapped the GPA to the
correct MMIO resource of the corresponding haredware device.  And MMIO cannot be
converted between shared/private back and forth runtime. During the lifetime,
guest kernel only needs to accept the private MMIO once after the device is
locked and accepted.

> There must be some trusting intended as part of the operation or
> why even have the MMIO accept in the guest in the first place.

We have two reasons:
1. the same for the page accept. Accepting the page/MMIO by the guest prevents
host from mapping a new page/MMIO to the GPA without guest's awareness.

2. TDX module will validate that the host maps the correct MMIO resource to the
GPA.

> So I think if we don't need the error, why even need the MMIO accept call at
> all? But we probably want both.

The ALREADY_ACCEPT error code and MMIO accept are two things. We care if the
MMIO is accepted or not, but we don't care how many times the MMIO is accepted.

> And I also don't see a major simplicity benefit to dropping error. What is the
> savings?

It makes the guest code simpler that the guest doesn't need to implement the
skipping itself.
