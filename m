Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251E54F9C
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706687285; cv=none; b=t8/cIr/Z+FAV9e/MeEkOosoF51xQRp8AtZPwcnJkXTXAyQZfKwMX6zTA9frZoJtZSLeelDqwBOVxDlRzEg6RQ1s0s7WzK2Vt/5vbeU0/QGFPBh2XBBsJ2LhTvqs5VjNFzUquFEpay1EEwNJuxpkEMfnZf3JMjrbclYddmtp2A1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706687285; c=relaxed/simple;
	bh=l9M7ytoYtx0wMSoveOWMkfIN7H38u9HPk0svWGTpzYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWkxlFu7TAw43LUoFLjynN2/5kNFXKIJ1VQELxhc/xipM/2ZQAoHL2zmrxj5bN87+HtfanQ7D4pbBuTJ/OXLrQishwP+K0ToWjwpTC3E+5XIuwT0HtMunOX5cdf8eil6vIEkk+AVzpu3MRL0kTnM3bf1pwRHHvVAR/OfD8LACuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCK/6E3o; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCK/6E3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706687283; x=1738223283;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l9M7ytoYtx0wMSoveOWMkfIN7H38u9HPk0svWGTpzYE=;
  b=ZCK/6E3oG/dcXsROegsJujO4vkBupYJLphB920IXffweBhyceWueNxJs
   BJ50voMRyD367MHCEH10qfTUdtE+vUJu2kswlZGsNKh0ILemZnQoN3wHw
   wCyyRcyDc4nAKwtN/8wi7kwg4mkQAql30PyTTeZARtza48TLu4nJYphRu
   CZfJbGhyn8pfEgytursxrqqQz9Dlo1Kk1dWpHYeI6r2CUKgkIJQi+w8z0
   en2cDt0CRpx38OCzx7CZb8ui2ZylWB9wkzJszXoomDy6C4zANFklhbVHP
   Q3BYJiWs3E6+MQhDAz5JAUyOvqT7Qdo2TRGiiPcPm1UgZ6jXCL8AjCxhL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="467766547"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="467766547"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 23:48:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4076149"
Received: from ktpate-mobl2.amr.corp.intel.com (HELO [10.209.73.130]) ([10.209.73.130])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 23:48:03 -0800
Message-ID: <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
Date: Tue, 30 Jan 2024 23:48:02 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Content-Language: en-US
To: Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev
Cc: x86@kernel.org, dave.hansen@linux.intel.com, dan.j.williams@intel.com,
 dionnaglaze@google.com, dan.middleton@linux.intel.com
References: <20240124093858.1818497-1-nik.borisov@suse.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240124093858.1818497-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+ Dan Middleton

Hi Boris,

On 1/24/24 1:38 AM, Nikolay Borisov wrote:
> IOCTL based interface was the natural choice for interacting with the
> quote generation machine at a time when there wasn't anything better.
> Fortunately, now we have a vendor-agnostic, configfs-based one which
> obviates the need to have the IOCTL-based interface.
>
> Gate the relevant code behind a Kconfig option, clearly marking it as
> deprecated as well as introduce a runtime warning.
>
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> ---

In the following thread, Dan Middleton raised a point about this interface
being used for local attestation use cases.

https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a

Currently, the configfs-based ABI does not support the local attestation use cases.

IMO, for now we can just add a config option to allow the user to selectively
enable it. We can add the runtime warning once we address the local attestation
use case via configfs ABI.

>  drivers/virt/coco/tdx-guest/Kconfig     |  9 +++++++++
>  drivers/virt/coco/tdx-guest/tdx-guest.c | 13 +++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
> index 22dd59e19431..0f1cfdfbbd28 100644
> --- a/drivers/virt/coco/tdx-guest/Kconfig
> +++ b/drivers/virt/coco/tdx-guest/Kconfig
> @@ -9,3 +9,12 @@ config TDX_GUEST_DRIVER
>  
>  	  To compile this driver as module, choose M here. The module will
>  	  be called tdx-guest.
> +
> +config TDX_GUEST_DRIVER_LEGACY_IOCTL
> +	def_bool y
> +	prompt "Enable legacy ioctl interface (DEPRECATED)"
> +	depends on TDX_GUEST_DRIVER
> +	help
> +	  Enable the legacy IOCTL-based interface to get the TDX report. It's
> +	  deprecated in favor of the configfs based one and will be removed
> +	  in a future release.
> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
> index 1253bf76b570..b8cea9486daf 100644
> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
> @@ -66,6 +66,7 @@ static DEFINE_MUTEX(quote_lock);
>   */
>  static u32 getquote_timeout = 30;
>  
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
>  static long tdx_get_report0(struct tdx_report_req __user *req)
>  {
>  	u8 *reportdata, *tdreport;
> @@ -100,6 +101,7 @@ static long tdx_get_report0(struct tdx_report_req __user *req)
>  
>  	return ret;
>  }
> +#endif
>  
>  static void free_quote_buf(void *buf)
>  {
> @@ -249,6 +251,9 @@ static int tdx_report_new(struct tsm_report *report, void *data)
>  	return ret;
>  }
>  
> +
> +
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
>  static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
>  			    unsigned long arg)
>  {
> @@ -271,6 +276,7 @@ static struct miscdevice tdx_misc_dev = {
>  	.minor = MISC_DYNAMIC_MINOR,
>  	.fops = &tdx_guest_fops,
>  };
> +#endif
>  
>  static const struct x86_cpu_id tdx_guest_ids[] = {
>  	X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
> @@ -290,9 +296,12 @@ static int __init tdx_guest_init(void)
>  	if (!x86_match_cpu(tdx_guest_ids))
>  		return -ENODEV;
>  
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
> +	pr_info("Legacy IOCTL-based interface is deprecated and will be removed in a future release\n");
>  	ret = misc_register(&tdx_misc_dev);
>  	if (ret)
>  		return ret;
> +#endif
>  
>  	quote_data = alloc_quote_buf();
>  	if (!quote_data) {
> @@ -310,7 +319,9 @@ static int __init tdx_guest_init(void)
>  free_quote:
>  	free_quote_buf(quote_data);
>  free_misc:
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
>  	misc_deregister(&tdx_misc_dev);
> +#endif
>  
>  	return ret;
>  }
> @@ -320,7 +331,9 @@ static void __exit tdx_guest_exit(void)
>  {
>  	tsm_unregister(&tdx_tsm_ops);
>  	free_quote_buf(quote_data);
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
>  	misc_deregister(&tdx_misc_dev);
> +#endif
>  }
>  module_exit(tdx_guest_exit);
>  

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

