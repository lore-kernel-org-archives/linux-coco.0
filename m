Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100069;
	b=GCwQhTaA+7gICTCc6lxOwjTMuIMeb3PPWOl1eEygeUcwwUZvglSR+yBIDAb/TCD++BjF
	 d7+M6iqnIzjshFfOXK4jOU0W9P4mZIZwswPLn0tywI5bQuSUKPUH8sbP4Abgt9aC7LhPa
	 W4fWrumaPo0wLcaIyTbSayEL1zgwiwnfDqECzgniATRAViFKQbd1P1smNzBx3CQcUd4+G
	 VL/UdbsVFvSkmnJZKXpTLLtpMDFI1+lWem8xOccyPMMV6bd/ICrMFTDjU26niLl7c4/oW
	 oYMFp2nNaPHuOe8GkLaezZeqTHJmb4xXLXBb4PqoKY7wITOXaSSWvhIQEmbP9gMApXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=P2zzf8FFEBL81oIQV+yxC49Gt94XvsXrSt4IwcmCdEQ=;
	b=uNDHe9JUKyaPTB68hg8V78yWxeFS/64K/fupJMcEx2iAJNQWjvgU3J7QmfHwg05WLxmM
	 eO8YzbRX6N/rdkub903I4I95nxxtb+gO6/xweGdo18lv/jhI6BCRLLidt8+ZwrAk++hRi
	 pGLWTtHF+kMqZ/nsl0uTi2Ck/LLtOYZ1z5CRWWeZFmLzdV83Mke0kgPazJ1CVghscrekg
	 YAtRWwxhG1j9zyqmJ2Bn5Vdu1HWxQxakkH4VvD3EFhCKzpMUgRe1UKfC5qd83xRYPUpVm
	 jFOyDtHJhJaD4M05swgIB+81u5tGS03OM9OLEGggsSKTDlxI8Jyn/S3/E/mYsC9UI0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HHP0PDhX;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C77606A32A
	for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 14:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C77606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HHP0PDhX
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efdc279d95so11254275ad.1
        for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 06:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795100069; x=1795704869; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2zzf8FFEBL81oIQV+yxC49Gt94XvsXrSt4IwcmCdEQ=;
        b=HHP0PDhXVOn54mMobsb5Zn86GpLodfIOZdSmhN1DtlIwCDjdanHdZL9WyQ9aqIbmRk
         w5q5hYpKVhr6lmEnw7t5neQTF+C+Qy8yn00oiJbOaB9PfX2yDVh4oMsit/liBd0xMfad
         kig/jZ+8DXKC9YVhN+RBDJiy3gyRKcDv7vl6xeS20AQvuGH6BgE8V/QCU2oBbNvbHzii
         DGZ6+FTPmsY8iG0QwL58ptbb4diRxluYUrGrJoFo9DRHUQq1pgrhCwvGK9reZ5iaK8d/
         ML8T9xklPyyHJ4bfadhur60kJBRF0GTvgSdkOGHkJuVISHTiDUc+VQ0Du0hX1Hi6l22C
         h4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100069; x=1795704869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2zzf8FFEBL81oIQV+yxC49Gt94XvsXrSt4IwcmCdEQ=;
        b=G/BAXIqHSvGU7cyp/QAhkGDScLgX1mxRE3cGkJDH+2BNZO67vrnjdkRxXgvtWisOZo
         BlWDO85+WEV5xIvg+Jfz+Ab2advr9Bet0YeDbMyKRwzvuHRZbBjEd3h+kAvss0GuE0vG
         XH6Zr27H0itR2AWW1kuljaLl8omwSOv2tkBanpRlIgrbEpY7rUHW0jYdLfFyUeZyfRny
         BHnGpkXJdh1bFI9bT/HfdVrjlaTPajovZwteW3Wc0riwBuxjRu6wy1RVqVVg4/CwQVUO
         IFTl5GFtXBlUmkS5jq7spBwNx52T7vpo0Hhu18WhWep5t0xGPKD1DdMAiK3UMTvUiEF0
         MfpA==
X-Forwarded-Encrypted: i=1; AL+hErGOW9cHraK8oE+qKPBNhVosMcEAVRGuHdcav+fttwfWF8MQ//ID5LCL1fQPT86qmUdOq1DZe06mgy4B@lists.linux.dev
X-Gm-Message-State: APuU4Z9DluHpgFhYs+RRBx2hPWc0RA5kdYee40Idx3oi5SbX9zXbXEXh
	vJ8ubrATX8NaCPYy5CZo8kG3jpLbOniDbbLIWPOl4WSikEFrvktTWldkN2mHNRUrpLESq2BU1XH
	SGKwEhw==
X-Received: from plbkl12.prod.google.com ([2002:a17:903:74c:b0:2ed:4c9b:1bfc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74c:b0:2ef:f2e0:db0
 with SMTP id d9443c01a7336-2f03f18fb43mr715205ad.10.1795100068394; Thu, 19
 Nov 2026 06:54:28 -0800 (PST)
Date: Thu, 19 Nov 2026 06:54:27 -0800
In-Reply-To: <120ad525-efa5-4129-9d97-fa6fa5db747f@arm.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-2-steven.price@arm.com>
 <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
 <6bb490cd-ebbe-41d7-adf3-d6eaf0e53478@arm.com> <b1ef7241-54b0-4a17-83b6-0008e722f2f6@arm.com>
 <8a095a42-662a-416d-a5d7-79e10161201c@arm.com> <cc27e6a8-6bfa-4c82-92a7-33175baf6803@arm.com>
 <120ad525-efa5-4129-9d97-fa6fa5db747f@arm.com>
Message-ID: <av8No1rvJLXwciId@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
From: Sean Christopherson <seanjc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 19, 2026, Suzuki K Poulose wrote:
> I see, thanks Steven. For context:
> 
> Arm64 currently (without inplace conversion support) only allows GMEM
> with MMAP flags only and relies on kvm_slot_gmem_only() to detect that
> the GMEM has MMAP flag. But, when we enable inplace conversion,
> we can't reliably reject the slots by kvm_slot_gmem_only(), because
> all GMEM slots are marked GMEM only with inplace conversion.
> 
> Also, from the API Documentation,
> 
> "When the KVM MMU performs a PFN lookup to service a guest fault, the fault
> will always be consumed from guest_memfd, regardless of whether it is a shared
> or a private fault (unless in-place conversion is disabled and the backing
> guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set)."
> 
> So, in effect, with in-place conversion enabled a KVM_CREATE_GUEST_MEMFD
> without GUEST_MEMFD_FLAG_MMAP is an error

It's only an error if (a) the userspace address in the memslot points at the
gmem fd and (b) something in KVM tries to actually GUP the memslot using the
userspace virtual address.

> and thats what this patch is trying to fix in arm64 KVM. The question is:
> 
> 1) Should this be fixed ? How does TDX/SNP support older VMMs with
> inplace conversion ? What was the conclusion on this breakage ?

There is no "breakage".  If userspace doesn't point the userspace address at a
valid VMA, that userspace's problem.  The only thing the early check would do is
prevent weird use cases that may or may not be valid (and for which KVM doesn't
care), and error out earlier if KVM guesses right and userspace really did goof.

> 2) If it should be, then shouldn't it be done in kvm_gmem_create() ?

No.  As above, I don't see any reason to have the check at all.
