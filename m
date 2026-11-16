Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847367;
	b=5tzBCe1sUef3T4M5Fyp7u1jpk7Gg63FniS61dZrGeI6O9NGeHAw73EW31E06GOj/jTkQ
	 Ysns0ArCtj2OtkRb60us2qbWq13jqbefWJw/sbSzJKVDIqOSTJJ17tVA1zZMm78JETB5O
	 FCvCtH7ATExpBHxJVmBV9UN3fhnqerBQNzPybeaun5tnNiHtRlaainaCI3pQpyWRUgHAN
	 BboVjVFfeAr1MhwQ2nzKXGkCr3UnpNKegqZ+s7ufVgPQZ/qaAQw9lEU+5VWDiM1XMJ9LW
	 jjiRDA2jdOM/SbUdk5yeECH/P5XYqT8LChShaj2EobQK+laCazUP0pruBPbvUjQKNVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=;
	b=No6yuapZoydCDR0TWcpUrPtCCjancRFS4BdpEgrES/jSaJ71RHx5TAD8Yf1rY7wW/cme
	 XrJhXzGF6hea7g8xgh7/R1cuzkZji+y6QjE3NQfROkErCzg8Mcm4tY8ZzsqQF2SD0cVZc
	 ymj4dvRYAzIRM7QcqCBlhUAxvbcfStjDPLp2n37k35yXI1ZMCazj/75stFukQ1b2eU5gL
	 5Rv7R3Ug1yld2Vybj5CcCsyt00hhsMEyl1fK2HnIY7G3Ce8gl9hWV6CmpLNOJMwifvClb
	 P0eMLrSDJ2U1nO8l5fRTu7iDb52Gjs8fFriqWKytnyIO89xaRY5OIDWIisFVwbUZSzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ppSz8RsU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E2F606A323
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 16:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E2F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ppSz8RsU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so185005e9.1
        for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 08:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794847365; x=1795452165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=;
        b=ppSz8RsUQ20OS15HRh7cvMXr1sRcLL61bcPbjk0ioF/lLHgKrIiGci18nyh62iSHFM
         S/BbLrjQ8iIcDU39IJSIc/EN3yLRKngceBAkmd31pbzfF8MIADyuMXtEwj/0xiyPs8hm
         3Fdv7L5c5VYbAzxVjzVZdkvyhWotlAD6TLmD506i76wy+NILw5Wb+LzGiFwGcD+wnt/s
         pYVwOLLZlqkMNP9aHuZjoDWrTRTea+oHHuSTqzH4ukqt9RDuB1o6GGPC388WLUfEoEIq
         Cti8IY/CkK+vmi/rEjeh8iOliNUbry1p/6zx5lH+ByN4C5zr3mqSCllEYiV9oMZvGGHP
         B7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847365; x=1795452165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=;
        b=pt5wKwJSEyUFH6cHfFOw8pfUxAwPrLRXzEkSZsC8AunrvrwBdGhuFtMm9CJCo/0Sph
         qcPBsKhbQGV8qPTAk6nfLimwbAPwOYBG/4f4cmQNUJqL0yFGPPNau9dtuIi1kqXPhQSy
         pHWqwkig4T+OPF4u16P3H4UBAD3932TDKyywoEUaUVheAyXsQqjTUSih/W9fcLDqM0ow
         ET78nceIH3LHFQyPsNUgsOJ8ofd2POXkFRgtdh5nBRMlHURsl45LLTxBVOV3GBZfAZrf
         8r+MBezDilABUhMqlwoA441OhqzezJ/KcVzmgjF5/0DrXVhU/Vmqg9q87hnRuuV0twAt
         /mPQ==
X-Forwarded-Encrypted: i=1; AL+hErER/IJNx+1eBSZQ7h0hA8cLoBVPyZce4Q2+Afdw5/ojeH/Jne5fw1i9btXbrbee4s69Nch22YZIVWug@lists.linux.dev
X-Gm-Message-State: APuU4Z+gzdb2Sn21cGMvVMusQ1eZ/dKHI9i6jbR/od/gShzYdgzu0K2k
	fkNaCyRd5IslM5DDPzVIzhY8RejOkJu+mllY5CeuuBeIggQ6+DjKV96+eeEKFOjdiw==
X-Gm-Gg: AYBFou3mFotzdqZvxrzwosns5RUVrHBK99p0qfcOGpCJQVKKigZaMJ19SCXo3GNTcBe
	DP6Nmrak9No7baR26WNnxknhQjo2NoWVmWpeHsQJ5Phyozq0av31Bwq/KZkJjkhY2QRm68flLHf
	WelZc/EFXuTNa1d0BIIy0SSxSO5R0agidnEbv7oQW4Y5dM8e+x8Gm7+U/dnjumf6B+3QU+VEfwz
	CFS1+Mt6CR0y7EfvHxg43g3GYyV3iDdK4+HQdEsy7VDArWhilaqxewyxgPLLBJkWttL9nT5iHZM
	940KiQI26zvUdEgk6vBdq/AC2zFRuaz3Q/DkvOkdb6CcsQJwAxwmeg3pen55WCSXOr7YTzxLZ9J
	Vhvzc+QSQFVb6xBb7/5CkNA75RCvh/xqZJ7wN13i13B8KsioEwmOMHKBAXNuUCUS0WPUXNGKgPT
	UPWRIHQAUaB9Jh/Mxi4azLC99KW87TRmKn8rjLDcG9grikd+L1Xyqyq60yZ6WVKiNHfLOCzfAFK
	0GF3p8ClOA3KMph01v+9Smk6xSf6Ci3ojvt1bFEn03lapnR24I0otCBKK9sF3XGuSjnp1ekSuoI
	+asbEcbiKlhFmzZicZcrpl76NHwRFfyZq7R737Som0VzdjS4biJXiwoXjIYJmuhPAkEXuS5v052
	LJ7dXkpGSoaI=
X-Received: by 2002:a05:600c:5012:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7837264cmr1312695e9.3.1794847364743;
        Mon, 16 Nov 2026 08:42:44 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm791855e9.7.2026.11.16.08.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:42:43 -0800 (PST)
Date: Mon, 16 Nov 2026 16:42:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
Message-ID: <avsygB0HdGxR6psB@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com>
 <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
 <avsNdPissIDAb1hA@google.com>
 <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
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
In-Reply-To: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>

On Mon, Nov 16, 2026 at 04:32:40PM +0000, Fuad Tabba wrote:
> On Mon, 16 Nov 2026 at 14:04, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
> > we are only changing the software bits, so no CMO. Actually I should have read
> > the comment in stage2_map_walker_try_leaf() more carefully.
> >
> > That said, I wonder if that shouldn't be handled by the hypervisor, just like
> > hyp_poison_page() do the cache clean.
> >
> > That would be slightly slower than letting the guest (who has a mapping already)
> > do it, but pKVM is enforcing isolation between host and guest, and it feels like
> > it should do it by default no matter the memory transition.
> 
> After the discussion on the related thread [1], if we have the zeroing
> here, we need the clean here as well. So I think that this patch is
> the right fix now.
> 
> Cheers,
> /fuad
> 
> 
> [1] https://lore.kernel.org/all/CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com/
> 
> 
> >
> > --
> > Vincent

While I don't disagree with having the memset in CMOs in the guest, I still
believe the hypervisor should do it as well.

Linux is not the only virtualised guest and they all should be able to trust the
hypervisor to do the right thing for them, which it doesn't.

-- 
Vincent
