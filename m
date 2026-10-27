Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067058;
	b=s7xHie3Fp6IJvpe8k6mq8JdySihjsWScXTnx01s94SFzAvq9ChomLGo0Tx5vuH/s4HhF
	 5TdNJVDlrKfoYvTYpTKcW+ckPGHYAUqkuDHOrxdI06hgl7Te9vJwIFCM4dyo14ENcb+uO
	 ZPXQnsV3sTHfnSjqs2ONmuKHnzEdXbDSq5Qnw9ZLcGKMY89oRK6Ok9mjs63/I+nWFXj8P
	 mOT/EF96iD4DBsv5JQ+fOThxoVZpvV35tVFq4P2vAGy17zuKCPkJ9D9ZoBV+N+eVAsO3B
	 99GAK9WDfNFpZwtt19uCokTOmFA1dfWo9rMTo/xOWFTw7impp5onR6IDUddzrAJDUpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ChV9SXo7RCdpu6OOdHTr97QMfnUxnjY7qFzy89+nyu8=;
	b=egxzA2H+97Atxjm3kbwgvIrF8yp+97t4WiknfqRoUna9O3SIot0Twd8j9Gi2L6kPtoPq
	 OptmLjrXxb8puARklFRvXkM9zMmPPEUgMALzZToe9NIh5cEIX9ZPgIHkBvuEA/oMbiU7x
	 +HxIrhAG7nyp/0EW9CrEriW6q1HiMAdn3zHyqVmXfaywp+cU9PndQw6RBA8peVZ/PJFEI
	 FV2p3IUjicr6r2aq4hRyxFocS9Npyo8OOtxqbh4OZeUKQ/wJiqfhCDCiJ3+84+DSO0Eff
	 Bta6zd23C6R4LQXtkySJoADhe3j4gAziJHtifw2n8ZpDVM55lxqil/XkLBHnp7IXGsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g40TW4lX;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BAB606A31D
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 02:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62BAB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g40TW4lX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793067056; x=1824603056;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CIL7J/YgFCsd7u8uR5ht/g7jTYE9p02wPOlFFiCTM6o=;
  b=g40TW4lXM+94VcNuF1urOHsIjszYUoRuUl4CwYFHIlEgpHJRe3gjJdlD
   SikOt/X6Cz9p/Mta36BzP2ysu7bIJ5N2MahRVJQPuVVjPPknQc7dMn3K1
   zt4pap6bm5wEcCNB6mrGdCIUdPyJRMGAJD2VdVQFb8Y8Betl4fDAfB3r/
   QuOpGv3bKJDCG3FdpayDNb4zvpwdEP6rwCYj8uaPN8nw3zLFjyTKcu0M+
   90v7R+g6z9pqwXrJQBceafIm0dVp41iUePXJpfCD8mIlzsT1WYg1DPhCT
   oNG4os0tmv+hVR85W+QaWX9hbezKrf1mv8RXwJdj0by3ddRF97yFt9NfV
   A==;
X-CSE-ConnectionGUID: mjQ4fQSYTtaahMK2m+iRCg==
X-CSE-MsgGUID: 1/j3a4l7SSmFlABa71omvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1666866"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1666866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:10:55 -0700
X-CSE-ConnectionGUID: PInetbcZTamdUGrtM+PoGQ==
X-CSE-MsgGUID: UoJkD8aHTWmo7cCSoybHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4433290"
Received: from unknown (HELO [10.238.2.205]) ([10.238.2.205])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:10:52 -0700
Message-ID: <a61f5570-6652-4658-92a8-161f0cf91aca@linux.intel.com>
Date: Tue, 27 Oct 2026 10:10:50 +0800
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
Subject: Re: [PATCH v2 2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate
 when filling CPUID entries
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, Changyuan Lyu <changyuanl@google.com>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261022210134.612848-1-seanjc@google.com>
 <20261022210134.612848-3-seanjc@google.com>
 <4e1d5d94-9956-4cc1-af5f-1311461ab233@linux.intel.com>
 <atwR78qCo3qeUXLH@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
Content-Language: en-US
In-Reply-To: <atwR78qCo3qeUXLH@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/2026 10:03 AM, Sean Christopherson wrote:
> On Fri, Oct 23, 2026, Binbin Wu wrote:
>> On 10/23/2026 5:01 AM, Sean Christopherson wrote:
>>> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
>>> index 271c2f94b8dd..37d088f6f7a8 100644
>>> --- a/arch/x86/kvm/vmx/tdx.c
>>> +++ b/arch/x86/kvm/vmx/tdx.c
>>> @@ -2,6 +2,7 @@
>>>  #include <linux/cleanup.h>
>>>  #include <linux/cpu.h>
>>>  #include <asm/cpufeature.h>
>>> +#include <asm/cpuid/api.h>
>>>  #include <asm/fpu/xcr.h>
>>>  #include <linux/misc_cgroup.h>
>>>  #include <linux/mmu_context.h>
>>> @@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
>>>  
>>>  	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
>>>  	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
>>> +	entry->flags = 0;
>>>  	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
>>>  	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
>>>  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
>>>  	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
>>>  
>>> -	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
>>> +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
>>> +		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
>>> +
>>> +	/*
>>> +	 * Explicitly zero the index when it's not significant, even though it
>>> +	 * _should_ be meaningless.  Userspace relies on the index being zero
>>> +	 * (the ABI was inherited from KVM_GET_SUPPORTED_CPUID).
>>> +	 */
>>> +	if (cpuid_function_is_indexed(entry->function))
>>
>> If the information about whether the entry is indexed mismatched, i.e. the
>> warning above fired, should we use the information from the TDX module as the
>> standard?
> 
> IMO, no.  All of this information is available at module load.  If we want to
> harden KVM (and we probably should), then we should apply these sanity checks
> (or equivalents) during tdx_hardware_setup() and disable TDX if any of them fail.

OK.

In practice, I don't think it is a problem unless cpuid_function_is_indexed() is
missing an indexed leaf that KVM cares about.  If it isn't missing one, unknown
CPUID leafs will still be rejected later by the allowlist-based TDX CPUID
validation.

There is also a false-positive risk: a new TDX module could report an indexed
leaf that KVM doesn't know about. One way to avoid that is for KVM to fail TDX
module initialization only when there is a mismatch *and* the leaf is listed in
reverse_cpuid[]. I think that can be handled separately.

I'll rebase my TDX CPUID validation patch series on top of this series.

> 
> Anything else is a hope and a prayer.


