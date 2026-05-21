Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FF03603EC
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348019; cv=pass; b=RFICIYnMnCZ+r7cybQyFhfVr6O5SkLa0rTedEXKtOFtrWdz4NEK2+LkqMTsmt8R3DU6P32PTH2jGzn3cx4DZyMjW965Jwc/j8VzMz2oBPzifFqM5s64gdMSitwbtdw+TPq3PdNpltdfV7wVkEfKCZ3Mcd8VuEIemxolrreo8irA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348019; c=relaxed/simple;
	bh=H/h4INyZwih10l9AYdvongdVpuQiBkGMfR0jm2vWFLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scL1thkM13EPKxGTvXKvHjJjeDmItUzqpqXCEqfsj/AYnjaI8j//Cnu2fmcVLSOaMUSnn3d35QBvTgLA0C0I43ZGvAu1xzeV5l9TKd5DkrX4rTrEJZvFCv8lcyPPaU9sr/Y1oK/LcRvsd6r2DzuLxgYpuO+bX4Pfb36YqLThGI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SFHqZo/L; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SFHqZo/L"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50e61648f10so1711cf.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 00:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779348014; cv=none;
        d=google.com; s=arc-20240605;
        b=h47l1dYeyFiRcESTUmzO9hNPwnMIR3KeTb2Re/shhMUDDDrBwZ62LD/Nnn1XmR6afd
         SHOosXaeyZ2p0W9yhI8r/eF6Miu4v1Z8METx1k3RjOURkfMhkfJ5tpq/7rdW30gsZsTT
         q8gtYwH1wmNpiRIPPCDm3+y+vEgTGfYdPs26V4G5awVG8Bfa0+fikYdAeEbSO7bP1OE9
         ni+m00yxzgoLmJId3kDAUJcjcbSLVEOWLy3y4PT0AJhTatZaVGpz8j2ub1vXrUSTQAT8
         1wkfs6poba+Dmecvtm4gZKSOKtaDZSFBHI1+URZ1k6KKUIh9k0ygtCD7xgj7tAZtBIq6
         lK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4lV/LRyXdVcEtETS6N6JX0KnOiUE4cogpgAqkVQgk4U=;
        fh=3BYo4nhL1JitK6CVH9iZ0cS52Mq3a3sT8I9HXkxbB+g=;
        b=JUbZeC06eC8S6ICCSjZWqkqFNOD4miIpmxKpkCDLLzcWu3pp4Oa6w3s9mhXYyDZxxN
         JOlL1V4xU9ZMmTkf1pq9PEdJY6el/h7qyjOcks+7/Ef03qTZRCDIy5TBNljH3jYOM3u5
         wUq+CXc9KIeWTf3sEWKBgEPiwhXjEVp9hSN1RDuSjI32bfzMQm/Pfcdwj14pySGZQu68
         eV5xEHdf6MpwfXj7aO8aZEfNG5Ps+l6meDVr3S1SZk52ei8ezV3z9eN+3M6ZYAB+G7Fe
         lclmzHuGySyaA35I0Wm5LExG9yEnPjyvPExXMWgM3UphpH5pdsMZ1OjqocdKSjsYQNis
         neLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779348014; x=1779952814; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4lV/LRyXdVcEtETS6N6JX0KnOiUE4cogpgAqkVQgk4U=;
        b=SFHqZo/LdhxY+tZmneoQDs4h6TGAOnRoLiWzF2zsHuzHhDHzfNrnA2aTpFxuQAHorO
         kFb0PZmNuWyve6X6w9Mjas9hCmkaCWl/QOZmjnKajeMBFAuo2UvF6LpyIbum1mp3f+Sk
         vnDESeDSjeZSM8hDlZX/ZYE4v4I3W5dGNOojHTjXF0pfdX9n8e6V55ztKImvVZdW8ZCa
         OCGLVDR5hRc2g8Tzh7WnvWKJI6isLv/2wXJr/9kfiGHyDqm4kDc2J8YMIyd1Kk4ECmNJ
         I1O+C+zCOrfwNzz6IMme49HeRKVOcJtVJdeEK24DiAUh99O2ZX0AqnmtwcbpDo/Riw+D
         x3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348014; x=1779952814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lV/LRyXdVcEtETS6N6JX0KnOiUE4cogpgAqkVQgk4U=;
        b=jY9HN2e38HPzzETyYug79Bs2oNxn3INqCVuH0FmO6XlPx2dvi3DylDDer/akRCj7U+
         O51QUXQmPvGTsXmC2AlWLXChiSbL3g1W0mz+J/stjOQQnJpf8GOw1E9QOaXmHpAEMsPd
         lbcgqKCh47bavAoqe+zRO4sqmVdUMIhBZUQL62vuW26982GFHCFzDosFhSGrPGZvUyGP
         LM6ojzuz1pxxtvah5kJTPyre1ODj2GBRqOaqhVXed/77SS1hML/HtbmjrVx8WkaEWKVi
         HL6froAMSq3T6cd153uDd5kyjDEk/VzzylbtQEOaYvl9725lmQYMr/+IAxfDoYCC93L5
         ln6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8tFOX6o3VbzI8cv1f+IM78bzIuooC33UWjSyUYQSSToZTuPX+JHPRszDsGqghh7WD1UpzlKi90m9Sn@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5YPpvBg7Gvti7BS8dM6NacpPk0jtJbOBNsUylmL+u9lE+FqX5
	tonEHl8XcGQAkxBcYn4j+2MO0hQj31mEyfiRej3tS4Pg7hJSDUx9I2NfQpsl4om8XL2+q5O3adc
	JPn3suQsTumF1H/Ox0NA3n8ZI/zpI0kUvz1PgYNXc
X-Gm-Gg: Acq92OHKD1qUvg9sJqhsNhVWDLRwpdgfbr/+PmdW+3jN0YuYa9nlM55i7G8Us6zmMH1
	THeImKndhHSbh2nDYU4NGKBVra17+sld/Hnwxc3GUc7xzNcF1iQw0vFr0toyImxqsfMsaIjP5Vw
	U1JICuJL3CnHus2kq+C4dqMnlWWzivWJitbz83SI2H4iQzmNXteDjPUZWAUC06wejmrZ8Rel/um
	VQziNkfoSH2frX4AJUrokUwTVWmY1g3uTCUoa4SHGF3dClpjSfLt3TyHhDrzIvkZyMSratzUGLI
	VwfUFGszZ4sl/GTci0M=
X-Received: by 2002:a05:622a:8c09:b0:50e:41f3:6467 with SMTP id
 d75a77b69052e-516c545d431mr5347341cf.12.1779348013286; Thu, 21 May 2026
 00:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
 <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com> <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
In-Reply-To: <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:19:36 +0100
X-Gm-Features: AVHnY4IfKawE844Bbti7f163iVDDGQdLfAc0aSSibjPNKnZdr2ZvCDCMhO5buRs
Message-ID: <CA+EHjTzLCD-dU-euZKgzwyEr2ecPqFDNutcaHm2fCDGA+MHVXA@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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

On Wed, 20 May 2026 at 22:44, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> >
> > [...snip...]
> >
> >> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> >> +{
> >> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> >> +       struct inode *inode;
> >> +
> >> +       /*
> >> +        * If this gfn has no associated memslot, there's no chance of the gfn
> >> +        * being backed by private memory, since guest_memfd must be used for
> >> +        * private memory, and guest_memfd must be associated with some memslot.
> >> +        */
> >> +       if (!slot)
> >> +               return 0;
> >> +
> >> +       CLASS(gmem_get_file, file)(slot);
> >> +       if (!file)
> >> +               return 0;
> >> +
> >> +       inode = file_inode(file);
> >> +
> >> +       /*
> >> +        * Rely on the maple tree's internal RCU lock to ensure a
> >> +        * stable result. This result can become stale as soon as the
> >> +        * lock is dropped, so the caller _must_ still protect
> >> +        * consumption of private vs. shared by checking
> >> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> >> +        * against ongoing attribute updates.
> >> +        */
> >> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
> >> +}
> >
> > Doesn't this imply that all consumers of kvm_mem_is_private() should
> > validate the result using mmu_lock and the invalidation sequence?
>
> Let me know how I can improve the comment.

Given Sean's context, the comment is good I think. I would quibble
with the the "_must_ still protect" phrasing being a bit too strict.

Maybe just soften it slightly to acknowledge the exception? Something like:

  * lock is dropped, so callers that require a strict result _must_ protect
  * consumption of private vs. shared by checking mmu_invalidate_retry_gfn()
  * under mmu_lock to serialize against ongoing attribute updates. Callers
  * doing lockless reads must be able to tolerate a stale result.

That aligns the comment with how KVM is actually using it today. That
said, this is nitpicking. Feel free to use or ignore.

>
> I think the "consumption" of private vs shared here actually means
> something like "don't commit a page being faulted into page tables based
> on the result of kvm_gmem_get_memory_attributes() without checking
> kvm->mmu_invalidate_in_progress.", since a racing conversion may
> complete before you commit.
>
> kvm_mem_is_private() is used from these places:
>
> 1. Fault handling in KVM, like page_fault_can_be_fast(),
>    kvm_mmu_faultin_pfn(), kvm_mmu_page_fault(): this already handles the
>    entire mmu_lock and invalidation dance. No fault will be committed if
>    a racing conversion happened after kvm_mem_is_private() but before
>    the commit.
>
> 2. kvm_mmu_max_mapping_level() from recovering huge pages after
>    disabling dirty logging: Other than that it can't be used with
>    guest_memfd now since dirty logging can't be used with guest_memfd
>    and guest_memfd memslots are not updatable, this holds mmu_lock
>    throughout until the huge page recovery is done. invalidate_begin
>    also involves zapping the pages in the range, so if the order of
>    events is
>
>    | Thread A                     | Thread B          |
>    |------------------------------|-------------------|
>    | invalidate_begin + zap       |                   |
>    | update attributes maple_tree | recover huge page |
>    | invalidate_end               |                   |
>
>    Then recovering will never see the zapped pages, nothing to
>    recover, no kvm_mem_is_private() lookup.
>
> 3. kvm_arch_vcpu_pre_fault_memory()
>
>    This eventually calls kvm_tdp_mmu_page_fault(), which checks
>    is_page_fault_stale(), so it does check before committing.
>
> Were there any other calls I missed?

The one I was looking at was `sev_handle_rmp_fault()`, which does a lockless
read without the retry loop. But as Sean just pointed out, that path can
tolerate false positives/negatives and relies on the guest faulting again,
so the lack of synchronization there is existing behavior and considered "fine".

>
> > sev_handle_rmp_fault() calls kvm_mem_is_private() without holding
> > mmu_lock and without any retry mechanism. Is that a problem?
> >
>
> Sean already replied on your actual question separately :)
>
> > Cheers,
> > /fuad
> >
> >
> >>
> >> [...snip...]
> >>
