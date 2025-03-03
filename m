Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0321D59C
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741020089; cv=none; b=qQ9NFwmJ/VMR0/aKnOEDCIVm+Y8LL0QHkT+CDS7thBRYUJzuvVvAvZbDsifXobX3IndVISyPANCSeCKt0dGa5Rf7RVMyeRVSGJGDSQ9VSqVBV8g63SSI7x9a3TnB6mqAyykItT8SpmzVxzbeJs4SiLEqwXMiFXP507JUTVzyp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741020089; c=relaxed/simple;
	bh=wtuVdp1dWUSTUzgmcaVuUFduzu2pv/qe+S0adx91rFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Kp/u10RpjBPr1Z5iURo1w+gMKfdl39cK44mdD1zLT+OHIbbVLIOQzFjIHSS1Z9ioowU5a7+x3QSXgmgGukXf9zBvs4hYKlXudRuG4le1PpXOszD93r4WTSxIIWy8rSD6psgv01s5RZUrcmULp+ZcYZB/d1yD9ne7bVPGQ03U3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4oo7c3H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4oo7c3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741020087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S99anXn8JXy9g/82OL5Iaa34Jq4clnv+XI8UuV0Q2yM=;
	b=D4oo7c3HNmPWsmJRPOdUYc9wmsDjKTWzdmwcjjvhutXFLMJ29IMs2iKpLnCsSb/OUPu+p3
	faujxIYWff5ZGfi+seN6QdDgwxOE7CKvkVLky30j3VQzSiznF8zFc5qaeSf+fhfx+iyHX+
	XgF8xkDOVSPgO+k79ILxu1TTRs9NNP8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-6Vw-M6KpO6Ogyi1-vljdmQ-1; Mon, 03 Mar 2025 11:41:25 -0500
X-MC-Unique: 6Vw-M6KpO6Ogyi1-vljdmQ-1
X-Mimecast-MFC-AGG-ID: 6Vw-M6KpO6Ogyi1-vljdmQ_1741020084
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4394c747c72so18080335e9.1
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 08:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741020084; x=1741624884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S99anXn8JXy9g/82OL5Iaa34Jq4clnv+XI8UuV0Q2yM=;
        b=AJ1yQBDlU32oDkXizqz4YyXf1cs/2q4S2XOKjldWEiccL5jnaFmyLdtmzf8ohZQz2r
         oyLAvFUufqcZ0ZQx0d9hWpILuIllWAcGcVUi8TBtilHim9WsgB/ZkIbf5OEjJSrEbcSK
         LwrlU064w9GxkrKyYs05V5mZCWTZNLqrrE/7Wobi3qjwYxBDDO9G8u3yShpZty8vXD/M
         c5gFWCiMq2hagzv9t0y6AhkGS5RDvpadJJQFHBUsekpVuploDGnBOcN5F1lNYIaYQo9b
         72s0Yj10aocEsAvmeYYZzM714gEuP9DVvFy7ELimdDH4pMohaNMqvI6fmdOk56CrzIXE
         7XUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAPdwTW4jKjLgzL8FneNkrzJSXrZ7JwXS7bAsJXiU3EcUA54oNuLsM1r/4Uzn7+I/54k2dGD+cak1f@lists.linux.dev
X-Gm-Message-State: AOJu0YynxGX73WCll8xs+KGizmb/XaPzPzckbGUFpryFy/r8NjKOduMk
	hDizU/uUCBrBbVXi+b6elxk4W6tniEApYCbRvvVeTsOr59ejafhvNJ8nke9L+QzEssz12tK5cLQ
	E6G3GuLcFgx7zcMF1W3vw1bXMBT540Mr8/cfACKSJhhptVSGutNVi6ga6W6g=
X-Gm-Gg: ASbGncszr8S+37pRc1pyTsBsxFLtibpBfcivhKWAbWfglnTAwVODcSy2qyYOTeqT298
	eTC2WlhhXfUTttOFAQn3Ji0CavsKgcD1ycVj6aWsIBoXABNhG75wkeo6tX2hiVY1yXyY/Sr/eOp
	YyLkbY5g+ft/Cq4rIQpWSpd0HhT5w5OTR5AuhYC8cIcbY0oWmrdPZa36Dhgb7IS1ajhNtpSOgMc
	IbvoHxGWKbfWQn3/V3D+fEBk/AmqNKHZpD+sAkNYC82ywxsxK9Bmp7GaNTBHxjLCip1XLO0jWvI
	3jBv12BfP3AUrMGwDDfD7orUKd3OXLthjVZPT3AWvN61WcrgU6JgXAv/9xqcguFU
X-Received: by 2002:a05:600c:1550:b0:439:9f19:72ab with SMTP id 5b1f17b1804b1-43ba67583ecmr104338805e9.23.1741020084429;
        Mon, 03 Mar 2025 08:41:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvv13ffXGAXCLH0EVzmjBIDlyJbzC6drJbfPUy9UV5VvxP8GlxxWs0ezzWZVNxeiFA1wafgw==
X-Received: by 2002:a05:600c:1550:b0:439:9f19:72ab with SMTP id 5b1f17b1804b1-43ba67583ecmr104338445e9.23.1741020083822;
        Mon, 03 Mar 2025 08:41:23 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbc030d24sm57205495e9.22.2025.03.03.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:41:23 -0800 (PST)
Date: Mon, 3 Mar 2025 17:41:17 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 4/6] tpm: add interface to interact with devices
 based on TCG Simulator
Message-ID: <vv2ih4adpltpcudnrs76z5ni2vdxxj465cqrqcgizmkvr32ash@ambm6xkvi5e3>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-5-sgarzare@redhat.com>
 <Z8JncxQM7Nkit0Q6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z8JncxQM7Nkit0Q6@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: siNpJjQ0OTH6hlvdMJJ50CqmJ5c9ysGLiT5LbcSdXAc_1741020084
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sat, Mar 01, 2025 at 03:48:35AM +0200, Jarkko Sakkinen wrote:
>On Fri, Feb 28, 2025 at 06:07:18PM +0100, Stefano Garzarella wrote:
>> This is primarily designed to support an enlightened driver for the
>
>The commit message is half-way cut.
>
>I.e. it lacks the explanation of "this".

Yes, sorry, I rephrased James' previous commit description, but I admit 
it didn't come out clear.

I meant to say that "this" new header contains useful functions for 
creating commands and parsing responses in those drivers where vTPM 
devices are implemented via the TCG TPM reference implementation.

>
>> AMD SVSM based vTPM, but it could be used by any TPM driver which
>> communicates with a TPM device implemented through the TCG TPM reference
>> implementation (https://github.com/TrustedComputingGroup/TPM)
>>
>> Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> James, Claudio are you fine with the Cdb, Sob?
>> The code is based to what was in the initial RFC, but I removed the
>> tpm_platform module, moved some code in the header, changed some names,
>> etc.
>> For these reasons I reset the author but added C-o-b.
>> Please, let me know if this is okay or if I need to do anything
>> else (reset the author, etc.)
>> ---
>>  include/linux/tpm_tcgsim.h | 136 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 136 insertions(+)
>>  create mode 100644 include/linux/tpm_tcgsim.h
>>
>> diff --git a/include/linux/tpm_tcgsim.h b/include/linux/tpm_tcgsim.h
>> new file mode 100644
>> index 000000000000..bd5b123c393b
>> --- /dev/null
>> +++ b/include/linux/tpm_tcgsim.h
>> @@ -0,0 +1,136 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2023 James.Bottomley@HansenPartnership.com
>> + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
>> + *
>> + * Generic interface usable by TPM drivers interacting with devices
>> + * implemented through the TCG Simulator.
>> + */
>> +#ifndef _TPM_TCGSIM_H_
>> +#define _TPM_TCGSIM_H_
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
>
>We should not be dependent on any out-of-tree headers.

We might see that header as a specification of how to communicate with 
the device.

What do you suggest we do in this case?

>
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
>> +#define TPM_TCGSIM_MAX_BUFFER		4096 /* max req/resp buffer size */
>> +
>> +/**
>> + * struct tpm_req - generic request header for single word command
>> + *
>> + * @cmd:	The command to send
>> + */
>> +struct tpm_req {
>> +	u32 cmd;
>> +} __packed;
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
>> +	u8 locality;
>> +	u32 inbuf_size;
>> +	u8 inbuf[];
>> +} __packed;
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
>> +
>> +/**
>> + * tpm_tcgsim_fill_send_cmd() - fill a struct tpm_send_cmd_req to be sent to the
>> + * TCG Simulator.
>> + * @req: The struct tpm_send_cmd_req to fill
>> + * @locality: The locality
>> + * @buf: The buffer from where to copy the payload of the command
>> + * @len: The size of the buffer
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +static inline int
>> +tpm_tcgsim_fill_send_cmd(struct tpm_send_cmd_req *req, u8 locality,
>> +			 const u8 *buf, size_t len)
>> +{
>> +	if (len > TPM_TCGSIM_MAX_BUFFER - sizeof(*req))
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
>> + * tpm_tcgsim_parse_send_cmd() - Parse a struct tpm_send_cmd_resp received from
>> + * the TCG Simulator
>> + * @resp: The struct tpm_send_cmd_resp to parse
>> + * @buf: The buffer where to copy the response
>> + * @len: The size of the buffer
>> + *
>> + * Return: buffer size filled with the response on success, negative error
>> + * code on failure.
>> + */
>> +static inline int
>> +tpm_tcgsim_parse_send_cmd(const struct tpm_send_cmd_resp *resp, u8 *buf,
>> +			  size_t len)
>> +{
>> +	if (len < resp->hdr.size)
>> +		return -E2BIG;
>> +
>> +	if (resp->hdr.size > TPM_TCGSIM_MAX_BUFFER - sizeof(*resp))
>> +		return -EINVAL;  // Invalid response from the platform TPM
>> +
>> +	memcpy(buf, resp->outbuf, resp->hdr.size);
>> +
>> +	return resp->hdr.size;
>> +}
>> +
>> +#endif /* _TPM_TCGSIM_H_ */
>> --
>> 2.48.1
>>
>
>This commit got me lost tbh.

The vTPM device is emulated through the simulator of the TCG reference 
implementation, so to communicate with it we have to send commands 
following the specified format.

This header is intended to add code that could also be reused by other 
drivers where the device follows this format. As James mentioned, 
Microsoft has something similar for OpenHCL and may reuse this header in 
the future.

If you think it is too much, I can include these things for now in 
tpm-svsm.c and when we have another driver we will pull them out.

Thanks,
Stefano

