Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978016;
	b=TzmnFCs92mFBvbMMQQWf3O1lErxQ29YG1RxCSxEN+1+IagrxPWmmeeV59PBzMYW1ylH9
	 5EP8dp3vzP6jz6kRXFrgLGgnltX5ldSRNln9fv13RyaR6LU9rJ3d1TGt//cri4oSe6dYQ
	 MRGFr3MevsmLl7xrBn2lEjpacFJQSVref419uuKvefMr8D8H7Bf8RHEcmRaLHmHxG+WjX
	 kuAmwjf4cWAEorUzYgf6UV7cPA1dVXI0wXp+l/SBWn0wQ3h4hLt4ZchU3Y0sYVNE2kcoh
	 5bpCEs4p5ChKVFVUlW3lWGtnp34tKN1sy57uRg+4ysZaFCCmIGe1ogg4saIpz+0Qbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978016;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2Cx0XJsrcVFzqACqroow363I+7pJy41urKfd8Cz0ySs=;
	b=Ehcxc91ETr02NgxbJz2kdEIpdvOvdlULA5kmkg6shwX3VToI8bTSihnGhbI5upkpYwWe
	 2hP2G8vKZJhW0d4nkkL4DdAwgAsmQV03gM1fbmQBjFoZdihxACIxM1MJhiWb1SJJqnx1p
	 o0Lk9jYhQb6XWF8EDxi9QtUY1EW3CuPlKdq2J5NL4/ZxhOvAFvakVPcnm8zoCXHNRlw8x
	 wgUWYBASVC5F4Z+xHWDecJPSre07OH1gOficg3+AUsbqJmnB2/XZw8mhu4HWX+GsBELwJ
	 rBHtDXWK0wAFj6DqUy5UYxR6m/Cr/7lFGEncIVJetOsOJgt1yArb98uQLqKTgzRYmdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hkrGo2Uf;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2E606A31B
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 01:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E2E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hkrGo2Uf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792978014; x=1824514014;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vfjVCU2/1sWeQ6jWe3b4X1c4gTNuIcZ/JMh+RyGfX98=;
  b=hkrGo2Uf+/bXrafRlhRcmk6zIP5M13bWsudEMlOcXaxGX3e/1b4EhywV
   s9jpTUCZe8zOLXc8/Bnd8/WEy23WAOpw/BUymxqReQ/usDKmBLmf00iL7
   pUDmsU/VaBMFed04lTLfdmw8hIsSpqYIpgdjFh7UPvS6BHi8I4n3MR1IY
   kAPhBm21GAON5gToJsHj79Ro+iZPhbTgK8Dd9WQ1iImZaO/019ef49X1P
   TbE7MU9gm/P26z4+ZQ+nDpiBSJr1/tIoFtEJaAKy9lWEkToO7SeUo2P9m
   rq2xQ72tagHz6MvweFIbexeYn3TnLttRknDnXpGr6xWhSCKxJ9oaaJwxG
   Q==;
X-CSE-ConnectionGUID: hTVCNRemSSGSfKCZMIYBIw==
X-CSE-MsgGUID: MpRUjXvTSyuuGmiNdPLftA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1667481"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1667481"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:26:54 -0700
X-CSE-ConnectionGUID: pZzCRkJsSSKRd85IJZg0Ig==
X-CSE-MsgGUID: Av7Q4Zo1QUidsSdx7k04NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4077168"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:26:48 -0700
Message-ID: <d4183670-c640-47b5-a70a-659861b0a21d@intel.com>
Date: Mon, 26 Oct 2026 09:26:44 +0800
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
Subject: Re: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
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
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <686a2511-1d4b-47cc-abdb-951693cf1771@suse.com>
 <IA3PR11MB9136E76982E260079081A59F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB9136E76982E260079081A59F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/2026 2:11 PM, Duan, Zhenzhong wrote:
>> This is used to allow TD guest TEE-IO Device Control and Management
>> (TDCM) module to
>> manage the device. The TDCM leaf functions are defined in the following
>> table
>>
>> Is TDCM module implemented via the NRX facility ?  The TDX Connect spec
>> never mentions the TDCM module. A bit more details are required in order
>> to better understand why you've implemented this the way you have.
> "TDCM module" is GHCI terminology. In this series, the guest-side
> implementation is in the TDX TSM driver; it is not an NRX module.

I think the TDX guest TSM driver is just the implementation of the "TDCM module"
called in GHCI, right?
