Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F54281374
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101865; cv=none; b=XJRwTOZE4UVhRTRL9Ey+wZaGqo2f1+TRT9Izhdo0T9/ZnI3WTM6GCyVjmsqHSvSCWeuwaXyloelW/iCtY+eRxzG1DpLsQ+UHp90AK4fx6iwZIgxQ5J5sJMVweoHMSSSgwsihPvrV8Kgz7y6c0n9CEXzGNyLN2OIl8h8SIihcedk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101865; c=relaxed/simple;
	bh=9Jnaaj+MupYsXtZ5FbywLqogWLKCVBeU+mapvXdmuLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=F77Au/wOKBLsx+hespbwZ9ev19u4J7ZJ0x9rLLgzxy+7I2PV5HrrA6s04QBW6cju+eYLDL1ouvv9p9HrGQQo2X9NSjXKRjXph15ID20hPpxiQ5ncLg1wnla10+U9eb6bnpqTX9iGvzvxOkjYeijDQ/ugr1Zj/MN4U0aMaIsaAms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EzrrL9FE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EzrrL9FE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741101862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QvFubViMNlvElEXntbaUBxPleCcZNXXI9ACRXmzKeq0=;
	b=EzrrL9FEoYXwNITO33d4xfGj6P/8L25A1veHD4cXGw+yV1X491fwhOVKfFGOhSjAo4tDJm
	Oe2QMJAv3fR9YFXHQ3andUhqioRHeqW1rggIzs1PTeTrp4wcTL3zRnNSuIoXoDKEQ49NxW
	1N7liD2BeZVqXEGTajAVX6Lsdf1+Gts=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-sDC2xz6yPmijEtS12al1Ng-1; Tue, 04 Mar 2025 10:23:59 -0500
X-MC-Unique: sDC2xz6yPmijEtS12al1Ng-1
X-Mimecast-MFC-AGG-ID: sDC2xz6yPmijEtS12al1Ng_1741101838
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390f7db84faso2740139f8f.2
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 07:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741101838; x=1741706638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvFubViMNlvElEXntbaUBxPleCcZNXXI9ACRXmzKeq0=;
        b=Su42oYleW+eeInal1aPg2Vne2fGwPmy+h4QcHgZuqsRwg7UNhpqkpl0Yy/vEatdRLw
         1cKJR1flk8nXTXgoFhOkjq+WK2vpVWviGLG/fFrlihn3gNL1P9q/rIYJ2KjGa/aR8FQ4
         gubZ5bTtlbmAfvofgvw7FJt1uJUluhrv32y9Xk2hkUmsgMXL97GE1jsfzGq1HHXkXFQ9
         uu287vmmqDZd2Bwi5iQOr2WHSh2RhCDLUV+FB265G/tP3uRhEI0ZcL98D4CUqh6fMypN
         qvMaQytfWfFatreHTiiClPGp/Fiqu7t/wvVcp0yDrYSv0xyunuF2Ej0+5S4gjz65WFt9
         s02g==
X-Forwarded-Encrypted: i=1; AJvYcCWq79wuFkcz341HtUAscDgrUzCh+PefKd+0iEci+pE+G255iSCEl1hL5P76An8z4cAAKztOeJRYAuYX@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa64H9weQuP2OUMWZ6hAFgJppm/ByPt+PPFN8+39xYSkWgW1fG
	hcBY+DQ5TDpPBH549tKzT8KHjDCerF5OC3UDOGy8mBpqhgZFvsWS2tUe5O4zd4ijabJUdxbKXg3
	AglJ8rMEY2OnOJr7nIKw+p9lj5cATsQGudvppEplg+440EQkEED8yZnvPr0o=
X-Gm-Gg: ASbGncvXYPwFYK9/mT0JLiw/Ps4LT73Q41B2/wDs3AtCtHvGpjrAUqdVYVtHSOE0H4u
	phVPcPSIJE7ZPcwPzR9QLid2xKEz006iwYfVsfvjWCR9LM81x5ljayicnnxA7Q2dsEDvw1rUdMU
	DSCY8z1rScDpDVBoVbKvkmSCmMrHq+5C3z5jbORjfG4e6ZphxD+kGeJ9dRPt5iBqAyK6A+QhYMl
	vsRPVaOpnZtvTcnXa/rnulSkt2hMkiuZ2WgEWWvqgsdZNxfg0fxGY6WAWsTOaGwRG0jO61tn2+K
	MtfBqF1njvr5ZiRGtzJMU2SgQqA3ztA5KhU/iKt9AJWgMg1P4ZS/vF0fR3IEQBlj
X-Received: by 2002:adf:fc11:0:b0:38c:5fbf:10ca with SMTP id ffacd0b85a97d-390eca06cf4mr15878880f8f.39.1741101837734;
        Tue, 04 Mar 2025 07:23:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXUbzP/MD3DaiOBhULX8asTjjiwbkIGLuALrZE+TAO2F//xDur+SEeYf1Lx6gpZrq9uCm1kg==
X-Received: by 2002:adf:fc11:0:b0:38c:5fbf:10ca with SMTP id ffacd0b85a97d-390eca06cf4mr15878837f8f.39.1741101837140;
        Tue, 04 Mar 2025 07:23:57 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d6cdsm17907254f8f.84.2025.03.04.07.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:23:56 -0800 (PST)
Date: Tue, 4 Mar 2025 16:23:51 +0100
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
Message-ID: <7dltjdc4csdao5djx2jkjnvm72ubhagjwvgrpyqrr3aeo5cicn@cxrxusjpgce7>
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
X-Mimecast-MFC-PROC-ID: 0gvqsN-U1Mu2JGcnbkS4qlbSAZV9515iPBcUGJ_h6dI_1741101838
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

Now I understand why you got lost, my bad!
I checked further and these structures seem to be specific to the vTPM 
protocol defined by AMD SVSM specification and independent of TCG TPM 
(unless reusing some definitions like TPM_SEND_COMMAND).

At this point I think it is best to remove this header (or move in 
x86/sev) and move this rewrap to x86/sev to avoid confusion.

I'll do in v3, sorry for the confusion.

Stefano

