Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D49741E57
	for <linux-coco@lists.linux.dev>; Thu,  5 Oct 2023 23:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nMY0XAkO"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f7d109926so22275457b3.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Oct 2023 16:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696549731; x=1697154531; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+lEPeKg/GP3Y80L6NB8ajXYC+n4V3di2jIUF82A5N1I=;
        b=nMY0XAkO1vrYBlz/3FakXY8TOf7Rt1Xnib12pzAnqHiVxMFmahsPxvCYn8GidYM/dR
         /pWVm08iFYYb1OSZsjfGm9qrXYTHeTV9TYP8T8jIc4wsnceInq46Cr96DnhPGeloxG5P
         7xZypaC43gGqenUrh7wrqIxOcP7G28Qd2ZeSD/bsd2qUOOWkoRrSsGQfG3K+0ms2kp/H
         YtGRPgRCo8MtN+92IL4weh2/+b4pz/QVcF2PN7VThyHhe7pZUyBfBw3dNrIStywpsMWB
         tfoLSBjkmk2yAWrKtNHfhS6Z8S+fUmH7/J7pLLlMhDbT1UG+bvt4UqEQY7+a0OIV9zSU
         2j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696549731; x=1697154531;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lEPeKg/GP3Y80L6NB8ajXYC+n4V3di2jIUF82A5N1I=;
        b=bKeaD/AjPpNYibDxJAnEq3BfPkwDQmI/P2P+JJQ9Uriq+zJ6RrQP+5kDv/qODgw7XS
         QGZmtx9g1NNX/WE9pnAL28KknbJjFSiyOG+AMjQQhmszVOsOvGL6UL2C5JhpcHZUpGhz
         GR/lhMVw41PifzhYwLZQAtQLdPXkVMQeK/dlBsbcUL6yXr/8Z7ZEOU8ddreImIGJo8jE
         ZY+EMuvYi9QwAXoEDtZLNX8lYy2SxO2J78D+sUmBSmgaZsd9bgeyxviOF8LEX2nLiHfu
         L+q53z0WvzhpKWRD83xHBVfDpAmdF67X/5/5sRHGASz8B07DwkPoRqubju7VlgOhFjxC
         V5Lw==
X-Gm-Message-State: AOJu0Yzcbs6RrndvDkZs1W/qXukmT/nZkSsb7XKoGA3k5w/ix3oYSqE5
	pIVEhjgViMuIAx8M931whXt2fqtFr1k=
X-Google-Smtp-Source: AGHT+IHRi3WHSS0eRi4G7jOWTC1zbVq5PcSR3DpHe2Rifw8FnLaa5w+GwmW/eLasxxswlFxA+y9CeGzvWuY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:1f56:0:b0:d7e:7a8a:2159 with SMTP id
 f83-20020a251f56000000b00d7e7a8a2159mr100071ybf.5.1696549731485; Thu, 05 Oct
 2023 16:48:51 -0700 (PDT)
Date: Thu, 5 Oct 2023 16:48:50 -0700
In-Reply-To: <20231005175238.7bb2zut4fb7ebdqc@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com>
 <f987dcde3b051371b496847282022c679e9402e4.1695327124.git.isaku.yamahata@intel.com>
 <ZQypbSuMrbJpJBER@google.com> <ZQy29msIoAGQUGR2@google.com> <20231005175238.7bb2zut4fb7ebdqc@amd.com>
Message-ID: <ZR9LYhpxTaTk6PJX@google.com>
Subject: Re: [RFC PATCH v2 1/6] KVM: gmem: Truncate pages on punch hole
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 05, 2023, Michael Roth wrote:
> On Thu, Sep 21, 2023 at 02:34:46PM -0700, Sean Christopherson wrote:
> > On Thu, Sep 21, 2023, Sean Christopherson wrote:
> > > > diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
> > > > index a819367434e9..01fb4ca861d0 100644
> > > > --- a/virt/kvm/guest_mem.c
> > > > +++ b/virt/kvm/guest_mem.c
> > > > @@ -130,22 +130,32 @@ static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
> > > >  static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
> > > >  {
> > > >  	struct list_head *gmem_list = &inode->i_mapping->private_list;
> > > > +	struct address_space *mapping  = inode->i_mapping;
> > > >  	pgoff_t start = offset >> PAGE_SHIFT;
> > > >  	pgoff_t end = (offset + len) >> PAGE_SHIFT;
> > > >  	struct kvm_gmem *gmem;
> > > >  
> > > > +	/*
> > > > +	 * punch hole may result in zeroing partial area.  As pages can be
> > > > +	 * encrypted, prohibit zeroing partial area.
> > > > +	 */
> > > > +	if (offset & ~PAGE_MASK || len & ~PAGE_MASK)
> > > > +		return -EINVAL;
> > > 
> > > This should be unnecessary, kvm_gmem_fallocate() does
> > > 
> > > 	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> > > 		return -EINVAL;
> > > 
> > > before invoking kvm_gmem_punch_hole().  If that's not working, i.e. your test
> > > fails, then that code needs to be fixed.  I'll run your test to double-check,
> > > but AFAICT this is unnecesary.
> > 
> > I confirmed that the testcase passes without the extra checks.  Just to close the
> > loop, what prompted adding more checks to kvm_gmem_punch_hole()?
> 
> I don't know if it's the same issue that Isaku ran into, but for SNP we
> hit a similar issue with the truncate_inode_pages_range(lstart, lend) call.
> 
> The issue in that case was a bit more subtle:
> 
>   - userspace does a hole-punch on a 4K range of its gmem FD, which happens
>     to be backed by a 2MB folio.
>   - truncate_inode_pages_range() gets called for that 4K range
>   - truncate_inode_pages_range() does special handling on the folios at the
>     start/end of the range in case they are partial and passes these to
>     truncate_inode_partial_folio(folio, lstart, lend). In this case, there's
>     just the 1 backing folio. But it *still* gets the special treatment, and
>     so gets passed to truncate_inode_partial_folio().
>   - truncate_inode_partial_folio() will then zero that 4K range, even though
>     it is page-aligned, based on the following rationale in the comments:
> 
>         /*
>          * We may be zeroing pages we're about to discard, but it avoids
>          * doing a complex calculation here, and then doing the zeroing
>          * anyway if the page split fails.
>          */
>         folio_zero_range(folio, offset, length);
> 
>   - after that, .invalidate_folio callback is issued, then the folio is split,
>     and the caller (truncate_inode_pages_range()) does another pass through
> 	the whole range and can free the now-split folio then .free_folio callbacks
>     are issued.
> 
> Because of that, we can't rely on .invalidate_folio/.free_folio to handle
> putting the page back into a normal host-accessible state, because the
> zero'ing will happen beforehand.

Argh, and that causes an RMP violation #PF.

FWIW, I don't *think* zeroing would be problematic for TDX.  The page would get
poisoned, but KVM would re-zero the memory with MOVDIR64B and flush the cache.

> That's why we ended up needing to do this for SNP patches to make sure
> arch-specific invalidation callbacks are issued before the truncation occurs:
> 
>   https://github.com/mdroth/linux/commit/4ebcc04b84dd691fc6daccb9b7438402520b0704#diff-77306411fdaeb7f322a1ca756dead9feb75363aa6117b703ac118576153ddb37R233
> 
> I'd planned to post those as a separate RFC to discuss, but when I came across
> this it seemed like it might be relevant to what the TDX folks might ran into
> here.
> 
> If not for the zero'ing logic mentioned above, for SNP at least, the
> .free_folio() ends up working pretty nicely for both truncation and fput(),
> and even plays nicely with live update use-case where the destination gmem
> instance shares the inode->i_mapping, since iput() won't trigger the
> truncate_inode_pages_final() until the last reference goes away so we don't
> have to do anything special in kvm_gmem_release() to determine when we
> should/shouldn't issue the arch-invalidations to clean up things like the
> RMP table.
> 
> It seems like the above zero'ing logic could be reworked to only zero non-page
> aligned ranges (as the comments above truncate_inode_pages_range() claim
> should be the case), which would avoid the issue for the gmem use-case. But I
> wonder if some explicit "dont-zero-these-pages" flag might be more robust.
> 
> Or maybe there's some other way we should be going about this?

Skipping the write seems like the obvious solution.  An address_space flag,
e.g. AS_INACCESSIBLE, would be the easiest thing to implement.  Or maybe even
make it AS_DONT_ZERO_ON_TRUNCATE_DAMMIT (mostly joking).

Or a hook in address_space_operations to zero the folio, which conceptually is
better in many ways, but feels like overkill.
