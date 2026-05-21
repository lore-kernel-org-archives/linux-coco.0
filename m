Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E7F3E2ABB
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371288; cv=pass; b=lw2/05FUWnY3wGFIdHwoJILPIMzaYRGYMtGuA5aG3KdJ6bz2OF3eKVCj9+SHS/Q8k+60mT7Sp3ydMaka/AxDoSRnc4du+SBSufYe5imI7OJ9RrMEb2FpK0XLBGQjfSeVFi2oKa2B5U1LDWl98IEIQpBCOC+lUATGluexzDRr3Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371288; c=relaxed/simple;
	bh=SchiGOmf2MVWPKiRNrNhUxoPmvVzWaDRWZ8BJ0appKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlLnI4dfF2FQQZKTA/sfP5A3INmmJz94PVP02aR/R+YbQDCNZ5Qv95sbjUznKxuLdIb5qmE0Mx+Sl/FH+ILATza9wb2CTyF5xAfSILBk98Kn7Bxsr8djA6xuc9ylLqTxWOWAT6OJYKberaEXF2tXfUjwBmEx0/KQwymDvVOKD5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vXO5IZkY; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vXO5IZkY"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d864c23bdso7201cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 06:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779371286; cv=none;
        d=google.com; s=arc-20240605;
        b=Mvg8MH4Xpt/wZBOrEli1OiNE0fg2KSZgqJ16mURqCc3KIZBomYmnasWKCug5jUqYr4
         ixxbNJPWJWC+ApmR3vnqprlcFulgJN0APMnsIIrGq1N8x0Gv29xnTroS7RiJP9Ty6WB0
         A5qVDAfdW1Esy3zBcPUPnymp7pf46D/hW7PFAhHo7ciKz6PMJWKpx4w451W08CAefNzX
         RIoJW5paYH2lSP09R1BbVDk2gyD0HTSLFVKx25cCat093ixr5kyt2I5utqYI5xlupqJq
         zj2oYRoJPX4bvGSUzGCSW8aKQjHpJ+Fp71+6oA5KiNCAMh1EsKHSp5970C+K97YV87g7
         SM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x8ZLZpFna8QE3sntZWYFYWQfy/d2E0NvjrGgGfpza44=;
        fh=yKgIQXG4F7tkv8N6PTTcY7HsvGyqtEYjkZgJE+Bml4A=;
        b=JDkly6r0RQEP4A0au/2725V8RGqEvE4CaIoYB31dUd3Mw5pHeBds78olQMtXUJP74J
         7GKPqMuL8NhE99fFBr7OgUfg++PBmH7v219viup69BMnUESXW4Ttj3bQZ5OasspAoWlk
         7dyETRydzb2EuRU0wQ3aErLF8+WbpEMbik1syKK1bDsU8ZhueFQLQFxCAgyJm7G9DS/X
         NB+fcB1YWh7QBi4SGvARJkGi+kQy/opsgdJDlcpz6I+U8jc1iapXyFajckG0uCTkEKC4
         Qcj48nO3aDHB9WLnwPBmjKBURKWFSe/F1kFAJs23YQT6ZBl85WxjIsDkqnAvJ2o4wTow
         13SQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779371286; x=1779976086; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x8ZLZpFna8QE3sntZWYFYWQfy/d2E0NvjrGgGfpza44=;
        b=vXO5IZkYpqu9z+uZHY1XHkFZJrhpIUBu0BNKKtPFdqX6qdjpNqfN5e0mzFIkra1KBQ
         ELOOwf2AZcUtuHooPwX5Ux9B6b9MT0+wRrrcZF2/KQUdzyMISpASsww3SvA/80f7Fl7u
         tEvVEi3KsZS+8pJ8l1O/+MVSCy9y7T7UuS5QqyOBwALK94h0Y25bOj9A7kDuTtKaVLZq
         xDcM7GcacuqufAD0jSXzFL+tfsH/QTIZMoIDh0lBTwkmHtcXSyS1DzULQOeaJvxNld9r
         +gKhiqwSZqerdCCVWDlOXH5Q8pdfIgKTAtAo6xI3bdwklHG5YBrZLIToUoC8zxlt9aY/
         v+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779371286; x=1779976086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8ZLZpFna8QE3sntZWYFYWQfy/d2E0NvjrGgGfpza44=;
        b=KqfYY1J353cVqRWH+ToGLJ5HH7vvnjbwQCCUKh52LknSg6yxu1OtIyMX5ceoL3Cfru
         6ew1sahCHKGFyDn+cXkvBSZIHEYTJ/jlSDwb3eNM9AtbfGJQ4E8NYb4lnTCwNZN1zDKX
         uXYlCSDRskydzG9LmuqxTEGFp+CkqDJyZ4W8rPaGKEC7N5VdgHmiRl9zQidJHfUM8tpL
         yRpq5IFGLm3RY9YQo94VCzla8VV3/ahFoAioJJFTh/QEP1spEmt0woCOImqfqVVJJJ0h
         C+SxD3l50IOM/S1RjCPlGwErkvlGuhfHxbZzoP0Mm//Q20ltlxxjs+nlUmKuoYJuTAtP
         LoIw==
X-Forwarded-Encrypted: i=1; AFNElJ9Nvzfuhn/3YtpIdvOOsZHiRR1huJ4Hqz1oiFLExUuh3Oz7zCC8GL9YnZZvo5cQtdp7WWXkL76MvJvx@lists.linux.dev
X-Gm-Message-State: AOJu0YyuphO+ogHfZD/g6/KXmkysxauNodmWYKRbhpdt5X/31RYgiaSB
	/L6VrF0bCFz8kGWYbHub0+xCl1u/jhRCt3XFJB0Q1KxVjOdXc4NGbS9PxYoQSsnfy8IkljCeD8k
	IMMCvekF2A48RvGI/JbnWEWBYFksDT055TUq9c+sa
X-Gm-Gg: Acq92OH79Mvf7luh6GwVurwHVRYQYGCHCFiq9am3e7RGdUDA9NyvYJLETR7qicrP3fn
	Gd9/fAfWPXAU3Cyf/Ku088eP/r2liEwVfqmUwSUODNB7fG8gPt1fYg52WP03Wb7gPLYrOkSMiNC
	jnfJac3hzRae+Z0qYerL1oiQ1Y4tPtpfWHK+QkLwH4uoYDx9DGR+nRyJ4MfIqdnpTYydF1XmC2Q
	IkzjD7vrpEC0HDEolFbIUjJ0pbqMSbpABhXiB6V2viiZFYjLAHPhmqqbNnF1JqwhGs8qYt5fPZZ
	aoKUNEt+zcubT7uYXiw=
X-Received: by 2002:a05:622a:9005:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-516c53118ecmr8206941cf.1.1779371285395; Thu, 21 May 2026
 06:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
 <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
 <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
 <CA+EHjTzLCD-dU-euZKgzwyEr2ecPqFDNutcaHm2fCDGA+MHVXA@mail.gmail.com> <ag8JIlHjohAOC3-g@google.com>
In-Reply-To: <ag8JIlHjohAOC3-g@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:48:00 +0100
X-Gm-Features: AVHnY4IjTx7kpi4F7EdVLun66lc7vUTNuuJ9Vgrkm1t1onCQ9N7OW44CxOISbbA
Message-ID: <CA+EHjTyF19FPod10EEm3pMaPvsAR6HUXOhtC83qSSqxQ2g1s2Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 14:31, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, May 21, 2026, Fuad Tabba wrote:
> > On Wed, 20 May 2026 at 22:44, Ackerley Tng <ackerleytng@google.com> wrote:
> > >
> > > Fuad Tabba <tabba@google.com> writes:
> > >
> > > >
> > > > [...snip...]
> > > >
> > > >> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> > > >> +{
> > > >> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> > > >> +       struct inode *inode;
> > > >> +
> > > >> +       /*
> > > >> +        * If this gfn has no associated memslot, there's no chance of the gfn
> > > >> +        * being backed by private memory, since guest_memfd must be used for
> > > >> +        * private memory, and guest_memfd must be associated with some memslot.
> > > >> +        */
> > > >> +       if (!slot)
> > > >> +               return 0;
> > > >> +
> > > >> +       CLASS(gmem_get_file, file)(slot);
> > > >> +       if (!file)
> > > >> +               return 0;
> > > >> +
> > > >> +       inode = file_inode(file);
> > > >> +
> > > >> +       /*
> > > >> +        * Rely on the maple tree's internal RCU lock to ensure a
> > > >> +        * stable result. This result can become stale as soon as the
> > > >> +        * lock is dropped, so the caller _must_ still protect
> > > >> +        * consumption of private vs. shared by checking
> > > >> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> > > >> +        * against ongoing attribute updates.
> > > >> +        */
> > > >> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
> > > >> +}
> > > >
> > > > Doesn't this imply that all consumers of kvm_mem_is_private() should
> > > > validate the result using mmu_lock and the invalidation sequence?
> > >
> > > Let me know how I can improve the comment.
> >
> > Given Sean's context, the comment is good I think. I would quibble
> > with the the "_must_ still protect" phrasing being a bit too strict.
> >
> > Maybe just soften it slightly to acknowledge the exception? Something like:
> >
> >   * lock is dropped, so callers that require a strict result _must_ protect
> >   * consumption of private vs. shared by checking mmu_invalidate_retry_gfn()
> >   * under mmu_lock to serialize against ongoing attribute updates. Callers
> >   * doing lockless reads must be able to tolerate a stale result.
> >
> > That aligns the comment with how KVM is actually using it today. That
> > said, this is nitpicking. Feel free to use or ignore.
>
> Hmm, I wonder if we can figure out a way to consolidate some documentation,
> because this is _exactly_ the same pattern that x86's host_pfn_mapping_level()
> deals with (see its big comment below).
>
> There's also the stale comment in kvm_invalidate_memslot(), which, stating the
> obvious, speaks to the memslot+SRCU side of things.
>
> Maybe it makes sense to to find a central location for one giant comment about
> how how MMU notifier events and memslot+SRCU protections work?  And then refer
> to that in paths where some asset needs to be tied into MMU notifiers and/or
> memslots+SRCU?
>
> [*] https://lore.kernel.org/all/agcbWe8s9lmPuJwG@google.com

This would fix a few related issues at once. sgtm
/fuad


/fuad

>
> /*
>  * Lookup the mapping level for @gfn in the current mm.
>  *
>  * WARNING!  Use of host_pfn_mapping_level() requires the caller and the end
>  * consumer to be tied into KVM's handlers for MMU notifier events!
>  *
>  * There are several ways to safely use this helper:
>  *
>  * - Check mmu_invalidate_retry_gfn() after grabbing the mapping level, before
>  *   consuming it.  In this case, mmu_lock doesn't need to be held during the
>  *   lookup, but it does need to be held while checking the MMU notifier.
>  *
>  * - Hold mmu_lock AND ensure there is no in-progress MMU notifier invalidation
>  *   event for the hva.  This can be done by explicit checking the MMU notifier
>  *   or by ensuring that KVM already has a valid mapping that covers the hva.
>  *
>  * - Do not use the result to install new mappings, e.g. use the host mapping
>  *   level only to decide whether or not to zap an entry.  In this case, it's
>  *   not required to hold mmu_lock (though it's highly likely the caller will
>  *   want to hold mmu_lock anyways, e.g. to modify SPTEs).
>  *
>  * Note!  The lookup can still race with modifications to host page tables, but
>  * the above "rules" ensure KVM will not _consume_ the result of the walk if a
>  * race with the primary MMU occurs.
>  */
