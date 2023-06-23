Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9851094B
	for <linux-coco@lists.linux.dev>; Fri, 23 Jun 2023 20:04:05 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-54ff7ab1e4dso803204a12.3
        for <linux-coco@lists.linux.dev>; Fri, 23 Jun 2023 13:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687550645; x=1690142645;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAV+u9FZn1OMDdsvLpiA8ptQ0UAVCWOU9+eOHemeZkc=;
        b=r2KqjKqvT/xeedE+Uetlyqb6JDv1xiVsWPQjpWxl++J6+bumEq73qW8Ny/MMnElmJ6
         O9O2t+XH/Ria9AnJC9poUqbrQIzuL18YDpLLO+HlnCySj9MFXVrVxzR/qRL9WemW0s8K
         3U/BXFOQch6jmpkQTR/rGoDpfz23FrESAr+lNHWLawIGMzx2fTTjcz1KpK0kxOX0sHxx
         PHZ14EwZSL9+kcmBhAgmfFWsCBqxCFGX8Kqp3FXP6iK6FOy934HbUBIYW/mYPki2JK4x
         3ykr0QYQA2hg1zzqTT7R+u+3plk5LWLv04e+GFSDnf/W5oXUa/ZF4xbNxQ1crQCdeyfB
         MhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687550645; x=1690142645;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EAV+u9FZn1OMDdsvLpiA8ptQ0UAVCWOU9+eOHemeZkc=;
        b=Cb4bGyK2lEhyZktOsNSPCqbCJXVtWC1d4CLXVG7GnnIvLg9LRwRn8utJ6Z2w7TO27X
         CSHHHVkuYl+kWXS0tEiZb2twB4JIed2ENZUiWxkIKU6QIo0jrzFX2EVxkzhjVupRgaFZ
         YcDYFO+hQMdEg1CI/+Lmy9y8boX7zcSkTiu4wjWZAiaUqm5B8Y1xaiP/weACDNxX/jge
         5UaPlO+Y6NbXNj+znEe0RmHsiiIs0QWFe1VpFEqnfpPVXrSJNoYryW2qvcYvLuW6ZQCI
         rqnRF1SKqejy2/Ip5Sdy/KsMWV1hog+coIKyYSWUn24EuH6DYRquv1+i7aLDYJKP8OkF
         yENw==
X-Gm-Message-State: AC+VfDxPAWSiyTKXS3NM05jLskZJByGCMY/1vrlc+JvmI4nokkGAihig
	W9bt/DpVtz6CssFQ3ti3MtvZXadBwAk=
X-Google-Smtp-Source: ACHHUZ6zM7Tgx4TGI3IPNASvkUDDWcbHxCnEXQz8Gh0NAaLENOYDQwmMhjGIuX7u07qjeoQlIIvfGSAVCwQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:1c12:0:b0:53f:6f7c:554e with SMTP id
 c18-20020a631c12000000b0053f6f7c554emr2532033pgc.12.1687550645192; Fri, 23
 Jun 2023 13:04:05 -0700 (PDT)
Date: Fri, 23 Jun 2023 13:04:03 -0700
In-Reply-To: <a3a19de92c7ac6e607ac3e663d84a4312876084b.1687474039.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1687474039.git.isaku.yamahata@intel.com> <a3a19de92c7ac6e607ac3e663d84a4312876084b.1687474039.git.isaku.yamahata@intel.com>
Message-ID: <ZJX6s2HxbHOUMXlj@google.com>
Subject: Re: [RFC PATCH v2 4/6] KVM: x86: Introduce fault type to indicate kvm
 page fault is private
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023, isaku.yamahata@intel.com wrote:
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_inter=
nal.h
> index 7f9ec1e5b136..0ec0b927a391 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -188,6 +188,13 @@ static inline bool is_nx_huge_page_enabled(struct kv=
m *kvm)
>  	return READ_ONCE(nx_huge_pages) && !kvm->arch.disable_nx_huge_pages;
>  }
> =20
> +enum kvm_fault_type {
> +	KVM_FAULT_MEM_ATTR,
> +	KVM_FAULT_SHARED,
> +	KVM_FAULT_SHARED_ALWAYS,
> +	KVM_FAULT_PRIVATE,

This is silly.  Just use AMD's error code bit, i.e. PFERR_GUEST_ENC_MASK as=
 per
the SNP series.

  Bit 34 (ENC): Set to 1 if the guest=E2=80=99s effective C-bit was 1, 0 ot=
herwise.

Just because Intel's ucode is too crusty to support error codes larger than=
 16
bits doesn't mean KVM can't utilize the bits :-)  KVM already translates to=
 AMD's
error codes for other things, e.g.

	error_code |=3D (exit_qualification & EPT_VIOLATION_GVA_TRANSLATED) !=3D 0=
 ?
	       PFERR_GUEST_FINAL_MASK : PFERR_GUEST_PAGE_MASK;

For TDX, handle_ept_violation() can do something like:

	if (is_tdx(vcpu->kvm))
		error_code |=3D (gpa & shared) ? 0 : PFERR_GUEST_ENC_MASK;
	else if (kvm_mem_is_private(vcpu->kvm, gpa_to_gfn(gpa)))
		error_code |=3D PFERR_GUEST_ENC_MASK;

And that's not even taking into account that TDX might have a separate entr=
y point,
i.e. the "is_tdx()" check can probably be avoided.

As for optimizing kvm_mem_is_private() to avoid unnecessary xarray lookups,=
 that
can and should be done separately, e.g.

  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
  {
	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
	       kvm_guest_has_private_mem(kvm) &&
	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
  }

where x86's implementation of kvm_guest_has_private_mem() can be

  #define kvm_guest_has_private_mem(kvm) (!!(kvm)->vm_type)
