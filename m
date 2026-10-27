Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080234;
	b=SQw/W56EUWgsi1FQ3bJmKS1vCezUGUz5uPkE0zG3SsS8z9ZDj3xqxwxKZyoTXb/KOkQJ
	 YCPq1Xz92x8z+8G8C/Ubbe6U6LJ/+Cu8SlkKMOykrienOKorBqUgxptwjUd62iI87pyCF
	 d3hSFY2AaS5yNtZU+7wje1BJhCfpQeCyiOY0hfGrlL8f5L1cgemLRhkeXZsE9BDEXgnGX
	 1zMjeXhiJK4t0gNWDGImIdHG4KG2vb1nn49UyMr7CxrgUrUhyNCuviAv2UTVGzltD1vaX
	 QP9Y3AFk6jVHKPvJoTelM29oc8RzrLL3IGoOo+vZbocZ4l4SK9KNp29Uaz3zj4rQG7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080234;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=FiRH3Muu0B1Y9IwpXTlmxS6fqN25x5lO7sXHc5scxXM=;
	b=Umb2DpRHiQn8BtCCkbeKpeRBgez8gIAFZ9qxvZY3FjtkniQc084js0H0HU0Mfb7+IpTD
	 ke8qCvucrV5RW6bMtoBw4o3pz+3/xxDehinotLRGacmK3UXY3RbN3LiPkRbTJhCUknyQQ
	 bI6GL+gP2ghS/szTFGToFp+qEw1RKtHsM1nd9+2f4U0jLnnIYJYKsNVSOvHqtoTIRjRB8
	 i7yJLQvXPp8GsRnySxMtjpwtZ+DS1RiTbmCLtPl3wN0ZY+BNLCZZBcDehy9YUHHBCsFMA
	 WDHEFmRHpbUdb2KnqwleynayE3j7/H5KrECbqBRDTJZoI9PAcSwtTJCdfW/c5A4j3UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L2txWquY;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD33606A31A
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 05:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L2txWquY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793080233; x=1824616233;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SETQHDzPt1GmiSTU9RrxkHVE+UqvzxnrBAdylx1br/c=;
  b=L2txWquYjA5QIxFZM6kY8J1ehkeKZF5jEwtUHIw5AAxhs+wdqF6tw8ta
   H+osljR1YfVN9RlQRrnUWgcEtAwEWfqHYB6vViU4dODyFQLYnmdg5y395
   E7gb5nLfIwDJ2JwekqzRhgghk6zwWitk4qEimTNBI9wb5cwdB9wlaWO+l
   ATi2aCaXlzysQ12nJkwzfsyNm+AyVGnCBDu5TUfgPuEZdIfVmXf0j90/Z
   CyNd5eQYkpBDT0L2G/ttF7pwF1/TtOpUIqULwL0Gn5cY736Pk2TPitVnh
   jooMBMutqutOZ25vaZYOuaiW+avJqKD1YFoyr5ko0E1fQJfqoor43wO0w
   Q==;
X-CSE-ConnectionGUID: NF3HkSKcT3GmNNwzpSj8/Q==
X-CSE-MsgGUID: 8Ve82isSS8CJ+Cct8w+R7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1662500"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1662500"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:50:33 -0700
X-CSE-ConnectionGUID: /+pnNvTcSsaJGOR5nZ3ZkQ==
X-CSE-MsgGUID: FSn+z2DXRvmlhnmMgtaC6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6207789"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:49:41 -0700
Message-ID: <920718ed-16a5-426e-9407-6ed37181615b@intel.com>
Date: Tue, 27 Oct 2026 13:49:38 +0800
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
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB913636B33BDBD49DBC87555C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/2026 11:28 AM, Duan, Zhenzhong wrote:
>>> Abstract the underlying leaf call and pass the shared buffer physical
>>> address as a decrypted mapping. Add a runtime page alignment check
>>> for the buffer to enforce correct usage.
>> This doesn't match the implementation. The code only WARNs instead of
>> enforcing
>> correct usage.
> You mean below code?
> 
> static void tdx_devsec_unlock(struct pci_tsm *tsm)
> {
>         struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
>         struct device_evidence *evidence = tsm->evidence;
> 
>         if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
>                 return;
> 
> I think the unlock() callback should be defined with a return value so
> userspace could catch the error.

No. I meant just the code of tdx_hcall_tdcm()

+u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector)
+{
+	WARN_ON_ONCE(!PAGE_ALIGNED(buf) || !PAGE_ALIGNED(size));
+
+	return _tdx_hypercall(TDVMCALL_TDCM, devid, cc_mkdec(virt_to_phys(buf)), size,
vector);
+}

it warns on the unaligned buf and size, but the unaligned data are still consumed.
