Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C8224FA
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 00:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764720074; cv=none; b=Gi/+2FyyjNgavkImHRiZW1AlNQkHVvGfLzY4y58ImgMH2mgoD3gSTS5g3ZUTTc6U8rWJmKDkOUjjP7fHLpN14IPRj9Vr0JonO3Mc9ZCSJo3290RKUtJMWU7PjSlWAL1KIWV5QxsvRfuXCtFEpXUfZauVA0qK5zDZkyloC/Tm6/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764720074; c=relaxed/simple;
	bh=VJEM/uFvAbd3QpW/AckGlKp8JGaEC5NJWswF78XETPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxJ5hL7I0sAIFVcD0YcbaH9u3PiAR6iwYM/fiLuftkBt/YZAK/+LS9G9HwYcSVvZdNOcQLPTshiWIgaKYznmVV7Zo7rRJ6IItBCjpxA2UBgcEO9Ep3UA3heE/QK9GEt8WQR7TBEEzMFt2O+WKrcAQGV2r8Bke1l7c/SvF36WzBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+k+TfM5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+k+TfM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764720072; x=1796256072;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VJEM/uFvAbd3QpW/AckGlKp8JGaEC5NJWswF78XETPo=;
  b=B+k+TfM5XKcxOh50t1fzRF6G/S+7sEIorxNZif3bSf8yVS397v2pN8nV
   OiSAtcsnecZ94cro5wZjRvTHNkbAOPz2v0tDUrEI7FPmrrjkcnJTwUvBy
   92S1eOsbzffpKFaCKe8O0NfsMG50Bbb1s1b8uav24w6xeUlWGdoamJvtX
   nbSjmhrTRE1IDSGv97xMi1eNyIpSiKkdCd+TcpB3sRVIHdzzFYXzwXPde
   MxQnKyVkIDoCIKVrSpGzTUZBeHpf+sTymRwxX/550Mgwq9eek7lfAx4Ex
   C+SArVZSYjvtTjVabVA8F3fZ3WM/1ruwF5tZZcc7CunwTPctC4IsRiV9D
   g==;
X-CSE-ConnectionGUID: 1XqsUmB0QTSNYorLaJqvhg==
X-CSE-MsgGUID: M3oQ7qm2Ro+NFwGA7FK29A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66592959"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66592959"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 16:01:11 -0800
X-CSE-ConnectionGUID: 9sCEs0kMQUuNp57kkx32+g==
X-CSE-MsgGUID: uQWj6rtORj+kxPZhbmw8dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="225196882"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.81.126]) ([10.24.81.126])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 16:01:11 -0800
Message-ID: <369b819c-5235-424d-a8c9-c7c45a9fd4db@linux.intel.com>
Date: Tue, 2 Dec 2025 16:00:58 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virt: tdx-guest: Handle GetQuote request error code
To: Dave Hansen <dave.hansen@intel.com>, "Kirill A . Shutemov"
 <kas@kernel.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20251202222257.986825-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <25044b05-7574-4b01-a8ea-3f7e7f32317b@intel.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <25044b05-7574-4b01-a8ea-3f7e7f32317b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dave,

Thanks for the review.

On 12/2/2025 2:46 PM, Dave Hansen wrote:
> On 12/2/25 14:22, Kuppuswamy Sathyanarayanan wrote:
>> The tdx-guest driver sends Quote requests to the quoting enclave via a
>> hypercall to obtain attestation evidence for the current TD state.
>> Quote generation can fail in two ways: a hypercall failure, or a Quote
>> failure that occurs after the VMM processes the request. The driver
>> currently handles only hypercall failures and timeout errors during
>> Quote processing. Update it to also handle other Quote failures
>> reported by the VMM (for more details, refer to GHCI spec, v1.5,
>> March 2023, sec titled "TDG.VP.VMCALL<GetQuote>).
> 
> I think you're talking about the "GetQuote Status Code" here, right?
> That would have been nice to mention. It wasn't exactly trivial to find
> because instead of saying what the format of a TDREPORT_STRUCT is, the
> docs just call it "format of shared GPA".

Yes, that's correct. I am referring to the GetQuote Status Code returned
by TDG.VP.VMCALL<GetQuote>, specifically the error codes that were not
previously checked (GET_QUOTE_ERROR and GET_QUOTE_SERVICE_UNAVAILABLE).

For clarity, I will update the commit description to explicitly refer to
status code table — Table 3-11: TDG.VP.VMCALL<GetQuote> – GetQuote Status
Code.

> 
>> This change does not break the existing ABI behavior. When a Quote
>> failure occurs, the VMM sets the Quote length to zero. Userspace
>> already interprets a zero-length Quote as a Quote generation failure.
>> Returning an explicit error in such cases makes the behavior more
>> consistent and simplifies error handling in userspace.
> I'm also not seeing a clear problem statement here. What is the end user
> visible effect of this "fix"? Why *should* the kernel be parsing this
> buffer? Why not not just leave the error handling to userspace?


The issue is that, prior to this patch, the kernel silently returned
success for certain Quote failure cases such as when the Quote service
is unavailable or when the VMM reports a processing error. In these
cases, the Quote buffer ends up being empty and userspace is expected
to infer failure indirectly by checking for a zero length Quote. This
behavior is ambiguous and has caused confusion in practice, as reported
in: https://github.com/confidential-containers/guest-components/issues/823

With this patch, all VMM reported Quote failures are explicitly
translated into kernel error returns. This makes failure detection
uniform and simplifies userspace error handling.

The reason the kernel must parse the status field is that the failure
code is only available in the header portion of the shared GPA buffer
populated by the VMM. Userspace currently does not have access to this
header since we only expose the Quote payload itself. Because userspace
cannot directly interpret the VMM status codes, the kernel needs to parse
them and return appropriate generic error codes.

> 
>> Fixes: f4738f56d1dc ("virt: tdx-guest: Add Quote generation support using TSM_REPORTS")
>> Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> Closes: https://lore.kernel.org/linux-coco/6bdf569c-684a-4459-af7c-4430691804eb@linux.intel.com/T/#u
>> Closes: https://github.com/confidential-containers/guest-components/issues/823
>> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> Acked-by: Kai Huang <kai.huang@intel.com>
>> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
>> Tested-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Please take a look at:
> 
>  https://docs.kernel.org/process/maintainer-tip.html#ordering-of-commit-tags
> 

Thanks for pointing this out. I will reorder the commit tags in the next revision.

> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

