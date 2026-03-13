Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2E839D6DE
	for <linux-coco@lists.linux.dev>; Fri, 13 Mar 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412801; cv=none; b=qClnozMUf+oJdrwWwhN+cyBP9eI6a3445DSpemxHgCcVdhp5pMDcrqg5STpvn5hx9snr3tqg8WuizIdk7tA6kL78UQtRLzqnUODQ7fmfOCcto/0MCDgmh4o7DaFzcH5JIaEKpwJHmLtPdpLpe5rwfpRHm+dOizyNUVGlSmMEqYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412801; c=relaxed/simple;
	bh=NWW3+05oGaF0CPOBbQZTXUZWB2Hy2DTrkHpa2iFz7sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DzVWfHoI24utWDw3A9QXmOMpsDA/EPtSY4i5189tbsOvbnDRjHwyzrTuu98a/42JeSUzYXOXFqlUvaSdZdeEScWXaLkw7QkJM34BHVgaaPmzMG8zySAKz7gNh+cWsYOR17VVJpU7ZmmhARYXPI2Eh7iXuQewEYY+a5gAWIaD9K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33D81165C;
	Fri, 13 Mar 2026 07:39:53 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 530863F7BD;
	Fri, 13 Mar 2026 07:39:57 -0700 (PDT)
Message-ID: <1e233b43-0118-435e-a9df-29a535d63740@arm.com>
Date: Fri, 13 Mar 2026 15:39:48 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Nirmoy Das <nirmoyd@nvidia.com>, Salman Nabi <salman.nabi@arm.com>,
 vvidwans@nvidia.com, sudeep.holla@arm.com, mark.rutland@arm.com,
 lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <19aeb934-7e36-4f30-8f7f-a8ae74a797f5@nvidia.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <19aeb934-7e36-4f30-8f7f-a8ae74a797f5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nirmoy,

On 3/13/26 10:46, Nirmoy Das wrote:
> Hi Salman and Andre,
> 
> 
> We found an bug while testing LFA. See below:
> 
> On 19.01.26 14:27, Salman Nabi wrote:
>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>> activating firmware components without a reboot. Those components
>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
>> at system runtime, without requiring a reboot.
>> The specification covers the SMCCC interface to list and query available
>> components and eventually trigger the activation.

[ .... ]

>> +
>> +    update_fw_images_tree();
>> +
>> +    /*
>> +     * Removing non-valid image directories at the end of an activation.
>> +     * We can't remove the sysfs attributes while in the respective
>> +     * _store() handler, so have to postpone the list removal to a
>> +     * workqueue.
>> +     */
>> +    INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
> 
> 
> This can get invoke multiple times so re-initializing a work item that 
> may already be queued or running
> 
> is unsafe. This should be moved to lfa_init() so it is only called once. 
> I suggest:

Ah, good point, thanks for spotting and reporting. Will fold this into 
the next post!

Cheers,
Andre

> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/ 
> lfa_fw.c
> index 90727a66e49a5..135358113104c 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -653,7 +653,6 @@ static int update_fw_images_tree(void)
>           * _store() handler, so have to postpone the list removal to a
>           * workqueue.
>           */
> -       INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
>          queue_work(fw_images_update_wq, &fw_images_update_work);
> 
>          return 0;
> @@ -680,7 +679,7 @@ static void lfa_notify_handler(acpi_handle handle, 
> u32 event, void *data)
>           * of all activable and pending images.
>           */
>          do {
> -               /* Reset activable image flag */
> +               flush_workqueue(fw_images_update_wq);
>                  found_activable_image = false;
>                  list_for_each_entry(attrs, &lfa_fw_images, image_node) {
>                          if (attrs->fw_seq_id == -1)
> @@ -782,6 +781,8 @@ static int __init lfa_init(void)
>                  return -ENOMEM;
>          }
> 
> +       INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
> +
>          pr_info("Live Firmware Activation: detected v%ld.%ld\n",
>                  reg.a0 >> 16, reg.a0 & 0xffff);
> 
> 
> Regards,
> 
> Nirmoy
> 
>> +    queue_work(fw_images_update_wq, &fw_images_update_work);
>> +    mutex_unlock(&lfa_lock);
>> +
>> +    return ret;
>> +}
>> +
