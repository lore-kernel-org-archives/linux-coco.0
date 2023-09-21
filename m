Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A4219470
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 21:29:23 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d8571d5e71aso1869526276.0
        for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695331762; x=1695936562; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGBnu6VSG+/azby0SuhGoM7WFu5N49MxhGtPLCEYj7Y=;
        b=atfsO+MRcJERV/aF77Z9mDjFTUKjwslCk6mpPIbHl6t6HuiJOFWOP/r5gD/UcBIUMM
         fdW52GI0qWA89710N0tV5zSI6UJ83hN3TaQQ+uIVVyNbdB1v+OYTj4wDfvC/4V5bowTa
         fQ5qoYUQXyCtzHx6auXvQ+KT6p1/O+c8xsY8PmdZ7Q2TjqozYrLPeqYKEI9O2BxhPHYb
         LlsYFjavcTjvPvYyUPyiiwSuiksEI1NrqHt5uypTcZKWkZnFzTe2Oga8zsWrI9kCgMHz
         EXLhsd8q9aZUOJGDbOT9Y/KCD+FLmD97jwps6j4s/+tNn1TRBgOA/XYdxwulaA2HgroK
         XZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695331762; x=1695936562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGBnu6VSG+/azby0SuhGoM7WFu5N49MxhGtPLCEYj7Y=;
        b=KAQsIQz61GAQRchDSQ8sykXvaeHyj+9ld4lN20CO1w1VE30pDEKj/+VkEU4AzFHHZ3
         z1FBBBjPXCLhK4JnjIOTz6rTz0qZcG34YAVKfcCn1NFHix/e1qyZAk7xu5ZmlC6VGYmG
         BbZPqdlkJJ8bcih9Bsrhm583T83mIPgvwU4D7UN7Sq1puKfgn/FVRx/VdjEQAdBjhOFW
         BrACDCLkqnE5jAFnyOuUDMow4kT/U0lr5XjqjJ24r/0KuqLGm4XhBT/02ep3YDd6wnmk
         AHGb/CAZSldYFBlU3oq7PQR2hVCmMdTGPuFtA5r3h2VC08wx+B7WLZaXeoS3evsM07kX
         zTHA==
X-Gm-Message-State: AOJu0Yxi2S8SVJV0EvgzlCseHaSijA1t6M2SDBZTifoQhWFrZzIhhfu9
	p+Dc3J+MSC1YUllXGIoWSe1Ba08cGsY=
X-Google-Smtp-Source: AGHT+IHWNByCIxDzTx5QAdD7uR/d2d7gUCrth/qIEPfej09mGplokWZOjT6UEUFRsTTKmehDwV7dGEBrHFk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:420b:0:b0:d0c:c83b:94ed with SMTP id
 p11-20020a25420b000000b00d0cc83b94edmr88009yba.10.1695331762271; Thu, 21 Sep
 2023 14:29:22 -0700 (PDT)
Date: Thu, 21 Sep 2023 14:29:20 -0700
In-Reply-To: <363c4ac28af93aa96a52f897d2fe5c7ec013f746.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com> <363c4ac28af93aa96a52f897d2fe5c7ec013f746.1695327124.git.isaku.yamahata@intel.com>
Message-ID: <ZQy1sDOQAxPyZzjW@google.com>
Subject: Re: [RFC PATCH v2 4/6] KVM: gmem: Add ioctl to inject memory failure
 on guest memfd
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

On Thu, Sep 21, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> To test error_remove_page() method of KVM gmem, add a new ioctl to
> inject memory failure based on offset of guest memfd.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  include/uapi/linux/kvm.h |  6 ++++
>  virt/kvm/guest_mem.c     | 68 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 65fc983af840..4160614bcc0f 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -2323,4 +2323,10 @@ struct kvm_create_guest_memfd {
>  	__u64 reserved[6];
>  };
>  
> +#define KVM_GUEST_MEMORY_FAILURE	_IOWR(KVMIO,  0xd5, struct kvm_guest_memory_failure)

If we're going to add a KVM ioctl(), my vote is to make it a generic ioctl(), not
something that's specific to guest_memfd().  IIUC, all we need is the PFN, so the
only downside is that it'd require valid memslots.  But the test isn't all that
interesting unless there are memslots, so I don't see that as a negative.

And if we add an ioctl(), it should be conditioned on CONFIG_HWPOISON_INJECT.

An alternative I think we should seriously consider is using the FAULT_INJECTION
framework to poison pages.  We (Google) have plans to utilize fault injection for
other things in KVM, e.g. to inject "failures" on CMPXCHG in atomic SPTE updates
to force KVM down unlikely slow paths.  I don't expect us to get patches posted
until early next year due to priorities, but hell or high water we will get patches
posted at some point.

The fault injection framework might be overkill for injecting memory errors, e.g.
a single ioctl() is definitely simpler to setup, but I suspect it would also be
much more powerful in the long run..
