Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367887;
	b=dWTqJvYgWlWf6Os33z6Ypa2U7UwbQvp7krVcoWAkE8uIe8Fts80AvXFqkSGCUKm3Tk7A
	 Mo4uVev1NCOfURkQcpY1t+XSYRdFVDq+kHfRWkPqcehjfSjpQYH2TmyIwjmMDr6qAC1c4
	 zRowJCsrfBqKWs+Lk09/PH5oODq3PuZVoJ091U121YSEm1oPE0OuXGjJKfwWcR20s9lsg
	 GqctGMtgceMdjpCrUDPytGCwEHrvK+ogt9u1CAkTNHQV2EmTsbkQ7A9U7AyY6czTU1lpk
	 OZhOe7You2P2MEZc4Or+KCTttvT8Ly7m2ZdOjpxSx7S5ZXFTDorvhtgbaUKZx6zoA5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KF5mM/+d0811MHnJYyTbMCvDWhol8CRjotJBT8VYT3U=;
	b=CnaMKXeyxjaKxisWtqho5m6hyAFtBcvnY+LzCrb7Uqr4EJgm/AiyrTbX2Y+4hVt1auUy
	 DOGyDn5G9o8RsyVMoOSGGxyoOGOsKKp76hFhRfT99H5xh64o72FOZ8AlCiIGeyTnGvkOZ
	 U+W2+2ahzoZ4dNEMJkilpePO4VvSfxZZdw/vENnRne/JZEo+gqaN2r3M2JBeHHH8KfA09
	 w0NbBbPZkraUq3ogxSqg9r8B9b7+3QACYuo16USH8sDwuWIaLDFVv63kGA0e0osXLOrJq
	 /ZMIs6+sg1H+OV0CjGwLjvMnClUl5JlgTb/FzVtZThQj7NpTewew2vvLrsIdzWskm1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=DWZgovLC;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D8606A31A
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 13:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=DWZgovLC
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so879189a12.0
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793367885; x=1793972685; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KF5mM/+d0811MHnJYyTbMCvDWhol8CRjotJBT8VYT3U=;
        b=DWZgovLCeETKPBkjZG7cNeHb3QaKfoNVwX06Ud+eyXt+cLtnQFJEpw0JyTv5r8KisP
         pKXh1TSx/0ShYgmeMljCOf+790kbuV6BLTzkeT/1Q1L2iSoObyHXYH3ugo+N+orChPqT
         ewiK+L+zYRsSQz3/oSXVhOY1EAAHYggRKxrUCIJ2XVByIDQQ/6z7t4stgpKyZpVZCcF1
         LeB/iB49AjKm7xqbZU79G53gtHkKuhoyOKEJII3Jans5hTnm94oqyKqHwrsNZQNbMkd/
         e+bw7KVdqd1SoWGWZayga6RSg6IUwvwdeXIQIp661QMEZrnNrutM5rsAZcKjOrLZU/5Z
         zxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367885; x=1793972685;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF5mM/+d0811MHnJYyTbMCvDWhol8CRjotJBT8VYT3U=;
        b=zLGQfjMMY/3GVSCO9TozIQNV7ppbLLevU7Ry29a80orlCJo4+rRdGUd/9cTM3FsT2i
         SZ9hy6JReR5I2VyKs1ziIzJqwieKYLjq/rbP5UNi/lTxJIlfmyrBHfP0vk7JC8YcTFKI
         1oo2FmmBqAC3SFR5oO33Fped+QuIAvpqhhlC9G76WOm26ehIfynQE0xXX4W8osBqXelS
         cS2Pta3Lmtfwn05pSBV+klTcvDpRhV1TRAn8aFtDv2DhCWhHs5n/TgPEyyImWthmjcN+
         5eH8RqIWawEw7gSBNA/p53oSnszwQLW5iGuiqExZ7x/wsCBwvei5/gBxU2tCjNVcRiRG
         wMSw==
X-Gm-Message-State: AFq9FYJn5JdWsVCOYFTSLh2mVXwzlTsYWRAGZw4AvzYCinpgYCwec6pm
	LctWdE/iOyB9d804gc9uUPpGb+AmitVqctctjwFY0vUNYlReOGjIEQVCA9HoFPXPSbQ=
X-Gm-Gg: AYBFou1gSgMuj2KWI7rLruq9rL9XNzP0JM0tl27X2bXDgDoMt6AMc74Ebx6Znlcjsg7
	/NdkHhQRowQA+gHd/LqksXOfnKeLxfoFCMiTCHI4r7A/U6jkXXx56sni2Zy8TtYpqoVUyW7QDbC
	oxV9IIeb63xReEKDr4TmAGi7cphbNnSPnpFNdsMupEKB/iMpJNWMyNyuC6nkAG4ui/Ei6+LMa7z
	01TRNhYZoua0vzLSrVoAr47f0G/MZmsuoP9AnNPiHXO+Cren4SYS9NbDbw7gpW3BHjTZ8zgMETo
	b/4dhdQhL4z9Km1nCuGpgFvsx7Rb4bvA59qudVK4w8nj/8+vxwZzqRPeTdwggesDv9iXbulSIki
	sLkQcrV22NW8F1yh8dNp+NmqlYew/cfykbqLCyI41E4EOTZ/1/kQvEHMqke6KOYvfxHFfuLP+BH
	H6LnleMpXwY4HyLSJcb1PXwdF7Q5RCX5sfLQv7wd+HGFhK76EAI7U9xDf81dhtBipb5SAEd92Af
	YnJJ75P/1Va4gF49I9KvZ9ztqTZ4Tt1N4/l9EohPo1iP0mBkfqQIbYVcGBPF/+/5CL4xk1hZ4Ki
	yTqMscYbqf/5ZIdphrpa7T9/HjFysz+YfcOIDQ==
X-Received: by 2002:a17:907:9603:b0:c31:8cfe:9a25 with SMTP id a640c23a62f3a-c4ca7a4d9bfmr219408066b.9.1793367884686;
        Fri, 30 Oct 2026 06:44:44 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a7e5sm66619066b.57.2026.10.30.06.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:44:44 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:44:40 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 02/11] attestation: Filter evidence objects per
 instance
Message-ID: <auSe3YzgKX-lu27G@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-3-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261028152618.1356860-3-aneesh.kumar@kernel.org>

Wed, Oct 28, 2026 at 04:26:09PM +0100, aneesh.kumar@kernel.org wrote:
>Allow an attestation instance to expose only the evidence objects its
>device supports. Add an optional evidence_object_supported() callback
>and use it both when building DEVICE_GET capabilities and when checking
>EVIDENCE_GET requests.
>
>The following PCI/TSM patch uses one attestation implementation for
>devices that support different evidence objects. Its list includes
>certificate slots 0-7, SPDM VCA, measurements, and a TDISP interface
>report. Each device must expose only the objects it supports, for
>example:
>
>  Instance                  Supported evidence objects
>  ------------------------  ------------------------------------------
>  Host link using slot zero Certificate slot 0
>  CCA guest device          Certificate slot 0, VCA, measurements,
>                            TDISP interface report
>  Host PF0 after discovery  Certificate slots reported populated by SPDM
>
>PCI/TSM checks the TSM driver's evidence_types bitmap or, after SPDM
>discovery on a host PF0, the populated-slot bitmap. The preceding patch
>controls whether EVIDENCE_GET is enabled; this patch controls which
>objects that operation can retrieve.

For SPDM slots, I think it would make sense to distinguish supported
slot addresses from discovered population. DEVICE_GET describes fixed
object tuples, formats and limits; SPDM_GET reports the populated
slots and their certificate digests. An empty supported slot
returns -ENOENT.

Fixed differences between backend instances can be selected before
publication. Please do not make the capability set follow a
populated-slot bitmap that can change during the instance lifetime.

[..]
