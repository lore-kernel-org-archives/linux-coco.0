Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283391;
	b=en2SKkipaTPIFRquA1fa5uxqb/hvmWqNobg1j95S32I+/t+Gdmqvlax8hDtP7JZyRwQi
	 hNfDdoJVZmQtekdnYX09LT8C1j078P/2amNAGte60E0F/5RcnXqM0IZkXYtmAZiX3iIeR
	 4CuhplmupdII6T5KY78K54H5bsp+zhtS/OYRR7mC+hYG+YflFePSiFxZe42vkidrs0QKK
	 cA7W3irtZtXv5ce+Q0ErSqB0L5beuM5xheo+q1i6MZ1ax/3LqHgf31MMU9pifx3+yv8DQ
	 D6pSN0GH2OQ71s1ZE92LfdktEHKdL69xnxE2/I/5KqU9r62ci+h9VXYOkbYYJGP9rCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
	b=UFGrD6ML6rXuQQCqKZT+E8zd2YvYz+p8V6S8ybto85X8gaeprYCy3lW3nfhYIg1xFNB/
	 o/qFzXX/ZR8HP1A5nJNha62AAxyb6EQnP32RORvZHUMMGqFIJS75z88+pbjYzn5uyP/jP
	 Ule01VbOCpPfiupA4kBIvO5FhykvALV6Ygr+gDtUrpH6XCgemMzdMvbGjrNweabZpoua3
	 EiDlnfvnHKqt0LdHN31kZLGibDUoPb8lAobJF0bdihpIg2KmQpPxZlAkjI+Qr0seM+NQe
	 7txDPBRItZ6FQIGh7WezLAtJdXbdDFPqBbyApx1ZA/AgZmuWeolpVftFXrAmexTJQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lCwIvBDg;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F7606A31D
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 14:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 476F7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lCwIvBDg
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533797e72e8so13691801cf.2
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 07:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793283390; x=1793888190; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
        b=lCwIvBDgFvY+9XL/yhtBHsRfeTvxPLT5In+Ig2hAbxhOQXBT9W66bw03OQdnEKWxGA
         VI0JIoGDZvi0xznzc2SUzNnDpzhVRkywGkZ2vubKdsqd4lSUMxQgXjwfCPc5QQwx6QjA
         FMC5jl1RWoqvW7HhPuSFqlKfc9DX9jGr0YdyyhThIIJUUjX5WrwzR7afmRrv1eCyq2Fq
         SOPInWXiCn6chdp8f/xdymf1DH+Z01aPIkiv5D4yWCzER5MzlNrdYYOB5MTw5MNGcEqO
         kqLAGYgXacukCILg3vkIGHvLI3YQ/MNm2RIMFYsVlgONLeCReUxadBwMLfukeuWe+82G
         TKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283390; x=1793888190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v0w3vTM41MmYY5jFFnm91zARv8a41r8bbrucc1w3RPo=;
        b=NPjHhftq/NOY3w15IoTlBTMUEgojppdScgaMUfrfKt+Kwb5tRBwAPykdBXiygiLYT6
         0F2jy1Z1q7FqhquA8pijYPmF79ThYz7uiSmOIFsUIcNSB+fJBsjIJoOvuzttW0KzGHk3
         p395bjITBmOlmr8YQtETyCGSR0vkKgPWZUrwL7z0aXssUMZCSBc6SyFzaQkhjlwQ/ZOc
         3dBRooVYsE77IZ84K5MDf3q8X6RFAx9Zmwm5Lfk/V6D9CUUx27nT/hvxLRp9q9kyNCW6
         Xr2X75B7nctUypoUuSNICB9D+4Gvb0HaFp8S5Uuwb772fmU4JX92n6neiqi4RKv7ujBg
         /DMA==
X-Forwarded-Encrypted: i=1; AKwUvByvOPimD6Jgi9NJ8oV8aGybWk3L1ZyDNFp4YH7GozMwIXhPaLY/gNaS1uc8PU8whsgBJeER5b+fKr/7@lists.linux.dev
X-Gm-Message-State: AFq9FYJ5Z/SbiInyZBidPcYy0HZJcBqTOettWiLqx3/BotvPcpcOQ+xu
	tsmkqLO+z0zQYcvfdx1QRLat32t89aHUYhwlc3iQuhoBZ9fbHcGuzDQfdYRoxjDqOSI=
X-Gm-Gg: AYBFou2685BNXrW9A9lwflw3In3ShGekfk26nJSv75VnNz/DrYJd6q4W3ATe3ZSvvk/
	a7Be+jVgrRatXRsTvZ5Moli+ccj57J1KBZp2SZH3EyGCn5K01Nrx80yhCiMT49mVuvZhREW1Cvm
	MrDfPVpykHD8tBhLPSaXj7PA/H0fCBsQn8DV5fqWdmGOgL+bmjDGcapCjJ3pAufFRWmHBMh4JId
	1Vd5NfgR4gStDFxSSEQqZxfiBQv5T5OHyiq0AQDFpOXo5r88lO8j8eqc0VM+tSc4/lg+QpliKDh
	fTkRDQg8vBK5tiCDWs7AU6Qrmg2EERHQ3v67tsxa7gmMyFjSsPNO4urtMf+bdOFH5LBPOnHA/ec
	P68LQxctBgsdEibxTxiNd7lMYrWI/lEAq4YNIcT10TrYTOhEXng5yBJ9jKaIkxWb6qfIT5UCWZA
	TPTIQk+s51Lw59GeW2iRmV6PDpdPx7Z5yKLIWEuhPi6Gu/c83QztOMibIUtIhnkZny+iin9wyP1
	bjfqwhcMIPq27YhZsoXum/vmpkuCqz/SbPNJCWbzneEOX/Rc6KDgtnX38b4AreNHMSOKt6ftOTy
	Z0xnIxyR1tctn4dhuA6SPRSTgjn+6xzsSY4zQCQnlY+ZsloFRbONvV5ljwFGD3JuK5LIJHhLkGN
	SV8/yTP3lyiY=
X-Received: by 2002:a05:622a:5c14:b0:533:21c6:f4e2 with SMTP id d75a77b69052e-53fcb20dda0mr85167991cf.20.1793283389957;
        Thu, 29 Oct 2026 07:16:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c7f6ef1b7sm45505406d6.7.2026.10.29.07.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:16:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMQvb-0000000FihF-2QML;
	Thu, 29 Oct 2026 11:16:27 -0300
Date: Thu, 29 Oct 2026 11:16:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261029141627.GP1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <2a2a5d93-1c10-4533-8709-437ceb6a3f94@suse.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a2a5d93-1c10-4533-8709-437ceb6a3f94@suse.com>

On Thu, Oct 29, 2026 at 09:37:20AM +0200, Nikolay Borisov wrote:
> 
> 
> On 15.10.26 г. 17:50 ч., Jiri Pirko wrote:
> > From: Jiri Pirko <jiri@nvidia.com>
> > 
> > Linux has several attestation interfaces tied to individual technologies.
> > That makes evidence retrieval, measurement registers, device state and
> > kernel consumers provider-specific.
> > 
> > This series introduces a common attestation subsystem. Its goal is to
> > support platform, TEE and device providers through one model, including
> > TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed devices.
> > This first series implements the common subsystem and a TDX provider.
> > Existing native TDX tsm_mr and tsm_report interfaces remain independent.
> 
> Wasn't config-tsm supposed to be this common attestation subsystem? Was this
> discussed when the initial config-tsm was proposed? Why is this coming now?

Maybe but it was far too narrowly scoped to do that. config-tsm
doesn't even include MRs, they were awkwardly pushed off into another
different spot. It just doesn't seem to meet the need, and it can't
sanely fit SPDM.

> > Attestation devices use CTLV, a schema-driven character-device TLV UAPI.
> > Compared with sysfs or configfs, CTLV executes one validated request
> > atomically instead of assembling a transaction through several files.
> > Compared with netlink, an opened device fd directly identifies authority
> > and lifetime, can be delegated normally, and owns its event queue. CTLV
> > also provides:
> 
> Assuming we want to go through the route of CTLV, do we really want an
> attestation-specific  interface, or most of this functionality can
> simply be

CTLV is not attestation specific..

> implemented as a specific genetlink protocol, utilising all the existing
> hardening that has gone into netlink's infrastructure to marshal messages
> from userspace to kernel space?

Been there, seems like a hard no:

https://lore.kernel.org/all/20260721182046.16219426@kernel.org/

And then later this:

https://lore.kernel.org/all/20260921131911.532d81f4@kernel.org/

Plus netlink being based around sockets and net namespaces is a very
poor fit for something that has nothing to do with net namespaces and
really wants a DAC security model.

> >   83 files changed, 18084 insertions(+), 28 deletions(-)
> 
> That's an awful lot of code to just move certain binary blobs around
> (Judging by what config-tsm is doing ATM).

Yeah, netlink is alot of code.

ctlv is trying to solve a bigger more general problem than just
config-tsm.

Attestation is simply the first user as it has some complicated data
structure that suits it well.

Jason
