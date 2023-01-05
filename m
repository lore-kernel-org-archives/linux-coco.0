Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3AD7C
	for <linux-coco@lists.linux.dev>; Thu,  5 Jan 2023 03:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672889955; x=1704425955;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=7+whF6O83FkAi7trCF9TEjov28V0K0S8cRinP/bHSI4=;
  b=N0hJcsEHCmjlMUQ6320YKrhrV1AHfbLKpnAiCjgi8RG1HsFsFyV+US4s
   uHokjyloRUbtHLZZ46Gmni+UdadTvMJoezr8IG1OqdF0l899+8yoOfK5U
   ds7rdDJePsjFrMC9YyJS306fkwy9yX5tdevw5WV2DM6mHns4kH6ccQuzG
   qLFcW3DVi0P7KEGTgl4PX5844aB63j9f87p5ZB0sXQ8ttlVZxXh43VY8Q
   FCHLkZQ2hlr6ReS2ynmvsmb1jf3lW+pI07x3ywr0mDT/xRkUOp5KQ7pZc
   5KxXwLVxKtmiFXC44aP+66hi+OZKcTNpDXyeGGPb+tuUVkt+3FpJobG4p
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="349328877"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; 
   d="scan'208";a="349328877"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 19:39:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829394357"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; 
   d="scan'208";a="829394357"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
  by orsmga005.jf.intel.com with ESMTP; 04 Jan 2023 19:39:04 -0800
Date: Thu, 5 Jan 2023 11:34:51 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com,
	pgonda@google.com, peterz@infradead.org,
	srinivas.pandruvada@linux.intel.com, rientjes@google.com,
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alpergun@google.com, dgilbert@redhat.com, ashish.kalra@amd.com,
	harald@profian.com, Nikunj A Dadhania <nikunj@amd.com>
Subject: Re: [PATCH RFC v7 01/64] KVM: Fix memslot boundary condition for
 large page
Message-ID: <20230105033451.GA2251521@chaop.bj.intel.com>
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-2-michael.roth@amd.com>
 <Y7VqgbTE34/Sxupw@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7VqgbTE34/Sxupw@kernel.org>

On Wed, Jan 04, 2023 at 12:01:05PM +0000, Jarkko Sakkinen wrote:
> On Wed, Dec 14, 2022 at 01:39:53PM -0600, Michael Roth wrote:
> > From: Nikunj A Dadhania <nikunj@amd.com>
> > 
> > Aligned end boundary causes a kvm crash, handle the case.
> > 
> 
> Link: https://lore.kernel.org/kvm/20221202061347.1070246-8-chao.p.peng@linux.intel.com/
> 
> Chao, are you aware of this issue already?

Thanks Jarkko adding me. I'm not aware of there is a fix.

> 
> > Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
> > Signed-off-by: Michael Roth <michael.roth@amd.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index b1953ebc012e..b3ffc61c668c 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -7159,6 +7159,9 @@ static void kvm_update_lpage_private_shared_mixed(struct kvm *kvm,
> >  		for (gfn = first + pages; gfn < last; gfn += pages)
> >  			linfo_set_mixed(gfn, slot, level, false);
> >  
> > +		if (gfn == last)
> > +			goto out;
> > +

Nikunj or Michael, could you help me understand in which case it causes
a KVM crash? To me, even the end is aligned to huge page boundary, but:
    last = (end - 1) & mask;
so 'last' is the base address for the last effective huage page. Even
when gfn == last, it should still a valid page and needs to be updated
for mem_attrs, correct?

Thanks,
Chao
> >  		gfn = last;
> >  		gfn_end = min(last + pages, slot->base_gfn + slot->npages);
> >  		mixed = mem_attrs_mixed(kvm, slot, level, attrs, gfn, gfn_end);
> > -- 
> > 2.25.1
> > 
> 
> 
> BR, Jarkko
