Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FB544684A
	for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031764; cv=none; b=svpfrA/4z5vG5y1tQLdzXMqxIKO18p8A2xrspMZq4EeEW79SJb7v3JEBIFRh9hjJ1t7Cas9iHOiAztsTHY3ARYYQPldwzqKJT5RbMi7xc/tmWe8xzzv3OWfyFf7KYzp5SxX+TYw/xyQE0L6v239OsXz3zmJYC0wmT5Jn7OBXgU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031764; c=relaxed/simple;
	bh=Gu04W+cCiiM26ZsyHUMdXjMPrm/Duv/aZB+CYp/Nq1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsFwTiE2WkeDKB7HeQn8UNY5RHZwy6GkC4LV1JMRKhrpx5ondSOTTgh/4I1VViz4sWocsisfgtqOgVpkijYBTt2kd7S45E7JdScIqsLlucBjCbEj1/AKSJ4FaWdZ8b35V1c2zuU3/VM5rl923Xq3i5ekW8jXFG5Cii/zs0eBNcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hn86S0Qb; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hn86S0Qb"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92ea24a2dbfso317289585a.0
        for <linux-coco@lists.linux.dev>; Tue, 14 Jul 2026 05:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784031754; x=1784636554; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CIAv+UZ8t7s5h+WlDS73yJMkdztMQ3zXG2Fxq/to8M=;
        b=hn86S0QbmD4alhFSQozEcnBS2MRkJA4nq5baGWYRsQTP/h352hBpvMs0e2GCo7c0w4
         jP/EdT8tEcI+5tglyli9KU1t+v+TMCCXU/EgjAtUrhyYoQva9qYQSwOjbLhriE3WfDTF
         17AmuPUhVfCM2e8CEtyYmEbYdDeWEViiC1JQxnT+GpfeDIDcln87ym2AQx9YlG/Hz346
         6Tk0lajpefubuFmmUaBUxTfeTzxli2mNBqwM2eVR4TA1QB3WpzQZrlKxDpHP5+2rs+pJ
         a0DNfL4j/iH7XpS5nB9XW/6zsb7X4X8bVtEDwMgek4QP5n+iNxuBx+bingHtif7rnyDJ
         LBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031754; x=1784636554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CIAv+UZ8t7s5h+WlDS73yJMkdztMQ3zXG2Fxq/to8M=;
        b=rKjwX/mrm9PIj+7QL9NFELWAxWpe0BbCZFRe98SZOhe69se445FMvQjvaIzxLQ9/m/
         wygMyq8JsAiQJvLizW2W4hZNgEBDbUizvwovSgM5dyVyeA8Y+r6Fqc7tcK7Jg7PuRzTj
         y2gWHZ4q+h7cib+KO+wuRDFCrrDcym2PA/chb3laWiQMo1vgo9KHUs/GZSn71L5XQURV
         YJvRqmpK48GUHwJfLomBsfruU3fk3lDn0H6rsm0VQAZ4KqeB3XDfSO+msBwcfk9+l2oM
         vHA6xalaqOXhnRyQ+ssuCDUYzHCz1joMHd/4n7cOVhk8CEfi8gdQBJU+MvzzkF8Lo/c5
         hLFg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Ir7EDnp+WFJC9vMJ8Owyr/Mm4UUTiN0Tf82UalkrVAVuoK+2QiOCTJhE7xB5gB96DPGISctMXGQP@lists.linux.dev
X-Gm-Message-State: AOJu0YyRdfiDqWD/I3r8oWQwktROWw/EtklLYkqUK1M48TJ9jqtg16dp
	VdXol532aDbnBUsPk98u5iil6ey5ipKImmgbteegMyPoNzFfeGwPTGeSReDa8cNNtMo=
X-Gm-Gg: AfdE7cncw10ha+fQm/ZzPN/5jhYbW8+KVU4rSyQcCdSYDKb5kOiuUmBMsVGXEGxDzMU
	JOubgiXnCSzElSUlYgyiRbyzwDEQSCgPniAAcFHu/e6d/jpC6FR//FRddxjEU4ARs0/WcDecLqD
	j1wMqOB18fHXV6dT96pfOgefD5yMSCWP9e6rq5wfFe3otfaeVexbGhpZUD51UYy9nEu3OMoT/CP
	s2JBKYJiVjaKby3BdF0NT03JxO6Ol8Lb0WMcXpcOn0HAF4Zfw81gCj846Bzqdvh+MyI9Od4KNF9
	B/HtaVPqxQyRBdlyLC1sxYKBjqgDjzAEYKea2vuJhBLgEHwTNG+VdurvgqcOSmIyEyc7A23Rd39
	4xcFf+/sNdYe6ZBAdtJpEvfGwKWodC1YjP4D9vRVB/VtbeD6WKz12PqfWaEFl
X-Received: by 2002:a05:620a:7085:b0:92e:6bbf:966e with SMTP id af79cd13be357-92ef2cb202cmr1211484585a.45.1784031754284;
        Tue, 14 Jul 2026 05:22:34 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82ea9casm164927486d6.42.2026.07.14.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:22:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjc9g-0000000FRaG-0ohM;
	Tue, 14 Jul 2026 09:22:32 -0300
Date: Tue, 14 Jul 2026 09:22:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 02/22] dma-pool: fix page leak in atomic_pool_expand()
 cleanup
Message-ID: <20260714122232.GE3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-3-aneesh.kumar@kernel.org>
 <20260713175433.GI3133966@ziepe.ca>
 <yq5azezumef6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5azezumef6.fsf@kernel.org>

On Tue, Jul 14, 2026 at 09:05:25AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Wed, Jul 01, 2026 at 11:19:06AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> @@ -115,8 +116,10 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
> >>  	 */
> >>  	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> >>  				   1 << order);
> >> -	if (ret)
> >> +	if (ret) {
> >> +		leak_pages = true;
> >>  		goto remove_mapping;
> >> +	}
> >
> > Truely these _set_memory_decrypted() things are an insane API. So a if
> > it fails to decrypt it can be in any messy state?
> >
> 
> Yes, we could possibly try to encrypt the page again and, if that
> succeeds, avoid leaking it. We might want to do that tree-wide in a
> separate patch.

IMHO it is a horrid API if failure leaves thing in an indeterminate
state. For something like this I don't see why the arch FW implementation
would be unable to restore things back to as they were on failure.

But whatever, everything about set_memory_xx is really bad it could
use a cleaning

Jason
