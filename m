Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949A51D0F50
	for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932442; cv=none; b=b7Iri5PKv/KWTNiybc1s9hd0Io/nxTG9vtJ7Ay0UQbneJRlkyE4Y7ntnKNJ8fP4/leHEvXYhvn6qqIGThzGymAdzdGyDmxSD/AsN1TozNJwILUsYm8BN3QKnZ/O7jfAXhrWVHhQ/wz71ofCd/7ao9JqbkBfKp6DkongSNQfvqYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932442; c=relaxed/simple;
	bh=acS43lYKRsASxAvzHa41X02Mk0KgLiEkzt4AOcfTWK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBjvU3iNfuPsHTJ8gsWzx03Mo4KGfJc1UIjJhbUkCy2C3ZEz6tmLfp9oIuuQGUehhyoHXV+xVNXlLNK8YkmgYE7GIhrsdZc4QW0RZHIzbwqMkRCJ7DmV5bFYGGzKJjCnpLABVnprHEmW56PFCt87Sn/or8pA2F7ZX+u/in6UJz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=cqTBqL+5; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="cqTBqL+5"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8ece4937fso41534746d6.2
        for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 07:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1733932439; x=1734537239; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=acS43lYKRsASxAvzHa41X02Mk0KgLiEkzt4AOcfTWK8=;
        b=cqTBqL+50T/67v8hVwADPuMN76YHpQU7NRxPeMQy6dIigmzGHo/AQIGvG8LyncUvdH
         J+ZTAPZFZ0h7Etp2rhZhIXIqClRHWnIjTFVTt+3TQWDnHBHS5C+IMVRr1yWo4UMGD85B
         fegNGuYvp6vU/GjtPpD7vOjngD8p2PW01CfiaNMADElx7Rxf60Qoi5+he8KwZiBSLcnU
         poeY5w//U/SZKQaGgAjPisXd2cdVutMJm3Oay63UL9VTrWpSXjyVdUagnkVTX7+Iiyyn
         gKVIbxX9lqFmm1UyDSlClioxNPG9WFAUSisLNwARu0j+i45gJ3t2sRxLCY3n4FkvNW7j
         bDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932439; x=1734537239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acS43lYKRsASxAvzHa41X02Mk0KgLiEkzt4AOcfTWK8=;
        b=lbr7dIWzYrZXJGSOe7Eb9khB0W5RLQWr514wKEf2ezlhSWXIrsrgGrA4IZzKaBiNex
         eBusBNYJPZr30ezNdKEE2bfMNn54NaPilaUk3Aj7o14FmvJW7stvpSJEgNtAnBZC3bZo
         bAimOm9IzrelGW5R/2RI7+i7Z+2UVGP3PefIi7zk5rM0wKuqFKTdlSzKKCncItFf9mIu
         zuiCaAJiIW0GEpWFb5gyY7JizzwpjNfCKIoBVfsxDY80vGSGyomqgVfeqXfA6GLAQ5NJ
         kCwKONgneTyOIZJkKDCWYYlA96Fewu658M3vcpQYFIzZY7JnbACJZGu+XaLDXgr9tGxh
         jTSA==
X-Forwarded-Encrypted: i=1; AJvYcCU9EfXsE228DCXTMf5AuPulThL+V7jGIAm+htuzo+u3ephS5I+gJefPGoerBebVjx61/wfkdnPV20kB@lists.linux.dev
X-Gm-Message-State: AOJu0YzE9wMcXGgPLJbLgF5W1bYkWBADqWj4/bsWNPfzS0S70712f3Aa
	81I7MiM/brOK7MVO7ASNkvnbFxcju1vzUbocueqlJmLZ7zuP8zuo1/DPI3urZCQ=
X-Gm-Gg: ASbGncseZjcn5Uv6UigDu4pgDNHHGjyWC4JHLK2NBFL9xNkPALncSddPCgo6Hf0LxSA
	VablZS5hAbzI2GTa5/+eGLnRc+0BACqbs8b2IEWQDWW+xYkZEiRKskUZ6Krb3s90y/HDz5f+2xF
	wqj4yTGaTU7gSm9RCcH+uO/3CWDZImvvJbn2g5z/oJcsKeWJ4KshU8XTvQM2EmOydV7SwDvzV0+
	vZ15tYZW3j+Bb6nscOtpZRDPCldU5BGCDUvfTS3r+35uPmwTN5m0Y6xMfk4zJzyeVDw2/5No0c/
	MFi8xaVMO4I8+TsIwn7+cF5NO5I=
X-Google-Smtp-Source: AGHT+IFyKgaWbAWL5zmxllWMao0jgd1A6vhhNs0OHpVvZrEMlEGUevgAeQu56QZRIPr4+iKvNmtGtA==
X-Received: by 2002:a05:6214:c4e:b0:6d8:a730:110d with SMTP id 6a1803df08f44-6d9347d32f1mr53465126d6.0.1733932439591;
        Wed, 11 Dec 2024 07:53:59 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fe7f5sm71209356d6.80.2024.12.11.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:53:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tLP2E-0000000ADon-1lQR;
	Wed, 11 Dec 2024 11:53:58 -0400
Date: Wed, 11 Dec 2024 11:53:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-integrity@vger.kernel.org, x86@kernel.org,
	Joerg Roedel <jroedel@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
Message-ID: <20241211155358.GK1888283@ziepe.ca>
References: <20241210143423.101774-1-sgarzare@redhat.com>
 <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca>
 <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca>
 <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca>
 <CAGxU2F5NSqMbA1Lep3+16GoZXR23q0OP8dFVVRJ6DG5sF20R3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5NSqMbA1Lep3+16GoZXR23q0OP8dFVVRJ6DG5sF20R3Q@mail.gmail.com>

On Wed, Dec 11, 2024 at 04:38:29PM +0100, Stefano Garzarella wrote:

> Except for the call to pops->sendrcv(buffer) the rest depends on how
> the TCG TPM reference implementation [1] expects the request/response
> to be formatted (we refer to this protocol with MSSIM).

Make a small inline helper to do the reformatting? Much better than a
layered driver.

> That is why I was saying to create a header with helpers that create
> the request/parse the response as TCG TPM expects.

Yes helpers sound better

Jason
