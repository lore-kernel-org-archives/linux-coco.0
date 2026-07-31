Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AF43D9DBA
	for <linux-coco@lists.linux.dev>; Fri, 31 Jul 2026 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487833; cv=none; b=qYCRrqw9r4kElIv4sIkHkrIOjoHy0zU86VGyNRGGXUQTBXYREx3ZyurSDh2iQRThXl2U8jusnmfNME5juTNcahX9j6Pn3cCtncybWoZlxA+FhTrpb566gb9f2HPdroCvOyiDtmWIwZQ4HbVwCkL8id4xEfZh+2N2cqEsIZddRWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487833; c=relaxed/simple;
	bh=Vv/Cn/5d+0Kxx85L2VsjAbjj1pHoGsVQxFQjE4JSdWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ge2ZjPSZ1pWCYqjruGj9yMdIFIN6oGLvAXR7CF2o2hPA8DOBI5AH6fA9E0xPA/3aBPINknuFbBNIclTIgPiauqgaI38YBa5+Qw4fBELSuzxwE13HnozHfBhgvKFLSci91HVhfhRWQjH6LN61aKuDoIGdbpw4Ob8c/94mBObhWe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyZiZY93; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyZiZY93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785487830; x=1817023830;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Vv/Cn/5d+0Kxx85L2VsjAbjj1pHoGsVQxFQjE4JSdWI=;
  b=RyZiZY93/S5X6NvF3mCf8nxM1eYundi14kwnEkB7lcKWMWb3ZaUUVs+/
   nLYPQiYf5eerXKsmb00TmLS7CbsrC8AzD2/ngqQ2MERE+2riCf+YbwZi4
   SelpYJPyyzniVIbcTyTnLChi+d8NTPzHVscKH4d1ioeQ5vb5/gHNXZ2u+
   fkumaxFZKkGh374CoBdaPDpYIWCXb2tTMt/Xc1CyHTHnG1D55NplSr66V
   7oSYpeMqZ4UwLkbJ+YjJAhmWJds0yAptQbzxd50ViBk/oZhh4Y9tAMHye
   DqJCQIhSfeuQxQCAlBntspDmxVzBsThj2xkD2Eddv26P0BJ7oZmlafmbr
   A==;
X-CSE-ConnectionGUID: LPJLXVBZSLmJYhlwn39GuQ==
X-CSE-MsgGUID: XfeZCEAoTjGwdjN+O8uvIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86063041"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86063041"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 01:50:17 -0700
X-CSE-ConnectionGUID: A4HFO+S5Tmuuqd/nni8mzQ==
X-CSE-MsgGUID: Rw54lWB3T+uC2VIA7y6DHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="262491702"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.248]) ([10.124.240.248])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 01:49:57 -0700
Message-ID: <9ef8179d-f79d-429c-b841-d23c1e0a0bff@intel.com>
Date: Fri, 31 Jul 2026 16:49:52 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/41] KVM: guest_memfd: Zero page while getting pfn
To: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev,
 binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com,
 david@kernel.org, jmattson@google.com, jthoughton@google.com,
 michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com,
 qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com,
 shivankg@amd.com, steven.price@arm.com, tabba@google.com,
 willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com,
 forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com,
 aneesh.kumar@kernel.org, liam@infradead.org,
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
 Peter Xu <peterx@redhat.com>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-16-35f9aec2aed2@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260728-gmem-inplace-conversion-v9-16-35f9aec2aed2@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> Move the folio initialization logic from kvm_gmem_get_pfn() into
> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
> kvm_gmem_populate().
> 
> With in-place conversion, the existing data in a guest_memfd page can be
> populated into guest memory through platform-specific ioctls.
> 
> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
> might contain uninitialized host memory, which would leak to the guest if
> the populate completes.
> 
> guest_memfd pages are zeroed at most once in the page's entire lifetime
> with guest_memfd, and that is tracked using the uptodate flag.
> 
> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
> can get a page, write to the page and then set page uptodate without
> zeroing.
> 
> This aligns with the concept of zeroing before first use - the other place
> where zeroing happens is in kvm_gmem_fault_user_mapping().
> 
> Don't mark the page uptodate again after populating, since the page would
> already be marked uptodate before the post_populate() call.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Shivank Garg <shivankg@amd.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   virt/kvm/guest_memfd.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 505bb6747620b..ea2752989f8bd 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1078,6 +1078,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>   		return ERR_PTR(-EHWPOISON);
>   	}
>   
> +	if (!folio_test_uptodate(folio)) {
> +		clear_highpage(folio_page(folio, 0));
> +		folio_mark_uptodate(folio);
> +	}
> +
>   	*pfn = folio_file_pfn(folio, index);
>   	if (max_order)
>   		*max_order = 0;
> @@ -1107,11 +1112,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>   		goto out;
>   	}
>   
> -	if (!folio_test_uptodate(folio)) {
> -		clear_highpage(folio_page(folio, 0));
> -		folio_mark_uptodate(folio);
> -	}
> -
>   #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>   	if (kvm_gmem_is_private_mem(file_inode(file), index))
>   		r = kvm_arch_gmem_make_private(kvm, gfn, *pfn,
> @@ -1171,8 +1171,6 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>   	}
>   
>   	ret = post_populate(kvm, gfn, pfn, src_page, opaque);
> -	if (!ret)
> -		folio_mark_uptodate(folio);
>   
>   out_put_folio:
>   	folio_put(folio);
> 

