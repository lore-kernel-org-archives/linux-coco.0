Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D79410D1A
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527739; cv=none; b=HgcYd5ybDvFJf2TcwgctQXqw9DTCCKdBp6SuNwcqxyHYc8bUdVo8poxdwzn7qir4HSw8QiQ74EghbRG3MK1Ibtmf5hSM0EeFZ+9eE/vkgn7jCZZysFxZeAVkCvUHQrasm36Kxwl7F3zRhYuhacC3wa8ftiZqyP1eOAhqGUnbB2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527739; c=relaxed/simple;
	bh=hO+eSp3gkznoaX0diJR0FkAzNGsy+/Ay17EoQrYMdDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ru9OzhSRNaVMfIgpesPddVj1uwm/9w6R9pRR/E/A1YNo9QZGST1rz2lg1mPrVt5/K5jsxuaVaRpqRePITPiLGm3BSYm+JvBZEp4xmMiwEI32SERNut0SarOyGNkUfjqISzBrVYYhDqUOh21ZyczYDQ+j819FCAFSbfQ3y7moGXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFzB/JKe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFzB/JKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786527737; x=1818063737;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hO+eSp3gkznoaX0diJR0FkAzNGsy+/Ay17EoQrYMdDM=;
  b=cFzB/JKepVUAc1PWgQCgVyenFcaf5r9rkOCHsM92r14peTwWbqui8f+G
   7UXQr4zT/qetI4Iv04i5Rj+tzOBMjeF72ZPw57AHRJC984ju4RWloLsQK
   so2EMn3R6yrxudCUPkU6i5hqmEE3UOvxdBLs25UMpoJV84rYPzRj54QwN
   AMjve5jLBQx7ZrE8M36fli9hJ7a2Z3AWxHFETeGvpBFKE9aq1X6lXSeoq
   XbWHId9q/uDfJLl6lYIP7FNR1mENFpfqQy/tUxd64rjd9QAucFaZH0PIs
   vaWqN9pjBBv85/wKRFk9olVcdqw2YKOP94Nqbja2JGzgDbtRp0NSW7kjV
   A==;
X-CSE-ConnectionGUID: yp5/jqa9TAuyF+8oib9V7g==
X-CSE-MsgGUID: wyyIKjTaQeOjzbtv6V6zsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87096863"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87096863"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:42:17 -0700
X-CSE-ConnectionGUID: Yq4/DjiFSmeanwk+IfKniQ==
X-CSE-MsgGUID: lOQDrXhuRlWrGLkNcCLUBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267092961"
Received: from unknown (HELO [10.238.208.98]) ([10.238.208.98])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:42:04 -0700
Message-ID: <cc44c9d7-a6cd-40a5-9f68-4822fb9c9d0c@intel.com>
Date: Wed, 12 Aug 2026 17:42:00 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Sean Christopherson <seanjc@google.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev,
 binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com,
 jmattson@google.com, jthoughton@google.com, michael.roth@amd.com,
 oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com,
 rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com,
 steven.price@arm.com, tabba@google.com, willy@infradead.org,
 wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com,
 pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org,
 liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, tarunsahu@google.com,
 Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <ed483d25-d908-4248-b8c7-862dd35dc6d4@kernel.org>
 <annnrGR1noVuBkCc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <annnrGR1noVuBkCc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/2026 11:01 PM, Sean Christopherson wrote:
>> As mentioned in v9, the name is confusing.
>>
>> 	kvm_gmem_mem_is_private
>>
>> ?
> Ya, +1 to kvm_gmem_mem_is_private.

So kvm_gmem_mem_is_private() calls kvm_gmem_is_private_mem() 
internallly. Ummmm.
