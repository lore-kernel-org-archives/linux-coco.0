Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C610EE
	for <linux-coco@lists.linux.dev>; Wed,  1 Mar 2023 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677689777; x=1709225777;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8NEWTaD5RnYbcKDVZrq2Ew/2DFfHh2dyMO/xAIfd+2Q=;
  b=JiU6ru3nLZw/JIZ9IWuWqiNiHVYph9uDry+VczhVr3nJLMIHRaWxEKG3
   u47odVQCEfw5trSb7uSXuqJTiuNrozlkzD65D9YW5y6MZAFYPsAmUk3Iz
   cbTtpa43L3EJ/rV+auYfb5eroLBywuRY9MM/b5thYf+safCXfQIeo/+Cp
   0A8B1VCJ/79ZASZrihp8XR3baeOrMC4PgyJ35nTXo/51jhdyZ3xwIYP2Y
   YVUT9EUG8c1H+cpwNKEBSKN62cUsrJ5rXPem8q9BuVSUGv9s3TWOn6Oft
   tEy11137b8xGmvKA06Dz9WOBQ6M3yEHei7wYSHtixnXqPfMwhp18ENQ0G
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="314881607"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="314881607"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 08:56:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738700170"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738700170"
Received: from asaha3-mobl1.amr.corp.intel.com (HELO [10.251.12.67]) ([10.251.12.67])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 08:56:06 -0800
Message-ID: <f2c904f6-996a-e903-5d56-662781567578@intel.com>
Date: Wed, 1 Mar 2023 08:56:05 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC v8 00/56] Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
Content-Language: en-US
To: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org
Cc: linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com,
 slp@redhat.com, pgonda@google.com, peterz@infradead.org,
 srinivas.pandruvada@linux.intel.com, rientjes@google.com,
 dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
 kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
 marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
 ashish.kalra@amd.com, nikunj.dadhania@amd.com
References: <20230220183847.59159-1-michael.roth@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230220183847.59159-1-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/20/23 10:37, Michael Roth wrote:
> The RMP check is enforced as soon as SEV-SNP is enabled. Not every memory
> access requires an RMP check. In particular, the read accesses from the
> hypervisor do not require RMP checks because the data confidentiality is
> already protected via memory encryption. When hardware encounters an RMP
> checks failure, it raises a page-fault exception. If RMP check failure
> is due to the page-size mismatch, then split the large page to resolve
> the fault.

What does this all _mean_?

When does the kernel need to care about a "page-size mismatch"?
