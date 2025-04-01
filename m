Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A638F1E9B32
	for <linux-coco@lists.linux.dev>; Tue,  1 Apr 2025 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498547; cv=none; b=OcrtkasEc/qB64ZZEdvkuENIXBrhAwuZ7Phwr4vE9JRlj87W+v0hvImCaOj5FFo4dBQxpjOy+rR7jRk66f2tcL2ZS8Ej8d0nQX9ak7ZGklKW9f3kVQI1133fUKhLg97CYcMcIMJHzhj0Is3RUkb0oVTOyoj/qoSKxK0XooQ8hSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498547; c=relaxed/simple;
	bh=5lTTCkykjVc+615pYDm1tbKWHUbWbcIp/OskVyTpKYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JyaN0Ec60UpaZSozneuy1YGi0oz9OhmYq7M4LsYz6LUJ893MNOdXOTgRbHKj83rh2itip/F2PxM9CvqwVc7EQ3c5m/WkKUrY16aEFu+VWTIeQQ2aksjgznw24drQLyS1PH04jhLZd6WU9XMEc3cPyl7HmRuyrrx4yqjqjMkrss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXOlptPD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXOlptPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743498544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6FdBNadbiO8NrMKuIJpxZXOJgUgdhTXk2/bZ2vOoc=;
	b=SXOlptPDWRbL6PCkmwAgj9jZesyg71ZouegtFKqohhFNXkf0lmb58EC2C8KoKLfp2r4evd
	1VYW1ed7b9g/AD1bSpUiJyqFmlGvDx0T/XUhUll2XZmITMwwo89elTGi9bv9T4koOm6z8M
	eQBFSdGnlz8tYifb/uoEXa/PlvmZcyo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-QfobAlKhMZ-Q_yj2lCFRYA-1; Tue, 01 Apr 2025 05:09:03 -0400
X-MC-Unique: QfobAlKhMZ-Q_yj2lCFRYA-1
X-Mimecast-MFC-AGG-ID: QfobAlKhMZ-Q_yj2lCFRYA_1743498542
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso10515155e9.0
        for <linux-coco@lists.linux.dev>; Tue, 01 Apr 2025 02:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498542; x=1744103342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B6FdBNadbiO8NrMKuIJpxZXOJgUgdhTXk2/bZ2vOoc=;
        b=fmINZ1UzQDKlldR860iGS43q36CcBE/G+2vXvFQGXHF/vNG7Kc8EKzIt4BZOjN6+DB
         bFHCeb0IYZ8eDdk/E27TI1VZdYIyhRnJLPcSaSD9ppPunVBDZxS3YNfxagUeUbx+FM2P
         owSJ6sgj0+duu6Z/rN4Z3THOWYcSBo0dzKoSEX9S9P6QBrxdREIOWajDoFJowfu2IS2L
         tlAw8nTQr0FVs2FnwgP2U4UHaqKZIJL34rKo6FVsoeOCrMRWR1KtDp18utsGQS/91Cb5
         tMCbxG20LnnrLLS3Jm2dJF2yhi13AKrCTP87J0CMCd76UWbGjMBmQr7WwAf0GxdwTJPE
         Rt9A==
X-Forwarded-Encrypted: i=1; AJvYcCUoowA0OQSTuYiu2kOX0J2euxGxaFv1TxEuQS4zLZ+A41lrckcQVLXsUfPJeYGfibtyLwgV48gSiHLp@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4K0nP131KhladBn45/ExJQ1jCtLPMNbFalB5CPfEZu+FLiDcN
	szyRlzgjLfdpf9qHooge9AWObjCrxML1t0JRsZtk+i0yHkXR93RLEL1eaZacXnmToY6zgYTHNqj
	A/E1l7rrwN0to2Mrzdw85vjRAMUvqRzBAkpW2V+XW8rU/t2FpQRPvu+d8u4o=
X-Gm-Gg: ASbGncv+ukCy3k9m4wNaeGWjCmlZJkGpop9Z086vJRO7i/3tGd+fVExDC3ygmuvRz4W
	L1THwb57VqZoipdxx7Lp+gzyeOAJiC/LLZ+kKqqwztpsvGdcUeq2s2wWi9PmTTOg3T7tLyhqc1Y
	lH9sorcUq0pxVpaq+IBBcTkqxuj9blk6UW4BHcWe3zrFEtaXfU8HliA0RffpzPbvo0yjGOptjLH
	PQfbnVBgGcb74BzfpODp6v8Iy4/ZfZSx3HHhC6kFyd0PCkNdzc554WJ6CfqWayJmrgkHGVFmKxp
	3jsNs7FFYRedYTzWHG+g0OAF4+IhUdo2+YaK1lA8rVPR7LbPNQqK44k+V7s=
X-Received: by 2002:a05:600c:4306:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43d91017c92mr119546865e9.1.1743498542237;
        Tue, 01 Apr 2025 02:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFEpGEjpxOXXUrYEHRdUPBQW/kee6tDCG39RsZAEC8EYpXL93ZfovfEJh92VuUYNLO3OsVPA==
X-Received: by 2002:a05:600c:4306:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43d91017c92mr119546475e9.1.1743498541626;
        Tue, 01 Apr 2025 02:09:01 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedc88sm192190275e9.1.2025.04.01.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:09:00 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:08:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, linux-coco@lists.linux.dev, Dov Murik <dovmurik@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <jroedel@suse.de>, x86@kernel.org, 
	Dionna Glaze <dionnaglaze@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v5 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <lzcasqfgrdoicwqnvecqppy4ikhcv7rqxc6huvlzyltvb6cgdj@wclvoes5g4yq>
References: <20250331103900.92701-1-sgarzare@redhat.com>
 <20250331103900.92701-4-sgarzare@redhat.com>
 <Z-rSMi2uCvShLbLS@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z-rSMi2uCvShLbLS@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: buh8KRLW13ICbeJ9EJnJL967T70BHnjIWLwqsIOJONU_1743498542
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Mar 31, 2025 at 08:34:42PM +0300, Jarkko Sakkinen wrote:
>On Mon, Mar 31, 2025 at 12:38:56PM +0200, Stefano Garzarella wrote:
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
>> v5:
>> - removed cancel/status/req_* ops after rebase on master that cotains
>>   commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} opt")
>> v4:
>> - moved "asm" includes after the "linux" includes [Tom]
>> - allocated buffer separately [Tom/Jarkko/Jason]
>> v3:
>> - removed send_recv() ops and followed the ftpm driver implementing .status,
>>   .req_complete_mask, .req_complete_val, etc. [Jarkko]
>> - removed link to the spec because those URLs are unstable [Borislav]
>> ---
>>  drivers/char/tpm/tpm_svsm.c | 135 ++++++++++++++++++++++++++++++++++++
>>  drivers/char/tpm/Kconfig    |  10 +++
>>  drivers/char/tpm/Makefile   |   1 +
>>  3 files changed, 146 insertions(+)
>>  create mode 100644 drivers/char/tpm/tpm_svsm.c
>>
>> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
>> new file mode 100644
>> index 000000000000..04c532421ff2
>> --- /dev/null
>> +++ b/drivers/char/tpm/tpm_svsm.c
>> @@ -0,0 +1,135 @@
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
>> +static struct tpm_class_ops tpm_chip_ops = {
>> +	.flags = TPM_OPS_AUTO_STARTUP,
>> +	.recv = tpm_svsm_recv,
>> +	.send = tpm_svsm_send,
>> +};
>> +
>> +static int __init tpm_svsm_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct tpm_svsm_priv *priv;
>> +	struct tpm_chip *chip;
>> +	int err;
>> +
>> +	if (!snp_svsm_vtpm_probe())
>> +		return -ENODEV;
>> +
>> +	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * The maximum buffer supported is one page (see SVSM_VTPM_MAX_BUFFER
>> +	 * in tpm_svsm.h).
>> +	 */
>> +	priv->buffer = (void *)devm_get_free_pages(dev, GFP_KERNEL, 0);
>> +	if (!priv->buffer)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * FIXME: before implementing locality we need to agree what it means
>> +	 * for the SNP SVSM vTPM
>> +	 */
>> +	priv->locality = 0;
>
>I don't think we want FIXME's to mainline. Instead, don't declare the
>field at all if you don't use it. Just pass zero to *_request_fill().
>
>Maybe "not have the field" is even a better reminder than a random fixme
>comment?

Yeah, I had thought the same, but then I left it that way because it was 
there from the first RFC and I saw several FIXME in the codebase, but I 
agree with you, I'll remove the field completely in v6.

That said, `struct tpm_svsm_priv` with this change will only contain the 
pointer to the buffer, does it make sense to have that structure (maybe 
for the future it's easier to add new fields), or do I remove it and use 
dev_set_drvdata() to store the pointer to the buffer directly?

Thanks,
Stefano

