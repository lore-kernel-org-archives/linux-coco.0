Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153DE173
	for <linux-coco@lists.linux.dev>; Fri, 16 Jul 2021 20:09:25 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id u126so2126194pfb.8
        for <linux-coco@lists.linux.dev>; Fri, 16 Jul 2021 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u0pjydLx3JpIq5yJNJLk5yOarBlyB2y3K/MnxWl/QbY=;
        b=tRRdNY3rQ2yUA7YeMApBzYCfnUynKEQYzvoTtYjwb2IBJVLcaoKSbZCuXzwKfbLgIX
         3mOjdoSJvrwbCvlxE+R6ynUZ8a+LIWwU2oZTWgBVs/mrUK+kAaJfUKGka+5z8/A16wVh
         N69/Dpl7u65YeklLR0Bc+1yAIWu03kY4J+PtnrcYHIcqhdTtyQZYx+FETaMOCCrt7U+R
         OjY/9ddNv9f7g8ftMdX+5rvrLUO0jghv5NOSeTY8BB2zhozAgoimF+FcM/+tg4tHpqQP
         lnXivfv7pZzaXtBHgF18og1DTdi07tWTmhCc5A0spZAsi/PZDiblLHE44TH25UmFZDv7
         yvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u0pjydLx3JpIq5yJNJLk5yOarBlyB2y3K/MnxWl/QbY=;
        b=PyAKHE0u3GM/3Jy6+hFo7DGUhFoLLSl2Zt9VJXcsc7m1AxjOfQiStFTJwfLyCxaJJJ
         97sVlFnDpeHGTBuWngz7k13H2u+4VzwS/ELZaUmMRlckQwjZl9PlMjXyqSPhx6B7JCP6
         uFZVxhVLo+IZt/Z6mVGqNM6GoIGWLYHg0tK8sydHlbXoQ+8JFiH1vVTME6XTBU9LXDIW
         61g8H5ifbU7F0VOAC4kDGrmVEq+7eVGFIrav4j+0iFwH6wMft30A9GCx2D56X9zgCsOv
         4ha6g33n0cPE8B1I85dzAUYbxgN1g7IZCIBHGjfMZo/gIhgddx76je/H0pk4iLf3+0ys
         tVVw==
X-Gm-Message-State: AOAM5302U72WNijc4NiIY0dUUf8V7hMFt5yyuwq9rHmwGHnjdp51R01C
	TglBV6o2OFshU7A2DE2cvKbOBg==
X-Google-Smtp-Source: ABdhPJzSgg5eq5sHlSLHBqoD6kbg2B5nZ06VkbmBOHa18iisBV4VO+wis26EV8cOjPTv2CzUmcGMeg==
X-Received: by 2002:aa7:81c5:0:b029:2f7:d4e3:78e9 with SMTP id c5-20020aa781c50000b02902f7d4e378e9mr12481425pfn.31.1626466164277;
        Fri, 16 Jul 2021 13:09:24 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id 1sm11367598pfv.138.2021.07.16.13.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 13:09:23 -0700 (PDT)
Date: Fri, 16 Jul 2021 20:09:19 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
	npmccallum@redhat.com, brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part2 RFC v4 25/40] KVM: SVM: Reclaim the guest pages
 when SEV-SNP VM terminates
Message-ID: <YPHnb5pW9IoTcwWU@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-26-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707183616.5620-26-brijesh.singh@amd.com>

On Wed, Jul 07, 2021, Brijesh Singh wrote:
> The guest pages of the SEV-SNP VM maybe added as a private page in the
> RMP entry (assigned bit is set). The guest private pages must be
> transitioned to the hypervisor state before its freed.

Isn't this patch needed much earlier in the series, i.e. when the first RMPUPDATE
usage goes in?

> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  arch/x86/kvm/svm/sev.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 1f0635ac9ff9..4468995dd209 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -1940,6 +1940,45 @@ find_enc_region(struct kvm *kvm, struct kvm_enc_region *range)
>  static void __unregister_enc_region_locked(struct kvm *kvm,
>  					   struct enc_region *region)
>  {
> +	struct rmpupdate val = {};
> +	unsigned long i, pfn;
> +	struct rmpentry *e;
> +	int level, rc;
> +
> +	/*
> +	 * The guest memory pages are assigned in the RMP table. Unassign it
> +	 * before releasing the memory.
> +	 */
> +	if (sev_snp_guest(kvm)) {
> +		for (i = 0; i < region->npages; i++) {
> +			pfn = page_to_pfn(region->pages[i]);
> +
> +			if (need_resched())
> +				schedule();

This can simply be "cond_resched();"

> +
> +			e = snp_lookup_page_in_rmptable(region->pages[i], &level);
> +			if (unlikely(!e))
> +				continue;
> +
> +			/* If its not a guest assigned page then skip it. */
> +			if (!rmpentry_assigned(e))
> +				continue;
> +
> +			/* Is the page part of a 2MB RMP entry? */
> +			if (level == PG_LEVEL_2M) {
> +				val.pagesize = RMP_PG_SIZE_2M;
> +				pfn &= ~(KVM_PAGES_PER_HPAGE(PG_LEVEL_2M) - 1);
> +			} else {
> +				val.pagesize = RMP_PG_SIZE_4K;

This raises yet more questions (for me) as to the interaction between Page-Size
and Hyperivsor-Owned flags in the RMP.  It also raises questions on the correctness
of zeroing the RMP entry if KVM_SEV_SNP_LAUNCH_START (in the previous patch).

> +			}
> +
> +			/* Transition the page to hypervisor owned. */
> +			rc = rmpupdate(pfn_to_page(pfn), &val);
> +			if (rc)
> +				pr_err("Failed to release pfn 0x%lx ret=%d\n", pfn, rc);

This is not robust, e.g. KVM will unpin the memory and release it back to the
kernel with a stale RMP entry.  Shouldn't this be a WARN+leak situation?

> +		}
> +	}
> +
>  	sev_unpin_memory(kvm, region->pages, region->npages);
>  	list_del(&region->list);
>  	kfree(region);
> -- 
> 2.17.1
> 
