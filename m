Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E132EB5D4
	for <linux-coco@lists.linux.dev>; Mon, 15 Sep 2025 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757925394; cv=none; b=hMjRKgdcdWorOv6ysDad/8XjZ9gyZ9ooOR2qT8u7snG7pxVe91cw/b66tGCHTKP3GPouyr6oMBcuEgetB2FS4IB57QCVMZtEhacKnvczsCUz8Fef5VQtF657MxdR0eDg7lfEzi+RzgHBGJnmZ3bl5L/jasLQzboNhdpRW2N2COA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757925394; c=relaxed/simple;
	bh=oTUc05uAoj8tDOxyEV34nE5zIEyVRYInAxKt2au/nUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6E8TAtA65bqfaViGryqbc3nCw1/6V411wP7qpQEVznpX/KpGaX97GtUG0Lie0w/B1WG+NuO5qIbC1ipgPFvt9wH1VSqbNfpMSOAcn7rHcY6qNFqrfmzWpkz0QhAlV7SAFtz/MTy56sgGlCVo97rEQU1zyGjxJ+KS93FTaw3chc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s17LM0al; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s17LM0al"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45f30011eceso8605e9.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Sep 2025 01:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757925391; x=1758530191; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uuG6t3iAuSKi0EnadmhBvC3rHWT3Byv2xYmpCXcLPYA=;
        b=s17LM0alBJ7e9+Eodjpi8VJfsgc2oH+3DwdHDf34CNMSKKlmalpNYsUfQX3oDFZ7g2
         wVlODOSTt8aj3v+xPKNXBQj3k+uMv0mGXbeogUZ+fw1iWvACZAnksdQOCUtrShi8Smhm
         uRffPCq9LyrZA6sCc5QVf3OM5u+KCRw4kggTUeP1yZ0zQhYkrc0oriCs115e9UYRGvDq
         MTTXrZ14f2K42OuReqYfPiAh52Y2nEdpqSGHxs8r8f0+qM7lV8EDFkTFWH+0ljS6V3LH
         l0QXjK6Ny4u/pYSiNzci8TE4b+7btCnjl73XXBB4HBLMT+4K7t7H3C6n/HsGjk9SWx70
         ZP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925391; x=1758530191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuG6t3iAuSKi0EnadmhBvC3rHWT3Byv2xYmpCXcLPYA=;
        b=ZXXkDFr94ELop5Pe7Hnrnj2e5UXLWOKNWWum0ToVmkWHQkcfYoUT0QvmTpF+/yJghw
         S1e+9c/m4fRvvoxlBTZiIJNgm6j5YDKH6pdBNz/lo1LgH2GSdBu44zjwOJq8l19wHWIO
         5WFJhIq46AkO6mpSy+OPjDLsn9dJd2UHQcv8ObDiCPRPynvZBA3CxenMk6kKMUv1+XRY
         bmOWjCSyZLJcYnSaKSh1BehC+Qns5ldzxLScbKuYJ0UUrxuAo3WNfxib44hcdwg8nU8Y
         +B+LPJ3R23UDp4hjf9RFfbJ9wnn/LZhtrNYJynZu3YRFFM25/bntLYvRmz+n8x7Fo4JZ
         LTbg==
X-Gm-Message-State: AOJu0Yxc2UG3jeIPdvFUf3k/LkM+wTDKnW1+/mlfnyA4u0OnAhhMuRad
	23TIEG5enXMt4LJ6pXD0vz0KX3n5mqe/qeSE5SXP/2UZMU52O8z52xbxM5609owm7A==
X-Gm-Gg: ASbGncsaPg+2IgXT8ds8roERVj2zND24UxWgSXL0SbyO1uIlbZSwSuk9kSK2ob4Eu4Y
	7Z0yipKQpqTQ4JA7hm0KpQqqgD2cMV5R+BDfQUA/WeJPP7ldN4ns04pnbF8TqSBJtkYLGQQ5q3Y
	0zKic94+BWDaOHBev46CUFaZkOsDt1Fx5ZWQICnuwGAYwKyrkni3oHQpDJC2OwFYE6eHheWHhCi
	RyrBJPcOFNWhkLKN9VPUe8nDF1JqpnCtDKmpvSK6JR2z3KuYuUtr3kEJaouhRRu3PYtGp76CccP
	GLGJ5tO+QKoz9gNk/YVdsATAoa7qoyfPMePK1+rCxSZXGBIL3+A2GWoiS0om0aeIJ2fpp4xkAwX
	wOrJ1N2MLQ5NnQQu8QtrbrFg04VxeiCHSYKZtDNMKy9u3G7PxwAN6Wle7b2FsJfYxXJdmAg==
X-Google-Smtp-Source: AGHT+IGhw7FjFgBAENHxwqNBn+q5TwhC7OvA4GcuoSnWIVBJGcdJW/TW82vig7dbFCs8/b6w3sEoaQ==
X-Received: by 2002:a05:600c:a10c:b0:45f:2db6:5202 with SMTP id 5b1f17b1804b1-45f2db65722mr740645e9.3.1757925390598;
        Mon, 15 Sep 2025 01:36:30 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ebc49f7ebbsm397501f8f.51.2025.09.15.01.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:36:30 -0700 (PDT)
Date: Mon, 15 Sep 2025 08:36:26 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 04/38] tsm: Support DMA Allocation from private
 memory
Message-ID: <aMfQCoLuVeR0nf02@google.com>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-5-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728135216.48084-5-aneesh.kumar@kernel.org>

Hi Aneesh,

On Mon, Jul 28, 2025 at 07:21:41PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Currently, we enforce the use of bounce buffers to ensure that memory
> accessed by non-secure devices is explicitly shared with the host [1].
> However, for secure devices, this approach must be avoided.


Sorry this might be a basic question, I just started looking into this.
I see that “force_dma_unencrypted” and “is_swiotlb_force_bounce” are only
used from DMA-direct, but it seems in your case it involves an IOMMU.
How does it influence bouncing in that case?

Thanks,
Mostafa

> 
> To achieve this, we introduce a device flag that controls whether a
> bounce buffer allocation is required for the device. Additionally, this flag is
> used to manage the top IPA bit assignment for setting up
> protected/unprotected IPA aliases.
> 
> [1] commit fbf979a01375 ("arm64: Enforce bounce buffers for realm DMA")
> 
> based on changes from Alexey Kardashevskiy <aik@amd.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/include/asm/mem_encrypt.h |  6 +-----
>  arch/arm64/mm/mem_encrypt.c          | 10 ++++++++++
>  drivers/pci/tsm.c                    |  6 ++++++
>  include/linux/device.h               |  1 +
>  include/linux/swiotlb.h              |  4 ++++
>  5 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
> index 314b2b52025f..d77c10cd5b79 100644
> --- a/arch/arm64/include/asm/mem_encrypt.h
> +++ b/arch/arm64/include/asm/mem_encrypt.h
> @@ -15,14 +15,10 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
>  
>  int set_memory_encrypted(unsigned long addr, int numpages);
>  int set_memory_decrypted(unsigned long addr, int numpages);
> +bool force_dma_unencrypted(struct device *dev);
>  
>  int realm_register_memory_enc_ops(void);
>  
> -static inline bool force_dma_unencrypted(struct device *dev)
> -{
> -	return is_realm_world();
> -}
> -
>  /*
>   * For Arm CCA guests, canonical addresses are "encrypted", so no changes
>   * required for dma_addr_encrypted().
> diff --git a/arch/arm64/mm/mem_encrypt.c b/arch/arm64/mm/mem_encrypt.c
> index ee3c0ab04384..279696a8af3f 100644
> --- a/arch/arm64/mm/mem_encrypt.c
> +++ b/arch/arm64/mm/mem_encrypt.c
> @@ -17,6 +17,7 @@
>  #include <linux/compiler.h>
>  #include <linux/err.h>
>  #include <linux/mm.h>
> +#include <linux/device.h>
>  
>  #include <asm/mem_encrypt.h>
>  
> @@ -48,3 +49,12 @@ int set_memory_decrypted(unsigned long addr, int numpages)
>  	return crypt_ops->decrypt(addr, numpages);
>  }
>  EXPORT_SYMBOL_GPL(set_memory_decrypted);
> +
> +bool force_dma_unencrypted(struct device *dev)
> +{
> +	if (dev->tdi_enabled)
> +		return false;
> +
> +	return is_realm_world();
> +}
> +EXPORT_SYMBOL_GPL(force_dma_unencrypted);
> diff --git a/drivers/pci/tsm.c b/drivers/pci/tsm.c
> index e4a3b5b37939..60f50d57a725 100644
> --- a/drivers/pci/tsm.c
> +++ b/drivers/pci/tsm.c
> @@ -120,6 +120,7 @@ static int pci_tsm_disconnect(struct pci_dev *pdev)
>  
>  	tsm_ops->disconnect(pdev);
>  	tsm->state = PCI_TSM_INIT;
> +	pdev->dev.tdi_enabled = false;
>  
>  	return 0;
>  }
> @@ -199,6 +200,8 @@ static int pci_tsm_accept(struct pci_dev *pdev)
>  	if (rc)
>  		return rc;
>  	tsm->state = PCI_TSM_ACCEPT;
> +	pdev->dev.tdi_enabled = true;
> +
>  	return 0;
>  }
>  
> @@ -557,6 +560,9 @@ static void __pci_tsm_init(struct pci_dev *pdev)
>  	default:
>  		break;
>  	}
> +
> +	/* FIXME!! should this be default true and switch to false for TEE capable device */
> +	pdev->dev.tdi_enabled = false;
>  }
>  
>  void pci_tsm_init(struct pci_dev *pdev)
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 4940db137fff..d62e0dd9d8ee 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -688,6 +688,7 @@ struct device {
>  #ifdef CONFIG_IOMMU_DMA
>  	bool			dma_iommu:1;
>  #endif
> +	bool			tdi_enabled:1;
>  };
>  
>  /**
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3dae0f592063..61e7cff7768b 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -173,6 +173,10 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
>  {
>  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  
> +	if (dev->tdi_enabled) {
> +		dev_warn_once(dev, "(TIO) Disable SWIOTLB");
> +		return false;
> +	}
>  	return mem && mem->force_bounce;
>  }
>  
> -- 
> 2.43.0
> 
