Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24281329373
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989912; cv=pass; b=dY1udfdTI/vnjdgqzDq6mxEAvpC0eZ7e6VzRu3Qy9ig/BQz7kyuav5OXQgvKv1caQlt4GsHaz58RJ/8U7GMsYqY9azkySctDO16gfbkLJzDb9y/C4D4h8fLpz9WgUNOCjGiKAqbnNPETSYLasoGZxvjvcK2JNorqCuAq/BjejRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989912; c=relaxed/simple;
	bh=YfjpV14/oc8DkgDxfmDK+50ULtdtyVgYC1+enerntro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6wXXKAwd38t+92KjoYRu8hFJjXgaLjE2K0axzPJrZTTOirSCusQJ4Zc8V/JkK2MWaFmOjo1NtufIDIcW9Nclc14vYd32FVkCOnBoZLxam+L0ATQSAvSEQMMFOrP8DISxU9bxnnuD1ZN5jGnYKcc1tXbqyjMfDzadpMRLu+YAew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXKvh+ac; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXKvh+ac"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-382fb275271so61828061fa.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 02:05:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768989908; cv=none;
        d=google.com; s=arc-20240605;
        b=P7M9OwBhDTBy+mS8id0sxdBgcHEN8oTqu3wn31pso95oASAPjc3Oizv5DxejbmIy+z
         /I7B3G9aNbvuGvxLhmB/mnfDWgIFWDQeP211rGWtFIqUjQFURXXmXmWS4/Q6u6L7Rjpy
         ugDx6Jn0begx91fcRmUqHbWcUxUI1sVAajfw9dHidCKRY+n4bSClI9CS8E4GGxejFAeU
         HEdatemnfcESvJ+qvj08jvx840Vy2CBPy5VfEm42g1Rwh9ZpJ7QQr/pBXq0tBACUlteZ
         JknqqLRiFnh8+Hy0EWV/al4cOZZN2rIUlLfysjBSSJvMf2MC2nej8m6vswIn0ZFHQfdk
         EXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EzFMKVkVddNXnBX0osqOABwQPr4AcUTIv95K3kHxHP4=;
        fh=icHnOy/p7MTKT9oZ7UzwC0UJFpG7HiS4Ssp+q98/z94=;
        b=a/fo8VFwnYiy+TWz3Ud1EYzJtedpKOiafmSGw0bPqg6vTws/94rw1DdDq/Dpm1qH1y
         lMD744T9dzp4CQCnxHjOs5ZP4zE5gJKO4vOgcO5mD92A2JJeVTWHjGrW9SQr6f5E0QyE
         tJbeUUbXjprFP1JXm7zSDEhF/XqKdZLPTsR2OrJETI/eDO8nNC0j7qqPRGj3mOL5zxoP
         EfNz2KrJiP3hZ/m+vWkpV16zxMMHQMRjGVIhVnDyHj7q8lon3bVN3/U5sq/OKtn8IJIK
         15KvNAM6ewuFxDJ5admARYwGeVoX/qomu3jBchSxDL8i5Li3vEys5Jpk4jW0jTDX+no5
         O0Yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768989908; x=1769594708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzFMKVkVddNXnBX0osqOABwQPr4AcUTIv95K3kHxHP4=;
        b=cXKvh+acK4CAOHiv5Af/5+jpPx6dvjmK8A1dNHkfZfuTvrc7DFu37GFza0K9PoHPob
         tp4mLRGqdLNHsOQTFzURIMVQzX4lQqWnvpDtD2BJkHNaLf5ZZfKLFDDTVkcnKXPA8noS
         Ir16qeZZ9vs7bL/c0kyUgkzvdthk95yKqjSR8OuHk1ejYxRQsCPo3jefPvUPmugjyFB2
         RkoKy4DAB8E7TB0kxnVGtcbzE059nem0n0V1E7C3HodG5eF9xEzb/zAxPoOaL74JxVDa
         Iv/z0QsiAiuG5fZt3uF2CYZUaTsUEFh4eolz7FHgB05IzNl0LeHvmAEItUzZ53hSCI0q
         xRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989908; x=1769594708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EzFMKVkVddNXnBX0osqOABwQPr4AcUTIv95K3kHxHP4=;
        b=ELabmZN9ZkdcK/JRV2bQ6Vm83BDAnVVztv/Vaabhor8Tj2U4/ue9Bu+U6/WcuVC5YC
         o4gEaoKcFZuTbFZpe1WSgnWno5MiNpP8sMT828dIoHOSLmeFvFaAutVXifMQrTlwRXc5
         L8mjx5JbVXEaJiADlB6ZyJnVSWDS3CFc9DEWCC8U/0Y1rytg0wO45H6XqNMrb8BPnnCd
         rvXq9RpIXQjjHwrDfHHn8d7gG39UE4DerqVPEnjUGidg+Jz9JCybg7ugAPTbNMuKfu/n
         p4AMmYi1FpfHkr+hh4frJKpWT3YwaPgPmLndUn6LiEvQsyB3B6CVZ1ZOYbYXQWYwrlYn
         +Idw==
X-Forwarded-Encrypted: i=1; AJvYcCX3zcTpfCUYKGin5C6A8lHvotvk7u//Iz0tQ9iDkB5yJihFfYuyFOwSoykA9ud5umjaJOWeePZqQUaK@lists.linux.dev
X-Gm-Message-State: AOJu0YyKg/zSpEtsvdFLEJl9YN3rVCOXkXiXxyGlMA2a65et/Afh9Gzo
	/BK9cNAxnFfkOP2Dm23Be9KKzDg6a30IKtA19AyiDhwkHAq8o0sTd3soqzvPsitkwCswyMJvCSR
	J1a5wcuguTlnuMWpj5bc3DW7vDHbVg+A=
X-Gm-Gg: AZuq6aLDNdPCsjWlTYTw7fyUgv35umeSCDzhjsmHHKqqCeDYumdE7abG7pm0acb6BYI
	SeBQiclkdl8WpsRX4m/eP3ECiZNABlslo/T0CMg0vQ9OM1LuN9mURdqot1nvapeRjUU9c81vN87
	f2ezU4MMZiXnOTWHigx5rAWqrhxgZpNwhEbRmh2Z1ad5Sa/WBz0+OO+poZuFVLhVTDbXNVxYPEs
	c7wp5hzTrm4Pn82YrTXORLv2xSf7t+MwlU/qQ55gOD+ee9cS8ZO4neQcxVs7SIXVkflhltAc5HZ
	4RP8P9aYxQPwbXYQrjtKHQkWNK6VS2AdYH5ToQ==
X-Received: by 2002:a2e:be8d:0:b0:383:24fe:4e82 with SMTP id
 38308e7fff4ca-38386a4dfecmr56862041fa.32.1768989908006; Wed, 21 Jan 2026
 02:05:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
 <20260120195407.1163051-4-hpa@zytor.com>
In-Reply-To: <20260120195407.1163051-4-hpa@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 11:04:55 +0100
X-Gm-Features: AZwV_QjD79z2fuU4NZdklFjo6jxmeQMlHQJNWsgLb-_VevOsmh46DL-3q3V_NBQ
Message-ID: <CAFULd4aWQ-PQP0dguMqfxyHYM_s2GaeFcegZUO95WBVsDOiQbQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/14] x86/boot: use <linux/compiler.h>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 8:54=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> Include <linux/compiler.h> in arch/x86/boot/boot.h and replace
> __attribute__((noreturn)) with __noreturn.
>
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>

Reviewed-by: Uros Bizjak <ubizjak@gmail.com>

> ---
>  arch/x86/boot/boot.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
> index f185931283cb..1f2b7252e387 100644
> --- a/arch/x86/boot/boot.h
> +++ b/arch/x86/boot/boot.h
> @@ -18,6 +18,7 @@
>
>  #ifndef __ASSEMBLER__
>
> +#include <linux/compiler.h>
>  #include <asm/shared/io.h>
>  #include <linux/stdarg.h>
>  #include <linux/types.h>
> @@ -279,17 +280,16 @@ void console_init(void);
>  void query_edd(void);
>
>  /* header.S */
> -void __attribute__((noreturn)) die(void);
> +void __noreturn die(void);
>
>  /* memory.c */
>  void detect_memory(void);
>
>  /* pm.c */
> -void __attribute__((noreturn)) go_to_protected_mode(void);
> +void __noreturn go_to_protected_mode(void);
>
>  /* pmjump.S */
> -void __attribute__((noreturn))
> -       protected_mode_jump(u32 entrypoint, u32 bootparams);
> +void __noreturn protected_mode_jump(u32 entrypoint, u32 bootparams);
>
>  /* printf.c */
>  int sprintf(char *buf, const char *fmt, ...);
> --
> 2.52.0
>
