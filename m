Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A687CA5A
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764992; cv=none; b=psffXR5bVX8DUBwGjasLNouRH57utP0Vb6wyrV0sUTz+OcqUuxloLrceVZ6/YECGk7miyUmEfeppb2CnmYx6uPzKUHuzEjfgcS3Ym2lABzOZ1y6MewNzNG/86ShL/TYvuwLrNGHbalviqswYMj8JAgsGf6AxLYGyg9/ITYiiE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764992; c=relaxed/simple;
	bh=52lWMczGKHZvEJn7oAy5U2Gjb81vsaAdQyKAug/jxIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LELDoyNTklQK6jArgciBmZTy7W++rjeg13//HcVxRa+C+ECvsSIrrzrGKeM+xAB9eOVm5X1/TIe6bnW/uDyu+zr3qAX/KwfkGXdczPIe9/GwhZz4sMEjlmtAp+0WNrWjErvPesj/nhIZY4WMqZtMRRjL6ogSV7JXwx8dM5+9nwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qcQTSWwm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qcQTSWwm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 333281762;
	Thu, 14 May 2026 06:23:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BDAA3F836;
	Thu, 14 May 2026 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778764990; bh=52lWMczGKHZvEJn7oAy5U2Gjb81vsaAdQyKAug/jxIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcQTSWwmow5qyPzQbZ75EveQmTxgqPM2UdSpBqi7eQnlwFLAGQ/YXnmnH1rg/pkfg
	 OYimjJRdH5gb4e+D/Xu6TEaYnxSUtEA4ky2sS6g+efEhXcciz/318ClKBtWQx5IzTR
	 wrALKYw4YlhnPiMuHinwCzEzy/0prDOnHzVuM6HY=
Date: Thu, 14 May 2026 14:23:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <agXMuSIGAEXz88xY@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514094030.42495-2-aneesh.kumar@kernel.org>

On Thu, May 14, 2026 at 03:10:28PM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/drivers/firmware/smccc/rmm.h b/drivers/firmware/smccc/rmm.h
> new file mode 100644
> index 000000000000..a47a650d4f51
> --- /dev/null
> +++ b/drivers/firmware/smccc/rmm.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _SMCCC_RMM_H
> +#define _SMCCC_RMM_H
> +
> +#include <linux/platform_device.h>
> +
> +#ifdef CONFIG_ARM64
> +#include <asm/rsi_cmds.h>
> +void __init register_rsi_device(struct platform_device *pdev);
> +#else
> +
> +static void __init register_rsi_device(struct platform_device *pdev)

Nit: static inline here (I think Sashiko mentioned it on a previous
version.

> +{
> +
> +}

And unnecessary empty line between curly braces.

Just these notpicks for now. Suzuki and Sudeep already covered the
splitting of this patch and we need to agree on the sysfs hierarchy.

-- 
Catalin
