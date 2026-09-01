Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0C949EC4D
	for <linux-coco@lists.linux.dev>; Tue,  1 Sep 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288107; cv=none; b=UE/qP/LXkD2RmJdmJCqFzR1Ihc8SX3HCqyFVPZq1j8r9jj7o2r9StvGFTlNLRvLKKuPmU8HF2dHTBOGc/ubFkVsVELqaMo9IP/m2D/3wvjrLV5zrPPCzR+JusKySaM9mRU0TggjAI3BpzeUzNTceWlR5JWL8VOtXw2W377OyEl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288107; c=relaxed/simple;
	bh=uVDf/Azs+Y2fNINbjdp5g3ddn/BJ/MorxkRf22rpgFo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SYMRo0tx1w742NuhpVcTCTV1rq4P1cQZrjqD+BLHgfXJ3y03RpmCgCQ9qm46twvB8cWcKJaoEZ2iL6wxyk2PPMGaJz5qlbvHYe2I9WaP4LvoAncX+JKCddGwIHJPEuS9vGgmSIuOLsRy2PvUmL4b6v++ChTpab/ZCBaQRmB67/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=coDvzQS9; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="coDvzQS9"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so165162b3a.3
        for <linux-coco@lists.linux.dev>; Tue, 01 Sep 2026 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788288106; x=1788892906; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0nDJQnfFlnDLvDCZVuLzJX537jxkgQCnIHPdf7AiK4=;
        b=coDvzQS9QaQHCCgUA4JZiTzF5xyArKIOGcXwV2ylO4yIpSzVMEJSPVEys6BPRz1DqT
         UarBUzj0MDhbYrYNA6/MniJMvb4c6nGV19VaWrKZEIUR2U+FYpk/DlXYz7N3jRbW7cHq
         fBt+qZL0ZjQh84yJD7DynBrmjFM69ps4W+udqNCANELbUYaEn97LqQDO+OeVe0doJixx
         MJIVAO3hdPe7lsLMUEXf49dleo5if0XIfA8oduFLXMOb0fVxsmzzgmuxq7Xs8/Tjkjuw
         iMlU90KqG5bKwmcwCjfmoKJzV0pilHrCRiZFVcbSx/ONUFVEwwVPmKrjHIRjnAWyfMhB
         bdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288106; x=1788892906;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0nDJQnfFlnDLvDCZVuLzJX537jxkgQCnIHPdf7AiK4=;
        b=dSVn0zHaIingz3roux+ouSCfW0DjAt2/9rSpDhV8/EVbSXwco9TxYvnmSlTt/g4Lw2
         vzITXZimcsNBMngsYoSCz6b3QGh1P048jShqURW+iBQobwzrApP9XM4ZHeolO8idVjzZ
         JVYkDs0qc+81xVRykDxp9NobR1P0Bt4eVazS0hl59Ew1/f+pDbVJTvVvWmUtbELVFJ3k
         HR5zx8rl/BkUZ8DSjxjT3H3z+KTteam+ohTb+PRLGe0aobpbhP9w+RkA3IZg310v4vez
         7G6Z5UkgI/K9zA5svJk86gOZzNhsJT7ZeTXmx61JZI3zqqruWY48EvWpl2FN1dLskF5s
         1+LA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5br/QOvgxYIE1besXfWsoWqIXtMgjvEW85nM792sjz6yKnDleFYd/1ml2++RBpZtDE3N+fDGZvy63@lists.linux.dev
X-Gm-Message-State: AFuF++kMJM9s3nGALlidHD03YNoX3c/XmD+oo1vFr5klAXwDxWT+XAhb
	+vMAYiR0r9Jtd3XNmHOyv9zsnI+7GCx3/GmsC9oZVALHbPaj4YbqV8Z2qNbplZCraf9Y6AaQFxL
	9NBMfSA==
X-Received: from pfcy6.prod.google.com ([2002:a05:6a00:93c6:b0:848:49f6:6f5c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8016:b0:857:4dea:e20e
 with SMTP id d2e1a72fcca58-85b5693e833mr15207248b3a.0.1788288105188; Tue, 01
 Sep 2026 11:41:45 -0700 (PDT)
Date: Tue, 1 Sep 2026 11:41:44 -0700
In-Reply-To: <apca475JqemLUjlb@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-15-85e5fd25252a@google.com>
 <CA+EHjTzJbC=ZvB3Mopw-TLf=13-iqxGw5RfTp6Gt5S1hi8WRRA@mail.gmail.com> <apca475JqemLUjlb@google.com>
Message-ID: <apccaNCJ2lH5mbaY@google.com>
Subject: Re: [PATCH v12 15/45] KVM: guest_memfd: Ensure pages are not in use
 before conversion
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 01, 2026, Sean Christopherson wrote:
> On Tue, Sep 01, 2026, Fuad Tabba wrote:
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index 803c7cdbbe0f6..fe02c47c85fb5 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -538,8 +538,46 @@ static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
> > >         return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
> > >  }
> > >
> > > +static bool kvm_gmem_has_outstanding_references(struct inode *inode,
> > > +                                               pgoff_t start, size_t nr_pages,
> > > +                                               pgoff_t *err_index)
> > > +{
> > > +       struct address_space *mapping = inode->i_mapping;
> > > +       pgoff_t last = start + nr_pages - 1;
> > > +       bool has_outstanding = false;
> > > +       struct folio_batch fbatch;
> > > +       pgoff_t next;
> > > +       int i;
> > > +
> > > +       folio_batch_init(&fbatch);
> > > +
> > > +       next = start;
> > > +       while (has_outstanding && filemap_get_folios(mapping, &next, last, &fbatch)) {
> > 
> > has_outstanding starts as false, so the loop never runs and the function
> > always returns false. The outstanding-reference check is dead at this
> > patch, so a to-private conversion would not be rejected even when a page
> > still has an outstanding reference.
> > 
> > It's fixed later in "KVM: guest_memfd: Handle lru_add fbatch refcounts
> > during conversion safety check", which changes the condition to
> > !has_outstanding. I think that fix belongs in this patch, so the check
> > works when it is introduced and the series bisects cleanly.

Wait, why are there even separate patches for this?  For all intents and purposes,
"Ensure pages are not in use before conversion" introduces a bug and then the bug
is fixed by "Handle lru_add fbatch refcounts during conversion safety check".
Just don't introduce the bug.

I also recommend splitting the export of lru_cache_drain_for_folio() to its own
patch so that it can be more easily Acked by mm/ folks.  If we want to squash it
with the KVM change, then that's trivial to do when applying.

> Why even bother with has_outstanding?  Avoiding it requires copy+pasting
> folio_batch_release(), but it's less code and IMO the end result is a lot easier
> to follow:
> 
> 	struct address_space *mapping = inode->i_mapping;
> 	pgoff_t last = start + nr_pages - 1;
> 	struct folio_batch fbatch;
> 	pgoff_t next;
> 	int i;
> 
> 	folio_batch_init(&fbatch);
> 
> 	next = start;
> 	while (filemap_get_folios(mapping, &next, last, &fbatch)) {
> 		for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> 			struct folio *folio = fbatch.folios[i];
> 
> 			/*
> 			 * Outstanding references are anything other than those
> 			 * from the page cache, plus 1 temporary reference held
> 			 * by filemap_get_folios() in the folio batch.
> 			 */
> 			if (folio_ref_count(folio) != folio_nr_pages(folio) + 1) {
> 				*err_index = max(start, folio->index);
> 				folio_batch_release(&fbatch);
> 				return true;
> 			}
> 		}
> 
> 		folio_batch_release(&fbatch);
> 		cond_resched();
> 	}
> 
> 	return false;
> 
> and then we end up with:
> 
> 	enum lru_cache_drained drained = LRU_CACHE_NOT_DRAINED;
> 	struct address_space *mapping = inode->i_mapping;
> 	pgoff_t last = start + nr_pages - 1;
> 	struct folio_batch fbatch;
> 	pgoff_t next;
> 	int i;
> 
> 	folio_batch_init(&fbatch);
> 
> 	next = start;
> 	while (filemap_get_folios(mapping, &next, last, &fbatch)) {
> 		for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> 			struct folio *folio = fbatch.folios[i];
> 
> 			if (__folio_has_outstanding_references(folio, &drained)) {
> 				*err_index = max(start, folio->index);
> 				folio_batch_release(&fbatch);
> 				return true;
> 			}
> 		}
> 
> 		folio_batch_release(&fbatch);
> 		cond_resched();
> 	}
> 
> 	return false;
