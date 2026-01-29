Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B6B34575F
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707610; cv=none; b=HmarWDq1BwyjGMODjKxbxEPkqqwBz0mKwD47xFiSNma3a0qA/7nOtG+hKa5kipKglfsKlaEn/bHG5uLkhwSECLqTeAU1rUej5rItRImGal653HajYngGJyooUDFvl2pw/+rH/S9M0DuH66AU9qDKa+lDm5Btn5UugV75d4MWad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707610; c=relaxed/simple;
	bh=EVt2LX6oELu+f2sI7s303vdlIEFbRt6P45Lra1nU3HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0OFqMod3r1Ru1UkkAhgkUT75eKlPi7RVLGzWpTFhQ76TEwmrT0T4H5xekXFCGyTNciBVbUUBJt2z7ZnoEotureyxAeerK6gLLo5K84/B3pHlDlzSGgJiG0b2Eoi+g/EsOxphQIO8E0vaMONQQhJj7x5CKIOdqlZgbMAS+rzj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52449153B;
	Thu, 29 Jan 2026 09:26:39 -0800 (PST)
Received: from [10.33.50.63] (e142021.arm.com [10.33.50.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF6903F73F;
	Thu, 29 Jan 2026 09:26:42 -0800 (PST)
Message-ID: <8e4b3940-bea0-4c75-80ec-8c5a87cd24a5@arm.com>
Date: Thu, 29 Jan 2026 18:26:40 +0100
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
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <bf1addf9-5e28-46c6-8943-6a359630e533@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vedashree,

many thanks for having a look!

On 1/28/26 00:01, Vedashree Vidwans wrote:
> Hello,
> 
> On 1/19/26 04:27, Salman Nabi wrote:
>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>> activating firmware components without a reboot. Those components
>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>> usual way: via fwupd, FF-A or other secure storage methods, or via some

[ ... ]

>>   drivers/firmware/smccc/Kconfig  |   8 +
>>   drivers/firmware/smccc/Makefile |   1 +
>>   drivers/firmware/smccc/lfa_fw.c | 668 ++++++++++++++++++++++++++++++++
>>   3 files changed, 677 insertions(+)
>>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
>>
[ ... ]
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/ 
>> lfa_fw.c
>> new file mode 100644
>> index 000000000000..ce54049b7190
>> --- /dev/null
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -0,0 +1,668 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Arm Limited
>> + */

[ ... ]

>> +
>> +static int call_lfa_activate(void *data)
>> +{
>> +    struct image_props *attrs = data;
>> +    struct arm_smccc_1_2_regs reg = { 0 };
>> +
>> +    reg.a0 = LFA_1_0_FN_ACTIVATE;
>> +    reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
>> +    /*
>> +     * As we do not support updates requiring a CPU reset (yet),
>> +     * we pass 0 in reg.a3 and reg.a4, holding the entry point and 
>> context
>> +     * ID respectively.
>> +     * cpu_rendezvous_forced is set by the administrator, via sysfs,
>> +     * cpu_rendezvous is dictated by each firmware component.
>> +     */
>> +    reg.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
>> +
>> +    for (;;) {
>> +        arm_smccc_1_2_invoke(&reg, &reg);
>> +
>> +        if ((long)reg.a0 < 0) {
>> +            pr_err("ACTIVATE for image %s failed: %s\n",
>> +                attrs->image_name, lfa_error_strings[-reg.a0]);
>> +            return reg.a0;
>> +        }
>> +        if (!(reg.a1 & LFA_ACTIVATE_CALL_AGAIN))
>> +            break; /* ACTIVATE successful */
>> +    }
> The implementation uses same 'struct arm_smccc_1_2_regs reg' as
> input and output for arm_smccc_1_2_invoke(). Here, reg.a0 (function ID), 
> reg.a1 (fw_seq_id) and reg.a2 (cpu rendezvous) are initialized once 
> before the loop and arm_smccc_1_2_invoke() overwrites the whole register 
> set on every iteration. That means inputs (a0, a1, a2) can be clobbered 
> between loop iterations unless reassigned each time.
> Suggestion: Re-initialize input members of reg on each loop iteration or 
> use a separate 'struct arm_smccc_1_2_regs' for output to avoid input 
> corruption.

Ah, that's a good point and indeed a bug, thanks for spotting this! Will 
fix it.

>> +
>> +    return reg.a0;
>> +}
>> +
>> +static int activate_fw_image(struct image_props *attrs)
>> +{
>> +    int ret;
>> +
>> +    mutex_lock(&lfa_lock);
>> +    if (attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous)
>> +        ret = stop_machine(call_lfa_activate, attrs, cpu_online_mask);
>> +    else
>> +        ret = call_lfa_activate(attrs);
>> +
>> +    if (ret != 0) {
>> +        mutex_unlock(&lfa_lock);
>> +        return lfa_cancel(attrs);
>> +    }
>> +
>> +    /*
>> +     * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
>> +     * number of firmware images in the LFA agent may change after a
>> +     * successful activation attempt. Negate all image flags as well.
>> +     */
>> +    attrs = NULL;
>> +    list_for_each_entry(attrs, &lfa_fw_images, image_node) {
>> +        set_image_flags(attrs, -1, 0b1000, 0, 0);
>> +    }
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
>> +    queue_work(fw_images_update_wq, &fw_images_update_work);
>> +    mutex_unlock(&lfa_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static int prime_fw_image(struct image_props *attrs)
>> +{
>> +    struct arm_smccc_1_2_regs reg = { 0 };
>> +    int ret;
>> +
>> +    mutex_lock(&lfa_lock);
>> +    /* Avoid SMC calls on invalid firmware images */
>> +    if (attrs->fw_seq_id == -1) {
>> +        pr_err("Arm LFA: Invalid firmware sequence id\n");
>> +        mutex_unlock(&lfa_lock);
>> +
>> +        return -ENODEV;
>> +    }
>> +
>> +    if (attrs->may_reset_cpu) {
>> +        pr_err("CPU reset not supported by kernel driver\n");
>> +        mutex_unlock(&lfa_lock);
>> +
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * LFA_PRIME/ACTIVATE will return 1 in reg.a1 if the firmware
>> +     * priming/activation is still in progress. In that case
>> +     * LFA_PRIME/ACTIVATE will need to be called again.
>> +     * reg.a1 will become 0 once the prime/activate process completes.
>> +     */
>> +    reg.a0 = LFA_1_0_FN_PRIME;
>> +    reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
>> +    for (;;) {
>> +        arm_smccc_1_2_invoke(&reg, &reg);
>> +
>> +        if ((long)reg.a0 < 0) {
>> +            pr_err("LFA_PRIME for image %s failed: %s\n",
>> +                attrs->image_name, lfa_error_strings[-reg.a0]);
>> +            mutex_unlock(&lfa_lock);
>> +
>> +            return reg.a0;
>> +        }
>> +        if (!(reg.a1 & LFA_PRIME_CALL_AGAIN)) {
>> +            ret = 0;
>> +            break; /* PRIME successful */
>> +        }
>> +    }
> Similar comment to call_lfa_activate(). Suggestion to either re-assign 
> 'struct arm_smccc_1_2_regs' input values on each loop iteration or use a 
> separate 'struct arm_smccc_1_2_regs' for output to avoid input 
> corruption between loop iterations. This matches the intended 
> 'CALL_AGAIN' protocal while keeping the inputs stable across retries.

Indeed, good catch.

>> +
>> +    mutex_unlock(&lfa_lock);
>> +    return ret;
> The introduction of separate 'ret' cariable does not appear necessary 
> for functional correctness. The SMCCC status is conveyed via reg.a0 on 
> each iteration, so returning reg.a0 should preserve existing behavior.
> If 'ret' must be kept, consider initializing it to 0 at declaration 
> time. That avoids setting ret = 0 inside 'PRIME successful' path and 
> leads to simpler control flow.

Right, looks like a leftover from a previous version, it's indeed not 
needed.

>> +}
>> +
>> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute 
>> *attr,
>> +             char *buf)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                         image_attrs[LFA_ATTR_NAME]);
>> +
>> +    return sysfs_emit(buf, "%s\n", attrs->image_name);
>> +}
>> +
>> +static ssize_t activation_capable_show(struct kobject *kobj,
>> +                       struct kobj_attribute *attr, char *buf)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                     image_attrs[LFA_ATTR_ACT_CAPABLE]);
>> +
>> +    return sysfs_emit(buf, "%d\n", attrs->activation_capable);
>> +}
>> +
>> +static ssize_t activation_pending_show(struct kobject *kobj,
>> +                       struct kobj_attribute *attr, char *buf)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                     image_attrs[LFA_ATTR_ACT_PENDING]);
>> +    struct arm_smccc_1_2_regs reg = { 0 };
>> +
>> +    /*
>> +     * Activation pending status can change anytime thus we need to 
>> update
>> +     * and return its current value
>> +     */
>> +    reg.a0 = LFA_1_0_FN_GET_INVENTORY;
>> +    reg.a1 = attrs->fw_seq_id;
>> +    arm_smccc_1_2_invoke(&reg, &reg);
>> +    if (reg.a0 == LFA_SUCCESS)
>> +        attrs->activation_pending = !!(reg.a3 & BIT(1));
>> +
>> +    return sysfs_emit(buf, "%d\n", attrs->activation_pending);
>> +}
>> +
>> +static ssize_t may_reset_cpu_show(struct kobject *kobj,
>> +                  struct kobj_attribute *attr, char *buf)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                     image_attrs[LFA_ATTR_MAY_RESET_CPU]);
>> +
>> +    return sysfs_emit(buf, "%d\n", attrs->may_reset_cpu);
>> +}
>> +
>> +static ssize_t cpu_rendezvous_show(struct kobject *kobj,
>> +                   struct kobj_attribute *attr, char *buf)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                     image_attrs[LFA_ATTR_CPU_RENDEZVOUS]);
>> +
>> +    return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous);
>> +}
>> +
>> +static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
>> +                      struct kobj_attribute *attr,
>> +                      const char *buf, size_t count)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
>> +    int ret;
>> +
>> +    ret = kstrtobool(buf, &attrs->cpu_rendezvous_forced);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,
>> +                     struct kobj_attribute *attr, char *buf)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
>> +
>> +    return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous_forced);
>> +}
>> +
>> +static ssize_t current_version_show(struct kobject *kobj,
>> +                    struct kobj_attribute *attr, char *buf)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                image_attrs[LFA_ATTR_CURRENT_VERSION]);
>> +    u32 maj, min;
>> +
>> +    maj = attrs->current_version >> 32;
>> +    min = attrs->current_version & 0xffffffff;
>> +    return sysfs_emit(buf, "%u.%u\n", maj, min);
>> +}
>> +
>> +static ssize_t pending_version_show(struct kobject *kobj,
>> +                    struct kobj_attribute *attr, char *buf)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                     image_attrs[LFA_ATTR_ACT_PENDING]);
>> +    struct arm_smccc_1_2_regs reg = { 0 };
>> +    u32 maj, min;
>> +
>> +    /*
>> +     * Similar to activation pending, this value can change following an
>> +     * update, we need to retrieve fresh info instead of stale 
>> information.
>> +     */
>> +    reg.a0 = LFA_1_0_FN_GET_INVENTORY;
>> +    reg.a1 = attrs->fw_seq_id;
>> +    arm_smccc_1_2_invoke(&reg, &reg);
>> +    if (reg.a0 == LFA_SUCCESS) {
>> +        if (reg.a5 != 0 && attrs->activation_pending)
>> +        {
>> +            attrs->pending_version = reg.a5;
>> +            maj = reg.a5 >> 32;
>> +            min = reg.a5 & 0xffffffff;
>> +        }
>> +    }
>> +
>> +    return sysfs_emit(buf, "%u.%u\n", maj, min);
>> +}
>> +
>> +static ssize_t activate_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>> +                  const char *buf, size_t count)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                     image_attrs[LFA_ATTR_ACTIVATE]);
>> +    int ret;
>> +
>> +    ret = prime_fw_image(attrs);
>> +    if (ret) {
>> +        pr_err("Firmware prime failed: %s\n",
>> +            lfa_error_strings[-ret]);
>> +        return -ECANCELED;
>> +    }
>> +
>> +    ret = activate_fw_image(attrs);
>> +    if (ret) {
>> +        pr_err("Firmware activation failed: %s\n",
>> +            lfa_error_strings[-ret]);
>> +        return -ECANCELED;
>> +    }
>> +
>> +    pr_info("Firmware activation succeeded\n");
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t cancel_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>> +                const char *buf, size_t count)
>> +{
>> +    struct image_props *attrs = container_of(attr, struct image_props,
>> +                         image_attrs[LFA_ATTR_CANCEL]);
>> +    int ret;
>> +
>> +    ret = lfa_cancel(attrs);
>> +    if (ret != 0)
>> +        return ret;
>> +
>> +    return count;
>> +}
>> +
>> +static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>> +    [LFA_ATTR_NAME]            = __ATTR_RO(name),
>> +    [LFA_ATTR_CURRENT_VERSION]    = __ATTR_RO(current_version),
>> +    [LFA_ATTR_PENDING_VERSION]    = __ATTR_RO(pending_version),
>> +    [LFA_ATTR_ACT_CAPABLE]        = __ATTR_RO(activation_capable),
>> +    [LFA_ATTR_ACT_PENDING]        = __ATTR_RO(activation_pending),
>> +    [LFA_ATTR_MAY_RESET_CPU]    = __ATTR_RO(may_reset_cpu),
>> +    [LFA_ATTR_CPU_RENDEZVOUS]    = __ATTR_RO(cpu_rendezvous),
>> +    [LFA_ATTR_FORCE_CPU_RENDEZVOUS]    = 
>> __ATTR_RW(force_cpu_rendezvous),
>> +    [LFA_ATTR_ACTIVATE]        = __ATTR_WO(activate),
>> +    [LFA_ATTR_CANCEL]        = __ATTR_WO(cancel)
>> +};
>> +
>> +static void clean_fw_images_tree(void)
>> +{
>> +    struct image_props *attrs, *tmp;
>> +
>> +    list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node)
>> +        delete_fw_image_node(attrs);
>> +}
>> +
>> +static int update_fw_image_node(char *fw_uuid, int seq_id,
>> +                      u32 image_flags, u64 reg_current_ver,
>> +                      u64 reg_pending_ver)
>> +{
>> +    const char *image_name = "(unknown)";
>> +    struct image_props *attrs;
>> +    int ret;
>> +
>> +    /*
>> +     * If a fw_image is already in the images list then we just update
>> +     * its flags and seq_id instead of trying to recreate it.
>> +     */
>> +    list_for_each_entry(attrs, &lfa_fw_images, image_node) {
>> +        if (!strcmp(attrs->image_dir->name, fw_uuid)) {
>> +            set_image_flags(attrs, seq_id, image_flags,
>> +                    reg_current_ver, reg_pending_ver);
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
>> +    if (!attrs)
>> +        return -ENOMEM;
>> +
>> +    for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
>> +        if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
>> +            image_name = fw_images_uuids[i].name;
>> +    }
> I would recommend using fw_uuid as the image_name when UUID is not
> found in fw_images_uuids[], currently the driver assigns 'unknown'
> in such case.
> There is a valid possibility that platform-specific FW images, not
> listed in fw_images_uuids[], are used by LFA agent for live FW
> activation. In such scenarios, falling back to 'unknown' would lose
> important information especially when errors surface in
> call_lfa_activate(). Using UUID directly would indicate which
> image failed or behaved unexpectedly.

Well, I think if you want to identify an image clearly, you always have 
to use the UUID, as shown by the directory name. The "name" sysfs file 
is there just for convenience, to make this easier for *users* when 
dealing with well-known firmware image. As you rightly said, we can 
never guarantee that the kernel knows a certain UUID, and it wouldn't be 
necessary for proper operation at all.
So I was expecting this name to be only used by reporting scripts or 
such. But indeed some "unknown" string is a bit fragile as a placeholder 
name, I was wondering if we should just provide an empty string in this 
case? This would allow scripts to detect this special case reliably and 
provide their own rendering then.
Does this make sense?

Cheers,
Andre

> Thank you,
> Veda
>> +
>> +    attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
>> +    if (!attrs->image_dir)
>> +        return -ENOMEM;
>> +
>> +    INIT_LIST_HEAD(&attrs->image_node);
>> +    attrs->image_name = image_name;
>> +    attrs->cpu_rendezvous_forced = 1;
>> +    set_image_flags(attrs, seq_id, image_flags, reg_current_ver,
>> +            reg_pending_ver);
>> +
>> +    /*
>> +     * The attributes for each sysfs file are constant (handler 
>> functions,
>> +     * name and permissions are the same within each directory), but we
>> +     * need a per-directory copy regardless, to get a unique handle
>> +     * for each directory, so that container_of can do its magic.
>> +     * Also this requires an explicit sysfs_attr_init(), since it's a 
>> new
>> +     * copy, to make LOCKDEP happy.
>> +     */
>> +    memcpy(attrs->image_attrs, image_attrs_group,
>> +           sizeof(attrs->image_attrs));
>> +    for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++) {
>> +        struct attribute *attr = &attrs->image_attrs[i].attr;
>> +
>> +        sysfs_attr_init(attr);
>> +        ret = sysfs_create_file(attrs->image_dir, attr);
>> +        if (ret) {
>> +            pr_err("creating sysfs file for uuid %s: %d\n",
>> +                   fw_uuid, ret);
>> +            clean_fw_images_tree();
>> +
>> +            return ret;
>> +        }
>> +    }
>> +    list_add(&attrs->image_node, &lfa_fw_images);
>> +
>> +    return ret;
>> +}
>> +
>> +static int update_fw_images_tree(void)
>> +{
>> +    struct arm_smccc_1_2_regs reg = { 0 };
>> +    struct uuid_regs image_uuid;
>> +    char image_id_str[40];
>> +    int ret, num_of_components;
>> +
>> +    num_of_components = get_nr_lfa_components();
>> +    if (num_of_components <= 0) {
>> +        pr_err("Error getting number of LFA components\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    for (int i = 0; i < num_of_components; i++) {
>> +        reg.a0 = LFA_1_0_FN_GET_INVENTORY;
>> +        reg.a1 = i; /* fw_seq_id under consideration */
>> +        arm_smccc_1_2_invoke(&reg, &reg);
>> +        if (reg.a0 == LFA_SUCCESS) {
>> +            image_uuid.uuid_lo = reg.a1;
>> +            image_uuid.uuid_hi = reg.a2;
>> +
>> +            snprintf(image_id_str, sizeof(image_id_str), "%pUb",
>> +                 &image_uuid);
>> +            ret = update_fw_image_node(image_id_str, i,
>> +                            reg.a3, reg.a4, reg.a5);
>> +            if (ret)
>> +                return ret;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init lfa_init(void)
>> +{
>> +    struct arm_smccc_1_2_regs reg = { 0 };
>> +    int err;
>> +
>> +    reg.a0 = LFA_1_0_FN_GET_VERSION;
>> +    arm_smccc_1_2_invoke(&reg, &reg);
>> +    if (reg.a0 == -LFA_NOT_SUPPORTED) {
>> +        pr_info("Live Firmware activation: no firmware agent found\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
>> +                         WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
>> +    if (!fw_images_update_wq) {
>> +        pr_err("Live Firmware Activation: Failed to allocate 
>> workqueue.\n");
>> +
>> +        return -ENOMEM;
>> +    }
>> +
>> +    pr_info("Live Firmware Activation: detected v%ld.%ld\n",
>> +        reg.a0 >> 16, reg.a0 & 0xffff);
>> +
>> +    lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
>> +    if (!lfa_dir)
>> +        return -ENOMEM;
>> +
>> +    mutex_lock(&lfa_lock);
>> +    err = update_fw_images_tree();
>> +    if (err != 0)
>> +        kobject_put(lfa_dir);
>> +
>> +    mutex_unlock(&lfa_lock);
>> +    return err;
>> +}
>> +module_init(lfa_init);
>> +
>> +static void __exit lfa_exit(void)
>> +{
>> +    flush_workqueue(fw_images_update_wq);
>> +    destroy_workqueue(fw_images_update_wq);
>> +
>> +    mutex_lock(&lfa_lock);
>> +    clean_fw_images_tree();
>> +    mutex_unlock(&lfa_lock);
>> +
>> +    kobject_put(lfa_dir);
>> +}
>> +module_exit(lfa_exit);
>> +
>> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
>> +MODULE_LICENSE("GPL");
> 

