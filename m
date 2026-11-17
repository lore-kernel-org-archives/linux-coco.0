Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927837;
	b=DRKFqL3iaqgSDBV+l1W9vsto45QeWbX6HzJxDg8ZOJMjWs0JoBd4XzaWaCU5UfmGSLhj
	 kO0KtciKgl9TErlOihiIui6kpcoeGtqnueCjePScVCGFWn81UwgV5m+CI7hJzrG1J6ghz
	 dCgPjn9LmBKg4j4WaOl/DbTVRsg+Ot2eH/O9OmscjsFbZ0IMRJBDe5PUB0laUHgiJvmuu
	 OJE+myWNL4qMDqyhfZbLfZd/pGFTB7dNv8LaecBbP9MMFWmNvRiQSHhVLk+fb2AsTW/Fe
	 gCEguTDsAd+g0Szx4PvszVvutYH3qvQ52xp2z9DebogDIbTrDpjDm0Zz0xxNYO0RDWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
	b=mf8bI+eazYzU4BOGQ2Ac//h9hzARPM5ueh0BEIqGE9m8iRAdglnxPAfU+w5oSLIGDDNB
	 oqwhAsP5mAZtXgmIrf+WK9BewM3GwLNasMsFBPqbQpRWFyM/hYsgybeD+HUXi9khETAz8
	 MPE7xzM1UZVMMGGEIj9mjQ/uBMR3I5rBtzSwjE7pHCyyVL+OlIrkN0xP9tKbVOEZe+Cnn
	 YKJznTyH0TstfFqc07UQwzoiRycN0a1i56R2SrZz5QNsIGLUqsrqwmM5T70fbk++tG2M1
	 Cuke/6IB7eivy/fSTx4lMx2Odvl/2+gF3+wfBY70tEhBDtLvVCrKTNN/0/TDO4vGIoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nAqLFQJM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8088B606A32C
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 15:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8088B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nAqLFQJM
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so6771e87.1
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 07:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794927835; cv=none;
        d=google.com; s=arc-20260327;
        b=iFan7LT5UFBan7dSs3tY8xIw27su4cd2Jbor9FtUdPyROA2G2OXhhDkT8O7U6dFtIM
         pmjTfdg2YuDKbopGMMLgnWv4OI9vssGoh6SPddqRMjFwlBQ2fHH2HGHqrkSI+N/qYC0e
         TEQhR675Gw7FzXj9NQDxSPeYFaSULu+L+DO6iqvCbaYlfyX9XO+XRxjiFwPCJgK0BCFJ
         ShCySzZakk4jCuvgaufWyqDo6SBOX5QOB7HVyNpRbWitgce4xIyCAEurG4lmox4gOVB9
         jcsYlOlm2uuRJPlsiBYzuM1XbL4897lwXMCyYOZc9DJtqCA0W7sn0IJXoKZUShIWY1pT
         uebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        fh=OVv2x+CuXCLxk90xpmreMcCWlgQ+eHkfUky/v0bylAk=;
        b=HLrWJ4ACz/ffsjgd8nsBX0OAeDEt+XxvGsH2suD4MqZD+PbHsQkBZmctrZSnGnPAl+
         Oe4HPIl056yHqGPScDKyo54czIGxbBemP8TKfxKsuoujIJZ0QDoBF127W6/HagPHYDLY
         4V8D0udJJ8HmI/Glrw9+3+ZnSL8XEggAq0SwjMN0wReMc0PraCuNH2xspAcyXw6uqIkS
         Odi/TB0FHaVdAIbCSDEb6x/fRQDEEarlxft/0rEFbeS7wMEyvhd7wHqL2ej7wgeoJsQ+
         dkvzG3s/cCpQn2teVdlapUQwcHmAnS60j0J08Un7MYU0OVtk+VZmaHbqBpYEkdgKp0sM
         jM9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927835; x=1795532635; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        b=nAqLFQJMoe4GapOS4ddm5TFvMsplyb7Cn85pFXrd8SKGVbDDh2r7u2T7wqHvcOOLrc
         PyANY/tr0UA+Y4DrZXaQxdeNjNocQ30wYH7a6a1eyKQ5F+HuQAxxN3BEbIT+56BM3pJe
         O8DUTlzfS82ASOCw5Umj41OopgvSrmxE0/IRhD1weob6jy466dkxrp3fGlSOMUo2rxme
         Ot954oUSp01eT9nAA2OcTLL6zpFftiHNI0OnJkLAwgwWdZjb2VWDRKpbkEnBE16swYV2
         FVBhtYZnBUhVTXjQjROkwQP6KRt5l9rWKV5A1Wy/6diX9Dr9lG25lMm8ElIxKBT2XC0N
         IWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927835; x=1795532635;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        b=nABwqz7MkhOVWGpx3IqepZBa95xTdGZVcUsDpDed2AJXELXnv9sT99AuybX6uqXRq7
         +10SZdt5HOq/FvY9Ft3538iQMxIEZMVktgoaMDemQ7sPz0mEa66HWvEgXbWB9J0ejsML
         KZfrBHo9I9IV9hmCtaf0lsw2lqJ7xmzpSG0g8F+aN3WUQgf9gz9pxYJjXN3KC8n2BvF+
         J8THeO5hIh660oEgc0bhjHGxMsTxXVxEQzIiJ5h/yItYQS7xyGzPYKk907Iug5VX2Y0B
         hkQMtj93MT6uxHNWXqN97GBim883tL7ZR4WKvEkgXC2u+6J/9e4uXe0fxkn6/mMLLkRY
         cTmg==
X-Forwarded-Encrypted: i=1; AL+hErFRcI3Grt504K7dFIpZl4GACgBHkLwEiKzHw7K7GJ7tiVveOoC72iv7vVc3N6oi8g5i3DO3QL9REfap@lists.linux.dev
X-Gm-Message-State: APuU4Z/e97caVTGzNXkoeiZ7f+ftVjJeorXyx2oSecAT65fYhEA9WHQP
	pny0gX/LUfRdRyVLWdBaW/AHrN/7YPQ6jY+XTZLuZBvRr8gmDeX5eC+WYV1HPlg0be04OGGwCIX
	bukmM3yPjgWCoR3I11IzAfiCH73wdvEZRceTswl5a
X-Gm-Gg: AYBFou2OWzs6MhRAV+vkzGGO1pHsA4174oxm2uZ+KycPQlM9xYO2EfE1uB/clbGgE2h
	AUOO434I11tapG3aG8+RJWcFrE3y13Z668IPccinL5RofWM51a4R+BJksDmtI8EcjMVoDoiiSMt
	V+HqxCQNCQV8/ChbNYd/xdVHdIBOYm/z851GLlvfCTIVr9UQgEtFbrSsI/rbpc2Tm5zE8OUszhF
	hcHY/cL8JAYolTqXT/glseRiNYTHwgSlS24dW4qHLf5zvyuNBzJFuoAJgBoQX7iym7dmaG555pc
	CE4Yqbdqq3xj4qXEZyFvqfgZlLaP1aNLI0vewlbx3tDZVj5/msGO47b6rZBiQxfFwRKiCckdNTQ
	KNmcoilCZns4dpfdFF8D51QRH0OlEj/PuSsqW4mSd6skNEum3BCm3Qys23xBvm4x7H+JlNrU4zw
	1wgRC3XDBFvlsCVoxTL3a2cyd0
X-Received: by 2002:a05:6512:2249:b0:5c1:543d:2e3e with SMTP id
 2adb3069b0e04-5c1a2166b35mr171174e87.7.1794927834031; Tue, 17 Nov 2026
 07:03:54 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-11-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-11-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 15:02:00 +0000
X-Gm-Features: AclHuK_cslY3zjG6J6IGbNXJdnealsL3yNGOi2bev9GDyOWEmQLYI5dVsAlimaY
Message-ID: <CA+EHjTy-0k08Ukyo+4mmzqVn9UjRnvhy=BQT9kxSj7CBzzwO_Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] KVM: arm64: Dispatch stage-2 destruction by VM flavor
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Mon, 16 Nov 2026 16:43:56 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
>  static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>  {
>          struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> -        unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
> -
> -        /*
> -         * Realm RTTs are inaccessible to the host and may contain stale data
> -         * after the RMM has released them. The non-root RTTs are explicitly
> -         * destroyed through RMI before the RD is destroyed; only the root PGD
> -         * pages remain to be freed here.
> -         */
> -        if (!kvm_vm_is_realm(kvm))
> -                stage2_destroy_range(pgt, 0, BIT(ia_bits));

Could this patch go before patch 4? Then patch 4 wouldn't need to add
this check.

Cheers,
/fuad
