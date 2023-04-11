Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666B944C
	for <linux-coco@lists.linux.dev>; Tue, 11 Apr 2023 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681237659; x=1712773659;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1QioC9Kxlkpc1XJQphVkupGM3XmsH0QP9DjCNhRYggY=;
  b=NeOMQ4x4tONKPwTfJB200zzZhDgGDeI9EsvSc7tET10k4sju2P+Jwso5
   XcVBfzAZbYthQunwcXwwhARnJ/H5Xt+sytBgEjh941ibwbkAbqc8mYJFP
   GkgXLBeJvLtVRZKYbyhqRCnvjzKHwnWBVTti52yC/B0k7ndkzg/BF0f0J
   weNUTu+KFLNGOE1HhXka9YFH0GvEZEh9C0n8dy7zTIKge7jgQmmCUSXtJ
   wi6+tH0bc9N1Rg9CuUhmmT3YN1IhbzwA8DbqKbRZNR/gPr3Eixu5I49Et
   p02rS8oHXPhgk1avmRUGWasdZ/R60FtLwxmpFqfNGgu7zcJ6KBktvym+u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343708295"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="343708295"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 11:27:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="691265257"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="691265257"
Received: from gtryonx-mobl.amr.corp.intel.com (HELO [10.209.72.81]) ([10.209.72.81])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 11:27:36 -0700
Message-ID: <7fe765e1-88b5-7bf1-133c-4587224f1e7a@intel.com>
Date: Tue, 11 Apr 2023 11:27:35 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC v8 17/56] x86/fault: Add support to handle the RMP
 fault for user address
Content-Language: en-US
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
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
 ashish.kalra@amd.com, nikunj.dadhania@amd.com,
 Brijesh Singh <brijesh.singh@amd.com>,
 Jarkko Sakkinen <jarkko.sakkinen@profian.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
 <20230220183847.59159-18-michael.roth@amd.com>
 <a15fc9a5-c136-47f7-e15e-776a511f3cdb@intel.com>
 <20230328233101.4idfki7ulpyhxrwy@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230328233101.4idfki7ulpyhxrwy@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/28/23 16:31, Michael Roth wrote:
> However...
> 
> The fact that any pages potentially triggering these #PFs are able to be
> mapped as 2M in the first place means that all the PFNs covered by that
> 2M mapping must also been allocated by via mappable/VMA memory rather
> than via restricted memfd where userspace mappings are not possible.
> 
> So I think we should be able to drop this patch entirely, as well as
> allow the use of HugeTLBFS for non-restricted memfd memory (though
> eventually the guest will switch all its memory to private/restricted
> so not gaining much there other than reducing management complexity).

This is sounding a bit voodoo-ish to me.

If this whole series is predicated on having its memory supplied via one
very specific ABI with very specific behavior.

That connection and the associated contract isn't spelled out very
clearly in this series.  I'm sure it works on your machine and is clear
to _you_ but I'm worried that nobody else is going to be able to figure
out the voodoo.

Could we make sure that this stuff is made very clear in the
Documentation and cover letter, please?
