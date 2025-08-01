Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C626D4F9
	for <linux-coco@lists.linux.dev>; Fri,  1 Aug 2025 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754059989; cv=none; b=auJnzhGw2GXCK766sgsOAHPXIUUq8r++vJkbWKDAM722duURNtKvYZFBoscB59yha9Ui+CWKggD9+vyYu5BCW4sTpxRv5Iqmlf87rByr0rYYry6Tlk8xaMJVvJpT1nc6VucsnqpepDgez9LhU7Y/1flYPVHLLieMrsYD4e4w5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754059989; c=relaxed/simple;
	bh=9z8sFr7OTh7x/5XSMissRsaGqrEIK0lYaVRNZPtOZxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bo0Ho0SKzceN9SkDoTieBVTDnyd144XHgCEI1GPokBXwjT/3bYfqJIsnypA4uD08uBa3NfrZvg8h7LSEPe24gzH8lvfMrJf/AONWYuxdQhBdVRomzAbrtOtC5SKaNyu66O4xiUlQMFQOf+FtttjIkmkzJAPf2eaYvBCnsyjRAUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LduHhoWI; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LduHhoWI"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7072ed7094aso8873576d6.1
        for <linux-coco@lists.linux.dev>; Fri, 01 Aug 2025 07:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754059987; x=1754664787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNtgboVqwh20Ney7adiU0cV/UXdxsSM54P/Vl6XgEls=;
        b=LduHhoWId94Vq/huspbCNP5YPaVZ75RRDPgoCU7pUwLWcFsKZgIGATQpYDOVUyeme/
         Ft1i6Wa562YbWrkxEmZui7sda8pd//J3bq6acUrLdHbAud4AcJi3LR0nKsEASGgj20I6
         FKRN0nGrrVei6k3+tEqmvG8vO4DYgoGZDBUv1EKTevsrqC+lJAo1XGuJKerWxvU/059O
         yMnYSBN6s94D2a9Am3vD+lu2Cf8W9X1SorNMtMOM+5QAtlmDmduY/i+85bsH5ofBXirQ
         jWTAUIODSjVzlT9JzFNHt08O5BewsGJkXvpOV50wGAR6oh/GkwZkvJ5rvohOZ8i3llkT
         oOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754059987; x=1754664787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNtgboVqwh20Ney7adiU0cV/UXdxsSM54P/Vl6XgEls=;
        b=C97IUoeQfkykhXjbKY1MGd+JgRe4KCAq+U5i56jS6NLGfWUDmBXM0TJeUaBNXJYEdy
         E1K7kdtC65U3Vb6KzUeyuz8VYHI8Lf3BQi7Dc/0NnwtoNzC6LjxMayrd6EWinIChMgMZ
         SHQw5+Q5YJPEPw14pFTe1tIawI3Ney8hSofn6ovLnyCojjIP99QK/jVBJ0I9DtP6vXmK
         tQWRgKtjs+zUUEh57dxpJGkfwU9ct4/6KoMX3SX0PAkMs+BhNOznsGuTUIIL2a6zMAlA
         M/nVGrakEadp7AtW2kjJn0RHhPQDCuKy5Ap8DRbIzRZj5gjtZxTKxQXb2ij0fnpKhF66
         /TTA==
X-Forwarded-Encrypted: i=1; AJvYcCWt2vWKeN8PKmfvPMDIf6I6SLv0TNLQzV42Q7PO6nSoyG35LSkTtllV6o9XyjNfzhoIisgAk3ZCz20n@lists.linux.dev
X-Gm-Message-State: AOJu0YyJsCT9cCsxRoFfpVpualoyGQEparrfpjeHqo8E41/I1JxILU0O
	ldoh5a/h5BmVr2aLzqk1g4vwP9h/Gvb8eIk9OX9iQBk3WQmDzabe5VTPAB2CVFQj6k0=
X-Gm-Gg: ASbGncs4Fb2fMYOgVfGEMEld6gDxG/CwhSXIiRcR5sswOeIrDnHK9YtBCgK4jk6vRxY
	j90X+KNEC6RXUDKw9jFtL2rjQ+qiZQHczk9AxIYt+nup26ZqI72Rs9HWpAhVJZvn6l4bAHMZuzz
	ktM5OWXCZpTXuEfhAHBF/AFdWtEw58tVr5HwCTSUcXnFilkPtKZx5LW8z0v1XOseOv9YdOx50D3
	s3Iw9GnBoeVR5PCV4fR0mI+34BhgdGtTfm0A1utXmKuc9dW05zHl3Z2+lXhAJ5jTMn38KRRiBJv
	5TIV5HBYTSInnKJUSZHSqiLHLLjNd26tSphqzNbk9wZGJeuKkrSfY2jeGeyTSu0e8x3KjOMt53E
	S2UDODfl39of3xBTqsUcJopsANyBX4WtgtHVVKt/G8N8o4I2HsXtFqJO1skd8tCQkhan9
X-Google-Smtp-Source: AGHT+IFhLzfh/tN6NcfbFOiHT6YBGOLWjYR19Ez0qlLrCLeR+IMa26shu3X/pz9tHfJr845QNLQ7TA==
X-Received: by 2002:a05:6214:495:b0:707:56dc:178d with SMTP id 6a1803df08f44-70767185894mr176316596d6.37.1754059986819;
        Fri, 01 Aug 2025 07:53:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077c9dfbbfsm22005316d6.13.2025.08.01.07.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 07:53:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uhr85-000000012WJ-2mLW;
	Fri, 01 Aug 2025 11:53:05 -0300
Date: Fri, 1 Aug 2025 11:53:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 04/38] tsm: Support DMA Allocation from private
 memory
Message-ID: <20250801145305.GB26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-5-aneesh.kumar@kernel.org>
 <20250728143318.GD26511@ziepe.ca>
 <yq5a5xfbbe35.fsf@kernel.org>
 <20250729143339.GH26511@ziepe.ca>
 <bbe2a41a-8f72-4224-a0bc-225c1e35a180@arm.com>
 <20250731121740.GQ26511@ziepe.ca>
 <1388fb70-3d2d-4c41-9526-521cb75eb422@arm.com>
 <20250731164420.GW26511@ziepe.ca>
 <791e259b-3a57-487d-81ca-9d83f83ad685@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791e259b-3a57-487d-81ca-9d83f83ad685@arm.com>

On Fri, Aug 01, 2025 at 10:30:35AM +0100, Suzuki K Poulose wrote:
> > Is there a reason not to just dump that into the T=0 SMMU using 1G
> > huge pages and never touch it again? The GPT provides protection?
> 
> That is possible, once we get guest_memfd mmap support merged upstream.
> GPT does provide protection. The only caveat is, does the guest_memfd
> support this at all ? i.e., shared->private transitions with a shared
> mapping in place (Though this is in SMMU only, not the Host CPU
> pagetables)

I don't know, we haven't got to the guestmemfd/IOMMU integration yet,
which is why I ask the questions.

I think AMD and ARM would both be interested in guestmemfd <-> iommu
working this way, at least.

> I think we can go ahead with VMM pre-populating the entire DRAM
> and keeping it pinned for DA. Rather than doing this from the
> vfio kernel, it could be done by the VMM as it has better knowledge
> of the populated contents and map the rest as "unmeasured" 0s.

Yes, if done it should be done by the VMM and run through
guestmemfd/kvm however that is agreed to.

Jason
