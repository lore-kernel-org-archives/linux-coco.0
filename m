Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A92E3703
	for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 11:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753442084; cv=none; b=cJGFxD9+vGPUGDTSDVHAxbGvokk3AyDqucR7VeNYkjDGQE2n0ZgU5689CkycwQXOw8znhdSRbs/FDiMJnQu4sTzRpTJ4gW9SDkfeDOg6xzWFYbVnhNFgPY7MLc0oz6sUc/QYqicaDL87Gp2cN4azBRi2pr4MwsIVmz/iUvvevZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753442084; c=relaxed/simple;
	bh=ShnHV7JNrTopJF7AM7OfGbO3XWiG23k6eeCn8GuXIpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uATBsztbN4EQt42hnTJnsC26eQZiacCsP3OEf0X7NL4H+6Zygv7OpmaQjbzl9A1swPPGZiVGFVlgQH3su+wWWeOmsZ3zRGBEKxvLwO4SbKLqM9ectEwzIjSQzr557seVx9DWJFNVnTePFnpL3EeRIhtu2PpH1r6XSfoxX4sfkxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqH9eWXB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqH9eWXB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234bfe37cccso16619305ad.0
        for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753442083; x=1754046883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaiH/38WONPy8fzRyhRHdFQdB6YbrzolydS9CtzX8Do=;
        b=hqH9eWXBBZb2UB2AuFN+ccjZzDwhIYqGFyqt1Vvexdp6yowBFwcCHg89lyRo6UUQvF
         DbdzD1AeLaIlMV5XcA+nl54dqBQU+pJ9prwXaiWw9LE0HlwnDAoBPQSQ4+I3zrpIyNKI
         1YymjK3mWzSyzMhkEh+YgrpAgGWNhY5tG0OTPCAdYJtBrxiv4u2bGRtDEYxKKGn7FaWh
         A0uQfyLSst7O2YfjJhIx4wZzkPA6nxzOqsbHpf5YzHoA/V5hmu2p9paLs9VZoGtuaYKv
         0989bj/gj/trEzo6aLRo9dwAeFpAYGXckDVBMMrW2sFVq6LHEzq09v7FPC0Ld5td98LG
         rNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753442083; x=1754046883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaiH/38WONPy8fzRyhRHdFQdB6YbrzolydS9CtzX8Do=;
        b=fgaIPLrX+SyA8LC+mL8Jg21h3zmpS7dN2f9tgMjKDy32Y03pdAri2g0aQwKmScRLBv
         Wkhm6WXQQ2hQO9EqqpAsGDYLzMbrgPKD2ySYyIRhDxH3jGtgl2H2m4U8JeE6BPak6ehK
         w7sDyH31PMdaD0E76strrYuDGglU6KBMZ66Mv7yQ/NYWTWmuD2ol30DjrOoWdhrkQa6h
         EwuEX+U7KHoznIGpxhLphCHgvAbJssepdsdYQ8y6BLHmd47m2tlOOJ07sT+JElDkaQHo
         im4SozLX5zHJfQcP2wCA26ZEEAZBnQ9WzkobUJE6QCC7sSBIsRSr/+mU8OK6EqlwDLCI
         Eunw==
X-Forwarded-Encrypted: i=1; AJvYcCU8EHJCMr1UqdzC/98QhzU4KsTYOXi6rFhfSWVfJF0ZL/anCqWVxuuJJZAlKs5cRGDJSE6ADdUZeYwt@lists.linux.dev
X-Gm-Message-State: AOJu0YxnIIw9EuBuAUlnmpfAOWWQwAuZTsZ0VGINq+O+6ROFyuxeOx05
	RZ8fLkb+vqB25PMitetKPuSOWKOoXkpcVhy7sOAvDPAi6oMVegcW0gi8xll1NV4fx3bPZitUAvx
	L69thoBzIX5BuaXNpZljEdMmS6XiGaVU=
X-Gm-Gg: ASbGncsSV3kDc3PFQPGA/c6VUjWtQXKL9CErtmRXTFRL8v/aMR8MhT0g9MSjBLuB0KP
	yxptXpKXZOmkHaykAG0sJnOxcY+XktrkqhHG1j6qGNTx5qbscDPckIYDKyZx1El0ix/i42n860W
	tIZ3z/BRECoIigzyEVlhTLmaKlm42sMXKT2A5Ac2n50qE6CajQXLgd9eBS6kr9m5gUdgiDI1yvK
	pzr
X-Google-Smtp-Source: AGHT+IFVx1ZwuhzWu29nMel9dpd38C5+YSpTw1UCZrJubHtDeVnxnQB0fu/r5r4nXrA8TmFpU3Uh7Qk/EellC8klWWQ=
X-Received: by 2002:a17:902:e948:b0:23f:b09f:52c7 with SMTP id
 d9443c01a7336-23fb3043a03mr26463905ad.23.1753442082654; Fri, 25 Jul 2025
 04:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714221545.5615-1-romank@linux.microsoft.com> <20250714221545.5615-10-romank@linux.microsoft.com>
In-Reply-To: <20250714221545.5615-10-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 25 Jul 2025 19:14:06 +0800
X-Gm-Features: Ac12FXwWTPyxekGMep4sx35p32LI3MXjz9EYbsvnC9mgbg1lm2slnKe57OCBYTs
Message-ID: <CAMvTesCWTcXLxjOVyNF4pTqaQkXQsgKBXn1TQdK+n-9TfWfndA@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v4 09/16] Drivers: hv: Check message and event
 pages for non-NULL before iounmap()
To: Roman Kisel <romank@linux.microsoft.com>
Cc: alok.a.tiwari@oracle.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, 
	dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, 
	hpa@zytor.com, kys@microsoft.com, mhklinux@outlook.com, mingo@redhat.com, 
	rdunlap@infradead.org, tglx@linutronix.de, Tianyu.Lan@microsoft.com, 
	wei.liu@kernel.org, linux-arch@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, apais@microsoft.com, 
	benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:16=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> It might happen that some hyp SynIC pages aren't allocated.
>
> Check for that and only then call iounmap().
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  drivers/hv/hv.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
> index 820711e954d1..a8669843c56e 100644
> --- a/drivers/hv/hv.c
> +++ b/drivers/hv/hv.c
> @@ -367,8 +367,10 @@ void hv_synic_disable_regs(unsigned int cpu)
>          */
>         simp.simp_enabled =3D 0;
>         if (ms_hyperv.paravisor_present || hv_root_partition()) {
> -               iounmap(hv_cpu->hyp_synic_message_page);
> -               hv_cpu->hyp_synic_message_page =3D NULL;
> +               if (hv_cpu->hyp_synic_message_page) {
> +                       iounmap(hv_cpu->hyp_synic_message_page);
> +                       hv_cpu->hyp_synic_message_page =3D NULL;
> +               }
>         } else {
>                 simp.base_simp_gpa =3D 0;
>         }
> @@ -379,8 +381,10 @@ void hv_synic_disable_regs(unsigned int cpu)
>         siefp.siefp_enabled =3D 0;
>
>         if (ms_hyperv.paravisor_present || hv_root_partition()) {
> -               iounmap(hv_cpu->hyp_synic_event_page);
> -               hv_cpu->hyp_synic_event_page =3D NULL;
> +               if (hv_cpu->hyp_synic_event_page) {
> +                       iounmap(hv_cpu->hyp_synic_event_page);
> +                       hv_cpu->hyp_synic_event_page =3D NULL;
> +               }
>         } else {
>                 siefp.base_siefp_gpa =3D 0;
>         }
> --
> 2.43.0
>
>

Reviewed-by: Tianyu Lan <tiala@microsoft.com>
--=20
Thanks
Tianyu Lan
