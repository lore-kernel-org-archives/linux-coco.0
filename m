Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4732E1B7C3
	for <linux-coco@lists.linux.dev>; Tue,  8 Aug 2023 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691514787; x=1723050787;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mhUr+URDNngCOROwuc7a7eHBnzo84/kxXYPI0jAI72U=;
  b=Y27m2KoIT4ONPziVS62/kkToeRcYnew9Q8WRXBd+mtfwkNheUhTvlctj
   5NeXZXUEdYp9NuO6wHHc8wOLCq5WjDf1SrtJQWHhglX9QL+9v2PJSrP/b
   DYXjVAFLDB/4X3T99VDVzLWYpSeLYCINlyTsNDZkQHCN0knW++PwLBaJY
   iNFGCTktTyVZizf5/3/Y8X8FK59LyXPKMA4Ak2lmdmKbfib7xSfzCZ8P4
   7JdAxWecNy1N6Si963jcR29GacNsTnLIy8tYrrvobJBvdphKW/NARp2ra
   3XHRHNbGRvzwEkbr+ru6uQe7H4rzksHdi9CANdJqWAz12KWyxA4gzRE7R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368347648"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="368347648"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 10:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="874829818"
Received: from mdaugher-mobl.amr.corp.intel.com (HELO [10.212.220.28]) ([10.212.220.28])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 10:13:07 -0700
Message-ID: <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com>
Date: Tue, 8 Aug 2023 10:13:05 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/8/23 09:23, Kirill A. Shutemov wrote:
...
> On the other hand, other clock sources (such as HPET, ACPI timer,
> APIC, etc.) necessitate VM exits to implement, resulting in more 
> fluctuating measurements compared to TSC. Thus, those clock sources
> are not effective for calibrating TSC.

Do we need to do anything to _those_ to mark them as slightly stinky?

> In TD guests, TSC is virtualized by the TDX module, which ensures:
> 
>   - Virtual TSC values are consistent among all the TD’s VCPUs;
>   - Monotonously incrementing for any single VCPU;
>   - The frequency is determined by TD configuration. The host TSC is
>     invariant on platforms where TDX is available.

I take it this is carved in stone in the TDX specs somewhere.  A
reference would be nice.

We've got VMWare and Hyper-V code basically doing the same thing today.
So TDX is in kinda good company.  But this still makes me rather
nervous.  Do you have any encouraging words about how unlikely future
hardware is to screw this up, especially as TDX-supporting hardware gets
more diverse?
