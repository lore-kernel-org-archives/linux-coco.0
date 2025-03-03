Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0E215185
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741023036; cv=none; b=PWctyxxLc74jKnedGtCdhznftctkeurQ/vdUZr76NWjbIV2UzDBrcZaqAEfB26KIOY4lrrWFM6+ToTrrjPSJoOvf98/m8UtGXCKZ12j6iTQ8eC9nZPIv8t3j2hWvZP7UeSy8/IQ0eifEL0Vl9nrR9v639o7eOS/05P2GG4xU0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741023036; c=relaxed/simple;
	bh=zCLifRE0KoQawzB/TcyJYbwoK84uaqCSQwdfN6x2BcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=r+CoIaK3BwxjLdaMG7D5Tuz10CdUOHHxv7hMsU/v/D4vNQz+WdsssgkWisJr5/YFEnQ6CwE+wXkgqKuvlS0j9w782s8ARpjpe5Cc7WmLQWQX6VU3eCJHTWErT2BGhHK5t37tW7UEODSQ0A8GhTJKwKalMfKpnGVZDfb6dbOgIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KIiWa3wG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KIiWa3wG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741023034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qK6V1d4F8/3GYYMbFs+Mb6fZwFXqDTRxwVUEODfRNfg=;
	b=KIiWa3wGTDw/FtH0Izv5dfzOgm64AeyxwaHXT68i5twbm8QChDFgM44oLJ49vHuj58nItj
	LUVzQgfefnUmSAkvm2lfFzcXLi4bQnDKxVDY6Gj5TK3e/K2Gtnwv7fJdYv/4I39U5Z+IS2
	65sDCpVi0uwXsOsvZj/YlpI2VSv+nAE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-fHnyeD4CPdSakxjYokexWg-1; Mon, 03 Mar 2025 12:30:32 -0500
X-MC-Unique: fHnyeD4CPdSakxjYokexWg-1
X-Mimecast-MFC-AGG-ID: fHnyeD4CPdSakxjYokexWg_1741023032
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4394b8bd4e1so21190025e9.0
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 09:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023031; x=1741627831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK6V1d4F8/3GYYMbFs+Mb6fZwFXqDTRxwVUEODfRNfg=;
        b=fgJ4Gk6U4A1zOrxocspv9Muvp4m1PTAN1cP7KAmPMi4V0P7qqfwBpd2A8Bhp8LEzlv
         37oWPETqvYyUuX8bdaUqT+Jbgv1Plq1vpyJCouzM67hhD4EbcWHY9OPYyobgbrkSjH1n
         f/WwFVf3UEf8l7DwWAMqoXP8LiaXrMcj3iOyoer2MXQ2BFCayUdjfRUIgrfvCPLclsgZ
         aru4qTOtI3vm7UJTAE3CXj00UECkXJpCXla+Nm3QFdICseLSHmAWGZ2F60hLp96M/YBY
         FTj/fDp0J8FAfABwXIr/BsYeXOSFj3khttwtQz65xa9kHSB+58WSCWxH4JHkwUKzG+w2
         pjZw==
X-Forwarded-Encrypted: i=1; AJvYcCVd2JPZlrl1i2u034KZXextX6Uz4LsgkM2JQPuq3zaJminGkFjfpy+x9QjAEg+JLPzk5qyl+wSjhaq8@lists.linux.dev
X-Gm-Message-State: AOJu0YxyxWSNw9Nks8z1ppyP7j+6Ur9wO5ML3RdT/wjlHh0zpA//vm/I
	HAWjBhY8kRzlhqIv80jTaO7ArtBbMv7oLLIH0E1N2fJYEEE3TGgdj9e5rOWw0eMyC3ZBHAYuQ/X
	xtQW3ke38elr4fFECKopOH8JtOzdn7djlIIma5AotXcBCjbZvt781edzzPwI=
X-Gm-Gg: ASbGncseDMOjgFsUF42iyl4FnlpgZb8pPEgGuAAOPDf4KFSshvA8sxnysfelnESDgUc
	5zHJNfHfRC2bsTHdse0v7UEvaPuFYQ1V1Wy72GrzhW88fz3wypDarkt516NTi5LrNcHRhKQXTPG
	cFYU2gAcr8EAQ1IsEI9u0lMqJ5PhTB4395Wm1ao+TKrPUhdwBnErN06kxPER5Ddk6L5HDq5JiDu
	g4do41g18iMV9oLvKNOUsjb/vHDBeKW2Y5oR5Br3SfbUiytcqhiXtTmu6Rb4mVQztTr6P90lJ1h
	nn8tw/Z8/SIPKHMm6j3OHZ4paX4/2YtKvKa6EaqqFc14hhHdxZ7lveSjRGz6GXvS
X-Received: by 2002:a05:600c:3ca8:b0:439:a88f:8523 with SMTP id 5b1f17b1804b1-43ba6760622mr101787895e9.21.1741023031538;
        Mon, 03 Mar 2025 09:30:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQsnNiGGEYqX44soHY1inSfp9Dy8FQXmQyAL1i5ej8GJiYTvczodK99UyEHKUMhAfUCjVl7A==
X-Received: by 2002:a05:600c:3ca8:b0:439:a88f:8523 with SMTP id 5b1f17b1804b1-43ba6760622mr101787525e9.21.1741023030939;
        Mon, 03 Mar 2025 09:30:30 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba539466sm204364905e9.18.2025.03.03.09.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:30:30 -0800 (PST)
Date: Mon, 3 Mar 2025 18:30:23 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 4/6] tpm: add interface to interact with devices
 based on TCG Simulator
Message-ID: <jmo7t55vnwlszauoje2o427re3omdnaaqk2cbhynksb225isig@blymmqrezzo7>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-5-sgarzare@redhat.com>
 <d50d9d6e-10e4-23e8-a584-df28a1c41e86@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d50d9d6e-10e4-23e8-a584-df28a1c41e86@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a5WMhztn4iiQuPqqJxNabSwcmvMtMmCYEeQeJXbrWu4_1741023032
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Mar 03, 2025 at 08:28:45AM -0600, Tom Lendacky wrote:
>On 2/28/25 11:07, Stefano Garzarella wrote:
>> This is primarily designed to support an enlightened driver for the
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
>
>This is a confusing name... would tpm_tcgsim_parse_cmd_resp() be a
>better name?

Ack, and we can rename also the other in tpm_tcgsim_fill_cmd_req().

Thanks,
Stefano

