Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB12329C67
	for <linux-coco@lists.linux.dev>; Mon,  9 Feb 2026 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770667697; cv=pass; b=bInBFy3m2UZSdio56J3HE2LXA80aKG4dVXBbUmDoaHmC7O3jfY+G30I0AY1Q4UUjK898eh6336WZcKW+WSA6+wRghRjvLneYIOLTo8GBEkCsCd9vsyNf2PHB6wApbxmHPvs9TsZVTqiLe1P+/UqiYqYi1QZ7OLWOw+7gyBpqF2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770667697; c=relaxed/simple;
	bh=87ivso5DI1kS8+gT+30C4NuY1qiQblQsyNrdFsbbIQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvB9WvGBk8Z+j81++SYvAuRDihMCnnzWmeIodfZ86WgnXlptMyv/bVa7tItP2vLUk6epLIkFFYcqHZ38bhQnFThnwIWXwGudP+P01TRPJXgDdzM85C+OBJXXJh2stwPLAiUW+1GzSdBS/LWGicu5zSefTj42QqM1itqIocfwock=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=smYw9X9H; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="smYw9X9H"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b86ed375d37so8065366b.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Feb 2026 12:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770667696; cv=none;
        d=google.com; s=arc-20240605;
        b=DuzOpPNT6YSLPsntBAtSEgVDxoZcL4cYcNtdeKgZh6zizaE7rnA6mVxRi2xheUQg9J
         ++yMMt6rgYK3sWrFMcPmKtBq+bPNUk0jeEx7WlFDkLy2t6jagCDhtTW1cS8i5TOxEnlp
         FtutToR4FBTfFL8BpYJLdAD518NjZpVsPcY3XU0FDWe4Tx7ozJCaB01IM96fYBfVX/7p
         SSpMapRP8axF5x2SzlWeyc5Oxy0/i7a8RqjHF7zzABU+EEDT3LmWEnXdPVgEPLIoI10+
         ZrcVwE0rvKvFIjRou/ztO89vILp+G/W2kTM8/2P8XB4uuOb/auHU2bXbz63eJRc9VH5M
         SNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
        fh=9rVs/tphSa5GAZHXtEquwOOn/9e2F/Q56DS+rAGLEGw=;
        b=aFNmeslkAAM0RiKGrIGPU4/wVOyd++U7UWQmDDgE3nLuRJp4+upZmOOeInT+z33hqd
         UCJVn2ZOYWV+pTE1+Tgv4Vz/zsrD5zXjj7ScSPbsfmUycyvGD/H6a+l9+iflVzsgR88t
         LDjOsO4XS78ufuw5rQLg5e1TfGyzIEcn54iMaG1hGyzC/nuSDDPFUawrC+OYUhX1BXBD
         2KxTaQIXblwwtVMDcHm9BVcGfKHNUlv9Jrmb63fUrJ+8/46wVm6CMy6aHGwfget8Shx+
         LvMC3HE5ZshYlrvx31awb00a2DZxUY9rQI9P0EoTtCGA8TihByiupa7CkiXNSKbWUXku
         modA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770667696; x=1771272496; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
        b=smYw9X9HlF60bZXLSL40XQ8ew+6buysHO15r/Wzi7c0Ql8BFYEvwm0tDXWZGLa2mk9
         8p2anVvrbTseKuv980ZyJPiPsw08Rggh9WrL8GCNYU336U0ZgkIBqPQPgpfA/0G3zP8+
         CywViyFT6dxkNE0doEKve0qRIAX8FSqv75IANv3FovyC7gwF6WtlHJMu/UPWbkmzKmmS
         GzI7cnTMUi4vzGF0B3W0IyX9mySfkDaURfVKTMjcua3iMpDMuYnbga9jdS5XyHkJaV2T
         YgdF6lD4+1xeAigfIME01X23KEvlIO1CeUSomNas3OxyxqGgC17xLVB9Mb5FEqafg0jB
         zcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770667696; x=1771272496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
        b=kt441a6/mOgKtO9cJ5rEIdYKbUW2m9ta/Sd8CVE8gUfEzOYqTFHCa4YFfapLCsC+Ds
         wRMnFyo8jOQqny2HohG2NM1IuuYntq0PriOFLPfCIfQps2GlBGpem6cnx6lc+iZjm4Zw
         pi4swvMMRuPMvWWcfSxTWzjYyVLmnr8L37LPrPq8gLhdHSKDVP9WQzkZoMWyxhX2FR7A
         t/JU4yyAIcEo6VSJ4yn8rKH6NrP/6PuSus3WMuaH2TF4J/Uf0S7ZL54W2vF34nWYm/7N
         wQCWl/NmWRI2nQprZSElDKqy9uwcZdYdzrWq5klS7P2rFA8bpnDJF04yTwbVwSoRb2Zw
         ymdA==
X-Forwarded-Encrypted: i=1; AJvYcCV8J0tG2LIt6L37K6k6SxHg3yK7T4IAGY3t7/HNgNfd2R8ImNLbyDsrplLAr7mz2t23V0vtcj7w/PXC@lists.linux.dev
X-Gm-Message-State: AOJu0YyUMPy2tdsFqxtZ6C1H9AY68Jano4/KOEVP8GTZVQFYQpqbfsrL
	FaY71bbQljSIrhO44XAuvZHfUJxhqUCusJxh4ZnTrRmL0AXRNdpLPqPcGftynRZA4+Tr6cWI3La
	YkCl6EGbaCgJQXYCeDH0vjkGinZ73oFfxrpTzNYk=
X-Gm-Gg: AZuq6aL1RlEgHH2gYbWbUTRJ/Ityb/luJwSY19FVrk68N4Pa4ZtcE1v6iybPZYHYTNa
	0WPoXZ9XaVDcsIpXYlF8be/lWhI+ZuOdGu4/wRcj/xLbQiHGgjKyGGvhZ45C0QGWc7irrd4K6mv
	hUc/DTUwv7Gm+I52pKxD69eC2ytikvwp0sdHUhpL3j8fGitsCGrCJIgEVJe1VHfhzgR533jOtTA
	ae7IHqjcHOnckrs9ve5aAXZaLru2YdxCUq5RmSaupLk1ZCqb0n/iOn6RbCgb1yI358n0Psn8sKa
	UMfXlKpnNLuRiqNqrN8=
X-Received: by 2002:a17:907:6d0f:b0:b74:984c:a3de with SMTP id
 a640c23a62f3a-b8edf25a954mr696952366b.28.1770667695453; Mon, 09 Feb 2026
 12:08:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260209153809.250835-1-jiri@resnulli.us> <20260209153809.250835-5-jiri@resnulli.us>
In-Reply-To: <20260209153809.250835-5-jiri@resnulli.us>
From: John Stultz <jstultz@google.com>
Date: Mon, 9 Feb 2026 12:08:03 -0800
X-Gm-Features: AZwV_QgqaltPSA0q99dWV0j2auNF_GQoTvkX0OemEzMtzBNfhVP0pPFcsDiXkzY
Message-ID: <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 7:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Currently the flags, which are unused, are validated for all heaps.
> Since the follow-up patch introduces a flag valid for only one of the
> heaps, allow to specify the valid flags per-heap.

I'm not really in this space anymore, so take my feedback with a grain of s=
alt.

While the heap allocate flags argument is unused, it was intended to
be used for generic allocation flags that would apply to all or at
least a wide majority of heaps.

It was definitely not added to allow for per-heap or heap specific
flags (as this patch tries to utilize it). That was the mess we had
with ION driver that we were trying to avoid.

The intent of dma-buf heaps is to try to abstract all the different
device memory constraints so there only needs to be a [usage] ->
[heap] mapping, and otherwise userland can be generalized so that it
doesn't need to be re-written to work with different devices/memory
types.  Adding heap-specific allocation flags prevents that
generalization.

So instead of adding heap specific flags, the general advice has been
to add a separate heap name for the flag property.

Now, there has been many discussions around "protected buffers" (which
doesn't seem to map exactly to this confidental computing primitive,
but sounds like it might be related) , which have bounced between
being a allocation flag or a device specific heap without much
resolution. I appreciate in this patch seires you've pushed your
concept down into a DMA_ATTR_, as I do feel the kernel should have a
deeper sense of protected buffers (or any general propery like this)
as a concept if it is going to be a generic allocation flag, instead
of it being a somewhat thin creation of the outer heap-driver layer.

But, it seems like the use case here is still far too narrow for a top
level allocation flag.

So I'd advocate against introducing heap-specific flags like this.

thanks
-john
