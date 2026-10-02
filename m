Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64B479874
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955060; cv=pass; b=n2+63nciXLqlI4BP4vowSeLvoczUQU1/jvEWne7+prmoW6P8D95A/dkEX4YTowTyGCQeFx11RULATrsE2W9YV9NiPf8gZjNrkZJ6o60S+Li7ko103W7kGbzw4d+0JxeDEjQWqSmVIHww3OzWwzYRgcKCSWla98eMEAMXUOhTV78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955060; c=relaxed/simple;
	bh=fs5RDQ985eGOdUMkYTIO1AkzMa4f/KMg1mJ+9inMXJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdkEbDrlTsICmNaxLzBMUzEARJ19kcQ+E2GmUmp84f8k0vPh+LC5Sr7HkHUvSfjiqi3uWr3/dEEXPBtquEsF/98RWqD3flioH1Yquqm5Vf8q/FADNL+u4Ni6jGc0anq5SCNQtVnbouNJpNUOVvB4jzW+K2SYtBtm0Pjh62xyXmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kvzh/2XL; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kvzh/2XL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba3d1ea20cso8679e87.0
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 08:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790955056; cv=none;
        d=google.com; s=arc-20260327;
        b=cs/13nEOWONCbLKZEYk4/1JaGMFF0ZCP+GjJBlPdvSlZpjyhB53jZ2uHIwrHdhL5eQ
         lOweXpKMC2sIVcTiUL2wB10Lqos3CmVBgufuYBoa323sHjUAHyZY0c20uEnnQI2XWtNs
         yUZXgekbKkO3JMqh6FZbHBoHG4LTUfnivY/mwdZ5kJuN/Sm6p3Stl/5I4RypxuSI2Gqh
         jU1nZwpOfyHle1GtJZmymwofRwshFhoiXn+N/BJW20juiiN2Z7M7NteRBedgj6xJ2Ycw
         fAoztHV+cG5KMlIqs2Puz48sm83vsHXKG8bI9H1bvlIDpO3JgRi0kKAcTVdFtkkM3Phy
         mzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        fh=iQagQIST199GVsC8uPlhfcEOhsKr7d4d2+5UYQYpRug=;
        b=DPxBtYRnrBG5xa8qsytPOBJvJNskCdDz33MsRM+n8zLCBFVtr6PfvXfHsR0ggWS972
         Vb7t0QqbFd57EJOEADY/3+Rq3X8JmG+hTUES3Vx4Uh+vkUrDi7L8hHJJcpOsP/ucu6Rp
         kT40bzxJnWvMPEnDld37ZiBz9vfmuekaI+qsiYUdsNW29tr//9ACX1jtLp5uk/8QbEnn
         nyIdmntqf2ceOh6hRDepX4zC3iTyVz2W4pXjjJmfP23TJSffVMNLOZRzPS3CJ2B+5QWx
         lauvSgkWT55qzuDMnrUMp5syUCRklKFwjQMueJ5iueQ+eFS958XpyB17GzRTSPZIZSc6
         j3vQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790955056; x=1791559856; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        b=Kvzh/2XLsmDeY4W9dOk+N1lWPju45l1hE8ZfbBOmFCLDX+oSe1aI5+bMLYjAmSMEp+
         5m2Sb0QBuehmLKToleeKX2hExWMK48gdg6/EmLfLQHjpWCw1ev7B5C7p0//0VTLcaAit
         ySaVHepS5sUW4kh4+GiPC1uHnk+8rCuOilX5MUqEsvzZLxPe/sndHFfcCaIu7z57UXZM
         hTzuE/uC9h656Z0qCKgG1YegxGquXEJajbamwx6UhBvH/pjwCFnL2mLut01O7IoRVET9
         Yir0zNQk0bPWCDIIY9iF3zUysxEp228QkxKpCL9viUY7To277tdnSlSzJh2OZC5sqsk+
         TQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955056; x=1791559856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        b=ekEjuEudl3A8RHsPfQc0tp66Lgj43LEDmL1jgx9j1RHOmV6ouUR/dBnO23t933d/XM
         mnYGtry90vPo5taW2hjopCtQ0i0ZYIHTeQCMSz3jpn4Z5nF4TdxF0Gy6eaPyLSENO37H
         ugxgW2h7Ic1eJ72JYh247cWH++n1Wk36hRCNaFtqR8j2diXfwuQh4DRno5QnxF34MP6S
         hb6+MflKONK/GYNgmGBNdLWsRxNCTh8TNvuKjl7fo2Ltrqx/e7hKY1OYKGxwW/dXOkm0
         QtDQ+5NLBe/lkKnatAxOPpRM34jsfA2QhgaH8gl6HNMmdz69rntd/cmpVIjyUXdOhaqq
         MfzA==
X-Forwarded-Encrypted: i=1; AKwUvBzUqrPvDQqRJtY8HAN9nZMWdzTx2WHfBMQ69u1Y4x5Gf2yChyISOYWBvJ8dHa4I6YTDMQ8g4BZhCM6V@lists.linux.dev
X-Gm-Message-State: AFq9FYJDuxI7VESszGaWGvgVivwx/nae70Se3RX67CyCFrC9lj6AUvs7
	bfYavkjHDKSMOFSgZ/XsHBX6NpYRO/+058A9Fu0aGL6eyglr4X3WRPvzN5EnTFL3+6vCLW/CVtB
	M5cZbRX6ZXkBekColY3co93x/p2HPCYTXH8ZoAouI
X-Gm-Gg: AYBFou112Mgj+oSvTufYkVSjtO5smYdnmCsFc9CNV0sjn7qu3/ASwWWymEIc4lEyvNp
	hwxeLaDkbInwDyfrVNcvHhuNb8279wktbLSSY2mhbveRKDa1G3gnvMHTiFrU3t8sKUhxMCRe/JW
	PtvqwCFM6Zs/BOpEhKQd/vBmCRtG0rqXMLywrt4IoxmBmwNDdAFN/ZfI50M0gAOAoTtkhvPOAcL
	yqw8imUpjCLjDkU1v2HgNd5Rl7j6brT04czmuYRe4kNHusibN3Kr3tIf/TspyxgERfIlRHM9i0S
	6HQnhr3k8XZc2uxLd7UEY9N6zg1jFCjuEBwpI8huTzWJxnAUdQDdeI4JjZs5N4TtYbrvhqfMC6F
	DokgMjP7ywNQLmBaiJ5EhBwur
X-Received: by 2002:a05:6512:3b26:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7c91a8a0mr183008e87.2.1790955055657; Fri, 02 Oct 2026
 08:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org> <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org> <CA+EHjTy4rb+6z0bqh7sPqACES0EDpURdeoyiFGmdw3p0PENcOQ@mail.gmail.com>
 <86o6dc2ka1.wl-maz@kernel.org>
In-Reply-To: <86o6dc2ka1.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 16:30:19 +0100
X-Gm-Features: AclHuK-WxuFGXDBt-i8aW4clYrHg0y_cefCod2ajVZ-nmk2Rl2Vmyq6bDATGZwQ
Message-ID: <CA+EHjTy9wTbjFpgvDOX9Xexw4jpx4uHMHM9ckXYZw8H0_QbAvQ@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 at 16:29, Marc Zyngier <maz@kernel.org> wrote:
...
> > I know this is a sketch, but just in case: that's inverted. The sync
> > only applies to non-protected pKVM VMs (EL2 ignores it for protected
> > ones), so it would be != VM_PKVM.
>
> See what I meant about this stuff being completely intractable? I
> still have no idea what it means! ;-)

Yeah... what is a `!= VM_PKVM` ?!

:D
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
