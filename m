Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D48221541
	for <linux-coco@lists.linux.dev>; Wed, 19 Mar 2025 23:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742427866; cv=none; b=nRX4LJtnTF0sZWYUMvn4pRWjqXOoh967aPFcO3FdUD6A0cH0FR0UVn0+3ssiPQgEyRYM9CNqdD+PFspBoX+QdXOASC562XpdCBFP/F7mRT36q072hkMwOUXj3W/SCx8TrA4b7Ly5nhL2pdP6GWpKYAPFv7wGdqdkxyofJ4Et07A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742427866; c=relaxed/simple;
	bh=Vh55jnJy2grFwLLHr52AS9nQQTqMbkRIqCLV5X+4ptc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct1zr52Q6+EOjy2fgI2evU0G3ZCAJDuFB3Ux7JwsPFpSP8YdikWM6mW90YMt/NJHfAvTOPxFcnJjl8zDqBqoqLV2iLXLFoZWOKYTbDP8ATw/piGuOYdeJFueI/elItUIXUz4CQkkHPCidvtGo4J4Ghl+1XEmF6nrST6Jy4DmXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hwvQsBGg; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hwvQsBGg"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4767e969b94so4416361cf.2
        for <linux-coco@lists.linux.dev>; Wed, 19 Mar 2025 16:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742427864; x=1743032664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh55jnJy2grFwLLHr52AS9nQQTqMbkRIqCLV5X+4ptc=;
        b=hwvQsBGg9LwI2c3zzOm7HCeZ8vQAjq2Seerf8ofAstWKj+E870X1+QJqFthzppYibS
         1VcSlAuZ3U+yRoqRJANyUMv4vKMPuhA9Y3WT6ifG98wBgGq378UKOmDZqpFwWOja3GV1
         xgZwJ4HLptEtK1WHq5VUCuDIiz1DG32v9YTcta+qCesDh8r0YTrGRk3cx/WCRL0TUPkZ
         xJLmp1Q2+ZOnLwcjLAmH9QV06R4rjEuPGaBMD+wRSB/0TXHyJoHrWlpy91ByrDXeIehQ
         dyJ5Lbwnq0D5GPZLWyu9sb8XO+rXI5uI6RY3SVldqZznjtWJtqfbvs4DJouQQQwbrF+1
         YB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742427864; x=1743032664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh55jnJy2grFwLLHr52AS9nQQTqMbkRIqCLV5X+4ptc=;
        b=sh+n9NF433oNQitQfn/qzUPMCEHVzjzdYyMnsHBPOHBw3EOQFttCYMAaedjmPtdj0I
         U7GioSTDVhwMePdTqllNoRdkB2xmeEAnyCnuoyKZUyFqcFu7qJzXgKPMcQuItlLggLvC
         rftsnkW6nQ8u9wr6h6XsZCITgYAu1hLvi5dn4jNfmJ6JEQsJKG0W/TN9dU53ELoVbaQF
         Tlzs0y9fwgSEPVPBwxwQoHbimeGueYc25P1bp97lHck1pqUnCz4pI4GkbCQEYTM91xfj
         XRMSpq4wiT+8W2SXnhMaOK9cRx7u0uiNWDTDmXNlvN1AVgZX6tIh7NNTu7q7xwrPpjIA
         Ukog==
X-Forwarded-Encrypted: i=1; AJvYcCXP74dLU6Wt8Ie2ouHXVGwX0wBX1E1zhvjA/dnGWpu07MOuohO41U8Yq3orfIwj6NbJw0W0UXu+XkAR@lists.linux.dev
X-Gm-Message-State: AOJu0YwAHKlP5DoSjxHdXbAfF5C6hOIXewIhseIuL27t/qa2oePp7x7F
	/atBLoCTb4MRUdRSSgktYkR2+6ZDuGFzbTyKPhvXY2srp0C8BAzZDQA39eG1r9s=
X-Gm-Gg: ASbGnctMAnHqYD7sCBssaXuBJkKOOAq12GIx/bS0pesyaM75mvGHbQ6tocpvFJ+qUi8
	ANX7iH9h9QW7j5LPaiK4UryYMMECt/7oCRiMHaLBV5VzfdqDwG2dIrnG5G35ccqh8JCAgjaIMT1
	mK4jZRLhhAsdCeeO0S+AYcJ9EvmWmBhFkvBIE2Hb4Xoyj7LerusyvRlRUNWxv+xRYLsFd9w9bQ4
	VpXdpkeyoQ6Cl0MePwtl53Exnd8r0Mz0rT5Q3ZqfFnK/ZPTZYrt8pwspHRoBdmeG994ai1LNx1M
	S4TSddPNbPpeIJCnOCVX1xWxAsFFiaATeuRW2YJORh4LtrT4w3RyWHr0w56XGA2D5AaNLuLEL1D
	3monytufVUIr/IPK/vQ==
X-Google-Smtp-Source: AGHT+IF+fj9+38BlQ3egRKwX5axqC8Q6Kq8BwaFO1wbsyUuFXTRy7mG60I78Ff7FJGVMt4lfemVaVg==
X-Received: by 2002:a05:622a:410b:b0:476:bb8e:a90e with SMTP id d75a77b69052e-4770839e2f2mr88068521cf.20.1742427864047;
        Wed, 19 Mar 2025 16:44:24 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476bb63cb11sm85166061cf.22.2025.03.19.16.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 16:44:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tv35C-00000000cos-3wix;
	Wed, 19 Mar 2025 20:44:22 -0300
Date: Wed, 19 Mar 2025 20:44:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	linux-integrity@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>,
	Dionna Glaze <dionnaglaze@google.com>, linux-coco@lists.linux.dev,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <20250319234422.GG126678@ziepe.ca>
References: <20250311094225.35129-1-sgarzare@redhat.com>
 <20250311094225.35129-4-sgarzare@redhat.com>
 <e4eeaead-2277-1f6f-86eb-f80deae2135b@amd.com>
 <Z9gm9iWhk5Zs2NvI@kernel.org>
 <CAGxU2F7fdAi148rB-4c==-qCOW1SJjwf4AzC2=TUhfPXMhR5pQ@mail.gmail.com>
 <1262fa5b-0822-b8d4-26c5-426ffa4e0265@amd.com>
 <qne5fm44dhkbnwc6ldgff76ljt7ecd3cvtf3b3lhos56yyx2ez@qbcv45zbxlhp>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qne5fm44dhkbnwc6ldgff76ljt7ecd3cvtf3b3lhos56yyx2ez@qbcv45zbxlhp>

On Tue, Mar 18, 2025 at 05:18:53PM +0100, Stefano Garzarella wrote:

> I see, thanks for the clarification!
> I saw that with devm_get_free_pages() I can easily allocate a
> resource-managed page, so I'll do that in v4.

As a general note you should just use kmalloc these days, even for
PAGE_SIZE. It is efficient and OK.

Having a struct that is PAGE_SIZE+1 is not efficient and will waste
a page of memory. That should be avoided ..

Jason
