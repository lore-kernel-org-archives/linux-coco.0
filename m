Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84C93CD8B3
	for <linux-coco@lists.linux.dev>; Thu,  2 Apr 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132599; cv=none; b=H/S2coSC351s7bKCT06ElHimHKUvA+e8oO76ZyesP3DN/4TrdBRjk0xW6HDSXeW5cChv2fpO+clC4hsnNfS1eF6yEMvQyWx/Q3Eg34c30gWmuyUCpNIAJ1Im0O7XqYYNR+dOKH6sspffUaBTbRoK6Z7zyXtHerHOSN4pAcKQsPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132599; c=relaxed/simple;
	bh=ZmBGSEKxrm2sD1+zHMG9w0btvdw9ZsL148HNd6FLqgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5UfOuNZOMc7NKNEd/vtntFIWKno+NgGsYN6F7F9J/RscizkiXBNtJOSiTRh1DKA8+euPvgxTIjM1m89TTy7OAfD6edME0tfaQnqUdkHwhcMjZdVlGnbtAItRx8o8q2C1y8OYzTr+oUKmdiBK6AhMuydOlWuJuHpEXduB8CBAhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LjGKf2zr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mTVyePCt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LjGKf2zr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mTVyePCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775132596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRxSNukj518ppA3ZO+j946SBDUenrVVHerZheyJEcDQ=;
	b=LjGKf2zr/aRN2tOMCkH/oG/HIdRBC5uKqP6cQPGO8HHAZEo2aWMkwGJPnwtQMjQ1WfvEss
	X7lW/Qvv5sFC5A2wc2MmRq7OE13+Oly3HQBVJIRIx7h90ZT6ZRWNfdQ8D6Qkxm+ypkkJpy
	vQaBHQ1oaIwxQ0p6GN0PTaVV4PLNuRA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-LKtq9YQPPRWBMG2cDQCkKg-1; Thu, 02 Apr 2026 08:23:15 -0400
X-MC-Unique: LKtq9YQPPRWBMG2cDQCkKg-1
X-Mimecast-MFC-AGG-ID: LKtq9YQPPRWBMG2cDQCkKg_1775132594
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d03bad787so808174f8f.1
        for <linux-coco@lists.linux.dev>; Thu, 02 Apr 2026 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775132594; x=1775737394; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRxSNukj518ppA3ZO+j946SBDUenrVVHerZheyJEcDQ=;
        b=mTVyePCtO5uGPB26N1E+pa80zhA9Pz/913K17i8cT6t1XzAuG4roVhuSY2D+aZe6zf
         nhehGhWP/gQ1SJHPxHNyjdDtLiH8ueKlo67HQfx2mPprsid/2Vu8b8Gya4+eZhLXO4cN
         S/qQRn+xah+iBhILTtIXMu8wnq9QxQkXG/pnupvNAWNQCBQYFduhZH4b+KzKG2H1mf2/
         Jkp85YRyXrTUCs0G/v3YvReCeDtkm11eoTrX3ibg4q4zEKHg6fNXtySN/wTVPaI5WUHq
         bATDzKHL07mkQbLqB19iW2/ruqFuXr0GxM/vOwbo64aA6qckDnqtZ8w/zUfPZLuxfVJ7
         BSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132594; x=1775737394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRxSNukj518ppA3ZO+j946SBDUenrVVHerZheyJEcDQ=;
        b=fcMbzYscAkV2ERupXRKRfvQkNMa86joRzd1dnMzXHM0vvs9Izn7TkxO7TUsevi7q95
         pX4vxgrk0BQJQIM9mSzjJkk0cCyWSfTb3asr+Sd5rJ+SQr0FdangJHXdkLwBVMMqPWjz
         89iZs1CnbWy/J00yJLzFd5vn0V3nAwE1kiLfSQnwed1jdUAmuSitWJpMtx8GrsW+/4wI
         vn9amEgSAqNQ8zaA3WjYpMLhvq4JS5rhBDlC8oFW+9vJ9tl7/jCRSHOmMmP38+82Sd1F
         5MiNwL5Q+TO68Qa8FsZJVEcQYPS761W2yGbNMWqJhsxYZeAtLbJvkzNU83ABecOZBNlL
         IQmw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ40owxp6+2VdRhv+AqnyhXB+g4lcok91Hl90j/wyY92YlMDu+2KAndpdJlUaO4KQlCQzPey33r0Hw@lists.linux.dev
X-Gm-Message-State: AOJu0YyN12RAemjSpvtZiIrWK5RWQ3COBBCCPBtfvFN1upQPsqGDfD7E
	DqQ/sdfTa1De11NJkbKjEupoyOOfpiwITJlcDj6+84XD4/53Ol6eVt+837ZKt6CkBIRXVLjkj3D
	2/SSiXEqyijQT3a8StoBdK/he9tW/IdGvAOK9EfZ6LgvLCUASO5nnzhU+sf5wlwo=
X-Gm-Gg: AeBDievi0/q3Z8I6eMbojkpCbKSxkVee8AFZ52/kwobWNA3/hTRSEM4FaEDU8Z49fol
	s6UOrAsFouwfvouYfK4nz5DKGZ7ECIM0w92LZEBui1Wjuzw8zCpbiUAeUMyLvpnOpVi5bOLl1Tg
	R0TSLCkTySUAQDw+C1FFTyw4E3FPUUekMNFgzW/Qc8udAAqIRIwAuFLrZ0JtQsvldCAPuNG6t4H
	gNp3fSKhLwxwq/ogxHJ4pLxqlJFS7x+65F0e22slzViHoJZLJ1uK65E6JUa4TVrNoJk5vutikVZ
	D2Bwlfx3+bb+dp7bu2D+wg59+sDizRfvOclIEVle3OiSbTSiEGjToI6tzBwCpX23VVWK2c6M7w=
	=
X-Received: by 2002:a05:6000:2409:b0:43b:6a16:17e with SMTP id ffacd0b85a97d-43d1505b105mr13705376f8f.11.1775132594183;
        Thu, 02 Apr 2026 05:23:14 -0700 (PDT)
X-Received: by 2002:a05:6000:2409:b0:43b:6a16:17e with SMTP id ffacd0b85a97d-43d1505b105mr13705319f8f.11.1775132593703;
        Thu, 02 Apr 2026 05:23:13 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d214f2b63sm4510096f8f.28.2026.04.02.05.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:23:13 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:23:12 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: system: add system_cc_shared heap
 for explicitly shared memory
Message-ID: <20260402-discreet-glossy-perch-bda4f9@houat>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-3-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="e65sn5i4kwgewwdb"
Content-Disposition: inline
In-Reply-To: <20260325192352.437608-3-jiri@resnulli.us>


--e65sn5i4kwgewwdb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: system: add system_cc_shared heap
 for explicitly shared memory
MIME-Version: 1.0

Hi Jiri,

On Wed, Mar 25, 2026 at 08:23:52PM +0100, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
>=20
> Add a new "system_cc_shared" dma-buf heap to allow userspace to
> allocate shared (decrypted) memory for confidential computing (CoCo)
> VMs.
>=20
> On CoCo VMs, guest memory is private by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is private or
> shared. The kernel's direct map is set up as private,
> so pages returned by alloc_pages() are private in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to private memory (no TDISP support), it has to be explicitly
> shared. A couple of things are needed to properly handle
> shared memory for the dma-buf use case:
>=20
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent shared memory from being
>   reused as private.
>=20
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the shared pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.
>=20
> - DMA_ATTR_CC_SHARED for DMA mapping:
>   Since the pages are already shared, the DMA API needs to be
>   informed via DMA_ATTR_CC_SHARED so it can map them correctly
>   as unencrypted for device access.
>=20
> On non-CoCo VMs, the system_cc_shared heap is not registered
> to prevent misuse by userspace that does not understand
> the security implications of explicitly shared memory.
>=20
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

I'm a bit late to the party, sorry.

This new heap must be documented in
Documentation/userspace-api/dma-buf-heaps.rst, but (and especially since
it seems like it was merged already) it can be done as a follow-up
patch.

Maxime

--e65sn5i4kwgewwdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCac5frAAKCRAnX84Zoj2+
dnVEAX9CFXx//98RE08S4/htofGJDNunF07/14IluU1iYb8+94vCMi2iUvSzXSKI
zbgrVRgBfRy+pMU2nc+zOonhVfFvK813bX4cN9vLtMfH0/h/fKnFJKCc5msL12k4
8g97/3uO3A==
=FGaV
-----END PGP SIGNATURE-----

--e65sn5i4kwgewwdb--

