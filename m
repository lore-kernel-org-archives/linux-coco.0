Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9314657E5
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619884; cv=none; b=RZ2pco49jM9qR9zbggvtfoS9pUxbkDErU8sxFmfhDghixA+IZOcf5Fbfmh27p0IXxnryoKE9539GBBcxdoWQFL9rISPO0D8ZmIQG5dm+3wCJoJNFEWjilcaIgWtfLJQP1Icj6xOpdF6sduBJakaseptKFcfDfiWVOv5Uyb9SQyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619884; c=relaxed/simple;
	bh=xx9oG2xHYM26s/BHC4lUJLQVlvF6d1WWPvhliTgmXmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbZyflAI3TaAPluIjVn/XFcKQo2ucLPZql0IMlrOUnNDttQE+IEG4bTjbKzadu1QW7m1V86sr/7dEgysc/irdSTrjz0MioW3iID0ffbEMoFcvXIjJEtTICrvXpnVAuFN/dB4XcCG1/x9ZeBhdU+VrnD4R3HeO3rHjzpqumzStY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxcTKg7V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxcTKg7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786619880; x=1818155880;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xx9oG2xHYM26s/BHC4lUJLQVlvF6d1WWPvhliTgmXmc=;
  b=dxcTKg7Vm7yzoIiactbpt5yskxuWcUNYwOFtHiyyCWUyr5eYE+JVG0YT
   8ChPHhFPnugab7z62ATzewIbefM9svNalvicjQGD7Nfut10Vt3j69aNhI
   hGRk5bdQQUDpTHjViB4pQLiED9Kkn0msda429hlqYcvNk8CXe6HoU3wR2
   iPDBCciv9D631m8UgCQhj9EoXkbzIiCnO6KWOFQ3jdwJgVLTCMioC7LdU
   UUMJGT8XGpqbGFGbrtvjaGdSwfUD2T1PNfMn5I6Ltd2G15s030UapWiDv
   cqsCBGBCmeVUwxpY2f3E6oTVYvftQxFKAefv60NuPyQ6ymimbl+jVbyBG
   g==;
X-CSE-ConnectionGUID: ycuhVM07S/mkxwzBoZOjgA==
X-CSE-MsgGUID: hj6EEyAPTHCSZTjaDFjN2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98546780"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="98546780"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:17:58 -0700
X-CSE-ConnectionGUID: JkQVRITDRDq8SiS7CGqZ7Q==
X-CSE-MsgGUID: 1Q9nArxnRAy/dMJgcuT2Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="293856816"
Received: from unknown (HELO [10.238.208.98]) ([10.238.208.98])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:17:56 -0700
Message-ID: <1cf47118-2a19-44d5-ab74-b4c7ffa8890c@intel.com>
Date: Thu, 13 Aug 2026 19:17:53 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] KVM: TDX: Enable Bus Lock VM exit
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "kas@kernel.org" <kas@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nik.borisov@suse.com" <nik.borisov@suse.com>
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-5-xiaoyao.li@intel.com>
 <868c0d3c792d789347c767031612977c31cc227f.camel@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <868c0d3c792d789347c767031612977c31cc227f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/13/2026 6:58 AM, Edgecombe, Rick P wrote:
> On Wed, 2026-08-12 at 16:02 +0800, Xiaoyao Li wrote:
>> -	if (unlikely(READ_ONCE(to_kvm_tdx(vcpu->kvm)->wait_for_sept_zap)))
>> +	if (unlikely(READ_ONCE(to_kvm_tdx(vcpu->kvm)->wait_for_sept_zap))) {
>> +		vt->exit_reason.bus_lock_detected = 0;
>>   		return EXIT_FASTPATH_EXIT_HANDLED;
>> +	}
>>   
> 
> This still feels hacky to me. It at least deserves a comment I think. If you
> spin another version.

I spent more time on this today and I find there is an existing issue. 
When the previous Exit Reason is EXIT_REASON_EXTERNAL_INTERRUPT, the 
early return here can go to the path due to the stale exit_reason.

kvm_x86_call(handle_exit_irqoff)(vcpu)
   vmx_handle_exit_irqoff()
     handle_external_interrupt_irqoff()

This makes the host process the external interrupt twice, and maybe more 
times if the wait_for_sept_zap remains longer.

I think we need an separate fix to set

	vt->exit_reasons.full = TDX_INVALID_EXIT_REASON;

so that if some patch is going to consume the stale Exit Reason, it can 
be caught by TDX_INVALID_EXIT_REASON.
