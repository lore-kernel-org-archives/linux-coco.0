Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D4A944
	for <linux-coco@lists.linux.dev>; Tue,  3 Jun 2025 01:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748912749; cv=none; b=BlzS501Xm5yQ7jgQTXGvUk+x7KvFF6EyMK2hOjn480j9WB5tyLlg2YQ0mhN/rW8NpFNcLQh1cmx6P0c55s59M0ohCCY8a4g5EFprdHV/QNLOolE37KNnKOWUnsCEC3KgwSSDTVREo24NrI/bO9rUlbLS19fIwFnG64kEQRo+7EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748912749; c=relaxed/simple;
	bh=I8IwxSho+6YXNOBnfXRszVbVX0OXf2eoTv3BfCDsssc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkR8OBPMVUEGPbwVxR3gmdRNtbe5+TD2Yip6fIiZLNbF4o/kDejE0L4w5msfWq5AmKn/yI8oRTp06JLxPHTOLWPgzjRNJw6Mr/kYczvvnwV0fjloLFmoYRDhIqjFiizL3UP1Pbm2537m1C+QiNHNfNVUBtz4/ZpUAEntzvRwoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=INZhsq61; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="INZhsq61"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2348ac8e0b4so63635ad.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Jun 2025 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748912745; x=1749517545; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zA8i3SvMx3WliW0WUY0TLhornaCo9nNs4r4P4DLJp8=;
        b=INZhsq61Ajk5WUwvh48Hm5hs37fTC4o7hcbZO4oNWsIEwDAnanIWICFA0ljf/hlI6X
         EYVwqioVc0Xlb2N1F0QQW9d0VUjXL0SS3K0SCVINnCDvHjRmN+m9/w4HSOQbpm3YJHnJ
         VLdu9QWKGyfDO6RsSKbTsE71mz5YbMTk5tO9FjbZWZ4M4nn3kX/wwNhD3x5b/N6PuQSP
         SpMa8amI3YZV6meq08HXcws0+YWJQzOwanzP/0g34RBYrTWAxM4Iv7D9uMlPT2VTuUbr
         pDmdw3Fj6bMAgqbTZtufBkB/WenhMQ1wihzPuyx8DNAhqLG5/irVTYuesuBj269EoA31
         JAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748912745; x=1749517545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zA8i3SvMx3WliW0WUY0TLhornaCo9nNs4r4P4DLJp8=;
        b=TMjtrwz/LZL1kpYKVkn2MLxjPZv8RKePsSfGfzcfLCep+9yZcvnUuHNvf2VDCiKTah
         em0UUkXZMlGLgwquqQntJJzYmbTqdLPQv+8VySaJIQyCAEzHCs/Txg+xBs0lsi7/RMb5
         BQaZyGoHWy+COIRhCQKcFGx5PmJ9mJbnJ1OqUq4qNXssgcbY2dwj2IrVnVj0ZLTuTxYn
         l1Gr0FFnqkwtdjfqgbUORyvw9qX76/gtAyLuA3DphosdskmcyPOUkPouIqiiAeInjQ1B
         L3/TSDZzy079ebU23zKkh4ouOaf/E1Z3ZpU5gZSbwp+IaUH3Vl2b+U+op7FhF7uEnesV
         EupQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg98UCL2q52sACdOY3J36NTBiyFk+k0WhfXtaWEUft3us4uKrlnzEPugDJOMVx1/9AYvnfcHLIUH8R@lists.linux.dev
X-Gm-Message-State: AOJu0YyOVxTDgY63jJtniuFP8n1dr+BG8j6BsrsfJGxZB5eV8qnOA/3W
	9GyaGmq6SAk7K2DYg4UtP2O6NQz5r0HJBzK2GMIP65UNVj5IovIDw2KDlD9TKo+bdi4dSnhhplK
	5br1zHUNH/hvy+XJsG1Q3qbQSar8KR2wTBwG+47uj
X-Gm-Gg: ASbGncuLJLcDNq4ffkzGy5hjSDkDymWdfotD7tTbfV5CUk4955Ze3dJnTqRxB/CN866
	dKvh8RtjR5Yj840zI3vmQpS7rbocdeOUE2YcszXr0ELN4WyZ0oZaulG7OtI1LQlw7VjgEOB6tY0
	TKwm/+JxR3nBL5q2/sfn2EWrLpBkgJCSnJzdojLCrRmRssj0TAQYfAMaWDGSuPdJtbNK8ssL4u2
	w==
X-Google-Smtp-Source: AGHT+IF8Jp/U2+xc+07146dXlpTbASvoteEnNJEFuewV+ucbySXUxWAeNEdlDnnAVbVMzXVfjIYziZx78rbAmXvzJ98=
X-Received: by 2002:a17:902:ec90:b0:234:c2e7:a0e7 with SMTP id
 d9443c01a7336-235c83a1796mr1458355ad.4.1748912745102; Mon, 02 Jun 2025
 18:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <diqzjz7azkmf.fsf@ackerleytng-ctop.c.googlers.com>
 <diqz8qmsfs5u.fsf@ackerleytng-ctop.c.googlers.com> <aC1221wU6Mby3Lo3@yzhao56-desk.sh.intel.com>
In-Reply-To: <aC1221wU6Mby3Lo3@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 2 Jun 2025 18:05:32 -0700
X-Gm-Features: AX0GCFtnJZatjpGKUUpgyUTxkmXtEoTmNaLkinCtwBCaHY9YrfWtQsfvQRQkcEw
Message-ID: <CAGtprH_chB5_D3ba=yqgg-ZGGE2ONpoMdB=4_O4S6k7jXcoHHw@mail.gmail.com>
Subject: Re: [PATCH 3/5] KVM: gmem: Hold filemap invalidate lock while
 allocating/preparing folios
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, michael.roth@amd.com, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	jroedel@suse.de, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	seanjc@google.com, vbabka@suse.cz, amit.shah@amd.com, 
	pratikrajesh.sampat@amd.com, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	david@redhat.com, quic_eberman@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:49=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wr=
ote:
>
> On Mon, May 19, 2025 at 10:04:45AM -0700, Ackerley Tng wrote:
> > Ackerley Tng <ackerleytng@google.com> writes:
> >
> > > Yan Zhao <yan.y.zhao@intel.com> writes:
> > >
> > >> On Fri, Mar 14, 2025 at 05:20:21PM +0800, Yan Zhao wrote:
> > >>> This patch would cause host deadlock when booting up a TDX VM even =
if huge page
> > >>> is turned off. I currently reverted this patch. No further debug ye=
t.
> > >> This is because kvm_gmem_populate() takes filemap invalidation lock,=
 and for
> > >> TDX, kvm_gmem_populate() further invokes kvm_gmem_get_pfn(), causing=
 deadlock.
> > >>
> > >> kvm_gmem_populate
> > >>   filemap_invalidate_lock
> > >>   post_populate
> > >>     tdx_gmem_post_populate
> > >>       kvm_tdp_map_page
> > >>        kvm_mmu_do_page_fault
> > >>          kvm_tdp_page_fault
> > >>       kvm_tdp_mmu_page_fault
> > >>         kvm_mmu_faultin_pfn
> > >>           __kvm_mmu_faultin_pfn
> > >>             kvm_mmu_faultin_pfn_private
> > >>               kvm_gmem_get_pfn
> > >>                 filemap_invalidate_lock_shared
> > >>
> > >> Though, kvm_gmem_populate() is able to take shared filemap invalidat=
ion lock,
> > >> (then no deadlock), lockdep would still warn "Possible unsafe lockin=
g scenario:
> > >> ...DEADLOCK" due to the recursive shared lock, since commit e9181886=
11f0
> > >> ("locking: More accurate annotations for read_lock()").
> > >>
> > >
> > > Thank you for investigating. This should be fixed in the next revisio=
n.
> > >
> >
> > This was not fixed in v2 [1], I misunderstood this locking issue.
> >
> > IIUC kvm_gmem_populate() gets a pfn via __kvm_gmem_get_pfn(), then call=
s
> > part of the KVM fault handler to map the pfn into secure EPTs, then
> > calls the TDX module for the copy+encrypt.
> >
> > Regarding this lock, seems like KVM'S MMU lock is already held while TD=
X
> > does the copy+encrypt. Why must the filemap_invalidate_lock() also be
> > held throughout the process?
> If kvm_gmem_populate() does not hold filemap invalidate lock around all
> requested pages, what value should it return after kvm_gmem_punch_hole() =
zaps a
> mapping it just successfully installed?
>
> TDX currently only holds the read kvm->mmu_lock in tdx_gmem_post_populate=
() when
> CONFIG_KVM_PROVE_MMU is enabled, due to both slots_lock and the filemap
> invalidate lock being taken in kvm_gmem_populate().

Does TDX need kvm_gmem_populate path just to ensure SEPT ranges are
not zapped during tdh_mem_page_add and tdh_mr_extend operations? Would
holding KVM MMU read lock during these operations sufficient to avoid
having to do this back and forth between TDX and gmem layers?

>
> Looks sev_gmem_post_populate() does not take kvm->mmu_lock either.
>
> I think kvm_gmem_populate() needs to hold the filemap invalidate lock at =
least
> around each __kvm_gmem_get_pfn(), post_populate() and kvm_gmem_mark_prepa=
red().
>
> > If we don't have to hold the filemap_invalidate_lock() throughout,
> >
> > 1. Would it be possible to call kvm_gmem_get_pfn() to get the pfn
> >    instead of calling __kvm_gmem_get_pfn() and managing the lock in a
> >    loop?
> >
> > 2. Would it be possible to trigger the kvm fault path from
> >    kvm_gmem_populate() so that we don't rebuild the get_pfn+mapping
> >    logic and reuse the entire faulting code? That way the
> >    filemap_invalidate_lock() will only be held while getting a pfn.
> The kvm fault path is invoked in TDX's post_populate() callback.
> I don't find a good way to move it to kvm_gmem_populate().
>
> > [1] https://lore.kernel.org/all/cover.1747264138.git.ackerleytng@google=
.com/T/
> >
> > >>> > @@ -819,12 +827,16 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struc=
t kvm_memory_slot *slot,
> > >>> >         pgoff_t index =3D kvm_gmem_get_index(slot, gfn);
> > >>> >         struct file *file =3D kvm_gmem_get_file(slot);
> > >>> >         int max_order_local;
> > >>> > +       struct address_space *mapping;
> > >>> >         struct folio *folio;
> > >>> >         int r =3D 0;
> > >>> >
> > >>> >         if (!file)
> > >>> >                 return -EFAULT;
> > >>> >
> > >>> > +       mapping =3D file->f_inode->i_mapping;
> > >>> > +       filemap_invalidate_lock_shared(mapping);
> > >>> > +
> > >>> >         /*
> > >>> >          * The caller might pass a NULL 'max_order', but internal=
ly this
> > >>> >          * function needs to be aware of any order limitations se=
t by
> > >>> > @@ -838,6 +850,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct =
kvm_memory_slot *slot,
> > >>> >         folio =3D __kvm_gmem_get_pfn(file, slot, index, pfn, &max=
_order_local);
> > >>> >         if (IS_ERR(folio)) {
> > >>> >                 r =3D PTR_ERR(folio);
> > >>> > +               filemap_invalidate_unlock_shared(mapping);
> > >>> >                 goto out;
> > >>> >         }
> > >>> >
> > >>> > @@ -845,6 +858,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct =
kvm_memory_slot *slot,
> > >>> >                 r =3D kvm_gmem_prepare_folio(kvm, file, slot, gfn=
, folio, max_order_local);
> > >>> >
> > >>> >         folio_unlock(folio);
> > >>> > +       filemap_invalidate_unlock_shared(mapping);
> > >>> >
> > >>> >         if (!r)
> > >>> >                 *page =3D folio_file_page(folio, index);
> > >>> > --
> > >>> > 2.25.1
> > >>> >
> > >>> >
> >
