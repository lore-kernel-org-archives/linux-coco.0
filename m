Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3226E161
	for <linux-coco@lists.linux.dev>; Mon, 28 Jul 2025 14:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712226; cv=none; b=qP/zXVpCW9rbdMcGEyUAXLFTIUxP+WTPKfCbFUwGs8U7utVyYQG9OWwOa5r/4Nl4JgNWgZGMRP/gVXoHzwbrpzrjmFFOnxr2PiexTIelHoVqFklmFFNhQ9l0k6QUlZcuJ9GHmpeNzmxk9OwutO9Yn9/LBxvgDGYidjWXNzRUSUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712226; c=relaxed/simple;
	bh=+sQ9t0gn5L4GrZDYwNd4uW4hApI7Q8x2B8KZ36bnLW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqFtcpH6K+H/SRQ+fVeqRfBSk/MCHsfqKkgcNPi676A3WYtiB5dv1Tcau4rAhkQCDhdoxdLtwR8ZkJzMYZ8NA+sWFLDATSmgRvbVSHhmP6DKpzMNGw7EJG8ywdelUaK5F8Zj6LlPCV/jA5+JS2F/H2oj4AvS/pVg513OuCSvO/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dL+HajTc; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dL+HajTc"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab71ac933eso40336271cf.2
        for <linux-coco@lists.linux.dev>; Mon, 28 Jul 2025 07:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753712223; x=1754317023; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+sQ9t0gn5L4GrZDYwNd4uW4hApI7Q8x2B8KZ36bnLW8=;
        b=dL+HajTcPYW298bIf5D+tIQ0MNl8GCIrMNgW6Z+VnHsfd6YFV9HR5/hUfGonXZPhmn
         gJjlXaegXxNv5IPiU/me3fjaifRO4FUFp8Xex21vGGR1QRHbrUnJLN3WjoMLZ0rSFOLZ
         gjJjC6MFOmM9uWzXCkvhZPXGCGL8V81+hnocoGHmBJ20kSdBpbLrKzVrzPtGzZUllVjO
         SEluEJzE9tLXfu9807ngz7xaSHa0T7DbHHR4CM6os6+Jh4PR+ffnXGNf5mDL4gBeAZAF
         b8PZVegG0ACt5MMaGSettRiHxD2C/o6dUjuTCoF7cT5HNBEHYCqzmY7eNduYBO33jb9i
         I57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712223; x=1754317023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sQ9t0gn5L4GrZDYwNd4uW4hApI7Q8x2B8KZ36bnLW8=;
        b=gnr62gJ9aCb6JsWgIiu5sUJXuc0fCb73jCIJ5xTnXip+FrXunNr9ihw4h7m/cKSrs3
         Yjsfjsa6BRKG0WGnJ5nSeEPq8p9wwQGPBHp4GtXT3Ev731GqDXSZOpFg9/h46VRsn95r
         TEj0xnjgkvSW63Tp5+fPeFsK6aJHztyNLI9cyYfuXgymlOc+k6Lw5DDJ/nBl/SZdq0Wv
         rnegOFs250asRdh8SiAWdbdy+ldCEn81qSEsMaLygqgWS6c6a/U+ZdiaqOlvMfBkPF9R
         O0I6F29L3U6MQ4BmPfN920Z7Jj/bkmUx5Ctd2hYwjMjTYyhg2pxpc19rHRPB6Z2NLRoQ
         UUcA==
X-Gm-Message-State: AOJu0YxnLE6/oYSis2SOnCZX2iVIdSxgX//GBSkbYsNAiWI+6hL/gbhM
	lUEKB1KtQCWzQ7hN75FJh3HQml+y77RWifkcTtVTH9W/euu3XH2LSzQaHpTXIphdO4c=
X-Gm-Gg: ASbGncsjrbwbmGFey/B1i4LKyJefSmKdoZn+LrgER7wsniSQYzTsnfiMzXNIue0GWQF
	MCY9JJCGjGrhJ1qlUoAASQGAmGnT8sUL28f16YAgN1/ykpz6wbFVcdlo+3izWIlhy0Az/5B1fCE
	+tunm0FbMI7mGDo1wv+UbxwCbdzRLF1DJnl635VFnieGZRJ5XDxPG4YaZGL3XqmPhZlLjIwzHGp
	/1BnULOfKi/ervC4q0QHM5jtN4chTjiSbxdN7JE8OY5tGspMtKOQxG20dGhUY/DYouub4GFWqpG
	JALEp8spFOfRi4bfVnxYLFNlC/j4lUwfrGMZj4DjU2PP73y8kFCJdcvNRoWVgRNbrf0kYEuVW4H
	eqeuWlQmOib99nsnRG5qmUpw+Nf0ntpZ6y6sVlIBbL3ldlVhRpL3bgmvMtSdA66KXhezU
X-Google-Smtp-Source: AGHT+IGJsSVbXjLNIqrlIEbk/gUzNYQYHSbjL32ASxGtiy6zgoFXF/rrvq7tro5LsCceIcXyRKliEg==
X-Received: by 2002:a05:622a:1104:b0:4a3:fcc7:c72e with SMTP id d75a77b69052e-4ae8ef5c18emr158029941cf.9.1753712222972;
        Mon, 28 Jul 2025 07:17:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae99516fcesm35769401cf.9.2025.07.28.07.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:17:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ugOez-00000000ATD-3mT3;
	Mon, 28 Jul 2025 11:17:01 -0300
Date: Mon, 28 Jul 2025 11:17:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 10/38] iommufd/vdevice: Add TSM map ioctl
Message-ID: <20250728141701.GC26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-11-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728135216.48084-11-aneesh.kumar@kernel.org>

On Mon, Jul 28, 2025 at 07:21:47PM +0530, Aneesh Kumar K.V (Arm) wrote:
> With passthrough devices, we need to make sure private memory is
> allocated and assigned to the secure guest before we can issue the DMA.
> For ARM RMM, we only need to map and the secure SMMU management is
> internal to RMM. For shared IPA, vfio/iommufd DMA MAP/UNMAP interface
> does the equivalent

I'm not really sure what this is about? It is about getting KVM to pin
all the memory and commit it to the RMM so it can be used for DMA?

But it looks really strange to have an iommufd ioctl that just calls a
KVM function. Feeling this should be a KVM function, or a guestmfd
behavior??

I was kind of thinking it would be nice to have a guestmemfd mode that
was "pinned", meaning the memory is allocated and remains almost
always mapped into the TSM's page tables automatically. VFIO using
guests would set things this way.

Jason
