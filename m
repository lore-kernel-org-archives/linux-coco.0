Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F059D62A
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894108; cv=pass; b=HSl/P3qHuESySdeJrPgpT2687kKqnqNgznffrm1rn61olmhMCvmIDPp4nO2IAKwF4L+DWxdpwFPvTyKvnJ7ohQMXna3IlRBEtiSOnZ7IlE0UkjAM1DYKNV2NPcbrWLWxFoLGfmQct5KB0Ac4nvhdI2dBTikG6+eK7T4FMgtTiRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894108; c=relaxed/simple;
	bh=QhYlL6j553P0EUMnVDTNvdPvx8/iDvuOHmYwBLPXEvo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzMRiKHzYAVvrO/vqyzpW6q89s0D7KDvwi/+erst3JQdwTz6PQVrbKaydqoU/6esjMYg2Ns2w+rcsPKmgZaoMoSoXYKAX7USA+uAGUv4MiNluzTdv6JG5HdyWN4Nn0d8hJgexP2ULKnicuHlcSuSwkR0BJYVvD149NpJ9tTFD/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gsC/bZr4; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gsC/bZr4"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66fa10f35caso4558341d50.3
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 12:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894104; cv=none;
        d=google.com; s=arc-20260327;
        b=qVTQxwBYcyn/cTwBCeTZTD81DfevMR+Uv96r5ElY1+CIU7JjvYhcTTqxXCU4Fkoqvt
         3/zLqIJ1vfzHSJScnjmwmPNBzYKrxt61Me4oHDP9b/v3F3RNzx2z1zZ/npWBlM4YAN0W
         fbTf9GBr19BUs+URdqWTIVdtLh6Ynwq4rzStN+Pmo7GzVucZygMewvN4DboRCfA1yvKU
         gyb7KKZykJi/vwBxgMjSLgLb8eocnMprxlkuPrTASsWhjEflxShQxn8VxZWehbQhHn81
         PrQyA6PsMgfF2Nt2C4wapI4gCyBdWHa8ZSUHczCBGsqjpjQ5O2aEEQvVn7QWcF5mdoJ1
         u5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        fh=RDzf4SRqBRSWn5CSKsV/hgCtsqM/jq4XMjY5IhM+Ogo=;
        b=rDckD0tCWAcKK/ZMxquqTExZKAAPbhO5anL/y2ZHR5nteSxvS6kSj0D7TFodurY08N
         1ESzfuSHbd/1LDV1MPohnasEz8JVXGmL4ml4d+yITdfV42LrPCzS/CkceKPdpLbEnRJ/
         G4sWXXBmUq+FKk02zg7Y/Ni3fycdZ8kXnZrTETkMzykwx9aMKGQQToWq22B7+RdFWPPX
         RteSSKm/Jf55TOkvig+sY4w7fg21E8wzloOHNTwhCA1iF6iuYEpmfFdajX8EJDti2mso
         wauFzS5i7l2a/PUDtf7mcdAa7AQfMSXDhWa1H0v15SvfTPIl4KjzNMiRopuouG7JGgIU
         Dx6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894104; x=1789498904; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        b=gsC/bZr4nsqCdebZmFGKM7eYelGpHudRziDHSq+wreKLwN9gK8Ryd6HrVtqoDu1I+k
         oiFU7ceBOcNVesXU86/ctghxoyRknU8omsJ6ugxE61yfB0UP9TmE85Ja47e/zhOho7MD
         59d4JTe5T6LZgN2uCV4jZt1ctnoktHiprbkdZpzsoSaFYeFRqPkZ4dkcrddYVXY/vf8g
         1i2q19JTQQvTlC3WebG2ObfWqaqTt2Vo97NUI/Zzj2XM5t9TjUFyP1Pgzi0pLV9/PxQ2
         9WVjHypJz8WXol2v/z4CqlfE/MHTwBQI1dVfStdaMyr4lIAj6fXSS5BxxwWOUGjtabSq
         D4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894104; x=1789498904;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        b=oLjY/2hDFgCkgCqPHfg3lNXvG/q4IZGHOIrsTJ+zReOhtGhJ6uo48VgVnWbHbkwXxP
         hV/HiVV6wlN6Jz6HRQKytSUvS4sAdHnSZ/jQW+UTgvjWEhKhbRvahcK41QxGwKMpQg7F
         az2JcuZoglqv0FRvoXUHCikLbGuctw+MRzjEWeIRW9F/oKaPNuRZHGEnAncUs/mgNVcf
         spPG9/tMm7hH4hCRZzOZr7S2w+b12/84d57TbwT7FpqPd4FqcLm9tNpgIfvFChjWPlTz
         ne8LG5Gs0xMoShYpnAoWt9AqbMgQ3BXw302DIj52SYffOlUB2yO/A0+UAEasz2u8Vxnq
         iruw==
X-Forwarded-Encrypted: i=1; AKwUvBw6j7TrArA7MzW8KYIxEZ3L4TEX5hLbwzI2sUAD8df2eTMY2DKR/jjCi+aSBjfoZUx6beJQFZX/OeP5@lists.linux.dev
X-Gm-Message-State: AFuF++m2ZyLLMiB2En7s6tJ6LcBsgriMJLaleGVT8UIZyGmI8TV5gYzT
	07bUuvIGQxx84ky104aCvvwlMEJ7LmN2La1Qm2CoLNgpq5h6l9+B34TjbD2rz4iWdEORQYDF5XL
	zHIQglQFW0yTWRWC6dUPofpuw9ciWXxQKNa9p0p8C
X-Gm-Gg: AYBFou3otVvDkW4jhjuDYPEWkzgLHRWdBcUwT2PyKy4kdZh3iauXKAqAVVEwW7AN3P/
	/P2niAMUzx8BL8457Nf10wDDvv1RDkRiePScQgzC4wnVNM0UTjDSvIgRvOls/ySu3OlMyxOMLqI
	y72AdMLJWi6RzdjwXNzNMEl6+KmLy7Cp4yK0xzdKLd/88fDLtS61Q1G+IqVG4llI3/DiD6j0nlw
	ViMgSkHytXqDZFhGdcWANWoVVLI3CmsGmJ36GNdiS6jKypMrbBxX3RXVRNvjsdCT7/aYlgo/1Hw
	FkbKqrbDoMvj5LOoVcqVqu69Osyg9Ovc1Bzun5o/29K1vcdZ8XtsP/mN/7nssBjgLKy0MHbg37R
	FeX48j+qFnLHbXyN/2aQ1GS5QNshYsr8=
X-Received: by 2002:a53:ac99:0:b0:66e:3e9a:9e30 with SMTP id
 956f58d0204a3-66fb5a0f620mr9359683d50.24.1788894103467; Tue, 08 Sep 2026
 12:01:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:01:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:01:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-6-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-6-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:01:42 -0700
X-Gm-Features: AcwNN1WPZ2uU8GfQmCXhnm2Xzg5FSQlgtEqA3NyC-GefYugQL38hpysVtSVZrlQ
Message-ID: <CAEvNRgGifoMQNRFMzmuGpChUD3YE6iUZbfsHAxaFEeTGfNfeEg@mail.gmail.com>
Subject: Re: [PATCH v14 06/22] tools: include: Add kbuild.h for assembly
 structure offsets
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Add the Kbuild macros needed to enable the filechk_offsets mechanism to
> generate C header files containing structure member offset information.
>
> Tools depending on assembly code that operate on structures have to
> hardcode the offsets of structure members. The Kbuild infrastructure
> can instead generate C header files with these offsets automatically,
> allowing them to be included in assembly code as symbolic constants.
>
> For example, the TDX guest boot code requires access to parameters
> passed in the C structure (struct td_boot_parameters). This header
> provides the macros needed to extract these offsets from C code and
> expose them to assembly, ensuring the two remain synchronized.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> ---
>  tools/include/linux/kbuild.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/include/linux/kbuild.h b/tools/include/linux/kbuild.h
> new file mode 100644
> index 000000000000..957fd55cd159
> --- /dev/null
> +++ b/tools/include/linux/kbuild.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __TOOLS_LINUX_KBUILD_H
> +#define __TOOLS_LINUX_KBUILD_H
> +
> +#define DEFINE(sym, val) \
> +	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
> +
> +#define OFFSET(sym, str, mem) \
> +	DEFINE(sym, __builtin_offsetof(struct str, mem))
> +
> +#endif /* __TOOLS_LINUX_KBUILD_H */
>
> --
> 2.55.0.229.g6434b31f56-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
