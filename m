Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB6919B3CB
	for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314744; cv=none; b=LcJa3Z6sQsPou1TuiN0+5LoAVA+taPL8Jznn/VqbZsBQJstAGtxyh8tTUymuaL/Gv00JL8GTRoooR2jxbX4lIfi47JkAFqiJ32ROXSIXmnfNzBwTMsDl2LJx+zrt0W4Afi7hNqo0GPBpw14K5IaIsw5zWmUw0Sr2ilMozWjxWII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314744; c=relaxed/simple;
	bh=xezgAHJjH1+Tu2ILpiloHYoZecr29l2Uf5h98HBsK5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mUbV/PNOwWz7JfDchaNoeWyKYvyrnjNkl6TWSF3udVd4dzx85vPdd1dp7eA4n8dWHsGK6ZpatUK86OZON213wC+saYYurIXxuRc6OXOt3O1zp8i4v3bkOg0uz/tbflHE3mnnhckg2udUGSyuox1MULiw0V3j0JR/ioAIGjA0kOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUEucSob; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUEucSob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742314741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ojp+ehhGMDyrZfk37N2dqDkDnZrpGaHqadk7AS/VL4I=;
	b=BUEucSobR30N9OUtW6UZ2M1eCO8T4WTSMak46rIxqfMmXzOlfdmidO8s3bpZuMnsF7QwMe
	0a5iReg4V1j1AB/+vn21S44nj5owWRpvdovPuIiAlDeAZhnJH7Z71YHaNU1lRxaq1KjYgt
	5585r7U5yWn7LM8Y49j56QQE/PuylxU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607--7la7g5jP4yOul_CxhO-_Q-1; Tue, 18 Mar 2025 12:19:00 -0400
X-MC-Unique: -7la7g5jP4yOul_CxhO-_Q-1
X-Mimecast-MFC-AGG-ID: -7la7g5jP4yOul_CxhO-_Q_1742314739
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac28f255a36so449292666b.3
        for <linux-coco@lists.linux.dev>; Tue, 18 Mar 2025 09:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314739; x=1742919539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ojp+ehhGMDyrZfk37N2dqDkDnZrpGaHqadk7AS/VL4I=;
        b=qciDoZbvnm3fTmylbtOTcsJaRHfuOgAt3w8McGGcj3Fmc895IftMP6BsCyJ7Z3WlzE
         /TNqQ77PAGmXYwjXUSgp3Kl+k6NjQKda9UIe0FgovwYhK74R65eX4VRLXFOzY1l6a0xf
         O5c5cKNs61TlTTEBlNjOSFRxA0Qb/ZhYbKEkO7ZYskJdH1GgzrBFGo56jCMDdiXUX1lL
         Nl88qP6o+uerp+V/xx+Hl9/iomVoUla9y7ciWKQphnW6GQ4H9qMsn0XsI5deG5xaPOpq
         7xdFpjHATxKvVGSxyfWHMKcXDHGfaZ3CH8cqVAwiUCsTlOlqe+NmOw79TZ8Bj6NGluyf
         OPoA==
X-Forwarded-Encrypted: i=1; AJvYcCXx1skyuZM56tJzt6xDPn37iLbLNnvMKZlWQJ5meNo/D5ergAdH8ukCkVaiIlrnMimIRV65rHkFTo1U@lists.linux.dev
X-Gm-Message-State: AOJu0YyObcdXngmpl5/218gWxmg/sA7hSzFjxk1nQXxS0LqHpfrG3saV
	6jVVSfGXIHMaNqiQl8obhwgISmGtx5ks4YvOay81OtONRW4Ld6MYD0K4uBDLxcSa4z7xy2zVe8G
	j0to/qjow2BuvOLR/2GCnLG4BrklQfeByBJf76+NnkqDyG8mq4NqWhs056UA=
X-Gm-Gg: ASbGnctjMzF2Lpwy28wqr5fYgHvRuGqrWiEfm7Dqp8jehvRjEqmWzIQiyDIpdUdOYHA
	/fHilbbYFR6RyM+D0ksSHQEEB2oVCdXFjfpmYjhuhbBbPhEsArRmTjAVjbikGZEHNG0DfPq4MXt
	u5RnmFMZVCgAMz4pbMaU+3N0qZjbkyVWl58l5PfoXaYyfSrtrEJ8TnPSeQl+cdfsiqKACFmnlN5
	xHcNCqS0mliTL1sbjWTzbpp45jXzUpBbIw83qPC2MkAjQYzuxXeNkZUZ+Z9wwaf8ieIDTZiwyoz
	OqLGwWoEoMtOIlkoTipvX6pxfTe7VzOVRlgkkDEgTz+Vx+I/uMJl2nbZUJPSJoTJ
X-Received: by 2002:a17:907:7d93:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-ac3303013demr1950497166b.31.1742314739054;
        Tue, 18 Mar 2025 09:18:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEBXn2Dp5CzogYyVhOceebzb+lde3KvdaGTDH+J6/yUCXbynPYtozYnV11UWLKbFnsupkUkQ==
X-Received: by 2002:a17:907:7d93:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-ac3303013demr1950491266b.31.1742314738419;
        Tue, 18 Mar 2025 09:18:58 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968cd8sm7829348a12.18.2025.03.18.09.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:18:57 -0700 (PDT)
Date: Tue, 18 Mar 2025 17:18:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Dionna Glaze <dionnaglaze@google.com>, 
	linux-coco@lists.linux.dev, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <qne5fm44dhkbnwc6ldgff76ljt7ecd3cvtf3b3lhos56yyx2ez@qbcv45zbxlhp>
References: <20250311094225.35129-1-sgarzare@redhat.com>
 <20250311094225.35129-4-sgarzare@redhat.com>
 <e4eeaead-2277-1f6f-86eb-f80deae2135b@amd.com>
 <Z9gm9iWhk5Zs2NvI@kernel.org>
 <CAGxU2F7fdAi148rB-4c==-qCOW1SJjwf4AzC2=TUhfPXMhR5pQ@mail.gmail.com>
 <1262fa5b-0822-b8d4-26c5-426ffa4e0265@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1262fa5b-0822-b8d4-26c5-426ffa4e0265@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hgORh2duQpt51RFNh0yubR_s-2wASK3B55GsTAMgFiI_1742314739
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Mar 18, 2025 at 09:54:31AM -0500, Tom Lendacky wrote:
>On 3/18/25 05:38, Stefano Garzarella wrote:
>> On Mon, Mar 17, 2025 at 03:43:18PM +0200, Jarkko Sakkinen wrote:
>>> On Fri, Mar 14, 2025 at 11:48:11AM -0500, Tom Lendacky wrote:
>>>> On 3/11/25 04:42, Stefano Garzarella wrote:
>>>>> Add driver for the vTPM defined by the AMD SVSM spec [1].
>>>>>
>>>>> The specification defines a protocol that a SEV-SNP guest OS can use to
>>>>> discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
>>>>> in the guest context, but at a more privileged level (VMPL0).
>>>>>
>>>>> The new tpm-svsm platform driver uses two functions exposed by x86/sev
>>>>> to verify that the device is actually emulated by the platform and to
>>>>> send commands and receive responses.
>>>>>
>>>>> The device cannot be hot-plugged/unplugged as it is emulated by the
>>>>> platform, so we can use module_platform_driver_probe(). The probe
>>>>> function will only check whether in the current runtime configuration,
>>>>> SVSM is present and provides a vTPM.
>>>>>
>>>>> This device does not support interrupts and sends responses to commands
>>>>> synchronously. In order to have .recv() called just after .send() in
>>>>> tpm_try_transmit(), the .status() callback returns 0, and both
>>>>> .req_complete_mask and .req_complete_val are set to 0.
>>>>>
>>>>> [1] "Secure VM Service Module for SEV-SNP Guests"
>>>>>     Publication # 58019 Revision: 1.00
>>>>>
>>>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>>>> ---
>>>>> v3:
>>>>> - removed send_recv() ops and followed the ftpm driver implementing .status,
>>>>>   .req_complete_mask, .req_complete_val, etc. [Jarkko]
>>>>> - removed link to the spec because those URLs are unstable [Borislav]
>>>>> ---
>>>>>  drivers/char/tpm/tpm_svsm.c | 148 ++++++++++++++++++++++++++++++++++++
>>>>>  drivers/char/tpm/Kconfig    |  10 +++
>>>>>  drivers/char/tpm/Makefile   |   1 +
>>>>>  3 files changed, 159 insertions(+)
>>>>>  create mode 100644 drivers/char/tpm/tpm_svsm.c
>>>>>
>>>>> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
>>>>> new file mode 100644
>>>>> index 000000000000..5540d0227eed
>>>>> --- /dev/null
>>>>> +++ b/drivers/char/tpm/tpm_svsm.c
>>>>> @@ -0,0 +1,148 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +/*
>>>>> + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
>>>>> + *
>>>>> + * Driver for the vTPM defined by the AMD SVSM spec [1].
>>>>> + *
>>>>> + * The specification defines a protocol that a SEV-SNP guest OS can use to
>>>>> + * discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
>>>>> + * in the guest context, but at a more privileged level (usually VMPL0).
>>>>> + *
>>>>> + * [1] "Secure VM Service Module for SEV-SNP Guests"
>>>>> + *     Publication # 58019 Revision: 1.00
>>>>> + */
>>>>> +
>>>>> +#include <asm/sev.h>
>>>>
>>>> Typically the "asm" includes are after the "linux" includes and separated
>>>> from each other by a blank line.
>>
>> Yep, I already fixed it in v4, since I found that issue while
>> backporting this patch to CentOS 9.
>>
>>>>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/kernel.h>
>>>>> +#include <linux/platform_device.h>
>>>>> +#include <linux/svsm_vtpm.h>
>>>>> +
>>>>> +#include "tpm.h"
>>>>> +
>>>>> +struct tpm_svsm_priv {
>>>>> +  u8 buffer[SVSM_VTPM_MAX_BUFFER];
>>>>> +  u8 locality;
>>>>> +};
>>>>
>>>> I'm wondering if the buffer shouldn't be a pointer to a page of memory
>>>> that is a page allocation. This ensures it is always page-aligned in case
>>>> the tpm_svsm_priv structure is ever modified.
>>
>> @Tom Should that buffer really page aligned?
>>
>> I couldn't find anything in the specification. IIRC edk2 also doesn't
>> allocate it aligned, and the code in SVSM already handles the case when
>> this is not aligned.
>>
>> So if it is to be aligned to the pages, we should reinforce it in SVSM
>> (spec/code) and also fix edk2.
>>
>> Or was yours a suggestion for performance/optimization?
>
>No reason other than the size of the buffer is the size of a page.
>Allocating a page provides a page that is dedicated to the buffer for
>the SVSM. To me it just makes sense to keep it separate from any driver
>related data. Just a suggestion, not a requirement, and no need to
>update the spec.

I see, thanks for the clarification!
I saw that with devm_get_free_pages() I can easily allocate a 
resource-managed page, so I'll do that in v4.

Thanks,
Stefano

>
>Thanks,
>Tom
>
>>
>>>>
>>>> As it is, the kmalloc() allocation will be page-aligned because of the
>>>> size, but it might be safer, dunno, your call.
>>>
>>> This was good catch. There's actually two issues here:
>>>
>>> 1. SVSM_VTPM_MAX_BUFFER is same as page size.
>>> 2. SVSM_VTPM_MAX_BUFFER is IMHO defined in wrong patch 2/4.
>>
>> I put it in patch 2 because IIUC it should be part of the SVSM
>> specification (the size, not the alignment).
>>
>>>
>>> So this constant would be needed, it should be appeneded in this patch,
>>> not in 2/4 because it has direct effect on implementation of the driver.
>>>
>>> I'd personally support the idea of removing this constant altogether
>>> and use alloc_page() (i.e., same as you suggested).
>>
>> Do you think it's necessary, even though alignment is not required?
>> (I'm still not clear if it's a requirement, see above)
>>
>>>
>>> kmalloc() does do the "right thing here but it is still extra
>>> unnecessary layer of random stuff on top...
>>
>> Yes, if it has to be aligned I completely agree. I would like to use
>> devm_ functions to keep the driver simple. Do you think
>> devm_get_free_pages() might be a good alternative to alloc_page()?
>>
>> Thanks,
>> Stefano
>>
>

