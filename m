Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2210723ABBE
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 02:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728718; cv=none; b=gr+lhYYUcrn8TKp9l9TTyIx/XqlaebSHKqd9gvEatwxwGkFgzT5YhomHXUWJk0A4tyNFK8J6VKUKx2kqk7v1RBvTj5MulwBF2Ub8BI4Y06Iw31QBYuVwiA+Qnidwxr1oaJE7dQiR5fmuZyKy8z/LEZTWs2OZ/enSXtMdBfW5R1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728718; c=relaxed/simple;
	bh=fBBc+31NOMHxr0hwy484e2a8Y1do4QItcIdmOEG5TVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEETbks58kZOglL/y1Rs2puGChKVt0+lBb7u7LO1tKNr/rMrg3BO5Wj6l8BxrgVwcAc9yEQgdznH4E/FxPxJ5ylOEmnvEgUwxBuRj9qthDBhRufmoqySGTC7qTFwhR1lMBwxxmgBwZvyxzfcYEKdMOtx0g0r9EPIaGFBrGljc+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQaJXfhM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQaJXfhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728717; x=1796264717;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fBBc+31NOMHxr0hwy484e2a8Y1do4QItcIdmOEG5TVA=;
  b=XQaJXfhMsJWUI/jF2uQNGJlaPXguxGpKYcxnvI3WMVo5TDh68iHuBGBO
   KHOyJafVcJnl72s464YNwCKafOwhHyUq0RncTrUDBhjFCCezoQD56mHtL
   kVUfSy84Bfp4Le1GSldn15x7VW0jHF4caAAAQfcPBzUwmO0t4tziN5qoZ
   S4nADbyA47gq1irZPVAgukUTEgWsD1eGT+PzTTAxnN7M2hRsTlN3xx7oV
   32E5GRddOpui/YZCXGOM0BvZ2L3iHCBtpb6TtxCHob0tRTZ750uasugkr
   pjX50CEWl3nZ5DHXpfW6sLDFi4R+pB2HvAjB03WeG1Atzo6yqr7F+MUYo
   A==;
X-CSE-ConnectionGUID: o2YJObIiSpuZJVutbDgZtA==
X-CSE-MsgGUID: 7ESRmibaQPOTqG3AiGrLgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66748635"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66748635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:25:17 -0800
X-CSE-ConnectionGUID: FKEKvrAES+SiVcJ0EpEplQ==
X-CSE-MsgGUID: H2IDR+0OS42VLF+b5N+L8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="195336618"
Received: from unknown (HELO [10.238.3.0]) ([10.238.3.0])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:25:00 -0800
Message-ID: <daa72134-387b-467c-8eed-88591287c983@linux.intel.com>
Date: Wed, 3 Dec 2025 10:24:58 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] x86/virt/seamldr: Shut down the current TDX
 module
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com,
 dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com,
 vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
 Farrah Chen <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-15-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251001025442.427697-15-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/2025 10:52 AM, Chao Gao wrote:
> TDX Module updates request shutting down the existing TDX module.
> During this shutdown, the module generates hand-off data, which captures
> the module's states essential for preserving running TDs. The new TDX
> Module can utilize this hand-off data to establish its states.
> 
> Invoke the TDH_SYS_SHUTDOWN SEAMCALL on one CPU to perform the shutdown.
> This SEAMCALL requires a hand-off module version. Use the module's own
> hand-off version, as it is the highest version the module can produce and
> is more likely to be compatible with new modules as new modules likely have
> higher hand-off version.

According to the TDX module base spec (348549006), each TDX module is built with
TDX Module Handoff Constants, including No-Downgrade Flag. If the current TDX
module is built with NO_DOWNGRADE=1, the hand-off module version must be the
current TDX module's HV.

This patch series doesn't seems to handle No-Downgrade Flag, IIUC it needs
to use the current TDX module's HV to avoid failures.

About "hand-off version" and "No-Downgrade Flag", I still have some questions.
Is it possible that two TDX module versions have the same hand-off version?
If the newer TDX module built with NO_DOWNGRADE=1, is it possible to downgrade
to the older TDX module when they are using the same hand-off version?

> 
> Generate changes to tdx_global_metadata.{hc} by following the
> instructions detailed in [1], after adding the following section to the
> tdx.py script:
> 
>     "handoff": [
>        "MODULE_HV",
>     ],
> 
> Manually add a check in get_tdx_sys_info_handoff() to guard reading the
> "module_hv" field with TDX Module update support as otherwise the field
> doesn't exist.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> Link: https://lore.kernel.org/kvm/20250226181453.2311849-12-pbonzini@redhat.com/ # [1]

[...]
