Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9CB17AB2
	for <linux-coco@lists.linux.dev>; Tue, 20 Jun 2023 21:18:48 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1aa291b3fc7so2376838fac.1
        for <linux-coco@lists.linux.dev>; Tue, 20 Jun 2023 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687295927; x=1689887927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPIrkDOEnetRxudGIQqwVRWbtrDT/RDlBKZ80849Peg=;
        b=jYUxatN9gZBGTUs0XIxhoKSn1D5lt5Y5Vxr5pBmpTD1cGve3wFw3YrEJd1ECpInXH8
         9gPsSUYOVuUc9i0Kah4UzDCbB/pFdnB47txwId6sW6GwBrUzT4vDUimtQmIO/XI4xuqp
         NlJz8VrScTNqLft0nR6MYiSMpTkf8srTxaYuThtjytTPBqt6XNGURjV7pA0JHDQkg/v/
         SsQZJrIfsWqTLEBF0CNxMCDzWSuR3ncxGKx1HJEDdpM38eCtXXI14KOsZVydct8SwggE
         2Xbs7OJRYrqGD/0rBBj8kz7R1QdSRY+1A9vq/M8zFNga2fFJBkeo1w9T5JOsT0zPQXMQ
         O7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687295927; x=1689887927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPIrkDOEnetRxudGIQqwVRWbtrDT/RDlBKZ80849Peg=;
        b=Zas7jB99KZqxA9BRbyoBIBZHZJsYnzPTv7MMUSoh7haG9Kf6KQ9pJrNjZJLa4Tks2S
         A0AYF0QhtH6KqdHwXiKs7l1JXWS5Y96VR0d6cdYW5WbeXXCoyzFnEza6KlD7+Q1eC3wm
         VhcoZ6IqT5KQD5ianwwmqumFSRs1qD4x2XuJfP0KT9+PDKj0iRbt9AKs8gHpvYn+2dX+
         0Si4a7r7XnN9YZZ9r2ra+wtOu97hXDx4kbZVsR4dBcBa92iU5cKzR1d36jfcHjrSnrRa
         FKn1Ebkd9wbOtpGmeF1RVe35EUpzySHU1+er9f/F54aHoo6hqHRYqI+xcm1H8eQbEa4d
         cjnw==
X-Gm-Message-State: AC+VfDzI/r9iK1D+Gprx1T3bL/Rck+i4DDeFVoT//Xy6Gow5TUHbtC8o
	QAW5jRMfJQlSuPGodSRUsCWpTDedGn+C1w==
X-Google-Smtp-Source: ACHHUZ5IJr0CXOlTtOybC0Ytm0ge2PHofa8ddUm0IVeq3u7zpfVE/i4EfefH19Y8S38FSxTm/LLAPw==
X-Received: by 2002:a05:6870:ab84:b0:1a3:67a6:4676 with SMTP id gs4-20020a056870ab8400b001a367a64676mr13548407oab.29.1687295927231;
        Tue, 20 Jun 2023 14:18:47 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id fs9-20020a17090af28900b00256504e0937sm7763908pjb.34.2023.06.20.14.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 14:18:46 -0700 (PDT)
Date: Tue, 20 Jun 2023 14:18:45 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Isaku Yamahata <isaku.yamahata@gmail.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com,
	bp@alien8.de, vbabka@suse.cz, kirill@shutemov.name,
	ak@linux.intel.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
	dgilbert@redhat.com, jarkko@kernel.org, ashish.kalra@amd.com,
	nikunj.dadhania@amd.com, liam.merwick@oracle.com,
	zhi.a.wang@intel.com
Subject: Re: [PATCH RFC v9 04/51] KVM: x86: Determine shared/private faults
 using a configurable mask
Message-ID: <20230620211845.GV2244082@ls.amr.corp.intel.com>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-5-michael.roth@amd.com>
 <20230614164709.GT2244082@ls.amr.corp.intel.com>
 <20230620202841.7qizls3u3kcck45g@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620202841.7qizls3u3kcck45g@amd.com>

On Tue, Jun 20, 2023 at 03:28:41PM -0500,
Michael Roth <michael.roth@amd.com> wrote:

> On Wed, Jun 14, 2023 at 09:47:09AM -0700, Isaku Yamahata wrote:
> > On Sun, Jun 11, 2023 at 11:25:12PM -0500,
> > Michael Roth <michael.roth@amd.com> wrote:
> > 
> > > This will be used to determine whether or not an #NPF should be serviced
> > > using a normal page vs. a guarded/gmem one.
> > > 
> > > Signed-off-by: Michael Roth <michael.roth@amd.com>
> > > ---
> > >  arch/x86/include/asm/kvm_host.h |  7 +++++++
> > >  arch/x86/kvm/mmu/mmu_internal.h | 35 ++++++++++++++++++++++++++++++++-
> > >  2 files changed, 41 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > > index b3bd24f2a390..c26f76641121 100644
> > > --- a/arch/x86/include/asm/kvm_host.h
> > > +++ b/arch/x86/include/asm/kvm_host.h
> > > @@ -1445,6 +1445,13 @@ struct kvm_arch {
> > >  	 */
> > >  #define SPLIT_DESC_CACHE_MIN_NR_OBJECTS (SPTE_ENT_PER_PAGE + 1)
> > >  	struct kvm_mmu_memory_cache split_desc_cache;
> > > +
> > > +	/*
> > > +	 * When set, used to determine whether a fault should be treated as
> > > +	 * private in the context of protected VMs which use a separate gmem
> > > +	 * pool to back private guest pages.
> > > +	 */
> > > +	u64 mmu_private_fault_mask;
> > >  };
> > >  
> > >  struct kvm_vm_stat {
> > > diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> > > index 780b91e1da9f..9b9e75aa43f4 100644
> > > --- a/arch/x86/kvm/mmu/mmu_internal.h
> > > +++ b/arch/x86/kvm/mmu/mmu_internal.h
> > > @@ -252,6 +252,39 @@ struct kvm_page_fault {
> > >  
> > >  int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
> > >  
> > > +static bool kvm_mmu_fault_is_private(struct kvm *kvm, gpa_t gpa, u64 err)
> > > +{
> > > +	struct kvm_memory_slot *slot;
> > > +	bool private_fault = false;
> > > +	gfn_t gfn = gpa_to_gfn(gpa);
> > > +
> > > +	slot = gfn_to_memslot(kvm, gfn);
> > > +	if (!slot) {
> > > +		pr_debug("%s: no slot, GFN: 0x%llx\n", __func__, gfn);
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (!kvm_slot_can_be_private(slot)) {
> > > +		pr_debug("%s: slot is not private, GFN: 0x%llx\n", __func__, gfn);
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (kvm->arch.mmu_private_fault_mask) {
> > > +		private_fault = !!(err & kvm->arch.mmu_private_fault_mask);
> > > +		goto out;
> > > +	}
> > 
> > What's the convention of err? Can we abstract it by introducing a new bit
> > PFERR_PRIVATE_MASK? The caller sets it based on arch specific value.
> > the logic will be
> >         .is_private = err & PFERR_PRIVATE_MASK;
> 
> I'm not sure I understand the question. 'err' is just the page fault flags,
> and arch.mmu_private_fault_mask is something that can be set on a
> per-platform basis when running in a mode where shared/private access
> is recorded in the page fault flags during a #NPF.
> 
> I'm not sure how we'd keep the handling cross-platform by moving to a macro,
> since TDX uses a different bit, and we'd want to be able to build a
> SNP+TDX kernel that could run on either type of hardware.
> 
> Are you suggesting to reverse that and have err be set in a platform-specific
> way and then use a common PFERR_PRIVATE_MASK that's software-defined and
> consistent across platforms? That could work, but existing handling seems
> to use page fault flags as-is, keeping the hardware-set values, rather than
> modifying them to pass additional metadata, so it seems like it might
> make things more confusing to make an exception to that here. Or are
> there other cases where it's done that way?

I meant the latter, making PFERR_PRIVATE_MASK common software-defined.

I think the SVM fault handler can use hardware value directly by carefully
defining those PFERR values.

TDX doesn't have architectural bit in error code to indicate the private fault.
It's coded in faulted address as shared bit. GPA bit 51 or 47.
PFERR_{USER, WRITE, FETCH, PRESENT} are already software-defined value for VMX
(and TDX).  The fault handler for VMX, handle_ept_violation(), converts
encoding.  For TDX, PFERR_PRIVATE_MASK is just one more software defined bit.

I'm fine with either way, variable or macro. Which do you prefer?

- Define variable mmu_private_fault_mask (global or per struct kvm)
  The module initialization code, hardware_setup(), sets mmu_private_fault_mask.
- Define the software defined value, PFERR_PRIVATE_MASK.
  The caller of kvm_mmu_page_fault() parses the hardware value and construct
  software defined error_code.
- any other?
  

> > > +
> > > +	/*
> > > +	 * Handling below is for UPM self-tests and guests that treat userspace
> > > +	 * as the authority on whether a fault should be private or not.
> > > +	 */
> > > +	private_fault = kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT);
> > 
> > This code path is sad. One extra slot lookup and xarray look up.
> > Without mmu lock, the result can change by other vcpu.
> > Let's find a better way.
> 
> The intention was to rely on fault->mmu_seq to determine if a
> KVM_SET_MEMORY_ATTRIBUTES update came in after .private_fault was set so
> that fault handling could be retried, but that doesn't happen until
> kvm_faultin_pfn() which is *after* this is logged. So yes, I think there
> is a race here, and the approach you took in your Misc. series of
> keeping the kvm_mem_is_private() check inside kvm_faultin_pfn() is more
> efficient/correct.
> 
> If we can figure out a way to handle checking the fault flags in a way
> that works for both TDX/SNP (and KVM self-test use-case) we can
> consolidate around that.

I can think of the following ways. I think the second option is better because
we don't need exit bit for error code.

- Introduce software defined error code
- Add a flags to struct kvm_arch for self-test use-case VM_TYPE_PROTECTED_VM.
  Set it to true for VM_TYPE_PROTECTED_VM case.
- any other?

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
