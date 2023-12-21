Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434D4685
	for <linux-coco@lists.linux.dev>; Thu, 21 Dec 2023 01:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILdODGhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703123447; x=1734659447;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2tuMQTLnpWNSaQU/lRbWgiKEXw5+wZidku5aPEemZcE=;
  b=ILdODGhwqh00CrloMlBHOVcwlR4M6dI31CV5d3airValekPZyyrms2cz
   6VboyzrZrrewptAOYEfE/KSdfSbkiPnflJCEdmnyl/6kK4nu9K/hjYJgS
   u9L0B7DiMiGoogdNowAfuCQeH9pF0DRbzgUYf+EEr09xCnuq2H9WQz5wx
   jLPjw16DVTgsirMZOpblxrX6V9mSBjfGOBSi9L3cgHtAavxZTlHih1zP5
   GzgPToiP88f9laT/SUxbG0hx+c7Dm748D/elIizU1aFgztoKraYto8lqR
   xuZxxWFVjEBm7RR0PW0498bvoDE9IpUnto3K3UZ1ph1EjVJIqE8/kmvJE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9287577"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="9287577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 17:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="18169222"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.12.199]) ([10.93.12.199])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 17:50:45 -0800
Message-ID: <b8cfb05b-bf39-4573-b31b-ef4671d9c6ff@intel.com>
Date: Thu, 21 Dec 2023 09:50:42 +0800
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
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Peter Gonda <pgonda@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, peterz@infradead.org,
 dave.hansen@linux.intel.com, x86@kernel.org
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
 <169776462726.1705513.6571107715919082569.stgit@dwillia2-xfh.jf.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <169776462726.1705513.6571107715919082569.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2023 9:17 AM, Dan Williams wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
...
> +static int tdx_report_new(struct tsm_report *report, void *data)
> +{
> +	u8 *buf, *reportdata = NULL, *tdreport = NULL;
> +	struct tdx_quote_buf *quote_buf = quote_data;
> +	struct tsm_desc *desc = &report->desc;
> +	int ret;
> +	u64 err;
> +
> +	/* TODO: switch to guard(mutex_intr) */
> +	if (mutex_lock_interruptible(&quote_lock))
> +		return -EINTR;
> +
> +	/*
> +	 * If the previous request is timedout or interrupted, and the
> +	 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
> +	 * VMM), don't permit any new request.
> +	 */
> +	if (quote_buf->status == GET_QUOTE_IN_FLIGHT) {
> +		ret = -EBUSY;
> +		goto done;
> +	}
> +
> +	if (desc->inblob_len != TDX_REPORTDATA_LEN) {
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
> +	if (!reportdata) {
> +		ret = -ENOMEM;
> +		goto done;
> +	}
> +
> +	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
> +	if (!tdreport) {
> +		ret = -ENOMEM;
> +		goto done;
> +	}
> +
> +	memcpy(reportdata, desc->inblob, desc->inblob_len);
> +
> +	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
> +	ret = tdx_mcall_get_report0(reportdata, tdreport);
> +	if (ret) {
> +		pr_err("GetReport call failed\n");
> +		goto done;
> +	}
> +
> +	memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
> +
> +	/* Update Quote buffer header */
> +	quote_buf->version = GET_QUOTE_CMD_VER;
> +	quote_buf->in_len = TDX_REPORT_LEN;
> +
> +	memcpy(quote_buf->data, tdreport, TDX_REPORT_LEN);
> +
> +	err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
> +	if (err) {
> +		pr_err("GetQuote hypercall failed, status:%llx\n", err);
> +		ret = -EIO;
> +		goto done;
> +	}
> +
> +	ret = wait_for_quote_completion(quote_buf, getquote_timeout);
> +	if (ret) {
> +		pr_err("GetQuote request timedout\n");
> +		goto done;
> +	}

Sorry that I didn't check the previous discussion and don't know if it 
is by design or not:

Why don't check the quote_buf->status? If it indicates errors, we should 
return some error code instead, right?

> +	buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
> +	if (!buf) {
> +		ret = -ENOMEM;
> +		goto done;
> +	}
> +
> +	report->outblob = buf;
> +	report->outblob_len = quote_buf->out_len;
> +
> +	/*
> +	 * TODO: parse the PEM-formatted cert chain out of the quote buffer when
> +	 * provided
> +	 */
> +done:
> +	mutex_unlock(&quote_lock);
> +	kfree(reportdata);
> +	kfree(tdreport);
> +
> +	return ret;
> +}
> +

