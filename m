Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261C2F48
	for <linux-coco@lists.linux.dev>; Mon, 12 Dec 2022 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670861416; x=1702397416;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CSivnj4EN1Y5ag/z4ECT81ZO0sOSCFPcf5f3ESOg+0c=;
  b=BZZAVN5s89GU4aLppUjTRsSWXyoH9C8CJ9nDHlTSdFEKB2e+T2ms8lXc
   bklMrlktP3OxYNNdJxxahv7PeSKIK85F0Uq7p65+iTrCSfqvARX5XJInY
   2ClJmioIZyBL9zGrBXrIGoh5b7P/wVMrAPEY8jQg/r+5MSaF3YwlM+OnK
   6IxJU8Se2OyFeuZ6gS6/AKo0QYAHRcxQfcOAE/S+VIQAOGpVVbUyBYxsN
   qde69Tnl7pATMcfu4KIAu/mnfMZTG6cmZksdr/pRniS3ZGb8uE3Qc2GOy
   7EP4E2vn+WBUhjTfF3FyoIA2epxia/geVv/3J5/60J3g/RjkMrevEqnqm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="305534534"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="305534534"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 08:10:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="790546298"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="790546298"
Received: from iprasad-mobl.amr.corp.intel.com (HELO [10.212.182.78]) ([10.212.182.78])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 08:10:14 -0800
Message-ID: <e13331b2-a68c-c823-d02f-ba50949214cb@intel.com>
Date: Mon, 12 Dec 2022 08:10:14 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] x86/tdx: Use ReportFatalError to report missing
 SEPT_VE_DISABLE
Content-Language: en-US
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
 <20221209132524.20200-3-kirill.shutemov@linux.intel.com>
 <e79c4b97-5718-9a60-406f-1df994ba089c@linux.intel.com>
 <20221209170647.r32yjyc3hsqtnffo@box.shutemov.name>
 <2e305bb5-9595-3531-6134-24344ff5c797@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <2e305bb5-9595-3531-6134-24344ff5c797@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/9/22 12:51, Sathyanarayanan Kuppuswamy wrote:
>>>> +	while (1) {
>>>> +		__tdx_hypercall(&args, 0);
>>>> +	}
>>> Instead of an infinite loop, I'm wondering if the guest should panic after
>>> retrying for few times.
>> Hm. What difference would it make?
> IIUC, the goal of this patch is to report the fatal error to VMM and panic.
> But, if VMM does not terminate the guest as we expect, rather than trying 
> continuously, isn't it better to panic ourselves? That way the behavior
> will be similar to what we have currently.

What does "panic ourselves" mean exactly?  What is the current behavior
which that would match?

