Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9C238149
	for <linux-coco@lists.linux.dev>; Wed,  4 Jun 2025 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018530; cv=none; b=CGLiT+MAGJ7bMTd8yBTRNW1O/HxMK96sP/5Pfqywzf3zrpBzTnfYEzYP8+HWhNuJj3/fXYVIAYDSfsEBS62Uvqf75Hl1QMKCjhqw5xVKnZ80BLaGLEV8IXdASiiV7Gt84SfghB3HhaEGJSztCJYiYxFrY1/vL0OoNdY+ZXHDFjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018530; c=relaxed/simple;
	bh=81I27BGU8mhubZTMywMowsvZkPwGka40pBc2bYczHzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HffMHpH/eabVm8EfoDT5u6HfylUcGQ7F8eyku+Nq555pIvwOUi0+buE7d3yJVKovnVB4/oBaV4ILEohcWYuvd4OTEo3on1FJau3k6sdYStI2rI76vvHVdZzAzVH49gm/GCHfxaMREjHYoGzNrEtNbsL1S/pMm8Hy+Vcq1esZVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dDaNyKrV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dDaNyKrV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235ca5eba8cso141795ad.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Jun 2025 23:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749018528; x=1749623328; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR2Zn0MW6e4k4Z0HY1GhfsYb4tFjSsp0sytwXaGW+TI=;
        b=dDaNyKrVQEY2ITnmBV3kIyo/a893yWwUR0qXsRa1PL2Yq7gu+CYdt2RXVjmIRkQUCD
         KAF51fB2GvBE7yNALrOYv6wTyfMMvsN7umZ8EJvuiVcLLxrNbxZYH5mxFeoL86BJH1QB
         0XA6pQbkji15dcz0ysTgzBfCSnaeNIpGZekhQzGYSIRHDGpewJlnYfGtCJgWUrSLh730
         fr+7lrbzyH0gv+a1OwJ41dHtT1hwlsIn+hSmrCYER1ImCiWgMW7a6wBY3sZLZyNyUCGH
         5x7C5stJkRCT7H/MvzJvysTBVHHtvGyF6Zno/iSNnDYRvhoKm5pPcSGEVrrEnSIRvaQV
         5vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018528; x=1749623328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR2Zn0MW6e4k4Z0HY1GhfsYb4tFjSsp0sytwXaGW+TI=;
        b=foiWEineyiMZbYpibKnhsDfxVvaar7YjQBUA8Y/uxr97QNM0N0APmaSf+yFnZSqN91
         kUWSInrKcqrT6b5DmxzHcImz3QxUKcRuJGbD631i5OcI0fGG8aNPwfrofYyRm4zdAG90
         LLM1iaQ5b0AxLAsdlfy0HHtDIHvyw1yf0TSUpS0Vt2RIEOBUqi9zm1iI+LDkKqRUTVHG
         60lErM47ADledtID7yOm5uClvno05FHPAbX5337qyTakQza8Z+qZ7ZIHoCavC8tYBnrX
         2vB/XTCrgrqUIz6pdManWbSzXUa41tRiXUrFpYx8SMxBTaXqbvw95ksfQAIX52wv4mug
         h6lg==
X-Forwarded-Encrypted: i=1; AJvYcCWw/f6B0ASWo86BlgdTU5Y7u6H/uhWvtwi8ZjzZX7aU3JiNbE/oUgSEM0dZP6NxR44vGxQzrd7hFKkm@lists.linux.dev
X-Gm-Message-State: AOJu0YxulIWhaOFYi5lOCeKQYU509qVAEo/pk6gykZ9tPlWQPqlqaY+J
	jxewx4XEIlh8JojGXGyhMDLh5gvwYCCLyGym4LV0TqrpZMXHiq/B0USAdWuo4vVYX6OtPVsUNw1
	MgHAvpmXJGvyTfOKEy7IP/idMNPx/AdZ1j0l9Xk89
X-Gm-Gg: ASbGncvrxlETggPiycHd5pFRlBOaacsCy9rVuivII0gtasAFAEWmvDiVnhyHW7v2hXz
	GetCYofrTQwP92uFmF+ZOh+1YutAblYeNms6OCvIanmGicUdmEVnnRCnd/iiQ3zH4ugQj2K2JNy
	DZwF8eeEzD1e3ZhUeplXKqQ7rcfcHbVMDnrW5hqvc=
X-Google-Smtp-Source: AGHT+IF4xC9qzv5BpN6gxJKh5AXqy9touHIS+Fp9PpnqdXrV7B50j8vZ0rrHhe6vndq71OXKlvYGh3n31yPiGriIJPI=
X-Received: by 2002:a17:902:e5c7:b0:234:b441:4d4c with SMTP id
 d9443c01a7336-235e15dfc0emr1475605ad.5.1749018527397; Tue, 03 Jun 2025
 23:28:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <diqzjz7azkmf.fsf@ackerleytng-ctop.c.googlers.com>
 <diqz8qmsfs5u.fsf@ackerleytng-ctop.c.googlers.com> <aC1221wU6Mby3Lo3@yzhao56-desk.sh.intel.com>
 <CAGtprH_chB5_D3ba=yqgg-ZGGE2ONpoMdB=4_O4S6k7jXcoHHw@mail.gmail.com> <aD5QVdH0pJeAn3+r@yzhao56-desk.sh.intel.com>
In-Reply-To: <aD5QVdH0pJeAn3+r@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 3 Jun 2025 23:28:35 -0700
X-Gm-Features: AX0GCFuaJpGd_WyvZx6tH5AycHCVm09gZ2trd8iERU8A_mfPXViA5zVANtPv3SM
Message-ID: <CAGtprH_XFpnBf_ZtEAs2MiZNJYhs4i+kJpmAj0QRVhcqWBqDsQ@mail.gmail.com>
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

On Mon, Jun 2, 2025 at 6:34=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wrot=
e:
>
> On Mon, Jun 02, 2025 at 06:05:32PM -0700, Vishal Annapurve wrote:
> > On Tue, May 20, 2025 at 11:49=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com=
> wrote:
> > >
> > > On Mon, May 19, 2025 at 10:04:45AM -0700, Ackerley Tng wrote:
> > > > Ackerley Tng <ackerleytng@google.com> writes:
> > > >
> > > > > Yan Zhao <yan.y.zhao@intel.com> writes:
> > > > >
> > > > >> On Fri, Mar 14, 2025 at 05:20:21PM +0800, Yan Zhao wrote:
> > > > >>> This patch would cause host deadlock when booting up a TDX VM e=
ven if huge page
> > > > >>> is turned off. I currently reverted this patch. No further debu=
g yet.
> > > > >> This is because kvm_gmem_populate() takes filemap invalidation l=
ock, and for
> > > > >> TDX, kvm_gmem_populate() further invokes kvm_gmem_get_pfn(), cau=
sing deadlock.
> > > > >>
> > > > >> kvm_gmem_populate
> > > > >>   filemap_invalidate_lock
> > > > >>   post_populate
> > > > >>     tdx_gmem_post_populate
> > > > >>       kvm_tdp_map_page
> > > > >>        kvm_mmu_do_page_fault
> > > > >>          kvm_tdp_page_fault
> > > > >>       kvm_tdp_mmu_page_fault
> > > > >>         kvm_mmu_faultin_pfn
> > > > >>           __kvm_mmu_faultin_pfn
> > > > >>             kvm_mmu_faultin_pfn_private
> > > > >>               kvm_gmem_get_pfn
> > > > >>                 filemap_invalidate_lock_shared
> > > > >>
> > > > >> Though, kvm_gmem_populate() is able to take shared filemap inval=
idation lock,
> > > > >> (then no deadlock), lockdep would still warn "Possible unsafe lo=
cking scenario:
> > > > >> ...DEADLOCK" due to the recursive shared lock, since commit e918=
188611f0
> > > > >> ("locking: More accurate annotations for read_lock()").
> > > > >>
> > > > >
> > > > > Thank you for investigating. This should be fixed in the next rev=
ision.
> > > > >
> > > >
> > > > This was not fixed in v2 [1], I misunderstood this locking issue.
> > > >
> > > > IIUC kvm_gmem_populate() gets a pfn via __kvm_gmem_get_pfn(), then =
calls
> > > > part of the KVM fault handler to map the pfn into secure EPTs, then
> > > > calls the TDX module for the copy+encrypt.
> > > >
> > > > Regarding this lock, seems like KVM'S MMU lock is already held whil=
e TDX
> > > > does the copy+encrypt. Why must the filemap_invalidate_lock() also =
be
> > > > held throughout the process?
> > > If kvm_gmem_populate() does not hold filemap invalidate lock around a=
ll
> > > requested pages, what value should it return after kvm_gmem_punch_hol=
e() zaps a
> > > mapping it just successfully installed?
> > >
> > > TDX currently only holds the read kvm->mmu_lock in tdx_gmem_post_popu=
late() when
> > > CONFIG_KVM_PROVE_MMU is enabled, due to both slots_lock and the filem=
ap
> > > invalidate lock being taken in kvm_gmem_populate().
> >
> > Does TDX need kvm_gmem_populate path just to ensure SEPT ranges are
> > not zapped during tdh_mem_page_add and tdh_mr_extend operations? Would
> > holding KVM MMU read lock during these operations sufficient to avoid
> > having to do this back and forth between TDX and gmem layers?
> I think the problem here is because in kvm_gmem_populate(),
> "__kvm_gmem_get_pfn(), post_populate(), and kvm_gmem_mark_prepared()"
> must be wrapped in filemap invalidate lock (shared or exclusive), right?
>
> Then, in TDX's post_populate() callback, the filemap invalidate lock is h=
eld
> again by kvm_tdp_map_page() --> ... ->kvm_gmem_get_pfn().

I am contesting the need of kvm_gmem_populate path altogether for TDX.
Can you help me understand what problem does kvm_gmem_populate path
help with for TDX?
