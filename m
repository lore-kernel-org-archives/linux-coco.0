Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C210E9
	for <linux-coco@lists.linux.dev>; Mon,  8 Jan 2024 02:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTNLX9s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704682550; x=1736218550;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A2hrujjt4wKdfCPxcdjPyji2qdghPUF2PnnPNi9bj9k=;
  b=iTNLX9s6tkauqisyE2mBAtcWn8YtVz7drLG/nx9XwlnZXLUfAzf0wVSk
   x8v1+XNW2eT9wA1tJ/6VYJMXyIy5l5nfxHrxhxoX25/o/LLk8wMmpY5gB
   +dPtqY5B2omKhjvCeBIP75+NuXZKqfnvvUI3QrD6h6+fHsRe6b1FWmVm/
   Vf08+gdC25JYOeiU07rqpODHoNPn9JCL+7VlTCBHfgF4Y4AwGNhwgZ/t3
   8iO/6d5C040Q8e6QQDjnvq2c8OpBYbOqxE9QKZmJZe5zftZoDjY7IjtiR
   YwnCQDUrxm4cTKtdGqZZp8v9WhKcXlkYCyh3a+7iCeMZBO1hdvJr4RjX7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4542342"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4542342"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 18:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="815472876"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="815472876"
Received: from xwu8-mobl1.amr.corp.intel.com (HELO [10.212.166.32]) ([10.212.166.32])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 18:55:48 -0800
Message-ID: <6bdf569c-684a-4459-af7c-4430691804eb@linux.intel.com>
Date: Sun, 7 Jan 2024 18:55:48 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] virt: tdx-guest: Add Quote generation support
 using TSM_REPORTS
Content-Language: en-US
To: Xiaoyao Li <xiaoyao.li@intel.com>, Dan Williams
 <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Erdem Aktas <erdemaktas@google.com>, Peter Gonda <pgonda@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, peterz@infradead.org,
 dave.hansen@linux.intel.com, x86@kernel.org
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
 <169776462726.1705513.6571107715919082569.stgit@dwillia2-xfh.jf.intel.com>
 <b8cfb05b-bf39-4573-b31b-ef4671d9c6ff@intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <b8cfb05b-bf39-4573-b31b-ef4671d9c6ff@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/20/2023 5:50 PM, Xiaoyao Li wrote:
> On 10/20/2023 9:17 AM, Dan Williams wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ...
>> +static int tdx_report_new(struct tsm_report *report, void *data)
>> +{
>> +    u8 *buf, *reportdata = NULL, *tdreport = NULL;
>> +    struct tdx_quote_buf *quote_buf = quote_data;
>> +    struct tsm_desc *desc = &report->desc;
>> +    int ret;
>> +    u64 err;
>> +
>> +    /* TODO: switch to guard(mutex_intr) */
>> +    if (mutex_lock_interruptible(&quote_lock))
>> +        return -EINTR;
>> +
>> +    /*
>> +     * If the previous request is timedout or interrupted, and the
>> +     * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
>> +     * VMM), don't permit any new request.
>> +     */
>> +    if (quote_buf->status == GET_QUOTE_IN_FLIGHT) {
>> +        ret = -EBUSY;
>> +        goto done;
>> +    }
>> +
>> +    if (desc->inblob_len != TDX_REPORTDATA_LEN) {
>> +        ret = -EINVAL;
>> +        goto done;
>> +    }
>> +
>> +    reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
>> +    if (!reportdata) {
>> +        ret = -ENOMEM;
>> +        goto done;
>> +    }
>> +
>> +    tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
>> +    if (!tdreport) {
>> +        ret = -ENOMEM;
>> +        goto done;
>> +    }
>> +
>> +    memcpy(reportdata, desc->inblob, desc->inblob_len);
>> +
>> +    /* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
>> +    ret = tdx_mcall_get_report0(reportdata, tdreport);
>> +    if (ret) {
>> +        pr_err("GetReport call failed\n");
>> +        goto done;
>> +    }
>> +
>> +    memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
>> +
>> +    /* Update Quote buffer header */
>> +    quote_buf->version = GET_QUOTE_CMD_VER;
>> +    quote_buf->in_len = TDX_REPORT_LEN;
>> +
>> +    memcpy(quote_buf->data, tdreport, TDX_REPORT_LEN);
>> +
>> +    err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
>> +    if (err) {
>> +        pr_err("GetQuote hypercall failed, status:%llx\n", err);
>> +        ret = -EIO;
>> +        goto done;
>> +    }
>> +
>> +    ret = wait_for_quote_completion(quote_buf, getquote_timeout);
>> +    if (ret) {
>> +        pr_err("GetQuote request timedout\n");
>> +        goto done;
>> +    }
> 
> Sorry that I didn't check the previous discussion and don't know if it is by design or not:
> 
> Why don't check the quote_buf->status? If it indicates errors, we should return some error code instead, right?

For the failed request, outblob_len will be zero and the empty output can be
treated as failed request. But I agree that it makes sense to return error
for the failed request. I can submit a patch for it. Something like below:

--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -33,6 +33,8 @@

 /* TDX GetQuote status codes */
 #define GET_QUOTE_SUCCESS              0
+#define GET_QUOTE_ERROR                        0x8000000000000000
+#define GET_QUOTE_SERVICE_UNAVAILABLE  0x8000000000000001
 #define GET_QUOTE_IN_FLIGHT            0xffffffffffffffff

 /* struct tdx_quote_buf: Format of Quote request buffer.
@@ -228,6 +230,12 @@ static int tdx_report_new(struct tsm_report *report, void *data)
                goto done;
        }

+       if (quote_buf->status != GET_QUOTE_SUCCESS) {
+               pr_err("GetQuote request failed, ret %llx\n", quote_buf->status);
+               ret = -EIO;
+               goto done;
+       }
+


> 
>> +    buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
>> +    if (!buf) {
>> +        ret = -ENOMEM;
>> +        goto done;
>> +    }
>> +
>> +    report->outblob = buf;
>> +    report->outblob_len = quote_buf->out_len;
>> +
>> +    /*
>> +     * TODO: parse the PEM-formatted cert chain out of the quote buffer when
>> +     * provided
>> +     */
>> +done:
>> +    mutex_unlock(&quote_lock);
>> +    kfree(reportdata);
>> +    kfree(tdreport);
>> +
>> +    return ret;
>> +}
>> +
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
