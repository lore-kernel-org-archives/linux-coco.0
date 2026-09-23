Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D53E5ED8
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184217; cv=none; b=Q9OTJlJ+pZWXDdqBTF2M2SPgH4juRoH49GQMNRtnUVvzk3ShLEy7XuHGnPGarq4M0zhrC1F84S7fQCvOVTGyc5dFYYJ1M9kD8M7TYVIi7hbvhX3Xw2ZQRRJ3Kw55GHPfSzBap1WAZ033cH/rhVwsH8tyHo0rZmK9ihGUgXUa9eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184217; c=relaxed/simple;
	bh=t2TgzO8nwUEwjRZhrCgeKf9S8CRIcvO43oc+9yu4/Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNLRep+DKe8Kk+nOzJQM+dRi3XHz6dL/fMxfEcbeR/3Bv0Z/U9csTyR8hGJZF6Vqh9ZS5Ypd1KnPcYMUWtRJfX3fU4R3ucPpXU7dvo/tAkYqkutaElZ4uNZxmblQTw05l/myS7c2/xyTYoD+HNO0N/buhVZAgBYUOdiayRpv4/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hE2dl1v6; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hE2dl1v6"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4923c9429so532913b6e.1
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790184215; x=1790789015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FwE1NfmDw+YKo1XdhlQDW5TQG+slKv16o9ht1shLNo=;
        b=hE2dl1v64sBW4hN+w8ToHUQxd5ZFslsFvBlrjLpxrLWlLFxKBcIkZZ43WHFAIrmmQ7
         tv8y44em2oit2qQbX25Eny4uQ3kzMrj1sqm3NW4n/yBgSmxcqSSN/ixRDCGFVXtCuxPN
         4ptr+op5ywXvFUiZWDWP0UMD4E992f2UaGa2lI+dUe66XuRWTNSJPuhieAy7xOQad9+3
         61odtALkX3HNkDi89e2TCk6dSepJLZIM0wRAlQMwIRKWD6MuLx39X3iAZO2ip2goxkRN
         4dP/8Dwv00RcGgKMGiN00q/xZ5tHddTr+eJL7+U1lNx8O9/hYytSIxZVIJiq6Q8+xWCV
         r7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184215; x=1790789015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FwE1NfmDw+YKo1XdhlQDW5TQG+slKv16o9ht1shLNo=;
        b=0R1JYeZjqXSYFu27KOkcP7V4v6u2qA0sutXZQj2X89QXiAvykWTa3CpFK+X/WJkeXh
         G99aAj//VkcoIIVExT9gmmTF96i4L5tDr/BNkKo3whOSoAQ49Jr7SUaJOHoppyKpaJKO
         WowHjpIp5R6NWwqK+/ewNUwLO03ni4RZRlLeHLeiwdJkW9W6tLufWkoM8Ac1y+/AD07f
         iQgUUeabRM4pvPvXT1vyUolGWvQXctQF/n/dgcTJQWGoXHqkY28f0ugNS/DAdotTXa2M
         Lmw7O/ffEUPGlTnFczB8T1TGVx9ZouPaBLeN3SV6KWuz2SUB0ijK0SD4g9ZZ+Ors6Vu4
         wHYA==
X-Forwarded-Encrypted: i=1; AKwUvBwAY7VR/o4Zr/lPP/XlYk7nG8ylrN1G45leZ66+hg55NHQnZUZHuVY1M++5LlX0aRbn4gK1Iem77yF6@lists.linux.dev
X-Gm-Message-State: AFuF++lIzNfo6OsoaL3QdnUxl6ozDR16TVNqJdOc/IZ9V+qGy21lujoe
	fXQKhcUyWE2S8XXnKwpcqtHa9D1vb9zMO6kjMe7jUapNE8Aao6NhD34qV4GbwDMFSDE=
X-Gm-Gg: AYBFou3P8yBe/3stto5SG+IVXDtZK/n9qHksD/5kmEI/KM23pKrJBtGqy0U2jccbSNJ
	AoGYgukqjBF6yOHEI3I6R3HYuYhEAWcm9gQXzq8GAvzVefL1z6dCjvSPA3kQdt+CDS/XdmZdgYS
	iQ4n2CD8LacOAxSuuLF/8xdtIEOXeTqsnVUNfwCvM+AGqFM0+/eURQcVSBUfCTATtOf8CVypZl8
	wZpcB+YEu51RToEM5HpFoYX/sYC+6D5wrGxexNlLPU5VORiXJ+UAVF0KcCcD1qEACI7USE+cXsg
	8MiEARINYAPaoRc6RdwqtXdDI9c4xQK+ACli+BVS947wBFmydwKRi+LTdDksIy4NtDqy9ksoLzW
	kjRq5wyr1vGjKVZBKL0DgPfitVPkSsfbgqR1OB8u73031TLF5byGGNflUOVhSCnfy7icPpWgAHN
	/6nNiTPKyMuVPuq53H+EfOI+yBwy2ap7yN++zjaZ6VcUXb
X-Received: by 2002:a05:6808:1313:b0:4b5:5bfd:518f with SMTP id 5614622812f47-4d5b85af4d4mr3232472b6e.21.1790184214658;
        Wed, 23 Sep 2026 10:23:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c522604asm2686648b6e.15.2026.09.23.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:23:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9Qgv-0000000E9nH-0xvE;
	Wed, 23 Sep 2026 14:23:33 -0300
Date: Wed, 23 Sep 2026 14:23:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, mhklinux@outlook.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923172333.GM1540250@ziepe.ca>
References: <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com>
 <20260923130611.GF1540250@ziepe.ca>
 <yq5atsng10b2.fsf@kernel.org>
 <20260923152124.GG1540250@ziepe.ca>
 <5cbe0bde-47d8-41ca-b244-bc0329d0d066@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cbe0bde-47d8-41ca-b244-bc0329d0d066@linux.microsoft.com>

On Wed, Sep 23, 2026 at 09:28:54AM -0700, Kameron Carr wrote:
> On 9/23/2026 8:21 AM, Jason Gunthorpe wrote:
> > On Wed, Sep 23, 2026 at 08:28:57PM +0530, Aneesh Kumar K.V wrote:
> > 
> >> I'm also considering requiring the address passed to cc_make_shared() to
> >> be in the linear map. This is currently required by both TDX and CCA,
> >> while AMD SNP appears to support vmalloc addresses. The only user of
> >> that vmalloc support is Hyper-V VMBus GPADL setup
> >> (vmbus_establish_gpadl()). How should the generic CoCo shared-memory
> >> allocator handle this?
> > 
> > vmbus_establish_gpadl() is the the same wrong abstraction as the arch
> > code. Get rid of it and use vmbus_establish_gpadl_caller_decrypted():
> > 
> > 		pdata->recv_buf = vzalloc(RECV_BUFFER_SIZE);
> > 		if (!pdata->recv_buf) {
> > 			ret = -ENOMEM;
> > 			goto fail_free_ring;
> > 		}
> > 
> > 		ret = vmbus_establish_gpadl(channel, pdata->recv_buf,
> > 					    RECV_BUFFER_SIZE, &pdata->recv_gpadl);
> > 
> > 
> > So you made an allocator that returns folios, now you just need to
> > use that allocator to implement a kvzalloc wrapper. ARM can call vmap
> > on decrypted memory with pgprot_decrypted(), right?
> > 
> > Or maybe this can use vmbus_alloc_buffer(), it already does it.
> 
> Michael Kelley recently proposed [1] moving all ring buffer allocations
> to use vmbus_alloc_buffer(). If we move forward with this, it should
> remove the dependency on vmalloc support.

Even better vmbus_alloc_buffer() can use the new allocator API
directly so it doesn't need to open code the set_memory_decrypted arch
call.

Lets do it!

Jaon
