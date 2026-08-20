Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC1313E34
	for <linux-coco@lists.linux.dev>; Thu, 20 Aug 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217108; cv=none; b=m2KBhduLiHCNu6u0zf7C+pmf25I2r9N4tDFHWlfl3d4SFkbmH/Z6pRzB1OCuw9Cvbdp31NWXXkRH2tRNX5JFKL7Qd8QLpGZG7N6MaEYdi6soMiAQgIRJhPNcddWs8wasvMmqBSpqg3IB8olOMxk3t/GOTdijjl0rzbpBGRe/5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217108; c=relaxed/simple;
	bh=KCTIFx//rUTdJEXTtDptLJPpgN0bgv5rLUzVZGiRsGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLXITbOPN72vOlbTsDjE4w0EXTh0Gn3tDQ9acOr02S5y/ZGo3+EInobN75X+TZMJ0WadM0BbTJG3wk7RCn9MFCEALa66QNoKFeid2cIoe7tgF5xvJXWxlW8WLolIO0A4FmmDHL/l/lBiZcF5flUGQsPrelKU3vZib4WDuGiC658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+oGncjY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+oGncjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787217106; x=1818753106;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KCTIFx//rUTdJEXTtDptLJPpgN0bgv5rLUzVZGiRsGA=;
  b=U+oGncjYlYQTtIPJSXMe60Sk+ioMFiG2Ci2e/aRXERtbrS9e0eXa6jO+
   59E9qyZatA1PQBpW02EWErAPkMzuGpMbA0uWXMTyiA0+E1MIZbEguSucb
   FrSs21rVmoLtFcjQFdrOi2I0SV8Sm0nOtf1LAd6NzUafcbb3fQ8bnyTVa
   mOgR9aEgORowwaRV0cXYoJUYc3qSV6Jn1YG5K1vJ1CW/56p1Lui4ABpSQ
   WRkYC98iquB4FCvhKhJnEeMKif32ouN8iENXvKgSzEVejFcmx1PNDgm0+
   zVeALKP0AHrjmEubrJUgWNyJENEBodP5+kfIZi6KjOu9BU4/Q7oo+EawW
   w==;
X-CSE-ConnectionGUID: rVjICjoESAWdg4XK+ZW6qw==
X-CSE-MsgGUID: +QPaPuEzQwiQAGGWYBwYKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91555681"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="91555681"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 02:11:45 -0700
X-CSE-ConnectionGUID: pMuk7e+FSyWV64OTDC5f1g==
X-CSE-MsgGUID: +OGPVWHJRaeSaL2n/o4P9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="259762286"
Received: from unknown (HELO [10.238.2.33]) ([10.238.2.33])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 02:11:43 -0700
Message-ID: <bb94d429-2cb6-4f2f-94a6-2aa022dbda9b@linux.intel.com>
Date: Thu, 20 Aug 2026 17:11:41 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] KVM: TDX: Check if there is valid exit infos based
 on vp_enter_ret
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 nik.borisov@suse.com
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-3-xiaoyao.li@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260819094903.3060020-3-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/19/2026 5:48 PM, Xiaoyao Li wrote:
> Check if there is valid exit info based on vp_enter_ret instead of relying
> on the clobbered Exit Reason, in tdx_get_exit_info().
> 
> Current KVM uses "Exit Reason is not equal to the synthesized invalid
> Exit Reason, -1u," as the condition to identify there is a real TD Exit
> and valid exit infos.  However, there is one issue with this approach:
> KVM updates the Exit Reason to the synthesized invalid Exit Reason for
> real EPT MISCONFIG as well.  This is a false positive for real EPT
> MISCONFIG, which has valid exit infos.

Nit:
Is it better to add the info the real EPT MISCONFIG is not expected for
TDX case, so that readers can know the severity of the bug?

> > Though the issue can be addressed by changing the handling for real EPT
> MISCONFIG to not update the Exit Reason to the synthesized one, relying
> on the clobbered Exit Reason itself is brittle.  Instead, check
> vp_enter_ret directly to identify if it is a valid Exit Reason.
> 
> Fixes: da407fe45908 ("KVM: TDX: Handle EPT violation/misconfig exit")
> Cc: stable@vger.kernel.org
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
