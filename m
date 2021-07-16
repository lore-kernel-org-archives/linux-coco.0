Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676A72
	for <linux-coco@lists.linux.dev>; Fri, 16 Jul 2021 21:14:22 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id j199so9941330pfd.7
        for <linux-coco@lists.linux.dev>; Fri, 16 Jul 2021 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wHhC/u+Tz+YyCWTdNKVYJX34gL1qM4KNQ1J0r6VozT0=;
        b=AGRyq/qLXmbKze3lJ72pJN2QN/c76K/csTSS8PXICwMCVK/EaEAzMwZxA3o3PZ1Qtt
         gC0Bhr5bbahQFHLe/HTA6RMZAOcKRBBJeVVUC+uHdTDfBmW/V36F3wEFvo67Bt9rc8r3
         5HwAsQBrgzKeb91PrTNi048jDDwGveiQTTWtvGKvulqf0D3cOo9WsQCK1BD78rEMgTGJ
         cOfgcmwQiKsnj/PXZm6smL5sk3hlLIxtkYPebjodPnBHLoBG5088hMqzEaq2LfRwsuAq
         bP919qg9TSZR+H2/ajzxyrUq9XVZ59DW4JTE/NKIYZ8LNzjsMBfzte6WfHhE0oFyV2rN
         E0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wHhC/u+Tz+YyCWTdNKVYJX34gL1qM4KNQ1J0r6VozT0=;
        b=ex/+4KbXGn2HPc7qcE6ZdxwoJpJpf+0lpjO1O0nY44CGnxs67tduPhhv6KPAWyxtA2
         N329ZrgwrgWJ8wy/MPnY9IclMjHGKJIlhUemc/71aD3GJTEdBo6MslorrRmYdqDChgcE
         xj5NoKHUr5TuLMUqAccONEujS3mkUjqFJl2zK8STqLeUvDhdSlaDyp6xx9iFYF9b0m12
         edPE+8t7SBtoi/SrLTnUpQ3ySWTqfEaZmn5S7ESSgCpMt/OmMWarnBChD15JvWVeuysg
         vsUTWEJn6k60Maa1bRUkvpM7iYKBHskPvPkB+Jp9KfqB4PZp6r3lAVyzuSHFCmIHVIjq
         BWPA==
X-Gm-Message-State: AOAM531N+UaYMFeeCmyIXmoGLZ7nDzHXL4bsOQO6RJeFR/OVd0Y9dblT
	RlLCOetqHkwu0iTB6YQbyN75BA==
X-Google-Smtp-Source: ABdhPJyy/03uRnhTJ2SiPB6qPk6MqOkswkGZYvq9jxHBfG5mcW0dG3s0jOK6gCGZRtU3oAwINdQ+HQ==
X-Received: by 2002:aa7:90cd:0:b029:333:baa9:87b7 with SMTP id k13-20020aa790cd0000b0290333baa987b7mr7471263pfk.23.1626470061392;
        Fri, 16 Jul 2021 14:14:21 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id b1sm12659509pjn.11.2021.07.16.14.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 14:14:20 -0700 (PDT)
Date: Fri, 16 Jul 2021 21:14:17 +0000
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
Subject: Re: [PATCH Part2 RFC v4 34/40] KVM: SVM: Add support to handle Page
 State Change VMGEXIT
Message-ID: <YPH2qRkkG6m0FT2X@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-35-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707183616.5620-35-brijesh.singh@amd.com>

On Wed, Jul 07, 2021, Brijesh Singh wrote:
> +static unsigned long snp_handle_psc(struct vcpu_svm *svm, struct ghcb *ghcb)
> +{
> +	struct kvm_vcpu *vcpu = &svm->vcpu;
> +	int level, op, rc = PSC_UNDEF_ERR;
> +	struct snp_psc_desc *info;
> +	struct psc_entry *entry;
> +	gpa_t gpa;
> +
> +	if (!sev_snp_guest(vcpu->kvm))
> +		goto out;
> +
> +	if (!setup_vmgexit_scratch(svm, true, sizeof(ghcb->save.sw_scratch))) {
> +		pr_err("vmgexit: scratch area is not setup.\n");
> +		rc = PSC_INVALID_HDR;
> +		goto out;
> +	}
> +
> +	info = (struct snp_psc_desc *)svm->ghcb_sa;
> +	entry = &info->entries[info->hdr.cur_entry];

Grabbing "entry" here is unnecessary and confusing.

> +
> +	if ((info->hdr.cur_entry >= VMGEXIT_PSC_MAX_ENTRY) ||
> +	    (info->hdr.end_entry >= VMGEXIT_PSC_MAX_ENTRY) ||
> +	    (info->hdr.cur_entry > info->hdr.end_entry)) {

There's a TOCTOU bug here if the guest uses the GHCB instead of a scratch area.
If the guest uses the scratch area, then KVM makes a full copy into kernel memory.
But if the guest uses the GHCB, then KVM maps the GHCB into kernel address space
but doesn't make a full copy, i.e. the guest can modify the data while it's being
processed by KVM.

IIRC, Peter and I discussed the sketchiness of the GHCB mapping offline a few
times, but determined that there were no existing SEV-ES bugs because the guest
could only submarine its own emulation request.  But here, it could coerce KVM
into running off the end of a buffer.

I think you can get away with capturing cur_entry/end_entry locally, though
copying the GHCB would be more robust.  That would also make the code a bit
prettier, e.g.

	cur = info->hdr.cur_entry;
	end = info->hdr.end_entry;

> +		rc = PSC_INVALID_ENTRY;
> +		goto out;
> +	}
> +
> +	while (info->hdr.cur_entry <= info->hdr.end_entry) {

Make this a for loop?

	for ( ; cur_entry < end_entry; cur_entry++)

> +		entry = &info->entries[info->hdr.cur_entry];

Does this need array_index_nospec() treatment?

> +		gpa = gfn_to_gpa(entry->gfn);
> +		level = RMP_TO_X86_PG_LEVEL(entry->pagesize);
> +		op = entry->operation;
> +
> +		if (!IS_ALIGNED(gpa, page_level_size(level))) {
> +			rc = PSC_INVALID_ENTRY;
> +			goto out;
> +		}
> +
> +		rc = __snp_handle_psc(vcpu, op, gpa, level);
> +		if (rc)
> +			goto out;
> +
> +		info->hdr.cur_entry++;
> +	}
> +
> +out:

And for the copy case:

	info->hdr.cur_entry = cur;

> +	return rc ? map_to_psc_vmgexit_code(rc) : 0;
> +}
