Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFBB22F39C
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741022967; cv=none; b=VRLPNcwzM88jtwQkCfAZgRLC0Nx+AYG17p/AyLnpOjDuSC6d/XultLlJ+6cLoyNqbPyCkDcPN6DHbd7Qf6jGhcSEJZn541X9oi5uu0gD5ePiIPus4AJ3lw5+qWRqR7N5ksf7+Rq4kSBGcsKI8O49jW5xTks1Q2XbxY0Rxp76N0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741022967; c=relaxed/simple;
	bh=CVM2bEp4Yw0krI1DvlnCOP3KfIRlfjlQ2aneugrysqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TvqlV6P5DiueLsgPse3kwu7D7qOiVUljcXg2g/nm+1aBCYKfWJlZOnPpUXWl6ZuS9R+XN48vGeYTjolEy27fPikFcvKL9yfQE42dE/4AVqdqkNLYT6LYY84RVOn59cw/XGvZ5okgnePLbmrFokQ1y+zn5909YgdzvFYVZLjnUSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MxUK9rgk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MxUK9rgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741022964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B7dOzss5xAIS9ugz03HBjmDIWffEe1Y3q/s1aHQafjQ=;
	b=MxUK9rgkS7i/v7IY0JziO8UIPehqeHXn6S7o3gweNiwbmy5iAwOI4gAHWRmZ3Kc5EveHPK
	0x5MkJHRcUb1SusPkepxu9vUXr+ASRrtmtsW4IkHOFZuplBrcRiVcgm5yzBUwb8Ow8EEL+
	kbM0Qg815Qefj7Joza6diMa48VwyJzQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-q_IWH9xYOC-M3v2ipI56Cw-1; Mon, 03 Mar 2025 12:29:21 -0500
X-MC-Unique: q_IWH9xYOC-M3v2ipI56Cw-1
X-Mimecast-MFC-AGG-ID: q_IWH9xYOC-M3v2ipI56Cw_1741022960
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390f729efacso909112f8f.0
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 09:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741022960; x=1741627760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7dOzss5xAIS9ugz03HBjmDIWffEe1Y3q/s1aHQafjQ=;
        b=R/FfQsJE6HOBtoBGWkMxeBnCathIwqlJBA4lPYO9KKlPvP8kUQJtV6C00YFHDGAiWV
         X/SGQjrhVSm5dnCB3a0nG6E2+fMHGPaZNAW74Ywqp0FMi1/VBEcsNx8di33OwscIQyFS
         2/Ys0UtQ0w7Co64+O5DRsDDtSUOF790wYzAlmchb/Q5daJR77szYnxT6RAIK7NL55Wm3
         GTI4MPRL/th2nUXsPNvuDcsTfrc/6DLsU6OjlGZoGnMeRLgWzucKFiwWjtr/RATmry/b
         wB/OBGsxgSipyfzFC0jLsBVXxl8TiOtNJxDsKi+WnLj773qj1pMFkewNbzbE9nXydLhB
         5rCw==
X-Forwarded-Encrypted: i=1; AJvYcCW/x2D1gchd94ZTIr1ubz7RzuLeaEqo0q+r9TUR4yolPKDt/oqBfsGkBxRuuWPvMKMKyGiVyoN3bfvM@lists.linux.dev
X-Gm-Message-State: AOJu0YyQIrzGOboaHMVaMZqChCBoifMaOYUT+9vaI5zGGYF9vDPlq9w7
	KGcSMrGaimLYxugowa1NK6js2FVfg2Jtu8RpV6MR82U3uNv4JtVVgPy1gJWUKoRP78pO91GbIp+
	sblAhBDUB7qDRK14GKhlMzN8QuvbwU+Tz2eOaKFOn+h6eJrDS6QZGdMn37+Y=
X-Gm-Gg: ASbGnct3f8RusDJtVvWSWGmfYEJZqeXreRx2MwlzvZZf/0xiCp7T/SnvK0SQtkfRbt5
	9KexvTWaA+xcoSb96b56BN4tSYHvQ9jvLQR2RvZRBuY0NIVe4NyCx2Wd8JzhPuYEBYzng5t9OmS
	7IJ2/IsTedxa7FFzccdCJztOmXLFTjQuljMsTPKZ+WWKDN+x4wGQhaZS9wgZtcpmfFu59Y0pYQa
	TU2uxJRnLSmE1JzVYjITNCG/5czIrUJR5tuSsPjX8jreWBHn9CTjv7lCIjkNs1qo80CLSMDa16w
	/RJKWIinkFvuYg4tfggibURR9VwcZjO5AcTBLNRLAcDDqet9zfvHOcf0nx7ws1CL
X-Received: by 2002:a05:6000:178b:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-390ec7c6abamr11328161f8f.2.1741022960335;
        Mon, 03 Mar 2025 09:29:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpchx3nv4q0TXNFvNSfubbI7dVtBf4O0TPmwO/185eVNFUyGlQ3OOmYi8/44rH+u3S41KQ3A==
X-Received: by 2002:a05:6000:178b:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-390ec7c6abamr11328135f8f.2.1741022959828;
        Mon, 03 Mar 2025 09:29:19 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba57145esm194884025e9.30.2025.03.03.09.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:29:18 -0800 (PST)
Date: Mon, 3 Mar 2025 18:29:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 3/6] tpm: add send_recv() ops in tpm_class_ops
Message-ID: <r6hegxjq2aoukue4hmnuollf7lukmpnv7vxca3buqo3hulcslu@kbua5cazkv4m>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-4-sgarzare@redhat.com>
 <c8e067f3-117a-7737-64ea-ac016b697d0e@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c8e067f3-117a-7737-64ea-ac016b697d0e@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3oNtu8s8bigzaSZ0saR4S82bvUko6nMwsMAvUdsdLPs_1741022960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Mar 03, 2025 at 08:06:43AM -0600, Tom Lendacky wrote:
>On 2/28/25 11:07, Stefano Garzarella wrote:
>> Some devices do not support interrupts and provide a single operation
>> to send the command and receive the response on the same buffer.
>>
>> To support this scenario, a driver could set TPM_CHIP_FLAG_IRQ in the
>> chip's flags to get recv() to be called immediately after send() in
>> tpm_try_transmit().
>>
>> Instead of abusing TPM_CHIP_FLAG_IRQ, introduce a new callback
>> send_recv(). If that callback is defined, it is called in
>> tpm_try_transmit() to send the command and receive the response on
>> the same buffer in a single call.
>>
>> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  include/linux/tpm.h              | 2 ++
>>  drivers/char/tpm/tpm-interface.c | 8 +++++++-
>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>> index 20a40ade8030..2ede8e0592d3 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -88,6 +88,8 @@ struct tpm_class_ops {
>>  	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
>>  	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
>>  	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
>> +	int (*send_recv)(struct tpm_chip *chip, u8 *buf, size_t buf_len,
>> +			 size_t to_send);
>>  	void (*cancel) (struct tpm_chip *chip);
>>  	u8 (*status) (struct tpm_chip *chip);
>>  	void (*update_timeouts)(struct tpm_chip *chip,
>> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
>> index b1daa0d7b341..4f92b0477696 100644
>> --- a/drivers/char/tpm/tpm-interface.c
>> +++ b/drivers/char/tpm/tpm-interface.c
>> @@ -82,6 +82,9 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  		return -E2BIG;
>>  	}
>>
>> +	if (chip->ops->send_recv)
>> +		goto out_recv;
>
>It might look a bit cleaner if you issue the send_recv() call here and
>then jump to a new label after the recv() call just before 'len' is checked.

Yep, I see, I was undecided to avoid adding a new label and just have 
out_recv which in future cases always handles the send_recv() case.
But maybe I overthought, I will do as you suggest.

Thanks,
Stefano

>
>Thanks,
>Tom
>
>> +
>>  	rc = chip->ops->send(chip, buf, count);
>>  	if (rc < 0) {
>>  		if (rc != -EPIPE)
>> @@ -123,7 +126,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  	return -ETIME;
>>
>>  out_recv:
>> -	len = chip->ops->recv(chip, buf, bufsiz);
>> +	if (chip->ops->send_recv)
>> +		len = chip->ops->send_recv(chip, buf, bufsiz, count);
>> +	else
>> +		len = chip->ops->recv(chip, buf, bufsiz);
>>  	if (len < 0) {
>>  		rc = len;
>>  		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
>

