Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B46AA5
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694096145; x=1725632145;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Urz8J26AUOtbbaftdYy1+eG3zzf8pqaVITlpJ9CGDIc=;
  b=ZiqR/51zhPPA7MPn2xlSCXLekZj4TNsawMx4VpphnXb/SHh3FeHRCXKO
   SPz4IyKHE/a38HrSElt4nKlTZPG5tu7GZHwMXkMkYbgwiPu8hOREQgawI
   GE/k6hurHKeG5M98FuwQeZWwHOhug941elMYnOJOYsJU2ZvtRs84rYe06
   RBVYHl2+WpDpQr+QRTp6WhHrFBxcbxPeGwLrXBjhla1XwrfyyDKjU8d+9
   73vkrSxUWiaOKxpKie2KjeX9x1eBhAhqY5H/anbvtFnsdzSLq5ded5qgj
   s6/fQpJsY/3Nuqk+u5V/7llGovKuWofG3i2wG5M1gx5gYLb7T+Khud1Xd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357676560"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357676560"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="735516999"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="735516999"
Received: from ningle-mobl2.amr.corp.intel.com (HELO [10.209.13.77]) ([10.209.13.77])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:15:21 -0700
Message-ID: <9ffb7a3b-cf20-617a-e4f1-8a6a8a2c5972@intel.com>
Date: Thu, 7 Sep 2023 07:15:21 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] /dev/mem: Do not map unaccepted memory
Content-Language: en-US
To: Adrian Hunter <adrian.hunter@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@linux.ibm.com>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 kexec@lists.infradead.org
References: <20230906073902.4229-1-adrian.hunter@intel.com>
 <20230906073902.4229-4-adrian.hunter@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230906073902.4229-4-adrian.hunter@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/23 00:39, Adrian Hunter wrote:
> Support for unaccepted memory was added recently, refer commit
> dcdfdd40fa82 ("mm: Add support for unaccepted memory"), whereby
> a virtual machine may need to accept memory before it can be used.
> 
> Do not map unaccepted memory because it can cause the guest to fail.

Doesn't /dev/mem already provide a billion ways for someone to shoot
themselves in the foot?  TDX seems to have added the 1,000,000,001st.
Is this really worth patching?
