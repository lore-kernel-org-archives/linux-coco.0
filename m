Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1D423237C
	for <linux-coco@lists.linux.dev>; Wed, 12 Mar 2025 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741780062; cv=none; b=kvPLjDMnKYz8fY5VQho7/4Wk/EmQavLD8CUkhgJKtrJuhBkpIk8gIcsyya9nKqFSHGECu1aIoCL3vGOQOJnu2AZYcbKfgze3Cy+FxgR6DbhY5Qr7YlSEtlfdZY7tkmGTrGP7GESGHUyrgQjGz0YLjILTrGn+IlyeCkElAR1HJqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741780062; c=relaxed/simple;
	bh=X5t1MXEx3Ri3qf8vGAqhZ06ZCh7vspadQpZMzTBv6YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=k+yxTYQSaztifrzbs7K+/3PHGoJl2P7stGmIzSq5km05uxn1jpBydYCLVMYAtIJdC9ifTO6yrJheWqbQeaYoGaH92TxA+1xlxolh8+HwntFe4v2F4TN6/KqFbp0pqKFPrABEulnfla3s+x5dBnxFLZN3bVJFkT90H0/HPpUkwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hO8O4OKz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hO8O4OKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741780059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TmCcwhncm33zmtKRef3o88MIfofDnFACWeQE9MPkbx4=;
	b=hO8O4OKz+nGoPNsHOJN+CSLt0sIlPphs2Ck0+dJHAZtjUJvTIKyEV6xsKIsd4Vax3OFgqm
	l3KRTEyW0Thf8KHMpCGJ41POm5+w0+FTUlckex28TisA/nZN0urthQ0ljNI6SIZkMV0PIV
	znPSaV0+/fqrMM33Gba3paeHvpp+AsE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-hJiI0MiZP62xUyiEqjnZ7g-1; Wed, 12 Mar 2025 07:47:38 -0400
X-MC-Unique: hJiI0MiZP62xUyiEqjnZ7g-1
X-Mimecast-MFC-AGG-ID: hJiI0MiZP62xUyiEqjnZ7g_1741780057
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so46484035e9.3
        for <linux-coco@lists.linux.dev>; Wed, 12 Mar 2025 04:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780056; x=1742384856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmCcwhncm33zmtKRef3o88MIfofDnFACWeQE9MPkbx4=;
        b=XKDyc9Hbk4ajKUUhETCv23CCSr6iAB48HaCWMWg+RhLbCeQJjaICioBLhBOpLE1WUc
         ltIA2Oj3BYtRGMIlxekwnf0FN3m7xOLyQUqDsU/QzVY2tiwY5fekddi4bLjeQ+ebgUTo
         vuTSJO+Osgnz9WfllMNJQMDj9k78zT27Hk5eFC2/PuIeT7NjAGdNvH3ljHE/h7omzLOf
         ij3uDK8L99NXcVhxE7vdek6b5vzxy+TCV3iZeFmfckBRk2gbO1Gw4V6OmFkrviy63Llr
         +UySiMhtAOVl+5pWh14mZFpLPvJwl5QiPGKif93aTMPDpMUzoj9qXQla8HEGUUyFsZpW
         rlGw==
X-Forwarded-Encrypted: i=1; AJvYcCUFQw6haZ0NsxT+3R0A69ZSiaxZXdTfK38mbJcbV0TaKylRyZiAkO+La/TB7DgVy7XbngDDR0jGrDIB@lists.linux.dev
X-Gm-Message-State: AOJu0YxS735hedA1n6HO2jMl5DP6DBti0XcjkEL8009+pt16DAxEtYCI
	QVvfYZm5Cpa9AL4gm4UlC9NCVUQbwOsXBRI1roo2Lk0GmQPxMkpy4AgVy3lo394lxUYFDN6/JDf
	5sJ9tvrHJ+b07tVnisnmDsPdCg7qPWlvjAvnSs879NH/amh2hXEDKc8m6IcBJO0ZSDgo=
X-Gm-Gg: ASbGncvSX+ZSQb/W3fNWZGuMQa7kEumjq5+o7KkkVLTFrttFOQjOoqwj54fDkiDHZzo
	nK2GmOil7dyAKlON34krkIYi0E4fgWt9eFJQnwIfk4moK9CWhYZL8JywbeFENKZEeD4Im/y5oq5
	YIV1jJNYyPYCzBpxzGnOZsUOuiu1Ej55XhYmU0K90zsXKQv13A9KBSG1fe39VgpGB2PhJUd482z
	QW0mBuSfVm2iscZYN64aWmQoyM9iw9ElBXo0MmOtHQuyNuQmcwuldqAWWSaWmm2Tc4m9neLFvgd
	6kkIuU3HU28+OoMu/29B1nGMoeG0drQQ1anPK/mh/r10zdFxeSbCgxw13yuWg6fK
X-Received: by 2002:a05:600c:444d:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-43cfe154379mr99859475e9.15.1741780056448;
        Wed, 12 Mar 2025 04:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxuXx5YQe6jpb0et/xycveTFCsQDpLIYQDyO8eKnK5ImWZcZaA1Nsnk4i8zat+sFwBG9k2Og==
X-Received: by 2002:a05:600c:444d:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-43cfe154379mr99858675e9.15.1741780054340;
        Wed, 12 Mar 2025 04:47:34 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103290sm20465220f8f.87.2025.03.12.04.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:47:33 -0700 (PDT)
Date: Wed, 12 Mar 2025 12:47:29 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Dionna Glaze <dionnaglaze@google.com>, 
	linux-coco@lists.linux.dev, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 2/4] svsm: add header with SVSM_VTPM_CMD helpers
Message-ID: <irkhppcqw6gbttshmfqggjzsjcq624wk67ovjp2wynfui6prec@e6ausihrq2il>
References: <20250311094225.35129-1-sgarzare@redhat.com>
 <20250311094225.35129-3-sgarzare@redhat.com>
 <Z9ALe-kPZ5o_pim7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z9ALe-kPZ5o_pim7@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XWhG8M0_6Fp9QSjs_gNQMBMJiQ3luY4fwJhqGBZjIw8_1741780057
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Mar 11, 2025 at 12:07:55PM +0200, Jarkko Sakkinen wrote:
>On Tue, Mar 11, 2025 at 10:42:23AM +0100, Stefano Garzarella wrote:
>> Helpers for the SVSM_VTPM_CMD calls used by the vTPM protocol defined by
>> the AMD SVSM spec [1].
>>
>> The vTPM protocol follows the Official TPM 2.0 Reference Implementation
>> (originally by Microsoft, now part of the TCG) simulator protocol.
>>
>> [1] "Secure VM Service Module for SEV-SNP Guests"
>>     Publication # 58019 Revision: 1.00
>>
>> Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> v3:
>> - renamed header and prefix to make clear it's related to the SVSM vTPM
>>   protocol
>> - renamed fill/parse functions [Tom]
>> - removed link to the spec because those URLs are unstable [Borislav]
>> ---
>>  include/linux/svsm_vtpm.h | 141 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 141 insertions(+)
>>  create mode 100644 include/linux/svsm_vtpm.h
>>
>> diff --git a/include/linux/svsm_vtpm.h b/include/linux/svsm_vtpm.h
>> new file mode 100644
>> index 000000000000..2ce9b1cb827e
>> --- /dev/null
>> +++ b/include/linux/svsm_vtpm.h
>> @@ -0,0 +1,141 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2023 James.Bottomley@HansenPartnership.com
>> + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
>> + *
>> + * Helpers for the SVSM_VTPM_CMD calls used by the vTPM protocol defined by the
>> + * AMD SVSM spec [1].
>> + *
>> + * The vTPM protocol follows the Official TPM 2.0 Reference Implementation
>> + * (originally by Microsoft, now part of the TCG) simulator protocol.
>> + *
>> + * [1] "Secure VM Service Module for SEV-SNP Guests"
>> + *     Publication # 58019 Revision: 1.00
>> + */
>> +#ifndef _SVSM_VTPM_H_
>> +#define _SVSM_VTPM_H_
>> +
>> +#include <linux/errno.h>
>> +#include <linux/string.h>
>> +#include <linux/types.h>
>> +
>> +/*
>> + * The current TCG Simulator TPM commands we support.  The complete list is
>> + * in the TcpTpmProtocol header:
>> + *
>> + * https://github.com/TrustedComputingGroup/TPM/blob/main/TPMCmd/Simulator/include/TpmTcpProtocol.h
>> + */
>> +
>> +#define TPM_SEND_COMMAND		8
>> +#define TPM_SIGNAL_CANCEL_ON		9
>> +#define TPM_SIGNAL_CANCEL_OFF		10
>> +/*
>> + * Any platform specific commands should be placed here and should start
>> + * at 0x8000 to avoid clashes with the TCG Simulator protocol.  They should
>> + * follow the same self describing buffer format below.
>> + */
>> +
>> +#define SVSM_VTPM_MAX_BUFFER		4096 /* max req/resp buffer size */
>> +
>
>Across the board below data structures: I'd svsm_vtpm_ prefix them.
>The rational is quite practical: it would easier to grep them later
>on.

I see, I'll fix in v4.

>
>> +/**
>> + * struct tpm_req - generic request header for single word command
>> + *
>> + * @cmd:	The command to send
>> + */
>> +struct tpm_req {
>> +	u32 cmd;
>> +} __packed;
>
>__packed is useless here.
>
>> +
>> +/**
>> + * struct tpm_resp - generic response header
>> + *
>> + * @size:	The response size (zero if nothing follows)
>> + *
>> + * Note: most TCG Simulator commands simply return zero here with no indication
>> + * of success or failure.
>> + */
>> +struct tpm_resp {
>> +	u32 size;
>> +} __packed;
>
>Ditto.

Ack, for both.

>
>> +
>> +/**
>> + * struct tpm_send_cmd_req - Structure for a TPM_SEND_COMMAND request
>> + *
>> + * @hdr:	The request header whit the command (must be TPM_SEND_COMMAND)
>> + * @locality:	The locality
>> + * @inbuf_size:	The size of the input buffer following
>> + * @inbuf:	A buffer of size inbuf_size
>> + *
>> + * Note that TCG Simulator expects @inbuf_size to be equal to the size of the
>> + * specific TPM command, otherwise an TPM_RC_COMMAND_SIZE error is
>> + * returned.
>> + */
>> +struct tpm_send_cmd_req {
>> +	struct tpm_req hdr;
>
>Useless nesting that makes this obfuscated: you can just as well put
>that single field here, i.e.
>
>	u32 cmd;

Yep, I see. I'll remove tpm_req and tpm_resp since for now we support
only TPM_SEND_COMMAND, if in the future we will support other requests
we can think of re-introduce them if needed.

>
>> +	u8 locality;
>> +	u32 inbuf_size;
>> +	u8 inbuf[];
>
>Why not just buf?

I can change in `buf` and `size`.

>
>> +} __packed;
>
>Since we don't care about TCG Simulator compatibility I'd expect that
>these are ordered in a way that they align nicely. E.g.

Maybe I should add in the documentation that this structure is defined
by the AMD SVSM spec.

This is where request and response for TPM_SEND_COMMAND are defined:

   8.2.1 TPM_SEND_COMMAND
     Execute a TPM command and return the results.

     For TPM_SEND_COMMAND, platform command 8, the request buffer is
     specified according to the format of the following table.

     Table 16: TPM_SEND_COMMAND Request Structure

     Byte      Size         Meaning
     Offset    (Bytes)
     0x000     4            Platform command (8)
     0x004     1            Locality (must-be-0)
     0x005     4            TPM Command size (in bytes)
     0x009     Variable     TPM Command

     The response buffer is specified according to the format of the
     following table.

     Table 17: TPM_SEND_COMMAND Response Structure

     Byte      Size         Meaning
     Offset    (Bytes)
     0x000     4            Response size (in bytes)
     0x004     Variable     Response

>
>struct svsm_vtpm_request {
>	u32 command;
>	u16 locality;
>	u16 buffer_size;
>	u8 buffer[];
>};
>
>64k should enough for any possible TPM command.
>
>> +
>> +/**
>> + * struct tpm_send_cmd_req - Structure for a TPM_SEND_COMMAND response
>> + *
>> + * @hdr:	The response header whit the following size
>> + * @outbuf:	A buffer of size hdr.size
>> + */
>> +struct tpm_send_cmd_resp {
>> +	struct tpm_resp hdr;
>> +	u8 outbuf[];
>> +} __packed;
>
>Why this does not have size? Here also __packed is useless even with the
>pre-existing layout, and something like svsm_tpm_response would be a
>factor more reasonable name.

Because it's "obfuscated" as you pointed out in the request :-)
The size is in the header, but I'll fix with something like this:

struct svsm_tpm_response {
     u32 size;
     u8 outbuf[];
} __packed;

>
>> +
>> +/**
>> + * svsm_vtpm_fill_cmd_req() - fill a struct tpm_send_cmd_req to be sent to SVSM
>
>> + * @req: The struct tpm_send_cmd_req to fill
>> + * @locality: The locality
>> + * @buf: The buffer from where to copy the payload of the command
>> + * @len: The size of the buffer
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +static inline int
>> +svsm_vtpm_fill_cmd_req(struct tpm_send_cmd_req *req, u8 locality,
>> +		       const u8 *buf, size_t len)
>
>svsm_vtpm_fill_request()
>
>> +{
>> +	if (len > SVSM_VTPM_MAX_BUFFER - sizeof(*req))
>> +		return -EINVAL;
>> +
>> +	req->hdr.cmd = TPM_SEND_COMMAND;
>> +	req->locality = locality;
>> +	req->inbuf_size = len;
>> +
>> +	memcpy(req->inbuf, buf, len);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * svsm_vtpm_parse_cmd_resp() - Parse a struct tpm_send_cmd_resp received from
>> + * SVSM
>> + * @resp: The struct tpm_send_cmd_resp to parse
>> + * @buf: The buffer where to copy the response
>> + * @len: The size of the buffer
>> + *
>> + * Return: buffer size filled with the response on success, negative error
>> + * code on failure.
>> + */
>> +static inline int
>> +svsm_vtpm_parse_cmd_resp(const struct tpm_send_cmd_resp *resp, u8 *buf,
>> +			 size_t len)
>
>svsm_vtpm_parse_response()

About the naming, I added "cmd" because in the future we can support
also other requests/responses different from TPM_SEND_COMMAND, like
TPM_SIGNAL_HASH_DATA, TPM_REMOTE_HANDSHAKE, TPM_SET_ALTERNATIVE_RESULT
as specified in the AMD SVSM spec.

For now it's true that we support only TPM_SEND_COMMAND, so I can avoid
`cmd`, but if we will need to support the other requests in the future,
we may need to differentiate them.

Would be okay to have svsm_vtpm_cmd_[request|response], 
svsm_vtpm_fill_cmd_request(), svsm_vtpm_parse_cmd_response() ?
Or do you prefer to avoid "_cmd_"?
Not a strong opinion on my side.

Thanks,
Stefano

>
>> +{
>> +	if (len < resp->hdr.size)
>> +		return -E2BIG;
>> +
>> +	if (resp->hdr.size > SVSM_VTPM_MAX_BUFFER - sizeof(*resp))
>> +		return -EINVAL;  // Invalid response from the platform TPM
>> +
>> +	memcpy(buf, resp->outbuf, resp->hdr.size);
>> +
>> +	return resp->hdr.size;
>> +}
>> +
>> +#endif /* _SVSM_VTPM_H_ */
>> --
>> 2.48.1
>>
>
>BR, Jarkko
>

