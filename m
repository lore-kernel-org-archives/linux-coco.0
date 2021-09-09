Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B053FE0
	for <linux-coco@lists.linux.dev>; Thu,  9 Sep 2021 13:32:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 0D39DD35; Thu,  9 Sep 2021 15:32:50 +0200 (CEST)
Date: Thu, 9 Sep 2021 15:32:21 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2 1/4] KVM: SVM: Get rid of *ghcb_msr_bits() functions
Message-ID: <YToM5akzNrlqHTJz@8bytes.org>
References: <20210722115245.16084-1-joro@8bytes.org>
 <20210722115245.16084-2-joro@8bytes.org>
 <YS/sqmgbS6ACRfSD@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS/sqmgbS6ACRfSD@google.com>

On Wed, Sep 01, 2021 at 09:12:10PM +0000, Sean Christopherson wrote:
> On Thu, Jul 22, 2021, Joerg Roedel wrote:
> >  	case GHCB_MSR_TERM_REQ: {
> >  		u64 reason_set, reason_code;
> >  
> > -		reason_set = get_ghcb_msr_bits(svm,
> > -					       GHCB_MSR_TERM_REASON_SET_MASK,
> > -					       GHCB_MSR_TERM_REASON_SET_POS);
> > -		reason_code = get_ghcb_msr_bits(svm,
> > -						GHCB_MSR_TERM_REASON_MASK,
> > -						GHCB_MSR_TERM_REASON_POS);
> > +		reason_set  = GHCB_MSR_TERM_REASON_SET(control->ghcb_gpa);
> > +		reason_code = GHCB_MSR_TERM_REASON(control->ghcb_gpa);
> > +
> >  		pr_info("SEV-ES guest requested termination: %#llx:%#llx\n",
> >  			reason_set, reason_code);
> > +
> >  		fallthrough;
> 
> Not related to this patch, but why use fallthrough and more importantly, why is
> this an -EINVAL return?  Why wouldn't KVM forward the request to userspace instead
> of returning an opaque -EINVAL?

I guess it is to signal an error condition up the call-chain to get the
guest terminated, like requested.

Regards,

	Joerg
