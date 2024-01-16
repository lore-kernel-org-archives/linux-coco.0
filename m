Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E724B3A
	for <linux-coco@lists.linux.dev>; Tue, 16 Jan 2024 22:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705444124; cv=none; b=t3UEoYa2pFIW5hNtTJ9Ev3IXr6i4y7Y9koaooMfNjc7ZZPzISKD1zyPPvVkbQZWLdoMAvK7Xqs5hYDdJuAMyeAXBKggMJmi/c8ouLkBei98O6S9bXjLR2aFOpBtP7o3tmkml77b4sE9e/agDahb+8MJ0wwjaorBRlSiIFXFzwPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705444124; c=relaxed/simple;
	bh=9Ezf4ND7hXOBpmbgOSwM5A6lJTvji0aEFSttJmVgKdA=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=D/l+M0wZtsmhh1yDGQWtON7dudjU8tW02th9eG5w9AQzu/i6MpTJ8iuozR4OynzEShlKhIre97V9SxF9rOUTn5DCPWnS7XRMWKe4ohx+qK3DQ3bY/M5MdoMbdHEevpdvD36UKZl5z3vXnB9/87tUADcKMfTscVB9H2VTeCmWzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LL5Ahp0k; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LL5Ahp0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705444123; x=1736980123;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9Ezf4ND7hXOBpmbgOSwM5A6lJTvji0aEFSttJmVgKdA=;
  b=LL5Ahp0kAmKvgqjTHnLQGJvYGkR0zAMWocmd5VgVc/q/DjrYt3DDimU7
   YXIlTgcQhEVYLBYqkRdwpPnqxizX64XgrE3g4AATXgRsSEfgHbhmukJhY
   wpADWJsXsS7jdW4r/gURsk+XxTTK7H6BUImFLdwBKZNDMHwKxSapQZD7G
   dD9c8vUe5yQGBSimxkBWcEyX6qfNLYBCxYJRkqvlzbai7dpN1RWiJD1Zn
   wwsVTyAvBbIx0DDa+/m/GmL8ylSqTJlf+2lOogInO7lns8UOfjlDCDufO
   dnoXBwQxGW1o2R+sHP1Cbe9rexb/uldToDfv0T2bZSiwWeT6IWppvECPo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13360022"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="13360022"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 14:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="18612293"
Received: from rjcolson-mobl2.amr.corp.intel.com (HELO [10.209.69.176]) ([10.209.69.176])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 14:28:41 -0800
Message-ID: <1bbf8d3e-aa94-48c7-a1e4-76f9eefc4af7@linux.intel.com>
Date: Tue, 16 Jan 2024 14:28:29 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/4] tsm: Allow for mapping RTMRs to TCG TPM PCRs
Content-Language: en-US
To: Samuel Ortiz <sameo@rivosinc.com>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240114223532.290550-1-sameo@rivosinc.com>
 <20240114223532.290550-4-sameo@rivosinc.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240114223532.290550-4-sameo@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/14/24 2:35 PM, Samuel Ortiz wrote:
> Many user space and internal kernel subsystems (e.g. the Linux IMA)
> expect a Root of Trust for Storage (RTS) that allows for extending
> and reading measurement registers that are compatible with the TCG TPM
> PCRs layout, e.g. a TPM. In order to allow those components to
> alternatively use a platform TSM as their RTS, a TVM could map the
> available RTMRs to one or more TCG TPM PCRs. Once configured, those PCR
> to RTMR mappings give the kernel TSM layer all the necessary information
> to be a RTS for e.g. the Linux IMA or any other components that expects
> a TCG compliant TPM PCRs layout.
>
> TPM PCR mappings are configured through configfs:
>
> // Create and configure 2 RTMRs
> mkdir /sys/kernel/config/tsm/rtmrs/rtmr0
> mkdir /sys/kernel/config/tsm/rtmrs/rtmr1
> echo 0 > /sys/kernel/config/tsm/rtmrs/rtmr0/index
> echo 1 > /sys/kernel/config/tsm/rtmrs/rtmr1/index
>
> // Map RTMR 0 to PCRs 4, 5, 6, 7 and 8
> echo 4-8 > /sys/kernel/config/tsm/rtmrs/rtmr0/tcg_map
>
> // Map RTMR 1 to PCRs 16, 17 and 18
> echo 16-18 > /sys/kernel/config/tsm/rtmrs/rtmr1/tcg_map

Any information on how this mapping will be used by TPM or IMA ?

RTMR to PCR mapping is fixed by design, right? If yes, why allow
user to configure it. We can let vendor drivers to configure it, right?


>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> ---
>  drivers/virt/coco/tsm.c | 60 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
> index 15b67d99fd54..f35f91cb7bd3 100644
> --- a/drivers/virt/coco/tsm.c
> +++ b/drivers/virt/coco/tsm.c
> @@ -472,8 +472,68 @@ static ssize_t tsm_rtmr_index_show(struct config_item *cfg,
>  }
>  CONFIGFS_ATTR(tsm_rtmr_, index);
>  
> +static ssize_t tsm_rtmr_tcg_map_store(struct config_item *cfg,
> +				      const char *buf, size_t len)
> +{
> +	struct tsm_rtmr_state *rtmr_state = to_tsm_rtmr_state(cfg);
> +	int i, pcrs[TPM2_PLATFORM_PCR + 1];
> +
> +	get_options(buf, ARRAY_SIZE(pcrs), pcrs);
> +
> +	if (pcrs[0] > TPM2_PLATFORM_PCR - 1)
> +		return -EINVAL;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	/* Check that the PCR list is valid  */
> +	for (i = 0; i < pcrs[0]; i++) {
> +		/* It must be a valid TPM2 PCR number */
> +		if (pcrs[i] > TPM2_PLATFORM_PCR - 1)
> +			return -EINVAL;
> +
> +		/* If another RTMR maps to this PCR, the list is discarded */
> +		if (tsm_rtmrs->tcg_map[pcrs[i + 1]] &&
> +		    tsm_rtmrs->tcg_map[pcrs[i + 1]] != rtmr_state)
> +			return -EBUSY;
> +	}
> +
> +	for (i = 0; i < pcrs[0]; i++)
> +		tsm_rtmrs->tcg_map[pcrs[i + 1]] = rtmr_state;
> +
> +	return len;
> +}
> +
> +static ssize_t tsm_rtmr_tcg_map_show(struct config_item *cfg,
> +				     char *buf)
> +{
> +	struct tsm_rtmr_state *rtmr_state = to_tsm_rtmr_state(cfg);
> +	unsigned int nr_pcrs = ARRAY_SIZE(tsm_rtmrs->tcg_map), i;
> +	unsigned long *pcr_mask;
> +	ssize_t len;
> +
> +	/* Build a bitmap mask of all PCRs that this RTMR covers */
> +	pcr_mask = bitmap_zalloc(nr_pcrs, GFP_KERNEL);
> +	if (!pcr_mask)
> +		return -ENOMEM;
> +
> +	guard(rwsem_read)(&tsm_rwsem);
> +	for (i = 0; i < nr_pcrs; i++) {
> +		if (tsm_rtmrs->tcg_map[i] != rtmr_state)
> +			continue;
> +
> +		__set_bit(i, pcr_mask);
> +	}
> +
> +	len = bitmap_print_list_to_buf(buf, pcr_mask, nr_pcrs, 0,
> +				       nr_pcrs * 3 /* 2 ASCII digits and one comma */);
> +	bitmap_free(pcr_mask);
> +
> +	return len;
> +}
> +CONFIGFS_ATTR(tsm_rtmr_, tcg_map);
> +
>  static struct configfs_attribute *tsm_rtmr_attrs[] = {
>  	&tsm_rtmr_attr_index,
> +	&tsm_rtmr_attr_tcg_map,
>  	NULL,
>  };
>  

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

