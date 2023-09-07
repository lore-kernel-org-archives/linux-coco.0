Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A920FA
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694081199; x=1725617199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XrtgQdDTZL5BjJSbu5lQThCpM5CmzSeBRvH2o+zR2m0=;
  b=P/1VCPDR+RMTYcLbcAW4J9X758mapHnEJLbW4lYY9csEqGA1jp9m/gK2
   O7lnzsO3AFL5rReezTJJUBRhx6g9cpksluq+LLtex71t+G7vNLXm4c5TW
   eLLE1/e37n+aaMyA0GVMqADrpVmj8wkW4KYvNOqTvzZRLECPeRYyXgy9A
   NYbowML5lB5rvxye+/ooPeSl4bCh3bQ+yKcY+Ep8D4a8UKk5Zv1z+KZl1
   40PkxJ47y1SsFnDu58gqp8lzoMXAMM9qfbnQTUqiGv5h5MTQqpEPN4w2N
   LNsiJQxi55B7SylfoI8e4OUcRmkwQPuCFeMaoGEpDoDH7aK8v2TENQRfb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380029838"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="380029838"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 03:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718649065"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="718649065"
Received: from rbhaumik-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.44.38])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 03:06:17 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 0691D1042C5; Thu,  7 Sep 2023 13:06:15 +0300 (+03)
Date: Thu, 7 Sep 2023 13:06:14 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH 3/3] /dev/mem: Do not map unaccepted memory
Message-ID: <20230907100614.35mxxo63xwkz7ohw@box.shutemov.name>
References: <20230906073902.4229-1-adrian.hunter@intel.com>
 <20230906073902.4229-4-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906073902.4229-4-adrian.hunter@intel.com>

On Wed, Sep 06, 2023 at 10:39:02AM +0300, Adrian Hunter wrote:
> Support for unaccepted memory was added recently, refer commit
> dcdfdd40fa82 ("mm: Add support for unaccepted memory"), whereby
> a virtual machine may need to accept memory before it can be used.
> 
> Do not map unaccepted memory because it can cause the guest to fail.
> 
> For /dev/mem, this means a read of unaccepted memory will return zeros,
> a write to unaccepted memory will be ignored, but an mmap of unaccepted
> memory will return an error.

I am unsure who currently uses /dev/mem. The change to the mmap path has the
potential to cause issues as it is a new behavior. However, it appears to
be a common practice as we also fail to mmap if PAT is set on a page in
the rang. I suppose it is acceptable.

Another option is to accept the memory on mmap, but it seems excessive at
this point.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
