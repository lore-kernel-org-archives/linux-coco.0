Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B774F173
	for <linux-coco@lists.linux.dev>; Wed,  5 Jan 2022 20:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641414433; x=1672950433;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FSFWIc4HSv9YdqR3Ma1IzBH4Anr1q7MqPqL/vrhT98M=;
  b=aEPxLExPm/IZ+P/TW+MIlVnofNj2CyEatYbgRstmFVxXU7oKzZktTvH+
   3kSOZuACxDdQ3g604NymEDI9a/Ods7ZER90MI6Oow3EYSRFPFG0sTMBQT
   pkcikQT+CvYSHTdYlNqsqq4q3X59534wfJb9i5KKdF7vLn+iFuA7Nqk8t
   9Npjiax1DaQPd9yCSR5o8azJsWfwGBYeHlFlXfeGG3gzG3rFc2vc5n1/c
   YwoQJFEmS2Z/IdGNqgeWqYZgEhu+ndO5h5n0Pi1xO7IIvZokXfal0PBCI
   dlmSZUjtQbpm0r05z4xDTvVayeyr/lOVmSvyaik7qTxOmVILz3PKT8sGL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="303281904"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="303281904"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 12:27:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="760939957"
Received: from njvora-mobl.amr.corp.intel.com (HELO [10.212.154.74]) ([10.212.154.74])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 12:27:10 -0800
Message-ID: <acba0832-9b11-c93d-7903-fff33f740605@intel.com>
Date: Wed, 5 Jan 2022 12:27:08 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v8 13/40] x86/kernel: Make the bss.decrypted section
 shared in RMP table
Content-Language: en-US
To: Brijesh Singh <brijesh.singh@amd.com>,
 Venu Busireddy <venu.busireddy@oracle.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Joerg Roedel <jroedel@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>,
 Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>,
 Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen
 <ak@linux.intel.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 tony.luck@intel.com, marcorr@google.com,
 sathyanarayanan.kuppuswamy@linux.intel.com
References: <20211210154332.11526-1-brijesh.singh@amd.com>
 <20211210154332.11526-14-brijesh.singh@amd.com> <YdSKQKSTS83cRzGZ@dt>
 <18eadf9d-8e31-0945-ccf4-2cb72b8e0dd4@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <18eadf9d-8e31-0945-ccf4-2cb72b8e0dd4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/5/22 11:52, Brijesh Singh wrote:
>>>           for (; vaddr < vaddr_end; vaddr += PMD_SIZE) {
>>> +            /*
>>> +             * When SEV-SNP is active then transition the page to shared in the RMP
>>> +             * table so that it is consistent with the page table attribute change.
>>> +             */
>>> +            early_snp_set_memory_shared(__pa(vaddr), __pa(vaddr), PTRS_PER_PMD);
>>
>> Shouldn't the first argument be vaddr as below?
> 
> Nope, sme_postprocess_startup() is called while we are fixing the 
> initial page table and running with identity mapping (so va == pa).

I'm not sure I've ever seen a line of code that wanted a comment so badly.
