Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFB4377558
	for <linux-coco@lists.linux.dev>; Fri,  7 Aug 2026 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126821; cv=none; b=fJmKt8bgrceViIzUviq1F0IFEu3EoWOuThmusmbqu9yJgO0Xl1kzenYOpGgTktifGrghaKdMkaiZnQi8qL5CbHt1hstM7FeBQ/NwVj9UG+TOD2ZKZj1gzg9JZeDIp5TkUSyl5xQZaGsRuIbrIbLVVxQxz4n8rQtQ3Pg/z1L7bjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126821; c=relaxed/simple;
	bh=uQJoR9F+JTLHFeALKkUq+Q0MNEImv4dProP3GHVEWS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzKSZ2abahAHzZQPGuC1lLfKN5ExOW9edV7U4UMdaG9V0/Qc7qhufL2waWubfyfcK8LyHN/Zj+2rgXHIWMkyBvlA4C0KcnVEgCjAffXZ2kXou54RFaqs7xmYIaIFgTvctvnrE7BStPN/DNwP6zhgdgT3yERft9R9oeqEPaukDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lZRdemDf; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lZRdemDf"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92edb12cdf2so245178785a.3
        for <linux-coco@lists.linux.dev>; Fri, 07 Aug 2026 11:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786126819; x=1786731619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQJoR9F+JTLHFeALKkUq+Q0MNEImv4dProP3GHVEWS0=;
        b=lZRdemDfctZTEurXSt5iXUXJTyGLEUMjjmh35H8e0lZ7Phye2X2PpuMsTGNgLBYeex
         oFlh094w99mCMQDdNxmwI5usgVwIGcEAuY76ZpVJI9i2IeevGbPj506hipvNZAjnjygb
         gtfrLS2kQ8BYrXTDOul81oXlYUj+AvZ2LF7lSWb2hY+3ypnfdNwjK0d7dSfKJFHeRf99
         dfeRFpjMmGpH7CfeAF/Bv/Nd5EZUvRopl15d0Vm1l2uncRdy1I5YbQBl/yyAExC4w7tt
         a2M7HT1RJZ3Zkrnk154PL0wH9szCLqavrcpWcKgA49Ru3MImqJtrSvyzNqFfE+fjbD+H
         Kytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126819; x=1786731619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQJoR9F+JTLHFeALKkUq+Q0MNEImv4dProP3GHVEWS0=;
        b=f2iFWe6H21tnW0b7XQsDCmEWJ14vaCrJAyqU7qE4E91i/Oco8c/8xpce5H6ej8+lb2
         A9D/77o6hzN6U9kWRtU5Ux+1/wngBwedaZrFeIKPwE+FmqB5UgnakMk1H53/WIbkxNZQ
         r5fLwmopG6yXLkLPR+3roHTbOeFQiAElk8jQx0yk/gFRtlYCr7vE2wUDMulhXitIBnQ8
         yUu3pctDkYKdzD4CrER9v5oxdQFcON3uhqtRJAVheT16Xp96RaW1B0qNya1RgJmWogzn
         isllU9INFHFWjrannYGa96hoFT77SBp8GLRmpr5dCTMHJf0Pa3J7Nv9xquJ+MM7yN/4V
         h2kQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXeJ9VqiFugyS6qjyHGQCKkKZE7upZCB1Q0SbIHXDu0+1Qk8jnjxJAnUyOm4/3BH8B+DpbqxX8B0gp@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/tyu/lf7TsmQUiEnWAtS20P++yWQeyDFDzBW20NoCVI7sw/tA
	8WtZ9D9lSZjo3L9GA+qnTySfxDQ0mtgMM8olGrPYmSz8vVuBnXiMvkGGVi5N67IO5HQ=
X-Gm-Gg: AR+sD13W0OG5OvU5NPN4/5WA3ui3LVw4lWX3twBrRqKXsXJtR51yXOlmnrgd3/5h9JA
	RdMp0Ztmx9fvnzuh5OP4YOPCRl9R/Yn+9wF9thISkNai7BrZdOSAEvphZM+d0YJQrRa57ujiMVR
	l6IQDVwbYll2NZujmPQ3jvMTJABe77rT2UI/AklqDx33s3k2Jp6h83+ILEpMj8/5NQfcIOlG9X/
	Be8SNhVJ56XK9NfEYnvBufkexHesx6NFBVgjajobL4plem2BG/LQ/dhsFUceTmyF+SJdzNmUCII
	0/LoBV8rEIgQ1NAxGUEAQtv6ywWA1+QdqG53noN/K6DEil5wz7ITNUJ806D8cAkCDJcCSpzToef
	9XSG9pUpDZ5zTG4NaOIQMOHHcNTmzatPtxHpSJk6EjYJspDbZE82uXf8hZjd9ccgaf3SmR9ygC3
	JINVBO05dqYgt907nFNEeFL0i4p2GzqhCR3PGMVAXcW1F23zjgxJ5OhomprV94
X-Received: by 2002:a05:620a:628e:b0:930:a38d:4030 with SMTP id af79cd13be357-93671eae149mr628522585a.29.1786126818655;
        Fri, 07 Aug 2026 11:20:18 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e02d54esm204051085a.6.2026.08.07.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:20:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wsPB3-00000001Bmx-1xNi;
	Fri, 07 Aug 2026 15:20:17 -0300
Date: Fri, 7 Aug 2026 15:20:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <20260807182017.GH200537@ziepe.ca>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
 <anX7F7dnKOtAOIIe@google.com>
 <20260807164734.GE200537@ziepe.ca>
 <anYgXSR4VAi3TpOj@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anYgXSR4VAi3TpOj@google.com>

On Fri, Aug 07, 2026 at 06:13:49PM +0000, Mostafa Saleh wrote:

> But the whole thing is best effort anyway, the kernel picks
> IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
> how many devices or how much DMA they do.
> SWIOTLB memory is wasted if unused so we should be careful around
> that as it would be the other way around and users would have to
> decrease it manually.

Yeah, it is why the arch code shouldn't really be sizing it directly,
it should be done in common code and, yes, we are probably going to
have to do something alot smarter to have the common code better
auto-tune this for the CC case..

Jason
