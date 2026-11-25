Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617527;
	b=KAh4UxqG2ffLtq4eVNsYFt6r74LaiPsVUYOhYSoAzq1ZXSVaAMfTi/woT5npKXCktk8K
	 qunBlG+G++/5xZdU/5IIAlOnlsofTCOc9TxDq5j4ePHWrFZlMbP5sB0yu0BZN7SDCTCvX
	 kPM/izE80rv+jNK5zMvb0nAWA9d9DfUHch9gwMaE20j0xnNfcBVC9V4CeW8cOX99/WG2v
	 nsNRZzHuBxmYhDVadHZ+8pkjJmMLSGJGz7jAo+/7vyhUZ5Inju4CxgnkXYkn2RZ4/al0u
	 tUuGPZUFgNfa3B03t+/WTgR8wPJ4FabH8AUOH5kTNXzB+FYTk1+nio58duooivNbc8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dCtVGEXy/TUgxCZ9qLhPI3rUEmqk4eMQKQPU17VUyZ0=;
	b=Yr0IZpnW30wXSAUO86K0ASA1gQH0Wbc2fZVR/vf9Yz+HpnjoJW8eY1Cas8C5hQ+GCgVy
	 IjceDvczfoLz9IFkwgrC9UPJZfHyGJbwgqJEIGLH2ggagMQ/wjlYkP+CL/ljcnPeoFWFq
	 Zby8rW2DFJL/KR9MZAvU59cyyUjgTxzVDx0Zdn00liSawMUi+fyVFBv8n/0UzLobH34zA
	 PPgd6bSbVzEjPOhnzXiDLEjKp3RwrDTvvLri9rKoL/fC4dpnWfDrSNvjJYDe88hbYO2XO
	 qv6CwiGfAX9eofqIBh9vWzD/QupjJVS/Mm9abFHdsP9zGA8Lm+I4gdP5MW5NNDFuwQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="Ef/me8xz";
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78410606A323
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 14:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78410606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Ef/me8xz
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eab93a9862so1522793e0c.0
        for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 06:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795617526; x=1796222326; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dCtVGEXy/TUgxCZ9qLhPI3rUEmqk4eMQKQPU17VUyZ0=;
        b=Ef/me8xz4f56k95vG/I1VgHqJFLRI9TmsTgvV7BXRI9xAowekSDWXzmrpjFSSceQ38
         ZMRgrUj0Q0ujWsdyl5K3T28rrrD0nMcI0NhrpQ7gWkSHRkzFDVQk+EQXLLmTYuuRmDdf
         qkc5i+X9HdDPUSBA/fZ4FU63+ZC4XPHEYxyIo2WlmD3ZU5j7/VX17XabD/usqzt5m1Rz
         YAYBAXF78zxJO67qF9nUiScLzEnpww9E1a/xJcxoVMpqRqwSoYvKhb4rrTlg04o9BlBv
         mQ8QFyNjw3AD/qB7Ci+JGG2t8hJThjX5CeAf+OjZ8J9KdV9iYGsa3fa8jvZjXQ07fmyn
         Nz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617526; x=1796222326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCtVGEXy/TUgxCZ9qLhPI3rUEmqk4eMQKQPU17VUyZ0=;
        b=AYL/K0VURuMUhRH3p9JdGqE1A2blF4PdQzfwztGfuaoSsO+TPntGJGcfMRymk5Ylt4
         HO0v1eMQjrgAq0w7iryWqOH8a+iE8QPTRk1kxHNPOkh7hZnFldb3hDTbLBHL+1TKs6ry
         rCikOfzIhb38Me6ukW7jUi7RFM2/+uDooU63AAumpI6Eoax0J+2Gkpb8XRxcKffl09b/
         olV1Ecb2ytHd7PQYnNUBRLDcbFTd5u570iU3mSYroIbvcjWSbb7MMCfxEAzvEt/eg9np
         WwVTXc25ZfRgEJ+D21XPgEOF22I8T6/OhbdhEvZJPhDR8EPXcAFOXMjtSszqixE4Kl81
         yBPQ==
X-Gm-Message-State: APuU4Z8a01PLQnq3oSF+sCKTimehVx0WD/ueL6pKPjao6VJkLfStUF8f
	uyIS2eoegGPyQcmsKkDpjvGEsG0r3reYn50iURJggfKwYotCgAkGrCtD9hh3LEEOPlQ=
X-Gm-Gg: AZFdTZcjCSJw9/x6Xk8a+nGMQ3+MXtEMOAlfHkd6fxdZZwviLZwsNqMfFMDnT64Ee7s
	mFhqnPUfEHmj9KAXlzapBlPe71bcK7jtnkOMG9MpIq5LT/Q3ZO/jFq5Ecrfl3tqpSOOU7l5Be9Z
	xlksa6Ho+0KWAYDLrxNibHr5xFt6Db7xhR56YGQktCn3ufAtCpIPnxqdBpDiLhuWzA4vBjHQRs4
	P1XBFrzwgBNvGzNIVhW4mhidBJbnklHiFoF4ai8qlntLYGCRDFwrHxidGd5X7GbW1zvTbaUYwDb
	sZmnc1oXJFZQKGoeKZrgbCIIX7fXQXreLIGjRsUB5HSJ6pLOWYEh2/aH1Htt8p7Vp8gsWkdMUut
	TDEP4h8oQinK+pnrheAdOZihD42v8yTRxCLUWGd53MO0zYA3mk0XntpUKPaxqS0c28ZPx57O1lJ
	h7Rp7NfnMa7WO9cg6eBRIx1mpCXcbouHZ4jMlXyZM6BvtSlhI8knOj8paItUQN9+qoPhKrUAcE0
	Yr0fzPM2u6vvpFYST1TvRwWWEltZB/FWfHUs2nJ21hg4b5DzL9lAUnMITDQhajUBSN+BxPhtUbj
	Q1J3Pw==
X-Received: by 2002:a05:6122:1816:b0:5ec:4112:6839 with SMTP id 71dfb90a1353d-5ee8af18034mr9201283e0c.15.1795617526133;
        Wed, 25 Nov 2026 06:38:46 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d383asm163086316d6.22.2026.11.25.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:38:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWE8z-00000001lnK-03Mz;
	Wed, 25 Nov 2026 10:38:45 -0400
Date: Wed, 25 Nov 2026 10:38:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 05/10] PCI/TSM: Add association locking helpers for
 evidence acceptance
Message-ID: <20261125143845.GG246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-6-aneesh.kumar@kernel.org>
 <20261123153507.GH179082@ziepe.ca>
 <yq5ald6h9r1g.fsf@kernel.org>
 <yq5aa4mx9nsj.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aa4mx9nsj.fsf@kernel.org>

On Wed, Nov 25, 2026 at 04:32:36PM +0530, Aneesh Kumar K.V wrote:
> Even then, wouldn't we still need pci_tsm_trylock_association() at
> spdm-start? Once spdm-start completes, we can ensure that the
> association remains stable until spdm-end, but that still does not
> eliminate the need for this API, does it?

If you have a valid attestation device for the TSM then the TSM is
guarenteed to be alive.

That is the invariant we need to create to have a sensible subsystem.

The session cookie, combined with a revoked/disassociated attestation
FD guarentees that userspace cannot be confused by a TSM host
plug/unplug. It will simply see the attestation FD it has open stop
working entirely.

Jason
