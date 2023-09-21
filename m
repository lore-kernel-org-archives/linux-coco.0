Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4919CA5B
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 20:40:42 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5788445ac04so1021121a12.2
        for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 13:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695328842; x=1695933642; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wY7skFGSh9IgJDFkQorAIyBJ+qj/XXwmSoR+xsvLutM=;
        b=kyeGdibZiYleqMuokOED3GzUgFWGhvjM9e3ld6KdvlSFT96qmFoNogCHD9Q1/LTh6B
         /QEvWphOhUvYP64fQhYl6v8sV0/kT9p1lk78lMwLSAkfVbFTjmhvxZi6Jy4J7yA0QATe
         fiXIfBkjVRF0zEDb+OewFaweCAZPWJAHpfGB75/jpfAX/Skz5MkBP/IbFVd9b9NSTIOW
         U12RJE6+QRxC8eRscDIWsHijU9RB//bnPVqfQGgKdwBcfRj09LvK6jlXgHo/oVryXzWC
         dXXI1Xp4OwLzq/d0nK9WUMsPLxtC3cF34G37jyILc3W7DxylgncPChjO1xSdHnOmDD0v
         itTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695328842; x=1695933642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wY7skFGSh9IgJDFkQorAIyBJ+qj/XXwmSoR+xsvLutM=;
        b=MSJxU+PdhEsNzwItfGALb7M97ZyJiL+h1j4jK98GeaHeleA34dTriiW9VEjxdllgM1
         H0u4NY17o0Z254a+hAL94wPfmWKAEm9mPVS99QFtSwLts81tghTXH/BiDflcCLYOqtZ+
         2Rf7MYXuJpl4b4ULQJAthME1gMASe4eTVR+iZ+TBL+XV8BrDKAOSzlzRWImwfdC1UsLe
         XO9f3XXgNpVbRIpCJp2ejTEOSeAzZaVA1kvH+oeFAJYSdANt8uKCwzcJ8HJRNT+tmmnu
         yrD9Fv91Q0+Un9xJA2N4jl4yEJSe9AaG3GL/WIgNVyhOw8C9JJ0K+y1yZesZqefER6Va
         xz3g==
X-Gm-Message-State: AOJu0YzeQQvvXZVMcBmXV9XRCUqws1E8IIk289a1xClWmLA5anRV9hEJ
	+KfKQtYRney0mjQiKegWIgnkbNuikbc=
X-Google-Smtp-Source: AGHT+IE2K20JyCSxvBs9FX0l9CJg9tnhr+0tXhOs9dF7vlRV4Ygmc3v4TCO+SwF3JM+aWjkkBb9ehZqxmwE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3307:0:b0:56c:24c2:488d with SMTP id
 z7-20020a633307000000b0056c24c2488dmr80575pgz.4.1695328842280; Thu, 21 Sep
 2023 13:40:42 -0700 (PDT)
Date: Thu, 21 Sep 2023 13:40:40 -0700
In-Reply-To: <26822c313754e03b2c393e6fdefe495f117bbfff.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com> <26822c313754e03b2c393e6fdefe495f117bbfff.1695327124.git.isaku.yamahata@intel.com>
Message-ID: <ZQyqSI0HOmamJbWn@google.com>
Subject: Re: [RFC PATCH v2 3/6] KVM: selftests: Add tests for punch hole on guest_memfd
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
> Punch hole implies the region is zeroed out. Add tests if the punched
> region has zero.
> Oppertunistically Remove unused member, pattern, in guest_run_test().

Heh, I didn't pretty much all the same stuff, except I opted to have
SET_ATTRIBUTE instead of FALLOCATE_ONLY, e.g. in case we end up with a test that's
wants a thrid flavor (or somehow neither?).

> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  .../kvm/x86_64/private_mem_conversions_test.c | 26 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 

...

> @@ -156,6 +163,10 @@ static void guest_run_test(uint64_t base_gpa, bool do_fallocate)
>  
>  		if (size > PAGE_SIZE) {
>  			memset((void *)gpa, p2, PAGE_SIZE);
> +
> +			/* Test if punch hole results in zeroing page. */
> +			guest_punch_hole_private(gpa, PAGE_SIZE);
> +			memcmp_g(gpa, 0, PAGE_SIZE);

I added a dedicated sub-test to provide a bit more variety in the tests.  I highly
doubt my version will ever find a bug that isn't caught by this approach, but if
nothing else, it's nice to have a completely separate sub-test.
