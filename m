Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D583A452E
	for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337676; cv=none; b=UsF0dR4lNlXw4Zxhls5BXJ4MicJJhoxYiU1ZA75N8obSpgFwlsIg6Y9sEqJ1qIlDkQAbsBWJ2U4CbUDI09TbmFv5mZGtfsQIRNyD6kSuqIw0dhUfwuOUlnzs5hpBkeHYubFC5JgZTah4JOm6fL1pJK0EoAQ4wpJ0EV1dzD2nw58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337676; c=relaxed/simple;
	bh=VA6BT2jedBPBN+XKoIFPCHObG2m2rlF5KycQuzDUrMg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DHSeALTigLhMA/pKbZ2dzLpNYU6Yi35NQqLru9p+j0tu/4szsoIHfjqpJwFLAzs8nCuSYflo/b9Idi2hW65LCGBDPygSKpf1B+AQ7LpNx46t3GPVlGKJscDxZNKtnj1cPXGh0YleH26niot3XYWe6XICU2Xjf99jN1dhBVAKsP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LuwySEHk; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LuwySEHk"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae6961bff0so102522845ad.2
        for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 10:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773337674; x=1773942474; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqT4tJ2p9cV0GLfbL9fmEN2SDx66Fv1ImSC2atPdiGM=;
        b=LuwySEHkHZxtyPCRORdph1A+/iiUer0me6XSfUhvOQEAvP2i36ww8saI0Y+G64SIOR
         4gH9UPCJpCZwNp+7S8rL2w+Lmh6Jb+vyFCQAU/n7vnEdKQ7MebMHs8QeL9GaDn1HedAj
         1ncoSB/GvTFO8CKwbyrLUI/HxZQ+5/RwI34//oKgAAWk5t9RvqEQ9Dn/c8iwf4i2gbz0
         5yTE0nGWsMNJg/EykVcPicYVhZbrpR8sRVh1MA3R6jBGqjmXzCgUFZd/h8sGGAoeRjcw
         TqQcpjKunuY29WFED4tnwnD9gsPprepm4MbxWQYbVYNFaioR48X7E4O+JmssCUjMVXJD
         xLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773337674; x=1773942474;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uqT4tJ2p9cV0GLfbL9fmEN2SDx66Fv1ImSC2atPdiGM=;
        b=QtTodSyzMGXdWZq64X7UbZHcUVCpldN6bkC5n2lVgos0tbcn5MB1pIsjrcY7hqgRnv
         tJ1jhyfihCdcrUqJSC64i1jKON6+pg9FJ2DscJc8TewT8DpL0BoVnI9twmhOTPJw7od/
         RZj2XDZG2dtFybhwxJT6VYvEf23SZ+0LLbJp2K0zGdjCAX9N1MCyjUwMZNpjyX0bkUV6
         LKpHOwOgJQRmxIxZGZBslK6Aat1m3F2ZDkY50z2ZgQueWLyn9I8jiL+5A/PfApk99L4H
         GSn7mRFzlub3DbtcylYnBuzaUWi7qebx37ieWxHlbHaoOn96YTTB/9hLLXWhUnKlQ+V7
         hdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVucMPV4wpEGMnUPLs8CX0YHTcXgOGNMXCqRgGKbkDeWC4qGPgZWVcvHYGBUV1FpHgY1vVrL2Mhq1ut@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1VmT1Lqfdi+V3Na1w1yQwb8BWhY9+iV5/8BkaQB0pLd8nRdx3
	EGMO8CFHDH6dPnSUXJ6aAhonWR8nRwhuC0irAJZ2wsSmrHpCgdsIJw14m1qmMP0CwHpI1Baf1dA
	yBNqdVg==
X-Received: from plww18.prod.google.com ([2002:a17:902:d112:b0:2ae:54b1:87d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c947:b0:2ae:c795:6b37
 with SMTP id d9443c01a7336-2aecaa48f77mr3241095ad.19.1773337674289; Thu, 12
 Mar 2026 10:47:54 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:47:53 -0700
In-Reply-To: <8853f8d5-57e6-4ea4-b9b5-8a0182d0d012@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <7ec084f8-812e-42f2-8470-e416fa7ee848@redhat.com>
 <8853f8d5-57e6-4ea4-b9b5-8a0182d0d012@intel.com>
Message-ID: <abL8SW5JS1aV5goa@google.com>
Subject: Re: [PATCH 0/7] KVM: x86: APX reg prep work
From: Sean Christopherson <seanjc@google.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, kvm@vger.kernel.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026, Chang S. Bae wrote:
> On 3/11/2026 12:01 PM, Paolo Bonzini wrote:
> >=20
> > =C2=A0 On the other hand, the extra 16 regs[] entries would be more or =
less
> > unused, the ugly switch statements wouldn't go away.=C2=A0 In other wor=
ds,
> > most of your remarks to Changseok's patches would remain...
>=20
> I think so...
>=20
> If the host kernel ever starts using EGPRs, the state would need to be
> switched in the entry code. At that point, they would likely be saved
> somewhere other than XSAVE buffer. In turn, the guest state would also ne=
ed
> to be saved to regs[] on VM exit.
>=20
> However, that is sort of what-if scenarios at best. The host kernel still
> manages EGPR context switching through XSAVE. Saving EGPRs into regs[] wo=
uld
> introduce an oddity to synchronize between two buffers: regs[] and
> gfpu->fpstate, which looks like unnecessary complexity.
>=20
> So while ugly, the switch statements are a bit of a trade-off here. Also
> bits 16-31 in the extended regs_avail will remain unset with APX=3Dy.

Have you measured performance/latency overhead if KVM goes straight to cont=
ext
switching R16-R31 at entry/exit?  With PUSH2/POP2, it's "only" 8 more instr=
uctions
on each side.

If the overhead is in the noise, I'd be very strongly inclined to say KVM s=
hould
swap at entry/exit regardless of kernel behavior so that we don't have to s=
pecial
case accesses on the back end.
