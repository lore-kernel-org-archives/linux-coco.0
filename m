Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240850;
	b=cDNpFkbRG9hTcxMaMn9WD6oyrFC5/chxktSEya8IPeZng44ag0IywhXcJURHvtDeM+0l
	 5E2R4adBnl0y3bfzZ5c4QQhxQa8jLu2yvVLh64crYrwFC2wwvShKducLFkTShRML8TauZ
	 UThepnqChtrkubFxwWPJOmtJ64rIs62J6+cHKyikZ8Mwh8f/UkNnASKZOyUecK9BO0VQt
	 6PbGAO3991CDno76CtQ7Zl8tRzjBGNJN6OreNTJ1EQND90Ht7UvwvpidcJc0dc2NvlXsI
	 HvGSQcHehW+vrsEw+ztFk7LEo1ZbhcM4DZg+Lq4PYhohiWfzih4LQq16o+P3Yvc47gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240850;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aPN7rHi2JSNnojmbh1c0v/IIUsI6d/HGjcbV11KgL/s=;
	b=xxJ8qTR33I+fpFwzPabqyaWReT3JAkEtmHjlAntJvS37McJH6ciAn1C7TvT2zHXU/W6w
	 6clKnWZiFIO+sULztWhD7mtzjHH2SsTuHQ7hRXWMTradwRvavbBG3UORXCaghM3JL6uNU
	 DpZRMmpySKPm3jf5fDQyKc8PvE/rdbDjshihvdepkarH+3iSSy3xDV/SpCcA4X1BE7ov9
	 05qvIjIlBWKcgQTN1tiALuPXuZzBtKx5/qo7Ho5hXNYzQXw0UEqQN4/5vOPGf+QBlJwlp
	 EeyEgkBKbxnJ6dsGCQ7/0C21VI//jbmNfPTteKChQ9jBPl5W6fKKrP/wD+zj/Kwj/Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Zc/n6KW2";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9A606A31A
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 02:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zc/n6KW2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793240849; x=1824776849;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aPN7rHi2JSNnojmbh1c0v/IIUsI6d/HGjcbV11KgL/s=;
  b=Zc/n6KW2p64r7uMnf/t40Vmh4ODzL5YLT3oc+6AitEBxb1w4u4eRa+k2
   9m3aA29MCKtpZNEyVYTnvwS0DUFBqqJGtpyPBM3ItQslCpNYV9iZE1kbi
   pm/jIqhtcB+TnOTqFr9/r6zSX6MhDcFElpUkVWoEybPtOH++Qdjs/EQ4/
   Qr7yZkR8eJl7Wqhr2S8U3ar2/tjxpn/YHSKXN9yVCtYaQ4zixnVtvRBdf
   AUQ9y4Y7mngoOIDfqWvDETAs6FbnygcIwP/a17mlCCDHDnEysk5Zd7oJF
   fYq7jN0w/MZckcBWUPp4MiEGD0+wA4ExppFh84ScQS3lnVQL8hNe+SC4U
   A==;
X-CSE-ConnectionGUID: dx4Rti6RR6SVBhlf2ehLtA==
X-CSE-MsgGUID: 7yD+QywiRYmwx8A5qcM5Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1878944"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1878944"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:27:29 -0700
X-CSE-ConnectionGUID: TDK7L9vMTVqxGySJaQlHag==
X-CSE-MsgGUID: 0NH4kyqGSa6hBeuTTDnA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4877762"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:27:20 -0700
Message-ID: <b65632e0-4fa7-4112-8630-75a118318684@intel.com>
Date: Thu, 29 Oct 2026 10:27:16 +0800
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
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <1b28a8e8-7836-463f-a2a5-129a1dba5b12@intel.com>
 <IA3PR11MB9136287858A6C3B47C09AEF992602@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB9136287858A6C3B47C09AEF992602@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/2026 4:32 PM, Duan, Zhenzhong wrote:
>> -----Original Message-----
>> From: Li, Xiaoyao <xiaoyao.li@intel.com>
>> Subject: Re: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
>> support check
>>
>> On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
>>> Implement internal helper wrappers tdx_tdcm_alloc(), tdx_tdcm_run(),
>>> and tdx_tdcm_free() to manage execution context lifecycle for TDX Connect
>>> TEE-IO Device Control and Management (TDCM) commands.
>>>
>>> Use these infrastructures to deploy all TDCM commands to orchestrate
>>> trusted device management, beginning with the first command,
>>> TDCM_OP_CHECK_TEEIO_SUPP, executed during the secure device locking
>>> sequence.
>> I think it needs to be split into 2 patches:
>> - implement tdx_tdcm_* and justify why poll mode in chosen instread of
>> notification.
>>
>> - Add TDCM_OP_CHECK_TEEIO_SUPP check to tdx_devsec_lock(). We need explain
>> what
>> it does, why we need it, and why it needs to be in tdx_devsec_lock() as the
>> first step.
> Hmm, that may break build because we define some static functions without user.

__maybe_unused can help.
