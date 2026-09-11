Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0D471CF6
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118396; cv=none; b=jFmtRSpAqC4dG6rc7n577QO2HzU9y4MMMYiqEpgrIvl2BznabrV9iqo4USmeG92hRahnAW2F+EedQZm1LbLBDcOvXrrH/+g3z1nAa5KkKsIA0Z8lV2d7YZjRHZ4v+zz36hK+uaGr88zMsMC0d4BF6M5InPdJwAshMbAIVI5SXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118396; c=relaxed/simple;
	bh=x4HjFt9hC9MVbkBet+CRb0bKBH7jlDEbqN+Sd6H1xzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvojBROMMgE2Csqyz4Fy6COll8jTyLFzfGBjRS7WdV7iLQzvg+cxJe4s3pc4695TpwzME27BOfWwI9YrhjHe/ucbZlUjwB0x5qfV3+fDHZwdkQxvheW5/+zP3FOTpBj+wRzrlCAsAFy8yte05GVtOkjYSHwEDnPk9WJM/gMoQ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7qvj7a5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7qvj7a5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789118395; x=1820654395;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x4HjFt9hC9MVbkBet+CRb0bKBH7jlDEbqN+Sd6H1xzQ=;
  b=J7qvj7a55nlLrV5x7REGY6PdWmij4sDhuUixRXnOnHmi7PV3dHfgquLy
   utap1X+l4qw2A8jykIaxyuJmvn8HlGu3/s8Re/Sp54sbzJ67cXqvEOqBP
   4ru65v2MeziGVcIc4cKtuj5aFlZwhUH8bjJV5aCqi14sXfLsUN/4rVVic
   wNHQBxuuHx8WywjDGrCJ6+srpezu+6NF33lyQBekAIFDIS8zUP+q3KeV9
   2pfA+FSguBd4+QPcCMM3uUfXYC4OmQk2dAHV4lWKGelJ0lGJub4nks+rf
   M4SnsrNyz+vFc3gPyGyHehpVdEqQufCCobEaHQ/5AiOROPnXcPhNvS3kk
   A==;
X-CSE-ConnectionGUID: fo5fTmNoTh+C+5AYPFQiRg==
X-CSE-MsgGUID: 9GCeRuEvQym9CfGsK+aonA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89451011"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89451011"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 02:19:54 -0700
X-CSE-ConnectionGUID: MskVPNAUQaecybhe4vi6ug==
X-CSE-MsgGUID: MyILX2DsQcKOmEi/YU31iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="238657"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.119]) ([10.124.240.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 02:19:37 -0700
Message-ID: <e84d09bf-2c15-4d2b-967f-e6ae47d0e87c@intel.com>
Date: Fri, 11 Sep 2026 17:19:34 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/44] KVM: Rename kvm_mem_is_private() to
 kvm_is_private_gfn()
To: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev,
 binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com,
 david@kernel.org, jmattson@google.com, jthoughton@google.com,
 michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com,
 qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com,
 shivankg@amd.com, steven.price@arm.com, willy@infradead.org,
 wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com,
 pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org,
 liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
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
 Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260910-gmem-inplace-conversion-v13-0-dd6fbf94f4e1@google.com>
 <20260910-gmem-inplace-conversion-v13-7-dd6fbf94f4e1@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260910-gmem-inplace-conversion-v13-7-dd6fbf94f4e1@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/2026 7:55 AM, Ackerley Tng via B4 Relay wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> Rename kvm_mem_is_private() to kvm_is_private_gfn() to prepare for in-place
> conversion, where there will be two lookup functions,
> kvm_vm_is_private_gfn() and kvm_gmem_is_private_gfn().
> 
> This renaming allows consistent prefixing of "vm" vs "gmem" for
> kvm_*_is_private_gfn(), as opposed to kvm_gmem_mem_is_private(), which
> looks like a typo.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
