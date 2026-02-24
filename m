Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48933783C2
	for <linux-coco@lists.linux.dev>; Tue, 24 Feb 2026 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930700; cv=none; b=V9T3bZp2ONrjXCmOd4ihhReQ0U9SvXcrDFxXugAtflvAh1ku7TfDE2ZXqlJhGbpsFojEXOCUkW9SxjmkoqQC2FtQoV/d81XlSOybk0LKEKO3KfdgvsgTcABGyKV5VERwMVNag7BmW2M0ke5Iw1FRrcRVJSwE8h8lyir8Nu0W0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930700; c=relaxed/simple;
	bh=6YJ1tLaVnUyOiBg1ekuMrpY4Hr+v2BtpJbPkZhWZfQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEWqfYIOUVr26801DUZaJnyNMDjHExkgAGPN5ADrla4rWR+o0Ne5d5DVLCA1dz0627U1bHG8ffsWsESx1Kkx3q83/SErp+mhoh686cqrwoCIpvrLKjBZy4CG3V498nq9MImptQRkjHSAAGILWPfWkxngk/QQBNn36fn4t1yruz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDF71339;
	Tue, 24 Feb 2026 02:58:11 -0800 (PST)
Received: from [10.41.150.144] (e142021.arm.com [10.41.150.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F4F43F62B;
	Tue, 24 Feb 2026 02:58:15 -0800 (PST)
Message-ID: <3e6aa867-6dae-4770-8a6a-7c79e1cc7892@arm.com>
Date: Tue, 24 Feb 2026 11:58:12 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: smccc: add timeout, touch wdt
To: Vedashree Vidwans <vvidwans@nvidia.com>, salman.nabi@arm.com,
 sudeep.holla@arm.com, lpieralisi@kernel.org, mark.rutland@arm.com,
 trilokkumar.soni@oss.qualcomm.com
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260210224023.2341728-1-vvidwans@nvidia.com>
 <20260210224023.2341728-2-vvidwans@nvidia.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260210224023.2341728-2-vvidwans@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Veda,

On 2/10/26 23:40, Vedashree Vidwans wrote:
> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeout mechanism. This update ensures that any potential hangs are
> detected promptly and that the LFA process is allocated sufficient
> execution time before the watchdog timer expires. These changes improve
> overall system reliability by reducing the risk of undetected process
> stalls and unexpected watchdog resets.

Many thanks for that, I think it's a very good idea to take care of the 
watchdog and to avoid an infinite loop in the AGAIN case.
I have some comments about some details below ....

> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>   drivers/firmware/smccc/lfa_fw.c | 40 +++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index da6b54fe1685..b0ace6fc8dac 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -17,6 +17,9 @@
>   #include <linux/array_size.h>
>   #include <linux/list.h>
>   #include <linux/mutex.h>
> +#include <linux/nmi.h>
> +#include <linux/ktime.h>
> +#include <linux/delay.h>
>   
>   #undef pr_fmt
>   #define pr_fmt(fmt) "Arm LFA: " fmt
> @@ -37,6 +40,14 @@
>   #define LFA_PRIME_CALL_AGAIN		BIT(0)
>   #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>   
> +/* Prime loop limits, TODO: tune after testing */
> +#define LFA_PRIME_BUDGET_US		30000000	/* 30s cap */
> +#define LFA_PRIME_POLL_DELAY_US		10		/* 10us between polls */
> +
> +/* Activation loop limits, TODO: tune after testing */
> +#define LFA_ACTIVATE_BUDGET_US		20000000	/* 20s cap */
> +#define LFA_ACTIVATE_POLL_DELAY_US	10		/* 10us between polls */
> +
>   /* LFA return values */
>   #define LFA_SUCCESS			0
>   #define LFA_NOT_SUPPORTED		1
> @@ -219,6 +230,7 @@ static int call_lfa_activate(void *data)
>   	struct image_props *attrs = data;
>   	struct arm_smccc_1_2_regs args = { 0 };
>   	struct arm_smccc_1_2_regs res = { 0 };
> +	ktime_t end = ktime_add_us(ktime_get(), LFA_ACTIVATE_BUDGET_US);
>   
>   	args.a0 = LFA_1_0_FN_ACTIVATE;
>   	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> @@ -232,6 +244,8 @@ static int call_lfa_activate(void *data)
>   	args.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
>   
>   	for (;;) {
> +		/* Touch watchdog, ACTIVATE shouldn't take longer than watchdog_thresh */
> +		touch_nmi_watchdog();
>   		arm_smccc_1_2_invoke(&args, &res);
>   
>   		if ((long)res.a0 < 0) {
> @@ -241,6 +255,15 @@ static int call_lfa_activate(void *data)
>   		}
>   		if (!(res.a1 & LFA_ACTIVATE_CALL_AGAIN))
>   			break; /* ACTIVATE successful */
> +
> +		/* SMC returned with call_again flag set */
> +		if (ktime_before(ktime_get(), end)) {
> +			udelay(LFA_ACTIVATE_POLL_DELAY_US);

I don't think we should wait here at all, and definitely not with 
udelay: https://docs.kernel.org/timers/delay_sleep_functions.html

Instead we should move the "call again" (and timeout) mechanism out of 
this function, into activate_fw_image(), so that we exit the 
stop_machine(). Otherwise we would still block everything. Doing it 
there, where we should be preemptible, would give the kernel a chance to 
do some housekeeping. If there is nothing for the kernel to do, then I 
think it's fine to immediately call lfa_activate() again, after a 
cond_resched(), for instance.

> +			continue;
> +		}
> +
> +		pr_err("ACTIVATE for image %s timed out", attrs->image_name);
> +		return -ETIMEDOUT;
>   	}
>   
>   	return res.a0;
> @@ -290,6 +313,7 @@ static int prime_fw_image(struct image_props *attrs)
>   {
>   	struct arm_smccc_1_2_regs args = { 0 };
>   	struct arm_smccc_1_2_regs res = { 0 };
> +	ktime_t end = ktime_add_us(ktime_get(), LFA_PRIME_BUDGET_US);
>   	int ret;
>   
>   	mutex_lock(&lfa_lock);
> @@ -317,6 +341,8 @@ static int prime_fw_image(struct image_props *attrs)
>   	args.a0 = LFA_1_0_FN_PRIME;
>   	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
>   	for (;;) {
> +		/* Touch watchdog, PRIME shouldn't take longer than watchdog_thresh */
> +		touch_nmi_watchdog();
>   		arm_smccc_1_2_invoke(&args, &res);
>   
>   		if ((long)res.a0 < 0) {
> @@ -328,6 +354,20 @@ static int prime_fw_image(struct image_props *attrs)
>   		}
>   		if (!(res.a1 & LFA_PRIME_CALL_AGAIN))
>   			break; /* PRIME successful */
> +
> +		/* SMC returned with call_again flag set */
> +		if (ktime_before(ktime_get(), end)) {
> +			udelay(LFA_PRIME_POLL_DELAY_US);

same comment here, please no udelay().
This should also avoid the discussion about the exact values of the 
sleep periods.
I'd just have one generous timeout (a few seconds, basically what your 
BUDGET values do above), to avoid looping forever in case of a firmware 
bug, for instance.

Cheers,
Andre

> +			continue;
> +		}
> +
> +		pr_err("LFA_PRIME for image %s timed out", attrs->image_name);
> +		mutex_unlock(&lfa_lock);
> +
> +		ret = lfa_cancel(attrs);
> +		if (ret != 0)
> +			return ret;
> +		return -ETIMEDOUT;
>   	}
>   
>   	mutex_unlock(&lfa_lock);

