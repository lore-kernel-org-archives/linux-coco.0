Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087462;
	b=dlbM+7G1F2vhknyYrP1Pcihl7Q0mrrdiAXRy1Cpr6nqRChoy63wo18t0d6tqICH6+e7e
	 ZMfb8obRBTrvP88n3KL2XhEXXE3bPjqM5gKmSYlkvmEt2xBQwqTmQ0WymsxYHaud2K2XP
	 +EJUXezKcjm0L+G/Lp5hMcota78OH5AamR8BdFOpVzaSoNHXb69WKLXKYwN/dSolGgMMg
	 hX0V06j5/ZqsAi5H882ztMV4exjeA3nNbfiP5LPrOCJwUk+tz8OoZ55OmOeXYEyGHAfa7
	 qktDAAcEK4yVYFWdzID6QiVTldJeqc23/YrWgiQWxzG9LZLAUVoQTR6fAWUqK4wFWjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087462;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=C0IL/gZULmmunVCkG+wwatC97Ea87uojf7XYGjE5oR0=;
	b=pNgEvno30h+R9vvkgaoeRJseUv0TVxCB1TvPNEk4gbKMYPhJMLVAfXtxZ5HBlwwixtMw
	 0I7N5zW1f1bgVfme8BA3uxyeL/qax87CUR5kS6DQX3FKo8ko31UuLMqxm/zaCx0xIzmgb
	 mTThwoK7w91YKbBZTeqpOQl5klLQw9WsI+NVYPJPmmEGIA6WtX0lxHtsRfIky28cyyGc0
	 0aCrO8agXz8iV0sLprFF4VvIXKZyW2Jhk4pX39bMEgovKcf4TeGC8P5tx/KJy3vioSp5o
	 TmWhqy/ZL5wAm3DVz9dHtcCA2Tvpdvk6C6JRBLfoIPqIheTvGNKl+otgTuDxOy9BYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U6Ku37ox;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9487B606A32C
	for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 11:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9487B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U6Ku37ox
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795087462; x=1826623462;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PjpxK6WrqEEBYL6Z8XZgE+0SFDlXh2SA57IY/mgRaC8=;
  b=U6Ku37ox9y9NA2QEY+C1RRqHsfF9HEfn44RwAfn/ylbyRi8hZ3RXULEf
   y4EROgKftQQsrdaixPNo0qT4+cW2plg4TZTMYtOiBjQgUjlXlxTH+IuCW
   jPPFZd6UtRQ9spd27FIwX8UMSopsj3uxEUvFhhIJc+JEgaABjiuUZygw9
   nGOxgBUshGwsrIbqb1MgGraaDnPkSLTeYYI1QWsPdOiJOlCAQzV3fFlTJ
   x+zVeZN+5WVwE2pRrinw+iz1OgK1NEJT/kpIHKYrJv2Dn6KBdD2txwJ9G
   /2Bixzh4D3tqwgvP2NHno6tNPSlqZekuN88kZR0PF4dm6n81IUX6cFitn
   g==;
X-CSE-ConnectionGUID: Fza/ye6eSe2B1fxkh0jbew==
X-CSE-MsgGUID: RpJdiBQbSHuX65UhZfElrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="4011773"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="4011773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:24:22 -0800
X-CSE-ConnectionGUID: kPUesuG2TKKl3coXlgrgeA==
X-CSE-MsgGUID: zkmILSsIQKWO8IE5T8qJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10273791"
Received: from unknown (HELO [10.238.0.68]) ([10.238.0.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:24:16 -0800
Message-ID: <eb3a3d57-fd98-4167-b6fb-27025e737097@intel.com>
Date: Thu, 19 Nov 2026 19:24:13 +0800
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
Subject: Re: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
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
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
 <IA3PR11MB9136CAD09013FD9A79EB06ED926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a3ee7e7be28462bff75383f0ca3af1cb8275d125.camel@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <a3ee7e7be28462bff75383f0ca3af1cb8275d125.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/2026 6:38 AM, Edgecombe, Rick P wrote:
> On Thu, 2026-10-29 at 09:56 +0000, Duan, Zhenzhong wrote:
>> After thinking about this further, a second .run() attempt cannot recover
>> from partial MMIO acceptance with the current implementation. It starts
>> accepting ranges from the beginning, so it will encounter a re-acceptance
>> error on the first range successfully accepted by the previous attempt,
>> before reaching the range that originally failed.
> 
> How does MMIO acceptance fail? Whose fault is it?

According to the Completion Status Codes defined for TDG.TDI.MMIO.ACCEPT in TDX
Connect ABI spec, it can fail due to various reason. I think most of them are
the fault of the host, and a few are guest fault.

The most interesting one is the TDX_OPERAND_BUSY due to contention on some
locks. E.g., when host is operating on the TDI, it fails to acquire the TDIMT lock.

For most of the lock contention, we can simply return error to userspace. The
interesting one is the contention on the GPA. If host is setting up the sept
mapping for the same gpa, do we want to retry in the guest kernel? or exit to
userspace with -EAGAIN to tell the .run() can be invoked again? or -EBUSY/other
error code?

>>
>> When .run() fails, the device is not accepted for driver attachment, so
>> there should be no driver MMIO accesses. Therefore, removing the
>> guest-side MMIO resource entries and freeing the descriptors in
>> tdx_tdi_mmio_teardown() should be safe. However, this cleanup does not
>> undo the MMIO acceptance already performed by the TDX module.
>>
>> There is no TDG.MMIO.UNACCEPT ABI to roll back those successful
>> acceptances. Recovery therefore requires unlocking the device through
>> the UNBIND hypercall, which asks the host to tear down the associated
>> MMIO mappings, before locking and accepting the device again.

The UNBIND is invoked by userspace. What if userspace doesn't do it? Do we need
to harden it that driver attachment will always fail when the TDI is locked but
not accepted?



