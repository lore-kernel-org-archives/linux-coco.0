Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8E8381B02
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848827; cv=none; b=EWCOkfSmzHpXWB7D5zh0ap9uSr+ysPZ/5ymiG7/WNb6y176+zb3h94GJV0zvA7FKGd4zsmKxsRCo3J9fteM5D/aXh6qupLRaN0s6kxBDY7K/HZhBASTEl1U7QKGdP6mm9nYtT91OxABNILiZ/Gzo2fyugnLIB1tuC+Bh0hVFwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848827; c=relaxed/simple;
	bh=Ja0gAh+m/wiEqRIRD3lBAVuJ697S8KTg+aCvtSadiac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4ecbgb3owkvvaUWN3QGunpDgODXQwvb0WJxeudoOy7AJJe4izw6IKK4yfYnyu95qzX3bL+niJebL4VlPFkUpoJ/lMvYEU68wyjkj5Z/FbXA9vYm36f+f7rzeqGJ9CzCmZNd9k8FNwJDntCTtoSepYfDD4vnxtWW+OdMJwPM1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPgleaPM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPgleaPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788848825; x=1820384825;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ja0gAh+m/wiEqRIRD3lBAVuJ697S8KTg+aCvtSadiac=;
  b=fPgleaPMcR1PdY3zKvecJcl7+Ji/e4p/FIgAJHyjw+WWfXqtxo9mWBoz
   KwLpo/ySTDNWaVzipYsGdpdlaGbrwWh4bUY51Wx7XCMpSZklKMw6tgY7s
   W6eimsB93HjIpyh/ru60EB8vfW23K6dltwwvy0Raj+65ytATXOAE5RNF2
   SkogkHb2QSdaSILt3NU9ybaNCaUGunKPFJI8ElQsebsW16l/5vB95gqxX
   A6JGzziyocM4J0zWUtESjr4Gy2FyYsTgKl/e1BrIFq29ZbhOKcuVcubuk
   tzO4l6MdloP2Gd4T6RmCLMlCJqqeOv5Hza0WIFYV15hTBLfqyVP8wsl6K
   g==;
X-CSE-ConnectionGUID: 6l8afiv4SjOu6scSGamCXg==
X-CSE-MsgGUID: vBDZu0Z2Ra2DGegwETOZOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114781415"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="114781415"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 23:27:04 -0700
X-CSE-ConnectionGUID: pXiGC1OaT1C5Lj3lCwNuOg==
X-CSE-MsgGUID: YyZ4f0T+SPC9V1GErK69dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267218359"
Received: from unknown (HELO [10.238.2.139]) ([10.238.2.139])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 23:27:02 -0700
Message-ID: <d2a198a8-cba9-4773-94b6-1513b8b718c5@linux.intel.com>
Date: Tue, 8 Sep 2026 14:26:39 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/virt/tdx: Formalize SEAMCALL leaf version encoding
 support
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: dave.hansen@intel.com, dave.hansen@linux.intel.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kas@kernel.org, nik.borisov@suse.com,
 rick.p.edgecombe@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 Binbin Wu <binbin.wu@linux.intel.com>
References: <20260901105436.461823-1-yilun.xu@linux.intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260901105436.461823-1-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/2026 6:54 PM, Xu Yilun wrote:
> The TDX architecture includes a syscall-like ABI for OSes to communicate
> with SEAM mode software. This ABI has the concept of a "leaf". Each leaf
> is roughly analogous to a Linux syscall: it has a set of register
> arguments and does one logical thing like adding a page of memory to a
> VM or running a VM. The TDX architecture refers to this interface
> function as a "SEAMCALL leaf".
> 
> Just like syscalls, the TDX architecture wants to evolve the ABI to
> extend functionality while keeping compatibility. But unlike syscalls,
> which do this by picking a totally new syscall number, the ABI encodes
> the "version" number directly into the bits of a register argument. So
> instead of openatN being whatever the next free number is, the SEAMCALL
> leaf number and version number are encoded into certain bits in how the
> RAX register is defined in the ABI.
> 
> In Linux, several seamcall*() wrappers have been introduced to invoke
> SEAMCALL leafs. They all take a u64 "fn" argument for the leaf number
> which eventually get set in the register. As above, the version number
> lives in the same register as the leaf number. So callers that want to
> select a specific version of the leaf, can jam it in the right place in
> the register by passing it in the "fn" argument.

Do you think it's worth explaining how callers determine the versions
supported by the TDX module, and what happens if the specified version
is not supported by the TDX module?
