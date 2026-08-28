Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803283A7F7E
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787955546; cv=pass; b=KQHHgOzn4BS14TODy4l5WinhtzbTUSZA8VfKqL+G+4DaOgbiwhCsKu+4Wu/jc5K7FKTL3bNTuMtkvbNgZPZstXFwShcvLMLchRzIojETW905FtrbssEfgc1laFNAi4gPH4wOdf0/nlpu7+bIjQjnJBB0CeXWQhpvqxLDdBTjIlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787955546; c=relaxed/simple;
	bh=BMIGDWFwkO1RXH8rR2UOhGKndRufLWtM6RTNgfHf9Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L95CXEpbPyyzm9+iBI+8XwnKn9z/bdnQmmnlK2lFSie/Z97QG4FVTFPS+BJqIx63XeSX4C/xu8gQvdlw+d8jyoz2SZd5jqHdfTxYfllO/FOBmu+vhRTAUBotT+/GEV28vfLHVvNZvyuSZFy92v8M3B3uezWSw7lvEGZW6vzRncw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A8TM8sGm; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A8TM8sGm"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52faa58bff5so77991cf.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 15:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787955544; cv=none;
        d=google.com; s=arc-20260327;
        b=UnbFHGN8+fesCzr0kUBvd53/siJjqP7en/KUO7YjD055GzR4uvrfTH25eeG1X0VDAo
         zSHEGMc2h01A7v1tRLsXfmlUZ4FdtZS4xAH8WrpPz/H/AlLIbSEvosJE+EbXPYpK9NUX
         +ptnfJR9d8pME4kZQGFKjeIBSpq98ND3VmKgquJ4quyvuRUDYk9zKqxWw1nz/cf4TNCC
         jN1liDa2+2psnLcwH20SBh/lR0q6dQytAfjvN+U9L2UkaAdTqf/wBJOO+JDNzgVIeUzk
         iLd4BHbXGPkYEOouwwTppyzCPuEn1UFd1D8kEO/u8ixczoQhLi2i7PVZPv7cnGNa8fzy
         BL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        fh=zGh19/bhinwTHVdJtIh97kVMt/RN0b4NqEezFnOgYiQ=;
        b=sPk9BrBZwyQA73c8Lz5flsam5BWBhnHb9ylxY2YqHxlh3nZSPWEOmh9SM3SO3ZL98t
         kqMfYs+MIR0+1EAmnlXiYmiXM396xJ2xgSh4WPgKmDYB+QKuJoB2QRFovD9mgBwEUtpM
         pYmN5qrOulhJu5Cdp/CaDCvXX0I8g1fRbCaOtvWy6MBBTLb9ZIxJsIxgYeyT10Ywg0br
         CPd1d+EvcyhQ7KrWFyCAlxaUMj6xIvK4WCnkj3kcn7SEaMFAKUrdESTpttLg6Im8Ztfg
         nYCyH+KVnZkFtPIPCr0Nxj+BSVeQKcDtIsphSwkAagap0vQ1j50ZCYQy7Jr66b/TwPQj
         EwCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787955544; x=1788560344; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        b=A8TM8sGmG065P+e7nh+sUhaxe56rO03tdKapbkR/xhehIzxfaZcvWFXobhynuzCH6d
         Q7QL9T33KPYueCencdKssKQtBngNVjeoqLPEaR6+f1j/5CVS2uwmsu8ipk5N+6sLUaDl
         /lGL+XIUhjNldsuJtjrQNNuL67J95Q6Wuzgb0PVEJzoo5XthwFw5I5sABmaKCtW0sh+y
         EskO055D6I3+jq09T0uPZrTl51mV3LR/3T9j7qfo9SBz/UpLKACZWCyxX4q1CgCCFtBb
         22hnqSWjzsCkQgTPKxk/jlsLRUVUAW+tAAab64+MbfTRsAXmSwSoz+5Q1BzDpMcFzOYM
         N2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787955544; x=1788560344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        b=nrLOCB1Czbg79KpPowW0EknDiow2GySVnebjD2T86qt5bdLp02eMw8CWku+oQpRyCc
         6a8FVt39YQtinx0jljRwWFL875+N6W72CYwFRQIceeG7C85kypb6dwCeADgmSWyE8Qpc
         V2Z0nyOami6iTs+iFkRvCZzVrljVgS1SGTpH3dpX3lGfvUBJUZXaTmSMSYxRWoWxLAm1
         XGBkrB6GeUXr5pTqBQJmJSbsfKAV7Og0xSGn7KJXQSfk8UBxgiKxHS90QArWkPU7C885
         6XA0W/k0b6rMJWmcNCL8afK3HXGqG+qPZCnk2NpeathsSnFX0UJIiZoQBtfTjuMK4Y3+
         JVvg==
X-Forwarded-Encrypted: i=1; AHgh+RqEIENg5WqO3I7z7FmsWYOIjSMLM+BdeFn776GGuzo7+MwAoHmNwYH36AI7a4CbrnqEoo3LeEGYplI7@lists.linux.dev
X-Gm-Message-State: AFuF++ku3an39vEfQhOH8ib2Eqb8n8lnmImdckEZiUZwfdS+do9X/m08
	kekWl5UJlqTqUPSyMYqo1Ka66zEppMeQt4OdRY4Eio3mbvHWoV/mYoTC2qSg5UkHFsgRds9nhs2
	mo76tmaZRllkeyxSNFKSDnWkl7m/aWkxnLqrfBKT6
X-Gm-Gg: AR+sD12ofw5730CFKVzRpXpTD+SeriCYRHwbzVnz+gDJ3rkMAUEWvwkk72V/0TIj0fg
	fcbZ4OQLmvnaMqy0s6YLKyZeaPksPjhLCv2qcTMFwShH/hUnZBDZP+pEcRZOLMd6+B2McJcxMD9
	th8CChOc0IZe1bqtgKXocfIC9Zlr6/+DUSXOixXJkjOI8cIs17JjuIbr4x1fL3/+VP2pJyFHgWH
	Vpv/QHm0bto6bZqdx8onnfnqgEMWE3DKx8Tih4RJTTtrbDwG3+Fd/5+HnA3AIoxXaWOd4o/1WrA
	wvbyeu1VyseDQGyPg3DaZ9EV01jZFJGK4f+HLcEjeVF9qWYFshs3s23d/gzX4eOTe7CGbQD6x4Y
	=
X-Received: by 2002:ac8:7d8b:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52ff711656dmr4308141cf.1.1787955543697; Fri, 28 Aug 2026
 15:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-8-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-8-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:18:52 -0700
X-Gm-Features: AcwNN1VtKeCMrm5d0HiUDNcJteBwV9YWHV2SenRF5c-NodyaK5x5u2MCHt6fWJ8
Message-ID: <CAGtprH8XJ+SbxQLTowch3DR6N1NSMUKyVnGf0hv5N+iKWT3q7A@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] x86/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

> +
> +static int alloc_pamt_array(struct page **pamt_pages, struct tdx_pamt_cache *cache)
>  {
>         int i, j;
>
>         for (i = 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
> -               pamt_pages[i] = alloc_page(GFP_KERNEL_ACCOUNT);
> +               pamt_pages[i] = alloc_dpamt_page(cache);
>                 if (!pamt_pages[i])
>                         goto err;
>         }

If the alloc_dpamt_page() was able to allocate a single page (not
two), should the partial allocation in the "err" handling return the
allocated page back to the cache?

We observed similar failures internally with a slightly customized
setup which had retries for pamt cache allocations in the fault path
due to SEMCALL failures with older TDX module functionality.
