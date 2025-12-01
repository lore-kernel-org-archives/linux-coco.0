Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0854423ABAA
	for <linux-coco@lists.linux.dev>; Mon,  1 Dec 2025 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764617615; cv=none; b=b3h2uQnzvEdsJjddHujjsxUFd303LuAlTUrun24fwQTA1Qi5Ilf4T52NMEoQks7Zo9UspirUrmMacnRtTr8vZv2wuZpnRJh+rPaemoNpB6C/T5tRnlylwLUDyhPZ3EKGDtvFmwMyydyPcJbPNU1KqIetDfiCeEixywmt3fVe14M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764617615; c=relaxed/simple;
	bh=bBclXWBTEbUxD+U/Fbj1zSTWpgB2yfzFcZ8O+PL09sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIwYYUH905G/pyzcdppmYzg+UGgwEaLkreufPLa1SsYNqNE7ZLrXuJy2G+nc+k/2peLPVF8X3NpNxb2rE/0Lc2ayLxWz/M3Fn+wYHbWGotduXXM/UkPZqBuz8fACD7eQ6hWnHhlua4k5QCXR0lZnCN/JPojsfPf7/kYWQfitJpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N88Ram5k; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N88Ram5k"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297e13bf404so813645ad.0
        for <linux-coco@lists.linux.dev>; Mon, 01 Dec 2025 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764617611; x=1765222411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF10akh46ESQJ+c7BaT1JvkVAunKKRxi6jS26KvxL2o=;
        b=N88Ram5kYx0V9Z6bWDWnSqRB8KtvBKLfD3R7fTLf/beFZKCj6yV9tE8tEhj+8b+fwX
         Xxr8wAlmL6b5OI//R9LYJ2pM8WDEOU6MIGEAQyxLzjOuLGgzSF0/tT+dIiG7Kj+88URo
         DnRxQ+BZz2kiwoPTa/4DCl97Y9tM6yPdW1MkZ9XLPqgOKN9hTA+9/JhMHr4kMGU9Ci0x
         jZAFeMqaZFxmdYA+HUTMDyd8t34wk7VlPX063bCnOdAhnKrpu2l7rF3QFF4fw/cJ7LTf
         vnzjt7OLlmPkLnq2ccZIgmqt5im8abNATe3taBAU7+QkwPLY3Pt0TVwkhBydFVjg1qnl
         XMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764617611; x=1765222411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aF10akh46ESQJ+c7BaT1JvkVAunKKRxi6jS26KvxL2o=;
        b=A1NAYp6NTDbgEUvsGvDOIVrR5uij8xjKQtR2nTufITQQuqcJvtiBcOW21YrOnQ18v9
         CZ7owIctRVfNAaWzTekVcMVk4IlR0r7ItRdAh5+RF0kl7O+wnIVcF5x9TeVzCri8n1nj
         +1FDL4vXGOjZmEoc9oNASWkxMc0mcpjH98z+GwGzUoNGk4MAWF5t1Jy2J1KjcX5VgTKP
         FQTso3E+whgTcOg+0j9mlwPJMIWFcQ2Z/g2HQn8PMTYZDe8ck1KDxFG2cuyfYA0+q3fG
         1sQcCkgwUauqUg4YXswyKyR7JV0WIMzc/W4a9WW5vdYPdzlaroWhrYHC9FhaieoW/wtt
         Gw0g==
X-Forwarded-Encrypted: i=1; AJvYcCVy5J1i0FrrDpkDhNkxO9nXfI7Wure814kOw9rsXe4E4kgTjH0nWGgXqCqofhdMweVwB29vGzOmknKs@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu6RFH5zFBoQDHoRT+7y48EOXIJ0/YUOWyNf8zDzDZJnC6/RBQ
	N93P1Gtf3mB2jKhTSQH6Tk5INT7rxYvYP6M+FRi7KXjni28ZdUtNJFzobnajkVpDV9oaDHoUfXP
	WX/dc1Wg8hJFqQum0tyc6PDBXOn6IbeUMWz0BbHi3
X-Gm-Gg: ASbGncse75lxkzHcqwyXdOfHX2FufQgh/73G8mjtKN43IyGjB3KlStSZWTCsgid1u0y
	p+jC8WkE0mI+fcwReE7EwJLSbMlz0WAL/buGottm7BrA5W8jcnQY9Zp0m4rW3J62wq8YJEReaoR
	iljPHlQuAuDC7exsVPgY1Iky2acCY6ECZYM0iBsdCrFQUR6KHba0Sf9SLkt3OsWLpPOV7LLi7Fy
	T5yWip+nnw8/Acw79S6My13DtZYSpBrqtHxApaOtVs8XQ8yxqKRKI30jYZfJTM9DVM4yuDyNZhc
	6ZV44m4R10ikSHjhDlTQl9owvQ==
X-Google-Smtp-Source: AGHT+IFP/zhwci3vTqB9EDyMd0PIB3pGB3CtyKHh0svTCtOgB/uKqoCrsL9Qur1sceYt3JqL6MrYHvIDY5EEWYqMNpM=
X-Received: by 2002:a05:7022:f902:10b0:119:e55a:808c with SMTP id
 a92af1059eb24-11dc9c5d1f3mr327753c88.9.1764617610739; Mon, 01 Dec 2025
 11:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251113230759.1562024-1-michael.roth@amd.com>
 <20251113230759.1562024-2-michael.roth@amd.com> <aR7blxIx6tKD2xiQ@yzhao56-desk.sh.intel.com>
 <20251121124314.36zlpzhwm5zglih2@amd.com> <aSUe1UfD3hXg2iMZ@yzhao56-desk.sh.intel.com>
 <CAGtprH-ZhHO4C5gTqWgMNpf5MKvL0yz6QG2h01sz=0o=ZwOF0g@mail.gmail.com> <aS0ClozgeICZN/XX@yzhao56-desk.sh.intel.com>
In-Reply-To: <aS0ClozgeICZN/XX@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 1 Dec 2025 11:33:18 -0800
X-Gm-Features: AWmQ_bmRwRx__VVgKyn6dcD5fugj47Z9H8pbE9hwrVIaEriDYO1NkTox6hQ0kSQ
Message-ID: <CAGtprH8kVtyMiZeF+40hSpkY=O_HD0K+1Gy10rPdi8-mNLr8Yg@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: guest_memfd: Remove preparation tracking
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, david@redhat.com, ackerleytng@google.com, 
	aik@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 6:53=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wro=
te:
>
> On Sun, Nov 30, 2025 at 05:35:41PM -0800, Vishal Annapurve wrote:
> > On Mon, Nov 24, 2025 at 7:15=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com>=
 wrote:
> > > > > > @@ -889,7 +872,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn=
_t start_gfn, void __user *src, long
> > > > > >           p =3D src ? src + i * PAGE_SIZE : NULL;
> > > > > >           ret =3D post_populate(kvm, gfn, pfn, p, max_order, op=
aque);
> > > > > >           if (!ret)
> > > > > > -                 kvm_gmem_mark_prepared(folio);
> > > > > > +                 folio_mark_uptodate(folio);
> > > > > As also asked in [1], why is the entire folio marked as uptodate =
here? Why does
> > > > > kvm_gmem_get_pfn() clear all pages of a huge folio when the folio=
 isn't marked
> > > > > uptodate?
> > > >
> > > > Quoting your example from[1] for more context:
> > > >
> > > > > I also have a question about this patch:
> > > > >
> > > > > Suppose there's a 2MB huge folio A, where
> > > > > A1 and A2 are 4KB pages belonging to folio A.
> > > > >
> > > > > (1) kvm_gmem_populate() invokes __kvm_gmem_get_pfn() and gets fol=
io A.
> > > > >     It adds page A1 and invokes folio_mark_uptodate() on folio A.
> > > >
> > > > In SNP hugepage patchset you responded to, it would only mark A1 as
> > > You mean code in
> > > https://github.com/amdese/linux/commits/snp-inplace-conversion-rfc1 ?
> > >
> > > > prepared/cleared. There was 4K-granularity tracking added to handle=
 this.
> > > I don't find the code that marks only A1 as "prepared/cleared".
> > > Instead, I just found folio_mark_uptodate() is invoked by kvm_gmem_po=
pulate()
> > > to mark the entire folio A as uptodate.
> > >
> > > However, according to your statement below that "uptodate flag only t=
racks
> > > whether a folio has been cleared", I don't follow why and where the e=
ntire folio
> > > A would be cleared if kvm_gmem_populate() only adds page A1.
> >
> > I think kvm_gmem_populate() is currently only used by SNP and TDX
> > logic, I don't see an issue with marking the complete folio as
> > uptodate even if its partially updated by kvm_gmem_populate() paths as
> > the private memory will eventually get initialized anyways.
> Still using the above example,
> If only page A1 is passed to sev_gmem_post_populate(), will SNP initializ=
e the
> entire folio A?
> - if yes, could you kindly point me to the code that does this? .
> - if sev_gmem_post_populate() only initializes page A1, after marking the
>   complete folio A as uptodate in kvm_gmem_populate(), later faulting in =
page A2
>   in kvm_gmem_get_pfn() will not clear page A2 by invoking clear_highpage=
(),
>   since the entire folio A is uptodate. I don't understand why this is OK=
.
>   Or what's the purpose of invoking clear_highpage() on other folios?

I think sev_gmem_post_populate() only initializes the ranges marked
for snp_launch_update(). Since the current code lacks a hugepage
provider, the kvm_gmem_populate() doesn't need to explicitly clear
anything for 4K backings during kvm_gmem_populate().

I see your point. Once a hugepage provider lands, kvm_gmem_populate()
can first invoke clear_highpage() or an equivalent API on a complete
huge folio before calling the architecture-specific post-populate hook
to keep the implementation consistent.

Subsequently, we need to figure out a way to avoid this clearing for
SNP/TDX/CCA private faults.

>
> Thanks
> Yan
