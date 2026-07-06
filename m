Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59A7437877
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342304; cv=none; b=k7kT5MwxUD7Mx1oV6kr0mzKZ9TdGexEMmsJBFfwm5L+nP9uX0FHdPn8aiEbY9A7y5ku3Xem64TNb4F0ftszP8rtkT8uM3peNJ1fdg3afFeAw/alteiB1GFLNrAqGLRgnuAac88faD2jywddttLu2m+3j+fgvQPSzqQcGbRxO0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342304; c=relaxed/simple;
	bh=5HxiaVFj4kKk0cIEKow6fV+sRV+xbZ0ZiNOAfE1z0kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6g05v1DlsjgBXvJMboVNkU5VVV6HOrPwMfcOqk4voUKhAQhTdU0INXYofluSNLhIBOxv369UM4pRcChpnwKCjbTnYhqUHxIlvPp8oXOL8t7CftaY0FhEiEcaKGUm2G4SGhh1ifvWeCiOTEJAgQK2FgJwPuCA3rStIsZ2sZc9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DlnXuXZa; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DlnXuXZa"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f29ec73064so16575376d6.1
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783342302; x=1783947102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U/Etd+6DfEYHgDTpR5rSNYT0+wAInQuGCrHtUqywQk8=;
        b=DlnXuXZad53oNo1wSDtfWlfZ+8xd7+lssQOhBhUJ37YZ60vyeYiOMudSE7Vi519v+m
         luOvHyr9bHz5KrdK34JdCN9XCH8935BXDsfZ5mE9fubiKgVuXX7ZdQE789gTACNteHyx
         FXyxoZTvQgGwks+PA5LDv7W2D3rP5sQmkShhzU3zpyWsZl3STa1NEdjPFmN5S2xGPHEE
         mmrVB83Wqoq9msZNa42FLTz/+le7AcWPEsj+RDYIIaKKeqHUuFbxcNOPacQyg8Hv9TNC
         uKLJptC4Nl4MOd+VZFKdwUQc6LriSiEKVino/hrTcnkctdfp+XjAcKoalX15IH6JjTNm
         l8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342302; x=1783947102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/Etd+6DfEYHgDTpR5rSNYT0+wAInQuGCrHtUqywQk8=;
        b=etYeN2g6aonN0U+DmwgmRGUM4ULYwKhMjz6c0pONYKswvpMNiG2UecVRrLWJOGIRnY
         l2D0ZnSrspSaKZNFW830Eu29vtUfiikg140/PN22VjkX4ZAjON7oQQv/0arxcc+d9Gza
         LjYuJ53A9NoJrV7dhHoDk4SbGCBLOuRpNOfyYUCaX6iEWSuioefGhrPgmmedw2gGtxvd
         W3aNkYr3toKgMx8AFnsZA6wKgZbLwKOscH/rHcp+NTzN7UuFaeg76ra/FpQ+Hwl7cUcQ
         G/FMH/cxaqJPquxPVm0pb+f0nu1xjoBiue0V3Tg172vAtyig7QgwXjCV4FcIr+p1gMQ7
         FXzQ==
X-Gm-Message-State: AOJu0YzrE3KlIL9JDQo+EypJMqYfBp+c+C8kyWcBukw348t57cV+B9kx
	5yBRAzZU7jJt84pW86Ke/GIuRb5FasSLjT58ETT81WegTzGZqdN8jT/qG5dwJE8fUto=
X-Gm-Gg: AfdE7cmDIf4m7YWQwV+KB0C6H9wzR/MDXuwtv6VRLMQJX7+s0MsHUVISqN4o6sEgaaz
	mrbE0K5SFQsWYGmUHw9VIb8f6JXwXJtOke4dr5vD3FeFNI4/qi/PZ00h+pohGkxM5cSNq/I+ex1
	SeJLnL61Zm6SIlIl+T/f1mt/c1veiZcWsj6jqkKwxzrApvSAkHzzamTHmpT0Tpj1QWezJznVAwa
	hPvUsQ6BLbT7qSio7MBHRAr16DSQ6We33ozO5/zETbh6HQe6ZTEMoaNixfsm8gJOH8oG/aXGxX4
	xEGPkcF6AWqTvX1lLSB4dRBAhegAfWiwSyr1gwUZwVWr4xBqnY17kSiIHiAuFVCvvww567b+lRN
	jFyaeCvahUBD0kBLKzK8KDL1XVgEg+ZJSnskifRzbzX5/lOoJbRQE8fZWxKYWMCFJUbwVGWw=
X-Received: by 2002:a05:6214:519e:b0:8ec:eff:2485 with SMTP id 6a1803df08f44-8fcb375aaaamr2079086d6.24.1783342301530;
        Mon, 06 Jul 2026 05:51:41 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471814408sm134865456d6.23.2026.07.06.05.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:51:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wginU-00000000SiE-1Sq3;
	Mon, 06 Jul 2026 09:51:40 -0300
Date: Mon, 6 Jul 2026 09:51:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	driver-core@lists.linux.dev, ankita@nvidia.com,
	Aaron Tomlin <atomlin@atomlin.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <20260706125140.GB107792@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705220819.2472765-1-djbw@kernel.org>

On Sun, Jul 05, 2026 at 03:08:04PM -0700, Dan Williams wrote:
> * NONE: no usage of the device unless the trust is explicitly overridden
>   by user policy specified via a driver flag, module flag, or uapi (TBD).
> 
> * ADVERSARY: needs acknowledgement from the bus and IOMMU / DMA layers
>   that the device is limited to strict IOMMU translation behavior. Drivers
>   can use this as a signal to limit functionality. This designation
>   implies follow-on IOMMU and bus enabling work for features like
>   arranging for the device to attach to a blocked IOMMU domain when
>   detached from a driver.
> 
> * AUTO: typical / historical Linux driver model.
> 
> * TCB: a trust level that only exists in Confidential Computing
>   environments. When acked by the IOMMU / DMA layer it enables the device
>   to issue direct-DMA to private/encrypted addresses or otherwise attach to
>   a secure vIOMMU within the TCB.

I'm not sure I entirely like this one, certainly it needs to be
possible to have both T=1 and ADVERSARY together.

Arguably the T=0/1 decision is much more like link encryption, it
effects the transport of the DMA into the CPU. That it also impacts
how the VIOMMU works is the only thing that make it sort of
trust-like in this model.

I'd also argue this list is missing "FULL" trust, which is the
historical Linux behavior for a normal device. AUTO should be
selecting between FULL/ADVERSARY based on things like the ACPI/etc as
it does today.

In a CC VM if we have a T=0 device we probably want to operate it with
ADVERSARY (there is no T=0 VIOMMU so this is equivilent to FULL)

For a T=1 device we need to have the choice of FULL or ADVERSARY. When
a VIOMMU is present ADVERSARY will further restrict the T=1 traffic as
a defense in depth.

So, it is really necessary to have "TCB" here?

If the trust level is reduced to just be a command to the kernel how
it should operate the device then it would be up to userspace to
confirm things like T=1 before setting the trust. The kernel would
have to set the trust to NONE when security sensitive changes are
detected.

If we still want a kernel-side policy gate, eg kernel will not
progress unless T=1 is met, then I think that would be better as an
independent pair'd policy field, ie
   trust=FULL when policy=T=1, LINK_ENCRYPTION=1, etc

As bundling the two into "TCB" is probably going to turn problematic
as we have more and more combinations of policy conditions.

Jason
