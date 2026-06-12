Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A25138E11C;
	Fri, 12 Jun 2026 05:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781242874; cv=none; b=XlrKOjkLfNzoduxvAFNNPkSIm09zXySy1KKbWbWaNUH1jF6/2G3hjgGkqaZ2wCZ7OlNtwjwTeYd/jeea2RBtdIpgHCeI47+L0DOENuOJRwuCfS4/CwV5FSeVCN6LIxE/mkDOc7q3CSjbavJrK9k9aiANwaaKr8dPCBPShdeaW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781242874; c=relaxed/simple;
	bh=alXJcuiZ79e8o19bRq7VL4+xFvAo8kK+X99Ch2O2bD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jqd16zUJVLqJnGL2mUnBoC5IeL/PZhUGJt5l4NsX2UwNGPiISRfLypPMKzGmNvO5hTtxBChk9vJ7faG1NFgg0GE10vTUWnot8nJVnKLkLc3M3Y7Owz+1mg1Kms4Dmk9tya8BGZZNJgMBnvxrydnKIq9ZmV9M+tfdt5RzMmtf9yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/0HuaVV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/0HuaVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507891F000E9;
	Fri, 12 Jun 2026 05:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781242872;
	bh=ZrlCKzvFsyxGrxQK3KvEE4LY6nBZ6Rnv7YfgKkrzOIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P/0HuaVV38AfmIGLj++Oa3uvFtlo76KtgEUe/JBTlKIS3pwTnxrWAmjZrib9C4eMB
	 XNY35ihgn30HbafuVL9YMTqR42haFVp2ildahYKETPRgTIGL/3p9F3vqF+yLc0VoOJ
	 zZF5fp7b7Izp9KPHmFImJgWUb5FzQlti4QRgoJYSfCD7xL6rasIukNwvyHzAWHELzP
	 Qt/nWeqMnHnW7CwfjlAbG044pBnK9nWANg/JsL/hV/6zp72SxP1kvOf15eG9+67O0C
	 9B+xAE0PaR604D392rDMPD9oop876felITahXdEDvR0US6k/vfwH2gX7C0n9K68Z2O
	 qljPW3aeKI1NA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v7 3/6] firmware: smccc: Move RSI definitions to
 include/linux
In-Reply-To: <b009e840-6b79-415c-a3da-705ea569af38@arm.com>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-4-aneesh.kumar@kernel.org>
 <b009e840-6b79-415c-a3da-705ea569af38@arm.com>
Date: Fri, 12 Jun 2026 11:11:04 +0530
Message-ID: <yq5a4ij8mi33.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 11/06/2026 14:04, Aneesh Kumar K.V (Arm) wrote:
>> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
>> architecture specific definitions. Follow-up changes need to use them from
>> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
>> driver.
>> 
>> Move the RSI SMCCC definitions from arch/arm64/include/asm/ to
>> include/linux/ so they can be shared with the driver code. This also
>> keeps the firmware interface outside architecture code, as requested [1].
>
> Please could we also mention about moving the "wrappers" only used by
> drivers accordingly ?
>

Added this

Not all helpers in rsi_cmds.h are used by architecture code. The
attestation token helper wrappers are only used by the Arm CCA guest
driver, so move them to a driver-private header under
drivers/virt/coco/arm-cca-guest/. Keep the remaining RSI command helpers,
which are shared by architecture code and drivers, in the arm64 header.


>
>> 
>> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   arch/arm64/include/asm/rsi_cmds.h             | 74 +---------------
>>   .../virt/coco/arm-cca-guest/arm-cca-guest.c   |  2 +
>>   drivers/virt/coco/arm-cca-guest/rsi.h         | 84 +++++++++++++++++++
>>   .../linux/arm-smccc-rsi.h                     |  6 +-
>>   4 files changed, 90 insertions(+), 76 deletions(-)
>>   create mode 100644 drivers/virt/coco/arm-cca-guest/rsi.h
>>   rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)
>> 
>> diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
>> index 2c8763876dfb..633123a4e5d5 100644
>> --- a/arch/arm64/include/asm/rsi_cmds.h
>> +++ b/arch/arm64/include/asm/rsi_cmds.h
>> @@ -8,10 +8,9 @@
>>   
>>   #include <linux/arm-smccc.h>
>>   #include <linux/string.h>
>> +#include <linux/arm-smccc-rsi.h>
>
> super minor nit: Please keep them in the alphabetical order.
>
> With that:
>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>

Thanks
-aneesh
