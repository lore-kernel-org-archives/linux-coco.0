Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A13D3329
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945683; cv=none; b=r/WzVHslaIkvs35w76B4/r5ELXuchKrptVuJv3MsUJNtzMbu5mh45OQFKrvPNLaC2yVFTPUO/ckP984GSvxRJ9uc2eh8VqvVaRrbLQWHtb6O3R/lnG+UQye+/BMfiAzGCNxkDtZZV+2GVZ06/9tWBeMi9l74FLlQqAOFNjlqxLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945683; c=relaxed/simple;
	bh=yQP2Bhh0JVZYQHukZ5sYv7vdxCRank8Svaw9GvOPEYs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e50iV/pi5qrSL41GqJAwJO+q48v8fAsosw+krKRUWsJ4+ad5XM6y9WkkQAeyNvzvJe6cMscl1EElhBcUNHI55ef4dNboPKw7m4GYyveADgtw6kRp2NFUqvKCC5+LyayfhEURkDk4tv2dAzFoAr+gGmS9i2mMHavjeh8RkX/pKfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B36R1ohU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B36R1ohU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so3247719f8f.0
        for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 13:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768945677; x=1769550477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxAJit3cy3zQxDPIGkNvzfMvCiBbKehPhneoVBS7hA4=;
        b=B36R1ohUiggxFMGfZavfCps88xAq3+75/ebfbpuAQgxj91syg9XSWJ3d8hdobTYS40
         2UgRcbpx8pK0M+AqZNTLwE5GXaaXNYZhxcUfCdcRWeq20iPyhhYnZdSPW3maMG3C1VG+
         1IW4l/wHWwMmtzEib2DICVP6m7Tb16ompoOxdfMiEVUWJ2JfF6b2/rAkw6uc1RaejPLi
         RgTctlMIzIMuoSlcg0dEM3fYurWQXdhHGzxTAuw8uaduPSRzYm/NfeN34KqTdFNP1KbS
         z/gC+zV3nqW+07R/lbhkXqgAN3yWqhkm7tpmKTulYocRRCs5e2lHuIEXEVLPdLf48EM4
         AygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768945677; x=1769550477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxAJit3cy3zQxDPIGkNvzfMvCiBbKehPhneoVBS7hA4=;
        b=s3/6d/97Shw8rXrJZQCttIPFyckiOccbakZhUoZVijKXNbylsAa5JoIiUP+N/Pcefu
         YiSn8xLh4aDKhCiigfxFnjFq1MueG0KtEdQ8l5ObXFKr8Sy06IKT2/JvDzLoreLIF/5n
         D4Lw/d4DVjG3W3nBvGWBGYC8RfX+zqwakXs/LimoKKKPFzMxq9jbkiJjdOiAIC0v8dIR
         daTRUR8AT69IozHhUUyeTfDMcyp322fdKEV0VuP7LM98V9jbPC0/eWDhuhPjGMSaV9L0
         p9P0b/HVjiLlox8QNvkUw4WY5cgyYuMqDoZ+j/YRrbfriT50DO5eMELr42igDeQ2IT9i
         6owg==
X-Forwarded-Encrypted: i=1; AJvYcCVBfx1UdgPYvTMGv2pRpNWNDhtA34CpwjJJZmLZDFkzCTdB3SIUtWACc51tqGMNtDwkoPkWz3dnEZyK@lists.linux.dev
X-Gm-Message-State: AOJu0YxvnKBoFORHQTGMm1EcYaX3vIMOamBRQfgfY4T2wNbFmOPHaq1s
	7K4SkPIBDYn2Z9ws2lq+OGw2VyhiYizrbVcCxV8p38vqlcgRBDz56IfF
X-Gm-Gg: AZuq6aILdra6HNVnjHJxx25Eq1JpfGCLbYVD/XZHmHVdOr8MBmzIdI4AEpCabN91mjY
	YPsMK+3nNAm3lc/Q3O4JEkZpqXrbZvDnPNxVZ58xsy8xmJSLcG+iE7NTPrdT6Kewhb3WM7hxVry
	4ecfeKiXnpzfKKJA8sQZG3luzR/lLHzBnP30QLND6YKIWYamuKXDzcQ7shflNWAPdP9V0DSE6qG
	Jb+IsnEECuLlw+HpBq3MAD/Jr73Sup+Jap17ATYeGD3ivmzwSCdMjBQKhnSXqze0ux1TPIEOOcv
	sH5c65DEE622SHw0ag4WcYK/GlPz+7Oip9f+/cLNrKtSYE81/wqlpxX04vpUmXBF6GeBrpI1+fZ
	lUAjGN6Aju4mxhJlwIJxYtszGMqKGUWXpKBVeaSg8WpeDjtUcn9IhzbupxsMQaJ5b55UCm40VBy
	wWSVBNMBHOR8tcI9UDSbxqVqi7mXS0YJobe8dKx0yfiHX1cQO4Yln1
X-Received: by 2002:a5d:64c5:0:b0:430:f449:5f18 with SMTP id ffacd0b85a97d-4356a061401mr21577182f8f.46.1768945676741;
        Tue, 20 Jan 2026 13:47:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4359333b924sm4594022f8f.13.2026.01.20.13.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 13:47:56 -0800 (PST)
Date: Tue, 20 Jan 2026 21:47:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>, Andrew
 Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v1 01/14] x86/realmode: remove I/O port
 paravirtualization
Message-ID: <20260120214754.1f309010@pumpkin>
In-Reply-To: <20260120195407.1163051-2-hpa@zytor.com>
References: <20260119192923.651588-1-hpa@zytor.com>
	<20260120195407.1163051-1-hpa@zytor.com>
	<20260120195407.1163051-2-hpa@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Jan 2026 11:53:53 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> In commit:
> 
> eb4ea1ae8f45 x86/boot: Port I/O: Allow to hook up alternative helpers
> 
> ... paravirtualization hooks were added to (some!) of the port I/O
> functions. However, they were only ever used in the 32/64-bit
> "compressed" directory, and never made any sense in the real-mode
> code, which is notoriously size sensitive.
> 
> Without these hooks, <asm/shared/io.h> is usable directly, so mode
                                                                  v

	David

> io.h into the compressed/ directory and replace "io.h" with
> <asm/shared/io.h> for the actual real-mode code.
> 
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> ---
>  arch/x86/boot/boot.h                | 2 +-
>  arch/x86/boot/{ => compressed}/io.h | 0
>  arch/x86/boot/compressed/misc.h     | 2 +-
>  arch/x86/boot/compressed/tdx.c      | 2 +-
>  arch/x86/boot/main.c                | 5 +----
>  arch/x86/realmode/rm/wakemain.c     | 4 ----
>  6 files changed, 4 insertions(+), 11 deletions(-)
>  rename arch/x86/boot/{ => compressed}/io.h (100%)
> 
> diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
> index 8e3eab34dff4..f185931283cb 100644
> --- a/arch/x86/boot/boot.h
> +++ b/arch/x86/boot/boot.h
> @@ -18,6 +18,7 @@
>  
>  #ifndef __ASSEMBLER__
>  
> +#include <asm/shared/io.h>
>  #include <linux/stdarg.h>
>  #include <linux/types.h>
>  #include <linux/edd.h>
> @@ -26,7 +27,6 @@
>  #include "bitops.h"
>  #include "ctype.h"
>  #include "cpuflags.h"
> -#include "io.h"
>  
>  /* Useful macros */
>  #define ARRAY_SIZE(x) (sizeof(x) / sizeof(*(x)))
> diff --git a/arch/x86/boot/io.h b/arch/x86/boot/compressed/io.h
> similarity index 100%
> rename from arch/x86/boot/io.h
> rename to arch/x86/boot/compressed/io.h
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index fd855e32c9b9..68957e7698ad 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -43,8 +43,8 @@
>  
>  #define BOOT_BOOT_H
>  #include "../ctype.h"
> -#include "../io.h"
>  
> +#include "io.h"
>  #include "efi.h"
>  
>  #ifdef CONFIG_X86_64
> diff --git a/arch/x86/boot/compressed/tdx.c b/arch/x86/boot/compressed/tdx.c
> index 8451d6a1030c..00359dbe1f8c 100644
> --- a/arch/x86/boot/compressed/tdx.c
> +++ b/arch/x86/boot/compressed/tdx.c
> @@ -2,7 +2,7 @@
>  
>  #include "../cpuflags.h"
>  #include "../string.h"
> -#include "../io.h"
> +#include "io.h"
>  #include "error.h"
>  
>  #include <vdso/limits.h>
> diff --git a/arch/x86/boot/main.c b/arch/x86/boot/main.c
> index 9d0fea18d3c8..da01ade4959e 100644
> --- a/arch/x86/boot/main.c
> +++ b/arch/x86/boot/main.c
> @@ -15,10 +15,9 @@
>  #include "boot.h"
>  #include "string.h"
>  
> +/* Buffer for building the full "zero page" struct boot_params */
>  struct boot_params boot_params __attribute__((aligned(16)));
>  
> -struct port_io_ops pio_ops;
> -
>  char *HEAP = _end;
>  char *heap_end = _end;		/* Default end of heap = no heap */
>  
> @@ -132,8 +131,6 @@ static void init_heap(void)
>  
>  void main(void)
>  {
> -	init_default_io_ops();
> -
>  	/* First, copy the boot header into the "zeropage" */
>  	copy_boot_params();
>  
> diff --git a/arch/x86/realmode/rm/wakemain.c b/arch/x86/realmode/rm/wakemain.c
> index a6f4d8388ad8..1d6437e6d2ba 100644
> --- a/arch/x86/realmode/rm/wakemain.c
> +++ b/arch/x86/realmode/rm/wakemain.c
> @@ -62,12 +62,8 @@ static void send_morse(const char *pattern)
>  	}
>  }
>  
> -struct port_io_ops pio_ops;
> -
>  void main(void)
>  {
> -	init_default_io_ops();
> -
>  	/* Kill machine if structures are wrong */
>  	if (wakeup_header.real_magic != 0x12345678)
>  		while (1)

