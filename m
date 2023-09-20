Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7A71A583
	for <linux-coco@lists.linux.dev>; Wed, 20 Sep 2023 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695233330; x=1726769330;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+v3bN4jZAuS5dnJ4c3CbLpISfxHCdKuf8qMN+4iFJNg=;
  b=mI9QB9QUx0Qvf9rtltbpZH1I/G1gP2fRBxVwb4M9mODcFhR/ZY0BKLNA
   EkFJ35GLDyQnRpB+WwC4Ug0UR1JMyoVcLL1YcQlGX8mRXJRa763w4u2R9
   24hHCjWK9+mVwRiTfjMwaEDlYhQGcG0G2jsllO1PSEECh4iFFaiDkb2kh
   AlNFuGzMdhtM9r4WiJg2t0y4XMgQioVPpFd6PYASiWpf2bzFojID+IXRA
   lMZwOTiEquK5XBQpPj/IMuejCtz2UdKTlxj4P7nFQ3tcz0hxmrMpZDF34
   4SoaYyHpRPiPJGjr6BcK+6P8XL/j2lJItnQSTFmZKj4L5brhHjH36XrtC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359684994"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="359684994"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 11:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993713790"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="993713790"
Received: from pkmanna-mobl3.amr.corp.intel.com (HELO [10.209.53.192]) ([10.209.53.192])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 11:08:48 -0700
Message-ID: <f56b6e51-d2b6-49b3-a3e0-a9d9c90019c5@linux.intel.com>
Date: Wed, 20 Sep 2023 11:08:49 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virt: tdx-guest: Add Quote generation support using
 TSM_REPORTS
Content-Language: en-US
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, Wander Lairson Costa <wander@redhat.com>,
 Erdem Aktas <erdemaktas@google.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>, Qinkun Bao
 <qinkun@apache.org>, Guorui Yu <GuoRui.Yu@linux.alibaba.com>,
 linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20230914031349.23516-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20230920131633.ig6ldmwavpu7uhss@box.shutemov.name>
 <0031e031-10a8-43b1-a29c-8e1cf913eaad@linux.intel.com>
 <20230920175248.6foe67cwfe5oaa7u@box.shutemov.name>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230920175248.6foe67cwfe5oaa7u@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/20/2023 10:52 AM, Kirill A . Shutemov wrote:
> On Wed, Sep 20, 2023 at 08:27:39AM -0700, Kuppuswamy Sathyanarayanan wrote:
>>
>>
>> On 9/20/2023 6:16 AM, Kirill A . Shutemov wrote:
>>>> +static u8 *tdx_report_new(const struct tsm_desc *desc, void *data, size_t *outblob_len)
>>>> +{
>>>> +	struct tdx_quote_buf *quote_buf = quote_data;
>>>> +	int ret;
>>>> +	u8 *buf;
>>>> +	u64 err;
>>>> +
>>>> +	if (mutex_lock_interruptible(&quote_lock))
>>>> +		return ERR_PTR(-EINTR);
>>>> +
>>>> +	/*
>>>> +	 * If the previous request is timedout or interrupted, and the
>>>> +	 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
>>>> +	 * VMM), don't permit any new request.
>>>> +	 */
>>>> +	if (quote_buf->status == GET_QUOTE_IN_FLIGHT) {
>>>> +		ret = -EBUSY;
>>>> +		goto done;
>>>> +	}
>>>> +
>>>> +	if (desc->inblob_len != TDX_REPORTDATA_LEN) {
>>>> +		ret = -EINVAL;
>>>> +		goto done;
>>>> +	}
>>>> +
>>>> +	/* TDX attestation only supports default format request */
>>>> +	if (desc->outblob_format != TSM_FORMAT_DEFAULT) {
>>>> +		ret = -EINVAL;
>>>> +		goto done;
>>>> +	}
>>>> +
>>>> +	u8 *reportdata __free(kfree) = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
>>> __free() is new to me. Good to know.
>>>
>>> But are we okay now with declaring variables in the middle of the
>>> function? Any reason we can't do at the top?
>>
>> Declaring variables at the top is no longer a hard requirement. The main reason
>> for declaring it here is to use __free cleanup function. If we use top
>> declaration, then we have free it manually.
> 
> What's wrong with allocating it it there too?

My thinking is to allocate it when we really need it. We only need this memory if the
GetQuote hypercall is successful. We can also allocate it at the top and there is
nothing wrong with it, but it will not be used in failure cases. Since top declarations
are not a requirement, why allocate it early? 


> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
