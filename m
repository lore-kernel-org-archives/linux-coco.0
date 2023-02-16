Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C07A6FD6
	for <linux-coco@lists.linux.dev>; Thu, 16 Feb 2023 17:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676569841; x=1708105841;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u0+P41I+U7P6oEkW9H2fAtZW+9aVP335JS7RgNi8h70=;
  b=JYGyNqlIunELir5L2gXMBmsXaAlLv11+jGH4BkId7eQd4KYP/F7hluhw
   xvCyFUea3A1INnRXYvsZkD7ldhUlWQF/vABk5owF5ozKYr8vsUL5SkaRZ
   kfGLTbmmFl6dp9tsMnUOEMbx2arE1A+nzo2T88sVc+yAm7MM1d+LwTj5O
   L7cT9qJGe4SeyNrUH7IlJybgmF0hquxl5erJLW7Qxt78rlGJ+bm3dxijw
   UWzsg2pMrBf6QzRe3IokTPyMdSkwOLJgwg2rPYkc3/vpj6jduBNw2wIgw
   Hml8f+whYrw/ooUvwurPwDBkzxj9M+PhDS/Hhp0dcWil9OqPHOclyBIyV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331784594"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="331784594"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 09:50:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813047050"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="813047050"
Received: from bjelliot-mobl1.amr.corp.intel.com (HELO [10.209.100.192]) ([10.209.100.192])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 09:50:32 -0800
Message-ID: <65fc95bb-5ad9-b589-d6a4-762289b3f6bc@intel.com>
Date: Thu, 16 Feb 2023 09:50:32 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] Kexec enabling in TDX guest
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Isaku Yamahata <isaku.yamahata@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230213234836.3683-1-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230213234836.3683-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/13/23 15:48, Kirill A. Shutemov wrote:
> The patch brings basic enabling of kexec in TDX guests.
> 
> By "basic enabling" I mean, kexec in the guests with a single CPU.
> TDX guests use ACPI MADT MPWK to bring up secondary CPUs. The mechanism
> doesn't allow to put a CPU back offline if it has woken up.
> 
> We are looking into this, but it might take time.

This is simple enough.  But, nobody will _actually_ use this code as-is,
right?  What's the point of applying it now?
