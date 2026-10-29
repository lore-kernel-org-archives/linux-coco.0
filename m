Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240194;
	b=uW7t+ADNGoc8kqkgK23cRQRVPyS1AccdHDHe3hl3k5c6dhS67uqoUHHv/BQu5uxECbRt
	 CeLN5wkCKwkxSHoio9hs7iHwrncmby0284YLZra0+5yTAQZZDr1RBA6ZwqlYaPMwy6pit
	 UuJzaDwAyvtsc1kyJL1RLVmbERhGtu0k9yY7WE/nhCSKwwXZQbrNq2NM7P2ODO5ZcoPVo
	 Nx4mh1+IY71T2VXIW65zbUsTfJa+r0yIS+ACDGrj0EWT+xu4AkT3zC/HqKSahdh5b4Ipm
	 lfuwDIt8gznlfc0u2kz3VHauSuLsZe23MfmS331/pTNVu8thFPJOgi/HLGsePhgQskg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240194;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oM2EQigq5fCJ+6VWipJXpAr20sR1HXyYc88n4HtiBHM=;
	b=wwRqwcl1D8IfJ7YUo4wBytgD1mVQtx5hWHfUWrmNROdDGHYx0hhtPKbobUqgbAsb2Mpm
	 ck0E+K6RxtsJaaZ1+6OkCYGt/VAV458gHvhMJrYQvpaOeJKk/atmRemnhGT0OJl5j24Bw
	 7KHZQpwmZYNxjOho46fgoRMIsJha6I08nsdHIJhmPtCoSjzf/DE+CY/w5q5hJR5K3m+zO
	 jAk2mFlOz/NyfkXrjm+qi2b8isRLbnkJwRXI7F2Ndtt2g0EcbT1LAIAr3Bsnzmgpfgwf0
	 5J+c6nVWoeajuFF1t/l7G5AttT8bKmukzj5M638t+35UBjJBZyC0PzNMkYaB8kyczhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GoKxR9B6;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF9606A31C
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 02:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GoKxR9B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793240193; x=1824776193;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lmmwd1j9i9IdHPd9z6H1dffhhHl+bDQVtlcPUI8AZYU=;
  b=GoKxR9B6rEPg8qA7FkFnNlqXRxq/n10/1Wu4kucK/7PbYbLtoC7QHQvn
   +nTo0DoGQJoyGhMidQIuyV1BECTrDQKiGLkrSUMkd6Z9MRRyUuhV7J7sJ
   RnngyWDbKYu54KySk4WANfkpz7S2SNZHkqB641TL3+6DIOFBxVBEQ1MBv
   CQk1DO1vW8oc/AqtCvvWj7caoDQUAdTV5XictPnulNfUe6qcZUTCRVBdJ
   GeGM/4qF/zWV0ZFDvE3CUDCN4WjdbaCdSkA8rI1915jNUg5BSY3vhA6FX
   yiXeZCIMF7S5PTok0RYdjz/noF5bQb63CESqHBrvCf+WnpP+/+QB7/Jrg
   Q==;
X-CSE-ConnectionGUID: srv1z8cgRU67q54XWUpBWA==
X-CSE-MsgGUID: O7aF0UoSRGSdgodmwA//AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2069266"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="2069266"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:16:32 -0700
X-CSE-ConnectionGUID: jZGbEqNdRv+56MwFeBXYzA==
X-CSE-MsgGUID: 5/dD5PnDRtm1n1RYGSIipg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5345443"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:15:54 -0700
Message-ID: <c144541f-71de-4791-889c-d7c354eca2af@intel.com>
Date: Thu, 29 Oct 2026 10:15:50 +0800
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
Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
 "Hansen, Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "Gao, Chao" <chao.gao@intel.com>, "Verma, Vishal L"
 <vishal.l.verma@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
 <023f3254-c368-4ef6-89b2-8bbacb42d89d@intel.com>
 <IA3PR11MB913636B33BDBD49DBC87555C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <920718ed-16a5-426e-9407-6ed37181615b@intel.com>
 <IA3PR11MB91368EEFC32F4CBF3F3CD16E92602@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB91368EEFC32F4CBF3F3CD16E92602@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/2026 2:08 PM, Duan, Zhenzhong wrote:
> 
> 
>> -----Original Message-----
>> From: Li, Xiaoyao <xiaoyao.li@intel.com>
>> Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
>> Connect
>>
>> On 10/27/2026 11:28 AM, Duan, Zhenzhong wrote:
>>>>> Abstract the underlying leaf call and pass the shared buffer physical
>>>>> address as a decrypted mapping. Add a runtime page alignment check
>>>>> for the buffer to enforce correct usage.
>>>> This doesn't match the implementation. The code only WARNs instead of
>>>> enforcing
>>>> correct usage.
>>> You mean below code?
>>>
>>> static void tdx_devsec_unlock(struct pci_tsm *tsm)
>>> {
>>>         struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
>>>         struct device_evidence *evidence = tsm->evidence;
>>>
>>>         if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
>>>                 return;
>>>
>>> I think the unlock() callback should be defined with a return value so
>>> userspace could catch the error.
>>
>> No. I meant just the code of tdx_hcall_tdcm()
>>
>> +u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector)
>> +{
>> +	WARN_ON_ONCE(!PAGE_ALIGNED(buf) || !PAGE_ALIGNED(size));
>> +
>> +	return _tdx_hypercall(TDVMCALL_TDCM, devid,
>> cc_mkdec(virt_to_phys(buf)), size,
>> vector);
>> +}
>>
>> it warns on the unaligned buf and size, but the unaligned data are still
>> consumed.
> 
> The caller has guaranteed gpa and size are 4KB aligned. 

So far, no caller yet.

> Meanwhile GHCI spec
> requires passing 4KB aligned gpa and size, that means if we don't, the
> hypercall will return failure. So maybe we can drop it?

yeah. It should be OK to drop the WARN_ON_ONCE().

