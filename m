Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D9821E0BE
	for <linux-coco@lists.linux.dev>; Thu, 20 Mar 2025 11:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742469530; cv=none; b=B2meJ76AqGiu/XhBROE8h2ZD4rOvhnyDRIDzLQNUpqUWV3BaAmjjrsMphqihNtbmWDeoZozBnMH0PNIFGjjCLE3ccCjt57Z9SdmDkhc281DcCllJNvqLq6jAB5I65xqI7P4MvmWafh17/NC+eIJf4VWtuhRw67zHW1wQCLNCdZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742469530; c=relaxed/simple;
	bh=0FdnkXQluRsPObUmbyXPh2pDGWDzoaM0MsbjAFVybsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IWDZPKQ+v6FSC6RGUqepfJAXayky93XVF5doh0Y3+7sOB6WSjqMsKUrPEiMSKmRFED3GV1DGj3Y29n30dgoL0KKc1ooYZnD1zXmWEEaX4WsU5Y/cSFMBV3nBQL51P9xPHjz3U6Tq6JEZDG30jYjq4kziaEgtJpJhLM1Uqcw4uV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LhC4gia5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LhC4gia5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742469528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NlhLlOmKjiRqXZDEYP/oB3y/fV4BzL5SuKNYZXi0IDU=;
	b=LhC4gia5O/tkJKMheRz3VBIhpjLRMDwOLWKockOvRz1QoSpF8dOeyH4ON604L6G/gWOIc1
	q95T6wFnEDA6BiGNMFXJyHGKIxXrtEmfOI8nbJ11JW2JdZxYIL0zoLvpGsKSAtbJe0Jyth
	lBH69VG6ZBOUY4afWlYZtnMpmkG4PgA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-f0ErkwKROR-0rrDQFkkWVw-1; Thu, 20 Mar 2025 07:18:44 -0400
X-MC-Unique: f0ErkwKROR-0rrDQFkkWVw-1
X-Mimecast-MFC-AGG-ID: f0ErkwKROR-0rrDQFkkWVw_1742469524
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39149cbc77dso417895f8f.3
        for <linux-coco@lists.linux.dev>; Thu, 20 Mar 2025 04:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742469524; x=1743074324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlhLlOmKjiRqXZDEYP/oB3y/fV4BzL5SuKNYZXi0IDU=;
        b=d5M6lp8cjeDtC3b4q+P9M5Uds5uqsdSOeHYA3C8TIeRaX34mdSXLw+P6nEcM+SpKIH
         8XJf1WesFfGfeyr4uZSXb4+JgylKykDh1vJoDEsQqZVrYpy+PdfOacc8X3IIZPoP2L1P
         LRBBct5xhxL1JhSeT7MfLCIW1DBuIEi0m/Am3NUTdsAtG2GOvIVrZPxqKVS6zIjuNdzZ
         1Ju1ReE1Uym6he817XvrcPOgWx8nnRt369iBgpU3ejcwM6RvtZD8DXTqm+RpEkYIHvr7
         1CXIzUGjUiq0R43ttm7jJGsfR7T5S6ocK5+1kA3maJ+wiyZ8KzOxCNwWZuz62xor6sGn
         BFiw==
X-Forwarded-Encrypted: i=1; AJvYcCWLlYNp5sUC49fufBzPD5QvmDJ9llTSuYY8vonGdTmmV3CvjNsDr8L6N+JpGJ68BcuaPgUr+LSJyyBZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwmicRPOvfWD3HlEhMLaQbt8z2GzPz6L0OaBoXKFAqIKLt8CFQ2
	uT4wQpIk9/cFOPYqOzbfWUOdOvDzn/xcxL6UBhRvZhOZVzi7wkH3aXRypdIv5MSTM3ISV4QQPtZ
	ZLWWXFyQQnsdyHC/RSxdAgFErOpb3UjfrtHQ0nXVoxUfZb/bICyDfOOMh0wo=
X-Gm-Gg: ASbGnctGxZtwujV4+dJJZkO2jpRdtOwrN1Im7mQuWr+l/UQZefZM+FItGlWYHfX8h4i
	kjkHtQHPYWhpZVhTJ4y521GLlt0p3dRlV4LfW/5lCkvIBarolSxBI1f0DK5+sCznzghKT3o7t67
	sIANu6x/JOGI4ieH+l4EpIfIdqBdlzycVwrkT9LRyMfXmVZxwaGfCg4zH2Ka8Y9rrzpyMHRuIw8
	dSnJ17zQn7wRg1lqypYuLauBUF999T+YUN8aFjFmyDYD30nVwGNhbBTwWbyX1djvvZ/Y7cLi1oY
	30SdgKf9SG6q8s9mcjXjIZ47Yu37QHThuXcb8BTaD2Bh0FGuusqwHJ4dWRg6GYlX
X-Received: by 2002:a05:6000:4107:b0:391:255a:748b with SMTP id ffacd0b85a97d-39973afaef3mr7410050f8f.39.1742469523531;
        Thu, 20 Mar 2025 04:18:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI5mpKp1YJg5aoVvk5ggv41pOHlIt28ldIzkOLJLMe/dkF2SkzzL//q6jSa4e5CHMy+shCrg==
X-Received: by 2002:a05:6000:4107:b0:391:255a:748b with SMTP id ffacd0b85a97d-39973afaef3mr7409991f8f.39.1742469522991;
        Thu, 20 Mar 2025 04:18:42 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318acfsm23916885f8f.70.2025.03.20.04.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:18:42 -0700 (PDT)
Date: Thu, 20 Mar 2025 12:18:35 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, 
	Dov Murik <dovmurik@linux.ibm.com>, Dionna Glaze <dionnaglaze@google.com>, 
	linux-coco@lists.linux.dev, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <imld77cuc6e4kyd5an5oeerfseit3l4enrbpazne2ybo34srik@ejqwayyod2mv>
References: <20250311094225.35129-1-sgarzare@redhat.com>
 <20250311094225.35129-4-sgarzare@redhat.com>
 <e4eeaead-2277-1f6f-86eb-f80deae2135b@amd.com>
 <Z9gm9iWhk5Zs2NvI@kernel.org>
 <CAGxU2F7fdAi148rB-4c==-qCOW1SJjwf4AzC2=TUhfPXMhR5pQ@mail.gmail.com>
 <1262fa5b-0822-b8d4-26c5-426ffa4e0265@amd.com>
 <qne5fm44dhkbnwc6ldgff76ljt7ecd3cvtf3b3lhos56yyx2ez@qbcv45zbxlhp>
 <20250319234422.GG126678@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250319234422.GG126678@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wP57ODWXkxv4wXruFoA-VRE5GUelfLBoaiYySsb10Nc_1742469524
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Mar 19, 2025 at 08:44:22PM -0300, Jason Gunthorpe wrote:
>On Tue, Mar 18, 2025 at 05:18:53PM +0100, Stefano Garzarella wrote:
>
>> I see, thanks for the clarification!
>> I saw that with devm_get_free_pages() I can easily allocate a
>> resource-managed page, so I'll do that in v4.
>
>As a general note you should just use kmalloc these days, even for
>PAGE_SIZE. It is efficient and OK.

Thanks for sharing!

I think I'll stay with devm_get_free_pages() just because if it's
page aligned (with kmalloc I'm not sure if I have a way to ensure it), 
it can be a bitter faster for SVSM to map/unmap it on every command.

>
>Having a struct that is PAGE_SIZE+1 is not efficient and will waste
>a page of memory. That should be avoided ..

Got it, I will definitely split the buffer allocation from the priv.

Thanks,
Stefano

