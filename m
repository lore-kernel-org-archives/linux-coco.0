Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A89C21D002
	for <linux-coco@lists.linux.dev>; Fri,  7 Mar 2025 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741361882; cv=none; b=DNCDbK/vZsZE0TJdc8qN7RQxlEQCAzE68mWQ5Ir3y9yJOk2YncMf+WktKESOTTcL699QokFA0WrDhJ6W5LudwsN/XxjeTJgPWtIlnlqyYNaVlmduXRTnClbYOOLmSCIb/5zjIFbezokUROLwOGzXzapBm54KT17KJ+ueMNEcZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741361882; c=relaxed/simple;
	bh=UaKgYKgRNweERNpL0sYd2eYOjEHfRdISZiNE+9EOqdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WJVIE2b4eHrMnUzJu1+0wqkMPbvWtwlIk95r0nLR5lD5TzgNXr57zWIeJJHaSaC2PZqmFBTB67T8LpLNkhn+yTWwKiqeb2FJQR38UuSe5yxOklENeLMOcPRts6T/YhIZQfXDLsvf1rE8DmPcBa4nXk97GTJC0qO/e1BJtXRZ28Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RF9uQAcS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RF9uQAcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741361879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCEnBg90XzFtM7VUQEX7isG0VF2FTRraT+UhcAxtG0U=;
	b=RF9uQAcSKZxf85Z6ImZCGnjT033M2BIC6Hy1Dq2NVfkylAuGtIF3NUdKXiz2H7U5IoqFef
	pvgRXUfftdl1rad5FDe2OtdEQ8zqXQF50CwS+w74CsOlZMTTcvw2mqZ84USIn7pDy69Fln
	IDVJwqFJ6Gu0FqtF9wxycbO52bHrBek=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-aKp-HKx8PD-BT_J-6UYmlg-1; Fri, 07 Mar 2025 10:37:58 -0500
X-MC-Unique: aKp-HKx8PD-BT_J-6UYmlg-1
X-Mimecast-MFC-AGG-ID: aKp-HKx8PD-BT_J-6UYmlg_1741361877
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912fc9861cso713402f8f.1
        for <linux-coco@lists.linux.dev>; Fri, 07 Mar 2025 07:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741361877; x=1741966677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCEnBg90XzFtM7VUQEX7isG0VF2FTRraT+UhcAxtG0U=;
        b=bkoVr8jch8fF+pzyaFxNFYce8P32vVBOGJse0QwHUgC6Evrkmy801ImNBm6+7daasn
         IfAnKTJzpMN+3we5+0LxR0EzFIDKk7YDpz6HkV8KGt1aaeLGf0zQ19UB9yprfv1Od4s0
         tqucMmJo99wkAtvIbxhV60ekkNJXbYurnY3PnvHuYsPD/nSrqsBoHEzxAf083+7MqtIC
         D8xoZ7p55F95nUuV5fgAYWuvzgAZGoZVk98QuZJe4N9a3bWVk/msFDNg3ROYdF5+gMct
         Wi2aIXiv04CkhKzV3clr0pdGf085OyEXiuddNTz8/VEM7R0ivFx17WDvitt9iprSR1ZL
         J+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIq/c67zwNxv/S6PjvGFdlhhBC7E+U6+MAHN1gNPDUaVxcZjdsKuHveE64qbz3SeTg/vcMj4KfDhHW@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/dEjYl1g6qPtOay/yhBXKnjfPW4v9hW0ZMjXJEWWxp15pkzRw
	iIpOo9wyrDEay7rs+HwXllNH5a6jra43YVdH6xeL7o78YN1D7ca/hbzHYJmfHRkZy2veDJ4sYFW
	zPj5MCoLL4oMrdANc7cy21eum2oUcWhU2/+gIMbblZ4xeOWS91MeEsF5PJzk=
X-Gm-Gg: ASbGncvrdZp88vvwXldUxzBYwWijv/pK3SgHu7EFcuSSQBoSyBfXIAQurHwWYqG6BXI
	AZPgjF7aRnPTgMGjBFfVbAayXGSvtLVqtlDC0yiP8onT9xzs+kt8/4p05W6Ji7xhzb9DYWVqmQq
	OcL14LlP8rpyHYhCLUYPMs7swyv2xp4rAIABiaxgbpaaMvj4r8ij6UfdFXqxg5hEwJqKck8vB/r
	22UnJ1nbVL0517pAAYdryMQvV1iUjdG5lBVtOMd9jPrXsj5llOo0UMKFiDBsAW+2cyrffJjjQbO
	Pu4wbACElmfZzn2aitZchCjU+3Bgoy9WvAtSF6B9U9JMTZ6eHo73AvATB4RtkZRG
X-Received: by 2002:a05:6000:1fa1:b0:390:d6b0:b89 with SMTP id ffacd0b85a97d-39132da91b9mr2467058f8f.50.1741361876988;
        Fri, 07 Mar 2025 07:37:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIJMvm5xV/SzBS3SsEtyfC9KwyMaXW507M9hj1kZ3KsK4zYX0qBeDOTEmMi3doGmekM7Y1Mg==
X-Received: by 2002:a05:6000:1fa1:b0:390:d6b0:b89 with SMTP id ffacd0b85a97d-39132da91b9mr2467028f8f.50.1741361876487;
        Fri, 07 Mar 2025 07:37:56 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm54526185e9.33.2025.03.07.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:37:56 -0800 (PST)
Date: Fri, 7 Mar 2025 16:37:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 3/6] tpm: add send_recv() ops in tpm_class_ops
Message-ID: <tjo335oq47ogyobxzlopuxwqzto6gzm4gezqs6umphndehothu@5u4hqukop36i>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-4-sgarzare@redhat.com>
 <Z8Jmps6AF_geaHUw@kernel.org>
 <3p5erujbhxw7ozdnfpmresv3dqdh2xszolv6mh4khkagoy3wit@ow5qht4keh4h>
 <0e156883acf95d31b9358831550d6d675e3ce4ff.camel@kernel.org>
 <Z8dg46Mj81Q9Z0WV@kernel.org>
 <jkr5z4thb55gs2jcmtcfipgg6p7z6ikhr6etd6l3nqpf723hf7@3fns3z5cjqk4>
 <Z8oehuPVMXbgjAxz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z8oehuPVMXbgjAxz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BLjw3BguXXYPGisB-0F52YcnK6im7zwJ8Xd_9-4eXts_1741361877
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Mar 07, 2025 at 12:15:34AM +0200, Jarkko Sakkinen wrote:
>On Wed, Mar 05, 2025 at 10:04:25AM +0100, Stefano Garzarella wrote:
>> On Tue, Mar 04, 2025 at 10:21:55PM +0200, Jarkko Sakkinen wrote:
>> > On Tue, Mar 04, 2025 at 06:56:02PM +0200, Jarkko Sakkinen wrote:
>> > > On Mon, 2025-03-03 at 17:21 +0100, Stefano Garzarella wrote:
>> > > > On Sat, Mar 01, 2025 at 03:45:10AM +0200, Jarkko Sakkinen wrote:
>> > > > > On Fri, Feb 28, 2025 at 06:07:17PM +0100, Stefano Garzarella wrote:
>> > > > > > +	int (*send_recv)(struct tpm_chip *chip, u8 *buf, size_t
>> > > > > > buf_len,
>> > > > > > +			 size_t to_send);
>> > > > >
>> > > > > Please describe the meaning and purpose of to_send.
>> > > >
>> > > > Sure, I'll add in the commit description.
>> > >
>> > > It's always a command, right? So better be more concerete than
>> > > "to_send", e.g. "cmd_len".
>>
>> Right!
>>
>> > >
>> > > I'd do instead:
>> > >
>> > > if (!chip->send)
>> > > 	goto out_recv;
>> > >
>> > > And change recv into:
>> > >
>> > > int (*recv)(struct tpm_chip *chip, u8 *buf, size_t buf_len,
>> > > 	    cmd_len);
>> >
>> > I think I went here over the top, and *if* we need a new callback
>> > putting send_recv would be fine. Only thing I'd take from this is to
>> > rename to_len as cmd_len.
>>
>> Got it.
>>
>> >
>> > However, I don't think there are strong enough reasons to add complexity
>> > to the callback interface with the basis of this single driver. You
>> > should deal with this internally inside the driver instead.
>> >
>> > So do something along the lines of, e.g.:
>> >
>> > 1. Create dummy send() copying the command to internal
>> >   buffer.
>> > 2. Create ->status() returning zero, and set req_complete_mask and
>> >   req_complete_val to zero.
>> > 3. Performan transaction in recv().
>> >
>> > How you split send_recv() between send() and recv() is up to you. This
>> > was merely showing that we don't need send_recv() desperately.
>>
>> We did something similar in v1 [1], but instead of your point 2, we just set
>> `chip->flags |= TPM_CHIP_FLAG_IRQ;` in the probe() after we allocated the
>> chip.
>>
>> Jason suggested the send_recv() ops [2], which I liked, but if you prefer to
>> avoid that, I can restore what we did in v1 and replace the
>> TPM_CHIP_FLAG_IRQ hack with your point 2 (or use TPM_CHIP_FLAG_IRQ if you
>> think it is fine).
>>
>> @Jarkko, @Jason, I don't have a strong preference about it, so your choice
>> :-)
>
>I'd say, unless you have actual identified blocker, please go with
>a driver where the complexity is managed within the driver.

Yep, got it ;-)

Thanks,
Stefano

