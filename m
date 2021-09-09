Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70B2FAF
	for <linux-coco@lists.linux.dev>; Thu,  9 Sep 2021 13:31:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id A57C960F; Thu,  9 Sep 2021 15:23:26 +0200 (CEST)
Date: Thu, 9 Sep 2021 15:22:51 +0200
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
Message-ID: <YToKq31QIrXQFn7X@8bytes.org>
References: <20210722115245.16084-1-joro@8bytes.org>
 <20210722115245.16084-2-joro@8bytes.org>
 <YS/sqmgbS6ACRfSD@google.com>
 <YS/xSIvhS5GySXlQ@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS/xSIvhS5GySXlQ@google.com>

Hi Sean,

On Wed, Sep 01, 2021 at 09:31:52PM +0000, Sean Christopherson wrote:
> On Wed, Sep 01, 2021, Sean Christopherson wrote:
> > 		control->ghcb_gpa = MAKE_GHCB_MSR_RESP(cpuid_reg, cpuid_value);

Made that change, but kept the set_ghcb_msr_cpuid_resp() and renamed it
to ghcb_msr_cpuid_resp(). It now returns the MSR value for the CPUID
response.

I like the keep the more complicated response setters as functions and
not macros for readability.


> 	case GHCB_MSR_SEV_INFO_REQ:
> 		control->ghcb_gpa = GHCB_MSR_SEV_INFO(GHCB_VERSION_MAX,
> 						      GHCB_VERSION_MIN,
> 						      sev_enc_bit));
> 		break;
> 
> and drop set_ghcb_msr() altogether.

Makes sense, I replaced the set_ghcb_msr() calls with the above.

> Side topic, what about renaming control->ghcb_gpa => control->ghcb_msr so that
> the code for the MSR protocol is a bit more self-documenting?  The APM defines
> the field as "Guest physical address of GHCB", so it's not exactly prescribing a
> specific name.

No strong opinion here, I let this up to the AMD engineers to decide. If
we change the name I can add a separate patch for this.

Regards,

	Joerg
