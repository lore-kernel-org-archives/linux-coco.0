Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F4619CC1C
	for <linux-coco@lists.linux.dev>; Mon,  2 Sep 2024 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725304128; cv=none; b=LjpIEm5uI9pvEt5fqO3PRfG/9iR4Lg22l6Li9nMJdW7Ju/63JofA/vN2nleBthytsn9V3X6s0C8DEi+DswNyqh3jNNPa0s/ZJ5cZ9Qb3EfmtZtGzb7y1i2jhOmVRW+rr73oPcUuZBj2M2UcjWjpKxq6w892JO6n5ZzhCvXAyfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725304128; c=relaxed/simple;
	bh=FoaQtGm07JmrjDjFVuUD/T8qJ+x/b1dHPZCSDblAbJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5dl5jcEt4jrnwxUDZLOA7sxBTFe6GuaJUUg9nGE7BN2at6MEkyJd8zl7ug6bOf5O2ael38S9pkUC/ARtwfLUhGk/NEcZ6uWzReBAbx7Sf+gEywVGhI0jYIUaOyihPks3mxjC6HjnllcU+dSYL92VK6bgwcQeUhXHl2C9A03bwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224DFC4CEC2;
	Mon,  2 Sep 2024 19:08:46 +0000 (UTC)
Date: Mon, 2 Sep 2024 20:08:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 5/7] arm64: mm: Add confidential computing hook to
 ioremap_prot()
Message-ID: <ZtYNPQnP5_YEiLy5@arm.com>
References: <20240830130150.8568-1-will@kernel.org>
 <20240830130150.8568-6-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830130150.8568-6-will@kernel.org>

On Fri, Aug 30, 2024 at 02:01:48PM +0100, Will Deacon wrote:
> @@ -16,7 +28,16 @@ void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
>  	if (WARN_ON(pfn_is_map_memory(__phys_to_pfn(phys_addr))))
>  		return NULL;
>  
> -	return generic_ioremap_prot(phys_addr, size, __pgprot(prot));
> +	/*
> +	 * If a hook is registered (e.g. for confidential computing
> +	 * purposes), call that now and barf if it fails.
> +	 */
> +	if (unlikely(ioremap_prot_hook) &&
> +	    WARN_ON(ioremap_prot_hook(phys_addr, size, &pgprot))) {
> +		return NULL;
> +	}
> +
> +	return generic_ioremap_prot(phys_addr, size, pgprot);
>  }
>  EXPORT_SYMBOL(ioremap_prot);

I mentioned on the CCA series, the patch is all good but we may need
something similar for io_remap_pfn_range() which uses
pgprot_decrypted() (I think it mostly matters for the pKVM case).

-- 
Catalin
