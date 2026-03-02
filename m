Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA148175A79
	for <linux-coco@lists.linux.dev>; Mon,  2 Mar 2026 00:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772411739; cv=none; b=DiX6W8C5NgrIfDb3K5GSztgPi45Wena1i8lv38lWd/SndC01m8kBRSlxsoU8++NYJk65KoBwSW07ZdPYbrMrcMWxOkzy+vxvvADFtRI2orQ5nhBFd6BmbFAlRaSiJd26DLBDqWWsflbjHCOvr8zrVXNuHVKK+c5RymUitLr9RtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772411739; c=relaxed/simple;
	bh=/8Q5HAtX/+HdAMu3qfOsE6Byu7Fj2sbAW7cC8DqRGz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkpoUnPSnHMAmP9IaSFxM4CgxR1EaQenb6yh3rE9FH2LmL7spU/+ZyW2CJu/Y4l/whoNb9UTp6vQhplmoQXH3je/Je1o9v+gjPx5OFzb2RSztTXDligUjlCKPS/AfUlahf3zOQ/J2TPzuszPvK2Bl44x+S75sMOksJ9/ZUjpCf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=bOMOinXG; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="bOMOinXG"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50336cffef9so35272021cf.0
        for <linux-coco@lists.linux.dev>; Sun, 01 Mar 2026 16:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772411737; x=1773016537; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x93JARsR/b1GWJu5c67Wr5QInQyireDDX7UuillpK/I=;
        b=bOMOinXGXHp/5dEANQWDkfwVLiQJEtzQttr/J7bXBbNPyx86NvCaw+Xrik0extC3mT
         xBEztlWerwQ6qnbrKESSJgzN4yfJ25Q9mgIXx9Yt4Qz4DSQC1/sHSXuhLIPDTaNE+fHU
         aiDViy9FFLqfauBVUeqNvWbjVMsX4cUKNvf/EJ332Rw2q6Hmd/MyXMVgu4drHXIwQTdV
         HM3oKY1ujcZFFDT2xYh3zNh0XIHtAeaaiI8N6wi2RMqIRTpDwpF+h+Kikij4JKfyDSk9
         3oivwOHxJX+vJPhHkMdXVjaYnM0hWUYRrmm1oLAcorkwjVsMHfcHPgl65/th78Bdo1Sn
         TXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772411737; x=1773016537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x93JARsR/b1GWJu5c67Wr5QInQyireDDX7UuillpK/I=;
        b=WIZljIZ9REhb73KfJeZWDtEYLasAO7HdA4OuRMz5kRCw2bFkbfuRJp/g0eT9NZW0xV
         bz3i7nnzYKN/VykuyLnolVx3MjaMU4CAYD8mqdakhZsoJOC2rNp7nL32q/7ULJJqYi5b
         1NPZLedtugF7YMFpS45WeA/2JWrcw6t9nAKCAKGuZyRPMWHYUIHcnU/VLrDaepUaN2ed
         YmgbeBI1VL+wUoPBWeJKqkr3L0JibOcbRg/wV/Z/HOMxPSHe+sUsLu0g+pEfJsrah4po
         sDcaL2JRokBd6EI7KexeoAU9PFh5hWY+T/FxRdggKAvibAqj/bfcALKeYWFPeMDlsQmt
         GhLA==
X-Forwarded-Encrypted: i=1; AJvYcCW5he36Wi14A5Nk5pu+NY5r7FDJqi0qM7A3jzEe4q6dhKyw9lp+sqM5iJuzG95JFEN3XeFwSe5EDcLR@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3ZQyhRw436R3qnz0DQtPXS4+Kc0WdGHAZg2Qdi7zbRBMZiABb
	4Q2Nknf2ychTpZwbV0+6mcHIRBWMNb5A12DD8nbV8Yh+Jte1eeeNUU3YELhFyKeKUHg=
X-Gm-Gg: ATEYQzz/kHYS12OPCSjiOtsqyPlcF1KP3HUifTjr6RIbPx+t6rMdqrBGtfawuizeNnJ
	9XihUr/jcoc3D61+kMSxUiTLsbv5QD2bwszcwc7jhQWGz5FOT77ZtW9GleT1dKUkIsgc8EETE2u
	a7tdSIKsmK9KYfqZ7jil4kNshPIJKFh3t3DUii2rg4QcNcYaOBtn7QeJ2SgvC9ASp/JCUs+U7kP
	NhfNuWjcZ3UVsb8f2VMvbQlqKlj2R8hWSDcbgv76ZjVHmC+fbSU1U55yywHm/CrrB2FzNPC4x8k
	pvWqRpIXvyfCCoktRlwYjUslxYlL1gCKAdLANZJd9xoocb6npPfVA/EOj9maAF1SY/xEsSNLRuY
	dtKHcoYqXTo0Vt50xrMYJL3ogJWPaHhNOqJS/IWFV6r/GLClCBaQzlyylblOeUG/KV7mGfbXQmL
	BcU3nV5F/mekn4eZI8v9/fO7xCK3bZnDozHk5iJ58AG235Lw1GXbYs4Jd05VWPiXJ0mlwoGP8wd
	StJyjQg
X-Received: by 2002:a05:622a:1806:b0:501:47c4:a4a3 with SMTP id d75a77b69052e-507528842d9mr140037701cf.10.1772411736639;
        Sun, 01 Mar 2026 16:35:36 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm109231221cf.0.2026.03.01.16.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:35:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vwrG3-00000003Z8Q-0shL;
	Sun, 01 Mar 2026 20:35:35 -0400
Date: Sun, 1 Mar 2026 20:35:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-pci@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Melody Wang <huibo.wang@amd.com>,
	Seongman Lee <augustus92@kaist.ac.kr>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Denis Efremov <efremov@linux.com>,
	Geliang Tang <geliang@kernel.org>,
	Piotr Gregor <piotrgregor@rsyncme.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex@shazbot.org>, Arnd Bergmann <arnd@arndb.de>,
	Jesse Barnes <jbarnes@virtuousgeek.org>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Kim Phillips <kim.phillips@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claire Chang <tientzu@chromium.org>, linux-coco@lists.linux.dev,
	iommu@lists.linux.dev, Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH kernel 6/9] x86/dma-direct: Stop changing encrypted page
 state for TDISP devices
Message-ID: <20260302003535.GU44359@ziepe.ca>
References: <20260225053806.3311234-1-aik@amd.com>
 <20260225053806.3311234-7-aik@amd.com>
 <d8102507-e537-4e7c-8137-082a43fd270d@arm.com>
 <20260228000630.GN44359@ziepe.ca>
 <2a5b2d8c-7359-42bd-9e8e-2c3efacee747@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a5b2d8c-7359-42bd-9e8e-2c3efacee747@amd.com>

On Mon, Mar 02, 2026 at 11:01:24AM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 28/2/26 11:06, Jason Gunthorpe wrote:
> > On Wed, Feb 25, 2026 at 05:08:37PM +0000, Robin Murphy wrote:
> > 
> > > I guess this comes back to the point I just raised on the previous patch -
> > > the current assumption is that devices cannot access private memory at all,
> > > and thus phys_to_dma() is implicitly only dealing with the mechanics of how
> > > the given device accesses shared memory. Once that no longer holds, I don't
> > > see how we can find the right answer without also consulting the relevant
> > > state of paddr itself, and that really *should* be able to be commonly
> > > abstracted across CoCo environments.
> > 
> > Definately, I think building on this is a good place to start
> > 
> > https://lore.kernel.org/all/20260223095136.225277-2-jiri@resnulli.us/
> 
> cool, thanks for the pointer.
> 
> > Probably this series needs to take DMA_ATTR_CC_DECRYPTED and push it
> > down into the phys_to_dma() and make the swiotlb shared allocation
> > code force set it.
> > 
> > But what value is stored in the phys_addr_t for shared pages on the
> > three arches? Does ARM and Intel set the high GPA/IPA bit in the
> > phys_addr or do they set it through the pgprot? What does AMD do?
> > ie can we test a bit in the phys_addr_t to reliably determine if it is
> > shared or private?
> 
> Without secure vIOMMU, no Cbit in the S2 table (==host) for any
> VM. SDTE (==IOMMU) decides on shared/private for the device,
> i.e. (device_cc_accepted()?private:shared).

Is this "Cbit" part of the CPU S2 page table address space or is it
actually some PTE bit that says it is "encrypted" ?

It is confusing when you say it would start working with a vIOMMU.

If 1<<51 is a valid IOPTE, and it is an actually address, then it
should be mapped into the IOMMU S2, shouldn't it? If it is in the
IOMMU S2 then shouldn't it work as a dma_addr_t?

If the HW is treating 1<<51 special in some way and not reflecting it
into a S2 lookup then it isn't an address bit but an IOPTE flag.
IMHO is really dangerous to intermix PTE flags into phys_addr_t, I
hope that is not what is happening.

> > Does AMD have the shared/private GPA split like ARM and Intel do? Ie
> > shared is always at a high GPA? What is the SME mask?
> 
> sorry but I do not follow this entirely.
> 
> In general, GPA != DMA handle. Cbit (bit51) is not an address bit in a GPA but it is a DMA handle so I mask it there.
> 
> With one exception - 1) host 2) mem_encrypt=on 3) iommu=pt, but we default to IOMMU in the case of host+mem_encrypt=on and don't have Cbit in host's DMA handles.
> 
> For CoCoVM, I could map everything again at the 1<<51 offset in the same S2 table to leak Cbit to the bus (useless though).

Double map is what ARM does at least. I don't know it is a good
choice, but it means that phys_addr_t can have a shared/private bit
(eg your Cbit at 51) and both the CPU and IOMMU S2 have legitimate
mappings. ie it is a *true* address bit.

Given AMD has only a single IOMMO for T=0 and 1 it would make sense to
me if AMD always remove the C bit and there is always a uniform IOVA
mapping from 0 -> vTOM.

But in this case I would expect the vIOMMU to also use the same GPA
space starting from 0 and also remove the C bit, as the S2 shouldn't
have mappings starting at 1<<51.

> There is vTOM in SDTE which is "every phys_addr_t above vTOM is no
> Cbit, below - with Cbit" (and there is the same thing for the CPU
> side in SEV) but this not it, right?

That seems like the IOMMU HW is specially handling the address bits in
some way? At least ARM doesn't have anything like that, address bits
are address bits, they don't get overloaded with secondary mechanisms.

> AMD's SME mask for shared is 0, for private - 1<<51.

ARM is the inverse of this (private is at 0), but the same idea.

Jason
