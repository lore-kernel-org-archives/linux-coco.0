Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743083;
	b=35qB64tM/oqLF8Xlyr4rekBzgj0t187isB7t7wqWD5gW19IKW25g6L4+h3IbIFsU/QgV
	 w1T3yTIsIUDBux+rdTNNIP5EHhZjynct5Nnu1heydPQPU/XK6j1TjvxBU6J6a6HJAn/j4
	 csv8iGC9l80gJZ9vapLn6tkeUkjvCWHWm61cKEWZLkrsyuYiFkYejHnSwts8XTDHMuJSx
	 JgRma3PJD+eKwBJBbIAOzuF8gPwsM20eW1h3K3geZmY/zm+h9jovwCF3G5jRMwAX3a5rg
	 bmie2wPvep7TjvvEenhUrIUEIoydn9jkS/E7AQio1YbN+D1zG5mZgyNsZUnvdNSv9PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dksq6JzYz/7e2KyIjNlZAHkwElyy14O+kTiWQeWvxMk=;
	b=duJ6vHNh9wFcGvxLKLQ2bXfh6WCgo3kzKWga2OBJN+gXB0edEVHBvT7UqWOfqoSojbNN
	 Bsc+yeXOUN0zltyAN0d6yKTuRHN6JBPbPufp9Xx6gB4U2K0Y2rbFsPG4rjbr0JU5AhuUl
	 Lnoi4QATiIvRZlzwdaeQA/CDPU2j6M0KaO6KGf5aGev0umj5sugv+YmY5b41Xwq0haDsb
	 vvOzGEMCik8F5B1OHmOawSaZOgdatepqcrm4GrIWpE0umpvIIvKS6TfKKqLCSnPDVU65N
	 t6wtU9QKYSTRI03LWc/l68gWbg7Wf3oE78vqFaVjqlq/FxhrSQM2EiRtyVkI4Eahklw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="l/xJPrtU";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F5F606A31B
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 08:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F5F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l/xJPrtU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792743082; x=1824279082;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=d56qZiErZsAL2brFzhSqUiWxNRHHzU79TQ7RquVyumY=;
  b=l/xJPrtUNzvk/IQJvxYvUg7Zcdwpt7BKgfEA34wgTzEzrQDt93MT+J4m
   DXFWENL53db/qgoMcBwk3L4nDMhXFUaCL0TxTrh+1Ezs6uI4H6jEhhZ1p
   53Wf3EhreTBdNG4ke4wF/NJMaesBWfBye3p6ULf6xOP+8a6upTqCbIeZn
   D9q0uy3VhBGUjFhDHNesOBxX/Ow/n69Eiy422+KSfX/so2cdTL7pUYO4V
   Hl6Ohql8LEa6QA1oVoGrTA0qSHXTEuG09jx2qz4lIuR75eEDDQddo2sQy
   apBYJwfBRukKsZo/gZCQJArJSzkYDOi9G9fhDZKuklgaZA4AejzgoCNVJ
   Q==;
X-CSE-ConnectionGUID: KcwylaFOR4ihItIu5CKCDA==
X-CSE-MsgGUID: 4p25VTZiSqq8roNj0EdMBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1504126"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1504126"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:11:22 -0700
X-CSE-ConnectionGUID: fPfiCPHqRzKnAvtn6QOc2A==
X-CSE-MsgGUID: EhMZgs2jTWmxsv8U5x2Lgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="5338267"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.140]) ([10.124.240.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:11:17 -0700
Message-ID: <740e0e88-6353-4174-af86-c30b0957c056@intel.com>
Date: Fri, 23 Oct 2026 16:11:15 +0800
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
Subject: Re: [PATCH v2 3/3] KVM: TDX: Reject KVM_TDX_INIT_VM if indexed CPUID
 functions don't match
To: Binbin Wu <binbin.wu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, Changyuan Lyu <changyuanl@google.com>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261022210134.612848-1-seanjc@google.com>
 <20261022210134.612848-4-seanjc@google.com>
 <88de514b-8f83-4b04-82c8-caa6bd5ac976@linux.intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <88de514b-8f83-4b04-82c8-caa6bd5ac976@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/2026 11:05 AM, Binbin Wu wrote:
> On 10/23/2026 5:01 AM, Sean Christopherson wrote:
>> Reject KVM_TDX_INIT_VM if userspace doesn't configure the canonical CPUID
>> entries correctly with respect to KVM_CPUID_FLAG_SIGNIFCANT_INDEX to fix a
>> bug where userspace could bypass the TSX and WAITPKG checks by simply not
>> marking a CPUID.0x7 entry as being indexed.  This also sets the stage for
>> more in-depth validation of the incoming CPUID configuration.
>>
>> This is obviously an ABI change and diverges from KVM's general approach of
>> "let userspace do what it wants".  In practice, no "real" VMM that supports
>> TDX misconfigures a TD's CPUID entries in this way, i.e. the probability of
>> actually breaking userspace is basically nil.  And unlike normal VMs, where
>> KVM has full control and thus can deal with bizarre CPUID input without too
>> much fuss, TDX VMs require extra care due to the TDX Module also reacting
>> to the CPUID configuration, i.e. KVM_TDX_INIT_VM needs to be more strict
>> than KVM_SET_CPUID{,2} to avoid creating potentially dangerous-to-the-host
>> setups.
>>
>> Opportunistically rename the helper to make it more obvious that it's
>> checking if the passed in @entry is unsupported, as opposed to returning a
>> set of unsupported entries or something.
>>
>> Fixes: 6d415778f106 ("KVM: TDX: Disable support for TSX and WAITPKG")
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://lore.kernel.org/kvm/20260604024927.E22311F00893@smtp.kernel.org
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>  arch/x86/kvm/vmx/tdx.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
>> index 37d088f6f7a8..6abf92ffec24 100644
>> --- a/arch/x86/kvm/vmx/tdx.c
>> +++ b/arch/x86/kvm/vmx/tdx.c
>> @@ -151,8 +151,12 @@ static void tdx_clear_unsupported_cpuid(struct kvm_cpuid_entry2 *entry)
>>  		clear_waitpkg(entry);
>>  }
>>  
>> -static bool tdx_unsupported_cpuid(const struct kvm_cpuid_entry2 *entry)
>> +static bool tdx_is_unsupported_cpuid_entry(const struct kvm_cpuid_entry2 *entry)
>>  {
>> +	if (cpuid_function_is_indexed(entry->function) !=
>> +	    !!(entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX))
>> +		return true;
> 
> Similar to patch 2, if cpuid_function_is_indexed(entry->function) misses some function,
> the value of cpuid_function_is_indexed(entry->function) is not accurate.
> 
> For current code, it's OK, since all unsupported bits are in leaf 7.
> In the future, with the TDX CPUID validation patch set
> https://lore.kernel.org/all/20261016091422.3182216-6-binbin.wu@linux.intel.com/
> It still allow userspace to by pass some check in theory.
some idea.

If we decide to honor TDX module's report over KVM's cpuid_function_is_indexed()
in patch2, then how about something below:

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 6abf92ffec24..1456f4c5c6b3 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -151,10 +151,10 @@ static void tdx_clear_unsupported_cpuid(struct
kvm_cpuid_entry2 *entry)
                clear_waitpkg(entry);
 }

-static bool tdx_is_unsupported_cpuid_entry(const struct kvm_cpuid_entry2 *entry)
+static bool tdx_is_unsupported_cpuid_entry(const struct kvm_cpuid_entry2 *entry,
+                                          bool significant_index)
 {
-       if (cpuid_function_is_indexed(entry->function) !=
-           !!(entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX))
+       if (significant_index && !(entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX))
                return true;

        return has_tsx(entry) || has_waitpkg(entry);
@@ -2397,7 +2397,8 @@ static int setup_tdparams_cpuids(struct kvm_cpuid2 *cpuid,
                if (!entry)
                        continue;

-               if (tdx_is_unsupported_cpuid_entry(entry))
+               if (tdx_is_unsupported_cpuid_entry(entry,
+                       tmp->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX))
                        return -EINVAL;

                copy_cnt++;
