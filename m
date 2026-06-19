Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A95B35C1B1
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856786; cv=pass; b=bQM6zIKmyUqYWczq3gpUtZzthSXS5dhnXrSeIHZB2eHpSLRFzlrG6yy1sR8dv5uwiTBR88HmgP2tEoghDZn8syxKodgqfxKK1ZARjPlkH0/K9TF28psYtEVrQreRbXyqzOcZQBOV7VoTRGuj7bC/HpjHoLJe2WgISgQc/4vnEic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856786; c=relaxed/simple;
	bh=mhRQfYgewaEHTKhgMkBt4xMNRF1jHjLdpGKjwA/SfyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vk4YObx9/HXirMn60acY93uzxka/zMkwDgD68sI0wUL3tdBWXLK/YG1pM1tQaFudAdGlH+Zb8eHJhd7VRFz7v8bg4qyKpZmcn7jb8w060+KNc4yZY/XJnvXLRpTbulCUvxcKlHzO+2b0DwUCYD9cUSFUPvQPZBqEmF2rz9VwsF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YD7/THd0; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YD7/THd0"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51765531803so194681cf.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 01:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856783; cv=none;
        d=google.com; s=arc-20260327;
        b=Lk3/ymK57Xblhfy7LZQTVeRO7V22JwIz/YsxKKWkP1XChEX8I74d5RBQtwiY0ELBKZ
         5v54/wZgtj5Xx+rfelVCOrjs/gwbzFOEDiso+uBGbvqKN8RQgOJAV34S6HZqRPdJHXpb
         p9dkv0L0oa0nZo2bdw/BSmd9mQxvrX/pAoqdNQ0++fXOTXV1F4x+xHDzqfZnj/n21FLX
         rQntgeM9FQHbZ6Mg6vtF6h4v7UMapdkP4pEKfSFWkz/01wIQfg7WvxHfSPZoECX6uXhl
         lVM7X6A0VMtx6IlKwPMYQE0J4Hi5xqiXxOOy6Z5JAIDAoVXq+T78CcMgylu54oSnmJmF
         uwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        fh=EB1Wrzsocg2ubkOcyaISbVsDJ3kjkbk4ooiaWokZ6So=;
        b=GucSn0SjMO4s6P9J4kqeoM55U4Nl8+SAGj6CojUoGqeAft6X6NIHGD4NUy735iszLV
         tUnuXIyyxzc+adlDqpMkQwHlqHvro7oBdG38nHvUnq1TS8heOgNLV0AKufMSayweLDqu
         C69KPTuIPDPO7IuuROyFWaOoDZ9La1dsm1A3aYlUFDqAJBpy6jG6fX7lg/zzQe8vzVFh
         TS2YrQ8woZN+OEXd2sVKgJdKB4VNoGek9a6uqSEBS0kRzkZplv+dNDDG034r31OGb1EK
         BlNKSuYe2YnvK6QCsSJ6etaXMn1yS0FGtl6ssT+epKGGC5OnHyHj+sjPFPdxU5sExK1F
         AenQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781856783; x=1782461583; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        b=YD7/THd0febR0sia8s4SBpxDi94KJ/xAnb/egjY8YuCKAJY+aYJP85MEvhDW53+et8
         /bY2rTKHyoAsbnQDAy6Ws7riHcPGE2n/Zes5GEipVlIBSPaHgSpuNv670ZshuTm/1QiG
         i/LHToyQ0+wcnke/EJW77Z+F8227JHZW7748ZuyeeEwIV0F7RBxuGBIJGLS2x2wQ1LEf
         Z8IWNz7UAkKdrjit6A/CFFo5KtVnEtNofzPOl6ze++RiKtwsdM+Pr9PLzOQ2r+LryGuc
         cv+/ZWNa9P3vJlCRd0w4sa+bdm4765hrAMY9ZzVg3GEgNR2e52VgB/AzjJA+rqI+ZjJJ
         UkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856783; x=1782461583;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        b=llk212dqPIyFyNzJZ92BvgdDTsozQmO9FvVPnH1gydQ+ln4h9+mCw5YipCXt/L+fC7
         Im/y1JpxgJ8nxtIPAcf959n6AU25nKVdC12hI+Dy2EmGKuIEvXdgwk12X1zyVbCcmtfv
         Xy247r9US6Wu64LxEuMmg1jswqUrVXY7yXs+bTE/lFgpYuBKDNqxDgBpJm2RhdcVsFIm
         Jh0TSeHDalCggNkQeHK7glkgbrq7gqT/De6QHFTJP/pVj/VZ5KW8LrSnuESdnFR8h2Ao
         1lgnNc1GoY6krKuE8AtxsHEVAG3yJVLM2Zqio454CY3wCGylvYgtwnT2Dx+k1BVX2hpH
         YXwA==
X-Forwarded-Encrypted: i=1; AFNElJ9jfHITEwq0V9VqNI2rEdKkM4cQWTM6nWg4ybg5jHvqvRn+Rrxe8QFxthd5QRAlgZToBpc+XmWLhAdB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3cq9yREgAtt9OvPSlRAZyFdSyId9upJmeNwPsvD3hKVzi5Q7X
	V3xt23QJPmVeD7mjm2TS/UICX03nwvuKa4fJhia+8fix+WS8LCIq77pE7SgHDKBza2Md+zHswdL
	bcmxER0uHPYp4eqNbzzquS0PwStOheIWet/jrrzFY
X-Gm-Gg: AfdE7cn4ale9LUMVDlOn9h7mYBjwMdBtxP363qRiQ7wcGc0jFjpx9D+V4J42jfIm1qH
	N+d6QP9U5hjQjEn86+HueEr1m1n5sQr0nX0+eKXJ1QJ9fnRu/Dt0bCN/JeUSgpPGN1tnt/GY/MM
	hamY385zPjT7qugkyGH+7LmYhzPgokbf0/NZ6um5T/eJqUlYUzKdJ+NSTqkQ9O+tWaHbKj5pGe5
	RylyF1AHC3oL8q2TePR33dAdHrSdgCCYAJ5MOURE1cxXQcV+LHRLt3LLV2064SjOKy5IQI7Exzy
	hOjKQLx4
X-Received: by 2002:a05:622a:1906:b0:516:4f62:85ea with SMTP id
 d75a77b69052e-519e8d3111amr4387331cf.21.1781856782436; Fri, 19 Jun 2026
 01:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:12:25 +0100
X-Gm-Features: AVVi8CcN5N8mHAFYGVLMZrPjXc2jn5V9jAAbKlAQIrOrX_OPU6MaDRc17hIP_FI
Message-ID: <CA+EHjTwrfont5S84MpiwSLfk5doD_RwS96EX88e07c4-1DeMZw@mail.gmail.com>
Subject: Re: [PATCH v8 05/46] KVM: Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable, only for (CoCo) VM types
> that might use vm_memory_attributes.
>
> Also document CONFIG_KVM_VM_MEMORY_ATTRIBUTES to specifically be about the
> private/shared attribute.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

You're missing a SoB, but with that fixed:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/x86/kvm/Kconfig | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 24f96396cfa1c..c28393dc664eb 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -81,13 +81,16 @@ config KVM_WERROR
>           If in doubt, say "N".
>
>  config KVM_VM_MEMORY_ATTRIBUTES
> -       bool
> +       depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
> +       bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
> +       help
> +         Enable support for tracking PRIVATE vs. SHARED memory using per-VM
> +         memory attributes.
>
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
>         depends on KVM_X86 && X86_64
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> @@ -138,7 +141,6 @@ config KVM_INTEL_TDX
>         bool "Intel Trust Domain Extensions (TDX) support"
>         default y
>         depends on INTEL_TDX_HOST
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>         help
>           Provides support for launching Intel Trust Domain Extensions (TDX)
> @@ -162,7 +164,6 @@ config KVM_AMD_SEV
>         depends on KVM_AMD && X86_64
>         depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>         select ARCH_HAS_CC_PLATFORM
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_PREPARE
>         select HAVE_KVM_ARCH_GMEM_INVALIDATE
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
