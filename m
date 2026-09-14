Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7635FF5B
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364495; cv=none; b=eSowCPRsikXrj+CEz55t8zCoPvTED987JRCYnSZwe4uGgKAcY8/0PYOt0QjwQLGvJdQX/yPbMg60me4jM5o3XLr31Q6mjLaOwKsh619xql8bnrkaDCxQzyq5HtXXZsnPuJA/jp9KO6OuJjfSoP7EhoL+Rv4rO+WlpAFtURD0J2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364495; c=relaxed/simple;
	bh=zRrIIpcVLrCXTBhieNQzI3EY0LrfmalLyUe+OYByE+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSqNCm6dNMu4OERFdBcufyrltaWPNIoIuFVdcInQq/vh0SaPHwRW3Q3I1bkCQtulG3idv8JAl5Dsr3zWFhBmnPZz3M8Ils/3bpYK8mLsNK6DSOnPH8R9rPRyKJ7V3q2GCj1u8708Zk6DAGAMNU9Xr/Bsr7eQxSJ/VN5f0/RdeIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FQ11WHIs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FQ11WHIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789364490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgdK3ICiN0orAH3GszJk6qjZAUrdfwzdfyzN2L9vl84=;
	b=FQ11WHIsUCkQuHs405ZGqNvB2/QCXV8gdRIR4Z7dsywkm1iK4+gheaJBBSajbA3/pEsVww
	KoDIlKysR6of9LeUioXTyLys5sXlhCR9UAQUh1cZKLtD46Tx03qHQAv61KMhA9ne69zkMt
	u4I9+kgp6ewbAuaCWeXxe11Vkc7+ObQ=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-t-QNblppOsqafcuASCnlFQ-1; Mon, 14 Sep 2026 01:41:29 -0400
X-MC-Unique: t-QNblppOsqafcuASCnlFQ-1
X-Mimecast-MFC-AGG-ID: t-QNblppOsqafcuASCnlFQ_1789364488
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-868db1b2c64so4803820b3a.3
        for <linux-coco@lists.linux.dev>; Sun, 13 Sep 2026 22:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364488; x=1789969288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgdK3ICiN0orAH3GszJk6qjZAUrdfwzdfyzN2L9vl84=;
        b=ORfVfrNHwkdmlQwaQwPI7Nt7y2So7S2k41sc/G5Gf6RlwIi/4VWXXBGcn1UcFA8W8U
         IPK32Fk2Hsgo/gsyF94CoGOiY6tIbJRJJPkdeM5KOBcj0Y8YQcOUmUbm90QKe6rtH4uR
         x5HRnJFVeqh1b0PdgFTupGGOzDRbHrju/rnqw/wHJWstpWd6C6+LNTQjZqTDwtBzR36x
         dYVEX0QR+3qnmBZgH2CwlBG+QS+md/HOEgnGPAVHV3j4cgw50H47OIYuQJCnkv/o0K9H
         RHm3HT7ZYT5HLe53JnS1HrFmRwxYr4wrxS4S/p6nHXU3lNBO/FhGokZIz4vzIcGTwtar
         sD1w==
X-Forwarded-Encrypted: i=1; AKwUvBypDt1H0FNOFyEkEAxwZxuw8yqWrEFwFqKe1da4qYFbSLxJOHae/ZZ1cSLE8dkm8hFTD8U9Hxr+0DsY@lists.linux.dev
X-Gm-Message-State: AFuF++l8cP49ZorIkdgkmxFJBgIqEWZmi40/DmXPmm9CB+3PqXMUwv4R
	rscZXxiBYZ8+4KXLDYhiy9PY1/9bUY8PFnLv7N5mdqlHyU6dzCGvJrS7oRNCcux6jxU7olWx1lC
	B3JAoLD4bTVongHaZhsdqpN4KUxhpjOj5quolpOXWyK2HhWGbTTwqbQcWxgN+NEM=
X-Gm-Gg: AYBFou26eh2nueOKlAvIh/2VBcXuMQV9sgq4qdWZF/FD1HCnzjvFPPcUKHFiWk4TdyF
	FOQyX4MedaK4jNtCBjZVPFMTTI9lYNqLGnRJq+Bwe31uwTf9rxRb4jyhAda76AiIAVx6uXXWQK1
	OCEbQBDjxPlh/GFILjm07fU2KFsqsDByXZhmXdG+tX99IS+VFVxQ0Ysqx0r/lQCykmmemGzVmNl
	ZciheEz7Cvi5dE31Cgsl3Tab1RjIQs664zy9DJ0dF8YEsrKfgOvfc9ONyY0K1eK54dgp/nwIivE
	B1V6bbI+lzJriPpjeoznrGSl2+/hJzbZHfQPj1gpMWLHEM4mTTvLw+N7hHoPU/UeJkvhmA3H2sy
	NiGA6c/lzzXtoaoStM8Tn/JgCZ3c0hF1y64n8XiAS0g==
X-Received: by 2002:a05:6a00:35c8:b0:857:72ba:ff0d with SMTP id d2e1a72fcca58-86f85ce3d75mr3077528b3a.21.1789364487814;
        Sun, 13 Sep 2026 22:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:35c8:b0:857:72ba:ff0d with SMTP id d2e1a72fcca58-86f85ce3d75mr3077468b3a.21.1789364487302;
        Sun, 13 Sep 2026 22:41:27 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c49d2sm4061828b3a.10.2026.09.13.22.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 22:41:26 -0700 (PDT)
Message-ID: <b2fd288e-e0e7-49cc-b0cb-933fba501d79@redhat.com>
Date: Mon, 14 Sep 2026 15:41:14 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-7-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260912083611.2513845-7-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -WxXlb9SWJJfeWFjCwKOkgSsOrKT6aFqN6a_j2lhX6Y_1789364488
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM maintains the state of all the granules in the system to make
> sure that the host is abiding by the rules. This state can be maintained
> at different granularity, per page (TRACKING_FINE) or per region
> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region, all pages
> in the region must be of the same state, this implies we need to have "fine"
> tracking for DRAM, so that we can delegate individual pages.
> 
> For now we only support a statically carved out memory for tracking
> granules for the "fine" regions. This can be extended in the future to
> allow modifying the tracking granularity and remove the need for a
> static allocation by the firmware.
> 
> Similarly, the firmware may create L0 GPT entries describing the total
> address space. But if we change the "PAS" (Physical Address Space) of a
> granule, then the firmware may need to create L1 tables to track the PAS
> at a finer granularity. Linux therefore checks if the platform firmware manages
> the PAR region. i.e., the firmware is in charge of managing the L1 GPTs
> (creation and the required memory for the GPT tables - via static carveouts)
> without host intervention. Support for dynamic GPT creation by the host will be
> added later.
> 
> If the firmware requires us to manage the tracking or GPT memory, Deactivate
> the RMM and reclaim any memory donated at RMM activation.
> 
> Apply the same checks when hotplugged memory is brought online.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> [ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v17:
>       * Move wrappers that may not be used elsewhere, out of arm-rmi-cmds.h
>   Changes since v16:
>       * Check fine tracking and create L1 GPTs for hotplug-added memory.
>       * Clarify the L1 GPT setup and move the explanatory comment.
>       * Switch to using RMI_GPT_INFO command for checking the GPTs.
>       * Deactivate the RMM and reclaim the memory if we can't proceed.
>   Changes since v15:
>       * Skip firmware-reserved NOMAP memory in rmi_init_metadata()
>       * Handle negative error codes from wrappers.
>   Changes since v14:
>       * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>       * Moved out of KVM
> ---
>   drivers/firmware/arm_rmm/rmi.c | 200 +++++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h   |   2 +
>   2 files changed, 202 insertions(+)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index ecc89e91d264d..583e1aca9b15a 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -5,12 +5,15 @@
>   
>   #include <linux/cpufeature.h>
>   #include <linux/memblock.h>
> +#include <linux/memory.h>
>   #include <linux/arm-rmi-cmds.h>
>   #include <linux/slab.h>
>   
>   #include <asm/memory.h>
>   #include <asm/pgtable-hwdef.h>
>   
> +static bool arm64_rmi_is_available;
> +
>   /* Currently only the first 2 registers are used by Linux */
>   #define RMI_FEAT_REG_COUNT	2
>   static unsigned long rmi_feat_reg_cache[RMI_FEAT_REG_COUNT] __ro_after_init;
> @@ -68,6 +71,69 @@ static inline long rmi_granule_range_undelegate(unsigned long base,
>   	return ret;
>   }
>   
> +/**
> + * rmi_granule_tracking_get() - Get configuration of a Granule tracking region
> + * @start: Base PA of the tracking region
> + * @end: End of the PA region
> + * @out_category: Memory category
> + * @out_state: Tracking region state
> + * @out_top: Top of the memory region
> + *
> + * Return: RMI return code
> + */
> +static inline int rmi_granule_tracking_get(unsigned long start,
> +					   unsigned long end,
> +					   unsigned long *out_category,
> +					   unsigned long *out_state,
> +					   unsigned long *out_top)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_GRANULE_TRACKING_GET, start, end,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +
> +	if (regs.a0 != RMI_SUCCESS)
> +		return regs.a0;
> +
> +	if (out_category)
> +		*out_category = regs.a1;
> +	if (out_state)
> +		*out_state = regs.a2;
> +	if (out_top)
> +		*out_top = regs.a3;
> +
> +	return RMI_SUCCESS;
> +}
> +
> +/*
> + * rmi_gpt_info - Query the GPT info for the given PAR.
> + * @start: Base of the physical address region
> + * @top: Top of the physical address region
> + * @out_top: Top of the phyiscal address region for which
> + *		the GPT @out_gpt_par_state is valid
> + * @out_gpt_par_state: State of the GPT covered by [start, out_top)
> + */
> +static inline long rmi_gpt_info(unsigned long start, unsigned long end,
> +				unsigned long *out_top,
> +				unsigned long *out_gpt_par_state)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_GPT_INFO, start, end,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +	if (regs.a0 != RMI_SUCCESS)
> +		return regs.a0;
> +
> +	if (out_top)
> +		*out_top = regs.a1;
> +	if (out_gpt_par_state)
> +		*out_gpt_par_state = regs.a2;
> +
> +	return RMI_SUCCESS;
> +}
> +
>   /**
>    * rmi_features() - Read feature register
>    * @index: Feature register index
> @@ -759,6 +825,124 @@ static int rmi_configure(void)
>   	return ret;
>   }
>   
> +/*
> + * Make sure the area is tracked by RMM at FINE granularity.
> + * We do not support changing the tracking yet.
> + */
> +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
> +{
> +	while (start < end) {
> +		unsigned long ret, category, state, next;
> +
> +		ret = rmi_granule_tracking_get(start, end, &category, &state, &next);
> +		if (ret != RMI_SUCCESS)
> +			return -ENOMEM;
> +
> +		if (state != RMI_TRACKING_FINE ||
> +		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
> +			/* TODO: Set granule tracking in this case */
> +			pr_err("Granule tracking for region isn't fine/conventional: %llx-%lx\n",
> +			       start, next);
> +			return -ENODEV;
> +		}
> +		start = next;
> +	}
> +
> +	return 0;
> +}
> +

I would suggest to drop rmi_granule_tracking_get() by combining its logics into
rmi_verify_memory_tracking().

/*
  * Make sure the area is tracked by RMM at FINE granularity.
  * We do not support changing the tracking yet.
  */
static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
{
         struct arm_smccc_1_2_regs args;

         while (start < end) {
                 args.a0 = SMC_RMI_GRANULE_TRACKING_GET;
                 args.a1 = start;
                 args.a2 = end;
                 rmi_smccc_invoke(&args);

                 if (args.a0 != RMI_SUCCESS)
                         return -ENOMEM;

                 if (args.a1 != RMI_MEM_CATEGORY_CONVENTIONAL ||
                     args.a2 != RMI_TRACKING_FINE) {
                         /* TODO: Set granule tracking in this case */
                         pr_err("Granule tracking for region isn't fine/conventional: %llx-%lx\n",
                                 start, args.a3);
                         return -ENODEV;
                 }

                 start = args.a3;
         }

         return 0;
}

> +/*
> + * We do not support creating L1 GPTs yet. So, make sure that
> + * all the regions are managed by the firmware.
> + */
> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned long l0gpt_sz;
> +	unsigned long next, par_state;
> +
> +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> +					  rmi_feat_reg(1)));
> +	start = ALIGN_DOWN(start, l0gpt_sz);
> +	end = ALIGN(end, l0gpt_sz);
> +
> +	while (start < end) {
> +		long ret = rmi_gpt_info(start, end, &next, &par_state);
> +
> +		if (ret != RMI_SUCCESS)
> +			return -ENOMEM;
> +
> +		if (par_state != RMI_GPT_PAR_PLAT) {
> +			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
> +				start, next);
> +			return -ENOMEM;
> +		}
> +		start = next;
> +	}
> +
> +	return 0;
> +}

I would suggest to drop rmi_gpt_info() by combining its logics into rmi_verify_gpt_firmware_managed().

/*
  * We do not support creating L1 GPTs yet. So, make sure that
  * all the regions are managed by the firmware.
  */
static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
{
         struct arm_smccc_1_2_regs args;
         unsigned long l0gpt_sz;

         l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
                                           rmi_feat_reg(1)));
         start = ALIGN_DOWN(start, l0gpt_sz);
         end = ALIGN(end, l0gpt_sz);

         while (start < end) {
                 args.a0 = SMC_RMI_GPT_INFO;
                 args.a1 = start;
                 args.a2 = end;
                 rmi_smccc_invoke(&args);
                 if (args.a0 != RMI_SUCCESS)
                         return -ENOMEM;

                 if (args.a2 != RMI_GPT_PAR_PLAT) {
                         pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
                                 start, args.a1);
                         return -ENODEV;
                 }

                 start = args.a2;
         }

         return 0;
}

> +
> +static int rmi_prepare_memory(phys_addr_t start, phys_addr_t end)
> +{
> +	int ret;
> +
> +	ret = rmi_verify_memory_tracking(start, end);
> +	if (ret)
> +		return ret;
> +
> +	return rmi_verify_gpt_firmware_managed(start, end);
> +}
> +
> +static int rmi_init_metadata(void)
> +{
> +	phys_addr_t start, end;
> +	struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		int ret;
> +
> +		/* Firmware-reserved NOMAP regions are not usable system RAM */
> +		if (memblock_is_nomap(r))
> +			continue;
> +
> +		start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
> +		end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
> +

nit: unnecessary to covert the physical address (struct memblock_region::base and (base + size))
to PFN and then convert PFN to physical address:

		start = PAGE_ALIGN(r->base);
		end = PAGE_ALIGN_DOWN(r->base + r->size);
		if (start >= end)
			continue;

> +		ret = rmi_prepare_memory(start, end);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rmi_memory_notifier(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct memory_notify *arg = data;
> +	phys_addr_t start, end;
> +	int ret;
> +
> +	if (action != MEM_GOING_ONLINE)
> +		return NOTIFY_DONE;
> +
> +	start = PFN_PHYS(arg->start_pfn);
> +	end = PFN_PHYS(arg->start_pfn + arg->nr_pages);
> +	ret = rmi_prepare_memory(start, end);
> +
> +	return notifier_from_errno(ret);
> +}
> +
> +static struct notifier_block rmi_memory_nb = {
> +	.notifier_call = rmi_memory_notifier,
> +};
> +
> +bool is_rmi_available(void)
> +{
> +	return arm64_rmi_is_available;
> +}
> +EXPORT_SYMBOL_GPL(is_rmi_available);
> +
>   static int __init arm64_init_rmi(void)
>   {
>   	int ret;
> @@ -786,8 +970,24 @@ static int __init arm64_init_rmi(void)
>   	if (ret) {
>   		pr_err("RMM activate failed\n");
>   		ret = ret < 0 ? ret : -ENXIO;
> +		return ret;
>   	}
>   
> +	ret = rmi_init_metadata();
> +	if (ret)
> +		goto out_deactivate;
> +
> +	ret = register_memory_notifier(&rmi_memory_nb);
> +	if (ret)
> +		goto out_deactivate;
> +
> +	arm64_rmi_is_available = true;
> +	pr_info("RMI configured\n");
> +
> +	return 0;
> +
> +out_deactivate:
> +	WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
>   	return ret;
>   }
>   
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index cd6e309ddf2d8..27a0c56944976 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -58,6 +58,8 @@ static inline int rmi_undelegate_page(phys_addr_t phys)
>   	return rmi_undelegate_range(phys, PAGE_SIZE);
>   }
>   
> +bool is_rmi_available(void);
> +
>   long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp);
>   void rmi_sro_free(struct rmi_sro_state *sro);
>   long rmi_sro_execute(struct arm_smccc_1_2_regs *regs);

Thanks,
Gavin

