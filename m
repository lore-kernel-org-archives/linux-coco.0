Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527984;
	b=PIcmCXcN1AJyVjb/iMhnhED2bqtWcEegO9XCrwH+gV59lQb1vG8f4czhOl9b66uxhxXa
	 J6z/D6qtL+hM55q87/eQnBdad/yzdZRqJyXXiYpgmA6LSOp2ZZpLaAyGE43MGcckLWoA/
	 FB+I4DsU32VoqZiAHYclun9rlwpIgWykJq9H25GmQCs8K/3pCioz/gPtiW2sVPV/p6vf0
	 8k5Ien6n3feAbnjjsavJs0BZ+Adrcjrt8R8rUBhcLkFuVyz4Nh4KOnuP2sedoXeh7lCxh
	 is+I3tPwbY2zaVjZiYOg3tzN3ftSF/GhTm4xea9VfOUftJgRHmFrZdHLdRur/aCaxNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zc7zKgD/SDYnIbkY4MVpBd0Jo9DiJTva6Dv7og4GVfM=;
	b=1IQ6uyZsxoCfmX06Mfvifm9zyjrjnUtv/Ezx/qAR/Fq3GjUm8eK8/Lv1jRoaHl2r/jd+
	 jggRzJJgb62yYjRypkB2lqDVEbegaM4xxv13zqFLDbPGVO8jPvbG/44k7y1Z1QwOhRZTC
	 Avjd8/FV1NIFoBfuDBY4R3wXkOqkeJ88TCWZoYzGNcMOSJeNgJdZG5Pxf023UT4pWE46s
	 gzhH+gQLMODAmZJUqglRXSxUULqI+VaKXY5XDL/bqjhrkFvRTiksApwmQrCZLU500qEta
	 tHci6cEqK0SE92GpBmeQ9kN1np5kiQV6IXP4MY2h4pyw2yq52inMDUXiQffVggQjPuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EqnpeJwx;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E159B606A334
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 13:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E159B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EqnpeJwx
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53664b4860bso52277641cf.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 05:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795527983; x=1796132783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zc7zKgD/SDYnIbkY4MVpBd0Jo9DiJTva6Dv7og4GVfM=;
        b=EqnpeJwx4IAAp9mfsj00WoR29F/1+r5796MPouaebQUygK4aVUnRa6eVS7qXcaT4ks
         Cy1SozoWyb/dvImEqPhS5piGTnA+NT7OFO3eWko2Zh3shjWND6NUhDZZUGTo4his9VU8
         qU/Hj+sBdzclTaKlXDb/qa1g/+8nQCAFYVADWucUf30k7kyCTDmxc9cAiv3P9rg615By
         dIEnYe6/1/C2VpeNnzi0ixjLPEc3Tyfb17hPezkZxync20ieZ/j49+DFoLdPHOqp2D7J
         ORJcbgEnXNTXIZifTIp3/jwUYHap6o0pF353gcrfEyNfbXCqGnTLL65RNrBC4/EEmmoW
         pXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527983; x=1796132783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zc7zKgD/SDYnIbkY4MVpBd0Jo9DiJTva6Dv7og4GVfM=;
        b=P2Yvvb4r9VMkwtASjglSqYqjJywvaLcj0bglRI7wl6VmN8/gHdmcZ0x4S/in/hyrl/
         hmmBvtLwOgoxOc0mAkimyf2Sz3nfKqH00Uynn1S20Noix6cUSC19rA5sHTvOr8dw1Rdq
         kJcuNNTOugbgsLI5b8LFtRaAhhj+KgR1Xge9eH/EY4gY1rFtzC0wnj49uhy4qZFrq9Za
         9zizP5AJLYHmONcrB2w0naQiyOiapB+KhZ/tbvPN8HBQrTJl9I4Tqi9rRqC5Ieu/G5ox
         zPPpwpAQ01NzDTijHOY1y9IRY62OrS7/jrTfISiLRF5dNzY0ovDijuD6n5AxZ0nS22fp
         htqw==
X-Forwarded-Encrypted: i=1; AL+hErGOLe4zKZbyWGDQ0+eX5bF58CmNAfkqmreMnYZxs9dWpYl349vEbAX8sbiOCm/ySmmmSC9JN1BCn6kR@lists.linux.dev
X-Gm-Message-State: APuU4Z+unsN6byHj6iC7+qAu769IdwUH4MGQzaSg3m347dCQCULivOpa
	NA7/4BzhjgXkNTAksHJb1yN+qNFMU+qiVf5sVlDXuLjyZ0+H0aPEeuzHJnN1JaV8kkg=
X-Gm-Gg: AZFdTZdou8PPmDTqWrLseHSOtabs8CmdWRc2zc/7H/94ylmYYa/1rvs5iUj6LIEoZfS
	DUdxjR8NWlSyWrOrP/yyhDc8FCbp3KJSRNtXC4fldGkw6KizijI7qRAsRVMNTakrSlFxBTEDu3d
	i7UNgnF8z69um5o8Jxb2uCEVug9z9SHKV1fME+EzKgpqppLF75KPCerxFfjrDog5RaEw996mjaj
	tpGG/OIHuGbzNwIyp8Gx/CCvVOBFONZWQ0DOSyw4Rrqy80UXUtCiN/vLQF1WhHAbKXbNAwltukO
	kJlqV0rR1Hi/S9LVgsePqPC/KPynwh3Vou5u9vjWwWLYkHfbAjjeptDCSQaxVCmwSk6bKPR3Jb+
	xoQVqbHZQco1FvKIcE0cBJc+T1cigU8j1+BYTNcTpsPlmx2Q1RlApSJIO12JelcbB8O9/aXuXRB
	wwBqWn/Hs6EYwcPApCC7dlmUaQTnTln+Ec4nW4c7km8xyWCegPmgsWJLSma9MP3oaHX+cDpOO6c
	BR3b238lD7QMjgKwXYWK4vp9tYNd9T/wUeAd4KUGaCHG4+PAIjMYNas8piUwxgZeeWZ7E16CUGO
	39/iBA==
X-Received: by 2002:a05:622a:120c:b0:535:a5f9:752e with SMTP id d75a77b69052e-55d76aed568mr264410241cf.77.1795527982900;
        Tue, 24 Nov 2026 05:46:22 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78451407sm128368371cf.2.2026.11.24.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:46:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqqj-00000000QIG-3EJB;
	Tue, 24 Nov 2026 09:46:21 -0400
Date: Tue, 24 Nov 2026 09:46:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Christian K?nig <christian.koenig@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Mark Rutland <mark.rutland@arm.com>, Radu Rendec <radu@rendec.net>,
	"T.J. Mercier" <tjmercier@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v10 04/13] irqchip/gic-v3-its: Allocate shared tables
 using CoCo shared memory allocator
Message-ID: <20261124134621.GI9566@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-5-aneesh.kumar@kernel.org>
 <awQd81MwZqi55gf8@arm.com>
 <yq5aa4mybbmv.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aa4mybbmv.fsf@kernel.org>

On Tue, Nov 24, 2026 at 07:00:00PM +0530, Aneesh Kumar K.V wrote:

> Taking Jason's feedback into account, we could have the allocator
> request compound pages and recover the actual allocation order with
> compound_order(). That would avoid passing an order to free:
> 
> void *alloc_cc_shared_node(int nid, gfp_t gfp, unsigned int order);
> void *alloc_cc_shared(gfp_t gfp, unsigned int order);
> void free_cc_shared(void *addr);

It probably shouldn't be order here, that is hard to use. Just size_t
len

And round up internally

If we ever want to do some kind of slab sharing scheme then the API is
already set up for it.

> As you noted, dma-buf would need virt_to_page() to obtain the pages for
> its scatterlist.

I think that is fine, other places working with kalloc/vmap already do
that.

Jason
