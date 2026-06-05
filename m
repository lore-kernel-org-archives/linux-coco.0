Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02159340A6C
	for <linux-coco@lists.linux.dev>; Fri,  5 Jun 2026 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667916; cv=pass; b=A73nf+NrtI2fcB4CwyYgid/Qouu/p+WzMZEIVBlzaK0CyjZ6Cm7Ef3T3UlcelNfzaX05u4yapHuh58wQwysSXQdyVRGrOZTYMpsAmb4bjLQ/YUc+4vbWiQseHCZM7UyUi69tMgYqJdx/QfVxoUJaMZvcLPXYzCQc8dfEsXQ8ry8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667916; c=relaxed/simple;
	bh=VNi24Rd0Up9CVer6FlQvZf4+doC/0e3uwh8unURa9es=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvDbTEbDWXBmRJhliXgebhyrYl7EvGV8NGekh6wrMSLEt4WLmmiy7576EreErw17ZpkWyRswr+QIcaZg6Qjha8KPyGjzqoNLn2ZBcejaGNPFrUJOsQ2pM1RC/+cktWztQLs2F1cXxm3zTeRDsiBOiquYFcy6hS9MDxoM7R4ILWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBMQSiVG; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBMQSiVG"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137dd523634so3217550c88.1
        for <linux-coco@lists.linux.dev>; Fri, 05 Jun 2026 06:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780667912; cv=none;
        d=google.com; s=arc-20240605;
        b=ik/MHBvjolmooyP8sI+ulePCG0Q50iNqsHMHm3NGERz7q/0yotBW5cHfyFwL+ui4du
         y8Zsw1qz/P+ML8oA5Map67zpUjBGhWemDenlTMRwK8GXLTNUu+fBek2/u1t6KkVVmj2x
         zKJVsDi3+RixVhjVqpXoDaNApp9KNa4DqVI8EdZB3Luxvr5QQCIlETT4SDWtK7gcH29K
         P0NcADBStvLK/TuQZqcloj4bxZLACMkg4sXln7+xluAdBITqauUnLD4DASfwm3CCrNZs
         wgXRHiuLQc5MGy/GH7oCkpM7znlm5Ko2icDUkAsOZpbqAMHycmkLd5JSe9p3KsRB/vrq
         htdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=k12kCbIvaHnTqgCGNpO0hMe+zMyl+k4NL8VZ4tGu3Jo=;
        fh=q13W0ET0d3k/7HN+tiyV8kCONZqqkyFETPAudsy75hE=;
        b=AK+8nI/AVfyA16rVcJqS9kZoB/oD/pFU6f4Op0lrtoFPagEOrJpYiewVzDeq7TcZ5L
         pG0AxS4uRAM1OALh8Ff1d1DE8UkI3dBANU3BJTRAAmMdwN/sbiBquI9Cewu1hgHlL51m
         UpHNwSuDe5PBwByZUjvG2tlSbeuPIu4HE4l+MG2s6kShxErL+cURIzEtGcq7U8VPrlkC
         X24W6TxsH5UswMTswKWCLIEdpOKr4hUFO7ABJodeh2thc7gYnkFnhHpf6AukVNk1r0SJ
         nofCh5mB097f/skVkyZrCYZuJPC17D2nebR52aIVYs7Ryb4InZf6evVCRIsNZSIf4Ukn
         t2fg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780667912; x=1781272712; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k12kCbIvaHnTqgCGNpO0hMe+zMyl+k4NL8VZ4tGu3Jo=;
        b=PBMQSiVGYXfbub6R3aPBLlOLpeGAr/Mf1279AVWIIzOV/CarvWmIgfI/I1MmhlHx0X
         YAaJJi3TdxV8kjAxWEvIreKWsHFYEYin2X3ZWXfLJJ4Y+r2abJC7fkO1HHhW3MOutwdt
         CbfCOPSEOYDfCT4EhRUSAC17uXa65Mh5ZHQn5WGbzJPec+SaToYXI2DzGBSd3qkAR6Fv
         9fFTHvPsoLuO46GkXANXFpB32gVLreo8NPSQ5BtQQZOUnJOE26ydsivybS1sv2KHx3BD
         Osg1PouLcZoUOwVdMbQgxMJTbIAmK+QIwWiZZ5dTI2hn2HLQW2Y2VACNhU2mKmLtaQen
         2LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780667912; x=1781272712;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k12kCbIvaHnTqgCGNpO0hMe+zMyl+k4NL8VZ4tGu3Jo=;
        b=JozfecWWNaHyvH1jkpBhXZdDQaB80rzmDUTjbbcYeWocxPVdw0myUi4sAmO889FiNW
         lOoy/fAfLKtcvpmybPsGQ4jQZYBdWZ3Rh7SZwr7YRQjA8PlKHLo1YoUT/3laY8wbZYvu
         Lh9qXomFSdEcaVspyb/KvF5drMATxeTGthlgpjzaaA4yGp/32bZK4CJxdIpJ18BXR7hP
         +ffWfV2IGtSFbyFoTsiTgdkS1M4kEtObYyTNBWSqzsigSb9Xj39bBhZr4yBY+kxLj1CD
         IZJWn9Abym4ICGoP6hiG8krAuO3niIBS2gK+4a6YuCTuZnRZchXSccIJVdaNsMoioFkv
         HOPQ==
X-Forwarded-Encrypted: i=1; AFNElJ883AIOymIEfLvwvHZykZlVmJ7JnxhvAlnVzQnAWWGX0agtlCGb0V8ocCCODLnBgUr2B+0X0czZkkd2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/AbNtLi73lfCS0RM0OA3TTpGmtO7syHL5WfUftoXZGsmlWQ9Q
	La6PJu//MOuus48yt2Y1TUZKTQoCKcmDzbkyApsTnndu5UttPXvlSgOH4DXX/YqYIB0y2czCHu8
	/DrPGLLjK7hUNHvFVQX85g35v4zv7Q/04ZGPja9IV
X-Gm-Gg: Acq92OHbHYyBviOSGHJ9Gel5fDnhl34ngb10Wx76hnU7Xd4j4S+lFDmXwM7kLFXj58D
	0pb/TyWx0you77WB/C9qf0C79FL2vpPJRRwbrnzexFjULe7N0Et0qNU4T0Xsh+1Q2EmM3/XhcuS
	ZAtmBFe+Tx2uYZwXYTIbCIWUF3bftmVk9LST1lOGUgvO+bhvehJWWLv51LutWHtj5Tz4hzIjX2l
	TGCiOL4X7NL1+l2vDBs1dcPFrIRNdua9+PCWDhgSz4QslcdtG7mspRDvAeK6b5dEN0OnDlvDVTu
	s8/xkSlLb4u2wkDOX6zih2NG9aPupzMEWYFeXtynP3DxWLVI0QGKMt+szkrE
X-Received: by 2002:a05:7022:797:b0:136:c565:e847 with SMTP id
 a92af1059eb24-1380674955dmr1638284c88.32.1780667911277; Fri, 05 Jun 2026
 06:58:31 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jun 2026 06:58:30 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jun 2026 06:58:30 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com> <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 5 Jun 2026 06:58:30 -0700
X-Gm-Features: AVHnY4IxXSl09mthH0pIzdFqFex4dXIrMh3HcKKHB6asWNozDxLWNfOIVIJk5qc
Message-ID: <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
Subject: Re: [PATCH v13 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Finalize TDX VM after creation to make it runnable.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> ---
>  tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index d84c629a1945..842cac168e99 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -1479,6 +1479,12 @@ bool kvm_arch_has_default_irqchip(void)
>  	return true;
>  }
>
> +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
> +{
> +	if (is_tdx_vm(vm))
> +		tdx_vm_finalize(vm);
> +}
> +

This doesn't necessarily block this series, we could (re)move this
later: I'm not sure if kvm_arch_vm_finalize_vcpus() is the correct place
to be finalizing the VM.

Was kvm_arch_vm_finalize_vcpus() supposed to be for finalizing vCPUs
instead?

The awkward part is that kvm_arch_vm_finalize_vcpus() is called from
__vm_create_with_vcpus().

While building this POC to test conversions [1] I only wanted to create
the vm and vcpus and didn't want to finalize yet, since I still needed
to do more mappings in the guest (and I needed the vm pointer to do
mappings in the guest).

Would calling tdx_vm_finalize() from within vcpu_run(), just once, be
too magical?

It's also possible to have some kvm_vm_finalize() call that can be
explicitly and manually invoked from selftests just for CoCo selftests.

[1] https://lore.kernel.org/all/20260605134153.204152-1-ackerleytng@google.com/

>  void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
>  		 const void *smi_handler, size_t handler_size)
>  {
>
> --
> 2.54.0.746.g67dd491aae-goog
