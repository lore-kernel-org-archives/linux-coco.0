Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEBB27465C
	for <linux-coco@lists.linux.dev>; Fri,  9 Jan 2026 02:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767925603; cv=none; b=jMVf3bwQCUym/KsI9wW/1BU5rv6ALK9pyCUiouddf/0r0nt5zEGNIq5+7FBdlNGHxLXSIFQYrOv2MPdz5EGdtfwqktOKgw/ddaZd8jRYIragUMEHcgFZ1fUNjZ3NRTRiG3Z49HQBy4ThZd1WXZPRrx1kcOPHOskZsmFX+nWdLIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767925603; c=relaxed/simple;
	bh=bICa0UIgCGYCc6JTXfytKmfSTVX9ttTHyrHu1U9i12o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6OVwiiNdc4VZ6FcXS3ERf6Dutzxzt7PJLO4be+MVCeABiW5KIdTe6slaTFP75o3yaDdodPERRvy/csQlS8pCBfZbXOtJ/SGFiRP64tdrybPZRtku6HAVlgpPtVd6G3BgHgY9/aNoSW7Qk8259I6XUIUvAXqr+q+qHvUG8F0FZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvJSnTVd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvJSnTVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC163C116C6;
	Fri,  9 Jan 2026 02:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767925602;
	bh=bICa0UIgCGYCc6JTXfytKmfSTVX9ttTHyrHu1U9i12o=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=IvJSnTVdoN8K7B7EREh+oFafqd6H/3J1+x2jSAu7vfShHB3fxjngfyK2NerBxWZlb
	 ymMgNFzlSVK+8uHJ3fzAeYI+/SvV/RgvSf3bc+npMps6o2wHVymAQTY6N8I7aENxFC
	 9pGZOqaAn2AfvygVKsInIoYEh7tC2577kPilYTShDpSYBKtXyP4oGvmbwz52M2K1wa
	 xrBhRKNsDj6IxtVSb/DiqtYMq4YJotnrlrLNkrN5PoPjngVvBf6wAdwF+lr3fiEd1D
	 OYJ0rJslWDHO+bus/n42G+YhYWAcQVyxxDBLjabngjL+XLfkOk4Oc5HcXlpzJHSlH8
	 PCRYOPcxXjGIA==
Date: Thu, 8 Jan 2026 18:26:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Subject: Re: [PATCH] coco/guest: Remove unneeded selection of CRYPTO
Message-ID: <20260109022620.GB2790@sol>
References: <20251204055512.494013-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204055512.494013-1-ebiggers@kernel.org>

On Wed, Dec 03, 2025 at 09:55:12PM -0800, Eric Biggers wrote:
> All that's needed here is CRYPTO_HASH_INFO.  It used to be the case that
> CRYPTO_HASH_INFO was visible only when CRYPTO, but that was fixed by
> commit aacb37f597d0 ("lib/crypto: hash_info: Move hash_info.c into
> lib/crypto/").  Now CRYPTO_HASH_INFO can be selected directly.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/virt/coco/guest/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/virt/coco/guest/Kconfig b/drivers/virt/coco/guest/Kconfig
> index 3d5e1d05bf34..da570dc4bd48 100644
> --- a/drivers/virt/coco/guest/Kconfig
> +++ b/drivers/virt/coco/guest/Kconfig
> @@ -11,7 +11,6 @@ config TSM_REPORTS
>  	tristate
>  
>  config TSM_MEASUREMENTS
>  	select TSM_GUEST
>  	select CRYPTO_HASH_INFO
> -	select CRYPTO
>  	bool
> 

Any interest in applying this patch?

- Eric
