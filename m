Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465F537F31F
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505274; cv=none; b=Wgv/rLDkdGtcM413YKpDr2acvqbhZfchnNHpbvLW9j90FP9hAaytLuu1rrkZCk77Xm3C2rxeUM2sWEG1CIoVBRYvQTS3b8tn3nw0mHo2FNfGMYKA+dJLDkLiKdulHeJYEAcAPxeQf9sIhHmX9T38HxnHjIYMCN/BEu/6xHZ9ec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505274; c=relaxed/simple;
	bh=DHngFFMTzobiHwpPz3SjP9y266L3Dd5I1hQOUiek3dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaNjNx8uOd9SEamCax3DX79nZrDxyQdjeNvNQ8u/DBxgaceEsGxJmXf/59lL+953Z69wTWrvERAFofaW7Oo49FdzME88Z5Q1m461oeravVFP2X8/54o8Sb7a5VbDbbFXLxBQn8rFIDdgoBAez5/OO/1gXtkoW0NZYzEK769rUAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEJ0+Jwj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEJ0+Jwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786505272; x=1818041272;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DHngFFMTzobiHwpPz3SjP9y266L3Dd5I1hQOUiek3dg=;
  b=bEJ0+JwjOvw5EvqCWtAkD94ELcligTtzeirx1f6JPxANZRm+WaA8FVwf
   7qjJl1CZ8Vfwj6PrU9pVCcZ18bOlIc/NmhHNbb1gY12ikmepUavh0Iv8L
   lWrzuv7950XXR3EFhOtvsh2477UESoW1pE/FytO3aXJpKAs+NZpMtXdHy
   3NekbZcygExMN/puFS3qScIAGgm0wSwoDBj12slXfN5lsD7Z+3iXljAgh
   2DwrtnnsJV/r/Bmig5Ua5SpeQ2wfZM3Y6+phn5l8l+hehA4XJDfmX4OD+
   J7bM1WLkxJJZLVjDuu7gjClgDxy/XPr6morWYAnWBVtznSuh8wGVBiuJc
   g==;
X-CSE-ConnectionGUID: f9LAS8eHRquGICNP0PPwMQ==
X-CSE-MsgGUID: LbPRDPfATw6WwQxme1/Xew==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="89575909"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="89575909"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 20:27:52 -0700
X-CSE-ConnectionGUID: jXyrUnQUTjijHpNVquEIwg==
X-CSE-MsgGUID: bUYlg8z2QcKiPLUcckGC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="261763974"
Received: from unknown (HELO [10.238.2.33]) ([10.238.2.33])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 20:27:38 -0700
Message-ID: <5d7151af-79a4-4e3b-8d06-949b1dd670ee@linux.intel.com>
Date: Wed, 12 Aug 2026 11:27:35 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/41] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org,
 chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com,
 jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org,
 pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com,
 rientjes@google.com, shivankg@amd.com, steven.price@arm.com,
 tabba@google.com, willy@infradead.org, wyihan@google.com,
 yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org,
 suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
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
 linux-mm@kvack.org, linux-coco@lists.linux.dev,
 Xiaoyao Li <xiaoyao.li@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-2-2fc18ee6d3ba@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260807-gmem-inplace-conversion-v10-2-2fc18ee6d3ba@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Start plumbing in guest_memfd support for in-place private<=>shared
> conversions by tracking attributes via a maple tree.  KVM currently tracks
> private vs. shared attributes on a per-VM basis, which made sense when a
> guest_memfd _only_ supported private memory, but tracking per-VM simply
> can't work for in-place conversions as the shared/private status of a given
> page needs to be per-gmem_inode, not per-VM.
> 
> Use the filemap invalidation lock to protect the maple tree, as taking the
> lock for read when faulting in memory (for userspace or the guest) isn't
> expected to result in meaningful contention, and using a separate lock
> would add significant complexity (avoiding deadlock is quite difficult).
> 
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Tested-by: Shivank Garg <shivankg@amd.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

With Sean's fixup in https://lore.kernel.org/kvm/annqex-kBOc0UJvp@google.com/ 

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
