Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB69548EE
	for <linux-coco@lists.linux.dev>; Sat, 28 Feb 2026 00:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237194; cv=none; b=ikxq67eJMes04RReARb4FH11/yoA4rbme5Txg75j/e9Trsal49+3OAa3ZPG+ZiVWsvgRsOI60X3iJfqII+d0xCubacflYEwp0aAyROK0pt42u95ed+E6oikHqX0Qcb/8oh1vdWl38XxL3JhhvoXsEwhOUCBkz/Omh+BanY6H1fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237194; c=relaxed/simple;
	bh=D9pygYo/MNi4R02Zm4iGOoF0L2rPsDKjb9gvCd6vgKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLxxDQX/0EBoxf3LuRpWyGNbIgS8isTmHfRNnj1C0xFlNOrl8W4U13Hq83CptTa+ho85jESBAM5p1wuduwzPxQVmk+ENFEGzX51c1pZ//4XOHPgqFUuNPI+pVe8pd3941/67YVyVPMCd3rykrZsifKfNpNykHfUvHdHEW38YGII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=juAMHeZh; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="juAMHeZh"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb3dfb3461so253028885a.3
        for <linux-coco@lists.linux.dev>; Fri, 27 Feb 2026 16:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772237192; x=1772841992; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S0PqAr3dacsxbzSna3ChPqWEVOFqnIEsALZmA66GjLs=;
        b=juAMHeZhVrFgsl1sAkwTkIZepgLQSrYd8Vtvh2kyGwiYs5oc025H1C58Zu4FjRBCij
         i5uO7y6UTRwYx43AKt4hqSkUTRxcOy11yboG4AKYwy1UoRpcvaGALmc/rUZUu+bb4ZiR
         p6rJTbSfq6HQn4Ixytx1iNuDQ6GPQsej8bzzEhXS7kacN8ufAscD3YjpjYXyNYfAsRty
         GU/4ZurfzdED/aHjMvwaIHLSsKoEIlsh4UWKtA/oWsYK3UV/ZVgBJGpsgy7zvLxB49Ur
         BWYoBINlvvHw7o9MynoS+JeWQmMlbw/Yum/nYmEtzioMHMTRgCOpgwtGO71VagDdzphf
         A2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772237192; x=1772841992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0PqAr3dacsxbzSna3ChPqWEVOFqnIEsALZmA66GjLs=;
        b=Zz2OPsWwmqKxJa24ZmT55j5S1fBSvkWeRSO+ylmZw1nLVwLlL55QkdmuuntCMAT9vq
         9xhagdpgyiG45n8mdnD6hR9geV4lNSGoNoI6vG494REW5HJxzjG741cEf+UWILsfludB
         2ZEL9Suu7tEMvZSCKbL/TirSmqgdKw0QZxVJwRcbpSzzdwSkEabYM1CZiAsLlBgFC3BE
         CeMlrW9Tkei422ig6k3vOARi7sEgQM5boWoeQab+3I3bYa9QKqiJO+3PSgfOl4yJ4Uk2
         6jgrpWvFOr37RiRfv+o5emY1gsu0Juxwtom8PG+26VaEF97jHXOaubh6pj67HrwLEfGH
         Mkqg==
X-Forwarded-Encrypted: i=1; AJvYcCVTnWdchuhdZwGlDpwGrZn1hBvx7tjs+RZaCZT+OXzxfXHG5AOZa0ho0btWZnwaq3hEM884FqQLFFrN@lists.linux.dev
X-Gm-Message-State: AOJu0YwInZ1KzFLR4n+FxJx1XVOAh6BhUdrGG7AyG+COsYWIL4uJUIyV
	og7cwpkwLYdjT5AgHVWcgBStd9YXKMSc3X9hlGUDgo2+fHiwMORDmVgHLATK/OXfxr4=
X-Gm-Gg: ATEYQzwmusiUuIQL9jUjbNU8t5CL4DYw6V5gyYRtIePhOPrEqC5hfN2RwmeUA3nxYwA
	7WvGqPSJi3e4AirOx8FUw4c+DIwu7ZqDyvtYVeKn1E4KKLNHUpaShSeHGApdmsbdsLwSwRzafYZ
	mvfWPscC3IwfE8dNgJqs9lhB9h/BQycSOK49OibaWACpHEny4Jx0sv5VYh3h4QuwcSjluSAmd00
	DEBEgG/FQInwEpSvig4NFTxkEk36UQPWsi1Wjd0EiCa2AHjZYs+bd6I1ALCuejg1TzTuDi/wrS8
	W+n02gSG8GCqo/U6ivboVclwR0wRDY+Jzk8aQ4bLZQngp/RUBnrCCN2nD6Nlat9dAmd37Dijupo
	xvlozFoItXgrYP+eMcloBgcgWNIJzA/9dYD2jIk3K+0/XeLRyM2w5UMpI+pYgQx7Xibw9fjWcCz
	xkDiYS2efbynHNSW22bqlFC2uOdhoBNAnslIt8z0TyRhzhAR4oQ/gn+LFhjRid13EV9GNaXVotD
	KhjUfFa
X-Received: by 2002:a05:620a:1a92:b0:8c7:b0d:df23 with SMTP id af79cd13be357-8cbc8e39692mr613986085a.79.1772237191471;
        Fri, 27 Feb 2026 16:06:31 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf72d3casm601180485a.42.2026.02.27.16.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 16:06:30 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vw7qo-00000001WqD-1LkU;
	Fri, 27 Feb 2026 20:06:30 -0400
Date: Fri, 27 Feb 2026 20:06:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, x86@kernel.org,
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
Message-ID: <20260228000630.GN44359@ziepe.ca>
References: <20260225053806.3311234-1-aik@amd.com>
 <20260225053806.3311234-7-aik@amd.com>
 <d8102507-e537-4e7c-8137-082a43fd270d@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8102507-e537-4e7c-8137-082a43fd270d@arm.com>

On Wed, Feb 25, 2026 at 05:08:37PM +0000, Robin Murphy wrote:

> I guess this comes back to the point I just raised on the previous patch -
> the current assumption is that devices cannot access private memory at all,
> and thus phys_to_dma() is implicitly only dealing with the mechanics of how
> the given device accesses shared memory. Once that no longer holds, I don't
> see how we can find the right answer without also consulting the relevant
> state of paddr itself, and that really *should* be able to be commonly
> abstracted across CoCo environments. 

Definately, I think building on this is a good place to start

https://lore.kernel.org/all/20260223095136.225277-2-jiri@resnulli.us/

Probably this series needs to take DMA_ATTR_CC_DECRYPTED and push it
down into the phys_to_dma() and make the swiotlb shared allocation
code force set it.

But what value is stored in the phys_addr_t for shared pages on the
three arches? Does ARM and Intel set the high GPA/IPA bit in the
phys_addr or do they set it through the pgprot? What does AMD do?

ie can we test a bit in the phys_addr_t to reliably determine if it is
shared or private?

> > pci_device_add() enforces the FFFF_FFFF coherent DMA mask so
> > dma_alloc_coherent() fails when SME=on, this is how I ended up fixing
> > phys_to_dma() and not quite sure it is the right fix.

Does AMD have the shared/private GPA split like ARM and Intel do? Ie
shared is always at a high GPA? What is the SME mask?

Jason
