Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575DF20D518
	for <linux-coco@lists.linux.dev>; Thu, 23 Jan 2025 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627006; cv=none; b=c6aeMRyRkSI9+nALEqVEVKKC+/JWdOW2K9LLmbg96g8jy3V0N+X0gKVeQIVBiQKThQWuwm+fCNe/UeQdB3OXgd/bZOPr6IoNoKwc2bYmykNfzxyfxG7wpoFtbiZkX3ZU5/xeII1JKsTpcj49uQ9u+5/7/hfRsmX0hrtuT+WdhgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627006; c=relaxed/simple;
	bh=AZocO9qizYTYyr8iDVCWWLjYcfYMA/r+d7A6sF8T8/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=W9bCSYqKjBxxbqRx2D1Ij/MH63BS2ry1vmGOmu7jgds8xEb2mgC8jRa/uEZu2hvT7OE2cs6m0QeUg7hqf2cnd/Z7g2Utk4Fi9TeTdVrA8q/MRFHFe4zSWgU6rYfaBdWhsqZzR10qk457/m+7lURTYbo52UgbGlTMlBf2xyVkm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMPIy8Tq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMPIy8Tq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737627003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AZocO9qizYTYyr8iDVCWWLjYcfYMA/r+d7A6sF8T8/8=;
	b=gMPIy8TqkD2PcYvhjabM3+O6qLt+oscQ2MwpdCaowRXJBOx1RAeSj9AdH2+xq34w//zmz5
	id/fxI8y2sq7sLWWA7943nvm2emX+NLZx/LutKXTKo1vRNf68tmSwO1i3Is9rcr246JFhs
	xNLpJqvl291ScLKkxmaijIi/WTNtGP0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-7LzklPKcOQ-AHXJoqHvhsw-1; Thu, 23 Jan 2025 05:10:00 -0500
X-MC-Unique: 7LzklPKcOQ-AHXJoqHvhsw-1
X-Mimecast-MFC-AGG-ID: 7LzklPKcOQ-AHXJoqHvhsw
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa69c41994dso55331166b.0
        for <linux-coco@lists.linux.dev>; Thu, 23 Jan 2025 02:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737626999; x=1738231799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZocO9qizYTYyr8iDVCWWLjYcfYMA/r+d7A6sF8T8/8=;
        b=Nnww1CHqX8i56JfPKGdpt436ynImjHPRNpSTXBXYym9lKUGJNUlFqEbnAbuzfcwAFW
         xgUlfu2zx5nWOGedIM+K2oohVE/kIne0D1pvDdTJulcWW94qgX/OVNUU3DMIEsf46x2g
         t6mWCl9J3z8U96xhL+1ev6oGjLGb5D6wCIxROk+M5j29yymlN//VFdIQDP5gmnn+jEII
         OKH6e1A7dKXV9LnOmqinRNjotHrWVIO8+JUVtg9ElcRWN0EYVsNMg/ZlD4k4pKCZWogd
         nHyBY2+mCO7Bo69ACQrSs77+/ZUa9Brjv8DYtpKugjX6b6dnqHjbruiL09cCFERZVTtb
         7Ltw==
X-Forwarded-Encrypted: i=1; AJvYcCVMvPiISX5c4ZTjb7d/ZQ3hoAXQizAOKfqgHL0naFOBuirR6aioxgkcVS5mRgMK8DBT5o0fLKoorf9k@lists.linux.dev
X-Gm-Message-State: AOJu0YwgFmZdQPIs+zvFCc8qnGEP1lAp/BVnK2YSyg2LOuIEEKU2Br3o
	z4dmUDzMx8m9lV4zMFpM+KsLxUgveeUPI0rAn8ItY10fZiYf0g3SoXCsTPe+Th5E6a7RPZXoih7
	0DlO0Kv5QWxy2b3V8ifNVuOV/RKTowQEpYm2rjUp1qwLXXKje8xzm1cvPM2Q=
X-Gm-Gg: ASbGncsOys255JdbniKXNADTApL0mB9jZNOKWawFNs7sYIu+2sOou5V39TS1nOH2MgJ
	5DcFmezZY/ZhicbbQElUL+MBmBzwuGRSPmSbZmtZUEUTIw+3+sTJB4vnOfe0PM8pD+D/iSVKmAx
	9jVnU1a58TvT8kJ1t/4NkHeb9ol2V1a/eSUcoA3W/Gy+fE/vh2qqaZSbjC/St5yqN6Z4OmqsXRe
	WnOzjR0vRG5eBFdgIbhYpG9DSbkjzBvwsEEyhdqESR5zD/yiomPaAH2ha3vCw7RFSPdAbgSEuY+
	ILPk0eaJXpRoFc0YainhXDEbCWlTHa/BY9iW2sEj3QEQaQ==
X-Received: by 2002:a05:6402:5106:b0:5d0:ced8:d22d with SMTP id 4fb4d7f45d1cf-5db7db07334mr57465631a12.22.1737626999569;
        Thu, 23 Jan 2025 02:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsh4qs3h5y/WITOVt8IMEEcWxABv+Wl7UIuHOkXSUtwU8XIuPaZiXvWx9dgxB+3PPt41iI+w==
X-Received: by 2002:a05:6402:5106:b0:5d0:ced8:d22d with SMTP id 4fb4d7f45d1cf-5db7db07334mr57465532a12.22.1737626998747;
        Thu, 23 Jan 2025 02:09:58 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-100.retail.telecomitalia.it. [82.53.134.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce0f58sm1027463466b.48.2025.01.23.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:09:58 -0800 (PST)
Date: Thu, 23 Jan 2025 11:09:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, Jason Gunthorpe <jgg@ziepe.ca>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, x86@kernel.org, 
	Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <sf5zezwsokmz7lkl7fdl5z5q6lipeqd5d4sws2hpi6pznyvdap@tjfv5p5uty7y>
References: <20241211150048.GJ1888283@ziepe.ca>
 <CAGxU2F7QjQTnXsqYeKc0q03SQCoW+BHbej9Q2Z8gxbgu-3O2fA@mail.gmail.com>
 <D6FSHG5Z9UJQ.CWQTAANBVIQQ@iki.fi>
 <6rwo7tkdst227kb4pwvr54w4mfz2zw3offux7mqfupi3rgwkaz@65yklvvqw6n4>
 <CAGxU2F4YQy-otsGtGiUHDiL7PGXic2_HzWL_+GHkn+Hs_ScGpQ@mail.gmail.com>
 <D725TPWOVBUL.1DJAOZ0QL0RNH@kernel.org>
 <D725V628UV87.31SUEYVF9IUUC@kernel.org>
 <D726DAWHLOGW.3TR2LCJ936OG7@kernel.org>
 <CAAH4kHYy7=OZsHnOBiQug0Y__bNHt6i+bop0xaxQjpWQ6aQr1Q@mail.gmail.com>
 <D79CYAVX0LAZ.1MIYNOM6J7MMM@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <D79CYAVX0LAZ.1MIYNOM6J7MMM@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dBcCl_XsHkZOsIpVrYE8Y0La9TnbMYvrJk311OO_l3U_1737627000
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Jan 23, 2025 at 11:50:40AM +0200, Jarkko Sakkinen wrote:
>On Wed Jan 22, 2025 at 11:29 PM EET, Dionna Amalie Glaze wrote:
>> I can appreciate this viewpoint. It even surfaced Microsoft's fTPM
>> paper to me, which solves some interesting problems we need to solve
>> in SVSM too. So thanks for that.
>>
>> Just to clarify, you're not asking for SVSM to implement the TIS-MMIO
>> interface instead, but rather to use the fTPM stack, which could make
>> SVSM calls a TEE device operation?
>
>I don't really know what I'm asking because this is barely even a
>PoC, and I state it like this knowingly.
>
>You should make the argument, and the case for the solution. Then
>it is my turn to comment on that scheme.

I'll check if I can use fTPM, in the meantime I had started to simplify
this series, avoiding the double stack and exposing some APIs from SEV
to probe the vTPM and to send the commands. The final driver in
drivers/char/tpm would be quite simple.

But I'll try to see if reusing fTPM is a feasible way, I like the idea.

>
>That said, I would not give high odds for acceptance of a duplicate
>TPM stack succeeding.

Got it ;-)

Thanks to everyone for the helpful feedbacks!

I've been a bit messy these days and I'm in FOSDEM next week, so I hope
not to take too long for the v2.

Stefano

