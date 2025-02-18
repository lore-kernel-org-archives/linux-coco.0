Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030D31DE2A1
	for <linux-coco@lists.linux.dev>; Tue, 18 Feb 2025 23:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739922670; cv=none; b=H29x0/vjvRZCHTC1is5415Ocv152oOPe5n/UwWhuy3dnXX+5Iv1IBi7y3PYxYVzB7z+wtyUPP86iFepKqt5jtLz77EP5ONq9AgPzVEwgjJL0v26kpe+b3RiKcQuOhwBisoXg18dvUMW7+/ZSwPbnrLfA7N9N3DxANtCjcBNFoao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739922670; c=relaxed/simple;
	bh=iKT5gRHJFTk24cvpT8KmAyPqwcHjrkHc67AQuv3guHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuJuQKIyMUg7ubRAgk+NAhbC41Wia2xi8sZu7Krs6zYoDpiV+QmWW0kX/f3Z14wCgP8hN5VDP8lG2QCWvIbvrtNSJqZECNzrUDl7grmFglEtFgGLY8yYC1Pz+ULyOCImdIjTvHhYkyHExismcZwpESaoqfQSHoV8LWUpZpNslmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QrQG5h67; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QrQG5h67"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e66a7e2754so33814076d6.3
        for <linux-coco@lists.linux.dev>; Tue, 18 Feb 2025 15:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1739922668; x=1740527468; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKT5gRHJFTk24cvpT8KmAyPqwcHjrkHc67AQuv3guHc=;
        b=QrQG5h67JEl6vm3nanzmW4zxI9o7sEdpTKmtuepSlvI3GClAMkdI82Ot6JTiZa5Hof
         n04geGXht/S+G+rfgYJtT4aLvdmUIpoTQ2yuKtm/SNVWL0okfb0Fm6jC9EZZWPHn5cLD
         B5zlfgfuaAQ/oSumwUmFUTzNTOASyVE89YPiQUK/OybEu/OYTBZwCnRdPV1Z5qVhful/
         Xxz5dm+ByKNYDDw6+O/mlznj2/piVNdkk1bBT4rJkLTKHP6+VboEe3kXaULafbszm7yf
         aIVdEyhuF4Oiuts/ccM4/UpAjMxAh8RY/AY0JCex8IcrUn3IDddoeuo6j8CJcvUNlS9g
         s50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739922668; x=1740527468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKT5gRHJFTk24cvpT8KmAyPqwcHjrkHc67AQuv3guHc=;
        b=oPYp3ezpfgWkI7eFLDvo/JswOkIOIzlUPmwXVZSG99JvMUfXguGslYRCFGnpSi7eb4
         h/5+rAyjNOqpR6h5w9mUt/Qtom/KkOsW3l4EXp7maTBlmwcvmzUFAlzLJvfzPesffrDj
         PvD0imeVJWL/AzvJDs9biLy8AvO88K3yP74pWEy3mVV5iH9EuZT4Ar+IZnIDCQErzhCP
         0fLxL8SsVxSP9g3n7d3zdNqdF2WiOEJ5zUN8nYxUaiNUE5hJZ7FgVFCvZqEeYcpbWFNZ
         30HfnUznPu99roMVFkShXtzeG3+4Y0yyCHj3c+RdhNw1s10WwMx9797mtNDUlZuHe9df
         u55w==
X-Forwarded-Encrypted: i=1; AJvYcCW8tRAMQcBR86P6d5OdcESOtkn5VTX0m0HAsm+1HyILi7AYOtzEpMP9I+jj7MjKYVe+ZtMJsU5U08lA@lists.linux.dev
X-Gm-Message-State: AOJu0YzoLbgeqaG0KlqowGMw68xplDhVTOkXsLBWFP3fxTuKzOJW6D+6
	YWadN4JsAVr0KWBPOVU5ZDiORabF3U5r78u6DsgrpLyDTlPfnwnxizXvLqvVXM8=
X-Gm-Gg: ASbGncvREdh8FQiTmVPRpWasLB0ytSjnF/MUVmp75A8j8B1lWCcdMaS72exZEy+TuuE
	3M/2FEuhyz4UX4c+kWXDXXYBz9MWkH4Mz0hPH9Opuq3ORVEbiPyYFhYiFWfArbOj3kHejtL4y/F
	iwLG43P1ocAe0xXdjBFp083d8BYSSzZHhP7NL8ytoybKG+BEJb/m7tF9jLKVADo+5R0sEZt34OS
	4BXrBmTembSlM50R45RzUMpOXzlDhncPfxgRVQ/xXSvzFI0G7HCBHeqthn2LihvUIliVpga/z4A
	IsKyCtYy0rTP2QCULLt4S1L5HwE/NB7n6c/vV33w0RYVt0Q+lKuRFgCsyZOThFq+
X-Google-Smtp-Source: AGHT+IFO1/6l3OUxeVa8mqeoAIRJldW9bBpco9S18W39RUG+1rvPlDolxLvoJK10Ea2Dnll0//ehxQ==
X-Received: by 2002:a05:6214:1d09:b0:6d4:3593:2def with SMTP id 6a1803df08f44-6e66cc8aba1mr253639746d6.5.1739922667835;
        Tue, 18 Feb 2025 15:51:07 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f325fsm68981726d6.76.2025.02.18.15.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 15:51:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tkXMn-0000000020v-3I9I;
	Tue, 18 Feb 2025 19:51:05 -0400
Date: Tue, 18 Feb 2025 19:51:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>, Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, Nikunj A Dadhania <nikunj@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Steve Sistare <steven.sistare@oracle.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Dionna Glaze <dionnaglaze@google.com>, Yi Liu <yi.l.liu@intel.com>,
	iommu@lists.linux.dev, linux-coco@lists.linux.dev,
	Zhi Wang <zhiw@nvidia.com>, AXu Yilun <yilun.xu@linux.intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [RFC PATCH v2 12/22] iommufd: Allow mapping from guest_memfd
Message-ID: <20250218235105.GK3696814@ziepe.ca>
References: <20250218111017.491719-1-aik@amd.com>
 <20250218111017.491719-13-aik@amd.com>
 <20250218141634.GI3696814@ziepe.ca>
 <340d8dba-1b09-4875-8604-cd9f66ca1407@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <340d8dba-1b09-4875-8604-cd9f66ca1407@amd.com>

On Wed, Feb 19, 2025 at 10:35:28AM +1100, Alexey Kardashevskiy wrote:

> With in-place conversion, we could map the entire guest once in the HV IOMMU
> and control the Cbit via the guest's IOMMU table (when available). Thanks,

Isn't it more complicated than that? I understood you need to have a
IOPTE boundary in the hypervisor at any point where the guest Cbit
changes - so you can't just dump 1G hypervisor pages to cover the
whole VM, you have to actively resize ioptes?

This was the whole motivation to adding the page size override kernel
command line.

Jason
