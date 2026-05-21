Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F0A3812DE
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383187; cv=pass; b=HDj+SNX7mkrEaz+4LwnMn5QIjxxJXrIbA/k6I0uMouZiU0vg116sN2ibtPhjox+IvvnzS1EKXa473nWr4PfE6ra/ogjlROsy+MQie6cvfgTtNeBnzOQmVcQWpW0TqeQjoitcxFQwwOf4c4jjFFBNRQ5du8JyS3xW/0PFVUWzMjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383187; c=relaxed/simple;
	bh=6ScDZWa+hTLOkHKii79L+YYLthbYhtQWZThvRzyqBN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BU3ewXSJ5tXSMZCERWgtqywp/RuWt6GXnm5H9Tq0H0TAFlk8vxxaW0CGHnlwAqM4yyRQ2O7hOjL01q6e90Je4S67KXLj81MGR8PiGAqE5Cs9vn7eRFp/Kc6Q/x3A9RHnDdb+SyIGPkPFLeRbhjkLgDeJUW5e9/YbfK9yvxkI8Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WdB5K6RR; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WdB5K6RR"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50e61648f10so15521cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 10:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779383185; cv=none;
        d=google.com; s=arc-20240605;
        b=ae3mrsnONJv9V5Ktc0h+GZNHJJlBT4IpOOrcgzhGn3TbclafjuKl10NcvRYBqMOmBj
         VnEl+xAHWkWo4Nf09Y/HScXFr8WuVjLKMY/EejjIiYY6SSc+S00yTGOGBQf83ivgYWqF
         jq2heuVFKk3Um48FhcXpIbUP6AyxuatZEwqVHcqQNX7W8pwQlEVIdyHESU5K6wlAGlp2
         EtCF4EqwL4C+VNO9H1n5510hCx4xhYhJSMdgCdeSRYjY+VRAr0HG5gAxvs2vwQlIsHEC
         j+bO1f2h2wfe+lbYTME0/mhY6/fBJQ6o0IM1wHxxwkhsTQcCtOg1+c75M7ydsg4B5QMA
         Oc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhUoyYsFnF9za8i7wBF/DE6TJUENWY+2L07rfya+Q9g=;
        fh=zsJEtXYxCaYN4Tb5urZdkbbw0skoxtNcFKV+w3sYfAI=;
        b=UX8zJTJIWzQMeomWyzyBq8EGszdq5pxkalKuhbfic3LJx37UK59FFderZ2v3Kd1yL4
         SXeUh/PC9RADQKoIhacr0IV55ARjrLFwxG3fmKqewbuO7orq+N0+zcM5EpbL7emoCwne
         ouaKfNeQp8ALek+P3KXNQowtvRouaNsLsRv4qmfVNEGVJp6rlfmxmM9clSIFP3wb7wQl
         cluGwSqufoNbn2bLUdxhhtHBebfn8Xl7u2rOT6vXwHsagVcdr+HQvFLd8j+2pAh9C5tQ
         w7Tpf5pXCjzIPWWubqwUXjxLZCjGzPUi8ojXbsgqaHbE8AfdQqW4rUnXFGRcDSIttB0j
         Go1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779383185; x=1779987985; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhUoyYsFnF9za8i7wBF/DE6TJUENWY+2L07rfya+Q9g=;
        b=WdB5K6RR4RNrPWHHViJrO9kOcOYmVXhO79WMu7s4BOT3zpytaDTNEmG5hoaIBJpKV0
         oDa5cmBrpUs+E146fwlhW+DJREKDyfwytdA/X2eRa8/qk5/apBWRUIy71+Ea71J6yYi6
         Pa9zDBp/qpzSE/RxAxWaXwBIvV8z2+Ki0QYLSn9aCvjiBKvVpDX4Wtuy0HPzC1IVbG0r
         bQ9NdCIaMvxvPGRBHXJtI5UStOFk7yYZhgK8YIT+DrXOAEM9FL3IqudpdEoebCLxxtSF
         yBTXVEYiL0awE9KuhtMptX3kxPDwvpCE7GW/BVedLFBMCcw5NLn/1QPWMVt2v7QGBI7K
         enUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383185; x=1779987985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhUoyYsFnF9za8i7wBF/DE6TJUENWY+2L07rfya+Q9g=;
        b=egn1IhsEK5WMfwhTlhKKtmD+nzpGfhaAGIs/IR/xXD9itktOMUFJhg9TASxekDFzEu
         5XY1tqZKQ2ru5v2yon61BqFax1DleNnDCWlwOBV2BcWcAAR3/aH//7hvSqt35kiLLU0W
         NZ+mupUzoLbIniclsKkJ3qEPHKyUwEGeFPVd5fa6WIMqfyE2EYYs81amyz9BvVKiVb8T
         7cgidtbBsYWeRTiyahS5P/JoFgNwlXt+MMoJeD5KHXc+2zY7UTbYRVcJEEvB+y5tcZV6
         fqjK6sYUrlv+0m1/w9J5IQILjyLn04NF6kz+BrcwyyMCVlwSdJiCAI/on8rlWr1uLJc3
         FYyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gGOWyh4bp+w+u6GSIPSEI35Pc8k142bafm1lYrqj7uoxYU+rARnev+ZGEKhWOfIeIidNZj3Jele6b@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi9sXl2TZIiSpOnTX31khnASNEoPT9wClaPM9DedPLyULL6nm8
	QSTYhmEnI0cyusvkRcuwETue0/hqDA4n9s3B+G23DM7C4wJV18SGOuyr/V2ctR6MxCU1GB344hK
	iajgjKz8SGHw5FfQCZvjcUa8GApoxyHwrECI0bkju
X-Gm-Gg: Acq92OFwWrdGrAFbIPmagU01RjFCFoCwr1qabxNk/oKKL05d78amoPIXFg+wVuZA+8C
	bSePonoJ2E89HdpF5Eox7uBZP7IhYC3iIhoMO/Gb25rSrXr9UFViNfYIII8p1PQuYbmaq5sTxvz
	qWEm823tH55wFCMP8oD9Ef2JlTiIw9BX6BpGJjcsa++HciXS3WISfAnamd42y46BMaCu7TmYNPA
	lW0s70nN7CsC00vkQItDzlFQ6trGfRbpAyfCPOvtzlRx7PloN2Nrs/pWDb7eMyQxixCWBW2Y0mT
	rgDi8PzvMXVcIqC5h8Ig5jNntJa2yFU70Tzs/tYbTKzbnRlvLc/w
X-Received: by 2002:a05:622a:130d:b0:516:3def:1cf4 with SMTP id
 d75a77b69052e-516c52f91damr11257861cf.1.1779383184387; Thu, 21 May 2026
 10:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512090408.794195-1-aneesh.kumar@kernel.org> <20260512090408.794195-5-aneesh.kumar@kernel.org>
In-Reply-To: <20260512090408.794195-5-aneesh.kumar@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 21 May 2026 18:06:09 +0100
X-Gm-Features: AVHnY4ISudxxSxVvcLPDn4R1NI9d_Ojyz-0XSa_zA0I3j6uTkfH8ncuvoLHXOtc
Message-ID: <CAFgf54o4ZnvnJ3369bHb10tvJJVP+5YWq=ec4Jh5K6S6U9uNEA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>, Petr Tesarik <ptesarik@suse.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 10:05=E2=80=AFAM Aneesh Kumar K.V (Arm)
<aneesh.kumar@kernel.org> wrote:
> @@ -1411,6 +1436,16 @@ phys_addr_t swiotlb_tbl_map_single(struct device *=
dev, phys_addr_t orig_addr,
>         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>                 pr_warn_once("Memory encryption is active and system is u=
sing DMA bounce buffers\n");
>
> +       /*
> +        * if we are trying to swiotlb map a decrypted paddr or the paddr=
 is encrypted
> +        * but the device is forcing decryption, use decrypted io_tlb_mem
> +        */
> +       if ((attrs & DMA_ATTR_CC_SHARED) || force_dma_unencrypted(dev))

I don't think swiotlb needs to know about force_dma_unencrypted(), the
dma/direct caller should have all the information to pass the
appropriate flags.

Thanks.
Mostafa

> +               require_decrypted =3D true;
> +
> +       if (require_decrypted !=3D mem->unencrypted)
> +               return (phys_addr_t)DMA_MAPPING_ERROR;
> +
