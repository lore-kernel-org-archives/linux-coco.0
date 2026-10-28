Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149670;
	b=XZl17DEURcivrzpLeTx21ug0czdn6JIBRb8E0ZsSj2YxKfI4hmusesQnvKXVw/vYWIhj
	 cCE4HataO1stH87VGO3IhYlznaV+dt8Q6eBMSWlJtEjs2nqGCMjotRLf7iwJQinFUJzl1
	 DFTLAKH4Sqq0KSyml/G99/b9ocCZEMsyiaf1XmsXCyezOA5Vy4kUMYIVaDgdCib7SQTTq
	 jAL6zMU6PAJQ9cyTj9B83rfz34975el6dK4HUmlFYLi3J4qnatTLpCOTcNBLs22wzFTC0
	 tQA94lIyoEvM0OblNTgo8aRMcZ5oP0h1r28D3I5aoiNmgA0suzrKnyFREvxwVKxY4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149670;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G5hV2V6SdAWvpaPSkKW+zcHsAnkahIlajifYwNF+O8c=;
	b=5tH/sv5hLODNhj+PHnJkPkmpvyvksX3k8y+3NjY8ou0wVtNVQ8Cl5xMXyDZmSDw44xZq
	 S7bLCGI6TxdMIrnMQaB/H3fNE2aQKa2F6kqDkwZrxRDtpSUKbWV0MzrmgL1TJ//BMy1Q6
	 OTozAeT7C/fo1zdMe1pEgKu66VvCG1uV/dcBvKcc2XOxpZYBuoAAqK8qLDB8QVCTcrbIb
	 Cpp/rP/qU+flkdU5/afhS0+wuyWgMGL6PGUJYem7CrAMWithEDydHfCI3bObDvov+kZMd
	 M7BEJTo8XJTLpFlvMHyuXw8jsXUvCwsK+7x6q3dPl7I3L1z3+fVc2PR34o72zPqkfWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AlwjzJGb;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925F606A31A
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 01:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7925F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AlwjzJGb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793149669; x=1824685669;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hYzpcDmj3XuKtz2I8wv6l4Dkd+nsYNx+Svvl0NP8les=;
  b=AlwjzJGbDOUnw4Oa+DjbRgvK4Sugiqzyv1BvUl00xCBVg6XP8y6JFACw
   GRxPv0XPhsio6NPoLGIc3NqWoyKOiY20GvuSPdTugX0YIt3IhB3MJRkIc
   zBUmylNZu7ANVey7RqbrXIk3HsSDrBGW/lqRfWDIC1lpkdsuLaOQFHpE0
   +28NXDIWoimHp5qc26Iwr76B67hl1IcNXe67Gjll0uMFxoAZDx0XrRnqh
   DFGjiiBBNHRhdyoxdPYfu5G7EpNmpw91whXNoPkRVtkgUtnTcvLAWmnnw
   AHATSa2jX2Zrg9LHXAk9oJUrKR0XxVv8A2EeMTbTfP7woGLwog6rdRAFK
   w==;
X-CSE-ConnectionGUID: +AzzRqeFTSWdXccH6iJHOw==
X-CSE-MsgGUID: 5GJa4f/ZT/ecnt87AiuyVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1743364"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1743364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 18:07:48 -0700
X-CSE-ConnectionGUID: nrx1XpZdQBS8raKXNHLajA==
X-CSE-MsgGUID: 19HQZixvRZaQQhzrTXeq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5080448"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 18:07:44 -0700
Message-ID: <e87a8037-92b1-45b9-871b-8d470fa90962@intel.com>
Date: Wed, 28 Oct 2026 09:07:42 +0800
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
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 Binbin Wu <binbin.wu@linux.intel.com>, Changyuan Lyu
 <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
References: <20261022210134.612848-1-seanjc@google.com>
 <20261022210134.612848-4-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20261022210134.612848-4-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> Reject KVM_TDX_INIT_VM if userspace doesn't configure the canonical CPUID
> entries correctly with respect to KVM_CPUID_FLAG_SIGNIFCANT_INDEX to fix a
> bug where userspace could bypass the TSX and WAITPKG checks by simply not
> marking a CPUID.0x7 entry as being indexed.  This also sets the stage for
> more in-depth validation of the incoming CPUID configuration.
> 
> This is obviously an ABI change and diverges from KVM's general approach of
> "let userspace do what it wants".  In practice, no "real" VMM that supports
> TDX misconfigures a TD's CPUID entries in this way, i.e. the probability of
> actually breaking userspace is basically nil.  And unlike normal VMs, where
> KVM has full control and thus can deal with bizarre CPUID input without too
> much fuss, TDX VMs require extra care due to the TDX Module also reacting
> to the CPUID configuration, i.e. KVM_TDX_INIT_VM needs to be more strict
> than KVM_SET_CPUID{,2} to avoid creating potentially dangerous-to-the-host
> setups.
> 
> Opportunistically rename the helper to make it more obvious that it's
> checking if the passed in @entry is unsupported, as opposed to returning a
> set of unsupported entries or something.
> 
> Fixes: 6d415778f106 ("KVM: TDX: Disable support for TSX and WAITPKG")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/kvm/20260604024927.E22311F00893@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Given the discussion of patch2 has settled down,

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
