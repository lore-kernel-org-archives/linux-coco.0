Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DA91869
	for <linux-coco@lists.linux.dev>; Wed, 22 Jun 2022 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655922546; x=1687458546;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BRzTC2ut2r56R1WtccznIDmkHwKaDpfAh5dNdlDBT60=;
  b=D6CfGM8LuJXq0cQZNPnx88nA3sXnsnzMp/lIRH0bZu6Hv12lwRZWGMrr
   nsVUc4vggvFw/j86CmJU4IFApX3Ap5ZJdBj1soFxtRHxxgwxG7/4t8i+z
   blEyqeWvD4EmN2J3ejkMtifymw4fYziRFYCTlrW9zb1JEvxVfpLZA/n/r
   iHibvDxspcp4YdvNtdSzgjGybPawLIhI1IrjyIt6irEw/+oazgm2S3PXd
   tgAjkmXr9in30nCJpvzyA0hUR/8cqTD9Zi/JfzEPvqVkYssGMF6oKuOwO
   9qShYogakUYrIGfD/ybhJvkmY+6AWYs49WOlzTfdFLs4KXViIR8w9bZzp
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="344496820"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="344496820"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 11:18:10 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="677681186"
Received: from bshakya-mobl.amr.corp.intel.com (HELO [10.212.188.76]) ([10.212.188.76])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 11:18:08 -0700
Message-ID: <681e4e45-eff1-600c-9b81-1fa9bdf24232@intel.com>
Date: Wed, 22 Jun 2022 11:17:49 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH Part2 v6 05/49] x86/sev: Add RMP entry lookup helpers
Content-Language: en-US
To: "Kalra, Ashish" <Ashish.Kalra@amd.com>, "x86@kernel.org"
 <x86@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "jroedel@suse.de" <jroedel@suse.de>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "hpa@zytor.com"
 <hpa@zytor.com>, "ardb@kernel.org" <ardb@kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "slp@redhat.com" <slp@redhat.com>, "pgonda@google.com" <pgonda@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
 "tobin@ibm.com" <tobin@ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "Roth, Michael" <Michael.Roth@amd.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "marcorr@google.com" <marcorr@google.com>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "alpergun@google.com" <alpergun@google.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "jarkko@kernel.org" <jarkko@kernel.org>
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <8f63961f00fd170ba0e561f499292175f3155d26.1655761627.git.ashish.kalra@amd.com>
 <cc0c6bd1-a1e3-82ee-8148-040be21cad5c@intel.com>
 <BYAPR12MB2759A8F48D6D68EE879EEF648EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
 <25be3068-be13-a451-86d4-ff4cc12ddb23@intel.com>
 <BYAPR12MB27599BCEA9F692E173911C3B8EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <BYAPR12MB27599BCEA9F692E173911C3B8EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/22 11:15, Kalra, Ashish wrote:
> So actually this RPM entry definition is platform dependent and will
> need to be changed for different AMD processors and that change has
> to be handled correspondingly in the dump_rmpentry() code.

So, if the RMP entry format changes in future processors, how do we make
sure that the kernel does not try to use *this* code on those processors?
