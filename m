Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1CE33FE26
	for <linux-coco@lists.linux.dev>; Fri, 10 Apr 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823297; cv=pass; b=J0DSm+L36nKHcZWcffI+kHacTSs/zUZV9Gldnxr+qCERHAo7gpp9h2D3cAVSepaJPb7fLR1YHHEwBbOgQhd1W1oEFRdJIgbB8hkqAKAAHQb2pRAMK2NWCQnIfv2mJiVpGCZVWDKN44Dg8lOiDuEwYAD4/648UCqw/rnAoRkqC8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823297; c=relaxed/simple;
	bh=HZs2dOQHfZyros26cAcHpBbRttnvDk74t3XJQ4JrVHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLQafeAVUcIznQ4EXpcM7AqWU9T2BruhmT9jpKbvYdpWkDnJ0dc9G3Da0H9Y4VlQdiY9ZiHuhUJhrF4QRqu73XVQV3C2GMv/2xuXMgjNdv44HmkdM2EjnZxQhDvqE7hy8ETIj+wUx5E14xphxRI4S+av7klnsvmGL5qvodYoVHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tagehaz9; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tagehaz9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66bb4d4fcb4so3889133a12.2
        for <linux-coco@lists.linux.dev>; Fri, 10 Apr 2026 05:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775823295; cv=none;
        d=google.com; s=arc-20240605;
        b=Whw0dYWp7zioDkeGUV2V7FM6ul0j9Hb5A0VXImFwkUJFZfFBzqFW5Jiu9De+lCCpY1
         hGdz/juNb0Us3HahvGjDkf377m9vT0H4+kdag+Zn3zwYy0bJMKP+0Io0t2rV2s48qIKM
         UB+279E0ly6fWshOFmvpL1nFdxfedKA2wuDctfqHycZDLOBN3QGVXkiUf21KT2lOeCHI
         F0Cuqr3fjBsoK4wN8jZJzMXpVocrlhugvyre9+THYPMpwNTjITfIj5eZb+9FCxrbcyXp
         DzFpBzxFvYstjCCf5Pen3q+PDcpK7JqkWE+vPuDjsL0AHGaQ+sc/ymHGev4As+TQHSpp
         iCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7jIY/1++oar4yAYBTP2iQ0v5rOvIuL4pDsKGubLCfjE=;
        fh=RqXt0Uh5SiT2We/qa5uZNTiD3VaN7bemteh0DEvaT3I=;
        b=Gw9NA8224sVlWOI9VTk7P041FU0iKjNC5H6sXvjyI+S3HPU5+wrF32Ny/IMyWcl656
         7ta3oyBdmcjDUI7RvdhxcTwJJOITUexRvhAsQN2az2fgnbr3CI4Cjeh0keTReurbgH6e
         yBpZz93WxG64KArvkAnfUnG3JRoxidgS8KPyJIFV6WP8YJrRKn0K0gw05nnqQE8ZUnE/
         +r2JZKQi+/Nx8U4XSt+1VV9mhu4NHHlngcicnfpJSqn6UVdCqaOVt0pEeymrkcdXY2G2
         yl7Husepnj+lVHRDMyLyz8vkM9Q95YbY0VAolTwHJlwHQqb9daRf43qXN1umAy+TLVnT
         Xqww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775823295; x=1776428095; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7jIY/1++oar4yAYBTP2iQ0v5rOvIuL4pDsKGubLCfjE=;
        b=Tagehaz9HlME4u20P+H5W4mlkfgoLMPA0fEQbiheix5b0lmJbAZ77wo02Ksz0a6CRf
         YVu6pS8gtw+XXobjbBrfRhyAAgbUDmRfmmjiXz4mcLPGDjhz2eKYk1t0dbrVe2DTVy2T
         GQC1v44EG1KeVfPMQSLi5jdl3U2O+9oszp5VcWt6NGOMz00ilVT9wopLouuuuGcgaQRc
         DIgTdzmbXTWb9PLXkTGFiFfrv18bZ+GjkOzdARvaevzO6+OxzEUrrDTWz9tZIOhc8hR6
         ke/r9Pe5acRWrPoUG6H64Zj1cgMOStK1LNTku1RvcCO9oft0UiGilRPSxXeVi5G4zuGI
         bFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823295; x=1776428095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jIY/1++oar4yAYBTP2iQ0v5rOvIuL4pDsKGubLCfjE=;
        b=Ya36M2jytQ35Gx6j1V9ysAYEaS5d/KZnxkTFkME9iINC10l+Abo1Gxd+cXyWbZsSZb
         BXXjma7SqmQYYBvc7Pqd2PljB2U8/1Y4wGN3Y/JhUOYePXhLlXSN4LN/ebRZ2JD9buvv
         KnCQd6f37ialFGNdoDJxfN+GQGaaVfQcL+8O9x6CXHzvPZqFwN+t+NYbhGlm/XLXfzGD
         KTIzR7L31jjuV1c03TfEbbGn179IM711Z69fOPUB82c2jhzh6VinfdNckYM4Lez5sQdK
         tVaJC8UjmBjNf3wPCBqZLrNKyxQsMix9tVD4JhqU1Ld/G7RY+W8v3cUBoRSUsJtVqvxH
         X3bA==
X-Forwarded-Encrypted: i=1; AJvYcCXlkgMKyHKFYZJObkMi2KlZ1QBMRa59SRchoId3PUm/3C7YdJAGhtFrZQKqhI+l1q1wa71vJqImXK/A@lists.linux.dev
X-Gm-Message-State: AOJu0YzBtzUVONFP5MuSfuyF/9mV2U37JM+Els/WLUIKzJbSwukDoC1f
	RI+6482dizNKiKJ2uj+GIS23HAJ/EeMibr1B0+bhnkf6EhMkHWG/aWk7MvZgp9Z8CyEaNMzRFyP
	h0HXwd9btcCLjG74MTzTbmS67f8o5RqjIAmqDfiWgWA==
X-Gm-Gg: AeBDiet3n+UN1ci9frKVclzGCom7UWnlW0m0V2aFDkLKmwghFIPskr08N6mPT79azfC
	EWbCIz5OEkJw6Ki+nK6Xg1ncT9OlJlrET/IwYDmIIuHgA4UfgqpMlERaoBhbgqcCenw9llPbZf4
	nCnSTdFvCMA0UlzPy/PLYW51SndnVSi5gd4pBE0c443aGZpDZFsuC2s4PZWNKj+dSWGuVrPDkB5
	vmvgNUXKMBu5qbioxl1KnNpuYSJ/hsNNvWWhcOniu1Qm6HOcrY4soRIkYiv+fZMcRkFfmR+R6Cd
	4bLc+U3MzR2nOufZvJA0uph6OFKa2yahX9vMItw=
X-Received: by 2002:a17:907:e102:b0:b83:95c8:15d0 with SMTP id
 a640c23a62f3a-b9d7279bb78mr130310166b.52.1775823294707; Fri, 10 Apr 2026
 05:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407092617.635223-1-jiri@resnulli.us>
In-Reply-To: <20260407092617.635223-1-jiri@resnulli.us>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 10 Apr 2026 17:44:43 +0530
X-Gm-Features: AQROBzADFveULcyZjtNgjI9rBi4aeeX0JzC3AEXYi9kt8DQW2Z9q1-iXZwCoelw
Message-ID: <CAO_48GFt21rv0PJd2Csa0O4OEpN053_p__4Zux+m7jQdHSagEg@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: heaps: system: document system_cc_shared heap
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Jiri,

On Tue, 7 Apr 2026 at 14:56, Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Document the system_cc_shared dma-buf heap that was introduced
> recently. Describe its purpose, availability conditions and
> relation to confidential computing VMs.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> Reviewed-by: T.J.Mercier <tjmercier@google.com>

Thank you for the patch!

Marek: Since you're taking the dependent patches through your tree,
could you please use:
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

and take this as well?

Thanks and Best regards,
Sumit.
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
> index 05445c83b79a..f56b743cdb36 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -16,6 +16,13 @@ following heaps:
>
>   - The ``system`` heap allocates virtually contiguous, cacheable, buffers.
>
> + - The ``system_cc_shared`` heap allocates virtually contiguous, cacheable,
> +   buffers using shared (decrypted) memory. It is only present on
> +   confidential computing (CoCo) VMs where memory encryption is active
> +   (e.g., AMD SEV, Intel TDX). The allocated pages have the encryption
> +   bit cleared, making them accessible for device DMA without TDISP
> +   support. On non-CoCo VM configurations, this heap is not registered.
> +
>   - The ``default_cma_region`` heap allocates physically contiguous,
>     cacheable, buffers. Only present if a CMA region is present. Such a
>     region is usually created either through the kernel commandline
> --
> 2.51.1
>
