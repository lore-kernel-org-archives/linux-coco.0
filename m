Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837884;
	b=rdD5C+b/gQtN8n3C4Hhcou1dHKeppiNiSYEWTE1HkndWqfIUtM3xLUTZw7lBznZ0/ak4
	 k+Cd8txnkaP8gOab3DrW3xufhIlTRu52oh54OgDZM3XRbogIZEHFqFsohVU2XpwTjy+56
	 TgBoJ8h+IbaTFw9Re/g1wA6JEEQAPNMptIj6FeX/R0Kp1A/2tCVQCGOe0RUXqZQ6o+S99
	 2Bg2ugbf4L3c3jHiC/437HyCl6kZF8zLMQDl3FtKkzK/UMHxnwbw+A7NmaW2wwnpsfsen
	 SAahDGkdwW6ZsUrT+jgMw0DjUPPjnZwpPkbVW7imXPwKoh6fwYGtL1hoqcAF40iprzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=;
	b=DmmKf+UHGN1J3JG8vIS+SHonUDqSjxxcrr+DUohbv12oPrRrD+AwD8nHekx2YHMH1SdS
	 QJB+BDs6jGBV5SUXZiOFVGxYVQ5IDFY5RtKeV0vgVHTobDLS6VsbeXuhLOsTEBGRCgwug
	 1lt3B9RthVavBYmKXffvrhbgXZ263NPQQxT/yeIJ4YtbgGHmlJzxvjq926+RM3jUM1G6K
	 nHTsGbLZiPQVyrQ+goKGnZeIS57md8QhxI6EyfP1RDtw1OHFWh81r76ibXtsSTnXJIZwq
	 hAyR/yj4amZQCsFBuS+MiaPrM0eYtVf8a9kA7yA68E/o40LPaMysz5i8lL4+yTAqBhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lRwku5wE;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA2606A32C
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 14:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDA2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lRwku5wE
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfc004920so36644951fa.3
        for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794837882; x=1795442682; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=;
        b=lRwku5wEPZGBycPf0+L/uO5RADc61YaWre3GZPxrYjMOTjrBw59uRV2EkQLPG93Am+
         WwBXKRT94x3us5FDC5XwDWzARqx+9avcFmCgCytvCT4mNVECaN1NzEsf7Dit+tRM51E5
         eVEThFyUUZvk45kCDmNBmH888MBRi1ZjHOpAIimkBKEr5anNUXy+rAA/MKtpE5qkOQCo
         AseB3jeyskRZwgSz/ChUdBO1E+O/YoeAMxUwXT0+H4qazwLnne7LOps0GS5WinyFuJm3
         YOoR/bnEeLpIYD7/0e8g74VgYT2Oh4pjmvld0LlRGe/atnqqM95a8nCXR5NBrO1VYlVo
         PUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837882; x=1795442682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=;
        b=SmUuEOic0qhyPS3qL9WXpYUvE9xuwNZ87Dpq0BrN/VGEAtrXU/AaGkmJhrwuMe3i8o
         VR4+wKaqnQVSzWThJFkRrYoO/JG0/NiTwhTF8huzj8vUj+lL20wyv6coMNZAlTRkmUiY
         Yo6O8KXFI+3NXOXXgp7I5Yt4Ka1cLkZl3pquAI4QZrbZrWBXeg2c8OoLIufyn5OLi/h9
         YP9icXosg7aVQNEUsqOwZ++7vAl1SjRHOffohSpgfKLM5WZg/6+jCWw06HQakZIfTqd+
         ebOxzlpzqoSU+Urpnd8JTnFuET6wYnphAwTC3lWQLhgGu8L1c5q2Hg+Vo41EJ7WfL7CC
         gRNg==
X-Forwarded-Encrypted: i=1; AL+hErEn7X9w3bD8VXidHfbf2s3Ymc18lSXHSx4HTBNaePF93U5ECf//YOK4WhSxAhzS805WulqyhGLsAn0o@lists.linux.dev
X-Gm-Message-State: APuU4Z+9JoCNoHDinGAhW7ctiJ3WRBnXlOKEE9FU7Q88+OaRYL8O5VON
	s21AyDamCLd0zVa1qlWCiu6BWUnhqMMi3rAHLnc+ycBUuvkBNDjgBfHr9tNCUOxAZQ==
X-Gm-Gg: AYBFou10H5cTmKRxyJLtS+AK9ccmyAyxA96IFMPLbwV106CpKP8LclAC924h7xnGoP7
	vuSVsiUlsoECbMrt31W07RHuaCWiuasWCHvygReONIUmTD0KRt21J9wkF0eSbS+T0F8yvT47XSZ
	lWTD2wd1obXr2zxnk3+BLwrgE2V5d4rlSEE/fUBQKy4bKhxodSowUipcch+pYrUmsmCMb2I0V6p
	ZhwQWz6b5+aLs3T2caviUkDU9oezcE0UgomMDlc6S5ts6txWm/DHt/b7/x7SC4Y3V4/G6hOBpH2
	PGVIoB76VlVYuCarO2M+dX4cpF3TyCuclyICaJZrQF0PpGF0ZF+YzBkmH1QXdLic+k+zNdXun2R
	iVcaS4sQ6G/jrKTjTFYDhNIEk/0DsFM0JCbgCzhAxL2ocxEiicF2ER6DKQFQrflALijcPv6qCXx
	y9vLQSRfT6GKAUE3kaxBj+JcEdT4b2QJt9d4Ui24WTn3Ih7hlqkyqHPmvntty4OnFIl46ZrxG3s
	9b5u4EoVToR+n/efroQqwGKDxGcDBzlZgzSg+imjWuFHzYF8gWf7J6nZ4ea9y6B5ZvGT6UgWrSX
	BNMyiaMCHPCREfQWvB7lB9HOJfzowdoI/yBSBubL4usVbI6uRI6htGJbSTLWnxn2Gg==
X-Received: by 2002:a05:6512:2208:b0:5c1:5970:ae1f with SMTP id 2adb3069b0e04-5c170a25d42mr3870536e87.63.1794837881958;
        Mon, 16 Nov 2026 06:04:41 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm20599601f8f.57.2026.11.16.06.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:04:40 -0800 (PST)
Date: Mon, 16 Nov 2026 14:04:36 +0000
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
Message-ID: <avsNdPissIDAb1hA@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com>
 <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
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
In-Reply-To: <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>

On Mon, Nov 16, 2026 at 12:25:43PM +0000, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Mon, 16 Nov 2026 at 11:28, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > > +     /*
> > > +      * The host can read the pages as soon as they are shared, possibly
> > > +      * through a Non-cacheable mapping. No caller relies on their contents.
> > > +      */
> > > +     memset((void *)addr, 0, size);
> >
> > Are we sure we want that? The guest may want to setup memory and then share it.
> > I am not sure about modifying this API.
> 
> Right! I wanted to fix the bug for the ITS property table, which is
> shared before it's initialized, and totally forgot that this is the
> path all sharing goes through... I'll drop this, and put that fix back
> in the ITS series.
> 
> > > +     dcache_clean_poc(addr, addr + size);
> >
> > I believe the hypervisor is already doing the cache maintainance when the page
> > is mapped back into the host. (see stage2_map_walker_try_leaf())
> 
> I don't think it does on this path. host_mmu.mm_ops doesn't have a
> dcache_clean_inval_poc() callback, so stage2_map_walker_try_leaf()
> doesn't do the CMO for a host mapping. On the guest's side,
> __pkvm_guest_share_host() only changes the software bits of the
> existing mapping, and the walker returns before the CMO in that case.
> 
> Cheers,
> /fuad

Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
we are only changing the software bits, so no CMO. Actually I should have read
the comment in stage2_map_walker_try_leaf() more carefully.

That said, I wonder if that shouldn't be handled by the hypervisor, just like
hyp_poison_page() do the cache clean.

That would be slightly slower than letting the guest (who has a mapping already)
do it, but pKVM is enforcing isolation between host and guest, and it feels like
it should do it by default no matter the memory transition.

-- 
Vincent
