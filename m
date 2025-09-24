Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C4027B500
	for <linux-coco@lists.linux.dev>; Wed, 24 Sep 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758700713; cv=none; b=hzRhpkveK0z+kMLz+z6IFAsqUjqXxxjQu9IPc8BxrFloShxZ2/HSzV4Tg9y4ZO7r1htHsXIQt6rCh84yK8ZltKvS8oKMNQnmPehSfJeNtCoQ2cXTGH4RaVwAEQ3D7uycFzJW6nPoJPpVCwJUph0TcAKoZIVdHrR9mgjhikRN+pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758700713; c=relaxed/simple;
	bh=mt8gJKDFaSad5gUaiDqQw9QnDOAcy7k6tffysTTxn2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=PlruT19qmgkEUStM+RBoSWW1Q6zcG1WGtFH9lgkqL7R4E53Jypz+14GkLhkWGFZ1Yx4l0xX9zg0sGynwaq/YuLyi5K5XSTSCBahJxtDkIronRpOru6gBdTb8j4dAjiPKU0NC+uGRnVeobnjJJBIZBvOy6fCcJ9Cke9bOv8tMpiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiPT6Skc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiPT6Skc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758700711; x=1790236711;
  h=message-id:date:mime-version:subject:to:references:from:
   cc:in-reply-to:content-transfer-encoding;
  bh=mt8gJKDFaSad5gUaiDqQw9QnDOAcy7k6tffysTTxn2c=;
  b=eiPT6Skc1QyntwudAp9eBSLfev3aL0AV472eshqCyOne9gk66tpJspkW
   7iHgruyxq+dwUdZjok4zJYd6rXEs+sZSJ0jhMoE7g1mGUp0hnlbDMgNip
   E5v+8corEiIyz1HpVa/Nk6KbovYB+TrMdlxfOHz3tdUHL3Xg7IhTBHaGS
   LAobsiOyY6n+GuhAbaQ9rI1LzBeiABE/vlyjqvddJI665bTFFnG40WVKl
   6Xmd84F1kEHcbLbfComcU4MMMrHF8CyDW3nTYRPVvVaUwzmrsJV0W5Tx6
   Wr6b+m+BsPuDNAN4dpo87pChgYuUEvqUhsRL8RtDtxGGtsVSTPRZopnHk
   g==;
X-CSE-ConnectionGUID: AZZE7HdgQxqT3KbUK2PVaw==
X-CSE-MsgGUID: Ty8ksBurRrm93NlbH1hIxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60031999"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="60031999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 00:58:28 -0700
X-CSE-ConnectionGUID: JnF9D1UOTTGUFmF0/Td7rg==
X-CSE-MsgGUID: 4gOqglb/Rn279KnsyfamHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="207716846"
Received: from unknown (HELO [10.238.0.107]) ([10.238.0.107])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 00:58:23 -0700
Message-ID: <c605f6d7-8d9b-473d-a6d5-a38ddccc1a83@linux.intel.com>
Date: Wed, 24 Sep 2025 15:58:21 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/16] KVM: TDX: Add x86 ops for external spt cache
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20250918232224.2202592-1-rick.p.edgecombe@intel.com>
 <20250918232224.2202592-12-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
Cc: kas@kernel.org, bp@alien8.de, chao.gao@intel.com,
 dave.hansen@linux.intel.com, isaku.yamahata@intel.com, kai.huang@intel.com,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@linutronix.de, x86@kernel.org, yan.y.zhao@intel.com,
 vannapurve@google.com
In-Reply-To: <20250918232224.2202592-12-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/19/2025 7:22 AM, Rick Edgecombe wrote:
> Move mmu_external_spt_cache behind x86 ops.
>
> In the mirror/external MMU concept, the KVM MMU manages a non-active EPT
> tree for private memory (the mirror). The actual active EPT tree the
> private memory is protected inside the TDX module. Whenever the mirror EPT
> is changed, it needs to call out into one of a set of x86 opts that
> implement various update operation with TDX specific SEAMCALLs and other
> tricks. These implementations operate on the TDX S-EPT (the external).
>
> In reality these external operations are designed narrowly with respect to
> TDX particulars. On the surface, what TDX specific things are happening to
> fulfill these update operations are mostly hidden from the MMU, but there
> is one particular area of interest where some details leak through.
>
> The S-EPT needs pages to use for the S-EPT page tables. These page tables
> need to be allocated before taking the mmu lock, like all the rest. So the
> KVM MMU pre-allocates pages for TDX to use for the S-EPT in the same place
> where it pre-allocates the other page tables. It’s not too bad and fits
> nicely with the others.
>
> However, Dynamic PAMT will need even more pages for the same operations.
> Further, these pages will need to be handed to the arch/86 side which used
arch/86 -> arch/x86

> them for DPAMT updates, which is hard for the existing KVM based cache.
> The details living in core MMU code start to add up.
>
>
[...]
