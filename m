Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93B323B
	for <linux-coco@lists.linux.dev>; Tue, 13 Dec 2022 22:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670971469; x=1702507469;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c+9YkiDCKG1HcuHGaSW/UZ3+yOPPib+maJicYy8Yu2w=;
  b=UW0gxbZg0rvG3OttJ0mueJyrQmtZr7c8sLEk5M84BgxlaVZAAaPcEe+c
   RYeZY8tKZmkfdJxxJS/XSIghzGUw2+iZr5Lnl+MGjc7pxp1WdrqAem9Wc
   z7tLXaZswS65hqHoF+Qn/zRF3hzTzn+Aks8+WV4Lj8vdG/DGZLAU1dgqT
   jF0/IywZtxob97WA8e7c6MBJZ5FMYkSS/kZkaSuE93F+pKlRpqzMuQ5Yh
   a54j5l8vKwJOr3+6gokYGkTbnQhmoXYOIyRBPebdVMcI1nJ2xQCmq9unu
   acGOhDpX4nkj08Ah26vhXJJF9k33fdh9dMYtHj8Mb/rd4HGSHoO+Y/H9u
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="380463008"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="380463008"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 14:44:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="977595516"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="977595516"
Received: from snjones-mobl1.amr.corp.intel.com (HELO [10.212.218.27]) ([10.212.218.27])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 14:44:27 -0800
Message-ID: <7d2a1ae7-56cf-a83d-4883-b2f8631a5e3d@intel.com>
Date: Tue, 13 Dec 2022 14:44:27 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] x86/tdx: Expand __tdx_hypercall() to handle more
 arguments
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
 <20221209132524.20200-2-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221209132524.20200-2-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/9/22 05:25, Kirill A. Shutemov wrote:
> So far __tdx_hypercall() only handles six arguments for VMCALL.
> Expanding it to six more register would allow to cover more use-cases.

like...

> Using RDI and RSI as VMCALL arguments requires more register shuffling.
> RAX is used to hold tdx_hypercall_args pointer and RBP stores flags.
> 
> While there, fix typo in the comment on panic branch.

This isn't the world's largest patch, but it doing at least three or
four different logical things.  Ideally, you'd do the restructuring in a
couple of patches and then the last one would just add the six new
registers.

Could you take 20 minutes and see if you can break this down into three
or four patches?

It looks _ok_.  I'd almost ack it as-is, but it should be pretty simple
to break down.

