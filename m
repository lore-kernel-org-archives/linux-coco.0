Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EEF171AA
	for <linux-coco@lists.linux.dev>; Tue, 20 Jun 2023 19:04:46 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666e6541c98so4185178b3a.2
        for <linux-coco@lists.linux.dev>; Tue, 20 Jun 2023 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687287886; x=1689879886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqnI0X/tUa5p41Kr9KTCugnCscPF7VztDuhJ1HA5TFk=;
        b=HAVRWq/AEdxndIvP0eGk9OhiyDlhg8jpf+xW1/xEzbYtnFCDSGpYxHR9Sopc2julZ0
         UwJs946+SPR9wxAOk5qMblB99kpDj8tmrAdhxx4SF3XC4N09WI5NMyK63kJZHltMz8d3
         xFaQJIR+g2LJ3AExorOLtFt9qUkv4ayYa8Gzue76bmEh3Y2yLMddqyJHsB+AnfUm0t+y
         v4BHDF2W2H6grmQHAyvuMh3Poya8PTXLXeNUY3Kc6De8hG2qZW2WtFKa3RNoB9iuFD7x
         GcGdfEJRSQYYwzTyi1TmmAr8CETJaiseO4oG/SEyHTFEzpCT/PIjjqyf+1GHG2zussyE
         KmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687287886; x=1689879886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqnI0X/tUa5p41Kr9KTCugnCscPF7VztDuhJ1HA5TFk=;
        b=eixBmARamEB2o1NUdGbU4PZXXxqJyTwStwnOA/AXa6xhW9toALbM2N04Kt+xDZuYMf
         Sa6IbODXHuMFAw6FdoUogo3TU3B2pCIB4sIu43EeCkKGMKT5ty+pmT5ctH1dhycwoMj5
         SMMbMCRiZl3BLNF9F40Ef5yR2JKhuax2oHu+Cejqv6irMbgDElanUFzKw3pNC/WbUvpo
         y6OUtmvgOqtAIW5WaKWaH6Oo83bR+uTnwNU0uPh3si2n5JTO01KWTOZp6BAB1tOT+1gG
         VuGTb1U0NuYVXGqggPQTcelpcfbm1WZ8+zQlD01RzFoQOQ2B/LF9lsCKKGZ74uYt2IJL
         uUIg==
X-Gm-Message-State: AC+VfDyzaHVNFuDEwI6JOlvHkQctOtfPVCrYKYF6yGcRx3mtebpd2TfG
	4QUnePVq1m9b9Yl96MKoAHk=
X-Google-Smtp-Source: ACHHUZ4U5bbrr7AZ6aHXhG+XnUrHjA/90TVgNdRICstsIkvsIFiSbYsimbwtHMRVRypuYYfB8QdQHw==
X-Received: by 2002:a05:6a20:12d3:b0:122:7e90:61c2 with SMTP id v19-20020a056a2012d300b001227e9061c2mr3610606pzg.9.1687287886110;
        Tue, 20 Jun 2023 12:04:46 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id d19-20020aa78693000000b0066883d75932sm1603783pfo.204.2023.06.20.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:04:45 -0700 (PDT)
Date: Tue, 20 Jun 2023 12:04:43 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Michael Roth <michael.roth@amd.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com,
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com,
	Sean Christopherson <seanjc@google.com>,
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com,
	linux-coco@lists.linux.dev, Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [RFC PATCH 5/6] KVM: Add flags to struct kvm_gfn_range
Message-ID: <20230620190443.GU2244082@ls.amr.corp.intel.com>
References: <cover.1686858861.git.isaku.yamahata@intel.com>
 <e8d3ab4a56d69a09ba74ff1c439f904075d38c16.1686858861.git.isaku.yamahata@intel.com>
 <20230620162835.xsmaao63brira7as@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620162835.xsmaao63brira7as@amd.com>

On Tue, Jun 20, 2023 at 11:28:35AM -0500,
Michael Roth <michael.roth@amd.com> wrote:

> On Thu, Jun 15, 2023 at 01:12:18PM -0700, isaku.yamahata@intel.com wrote:
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > 
> > TDX and SEV-SNP need to know the reason for a callback by
> > kvm_unmap_gfn_range().  mmu notifier, set memory attributes ioctl or KVM
> > gmem callback.  The callback handler changes the behavior or does the
> > additional housekeeping operation.  For mmu notifier, it's zapping shared
> > PTE.  For set memory attributes, it's the conversion of memory attributes
> > (private <=> shared).  For KVM gmem, it's punching a hole in the range, and
> > releasing the file.
> 
> I think it's still an open topic that we need to hear more from Sean about:
> 
>   https://lore.kernel.org/lkml/20230522235838.ov3722lcusotzlvo@amd.com/
> 
> but I *think* we were leaning toward decoupling the act of invalidating
> GFNs, vs. the act of invalidating/free'ing gmem pages.
> 
> One concrete example of where this seperation makes sense if with
> hole-punching. SNP has unique platform-specific stuff it has to do before
> free'ing that gmem page back to the host. If we try to plumb this through
> kvm_unmap_gfn_range() via a special flag then it's a little awkward
> because:
> 
> a) Presumably that hole-punch would have occurred after a preceeding
>    KVM_SET_MEMORY_ATTRIBUTES was issued to switch the page to shared
>    state in the xarray. So all it should really need to do is handle
>    that platform-specific behavior, like updating RMP table in case of
>    SNP. But none of the other details like GFN ranges are relevant in
>    that case, RMP updates here only need the PFN, so we end up walking
>    memslots to do GFN->PFN translations, when it would actually be much
>    more efficient to do these translations by translating the
>    hole-punched FD offset range to the corresponding folio()'s backing
>    those ranges
> 
> b) It places an unecessary dependency on having an active memslot to do
>    those translations. This ends up not being an issue with current
>    version of gmem patchset because the release() happens *before*
>    gmem_unbind(), so there is a memslot associated with the ranges at
>    gmem_release() time, but in the initial version of gmem it was the
>    reverse, so if things ever changed again in this regard we'd once
>    again have to completely rework how to issue these platform-specific
>    invalidation callbacks.
> 
> I really *really* like having a separate, simple invalidation mechanism
> in place that just converts FD offsets to PFNs and then passes those on
> to platform-defined handlers to clean up pages before free'ing them back
> to the system. It's versatile in that it can be called pretty much
> anywhere regardless of where we are in KVM lifecycle, it's robust in
> that it doesn't rely on unecessary outside dependencies, and it avoids
> added uneeded complexity to paths like kvm_unmap_gfn_range().
> 
> That's the approach taken with SNP hypervisor v9 series, with the
> gmem hook being introduced here:
> 
>   https://lore.kernel.org/kvm/20230612042559.375660-1-michael.roth@amd.com/T/#m3ad8245235a27ed0f41c359c191dcda6c77af043
> 
> and the SEV-SNP implementation of that hook being here:
> 
>   https://lore.kernel.org/kvm/20230612042559.375660-1-michael.roth@amd.com/T/#m6ac04b44722dbc07839011816e94fadf5ad6794e
> 
> Would a similar approach work for TDX? At least WRT cleaning up pages
> before returning them back to the host? If we could isolate that
> requirement/handling from all the other aspects of invalidations it
> really seems like it would cause us less headaches down the road.

In short, TDX KVM doesn't need an extra callback for invalidating/freeing gmem
pages. kvm_unmap_gfn_range() callback works.  Instead TDX needs attributes
(private-or-shared) for it.

The reason is, TDX uses encrypted page table for guest (We call it Secure-EPT),
and decicated operation on it.  The TDX KVM mmu hooks TDP MMU operations.
In in the case of invalidating/releasing page, it eventually hooks
handle_removed_pt() for additional operation.

Because TDX simply won't use gmem_invalidate callback, I'm fine with it.


> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > ---
> >  include/linux/kvm_host.h | 11 ++++++++++-
> >  virt/kvm/guest_mem.c     | 10 +++++++---
> >  virt/kvm/kvm_main.c      |  4 +++-
> >  3 files changed, 20 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 1a47cedae8a1..c049c0aa44d6 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -256,12 +256,21 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
> >  #endif
> >  
> >  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
> > +
> > +#define KVM_GFN_RANGE_FLAGS_SET_MEM_ATTR		BIT(0)
> 
> Can you go into more detail on why special handling is needed for
> SET_MEM_ATTR?

When in TDX, the VMM zaps a private page from the encrypted page table and the
VMM adds the page back to the same GPA, it results in zeroing page and guest
needs to accept the page again.  When converting a page from shared to private,
KVM needs to zap only shared pages.  So the callback needs to know this zap
is for converting shared-to-private or private-to-shared.


> > +#define KVM_GFN_RANGE_FLAGS_GMEM_PUNCH_HOLE		BIT(1)
> > +#define KVM_GFN_RANGE_FLAGS_GMEM_RELEASE		BIT(2)
> 
> Would the need to distinguish between PUNCH_HOLE/RELEASE go away in the
> TDX case if you take the above approach? For SNP, the answer is yes. If
> that's also the case for TDX I think that would be another argument in
> favor of decoupling these from existing KVM MMU invalidation path.

TDX doesn't need gmem_invalidate callback.  TDx doesn't need the difference
betwee punch hole and release. So in short TDX needs
KVM_GFN_RANGE_FLAGS_SET_MEM_ATTR and KVM_GFN_RANGE_FLAGS_GMEM.

With KVM_GFN_RANGE_FLAGS_GMEM, the callback can know that invalidating private
pages. Maybe by (ab)using KVM_GFN_RANGE_FLAGS_SET_MEM_ATTR(attr=shared),
KVM_GFN_RANGE_FLAGS_GMEM can be dropped.  

Thanks,
Isaku Yamahata
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
