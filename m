Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB01FB2
	for <linux-coco@lists.linux.dev>; Thu, 23 Jun 2022 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656005066; x=1687541066;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HyD7sZmGzSIHx03CaYUHtjWHrLaftO9PYHM6NFaUHG0=;
  b=UakjIHveOrnwMFjC9yUbs1TV8sYt1GuujE5Uf2F4VvOSVf4OMk7jh8oC
   faVtX9KJIPIMQqh6c4Y7AzaUzfRRWNIKDuvvus+RnbT7FgjNyZXmFT4B7
   Ag3IRggdy1SjQCEOAjCY1fomY4q98j97xPhYRQ8dqdak4tiTj/uyOFXx1
   DDD7OHZbTS6hhAgRy/qWnzXBHRb17Gcw8LhNdb+1addJwmonvlYxBBCXQ
   jLAjKsX0pcrcNL4tsNb4DS6txmXBBPEOm0BseuOpLRf4OklwU+ViB5+o7
   PNvkNietDdfkJXqA1zqxBlVz+wPA5R6yTj8cE2aky3zVI9kfLGQ/mpXS4
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="281516156"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="281516156"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 10:24:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="563531696"
Received: from ckeane-mobl1.amr.corp.intel.com (HELO [10.209.81.98]) ([10.209.81.98])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 10:24:25 -0700
Message-ID: <6be29d38-5c93-7cc9-0de7-235d3f83773c@intel.com>
Date: Thu, 23 Jun 2022 10:23:59 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv7 11/14] x86: Disable kexec if system has unaccepted
 memory
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 marcelo.cerri@canonical.com, tim.gardner@canonical.com,
 khalid.elmously@canonical.com, philip.cox@canonical.com, x86@kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 kexec@lists.infradead.org
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-12-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220614120231.48165-12-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... adding kexec folks

On 6/14/22 05:02, Kirill A. Shutemov wrote:
> On kexec, the target kernel has to know what memory has been accepted.
> Information in EFI map is out of date and cannot be used.
> 
> boot_params.unaccepted_memory can be used to pass the bitmap between two
> kernels on kexec, but the use-case is not yet implemented.
> 
> Disable kexec on machines with unaccepted memory for now.
...
> +static int __init unaccepted_init(void)
> +{
> +	if (!boot_params.unaccepted_memory)
> +		return 0;
> +
> +#ifdef CONFIG_KEXEC_CORE
> +	/*
> +	 * TODO: Information on memory acceptance status has to be communicated
> +	 * between kernel.
> +	 */
> +	pr_warn("Disable kexec: not yet supported on systems with unaccepted memory\n");
> +	kexec_load_disabled = 1;
> +#endif

This looks to be the *only* in-kernel user tweaking kexec_load_disabled.
 It doesn't feel great to just be disabling kexec like this.  Why not
just fix it properly?

What do the kexec folks think?
