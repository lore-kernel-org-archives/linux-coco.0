Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B887A56
	for <linux-coco@lists.linux.dev>; Wed, 23 Feb 2022 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645617328; x=1677153328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+1Bvis2CoK18o2+hcc1CoTOk4DpVvvkAux/lXlSU73s=;
  b=C7PRhKhK1zTjECozRERSHMtlRvggiq499Mo6MdQsbTLQwtrqT7SDq92j
   9ypDV5kcTiC3qutUIckN2IwB9+KMV1WN8Iwd+4NayddnU/UFq7CFYRCGV
   pFg5WJOy5a3ZwY1Ooy3TrPUc0onJKbE0lnGjCDVJ+ZjWiH0aU8UdFeuiF
   VU2w4p/QaUbpmjhlzeg+L9DATI/G1aiYc5r8bCNlcKeR8gia/KjmXsaGc
   BSR6SiHEBn7Ezw5nOT5xm96EfOBxugu24/mDfXbpyWPrgRVMgDmWMjhzZ
   UKWNoVD73mzwiBdviFCpj2DrZg+DmhBmpaVYHOXeRPyDzX1MMmmY/YO7X
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251865458"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="251865458"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 03:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="573791285"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 23 Feb 2022 03:55:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 06350142; Wed, 23 Feb 2022 13:55:39 +0200 (EET)
Date: Wed, 23 Feb 2022 14:55:39 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	David Rientjes <rientjes@google.com>,
	Michael Roth <michael.roth@amd.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH] x86/mm/cpa: Generalize __set_memory_enc_pgtable()
Message-ID: <20220223115539.pqk7624xku2qwhlu@black.fi.intel.com>
References: <20220222185740.26228-1-kirill.shutemov@linux.intel.com>
 <20220223043528.2093214-1-brijesh.singh@amd.com>
 <YhYbLDTFLIksB/qp@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhYbLDTFLIksB/qp@zn.tnic>

On Wed, Feb 23, 2022 at 12:31:56PM +0100, Borislav Petkov wrote:
> @@ -2024,11 +2026,9 @@ static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
>  	 */
>  	cpa_flush(&cpa, 0);
>  
> -	/*
> -	 * Notify hypervisor that a given memory range is mapped encrypted
> -	 * or decrypted.
> -	 */
> -	notify_range_enc_status_changed(addr, numpages, enc);
> +	/* Notify hypervisor that we have successfully set/clr encryption attribute. */
> +	if (!ret)
> +		x86_platform.guest.enc_status_change_finish(addr, numpages, enc);
>  
>  	return ret;
>  }

This operation can fail for TDX. We need to be able to return error code
here:
	/* Notify hypervisor that we have successfully set/clr encryption attribute. */
	if (!ret)
		ret = x86_platform.guest.enc_status_change_finish(addr, numpages, enc);

-- 
 Kirill A. Shutemov
