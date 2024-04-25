Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49328F7
	for <linux-coco@lists.linux.dev>; Thu, 25 Apr 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714038571; cv=none; b=pwXCOXf9jpfX1Dd3b+5MKu7b1/red1S5c/MNpwyquOY/ZCmBuJ0WrW7Tjir97kqHcjl22UoWVZGy5zYRqecVYo5QSDCQmNrv4rJfIiuOu96qJ6b37i2E4iP2pxeVAEeWwhiiWhj2awj/3HJ6uNM99+v01vmDbbxjpscN+SjUDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714038571; c=relaxed/simple;
	bh=35aW69QPE+lCEJiyyhy9K78gc5bTQ0CCX9ATNwOcmrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEffshXuzWnVupd9sveJbYMA+Msq/BwgmUiooTNaCc9gWbJsR5zPEtYaKnfe/znA/t6qvXf82kk+qGhTlZOszyjn+dz0rmWaunaSXRb4hhXv426ZXs9C0utIAHV4UEpaAi2fZd8xXYekJyDadDS6elDR5Mrs/J38Qu5lUkjJDCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HwgY0t1d; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HwgY0t1d"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-47a21e0cde6so346319137.0
        for <linux-coco@lists.linux.dev>; Thu, 25 Apr 2024 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714038567; x=1714643367; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tClP56HRC4jtLkyQNL35pL67xVeU0Fa8cWNQ8DcTkjY=;
        b=HwgY0t1d8TONmztNTMphPMhxCZMNjAAx40+x8JalZ1xHgwOozVX+YIUgztk7Bv/wHo
         /yeYtlYlbc3vf1KQDy6KZ3jYi3n261PUB4KHDnancyC9zkI9YSa+R/giKvv9G1vCKhfX
         d6uuL5R3Xokp957aD5a6mCIZEJOfm5BZ0XhVn1dzEa3h8h4uO++tvMLywopOXd6rWGJ6
         vQcewVteGx764T68vJMbagXT1sfNUxPg4zajMVzNyTTxUJXpNkNGnsipRgrMGXyqyDVR
         Mtr30QulH78hP023twidwSYrzYRV5+Y9WP5QVMPMzuWG2L42D7idEGy7viMoSV3Jl7BV
         DRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714038567; x=1714643367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tClP56HRC4jtLkyQNL35pL67xVeU0Fa8cWNQ8DcTkjY=;
        b=RzgN+jtwQlLs8oMaFQX5AMOfiKImgGwSGsYDAj2iJms0UUx5tHXk3lA32TfVO9+UhO
         ZbiWOk3qJLo5OzDY7t48Q9DM9noj/yxC0DwsGqboNHIM5CJ54zUI9ZsRYGIKgu825DWW
         +s9aPxSZaxbGAPYuyn+omh9LekhHzfa7d9cikmMrKdRrm6pwGOc52W8taRpNFujZSbUB
         AEeu0CE/Nl/+K9aR3rJP6vn42oSwLl0tRxf1m430S3IadJu/b5rWVNeSVuHDO1gw1xWa
         RPRkFMJTycmqt9HG4N+Eec3gtgzkruGMXy/3B3OblyMcGADaWmOs9V1waeSvFOm9kMF9
         0pzg==
X-Forwarded-Encrypted: i=1; AJvYcCXqW3TZUlQ0hNtuZ5EgXS9VP/qCK0zY6rnHDm+QeBvNBBzddRJFG2LXejq6Hvlvw7tUXvMJ3AlFkFW3dWaKvwpikc7g7DidTpYSyg==
X-Gm-Message-State: AOJu0Yz23dB9Qzj86YXjJzXK758E1t8ktH2ZfMU7honfscGNuF8WRMG0
	qQgEpKWFnQsQysbgSthcPr55SlURlNqoo0LQ0rtwL6glwLOEaM3WgAdLpjhbNmmrI2NO+k48kwn
	mSx/l9V4LjFpTfrgGldbTIybrBTLtSqlGhutS
X-Google-Smtp-Source: AGHT+IEC/dRlxbrk0648Rxs8czpEdv4hXYFhGbXj3jiK+CmRCTvqhbhhoKq/K5RAClwxB81VEQO2Gra7meS06C6gGrs=
X-Received: by 2002:a05:6102:11eb:b0:47b:9ca3:e03d with SMTP id
 e11-20020a05610211eb00b0047b9ca3e03dmr4935716vsg.11.1714038567115; Thu, 25
 Apr 2024 02:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240412084056.1733704-1-steven.price@arm.com>
 <20240412084309.1733783-1-steven.price@arm.com> <20240412084309.1733783-2-steven.price@arm.com>
In-Reply-To: <20240412084309.1733783-2-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Apr 2024 10:48:50 +0100
Message-ID: <CA+EHjTwDaP6qULmjEGH=Eye=vjFikr9iJHEyzzX+cr_sH57vcA@mail.gmail.com>
Subject: Re: [PATCH v2 01/43] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Sean Christopherson <seanjc@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 12, 2024 at 9:43=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Add flags to "struct kvm_gfn_range" to let notifier events target only
> shared and only private mappings, and write up the existing mmu_notifier
> events to be shared-only (private memory is never associated with a
> userspace virtual address, i.e. can't be reached via mmu_notifiers).
>
> Add two flags so that KVM can handle the three possibilities (shared,
> private, and shared+private) without needing something like a tri-state
> enum.
>
> Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  include/linux/kvm_host.h | 2 ++
>  virt/kvm/kvm_main.c      | 7 +++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 48f31dcd318a..c7581360fd88 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -268,6 +268,8 @@ struct kvm_gfn_range {
>         gfn_t start;
>         gfn_t end;
>         union kvm_mmu_notifier_arg arg;
> +       bool only_private;
> +       bool only_shared;
>         bool may_block;
>  };
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index fb49c2a60200..3486ceef6f4e 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -633,6 +633,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva=
_range(struct kvm *kvm,
>                          * the second or later invocation of the handler)=
.
>                          */
>                         gfn_range.arg =3D range->arg;
> +
> +                       /*
> +                        * HVA-based notifications aren't relevant to pri=
vate
> +                        * mappings as they don't have a userspace mappin=
g.
> +                        */
> +                       gfn_range.only_private =3D false;
> +                       gfn_range.only_shared =3D true;
>                         gfn_range.may_block =3D range->may_block;

I'd discussed this with Sean when he posted this earlier. Having two
booleans to encode three valid states could be confusing. In response,
Sean suggested using an enum instead:
https://lore.kernel.org/all/ZUO1Giju0GkUdF0o@google.com/

Cheers,
/fuad

>
>                         /*


> --
> 2.34.1
>
