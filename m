Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265272
	for <linux-coco@lists.linux.dev>; Mon, 20 Sep 2021 16:10:48 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id u18so17918752pgf.0
        for <linux-coco@lists.linux.dev>; Mon, 20 Sep 2021 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RHPENS35TK70dwgRtuqMxqQYFvEywydxESq3g0YeWeY=;
        b=a+D32SSgnrOzLf2jTTB3XXObCufAjGVIs0SqMoiQUV7ljWXr4dz4YtA+HOcz+prtgm
         5s8aG0yU5rTM2wmxo1wlsWi2IjIAIOCC4wS5T7rT7gl1MLstD6X4zH3J3dUDcYaSScIi
         pU9yWEXihPjBpN0472qyPrL1LIwtZEzBsxcu7521ETNdy555l/L+OPfvWyDwtrHwq3KX
         5Yy5s2XogiXel6mGab+Mgl8BANm7UD4s9PtRVksaZ5w5DICYmKnWrTmAAXHR0ky9MUUx
         +O4cfzZADqj+nhpcUB8vMDH2T6+CjBTupY76CQsuFUD2muVBVp6hp+KUgJ2PISB3B/j8
         wrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RHPENS35TK70dwgRtuqMxqQYFvEywydxESq3g0YeWeY=;
        b=KXbZHjJ1uBxKY9iZgvmPwp7AvXjCiXZJvKUZmqaG0CIsSHAgELcB5jY8piylbrWncP
         b+64ESKnASV8bEEKVrvN2MuwGc25DjAE+u8t5mWHHLK1sVjCM6zuVmBoZ7A3OHgvx7aj
         rClMIhP0nCyLOC7Tv2MZ+YHC5qoEoypqWNztqublRxnLUjhJq9wR06R0Lbk8NgF6JXpP
         gK2nfuAftTh/l0Hw1g3cEPM/dLKSvn9zVQR27PwzKlsZp3+MtCanYxMAleWWmlNcgkvh
         bPjGNMEcY/DgvHgfvIKxBrc4bO0oQNwbBBBW/iKIvGlEPxS36h+2uiVLYgU9lOe+PrYb
         0yhw==
X-Gm-Message-State: AOAM530X4E9aDkxA0drRcqvQlOCMMJZ0s5qVfOpnR0YoZVC4GBQ1XaFf
	DPPFZGCtVXO/Xd6qpx9GTrvzdA==
X-Google-Smtp-Source: ABdhPJx5qH4XRk3aI1atwoaavXlPJ3g+FMogcSusD/ahOJ1VHNmO+V2cxDDuhPlNlaQNjZaeRkUToQ==
X-Received: by 2002:a63:7402:: with SMTP id p2mr24070517pgc.472.1632154247688;
        Mon, 20 Sep 2021 09:10:47 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id j6sm15420414pgq.0.2021.09.20.09.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 09:10:47 -0700 (PDT)
Date: Mon, 20 Sep 2021 16:10:43 +0000
From: Sean Christopherson <seanjc@google.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2 1/4] KVM: SVM: Get rid of *ghcb_msr_bits() functions
Message-ID: <YUiyg1W1cDxVbgzs@google.com>
References: <20210722115245.16084-1-joro@8bytes.org>
 <20210722115245.16084-2-joro@8bytes.org>
 <YS/sqmgbS6ACRfSD@google.com>
 <YToM5akzNrlqHTJz@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YToM5akzNrlqHTJz@8bytes.org>

On Thu, Sep 09, 2021, Joerg Roedel wrote:
> On Wed, Sep 01, 2021 at 09:12:10PM +0000, Sean Christopherson wrote:
> > On Thu, Jul 22, 2021, Joerg Roedel wrote:
> > >  	case GHCB_MSR_TERM_REQ: {
> > >  		u64 reason_set, reason_code;
> > >  
> > > -		reason_set = get_ghcb_msr_bits(svm,
> > > -					       GHCB_MSR_TERM_REASON_SET_MASK,
> > > -					       GHCB_MSR_TERM_REASON_SET_POS);
> > > -		reason_code = get_ghcb_msr_bits(svm,
> > > -						GHCB_MSR_TERM_REASON_MASK,
> > > -						GHCB_MSR_TERM_REASON_POS);
> > > +		reason_set  = GHCB_MSR_TERM_REASON_SET(control->ghcb_gpa);
> > > +		reason_code = GHCB_MSR_TERM_REASON(control->ghcb_gpa);
> > > +
> > >  		pr_info("SEV-ES guest requested termination: %#llx:%#llx\n",
> > >  			reason_set, reason_code);
> > > +
> > >  		fallthrough;
> > 
> > Not related to this patch, but why use fallthrough and more importantly, why is
> > this an -EINVAL return?  Why wouldn't KVM forward the request to userspace instead
> > of returning an opaque -EINVAL?
> 
> I guess it is to signal an error condition up the call-chain to get the
> guest terminated, like requested.

Yes, but it's odd bizarre/unfortunate that KVM doesn't take this opportunity to
forward the termination info to the VMM.  The above pr_info() should not exist.
If that information is relevant then it should be handed to the VMM directly, not
dumped to dmesg.
