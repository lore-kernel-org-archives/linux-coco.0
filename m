Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94F296BD2
	for <linux-coco@lists.linux.dev>; Thu, 12 Feb 2026 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900773; cv=none; b=SFMxVuBrrEo38ieS9KhVjnCSRa0aA9Y+VB1km9IEl24l9bcW+rG2HzBQ1sgrsSBqbmhC0oB1IQgmPZ/LHHIJ+3YUSMGq4eVXci8ks+wsRBzmJxXrRpDehJRhDd850wap1YGpcjLxqQiH8rQQCyB6VdO3vY52xKqLkd6b0EQ+y90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900773; c=relaxed/simple;
	bh=A6eR9jmubTwZTsglZ3EF+v1WhQDWA7ai1B1AUDDvFE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEbaGyICptnfrFDU3RkSzYqxUzI6erUN4cTHRs4PtHxVCwPoOVh+b1FTgQpynfc9V60gxq+HjwyN385bMocrqnW5Gp8rWIpnzpg2gFjltLNiz3qWEVACmesonnvjW9G1RU05FNHLTJ7NjUah3C0DqWr73VzBOff7XNtVHC7zioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Q6zuLI7q; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Q6zuLI7q"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee0291921so62201605e9.3
        for <linux-coco@lists.linux.dev>; Thu, 12 Feb 2026 04:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770900768; x=1771505568; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Kxk/oZj66kgQZma0vQzJuBIOHCjFotulhU3mIzhZds=;
        b=Q6zuLI7qUd5eDvN5zNwwv8sFRp6BdCwZZ8Ou1tzA2UOcWmz+3gRvQhaTHkIV62EidA
         tEjtoSg/m/JlnX4f+hn1iBF9HVIK60p5r0bGCi+pRh3DlghrV9bsLTbYv79Ly/nY1O4Z
         WAZI+doHT0/CC4KfymqKkubgdsd7xkXCmne9pxEC57pq4qB6pT0xTmPFDCCpA04fKDZu
         Sexrz7p8hpU/due9IHiuLtYWN6Wz4mrFhTn7gt8HeUyCM4plNYILUwE0FReo4+/ehLGk
         quMOhRfFBfFlBbgRzy5AIxkq8HjFaMb+jefCrCX1Z7QTqyd5901MGYcvKaOO1S+8P6fg
         D68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770900768; x=1771505568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Kxk/oZj66kgQZma0vQzJuBIOHCjFotulhU3mIzhZds=;
        b=o+rIR+MoNbr5Y62qoMXZplCvvvj2rgxxTJsYmZk5iD0VRT0v0PlSyeRDU2pKvrbxm7
         0Tey0zpstb3515Lpednp4WY+flTQwn5TJAq46A2KhK8h4zhqxqKzQK6Btjq4xc7MxmHe
         Pb0iLtlRlynn8ARxRNHbIs+Cypd0N+Rw58Yl0Aw16ZRQE2GDa8vZpHS9jz38n9cZlyUx
         8A4MI7x9+Td45DLm53ntjdlblTpK3IpReDsUQURrti0OTmwvseNazuFEIioSZLb/4RGl
         v1Zh/Rf0k2ihIaJzMl2WTAQl89cLzNgAQMKo8Hddrh3vyB5eHu+R7Bw2ehRKAScjjuyT
         zsEg==
X-Forwarded-Encrypted: i=1; AJvYcCXd0hBVuPIuFiqFqkB2eNOEbXuTyyNX0+YzVY8jf6CnLJNlNbOQPSXVppDiueB4Gnmb1NCBKQ5n7Lhb@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+btNnZklg54tvTjqHtiu+W2k1UjuwtD6+jci3R+PHWPZqeIjx
	xLkjhBwdPcVcyygCmj6jFK/SuzOmPLb+wBXjPkbLgJmii2C00rJhsoPZDr9MA3iXwNI=
X-Gm-Gg: AZuq6aIhxgZPnMxE03WuMT9zDYPd4/2vlmf8/W+2zal/ZPaKEUY8n43duWJbAZQzLo7
	WTbcloTeVaQNUbuIb9bODwoX9UHFhWX4BWs5rsuuCxS/6nzWk6EMCE3NirnIY3V5JvkcQzO9K5C
	xbqcALfyhwNwjPDK+zIQDFQQbWtExMnuJGGq27E1RDgBQzRbDhsaQ0lObhNvl2tKGepbS1skAfr
	KfhBFUzbhNTMLLBQE9bHzP/J8iHXxXtTJvwbgAKNnDl7ByhtlOX7g2Ie1k2wLR/lQlxoIqg9dR4
	6TDMcUHf36bcQSySs1KBomAe8ZWm0+L781Map8wjcSeFwtWgqB7RoufeGsJcej8UtXYZwtFud28
	32zOK25hqE/gt5uZKdHOZaWtwQ2ZXJmylXfyZLLlg+OdqRowJchmXCleqxKhVL9W9eQZuXXKKGb
	j7DxDGAXjukOQHyEVAtxd3Fr9SuKsvRMs=
X-Received: by 2002:a05:600c:348d:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-48365716704mr34218785e9.28.1770900768396;
        Thu, 12 Feb 2026 04:52:48 -0800 (PST)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835ba7b8d9sm40786535e9.15.2026.02.12.04.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:52:47 -0800 (PST)
Date: Thu, 12 Feb 2026 13:52:44 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, 
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/5] dma-mapping: avoid random addr value print out on
 error path
Message-ID: <magsa5bqxraftni5z7ixrwfojh3htpws7bhiebj4rdtqn4ewce@rnf2rzfelqim>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <CGME20260209153816eucas1p22befaa2c5ef3c6d5e67956eea08424ed@eucas1p2.samsung.com>
 <20260209153809.250835-2-jiri@resnulli.us>
 <621783e8-d77d-4f29-bda0-ef487dd27b5b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <621783e8-d77d-4f29-bda0-ef487dd27b5b@samsung.com>

Thu, Feb 12, 2026 at 12:03:49PM +0100, m.szyprowski@samsung.com wrote:
>On 09.02.2026 16:38, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> dma_addr is unitialized in dma_direct_map_phys() when swiotlb is forced
>> and DMA_ATTR_MMIO is set which leads to random value print out in
>> warning. Fix that by just returning DMA_MAPPING_ERROR.
>>
>> Fixes: e53d29f957b3 ("dma-mapping: convert dma_direct_*map_page to be phys_addr_t based")
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>I will take this patch when v7.0-rc1 is out, as this fix definitely has 
>to be applied regardless of the discussion about the remaining patches.

Makes sense. Thanks!
