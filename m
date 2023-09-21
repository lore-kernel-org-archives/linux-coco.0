Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0A168A3
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 23:22:40 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59bee08c13aso21051297b3.0
        for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695338560; x=1695943360; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7bkyRILGQE7yWTmbQXiGKEo0p9CYB75A1OQz7APl7U=;
        b=NHyqA43Glozs07i8+P0xrRA6OCh72qBptWx0NAIEf0bLVm0u0l74KIVVPBLiYi/IqE
         CcIG5AwKSOg2mWu6IDKUov+faBROEqFDZXhyNQkgIIt+E/zBsWKq4h9NRlemWlR3F4u3
         /VYGMpL968aunGK+thYEimzp32k8b1n28ikAwB5u91t0U20VZff0kRjKCQfKK8WqYrgI
         nYLL4WnxxXTwgHSke1shO6qw6elKTHj8OZI+4FVjftmdUlywDDDGHpp0jVdTfm8TSNeS
         TJXN4dlLTjxVmwHgnw1DLN8aIPAcCpuPfyYBfM+BKaEw+pkK2L+9dMLXgTQGJG6dIcZH
         NetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695338560; x=1695943360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7bkyRILGQE7yWTmbQXiGKEo0p9CYB75A1OQz7APl7U=;
        b=csSDAMyWICcmRDDfKSNEg25znrEJzX7Ev18lAVHENjidHOOr1AIepnPniLjwCK4pfa
         TmCGfMWa0+ucYxxH++fscRwN1RmpEizl7reJ/NC+u15/E9Tz2zUWpFDifjzw1zMkesP9
         2Zovb8dSLP9EHuBBVzsOftkSdyfigA8n//ZveyZHRcmC00Qe4MWUX8qpNeEgQClFWnFl
         oiP6960cPmU14WBO3lpY2HswNJs7N0WHO8ilUDjKnsl2N32uu1Nz2p+8RQWCztoJxOET
         dsPo3x1Q2Z/h6ZgjVyEhnxKIEwqL0xlrO7yV2dabSwZXoPS9ejMNWJKwPoN6nMRTlgaz
         6Uwg==
X-Gm-Message-State: AOJu0YzYXJrCcN9TimBADBfTl4PKF1KO6VbtPtx1W2gKsRqtFMasJ6mM
	doy+s/csQFXGDJ4XYrmY04bXy5T4yBM=
X-Google-Smtp-Source: AGHT+IHSb1Z0r7ilnJEoZiCefYypp5r5pBlXksHvx1oJ1cYKDwbYaGWbl1D6tS70HePwIJJQap8jFXMgfrE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:746:0:b0:d05:98ef:c16b with SMTP id
 67-20020a250746000000b00d0598efc16bmr943ybh.5.1695338559807; Thu, 21 Sep 2023
 16:22:39 -0700 (PDT)
Date: Thu, 21 Sep 2023 16:22:38 -0700
In-Reply-To: <7fddbf10494490251f2156fd600306991826165f.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com> <7fddbf10494490251f2156fd600306991826165f.1695327124.git.isaku.yamahata@intel.com>
Message-ID: <ZQzQPlcRdxu3z2Y/@google.com>
Subject: Re: [RFC PATCH v2 6/6] KVM: guest_memfd: selftest: Add test case for
 error_remove_page method
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
> This test case implements fault injection into guest memory by
> madvise(MADV_HWPOISON) for shared(conventional) memory region and
> KVM_GUEST_MEMORY_FAILURE for private gmem region.  Once page is poisoned,
> free the poisoned page and try to run vcpu again to see a new zero page is
> assigned.

Thanks much for the test!  I think for the initial merge it makes sense to leave
this out, mainly because I don't think we want a KVM specific ioctl().  But I'll
definitely keep this around to do manual point testing.

> +#define BASE_DATA_SLOT		10
> +#define BASE_DATA_GPA		((uint64_t)(1ull << 32))
> +#define PER_CPU_DATA_SIZE	((uint64_t)(SZ_2M))
> +
> +enum ucall_syncs {
> +	HWPOISON_SHARED,
> +	HWPOISON_PRIVATE,
> +};
> +
> +static void guest_sync_shared(uint64_t gpa)

Probably guest_poison_{shared,private}(), or maybe just open code the GUEST_SYNC2()
calls.  I added helpers in the other tests because the ucalls were a bit more
involved then passing the GPA.

However, I don't see any reason to do hypercalls and on-demand mapping/fallocate.
Just have two separate sub-tests, one for private and one for shared, each with
its own host.  I'm pretty sure the guest code can be the same, e.g. I believe it
would just boil down to:

static void guest_code(uint64_t gpa)
{
	uint64_t *addr = (void *)gpa;

	WRITE_ONCE(*addr, <some pattern>);

	/* Ask the host to poison the page. */
	GUEST_SYNC(EWPOISON);

	/*
	 * Access the poisoned page.  The host should see a SIGBUS or EHWPOISON
	 * and then truncate the page.  After truncation, the page should be
	 * faulted back and read zeros, all before the read completes.
	 */
	GUEST_ASSERT_EQ(*(uint64_t *)gpa, 0);
	GUEST_DONE();
}

> +			if (uc.args[0] == HWPOISON_PRIVATE) {
> +				int ret;
> +
> +				inject_memory_failure(gmem_fd, gpa);
> +				ret = _vcpu_run(vcpu);
> +				TEST_ASSERT(ret == -1 && errno == EHWPOISON &&

Honestly, I'm kinda surprised the KVM code actually works :-)

> +					    run->exit_reason == KVM_EXIT_MEMORY_FAULT,
> +					    "exit_reason 0x%x",
> +					    run->exit_reason);
> +				/* Discard the poisoned page and assign new page. */
> +				vm_guest_mem_fallocate(vm, gpa, PAGE_SIZE, true);
> +			} else {
> +				uint8_t *hva = addr_gpa2hva(vm, gpa);
> +				int r;
> +
> +				r = madvise(hva, 8, MADV_HWPOISON);

Huh.  TIL there's an MADV_HWPOISON.  We've already talked about adding fbind(),
adding an fadvise() seems like the obvious solution.  Or maybe overload
fallocate() with a new flag?  Regardless, I think we should add or extend a generic
fd-based syscall(), not throw in something KVM specific.
