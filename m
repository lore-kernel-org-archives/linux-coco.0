Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680912;
	b=tsS3MOdph7CVlI16Vr/TWNdE2qTbJ+In6D/7eJdfUO5VZ3F9ukizaRmt69z8aRcsq37C
	 yjobZpD9J1qyXmm9ly3G49mI1SERZLBY1hu830hT2QbgimeSv9pG5vyatk5fBa7wUgokv
	 mJv6tbMcjlGZaVbkf+2QILCpnOw0rJH/aeTsg6tgSYVNJ3XFJv+sHR7V08Dgi3QOcf7Bd
	 7dGCO+qSXnW09LxwGQaZkif0Rx1voqBKtTSlJWe34uLpMhXVaU/5OiXQsdmXH5jCL9aeE
	 O1NM/l7BlWY7GN5ZorhMGsy9AMqd3copwE8e51BAlHnA9TyUzCvrSULDa5kli4bmykg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680912;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BswtccZ9oLTvd3i09TipMATpHp0Vu8UkQ5BGIGzbvC0=;
	b=qc6YOrSGPEc4WN+PTe9rUVFabo3QUJDpO7reqi5/Hi5h9eND4Xex/dGRNaTsrnFXZaMj
	 yAqtMdZK8lOLFnhTdDw/niMkFGcv+HXSLsuoygJ51KhdW46D+R74IQ2Wsm1jEAxvrrmts
	 UKtJ5fUymMWW+zozqJnlVmE+xIJAjmtZcVgrdzdXgK+4+SRRxYHFB8ItQe0Z021acLfrW
	 JG22D50JWraUSL3s578NKTeT4MOTxzjhMjNp5PZ734F610kScJYoaQYTK4WBy0pCR8xv0
	 cp9WFfxwvmcRC/HOuPqrUvOgK5L5M5IqH2ztw+Uk0v+z7AsyMo77X+r4QHq8ip1PPHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQGAswUV;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E1B606A326
	for <linux-coco@lists.linux.dev>; Thu, 26 Nov 2026 08:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E1B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQGAswUV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795680912; x=1827216912;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sqiuoGxJl9/CrJL1jDUP/bBMZakYFywfB1gHkPnBSXo=;
  b=DQGAswUVDsoyQ5/zGksEPdAPW1eNr8iFW4oFzMdt3CCF+9tLI5AUQeH/
   JBAmanOuldH54B6yBkJ4zATOF1LtQg38hF9VYmCkrqietVOs5YhhykkOn
   a95AQzECxcCJfzX/vmjTslM0wviyPSHhN3MynmSE8b6DQVSEekguGBNs7
   AwG4IptNfoJt8yBGBBbUUeuWbVLvr+rvbPDEpDMzAl281ViDE7G4UGTMc
   F6sEBn1A1lg0LBEocrdf69VMjZfDJVXoEX2vED4DBsCgzMq2nPaK3RElS
   xR1jfuVMv/v5q4V6AYn4I7/GmnYcWZ4gRkqUZtTkbZZtPvaDVe4SQitho
   A==;
X-CSE-ConnectionGUID: xkfEw57dQySxgTt9nQRN7w==
X-CSE-MsgGUID: Rr5giBSdQFyAXWICSW1Kzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4595094"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4595094"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:15:11 -0800
X-CSE-ConnectionGUID: 4S4EEdRoS4mgomc/1DiNOg==
X-CSE-MsgGUID: QlQBy2IiTNSvcnkV2jBs8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="13880971"
Received: from unknown (HELO [10.238.0.68]) ([10.238.0.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:15:05 -0800
Message-ID: <f8102f9d-118a-4255-a332-11aabd47b7fe@intel.com>
Date: Thu, 26 Nov 2026 16:15:03 +0800
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
 <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
 <IA3PR11MB9136465096B2B1D5152C1E1C92422@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB9136465096B2B1D5152C1E1C92422@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/2026 11:11 AM, Duan, Zhenzhong wrote:
>> 3. TDG.TDI.MMIO.ACCEPT requires TDI to be in the ASSIGNED/ACCEPTED/RUN
>> state.
>>   After TDI is bound by host via TDH.TDI.BIND, the state is BOUND. It
>> requires
>>   guest to call TDG.TDI.RD read the TDI_GET_BIND_SESSION_ID, which changes
>> TDI
>>   from BOUND state to ASSIGNED.
>>
>>   This is a hard dependency for TDG.TDI.MMIO.ACCEPT not to fail and it's
>> not
>>   mentioned in patch 12 where the call to read TDI_GET_BIND_SESSION_ID is
>>   added.
>>
>>   The SESSION_ID is used to ensure the host doesn't bind a new TDI after
>>   guest attests the TDI without guest's awareness because the SESSION_ID
>> is
>>   verified in the following TDG.TDI.START. And making the read of
>>   TDI_GET_BIND_SESSION_ID to change the state machine of TDI from BOUND to
>>   ASSIGNED, make it mandatory for the implementation.
>>
>>   But it doesn't make sense to assign additional semantic to a metadata
>> reading
>>   behavior in a specific phase. Instead, we want to propose introducing a
>> new
>>   dedicated TDG call, e.g., TDG.TDI.LOCK, which needs to be called by the
>> guest
>>   to lock the TDI after it's bound by the host, and it returns
>>   TDI_GET_BIND_SESSION_ID on success.
> What TDG.TDI.LOCK locks? 
> Or is it essentially a renaming of TDG.TDI.RD(TDI_GET_BIND_SESSION_ID)
> to make the state transition(BOUND -> ASSIGNED) explicit?

It's not a rename of TDG.TDI.RD(TDI_GET_BIND_SESSION_ID), but a replacement of
the semantic of transitioning the TDI from BOUND to ASSIGNED.

TDG.TDI.RD(TDI_GET_BIND_SESSION_ID) is still supported, and can be called
anytime. When TDI has valid BIND_SESSION_ID, it returns the session ID.
Otherewise return error.

> Clarifying this will help determine whether "LOCK" or something like
> "ACCEPT_BIND" / "ASSIGN" better reflects the underlying operation.

Yeah. It looks "LOCK" doesn't sound good. Because guest cannot lock anything,
and the host can still unbind the current TDI and bind a new one.

TDG.TDI.ACCEPT_BIND or just TDG.TDI.ACCEPT?
