Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425A3D9050
	for <linux-coco@lists.linux.dev>; Mon,  9 Mar 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071419; cv=none; b=ZxuFN/yhniPKriH2tnCf9zXo82bxGsciyWdbPxMexWcMUmmHVN97IskNwxGWWl1WSUifuga7f1Q6ezuNhDVDWS1RHwHuMWUvNOqXxkC0fYyu1UBB0vlHXemBccMBZV7OAXXplW5Rz3Fno7MfWsaIgHcBf0paYjSl51wHIe+s9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071419; c=relaxed/simple;
	bh=vz7GtLHU5cL+Tn669J3wF1mbDCNVBgpwpocy1RdYQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEtuIkKc/rQWEem8fnfpAJCCA95uvp3IfjM8F6uHMq2vIxniX1WKkCybEZIPzzDId4vgFHWsaWluggsWX577IGjkZKIUd6AMOQUla1WVXW/kagqXMGY16ZfM9/lmYn32GJQcvEYDrrGg/G49M7HTnq97FKupmORy2RQtl+IOFTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Jz7uEquu; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Jz7uEquu"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5090c48de85so17993131cf.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773071417; x=1773676217; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O45tfflm9Orr1MA6lJ9Hem754qbRzwLB13TT5ehymNk=;
        b=Jz7uEquufZDXI8JlnBJkbDk/AvryU5yx0fAGxryQu+cuMtB6c4Uc8d2WCJWgZV4pf/
         J3yblg18u+ukDkBNfNGO6q8zx+XgryNSppAC2blGMH0G5vpsyvOsbGrp4El18K2BBUt1
         /ZLtBHZYRxKuHyIAnr/40sBPtwf7cFwD/ikiNt9LujDrViRdTU1gucUz0Wn27ubupud7
         BD4uWJcqYm3kgEOEam8dHpFo8uX7ycoZe2TE7XiejIBQ9V6neZSXcG8fy7JE+RO/UZBL
         baJPQHkcW0ZLyxZiSMnY2kbeh9rf06hD3dcMckP1n4P+vh3v1BjGfViK42fkNdvm50YG
         Y5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071417; x=1773676217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O45tfflm9Orr1MA6lJ9Hem754qbRzwLB13TT5ehymNk=;
        b=O9y/Hwd1DBRcFMb9JIsj1vc5TLjOQpKQpCcXudGCVWnz4DwsBRvh/FDmmRpBS6SAf+
         EzMQx1MWVsspjVbkHIQv5Y12gUXaklHvqFr2u9nB5oXWorbxgttXWOSitBz3tdKhKpNl
         vQ+b87+AmycFytVTaj2fxbq5VexeIfHYyP41eeanDzyI5hltukk/G9OEvp/5wcx3MJib
         Yv3+Ewis/usYzR73FEs+o8CI59y9w+uEs+mH9q+eCQTckApnxeVEcXYb1EylK/onVjZP
         pLWAQu4870aCTNKwK08sNrdc0tKg8PG9291utHFNEgcgdw9CMiPhkYqo8c4tO9DyVi5V
         fNHw==
X-Forwarded-Encrypted: i=1; AJvYcCVxm2UEoLP9gXfOI7ThexaFarQStxb+DOjE1gaK/OkgzLSEpwgibBdRY7rfXEXe175YMLzvoboTI2bV@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1L5DpzzIXF0NiKdTwUSXCusLMvZqOPAbtDTSUYVRzcw9O+j0N
	jN/N90vC9GcSEqRT1mlxRJxKg5eg3jKeWyWPQUxNHFoQ/KVpa6u4/HFGw35ZLwIn8fM=
X-Gm-Gg: ATEYQzyRVPC4IqjpiejAQ88VPOxmB4P3iwLTusPHZ9uGZQmLNOxaPbvwWoIvmKdvfun
	d/rTTWysSfShqFDDuGYOagRru06HwCsySg/jcsGffb4zP8T9ClPCnteS+taMJJvkg6WYA90KxPk
	a7B22Y7ivW7WYvLJFgjWr+McinDrKDML1+cGBHJuXZDIF53HBhsk/DrRdYIS8pVtLAyP3SpGC4O
	Gofc4o9skKD3hCplaT6cq8GQpYNW41AOkqVdBDMhupcpVRufJKf8YoGTMhHhN+c2aM0SuG6hQHd
	PKB15A/wBGEVCFQuQDVg/0vLnWXWjeBbzkcJb+i2G1qO8tF3MZC5fxLR1thRiWXwiNKvy23kS+9
	cuJSP9XRuvWBoo4i43TKSscvGdFaWAdzRvp8swkHv7fWJZtJQrA5CczeNM8nJ0qYbnYGHy116f4
	4QmjND8es8zM6xh7Veiulmd8fZqddkIXlia5GjsgdIqFKvAGNCu5GjNeUyR2hnpOTiv4dFkWxH7
	0zXwIN3
X-Received: by 2002:a05:622a:30a:b0:503:4251:6597 with SMTP id d75a77b69052e-508f46f8abdmr155244531cf.29.1773071416552;
        Mon, 09 Mar 2026 08:50:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a4ec29sm837376d6.19.2026.03.09.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:50:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzcs3-0000000GsMM-18A4;
	Mon, 09 Mar 2026 12:50:15 -0300
Date: Mon, 9 Mar 2026 12:50:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Gonda <pgonda@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 2/2] dma-buf: heaps: system: add
 system_cc_decrypted heap for explicitly decrypted memory
Message-ID: <20260309155015.GP1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-3-jiri@resnulli.us>
 <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>

On Mon, Mar 09, 2026 at 09:39:44AM -0600, Peter Gonda wrote:
> Great feature to have thanks Jiri! A couple naive questions.
> 
> On Thu, Mar 5, 2026 at 5:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
> >
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
> > allocate decrypted (shared) memory for confidential computing (CoCo)
> > VMs.
> >
> > On CoCo VMs, guest memory is encrypted by default. The hardware uses an
> > encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> > Intel TDX) to control whether a given memory access is encrypted or
> > decrypted. The kernel's direct map is set up with encryption enabled,
> > so pages returned by alloc_pages() are encrypted in the direct map
> > by default. To make this memory usable for devices that do not support
> > DMA to encrypted memory (no TDISP support), it has to be explicitly
> > decrypted. A couple of things are needed to properly handle
> > decrypted memory for the dma-buf use case:
> >
> > - set_memory_decrypted() on the direct map after allocation:
> >   Besides clearing the encryption bit in the direct map PTEs, this
> >   also notifies the hypervisor about the page state change. On free,
> >   the inverse set_memory_encrypted() must be called before returning
> >   pages to the allocator. If re-encryption fails, pages
> >   are intentionally leaked to prevent decrypted memory from being
> >   reused as private.
> >
> > - pgprot_decrypted() for userspace and kernel virtual mappings:
> >   Any new mapping of the decrypted pages, be it to userspace via
> >   mmap or to kernel vmalloc space via vmap, creates PTEs independent
> >   of the direct map. These must also have the encryption bit cleared,
> >   otherwise accesses through them would see encrypted (garbage) data.
> 
> So this only works on new mappings? What if there are existing
> mappings to the memory that will be converted to shared?

The set_memory_decrypted() is called during system_heap_allocate(), it
is not possible to change dynamically between encrypted/decrypted.

Once the heap is created every PTE is always created with the correct
pgprot.

Jason
