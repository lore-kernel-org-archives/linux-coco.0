Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9055811E7
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032273; cv=none; b=AcKQSHV++KOkVsAkdi8vSX8I5xaYCiX8NryIaOpt2wUhDIA4MR2Hm2TAHoZuoHXnQMxOKjScdtF7GrttnwzD/kFIzT4TJ8ieLkJAwm3VkanYX/SWyOzHTzCpUJSLyOFSe1OKAaynYpo/o6V+NBBbTISXhdbVSj/+Qj61pNhk2vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032273; c=relaxed/simple;
	bh=BxzQgin45pshm06ZzBQCLW6SoFp8AflNyPYA4gCDqdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOhLjfnDofyKmsdqpk7K3g3BXpy0tL/UdGRrVtzJvLBENDTsGM2RXGHasR/yWEw2arkhaFLPqBIXDBgM5PKAJSGoe8e+TNG3ilLE+4mjrp1R5QHFbcb5fjDmHg+HJ0SYukafUpEzG6VG64H5Za1rQs7mOw66ms3+rxSmzYWrxs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZTUEeHj; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZTUEeHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706032270; x=1737568270;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BxzQgin45pshm06ZzBQCLW6SoFp8AflNyPYA4gCDqdU=;
  b=mZTUEeHjs/hZLsyy+c1cbkYW/og1HmJ4qljcRcRMOaWexUFz9EXTMfJM
   pa5908eIlp6I0PxvS3CLmiRwbZ+8BXPaJU8wxj8WbxPSGB0HQD3AfmuY8
   bxpsg37eCQVnLTDQDSN+zfvoHVPzg6YPYm6344JG9KvOl6T5QE+o7p+Cr
   vm3XR0sksGgELcfgTYIq42nXYZop4KUyjy58905gL6PcLmK1MewcKz9MX
   n1dYyN5TEaksMbCKNVi7Sjmtzv7UkwqTjpsliP6IegsfpAe5cP6u1CDxa
   AzEQI0efmEKr/1a2a1esNnVpCPWIBfwIz2K2Uo7A3zvrAwLuimo+Oxhvc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398757252"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="398757252"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1754442"
Received: from weifeng1-mobl1.amr.corp.intel.com (HELO [10.212.171.111]) ([10.212.171.111])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:51:09 -0800
Message-ID: <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com>
Date: Tue, 23 Jan 2024 09:51:08 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
Content-Language: en-US
To: Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev
Cc: dave.hansen@linux.intel.com, x86@kernel.org,
 kirill.shutemov@linux.intel.com
References: <20240123160704.1270147-1-nik.borisov@suse.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240123160704.1270147-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/23/24 8:07 AM, Nikolay Borisov wrote:
> When this driver got merged initially there was no widely agreed upon
> interface how the quote generation interface will work so having an
> ioctl made sense. However, there's now a vendor-neutral interface via
> configfs. Just remove the old ioctl interface and leave only the the
> configfs one.
>
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> ---

This ABI allows the user to get the raw report which is further used
for Quote generation via vsock. AFAIK, some vendors (TDX users) and
DCAP user libraries are still using this ABI to support attestation over
vsock model.

Don't you think we should wait till there are no users before considering
removing it?

>
> I think it's better to remove the legacy interface now, before there's been a
> wide adoption of it, cementing it as an ABI of sorts.
>
>  drivers/virt/coco/tdx-guest/tdx-guest.c | 75 +------------------------
>  1 file changed, 2 insertions(+), 73 deletions(-)
>
> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
> index 1253bf76b570..1642a0f70333 100644
> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
> @@ -66,41 +66,6 @@ static DEFINE_MUTEX(quote_lock);
>   */
>  static u32 getquote_timeout = 30;
>
> -static long tdx_get_report0(struct tdx_report_req __user *req)
> -{
> -	u8 *reportdata, *tdreport;
> -	long ret;
> -
> -	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
> -	if (!reportdata)
> -		return -ENOMEM;
> -
> -	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
> -	if (!tdreport) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> -
> -	if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LEN)) {
> -		ret = -EFAULT;
> -		goto out;
> -	}
> -
> -	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
> -	ret = tdx_mcall_get_report0(reportdata, tdreport);
> -	if (ret)
> -		goto out;
> -
> -	if (copy_to_user(req->tdreport, tdreport, TDX_REPORT_LEN))
> -		ret = -EFAULT;
> -
> -out:
> -	kfree(reportdata);
> -	kfree(tdreport);
> -
> -	return ret;
> -}
> -
>  static void free_quote_buf(void *buf)
>  {
>  	size_t len = PAGE_ALIGN(GET_QUOTE_BUF_SIZE);
> @@ -249,29 +214,6 @@ static int tdx_report_new(struct tsm_report *report, void *data)
>  	return ret;
>  }
>
> -static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
> -			    unsigned long arg)
> -{
> -	switch (cmd) {
> -	case TDX_CMD_GET_REPORT0:
> -		return tdx_get_report0((struct tdx_report_req __user *)arg);
> -	default:
> -		return -ENOTTY;
> -	}
> -}
> -
> -static const struct file_operations tdx_guest_fops = {
> -	.owner = THIS_MODULE,
> -	.unlocked_ioctl = tdx_guest_ioctl,
> -	.llseek = no_llseek,
> -};
> -
> -static struct miscdevice tdx_misc_dev = {
> -	.name = KBUILD_MODNAME,
> -	.minor = MISC_DYNAMIC_MINOR,
> -	.fops = &tdx_guest_fops,
> -};
> -
>  static const struct x86_cpu_id tdx_guest_ids[] = {
>  	X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
>  	{}
> @@ -290,27 +232,15 @@ static int __init tdx_guest_init(void)
>  	if (!x86_match_cpu(tdx_guest_ids))
>  		return -ENODEV;
>
> -	ret = misc_register(&tdx_misc_dev);
> -	if (ret)
> -		return ret;
> -
>  	quote_data = alloc_quote_buf();
>  	if (!quote_data) {
>  		pr_err("Failed to allocate Quote buffer\n");
> -		ret = -ENOMEM;
> -		goto free_misc;
> +		return -ENOMEM;
>  	}
>
>  	ret = tsm_register(&tdx_tsm_ops, NULL, NULL);
>  	if (ret)
> -		goto free_quote;
> -
> -	return 0;
> -
> -free_quote:
> -	free_quote_buf(quote_data);
> -free_misc:
> -	misc_deregister(&tdx_misc_dev);
> +		free_quote_buf(quote_data);
>
>  	return ret;
>  }
> @@ -320,7 +250,6 @@ static void __exit tdx_guest_exit(void)
>  {
>  	tsm_unregister(&tdx_tsm_ops);
>  	free_quote_buf(quote_data);
> -	misc_deregister(&tdx_misc_dev);
>  }
>  module_exit(tdx_guest_exit);
>
> --
> 2.34.1
>
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

