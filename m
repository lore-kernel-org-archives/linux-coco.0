Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB92A2BDC0A
	for <linux-coco@lists.linux.dev>; Fri, 30 Jan 2026 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769805105; cv=none; b=qHCvIZXHMQ6oNTCHyKIQUJhZBHe5ef1vtw76ULdfNROwMWmFO3Bq4EvxCrT2oTWEBr7TkenLtUCD9JGvgM+nr8YlnZbMcPDrLoZ9lrQNvUeRZfrl22kGU0K8e4n1waYvHDtg/C37Pu8mtagvhedYO1TlPP9ho/rkFIbCReqZuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769805105; c=relaxed/simple;
	bh=rjlrv9ydkbyXe+OVbVHsZ70DLzQIc1lTKoJNsdWCHQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LngX8hclb73RK6wB+hQ6nIk4SVuh88cibSjbVCz7YWc7ddRBRrQQ+xaCFwilT8+zdoJaT5DNCKKOWCZFBRfrw+IR5NW6C21Fs27GH30CPjBAYL+YZAsOXCkCdtsiVD5b05fSrT7V0iSDM473M10hUcoJIEkNO3BSlwghZJebAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D7CE153B;
	Fri, 30 Jan 2026 12:31:36 -0800 (PST)
Received: from [10.6.14.29] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B4803F5CA;
	Fri, 30 Jan 2026 12:31:24 -0800 (PST)
Message-ID: <5dad5a2f-1282-43a4-928f-a7b8da25fb82@arm.com>
Date: Fri, 30 Jan 2026 21:31:13 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Vedashree Vidwans <vvidwans@nvidia.com>, Salman Nabi
 <salman.nabi@arm.com>, sudeep.holla@arm.com, mark.rutland@arm.com,
 lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <bf1addf9-5e28-46c6-8943-6a359630e533@nvidia.com>
 <8e4b3940-bea0-4c75-80ec-8c5a87cd24a5@arm.com>
 <67ffa9f9-64b4-4015-b374-c7ab545c5200@nvidia.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <67ffa9f9-64b4-4015-b374-c7ab545c5200@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 1/30/26 20:29, Vedashree Vidwans wrote:
> Hi Andre,
> 
> On 1/29/26 09:26, Andre Przywara wrote:
>> Hi Vedashree,
>>
>> many thanks for having a look!
>>
>> On 1/28/26 00:01, Vedashree Vidwans wrote:
>>> Hello,
>>>
>>> On 1/19/26 04:27, Salman Nabi wrote:
>>>> The Arm Live Firmware Activation (LFA) is a specification [1] to 
>>>> describe
>>>> activating firmware components without a reboot. Those components
>>>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>>>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>>

[ .... ]
>>>> +
>>>> +    for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
>>>> +        if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
>>>> +            image_name = fw_images_uuids[i].name;
>>>> +    }
>>> I would recommend using fw_uuid as the image_name when UUID is not
>>> found in fw_images_uuids[], currently the driver assigns 'unknown'
>>> in such case.
>>> There is a valid possibility that platform-specific FW images, not
>>> listed in fw_images_uuids[], are used by LFA agent for live FW
>>> activation. In such scenarios, falling back to 'unknown' would lose
>>> important information especially when errors surface in
>>> call_lfa_activate(). Using UUID directly would indicate which
>>> image failed or behaved unexpectedly.
>>
>> Well, I think if you want to identify an image clearly, you always 
>> have to use the UUID, as shown by the directory name. The "name" sysfs 
>> file is there just for convenience, to make this easier for *users* 
>> when dealing with well-known firmware image. As you rightly said, we 
>> can never guarantee that the kernel knows a certain UUID, and it 
>> wouldn't be necessary for proper operation at all.
>> So I was expecting this name to be only used by reporting scripts or 
>> such. But indeed some "unknown" string is a bit fragile as a 
>> placeholder name, I was wondering if we should just provide an empty 
>> string in this case? This would allow scripts to detect this special 
>> case reliably and provide their own rendering then.
>> Does this make sense?
> Thank you for teh clarification, this helps. I agree that UUID is the 
> canonical identifier and that 'name' sysfs file is mainly for user 
> convenience.
> One concern I have is around error reporting. For example, if 
> call_lfa_activate() fails, the kernel prints:
> ACTIVATE for image <name_string> failed: LFA_BUSY
> 
> If the 'name_string' is "unknown" or an empty string, the error message 
> doesn't indicate which firmware component failed activation, especially 
> on system with multiple LFA-capable FW images.

Yes, that's a good point.

> In such cases, having meaningful fallback identifier is helpful for 
> debugging. Using UUID in the error log would help identify which FW 
> image encountered the failure. This avoids ambiguity and makes error 
> triage much easier, especially when platform-specific firmware images 
> are not listed in fw_images_uuids[] but are still valid LFA components.
> So eitehr of the following would solve the issue:
> 1. Use fw_uuid as the fallback image_name
> 2. Update error print in call_lfa_activate() and prime_fw_image() to use 
> UUID instead of image_name.

I'd say number 2 is better. And if we leave the name char* as NULL or an 
empty string, then this is also easy to detect in the code, and we can 
print the UUID instead. If we do this more than once, then this could be 
nicely hidden in a function.

Thanks,
Andre


> Best,
> Veda
>>
>> Cheers,
>> Andre
>>
>>> Thank you,
>>> Veda
>>>> +
>>>> +    attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
>>>> +    if (!attrs->image_dir)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    INIT_LIST_HEAD(&attrs->image_node);
>>>> +    attrs->image_name = image_name;
>>>> +    attrs->cpu_rendezvous_forced = 1;
>>>> +    set_image_flags(attrs, seq_id, image_flags, reg_current_ver,
>>>> +            reg_pending_ver);
>>>> +
>>>> +    /*
>>>> +     * The attributes for each sysfs file are constant (handler 
>>>> functions,
>>>> +     * name and permissions are the same within each directory), 
>>>> but we
>>>> +     * need a per-directory copy regardless, to get a unique handle
>>>> +     * for each directory, so that container_of can do its magic.
>>>> +     * Also this requires an explicit sysfs_attr_init(), since it's 
>>>> a new
>>>> +     * copy, to make LOCKDEP happy.
>>>> +     */
>>>> +    memcpy(attrs->image_attrs, image_attrs_group,
>>>> +           sizeof(attrs->image_attrs));
>>>> +    for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++) {
>>>> +        struct attribute *attr = &attrs->image_attrs[i].attr;
>>>> +
>>>> +        sysfs_attr_init(attr);
>>>> +        ret = sysfs_create_file(attrs->image_dir, attr);
>>>> +        if (ret) {
>>>> +            pr_err("creating sysfs file for uuid %s: %d\n",
>>>> +                   fw_uuid, ret);
>>>> +            clean_fw_images_tree();
>>>> +
>>>> +            return ret;
>>>> +        }
>>>> +    }
>>>> +    list_add(&attrs->image_node, &lfa_fw_images);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int update_fw_images_tree(void)
>>>> +{
>>>> +    struct arm_smccc_1_2_regs reg = { 0 };
>>>> +    struct uuid_regs image_uuid;
>>>> +    char image_id_str[40];
>>>> +    int ret, num_of_components;
>>>> +
>>>> +    num_of_components = get_nr_lfa_components();
>>>> +    if (num_of_components <= 0) {
>>>> +        pr_err("Error getting number of LFA components\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    for (int i = 0; i < num_of_components; i++) {
>>>> +        reg.a0 = LFA_1_0_FN_GET_INVENTORY;
>>>> +        reg.a1 = i; /* fw_seq_id under consideration */
>>>> +        arm_smccc_1_2_invoke(&reg, &reg);
>>>> +        if (reg.a0 == LFA_SUCCESS) {
>>>> +            image_uuid.uuid_lo = reg.a1;
>>>> +            image_uuid.uuid_hi = reg.a2;
>>>> +
>>>> +            snprintf(image_id_str, sizeof(image_id_str), "%pUb",
>>>> +                 &image_uuid);
>>>> +            ret = update_fw_image_node(image_id_str, i,
>>>> +                            reg.a3, reg.a4, reg.a5);
>>>> +            if (ret)
>>>> +                return ret;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int __init lfa_init(void)
>>>> +{
>>>> +    struct arm_smccc_1_2_regs reg = { 0 };
>>>> +    int err;
>>>> +
>>>> +    reg.a0 = LFA_1_0_FN_GET_VERSION;
>>>> +    arm_smccc_1_2_invoke(&reg, &reg);
>>>> +    if (reg.a0 == -LFA_NOT_SUPPORTED) {
>>>> +        pr_info("Live Firmware activation: no firmware agent 
>>>> found\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
>>>> +                         WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
>>>> +    if (!fw_images_update_wq) {
>>>> +        pr_err("Live Firmware Activation: Failed to allocate 
>>>> workqueue.\n");
>>>> +
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    pr_info("Live Firmware Activation: detected v%ld.%ld\n",
>>>> +        reg.a0 >> 16, reg.a0 & 0xffff);
>>>> +
>>>> +    lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
>>>> +    if (!lfa_dir)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    mutex_lock(&lfa_lock);
>>>> +    err = update_fw_images_tree();
>>>> +    if (err != 0)
>>>> +        kobject_put(lfa_dir);
>>>> +
>>>> +    mutex_unlock(&lfa_lock);
>>>> +    return err;
>>>> +}
>>>> +module_init(lfa_init);
>>>> +
>>>> +static void __exit lfa_exit(void)
>>>> +{
>>>> +    flush_workqueue(fw_images_update_wq);
>>>> +    destroy_workqueue(fw_images_update_wq);
>>>> +
>>>> +    mutex_lock(&lfa_lock);
>>>> +    clean_fw_images_tree();
>>>> +    mutex_unlock(&lfa_lock);
>>>> +
>>>> +    kobject_put(lfa_dir);
>>>> +}
>>>> +module_exit(lfa_exit);
>>>> +
>>>> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
>>>> +MODULE_LICENSE("GPL");
>>>
>>
> 

