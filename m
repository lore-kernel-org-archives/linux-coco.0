Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925935;
	b=QbCiMQlo4t0icvMbDtETDVgMLvXgJr5AG5NnyX+YcfFQDXPDKkkPQ/bmyG1YXYss0DOD
	 I1zJ2krmXHSsmh2KZxqEOcxZyNqmFsA7sT6iytzZm5nmq57ny+aLA3gxuySR1zY/sgWfu
	 4mLsfZUhQTR/ZQ+vXCQ8O16ofqPsUBdeCFZzdQwBLgzoBLbv7Lr/wmckAUI8hbrMF1QPa
	 pISRGlkR8dVTFr8kLmZWWUtlwQiM2HdPxDEanaHMLAYPT/1eDQVxsXUkIU2Mw108zPl+l
	 VQPUs5gcXg7Qxyeo5ZZV1HcbMW0i/4Cw0nGLclGTFszYmv5fteHFZcufDhKKXyXD2Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
	b=c/HWSc+kML6mIb6uK/zWtQZ7kwCMwkXMlnJWKUOatFCeb6TWMqYoSlJxLD4AKnihuwBe
	 g/j3W0NLdZjYtYoXC+KI1sd11ZshxGrnm9SzY9uj91xm/3I7upir3550iGXWluCa0zMge
	 18o2ozXDBrW9+rfoXaTVr/vEvYI9zzQslCzkR7dsZC0Pjg4xW0GSi8RRv9FkiZsy9DFeh
	 A0UL7k0wuRL6HGl6xh+7ofjBqf87EPBtCc6v6Fsiqk3GLICKh2+ooVp/saspQcekUIMW5
	 vXLUKpVYeoE+6jjsVtQF3ohb34K+LJcb4qi6o95Ccg2WbstNchywz3t/VIjEQtx0ZTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Fvd9/n65";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F47606A31C
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 14:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F47606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fvd9/n65
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso7449e87.1
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 06:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925933; cv=none;
        d=google.com; s=arc-20260327;
        b=AI4bxSDqphg/T9kup3vOhc/Ul4gNumUoozqM/cBDRCeVP9mVcQjp7YnfGwDJOlJiTF
         xl+0yuAlj4Hv3PwW8JecjMsLkKz3flKKguWoOad7c9NxcfyctDAl5ui9f+DU4ZI7494G
         UqVhtAHyzjZTF10ULyb116cwoHKK78DeCZdc8KFbhS7PcV9myxblA33gaj7lUlQbqnh6
         QgQeWIavWBN4qqj8ne2EBBfOa0uJKXCRNAUvTC/Be4g1Ryc0wChOzdmLkNpJhupu9q8P
         UzdgHkczwg7vAzATFqImffZqmynSievNdSfyMewr7IBKH9U7nmxoR7uTHu8Zvs+hnwnR
         8EZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        fh=sQ1T1ciu8kV9dAJKzNX9Fu1So/+IZNMg5SgACQ6ENXA=;
        b=r7FRZkPfykYXLi44Pnu8yljHForPmmTed85ckVr3elmjEQg1iuhGxnhrXZ7g2TNOII
         NeMzwPXNBUnF8rjx3zyU8QesnChbHRpdzhdJqud9R3tKbzJobt4LRw8wdCW+8p4oJ6a5
         v/KQNwdrnnmNpwbe0qElTF7YkqVf9o5aElS8C4Vh+RwhAXlnmiQgGNynzcAdNdZCdfRL
         PEuwBcTNmXp91v9mgD0kmP0u21PzmwtG4y7q7rRcvALMJpDihWHPXHvoeqd5mTSb8kKE
         q0NWOKXad/0bGyJn954Mn48/tb2t+DZcoh64WDnqcgBKfDZKiCQLD3UrNLnlZHd4OU8Y
         Crvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925933; x=1795530733; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        b=Fvd9/n65nwL3uC1H7+vXOndTzQdxCVguJQWvZDPPjm4IeebQpsf5Ff5+Nwwz6fewBq
         VVWh8BALPhTLlRz5JCDk5cCsWXPotPCUoL38C7FraX359ZFzg8hCeFgdvC+l8uw9dkaA
         xRsoaJj138lUhoY1vBXGtyv4kkzDJloBtkTej0jlNQCFs46dOZbrg3BsOyhjMWHIp7nt
         XDPo4hX7og01omaeUWD2Zqku7uF+qVU7N4ial29rEKDP7mXWeQg5+vVXKJq5GNrDoLKv
         K0f74TT2BZRXH/2/08OO52bdIERVlflLSphWpeoFwEFByJAcOGa/C8JSCvSFkUrnxu8C
         dt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925933; x=1795530733;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        b=t2t4ASL2D1JJ8q+aLsnr+QEvGGBWAvljpZSkJACl/48Zyx/c6W+5nyuAuNKEbh7pE2
         MdD32EyORK7cuPugxHVB4VwxD4i+07LseqAruP71vvL8kchDv87rwLn6ybuML/gQVEu1
         gOJ0LsozOJVVnlCGrIuWpd/h0262cC5spP/Z58k7NJHqavjaGSSphGYGuVs2k/fhyEEr
         5RPxUNvjso34mICoviOwJMHNi90NN0I9YORODrv4+ufpmxC99U52hUuXM58+GctPJmOZ
         JWL9Wwq6HclzjKtMTQsCtceDSVTMvlZouTp20tUg6O2w8M/TMg4x/rLRRyncYFmmctLR
         le8w==
X-Forwarded-Encrypted: i=1; AL+hErEfzpJd0CgiBCaUhjFqmp6qVbR2VBh+errCJ/HoL5eYLMuvjBU5sR/zK5c9tvxK5zaOgLBvb11XN23z@lists.linux.dev
X-Gm-Message-State: APuU4Z+IDQAs6C/WFttGdx8fpY4Hfk8lHtM5g1Ys5IYdIWLJGhHR0kGg
	UdXflIkAHY86HjD8n17wc8odEBvP9gdOROo4O3xXmRExoXRhm5ucKzZtK6HOkZiPaeK78bQkPoe
	inJLXcS45cEtidwWIJRLbfyyrGd3MXZHkz24K5Kya
X-Gm-Gg: AYBFou1OMO4XDZNgy6x09OBKrlsWGtruf8QBM8VUNPDP7wgMWkKCm3gzEikv0RMdqRr
	kQhrUG6iFENtCU7HL8GlHVBXaOAEFPmQx7byBWxtdQlDeg7E4y6WiqZ+6ms+HsXNuOn7M6U1yUu
	uF7f2fHdLODzAhfrYVC+5vDAj0R2q50+Bw2nzqRTGnQpUSScWTiSm96uV7tWpxsLYcpUJSp7Mjr
	DnDAR+weIzz31ama1A5Sc+KfSRZgyHLvsJndBlrf3F0kQxotHwKxvKnsQYwDov5fyYUE6/mPeDO
	ZQSZ5sW8ZbbJuYJ8QvEbyk+2xIFCVqG/KBWVf2lAEg//G6L1zSRkHoMJYFE/VrAXq0bGJangPm/
	aGo4BxP74+0kxdYrBru307wP2qCJY+QmQJE5xgDQgzmkb/gUL17JrCy8A/vu1F6TikWjXMQ77MD
	sht97QGKDv0JMvZjF4yQzIMY0=
X-Received: by 2002:a05:6512:1111:b0:5c1:4f9f:1ae6 with SMTP id
 2adb3069b0e04-5c1a217f086mr135560e87.15.1794925932245; Tue, 17 Nov 2026
 06:32:12 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-8-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-8-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:31:35 +0000
X-Gm-Features: AclHuK8jwarv0Qdp1aWUBJu9cvVLVN2wG1yO28RoPz1SpZjEhJ3_zh_LKO1lzYo
Message-ID: <CA+EHjTwqYUBvhjF8dxqVA1mF_Qe1r2UZdwkZ+Zirgmm2um=skg@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] KVM: Allow architectures to reject memslot
 changes before invalidation
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Mon, 16 Nov 2026 16:43:53 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> Architectures may need to reject deletion of a memory slot without
> changing the guest's memory mappings. Currently, KVM invalidates the slot
> and calls kvm_arch_flush_shadow_memslot() before
> kvm_arch_prepare_memory_region() can reject the request. On arm64, this
> unmaps the slot from stage-2. Restoring the old memslot on failure does not
> restore those mappings, so even a rejected deletion has side effects.
[...]
> Move arm64's protected VM checks into the new hook so that unsupported
> deletions and moves are rejected before stage-2 unmapping. Keep resource
> preparation after invalidation, since invalidation drops slots_arch_lock
> and allows concurrent updates to architecture-specific memslot metadata.

For pVMs the invalidation doesn't touch stage-2
(protected_pkvm_vm_s2_ops uses no_stage2_unmap_range()), so the reason
for the hook is the Realm case in the next patch. Can you change the
message to say that?

Cheers,
/fuad
