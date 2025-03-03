Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC1022370F
	for <linux-coco@lists.linux.dev>; Mon,  3 Mar 2025 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018761; cv=none; b=Ebhowsto5miyiklmCs0cVBfMqKdKD/TLP2Kkqczz4EPw7W+QtyyEiwIxN3NIQvyy2CDu4D9WHnW7Mr9lzn444Vv7yUqGm/4l6AFmhPIyClswK5VgxoRpy8W9WOAByLPHJjKUUzLODqRhf4n0ruQ0gmqDpygZXzDE1MSVVh7fLXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018761; c=relaxed/simple;
	bh=kkHQcZoTJndCnwcbB9E+wpOiprPx3EnYCYUyF+KeBqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=i1MFEa8+TKiPsRdxodUxcl7ZX+Nhc7HB8mY2LAPnHZIPQZ0X1AL0lZJlFs2sEUxAOrowTQfuqZecU9+kVk/ODnWI/PsLSMGFyGRlZKgD811+YFOxvwFwggwM7vjGhUDBZbs2zU17h8N8g5+jDBgDir5vKOEOXayCc6D5LF5WuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C9pXhRSU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C9pXhRSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741018758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L5XdYcpLAdNxNfxY8Lfqw4ebX+gqF0nBQ5UXPPTJPbQ=;
	b=C9pXhRSUQkkTjgpMtimrc8zF4kdfH9JrgM0Obqtgy1R05IOQWPMnrwQLNxCdXhujUQliZb
	8ZBURthsfKX8xPGOzMAoj/LemWoo+tEXHsL99lldKZf1NP9dCT8MYkcQknxxdgl+DqcGb/
	Hp0aCU3C8mfeBBasXZBoNHpBlmuYb9I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-PORPLMtKN0-BJfcCNiHTBw-1; Mon, 03 Mar 2025 11:19:12 -0500
X-MC-Unique: PORPLMtKN0-BJfcCNiHTBw-1
X-Mimecast-MFC-AGG-ID: PORPLMtKN0-BJfcCNiHTBw_1741018751
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3910afe5769so578263f8f.2
        for <linux-coco@lists.linux.dev>; Mon, 03 Mar 2025 08:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741018751; x=1741623551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5XdYcpLAdNxNfxY8Lfqw4ebX+gqF0nBQ5UXPPTJPbQ=;
        b=ewY23tQ/yy0VJgh8yQXPE6cHQ9f3V1TTP/7yltMnj/sjT1IidOMZ7jpkmxdhZFHy2s
         Mna7IxRQMRJqQ8eT6LpjvS4EhXrp2fk+VzL/0hEgPt2xvVpLfRTCnUmPxlD7aM3Lh5/Q
         z0WPhVNM7UTWug78vQIHIADLiV9m3WlRcJYMtc3zo3TLCdP3gkt6SxAJMqsP51BmIzl7
         kpuIKirCi9MJMpodWIBBgo2QNZ7UlgY8LHjaXohCKe6uArP2B3jLFqzTP2yAVpFPBoNH
         Am8VFGRMcdKMVZCKWlDnwKquc+c63y/IfV2n7QdzcMfDV+KZqsSkiAuleU0plBExFNe+
         sCuA==
X-Forwarded-Encrypted: i=1; AJvYcCVqKegK8K4Hm/JLJeqvJUQC5vZ44WqT+bzgIE4pHv1mEyw1he2QlOHIbs1eiwOAbzKV+xnDsQOICjKM@lists.linux.dev
X-Gm-Message-State: AOJu0YxuDCAEID35F7a6S6083Xry6+q2T9MEUlbg00KVE5FnONm5GuEb
	OXJUtuwrra02nQByi3IphIvSYX/8Yw1OagVIK+dFNdJjUGhZJKwRtsEhCGF1d1/ZMQGfNj2tKJ0
	KBA/pZMJ++vZyXzV9tTjqyn4FjpUbqKGlVMBJY/R9iDJHDZrX9Xv/B5fDoY8=
X-Gm-Gg: ASbGncuwZ8b0tugl3Hd+utsKUSjPprk/n/yq5oc+cDLwp5qBoQsg39rdUZA60ntOSXU
	IeQVfgHWHkhgNzl0ojsbNZu/ee76nrUk6GNBN8m/C13Zt0D32nTLyqJ+O5T94cdXUipflGwFQRI
	N67T0m+IphkNQ2LFqhIuXJWaLwn15gjBaUOl9fMdN6AoeqYNemY7cSmnlq4zisXlS1OPHOWJPEU
	FbA2zERPkoiJGYiwf9gO3oyPhgQWDeSKaoucLh/yKijiJqJ1Z2Gn/gCxhZIwO+HKxxU3aibdTCj
	rLAYA50DTeb2ppayc34IdarDunV30rHJHBInRO4hPn+h7gcLZxb6RYhRE+MCbC0R
X-Received: by 2002:a05:6000:2ac:b0:391:42f:7e94 with SMTP id ffacd0b85a97d-391042f836emr4415532f8f.18.1741018751449;
        Mon, 03 Mar 2025 08:19:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNgTP7CW85b75d/hToTcBGfinaj7PcJa9xIMaekWrZFC7WO4fkAD1vXiloSjC5Lawdn0s6dg==
X-Received: by 2002:a05:6000:2ac:b0:391:42f:7e94 with SMTP id ffacd0b85a97d-391042f836emr4415499f8f.18.1741018750944;
        Mon, 03 Mar 2025 08:19:10 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba53943asm193042295e9.19.2025.03.03.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:19:10 -0800 (PST)
Date: Mon, 3 Mar 2025 17:19:05 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 5/6] tpm: add SNP SVSM vTPM driver
Message-ID: <45ze5sxvcvg2ituxrefw6konxtwjgs4zs5bscrp2khfqkf3jb4@zozeerbmtik5>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-6-sgarzare@redhat.com>
 <20250301002819.GO5011@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250301002819.GO5011@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qcqo-vDKkt1Td9r_VlbOZSwG94Vy_57waMfzsucnT8Y_1741018751
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Feb 28, 2025 at 08:28:19PM -0400, Jason Gunthorpe wrote:
>On Fri, Feb 28, 2025 at 06:07:19PM +0100, Stefano Garzarella wrote:
>> +/*
>> + * tpm_svsm_remove() lives in .exit.text. For drivers registered via
>> + * module_platform_driver_probe() this is ok because they cannot get unbound
>> + * at runtime. So mark the driver struct with __refdata to prevent modpost
>> + * triggering a section mismatch warning.
>> + */
>
>??? Is that really true? I didn't know that

I initially followed drivers/virt/coco/sev-guest/sev-guest.c to figure 
out how to clean a driver registered with 
module_platform_driver_probe(), then I saw that pattern with the same 
comment is used in several other drivers.

>
>I thought you could unbind anything using /sys/../unbind?

I can't see `unbind` for this driver:

   $ ls /sys/bus/platform/drivers/tpm-svsm/
   module	tpm-svsm  uevent

While I can see it for example for others like fw_cfg:

   $ ls /sys/bus/platform/drivers/fw_cfg
   bind  module  QEMU0002:00  uevent  unbind

BTW I can unload the `tpm-svsm` module. Loading it again will cause 
issues if I don't have a remove function that calls 
tpm_chip_unregister().

Thanks,
Stefano

