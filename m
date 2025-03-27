Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5200020D4FF
	for <linux-coco@lists.linux.dev>; Thu, 27 Mar 2025 10:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069799; cv=none; b=bdNUOIltOfTjsVNOvsxdVNO92Fx9GelJb16dC8ZIfYV7A45qY9UBODig1upcvl+TIf+JBgqSQ3pKGUIKLkYDyHxbmPaat+VZTxdN5xvhIEe5UYhyeOOPJcaAPzi/yFObGG1m+RW9T0LQZKHsbgNthr2KaAzusYQnZwBjN7TZZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069799; c=relaxed/simple;
	bh=CmAPsH19acTNxiJ34GcKSbeKXsn1qSM3hxBrxhPstDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nHznO0ByIgHWTFhcWvKABT5HwZfV/GUt9nJ6APhjZWmUtzW9W9ltkvwGq9azik3RcDEnBC02uPnepRGDZlrE1ZjnLb6sgiOMLO5lhw9kQK0PEkFwvBHzQMD+wQSwETnEDxpLKTnpImUrt4/u2maQqDSyoSVDhtTClpv2GJIs3eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZhTVkAx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZhTVkAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743069796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTTe6v1RbdaUcztapWTUL8QyTrGJ+1Apq/8VVkFKQn4=;
	b=PZhTVkAxMP6KEUkrmtUPWq3Z/7Z0bYwWLe+ZYKw44hQPa1Rrx5NLv+hJgHzjdi73jU9yZQ
	xpciZz8i/BnfRY8fahsGecdxdatwqaQyMJxVTuDVT5RrXh63kVGJDPQZczJCcCbhQF7vwv
	TUQe6VvAPOtmy/u3FZs9rFzp6wAqCn8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161--S1d9oGwMaKqvkF__KLCUg-1; Thu, 27 Mar 2025 06:03:14 -0400
X-MC-Unique: -S1d9oGwMaKqvkF__KLCUg-1
X-Mimecast-MFC-AGG-ID: -S1d9oGwMaKqvkF__KLCUg_1743069793
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac287f28514so5511866b.0
        for <linux-coco@lists.linux.dev>; Thu, 27 Mar 2025 03:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069793; x=1743674593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTTe6v1RbdaUcztapWTUL8QyTrGJ+1Apq/8VVkFKQn4=;
        b=cfyfLJq1W5qtIrMuFVJXG82Twt+d9oFePvGmq5YcjUybb7LRYqImhJ7qg+Gp7wt0Q3
         W6Wigi8sMQqo5IsTTIim7sRPoDmbY0Ftw0+C8LRdPTFReqlC/E/LiP/N9Gg53+XeK94z
         j+rM/aBnkY/Nk58AeHvNO2yKCk8vyph2NHIVQCPrR7elZp8r8f6TNb8nZv4nYOBEgX8y
         LGLiu+/VCDiN+0zZO8/TZFPgwgeuxmZ0i1XC/iUKaYgKddOzyiNayT1kzp77dBf/hANy
         ps7H3YrYwtKgGJMiX5JWoAW7hSbsOGajZKmnQhOmu2z/SFcZ5Gy/JlDU0VKu5KZZtqGA
         DKsA==
X-Forwarded-Encrypted: i=1; AJvYcCXMP/5/iTn6p6ZuFxc1lPCqYvLO6jDw8H2jNE0RX67f1YchmbiOVkoykZzxZ6a4WYBEX0yQnfV2S18a@lists.linux.dev
X-Gm-Message-State: AOJu0YyHwHatZcmvL1Ozt+QN+bJx/iYarQp01OAj6Gxgklgu8OjGLvvD
	kdTIL1ooVSIZkHaO0wIZrUvXlTTt6dafr2WxW1FPo3VZhrPXh5jbyjm294eJpH8kPw3Ol8b2pYU
	A1LWUdauJtefbTtbgux+WzKxZdFqQH+WONyOe2osMIBgwQhweZgn0BTQRpig=
X-Gm-Gg: ASbGncsS7DOPkvRmA+onnNRqbTZE3Fvj0MKX525cmjrcClQ61thDvufgVP0CUcTHBYW
	eCxDIwjSmW0K4mtSGzJwv1Lzisnu98FFUtnXaD4qmbmWsv0KzBv8qmGRk953g9MPt7cc0GKFvwC
	gKo4YtNu0l/ZNzR+en8Qqs2fs2MnUzGzT9U2TvkCYSE44eD8n6qqBgafNSOo/NGsVKhOwf4RwXm
	q0Wnu8DLkpUfeRl+gDOnyPqyX8WBXxkbBSfIY5TfaT4ffkoSpIkLevw8yBZMKAguaLrPW1ZQwHf
	WdJ1FddQGy6iXwze5oTSYNhw8uwGSVos4IBXZ7wXMmD0iaveNuE8y4+wXrCnVBm7
X-Received: by 2002:a17:906:7952:b0:ac6:bca0:eb70 with SMTP id a640c23a62f3a-ac6fb1d6bd0mr212453766b.56.1743069793364;
        Thu, 27 Mar 2025 03:03:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm8OKWNs4u9ViT+uxyhYFue1UOIBeMnyQo1WzfHwB+8yebKYj7pxcxkRwJAxLbxHEcN8yozw==
X-Received: by 2002:a17:906:7952:b0:ac6:bca0:eb70 with SMTP id a640c23a62f3a-ac6fb1d6bd0mr212447466b.56.1743069792573;
        Thu, 27 Mar 2025 03:03:12 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd4800esm1191676166b.164.2025.03.27.03.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:03:12 -0700 (PDT)
Date: Thu, 27 Mar 2025 11:03:07 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Dov Murik <dovmurik@linux.ibm.com>, 
	Dionna Glaze <dionnaglaze@google.com>, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <x3nkctmpbwkldm5aawfpqrw3b5lej5kxuxam7gb2w6nhgzy7kr@gd3mfnigyg6q>
References: <20250324104653.138663-1-sgarzare@redhat.com>
 <20250324104653.138663-4-sgarzare@redhat.com>
 <Z-RV7T7Bwt3Auopx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z-RV7T7Bwt3Auopx@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -qAyrMNT6KQH7WkMEMhdGORdMgiP6TZacubQ6c-TbX8_1743069793
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Mar 26, 2025 at 09:30:53PM +0200, Jarkko Sakkinen wrote:
>On Mon, Mar 24, 2025 at 11:46:48AM +0100, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Add driver for the vTPM defined by the AMD SVSM spec [1].
>>
>> The specification defines a protocol that a SEV-SNP guest OS can use to
>> discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
>> in the guest context, but at a more privileged level (VMPL0).
>>
>> The new tpm-svsm platform driver uses two functions exposed by x86/sev
>> to verify that the device is actually emulated by the platform and to
>> send commands and receive responses.
>>
>> The device cannot be hot-plugged/unplugged as it is emulated by the
>> platform, so we can use module_platform_driver_probe(). The probe
>> function will only check whether in the current runtime configuration,
>> SVSM is present and provides a vTPM.
>>
>> This device does not support interrupts and sends responses to commands
>> synchronously. In order to have .recv() called just after .send() in
>> tpm_try_transmit(), the .status() callback returns 0, and both
>> .req_complete_mask and .req_complete_val are set to 0.
>>
>> [1] "Secure VM Service Module for SEV-SNP Guests"
>>     Publication # 58019 Revision: 1.00
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> v4:
>> - moved "asm" includes after the "linux" includes [Tom]
>> - allocated buffer separately [Tom/Jarkko/Jason]
>> v3:
>> - removed send_recv() ops and followed the ftpm driver implementing .status,
>>   .req_complete_mask, .req_complete_val, etc. [Jarkko]
>> - removed link to the spec because those URLs are unstable [Borislav]
>> ---
>>  drivers/char/tpm/tpm_svsm.c | 155 ++++++++++++++++++++++++++++++++++++
>>  drivers/char/tpm/Kconfig    |  10 +++
>>  drivers/char/tpm/Makefile   |   1 +
>>  3 files changed, 166 insertions(+)
>>  create mode 100644 drivers/char/tpm/tpm_svsm.c
>>
>> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
>> new file mode 100644
>> index 000000000000..1281ff265927
>> --- /dev/null
>> +++ b/drivers/char/tpm/tpm_svsm.c
>> @@ -0,0 +1,155 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
>> + *
>> + * Driver for the vTPM defined by the AMD SVSM spec [1].
>> + *
>> + * The specification defines a protocol that a SEV-SNP guest OS can use to
>> + * discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
>> + * in the guest context, but at a more privileged level (usually VMPL0).
>> + *
>> + * [1] "Secure VM Service Module for SEV-SNP Guests"
>> + *     Publication # 58019 Revision: 1.00
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/tpm_svsm.h>
>> +
>> +#include <asm/sev.h>
>> +
>> +#include "tpm.h"
>> +
>> +struct tpm_svsm_priv {
>> +	void *buffer;
>> +	u8 locality;
>> +};
>> +
>> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +{
>> +	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>> +	int ret;
>> +
>> +	ret = svsm_vtpm_cmd_request_fill(priv->buffer, priv->locality, buf, len);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * The SVSM call uses the same buffer for the command and for the
>> +	 * response, so after this call, the buffer will contain the response
>> +	 * that can be used by .recv() op.
>> +	 */
>> +	return snp_svsm_vtpm_send_command(priv->buffer);
>> +}
>> +
>> +static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
>> +{
>> +	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>> +
>> +	/*
>> +	 * The internal buffer contains the response after we send the command
>> +	 * to SVSM.
>> +	 */
>> +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
>> +}
>> +
>> +static void tpm_svsm_cancel(struct tpm_chip *chip)
>> +{
>> +	/* not supported */
>> +}
>> +
>> +static u8 tpm_svsm_status(struct tpm_chip *chip)
>> +{
>> +	return 0;
>> +}
>> +
>> +static bool tpm_svsm_req_canceled(struct tpm_chip *chip, u8 status)
>> +{
>> +	return false;
>> +}
>> +
>> +static struct tpm_class_ops tpm_chip_ops = {
>> +	.flags = TPM_OPS_AUTO_STARTUP,
>> +	.recv = tpm_svsm_recv,
>> +	.send = tpm_svsm_send,
>> +	.cancel = tpm_svsm_cancel,
>> +	.status = tpm_svsm_status,
>> +	.req_complete_mask = 0,
>> +	.req_complete_val = 0,
>> +	.req_canceled = tpm_svsm_req_canceled,
>
>If this was bundled with the patch set, this would short a lot:
>
>https://lore.kernel.org/linux-integrity/20250326161838.123606-1-jarkko@kernel.org/T/#u
>
>So maybe for v5? Including this patch does not take send_recv()
>out of consideration, it is just smart thing to do in all cases.
>
>It would be probably easiest to roll out my patch together with
>rest of the patch set.

Yeah, I agree. I'll include it in this series and adapt this patch on 
top of it.

Thanks,
Stefano

