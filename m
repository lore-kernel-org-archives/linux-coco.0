Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B3417583
	for <linux-coco@lists.linux.dev>; Fri,  7 Mar 2025 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741361843; cv=none; b=DnVS8DPr330cTNgRVONuQ4kr7oxJIMpPNgVO1eyghblOhd5lhmTCHv3gdfKJYCvkCEb/FOtfjHL8upLYMVZvY6zkPQuX/97vr3Uw5j3jHEwTantkiDij6a+qrI4zw7BNAJXJA7xKRu1lpw9kjFTq8vmHkko4S7S14KCUW3O1bHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741361843; c=relaxed/simple;
	bh=WZMUU+0do32vIB4ayqbki3un77HmpR/Tr9pMARBVFEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZQe4dX6DExe0rjism0iHj+1jx8CPyGqzhC6St1r7NQdlGdu4Qi2GucTlkJFlsQ6xSBLOUwxswI0k6AztG2c8fAK6AwiXMWQJ0OZhzPKzcZYVDBCR51+FdTbAulvgXMq9pnWgq7cFPL6TfOLyKVeEndaAjYut0hfotAivgr9wo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MKlBE672; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MKlBE672"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741361840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yqwct7Qo/RvM8L19VRfmymsuLYi1f8S6Qn9ogdk5ZAQ=;
	b=MKlBE672Zb5t/e1fHjPo94W0azqMjcBXjfKqxuH1tcrBxgkqXa/QMYDeVlvminjyMj0Ssu
	ZytQtk/ClS3Hhwshnd4KaF76v7Osv+KFeO7z1xNxR503oPefMtbUSj2jpH1koUfYL7ymla
	/OUFNr70xpeGD7PWEoFXF1/hD2jyJd8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-_UWvFpXtMW2HOkMba-S7pA-1; Fri, 07 Mar 2025 10:37:19 -0500
X-MC-Unique: _UWvFpXtMW2HOkMba-S7pA-1
X-Mimecast-MFC-AGG-ID: _UWvFpXtMW2HOkMba-S7pA_1741361839
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ce1eaf9f4so1674315e9.0
        for <linux-coco@lists.linux.dev>; Fri, 07 Mar 2025 07:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741361838; x=1741966638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqwct7Qo/RvM8L19VRfmymsuLYi1f8S6Qn9ogdk5ZAQ=;
        b=WnLuUzNHZNn9SPApL4F2ERpWUzFRuRBwtT3Nm9usQn6qRpnzlSqpTtqnxWIGZbw884
         b1myAYDJjcLrXksd33ysGoZLZQEg6w//ZtBFE7PvOWh8BhPXUzesJ9qaww3hnaI7PvKr
         WWR1bi6YzV6SmjZ7E7sxo9Gxy+JOqlDCqJJBY+zGjkF0iEr0p7r/E+hzpIaCQVnHEdwM
         sAr0EuT+aZ649GMehQB3ROdU7PkCTT+24PkGRMo7u/jZLFTTQOvodfxnAROW8MyJCQlK
         sSVX3YeVLjehZQ8+2SwBEprEbDt0Pkngr+LcT3ATVN8n6mbyjAkiI1OSrcuOmOxX1Gbs
         2imw==
X-Forwarded-Encrypted: i=1; AJvYcCWX024OHNn8WOVfSkA49kHKDuJfCCIE9EaOIw6uEcXnaZ5IIzzE75Buk0Z3AYm0f8qk07k971ShEhTF@lists.linux.dev
X-Gm-Message-State: AOJu0YzqC9wsa394VwqMnqwoQdq6w8Ry43lrPgXBQb4kd1DECjEInqKe
	K7nN6GeFGONSAMLzFzlfl9rUYFMc6dGhtWxCzP2e6uEJxb/I8WoBzAZErqBVjyLFz6aEhJKFNgv
	IaO4SnDix0e41drNLDwpbfSNNv9/CSyAyJMsmlaqcePhiU5W0UCk1qEjxWig=
X-Gm-Gg: ASbGncuwRvQ/rvF9hqKQwcQzhMBoyaKNtmK6u3pEc/wdLvSFOyHvD6u2A6+uHyO9Yxj
	SxRIwaxreDsWGbP24prfMdbFili2R4u9j2Rs6sbcYkbbAgx5VsBbQhqp2HSq01gQoT8tUlIhDb2
	o/6itUKhaghsJwfilsTzVlHyR+5AjVqGUspo1fdlJCcH4PVAnWFbWHP61O/LXV7820Ic0lrK+So
	1OOQI71hlQtCLnLrQSXMAzrAR1rZyVkfvd1MH0AhQCgPHj5wAYGcllSkTWydsRTrIczwHYwnLMz
	sRoIYuzzk/YvRwTZmJGLR4h6rXNSxz2OSYSrnNdwkSrAbqLjlyp262gQXCWcnxjx
X-Received: by 2002:a05:600c:1d03:b0:43b:cf12:2c9e with SMTP id 5b1f17b1804b1-43c601cf24amr22907625e9.1.1741361838531;
        Fri, 07 Mar 2025 07:37:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCWNbeddeZHfz4UovoxYVfEDe+cZ0Hg5a6sskYJHpSKTFtNwY3+RHZMac+Si09BWeINjSZVQ==
X-Received: by 2002:a05:600c:1d03:b0:43b:cf12:2c9e with SMTP id 5b1f17b1804b1-43c601cf24amr22907195e9.1.1741361837942;
        Fri, 07 Mar 2025 07:37:17 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b046dsm54598135e9.5.2025.03.07.07.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:37:17 -0800 (PST)
Date: Fri, 7 Mar 2025 16:37:12 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 3/6] tpm: add send_recv() ops in tpm_class_ops
Message-ID: <fgxwcfm6fctdsjnzdbf3ecxss453dir3pgaqio7bzazjj5qotj@mdi6wtuzorvn>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-4-sgarzare@redhat.com>
 <Z8Jmps6AF_geaHUw@kernel.org>
 <3p5erujbhxw7ozdnfpmresv3dqdh2xszolv6mh4khkagoy3wit@ow5qht4keh4h>
 <0e156883acf95d31b9358831550d6d675e3ce4ff.camel@kernel.org>
 <Z8dg46Mj81Q9Z0WV@kernel.org>
 <jkr5z4thb55gs2jcmtcfipgg6p7z6ikhr6etd6l3nqpf723hf7@3fns3z5cjqk4>
 <20250305190229.GC354403@ziepe.ca>
 <Z8oZLqn4p2-AWQbz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z8oZLqn4p2-AWQbz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZYerM_PmCbrCJvLH9d0R9RiHoOV_Jcaoimc16B6CDi8_1741361839
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Mar 06, 2025 at 11:52:46PM +0200, Jarkko Sakkinen wrote:
>On Wed, Mar 05, 2025 at 03:02:29PM -0400, Jason Gunthorpe wrote:
>> On Wed, Mar 05, 2025 at 10:04:25AM +0100, Stefano Garzarella wrote:
>> > Jason suggested the send_recv() ops [2], which I liked, but if you prefer to
>> > avoid that, I can restore what we did in v1 and replace the
>> > TPM_CHIP_FLAG_IRQ hack with your point 2 (or use TPM_CHIP_FLAG_IRQ if you
>> > think it is fine).
>>
>> I think it is a pretty notable simplification for the driver as it
>> does not need to implement send, status, req_canceled and more ops.
>>
>> Given the small LOC on the core side I'd call that simplification a
>> win..
>
>I'm sorry to disagree with you on this but adding a callback for
>one leaf driver is not what I would call "a win" :-)

IIUC in the ftpm driver (tpm_ftpm_tee.c) we could also use send_recv() 
and save a memcpy() to a temporally buffer (pvt_data->resp_buf) and also 
that 4k buffer allocated with the private data of the driver.

BTW if you agree, for now I'll do something similar of what we do in the 
ftpm driver (which would be what Jarkko recommended - status() returns 
0, .req_complete_mask = 0, .req_complete_val = 0) and we can discuss 
send_recv() in a new series where I can include changes for the ftpm 
driver too, to see whether it makes sense or not.

WDYT?

Thanks,
Stefano

>
>I mean, it's either a minor twist in
>
>1. "the framework code" which affects in a way all other leaf drivers.
>   At bare minimum it adds a tiny bit of complexity to the callback
>   interface and a tiny bit of accumulated maintenance cost.
>2. in the leaf driver
>
>So I'd really would want to keep that tiny bit of extra complexity
>localized.
>
>>
>> Jason
>
>BR, Jarkko
>

