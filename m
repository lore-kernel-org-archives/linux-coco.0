Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC33D9530
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741031; cv=none; b=qMO5bGoGnU0drbhIMeX/sF1IXuhewQMM0UA3cDvT8CZcNjXHJ899+ezidvuwAJvtRj8ZoblngdTV+bOrIWzQd2+05AKQLQ1crCUzoGYEUNK3zMDBZUnvTOPl3Hk+wXgQPF9IJebPcmf+KvekXBXNygktCbA7TG39pJED545WjOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741031; c=relaxed/simple;
	bh=UsuZ9rG6KjwKt/36JY09URhO2qNou1pCebaZKdYzw7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNCyJKIt46luNlcK7eDCXz2FNwZGNVw3ET6mTFUIDhWxKE3cbMhvKLApVw4WSii4j8Q4SIEQ5hmC0BeLnkvLcmW9z1wVeGZ7cH57V8l8f/gQE4ntRraErFSCL/Cb6rX9gcIZH8CFoEclI4rAr8YM4biD3q9IEUbDs2glRDPn+Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpOZusW/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpOZusW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787741028; x=1819277028;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UsuZ9rG6KjwKt/36JY09URhO2qNou1pCebaZKdYzw7A=;
  b=RpOZusW/ntx3g28BIIVWukQ7aTArJ0l0JXye4RaUm/5ltvrBt0ElrLbF
   p6jA4+G7eibP98+gKu1W+5p/CpRwGivdWLsIR1ZdbyyhOq2emEE8orWuy
   VbFsoJQ5MVVKLxhOvJb4oyMUZnZChU8j2pWzQVrJYib1UUHK0WiHfpwsZ
   TL6sl5OSrn98Ce0jm5t6zz2puO+HETwaTUrs8ad9+9n+Xh8Xabn8cjwI7
   SgoGVs7A6vfK3rJP1R8Dmt4Yw65FuBLoWWkLu1IxSEYr3d5bp4rJZ0SQ+
   +NFNgpkrBn3JHylEmVoDDS+CLCIuASPXrOh6bz9GnDsVmdkenurV4o9aV
   Q==;
X-CSE-ConnectionGUID: Q3JpwtmxRn+TXogFOql51Q==
X-CSE-MsgGUID: bMjyyBzYQBG8kEO2wUgiAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88097673"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88097673"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 03:43:45 -0700
X-CSE-ConnectionGUID: Vzb/hLbdQUen8Bov6DGe+Q==
X-CSE-MsgGUID: PzZa5m8cSvO2w9YS+d8D3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="292400339"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.119]) ([10.124.240.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 03:43:43 -0700
Message-ID: <34161383-a382-411b-9278-098dab6587d8@intel.com>
Date: Wed, 26 Aug 2026 18:43:40 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] KVM: VMX: Consolidate the exit handler for VMX and
 TDX
To: Nikolay Borisov <nik.borisov@suse.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-10-xiaoyao.li@intel.com>
 <5426d2f6-3e67-45d3-85d6-d0da67edb486@suse.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <5426d2f6-3e67-45d3-85d6-d0da67edb486@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/26/2026 6:03 PM, Nikolay Borisov wrote:
>> @@ -960,7 +978,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
>>       .vcpu_needs_initialization = 
>> vt_op_tdx_only(vcpu_needs_initialization),
>>       .vcpu_run = vt_op(vcpu_run),
>> -    .handle_exit = vt_op(handle_exit),
>> +    .handle_exit = vt_handle_exit,
> 
> nit: Why isn't this vt_op() for the sake of consistency and introduce 
> needless churn ?

I didn't see how to make vt_op() still work here while dedupping the 
code. Do you have a better idea?



