Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B191740A949
	for <linux-coco@lists.linux.dev>; Tue,  7 Jul 2026 12:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427918; cv=none; b=Cpzf8u2BE2/c4JLMrH8+ZMEGaJiw8pU2ipjUDjlkcq/H93jB5M/ABTRehQmml9ti8NNNVD8zXgALkDKt4XB2dY3JeL2BQ9wCIsDTltEhyuVcwF2HmpP52nehVKfEQJOPrPj1FtEB6BkNEFw1XgY4A577XdpqCKnl/24b6RZjOOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427918; c=relaxed/simple;
	bh=7EEsxew6Es02TjhE1aeKmN/R1EhwCRRSzzS0AJVGpTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3eXWBOq3lGT6yipNhPLLdRaDlywmocsqIklpwHSR6dqNaWJPby10ko38kIx58mcnpwySRqDizk4F3DNO5uYdH402Zwqpr2XR95kjq664wIBEIXqYsFhTxNT9zyxuOKdH6rW/PpjZVZm3YBOeSux8WwMESSeDgUmFvdwD1HfuRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ievhJzwQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ievhJzwQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B323C16F2;
	Tue,  7 Jul 2026 05:38:31 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29BB53F7B4;
	Tue,  7 Jul 2026 05:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783427916; bh=7EEsxew6Es02TjhE1aeKmN/R1EhwCRRSzzS0AJVGpTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ievhJzwQxPfTHhO74oWhdzyr6fOXat6wKNTrqB5pbhq5Rd3N1jUpOnw6Q8gKAaoEe
	 QZBMFUe5Uowmxp+eD/SUlKnniKay0rXFiGQyOwS4O4oCGn8129p1WpsY0v194k5iMa
	 tnvKLSmIh5yFq6KT9gpSCR2AwS2Li0qE8O8B/idc=
Message-ID: <d127e008-00bb-4557-b852-12eb4bdb41ba@arm.com>
Date: Tue, 7 Jul 2026 13:37:52 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] virt: coco: arm-cca-guest: Rename TSM report
 source file
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
 <20260707081351.1680209-5-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260707081351.1680209-5-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2026 09:13, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to arm-cca.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
>   .../virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c}  | 6 +++---
>   2 files changed, 5 insertions(+), 3 deletions(-)
>   rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (97%)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
> index 69eeba08e98a..778146148515 100644
> --- a/drivers/virt/coco/arm-cca-guest/Makefile
> +++ b/drivers/virt/coco/arm-cca-guest/Makefile
> @@ -1,2 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
> +
> +arm-cca-guest-y += arm-cca.o
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> similarity index 97%
> rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
> index d05acddf6c4e..0c9fb61a28f1 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> @@ -184,7 +184,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>   	return ret;
>   }
>   
> -static const struct tsm_report_ops arm_cca_tsm_ops = {
> +static const struct tsm_report_ops arm_cca_tsm_report_ops = {
>   	.name = KBUILD_MODNAME,
>   	.report_new = arm_cca_report_new,
>   };
> @@ -205,7 +205,7 @@ static int __init arm_cca_guest_init(void)
>   	if (!is_realm_world())
>   		return -ENODEV;
>   
> -	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
> +	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
>   	if (ret < 0)
>   		pr_err("Error %d registering with TSM\n", ret);
>   
> @@ -219,7 +219,7 @@ module_init(arm_cca_guest_init);
>    */
>   static void __exit arm_cca_guest_exit(void)
>   {
> -	tsm_report_unregister(&arm_cca_tsm_ops);
> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
>   }
>   module_exit(arm_cca_guest_exit);
>   

