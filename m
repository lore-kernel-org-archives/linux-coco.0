Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F0539A
	for <linux-coco@lists.linux.dev>; Tue,  9 Jan 2024 02:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A380N5Qp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704766405; x=1736302405;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S16dZSYSD8JxakXAS0cZKE0iPxHFFF0NX2jEycWWeOI=;
  b=A380N5QpfP0BE2pK7v+2/hRTWTj3SYo4y4K1h3bboQlrXtMviLoykM1W
   ONINa+V1uvqvCZiypU2Q8gx+t3SGCuqmmwKNs4kCZFJVmw48c9C0eD3Xp
   5dJG3KouoRrDzxISFGjRtGWXAeGa59AJ1Obd8CA8hsU3888ctt+jeHz60
   GmBkPVo3DQ02FAA8LEd47i7NHuz1oEQWqN20siMptWRCmkripyo2VP3Vk
   UjWXXgbQphYFlBaepx15NK1RwO/veJ/79eY2mKsBVQWMzACpXidC3tuHc
   kfWmz3aUfv01pMGtQaq9BoLJVnnUKvRuI0OESa2/lTdAXMROjOUAns+Or
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11410253"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="11410253"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 18:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="29996511"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.22.149]) ([10.93.22.149])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 18:13:21 -0800
Message-ID: <1740f18b-715c-4d48-97f5-c486580cc06b@intel.com>
Date: Tue, 9 Jan 2024 10:13:16 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] virt: tdx-guest: Add Quote generation support
 using TSM_REPORTS
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Erdem Aktas <erdemaktas@google.com>, Peter Gonda <pgonda@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, peterz@infradead.org,
 dave.hansen@linux.intel.com, x86@kernel.org
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
 <169776462726.1705513.6571107715919082569.stgit@dwillia2-xfh.jf.intel.com>
 <b8cfb05b-bf39-4573-b31b-ef4671d9c6ff@intel.com>
 <6bdf569c-684a-4459-af7c-4430691804eb@linux.intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <6bdf569c-684a-4459-af7c-4430691804eb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/8/2024 10:55 AM, Kuppuswamy Sathyanarayanan wrote:
> 
> 
> On 12/20/2023 5:50 PM, Xiaoyao Li wrote:
>> On 10/20/2023 9:17 AM, Dan Williams wrote:
>>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> ...
>>> +static int tdx_report_new(struct tsm_report *report, void *data)
>>> +{
>>> +    u8 *buf, *reportdata = NULL, *tdreport = NULL;
>>> +    struct tdx_quote_buf *quote_buf = quote_data;
>>> +    struct tsm_desc *desc = &report->desc;
>>> +    int ret;
>>> +    u64 err;
>>> +
>>> +    /* TODO: switch to guard(mutex_intr) */
>>> +    if (mutex_lock_interruptible(&quote_lock))
>>> +        return -EINTR;
>>> +
>>> +    /*
>>> +     * If the previous request is timedout or interrupted, and the
>>> +     * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
>>> +     * VMM), don't permit any new request.
>>> +     */
>>> +    if (quote_buf->status == GET_QUOTE_IN_FLIGHT) {
>>> +        ret = -EBUSY;
>>> +        goto done;
>>> +    }
>>> +
>>> +    if (desc->inblob_len != TDX_REPORTDATA_LEN) {
>>> +        ret = -EINVAL;
>>> +        goto done;
>>> +    }
>>> +
>>> +    reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
>>> +    if (!reportdata) {
>>> +        ret = -ENOMEM;
>>> +        goto done;
>>> +    }
>>> +
>>> +    tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
>>> +    if (!tdreport) {
>>> +        ret = -ENOMEM;
>>> +        goto done;
>>> +    }
>>> +
>>> +    memcpy(reportdata, desc->inblob, desc->inblob_len);
>>> +
>>> +    /* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
>>> +    ret = tdx_mcall_get_report0(reportdata, tdreport);
>>> +    if (ret) {
>>> +        pr_err("GetReport call failed\n");
>>> +        goto done;
>>> +    }
>>> +
>>> +    memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
>>> +
>>> +    /* Update Quote buffer header */
>>> +    quote_buf->version = GET_QUOTE_CMD_VER;
>>> +    quote_buf->in_len = TDX_REPORT_LEN;
>>> +
>>> +    memcpy(quote_buf->data, tdreport, TDX_REPORT_LEN);
>>> +
>>> +    err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
>>> +    if (err) {
>>> +        pr_err("GetQuote hypercall failed, status:%llx\n", err);
>>> +        ret = -EIO;
>>> +        goto done;
>>> +    }
>>> +
>>> +    ret = wait_for_quote_completion(quote_buf, getquote_timeout);
>>> +    if (ret) {
>>> +        pr_err("GetQuote request timedout\n");
>>> +        goto done;
>>> +    }
>>
>> Sorry that I didn't check the previous discussion and don't know if it is by design or not:
>>
>> Why don't check the quote_buf->status? If it indicates errors, we should return some error code instead, right?
> 
> For the failed request, outblob_len will be zero and the empty output can be
> treated as failed request. But I agree that it makes sense to return error
> for the failed request. I can submit a patch for it. Something like below:
> 
> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
> @@ -33,6 +33,8 @@
> 
>   /* TDX GetQuote status codes */
>   #define GET_QUOTE_SUCCESS              0
> +#define GET_QUOTE_ERROR                        0x8000000000000000
> +#define GET_QUOTE_SERVICE_UNAVAILABLE  0x8000000000000001

they get defined but not used.

>   #define GET_QUOTE_IN_FLIGHT            0xffffffffffffffff
> 
>   /* struct tdx_quote_buf: Format of Quote request buffer.
> @@ -228,6 +230,12 @@ static int tdx_report_new(struct tsm_report *report, void *data)
>                  goto done;
>          }
> 
> +       if (quote_buf->status != GET_QUOTE_SUCCESS) {
> +               pr_err("GetQuote request failed, ret %llx\n", quote_buf->status);
> +               ret = -EIO;
> +               goto done;
> +       }
> +

Besides above, looks good to me.

> 
>>
>>> +    buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
>>> +    if (!buf) {
>>> +        ret = -ENOMEM;
>>> +        goto done;
>>> +    }
>>> +
>>> +    report->outblob = buf;
>>> +    report->outblob_len = quote_buf->out_len;
>>> +
>>> +    /*
>>> +     * TODO: parse the PEM-formatted cert chain out of the quote buffer when
>>> +     * provided
>>> +     */
>>> +done:
>>> +    mutex_unlock(&quote_lock);
>>> +    kfree(reportdata);
>>> +    kfree(tdreport);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>
> 

