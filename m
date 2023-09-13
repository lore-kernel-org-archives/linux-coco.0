Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C598F6E
	for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 16:16:13 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-591138c0978so79318527b3.1
        for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694621773; x=1695226573; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JiE4DdxUMHfTS70Z4Y1GxX9A0Rg/BgOzVpxxMDofuU=;
        b=ss/rwVF/iiGw2dW3rbViBOeEcCZuI0xEXoPVnrYJFGX13q2v4xMDT3p4Sfb0tCkSs2
         l/kYt3k9HkJirQdzU/bk9qV5HMW3kMPvGSKtnHFzXebU6+0zrVeDzZr924Y/cVFm4Exi
         +gIgpMIZgrB7jdHzXiq+Yeb6E6ohWpDAk1uvGpoRUnax5Slkcj/GCpnycjoNXzFcdv5p
         xSjhfvqJ5mr5uvyEDZ5+U61Pu7sCt2OlfXGVsEFNfiVUIgJ49vfSR/UPIVh4mJ1q3DXz
         cTrwhiHLx+LRoEkwIbMOIpuW7UoLxuBsZGZUULwGZaLOvKEdDpdmPoR4x3XaX3YZWE+9
         k0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694621773; x=1695226573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JiE4DdxUMHfTS70Z4Y1GxX9A0Rg/BgOzVpxxMDofuU=;
        b=d4dZr/ku7XwJ/39Sl4miptvTDXWkKFOTOmewuw6v0WREIw2Yjy0CDeKUL+jVC3magB
         4tytZi1xhpPZkuWxuk+akkS3zwPDSMIooh+/rgRDNr5x9/ygGkaG0r4Wo070FpJG4i6b
         grku/PI0QZMmRTZOEmSRzJfsmqQpukcQe1FC+RwXBREJLbmImCCygf3uc+47rJIfetjt
         YTsHUYv2iGdwIfG3L3dEe35+BF6AYZKGZ79gUCh9PtzQ7mjb2W+IM0WBA9di7hnAOfMN
         tPE+00tMWuFMSe8J1ZgHkGechOlwxcbaFx+Nv0IXbtbU++Kex67bOTnK7/9ZOFbv7NTy
         BOmw==
X-Gm-Message-State: AOJu0YzjXiNNHI/TRjSt8LyBWbKx6Eu7LsW3weWp1NogDjHX7wf4hrsW
	n3freygQia00ZA9WMDP9BxH5R0Go7DI=
X-Google-Smtp-Source: AGHT+IHPHKf4QXfFQhCv9rVUa7JrPB8sTnwxipNESGJoGValFttp6Gj7lD6PQrORyTMLg/nP1eKBYhCE38I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b71e:0:b0:583:4f82:b9d9 with SMTP id
 v30-20020a81b71e000000b005834f82b9d9mr84623ywh.5.1694621772950; Wed, 13 Sep
 2023 09:16:12 -0700 (PDT)
Date: Wed, 13 Sep 2023 09:16:11 -0700
In-Reply-To: <56cd2f6f42351f2f27a07e5764bab7f689cc0059.1694599703.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1694599703.git.isaku.yamahata@intel.com> <56cd2f6f42351f2f27a07e5764bab7f689cc0059.1694599703.git.isaku.yamahata@intel.com>
Message-ID: <ZQHgS13+QBChjYNw@google.com>
Subject: Re: [RFC PATCH 1/6] KVM: guest_memfd: Add config to show the
 capability to handle error page
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 13, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Add config, HAVE_GENERIC_PRIVATE_MEM_HANDLE_ERROR, to indicate kvm arch
> can handle gmem error page.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  virt/kvm/Kconfig     | 3 +++
>  virt/kvm/guest_mem.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 1a48cb530092..624df45baff0 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -112,3 +112,6 @@ config KVM_GENERIC_PRIVATE_MEM
>         select KVM_GENERIC_MEMORY_ATTRIBUTES
>         select KVM_PRIVATE_MEM
>         bool
> +
> +config HAVE_GENERIC_PRIVATE_MEM_HANDLE_ERROR
> +	bool
> diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
> index 85903c32163f..35d8f03e7937 100644
> --- a/virt/kvm/guest_mem.c
> +++ b/virt/kvm/guest_mem.c
> @@ -307,6 +307,9 @@ static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
>  	pgoff_t start, end;
>  	gfn_t gfn;
>  
> +	if (!IS_ENABLED(CONFIG_HAVE_GENERIC_PRIVATE_MEM_HANDLE_ERROR))
> +		return MF_IGNORED;

I don't see the point, KVM can and should always zap SPTEs, i.e. can force the
geust to re-fault on the affected memory.  At that point kvm_gmem_get_pfn() will
return -EHWPOISON and architectures that don't support graceful recovery can
simply terminate the VM.
