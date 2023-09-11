Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD0A188
	for <linux-coco@lists.linux.dev>; Mon, 11 Sep 2023 00:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694391013; x=1725927013;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rs2RXPgE6FibMswDpiAFeGDRmtHImZ+Q9AaGonFjS3M=;
  b=OE+/GlObtRADx+bdep8AwrjVddmKoT29PRd7UFw0MbLdOzgAU5dT9UGC
   81n/xwXR+fsT7jledW/F1mC24eDHcQKo78n91SaVAy+Kp/fNp0+/ILXe7
   7KtY+9E/FT1bkrYd1LQGsAIxvuqiYGS3E2ScVKzkSkHl4iWQeQ62fT07q
   JlQmDchmomeCug5lrBFbJGD59Yy2eCqOIz3WMPwIHQ7ZpAddI1W8QAHE6
   pUFaWjwJDiRgs5CxMgDHnDsgEif6eFIVZ0MlGTZ+ImEPhslSSHJUOjRwY
   gJGPEn9vCq2k71RpmjRi2fDi3UE+SKvTa59dq5xWIznwW1gQnj8/223bj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="464332746"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="464332746"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 17:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="813180999"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="813180999"
Received: from rmanijac-mobl.amr.corp.intel.com (HELO [10.209.66.44]) ([10.209.66.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 17:10:11 -0700
Message-ID: <2371c186-ccd4-48c7-b302-e289adb30dec@linux.intel.com>
Date: Sun, 10 Sep 2023 17:10:10 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virt: tdx-guest: Add Quote generation support using
 TSM_REPORTS
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, "Huang, Kai"
 <kai.huang@intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "Yu, Guorui" <guorui.yu@linux.alibaba.com>,
 "qinkun@apache.org" <qinkun@apache.org>,
 "wander@redhat.com" <wander@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "Aktas, Erdem" <erdemaktas@google.com>, "Luck, Tony" <tony.luck@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "dionnaglaze@google.com" <dionnaglaze@google.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <20230907025405.2310931-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <da4a6c3f4cb9118e10866cb1d624ad5ec5c96d7d.camel@intel.com>
 <64fb499862936_7318294a0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <64fb499862936_7318294a0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/8/2023 9:19 AM, Dan Williams wrote:
>>> Changes since previous version:
>>> * Used ConfigFS interface instead of IOCTL interface.
>>> * Used polling model for Quote generation and dropped the event notification IRQ support.
>> Can you elaborate why the notification IRQ is dropped?
> Because it was a pile of hacks and non-idiomatic complexity. It can come
> back when / if driver code can treat it like a typical interrupt.

Currently, the VMM assumes that the vCPU that executes the TDG.VP.VMCALL
<SetupEventNotifyInterrupt> hypercall as the target vCPU for event
notification IRQ. To satisfy this assumption, the guest driver that uses
this hypercall/IRQ had to include CPU/IRQ affinity related code changes. This
adds unnecessary complication to the guest driver code without any real
ARCH need or benefit. So we want to modify the GHCI ABI to let TD guest pass
the target CPU as an argument. With this change, we can hide the IRQ related
configuration in the IRQ chip code and let the guest driver treat the
event notification IRQ as a regular interrupt.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
