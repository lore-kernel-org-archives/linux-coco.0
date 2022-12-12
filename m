Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64562F28
	for <linux-coco@lists.linux.dev>; Mon, 12 Dec 2022 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670863030; x=1702399030;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9m98shoiHRD8thtXOIoPpIhyXXaG4Y2A8foSH8f3lII=;
  b=l4kCfFPU4q/cwMqGAx35+59Id5JXmwHcJ7Fl+5m6QyC4ALW1iUMWl8sh
   4yS1uHnCRnHnUufK/Wj940nbWDb67iUA04D9VSM7LXfn9OLqCXcshAkIU
   4N+74RgRylU7+LzE4++aQgGONvA2owLo+Bbsj4bTu7ssps2YanNv5fCDO
   WQe836c8aj6Qb5XUsP9/54goV0ZLTugLrngGSUOoFC0GZJdDopaRDfstU
   aiVdn5yAGrLMSfU1EHn7hpV5xA/VGvIiwjsKGzTGZP4lLO6WtWgyOYuWa
   LO8/6maCdUd8pqVI9FccFz119KTDiOkegr0tOxiuzCSkPEh909nIp//6N
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="317929848"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="317929848"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 08:37:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="822545833"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="822545833"
Received: from vasanth1-mobl.amr.corp.intel.com (HELO [10.251.4.160]) ([10.251.4.160])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 08:37:09 -0800
Message-ID: <f1937bd1-0400-608d-3cda-b9597c0e4393@linux.intel.com>
Date: Mon, 12 Dec 2022 08:37:09 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] x86/tdx: Use ReportFatalError to report missing
 SEPT_VE_DISABLE
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>,
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
 <e13331b2-a68c-c823-d02f-ba50949214cb@intel.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <e13331b2-a68c-c823-d02f-ba50949214cb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/12/22 8:10 AM, Dave Hansen wrote:
> On 12/9/22 12:51, Sathyanarayanan Kuppuswamy wrote:
>>>>> +	while (1) {
>>>>> +		__tdx_hypercall(&args, 0);
>>>>> +	}
>>>> Instead of an infinite loop, I'm wondering if the guest should panic after
>>>> retrying for few times.
>>> Hm. What difference would it make?
>> IIUC, the goal of this patch is to report the fatal error to VMM and panic.
>> But, if VMM does not terminate the guest as we expect, rather than trying 
>> continuously, isn't it better to panic ourselves? That way the behavior
>> will be similar to what we have currently.
> 
> What does "panic ourselves" mean exactly?  What is the current behavior
> which that would match?

I meant directly calling panic(). Before this patch, if the SEPT VE DISABLE
attribute was not set, we would call panic(). In this patch, we try to report
the error to VMM and wait for it to terminate the guest in the same case.
But after reporting the error, if VMM does not terminate the guest as expected,
I thought instead of retrying continuously, we can call panic() directly after
some retries. 


> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
