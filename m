Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0C552E04D
	for <linux-coco@lists.linux.dev>; Tue,  8 Sep 2026 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894198; cv=pass; b=XvFul0GJk7Qwuw7qdxXeJSzbCJMYELz3D+jDCqMnO5inYGNHBtVqEx63WjcnVFGluYsuq7OSC12LeBMYhuQNh8ZHD+UaMm53hzFki0K60J6W+5RXRwYknXh03kLPYahQzxfVgHn2C++s9Ai3HYMRwjHJl1yznIOqAlF96/zBhDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894198; c=relaxed/simple;
	bh=SirRPd8MEjuE0M+o4ZIQ6nFLVuzs+EvDMR2q6/kdoLg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7CDayzEOtLRpfbQvQGrqgrIBECMik+5FDb7lNdw/gRPahVn7gvpesTB2oEiFbnE8xe3O5s0+ArCgGJHzcS16tl6L5NwCKxZRwqCmAU4xn7OK+1FI7LStfAHZkPAzYwzfYcibprPJp37jVUaxLRYmEttR4N2xGUvVxTB9TSBrkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RbVQrX9E; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RbVQrX9E"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cbff85fa9so57383336d6.2
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 12:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894196; cv=none;
        d=google.com; s=arc-20260327;
        b=oo8uybihTe4V56XDY6dfkUowW7+Du1Ydfyemvu7T+tIDHcnpNjbgcO1zJQDqMEYt3d
         Mb8CLlSvZXaIH7f29HNc8QkAP91wNJ38bTJcY1srXXOavypsI9pqro39vIut4nGoKmC+
         SVQTgKCOZOR+QnF+VsvBHGj2bQQOnTu+NWv2joqiw/4QqyJb/S23wZG6CKyPNgeC/MzI
         gsDZjyH1Ak9ltnq71mVMATksuo+Zg12ZNmsHLujc002JYrTru+58Dbr5tXwmUCecEe2P
         9T+ZZPWBhvIkFX24qW66SGpTHuYmvTTbZS0+7cKGpEUeNiDCTTnndRjeH0ycGBJwFjXC
         aD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        fh=5JB1WNw9aDkFw6QKqJ4rZFnfYcrE8W/0ouuMLLsDpHk=;
        b=Cgmf4nrp9ga0ZWsGMdAuUzqhg/A7JpSKevtaBO3Oxhqvc0nV7aTmNALUhhn0MrXJEi
         fxCF0/skvh0ggwfCdy7dGdxRhWjA6C4f4aRlV0SlQcEGUE0wQaZ8MbQNmAgN10TtIRxX
         gCRLtPr2RqSTsQDPPA/kFZVUzJtEeGKUj4g1EE2+7lQnex4rV8kl06SPbd2IbSXR+Bi6
         lbsSNIzSRB/WD/MHw/W2Yf6JJnRbQdDGcNZJNRUvY9itpL6V1dY5SAqYIU8J7CAxCUnX
         LuCVL3LhzqXBQrGbM1ECFIRd1046Y0gajZqYiXSQL76A1PmKrBL3GDKlSUqC7comH63Z
         lxiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894196; x=1789498996; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        b=RbVQrX9Egjl1Jqc859i86fuKvb2O4IupV0tAXV0cnpZLu81uo8lnB+h/m8ng0t2EpJ
         FQ7Mp3bZ9iVL8XdKRfj2cBj8KQSMxjPfszw47qaITyE8xgl7qv8uj+wp9ukxFW+rs7tr
         DZOnqUYsuQXFRLkrPZnu7L4V1kiswMem2AvZlQ93C7Afc7ccyxnGKlFW8jRpT0bbyGCA
         BTtPA5Jz82vtrYrnYY6ovHn6EA+6LT3BlDEMNjmoEmTKoftM4Q8DBX0nBAx7n0FpZcqy
         IFSFQOiZvH8M3wgYWaWQfQ2JDFQl8m/p5Ml5CBYCJO1sN9mnTfYwGkE/EdpdLF4l7ZPm
         Y8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894196; x=1789498996;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCBQFS/NlhUte57G9Iz7jkmENxjPMvZ6ht3E4pgVgq4=;
        b=cZz3P/pt0iEm1JKLrj7d1H31ahN8HUoVoUf7V83AwoN4sH9Klt16a5XvNBn6lPDAUT
         eG2+B/IXscpogeytJGfalRirJoj+XnPF8SX3Yx9bgYRvjlahINvQOiKzhTxrK+ZU4xId
         ly8oHEBilIa/uwiZBDljzzcbEPS6pLxvdYAZ91RH2+J/YNe8gp8hB2wyYBafOuE+KdYU
         RJsvCcJvB0lOgJqY7akb7Ccp3OI5diEP+do/G99jpnL+FJVj53pslm/Q9lHI2IPjjqKS
         CoSSUsjsKT4M54gYeQrV02wo/awOeCrh6NEhDulNuuup/HWZXoCw7ExNwqeL4KyL4/sP
         zQCg==
X-Forwarded-Encrypted: i=1; AKwUvByLC+tlFAVUlkfvAgg+dx8hJJKp8bOqva/IqBsLZ2KUgWUQWIhwPnrwSQQNqmo9dJIVybIE7P8FuVLR@lists.linux.dev
X-Gm-Message-State: AFuF++mc0YdPpcekdK3f1M3kFhDdnkwmnmoaveSJRDkX954YQtZ0ZS/b
	9Ysp9SKUgHSYmon4IF+iv56ojnkQ8AKQpuLrpp/UqJ9AJEbtazNdlZIZnVlyVLfYW/snLj9r8Mm
	fCGAY+iCwjzxeJcFINZp7qsQPqHB2jBYsdL9d1Qlf
X-Gm-Gg: AYBFou2QU8CSsRZeY+BlyZwv7cZWMdBT/BcuF2Hy+9zndrgG2q3Sjq9PmqopAu7IVgp
	wg6ExsX0dwYrYdJ9B4U/VWKRTnBFpgpPxbFsL+H0GfWdKgClRKMIQzQE18661ncL7Cpee+u0iqG
	QVsrHpK3N8mMOGnBdVe1WylKhqGQ1tGgwUDnUWibagU9Eoe31V10Z0YkFrqHa9Ppk/vz16DK+9S
	b+B2tSiHQt5n6Ip2+32XKZPEiUM9hSMoSP7ln2pBXz8qgk+VV9dg6nnL6ABOL4BXi27xK9sYMjF
	/wXj5rN+71cUPcIbrgo1EcYxIF7xL6FbJJEDWUOpntAe3zXqO5XOoQK8A/OZ/fELvfw1WCRXtmw
	d43VbNMcljw9n16FV9nSMl1+NSWbWj7U=
X-Received: by 2002:a05:6214:4287:b0:90e:7bee:9a6c with SMTP id
 6a1803df08f44-9103ef88de7mr407562466d6.19.1788894194840; Tue, 08 Sep 2026
 12:03:14 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:03:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:03:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-5-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-5-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:03:13 -0700
X-Gm-Features: AcwNN1V9Kl5cU_xU1Qz969rvQ0JujFNCbBSW6jqcW2Xx-zikXZHSBnXLwAN1H4g
Message-ID: <CAEvNRgFiMWb_n4nL8E2HBfkQ247GEhGQ3us_cfoQG4-JBiD2aA@mail.gmail.com>
Subject: Re: [PATCH v14 05/22] KVM: selftests: Expose segment definitions to
 assembly files
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
> Move kernel segment definitions to a separate file which can be included
> from assembly files.
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  tools/testing/selftests/kvm/include/x86/processor_asm.h | 12 ++++++++++++
>  tools/testing/selftests/kvm/lib/x86/processor.c         |  5 +----
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/x86/processor_asm.h b/tools/testing/selftests/kvm/include/x86/processor_asm.h
> new file mode 100644
> index 000000000000..713b6bc0aeb7
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/x86/processor_asm.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Used for storing defines used by both c and assembly code.
> + */
> +#ifndef SELFTEST_KVM_PROCESSOR_ASM_H
> +#define SELFTEST_KVM_PROCESSOR_ASM_H
> +
> +#define KERNEL_CS	0x8
> +#define KERNEL_DS	0x10
> +#define KERNEL_TSS	0x18
> +
> +#endif  /* SELFTEST_KVM_PROCESSOR_ASM_H */
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 7d23344854cc..97acc5aaf7b7 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -8,6 +8,7 @@
>  #include "kvm_util.h"
>  #include "pmu.h"
>  #include "processor.h"
> +#include "processor_asm.h"
>  #include "smm.h"
>  #include "svm_util.h"
>  #include "sev.h"
> @@ -18,10 +19,6 @@
>  #define NUM_INTERRUPTS 256
>  #endif
>
> -#define KERNEL_CS	0x8
> -#define KERNEL_DS	0x10
> -#define KERNEL_TSS	0x18
> -
>  gva_t exception_handlers;
>  bool host_cpu_is_amd;
>  bool host_cpu_is_intel;
>
> --
> 2.55.0.229.g6434b31f56-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
