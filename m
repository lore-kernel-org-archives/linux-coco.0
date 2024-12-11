Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A1722C353
	for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925334; cv=none; b=PAq8pWd3jphvB5XLjJLcGohgVFb7XvkzOJr5c6Uq0ZChlDXFGeGmcFZX/yfuiUFpfSIoMTBrCSz/ujInfIr5Y0qO/ddizhH9cLD8IJhraTQh6RrFXBZsJFNLibkpehQPCNoiXNIMNvR1astzrxIAQf0ewdEbJIlZGqm//mlMVVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925334; c=relaxed/simple;
	bh=XXGOt+wUuN34kty62vBmiJ+sscDkVdQ/z6Qhs740dZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibiYDTfWP6A4KD2sIwxS4hjSnE7w0x5ND3OZpYowUd+29VHUbnl1Z3ohYuuAhP3mPyuxtaCBt8TkZigTzBZ3D/IbDB6WrS+vfLkqDlr4uzwbeu2n02+ihUnutPazOPnKrcqrzIVQeJCtDFytCTo32biFwbgr7yEMLoqN/eAhFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 215BC1063;
	Wed, 11 Dec 2024 05:55:58 -0800 (PST)
Received: from [10.57.70.84] (unknown [10.57.70.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3FA113F720;
	Wed, 11 Dec 2024 05:55:28 -0800 (PST)
Message-ID: <6a506ccb-bb8f-425b-9b93-771a45d2b8f2@arm.com>
Date: Wed, 11 Dec 2024 13:55:26 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] configfs-tsm: Namespace TSM report symbols
Content-Language: en-GB
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Yilun Xu <yilun.xu@intel.com>, Samuel Ortiz <sameo@rivosinc.com>,
 Alexey Kardashevskiy <aik@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sami Mujawar <sami.mujawar@arm.com>, Steven Price <steven.price@arm.com>,
 linux-pci@vger.kernel.org, gregkh@linuxfoundation.org
References: <173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com>
 <173343740180.1074769.15809313632664416174.stgit@dwillia2-xfh.jf.intel.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <173343740180.1074769.15809313632664416174.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 22:23, Dan Williams wrote:
> In preparation for new + common TSM (TEE Security Manager)
> infrastructure, namespace the TSM report symbols in tsm.h with an
> _REPORT suffix to differentiate them from other incoming tsm work.
> 
> Cc: Yilun Xu <yilun.xu@intel.com>
> Cc: Samuel Ortiz <sameo@rivosinc.com>
> Cc: Alexey Kardashevskiy <aik@amd.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

> ---
>   Documentation/ABI/testing/configfs-tsm-report   |    0
>   MAINTAINERS                                     |    2 +
>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |    8 +++---

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

