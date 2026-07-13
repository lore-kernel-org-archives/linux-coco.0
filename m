Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF94034C981
	for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965278; cv=none; b=hg9315O9STIzJt0NA7gkIhCXo9Ha7cAulWXOQ6cXwZzuGJy5GBT7E4x0aaPZo3N8rWkaJAkUZZjhYJ7XwpGLmizUG5riaHIBtqDd7T+i8G0h+dLnVc2q+7g6XVADEqvNjsXsIKOeIWFlKYSh/jAPgf25izYSoZhA7l+uSx3WNOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965278; c=relaxed/simple;
	bh=K2KZlv8DzBtV03E/TVL3MeUwYAAgOJe/Vo9Rt0OvASs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhxoOuyKKNhiDlOQ983thX5PzKx+Gxu7ghRCInoFWqrQ1xS9PxFP89kW62dhBu34yJBMs6XakmCnw0nK2i4S7PlPwa1yfRJjUtElezkJmOpAlywW+ET2mHJkTzk5bYPnRwL2SRyCORfxx0JXz7F3T+gcVznoyfLBH6pygjIEE5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Dk464SYW; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Dk464SYW"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e50979c71so338135985a.3
        for <linux-coco@lists.linux.dev>; Mon, 13 Jul 2026 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783965275; x=1784570075; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yflr35iQtozkrKsWPSXMB3haiCYqPE+VDxf/660hH9k=;
        b=Dk464SYWGcVYur5g+kJw7Nhz0KXLeuFIO3eMXYpFC0EI27zCiwz8Efb1ytYc42rpVq
         Fj+O/DEh07JtHMwhaIEP+tPP1d1o34c2ki0GHTlDv/4Mxy7x1Hyhp8sE6Pe90gwdQdUH
         3aKMV0IZG5acRB6gkkmJe2QbM/FVPsE2Pizx6lqsB27CSChyjM6nJNeJOQXxGJllKtaG
         c1knT92OC1KBU7prNvxaR1YkUuHRCMBad3cqNyu4DQtqZL9r4ya0uJQch+pkjAB6d85Y
         17fotqiRtTypOAzqVBC5sZhvzo3FVMlg0BcRSPdCrJLx7vaW9sBhguTcwRe0F2L9SaO/
         5nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965275; x=1784570075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yflr35iQtozkrKsWPSXMB3haiCYqPE+VDxf/660hH9k=;
        b=QXnIhK2Q54tHWKVhwOLdK9DCa96iA5D7/5QWllCmTFIpFcCkH7l/nz23NpBPKvrNrH
         X1V8g5XGOVNEgJXRmp0S0+jLubyq7DEbPfVLsaiS4/8HzyLGKaEp5GLR4IRjTpKa76ka
         i/uSyX4gqa1rOQszh5g1/zpx4P98g4tSF/BCB1MIwTIUKF88U0ivJ3nOmrppuWHAVIIl
         1OVJmrxJTM7VNLURKg7darvDLC1P7YAvMNT5yhV6+6KD28hgsyGhnh+v9oK81fXzHcg2
         tR0oAZ729t85/2CuZHm6XoJZzcBjCxH1rQAqO2juGSpSoxy1F9R8gEn9RbpDefXOX7Gz
         6vaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoufGVpOJNQpv4Jx66w5OGQaCwjea9QGEieeiepDuLMCrOc47/BR591iuUbEsWIx/bylS3Tj2gwxKgt@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6aQiP+Vyt+5/C76QeksJzc/IC9jhEuIJ6UppBNqvggbTqip7v
	IgYwBFuEYtCtcpp2UVupr0KtnmY7CD16CG/4fNJXaeNKPjUWIbZ/vDaC7ELVehbblSU=
X-Gm-Gg: AfdE7clUzzRHxieDFRz3rFJmhW0hTurIiQyR5pNRMMRs33ma0t0pP/bKvftD6wa3rIF
	9Xl30JHH2bxxSuaHHq1fjhFDLPTD/cOtFkXk/LweIw3t3j3//ipGHjCfFThApcGT3hijsF7+zgJ
	jmIGLd9+z/wL0HR6M3XmxCjlrMWzb5YUOHYlASj1r52CLuqtG/eCZCwE8e7VsWt6MAZqEsaHf1w
	Dpprzw2Vy8Sw8H+zdLLNz7ll1VH6bmCOONsQ16raHlGsmLlwpCOf7Ucpx7Qeqbg8jLqRQlHRJYg
	Usn7NmTnVSvNshnGUmre4tjUWveCo0etTo3qVJnp2uFLVS2Rl+wYsMW8qj3GrA7lTMdValL2ISI
	JYS85DzA+TRwEqUNXE9QhFmig3+B3eZxtdaihKZhf7Vbh/6IvPvcpAcbQMd0f
X-Received: by 2002:a05:620a:469e:b0:915:94f7:55df with SMTP id af79cd13be357-92ef2bd609cmr983527785a.20.1783965274729;
        Mon, 13 Jul 2026 10:54:34 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cfdf6fsm1229104285a.24.2026.07.13.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:54:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjKrR-0000000DwzJ-2as1;
	Mon, 13 Jul 2026 14:54:33 -0300
Date: Mon, 13 Jul 2026 14:54:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 02/22] dma-pool: fix page leak in atomic_pool_expand()
 cleanup
Message-ID: <20260713175433.GI3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-3-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-3-aneesh.kumar@kernel.org>

On Wed, Jul 01, 2026 at 11:19:06AM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -115,8 +116,10 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	 */
>  	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
>  				   1 << order);
> -	if (ret)
> +	if (ret) {
> +		leak_pages = true;
>  		goto remove_mapping;
> +	}

Truely these _set_memory_decrypted() things are an insane API. So a if
it fails to decrypt it can be in any messy state?

> @@ -130,14 +133,15 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  				   1 << order);
>  	if (WARN_ON_ONCE(ret)) {
>  		/* Decrypt succeeded but encrypt failed, purposely leak */
> -		goto out;
> +		leak_pages = true;

At least this one makes some sense..

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
