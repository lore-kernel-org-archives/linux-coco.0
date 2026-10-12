Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27537269A
	for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 05:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782089; cv=none; b=Z5kof0NaM784zWbnkdxqkQ3k0CrGFAy3Xh7aBoxcTzV0j153pK99ogGGBUlwvB9PkCFrfNrWqCRsnqV0aeTCSzPI7iCRB7mKhhQFPJUCDPODQbxc7X+mhExvlHhcvy+SA6CyrDy/MUDF3dk5fsP2u76liTmzNQQgtjn/gc++AjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782089; c=relaxed/simple;
	bh=71R9SW8hqZ8Ya6Z5p9aKH2+aKZc5yLq0MHGcR0Rcx1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCt63l3wzLl18RAAy3xnul0+iDmCxi8sTD159p+xFf1Sk7A+mHhnVCibrR+lpkEIqMSH3ke2pbslEeb9UzUll2ILkcYDBecgUTl5J0deACrica8+Kg1PKqXfYOchgXb4eLCyS2qd4F1tzPVr9GHFrdETzegMjL36QSGNwd6USJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4OE+H3S; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4OE+H3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791782088; x=1823318088;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=71R9SW8hqZ8Ya6Z5p9aKH2+aKZc5yLq0MHGcR0Rcx1g=;
  b=A4OE+H3Ss1rZiwDlfKBRbMNqKfP+mlO6kzw4EOzqEJZjFWKcEbCBc6Yz
   HNNPOHuPwIh4jAPISssfgYWE93qS0iy+PXOEtXezS3go/Epf5PQ65OqXY
   DZ8xHsoBNko4PVMco6PkIvX5rKPHW1hc4k9oNYpJVtrHx7BI2xqO8UuBv
   hn+C8szi1KTlbN2eBb2KRJPaFnpmfS/uWetvLkhpEDV5VLLyJ5Gf2Mfhc
   H91WlYUKBDDuUEZ+fj4Dwfhc+9ixiV9IF58rZOojVSHZ7q0jKvlaM8K10
   wCqv2DryOVej2juPPrFakL4f2E52I/oSf64Hswb0clmyLIxiqxAoHZUji
   w==;
X-CSE-ConnectionGUID: qWS+XNk7TmivnR6/nipUQA==
X-CSE-MsgGUID: Wdl3+TDgRU2r/A9Q4Wj19w==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="473925"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="473925"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 22:14:47 -0700
X-CSE-ConnectionGUID: xAWrWkcbTWKejez9zAMjPw==
X-CSE-MsgGUID: stcO3pRjRjO20dFnz3fxQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="737318"
Received: from unknown (HELO [10.238.3.65]) ([10.238.3.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 22:14:42 -0700
Message-ID: <011d148a-4646-4703-b934-aa7ce573070e@intel.com>
Date: Mon, 12 Oct 2026 13:14:40 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 18/23] KVM: selftests: Add helpers to init TDX memory
 and finalize VM
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>,
 Ackerley Tng <ackerleytng@google.com>, Binbin Wu
 <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>,
 Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>,
 Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>,
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-18-7c62a5d8a992@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20261001-tdx-selftests-v15-18-7c62a5d8a992@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/2026 3:37 AM, Lisa Wang wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> TDX protected memory needs to be measured and encrypted before it can be
> used by the guest. Traverse the VM's memory regions and initialize all
> the protected ranges by calling KVM_TDX_INIT_MEM_REGION.
> 
> Once all the memory is initialized, the VM can be finalized by calling
> KVM_TDX_FINALIZE_VM.
> 
> Co-developed-by: Erdem Aktas <erdemaktas@google.com>
> Signed-off-by: Erdem Aktas <erdemaktas@google.com>
> Co-developed-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Co-developed-by: Lisa Wang <wyihan@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
