Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D528F1DF259
	for <linux-coco@lists.linux.dev>; Sun,  9 Mar 2025 18:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546341; cv=none; b=WaaMkraMYoO2cvjsT69ogm4BtIhwyyXltdh1oNPU9mv9tR9wZiQKw8kC7m3TGSpigNdGbaKSf7gsYLtXICVzJaNEzYBMnpGC/V4IVrWMR+Jl6CYpLZNv9V6+AZP+AJVSylW6IR/3Gq+6b/QCbcztZAED716JuPcarcY/KUw5Kis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546341; c=relaxed/simple;
	bh=zXJZIdGJR4OS9afIEosSDb+g7DJuyc8R4tm7TR6XlYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fu7rPzvriaryM+20/lvC9Q2W7mA1kC7fbLIkNk6Eua2Wed8HSbOQml+2EH7KWiC5TwxjXKtdGxjFmUW/puqSTzy0rSzNdDK1YYZ/eh1T+t00hqkF4YtYfXMGKlYqY0ng/EVfT36J1icrhjkRfiZHtWmNC3K+p9ZXRnp1xuHjaf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hrL0+pyk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hrL0+pyk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225489a0ae6so133475ad.0
        for <linux-coco@lists.linux.dev>; Sun, 09 Mar 2025 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741546339; x=1742151139; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0F9uAQ7tctvQCnO0ZWm2wGaaH5f4voNwAJg6oGX9SI=;
        b=hrL0+pykLxLthe4yM0g1dzmUCATJ3kTY0f6MP56arbsMNWQP1ctCc4eAvSiE2xqSV7
         QVvqzuXOCWTMvNGuxp+i0LuoRQFTwxWkpLpRxmoUIAkGBt7sVu17PcgRkWX4OFgha59L
         ZeolEWxRLGGJddX8vmqfRFsgkMKJD3Qn8zBVoad0SahvtOsNSLMMACUNPmxDyeALgEVY
         fEvZi+f5J9qeO9GFlZo5kvhbC9Oh8hgy2yX6Ts8GvwS8N0SlPldy6N4s2AoMg9JYI5IK
         Ls/y3ovpSHZQ8eKCqZjZVs1Ajzd3oGW4QAfsXYFu4RavLbLmavmRMVxzkVR8rEhB2q2G
         KAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546339; x=1742151139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0F9uAQ7tctvQCnO0ZWm2wGaaH5f4voNwAJg6oGX9SI=;
        b=n+SwRKf0KGICdNPwt4NjGHu+d3LBQVLbjFKqU/Rw7FOslrjOJcX9oMC5FzOUdIyfpj
         WxnTsOmbvQpndAwYwrcifDvZlQuguirY8ucFf8mrqZZjDCYhhmQQCMuGUY5yctT7qTW9
         Yl3FOiCPxUNAzqVzCEpoc47GPT23x/JmIxpDiaQkkPOGAK5GgYk7A5O21rygg/ng2n9J
         1C/WQC1EidjJ6E1SyXlIXwKO4O3LcuNWNyZUZGOOwFC08NF0ZHTiSAqoCGQVU29n4N+6
         7b+e6KG9qD2GmGum9JUkCyKxtwGJXlcPAihoF3Q4aohlJTru28w5Pd3yP77vmav94D3Y
         oPCg==
X-Forwarded-Encrypted: i=1; AJvYcCXCQUotbwkxD5nnKYNWKjjaw17ybEgp/4fDbKo9qHbL4JMsoqkxXpz+7iWdZPCR6OgeTjTJizSQUJDZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8UpT2HsEN5AtisFlWyE8COPY5ugf6HcwEu89R+JTSZIhpw6/v
	6h91z8zN0Kc/4IO5DuSjokXPpAb26SRGf6LA/kn9Tu4WylLoSptobaYvWHCRi3SxTMI2lCCPktr
	43MBAIw7m/t1T4i3gtveLbZnvNAFM8A5Xh+xL
X-Gm-Gg: ASbGncsUcspjfZJgL+Au6TttN8jGeQ/LioazWWQWZsdUQU/utsOYcJYYK4VcMteJqvT
	jMSiGS395Y7Tx9GYxk6l331a62gu1T0Kqt/wSYhVN5wkeTYz2jT8A3nPE7LaY+dgF1aS/mWsspG
	MRBmFO1xb5vXy9u0F+cKj9wj/niM8HnuKBeVPznLvDDnRuGO7a1PU/sVvrox4=
X-Google-Smtp-Source: AGHT+IFG9SSJTufI0eFYbf0wQm2WofP3DAL5foaE083K56zTD/V1FvHHIehtuzbAThLlpAJshuGX+RU/r/N5IlTVF58=
X-Received: by 2002:a17:903:32c7:b0:21f:56e5:daee with SMTP id
 d9443c01a7336-22540e5a9aemr2472185ad.6.1741546338366; Sun, 09 Mar 2025
 11:52:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250226082549.6034-1-shivankg@amd.com> <CAGtprH8akKUF=8+RkX_QMjp35C0bU1zxGi4v1Zm5AWCw=8V8AQ@mail.gmail.com>
In-Reply-To: <CAGtprH8akKUF=8+RkX_QMjp35C0bU1zxGi4v1Zm5AWCw=8V8AQ@mail.gmail.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Sun, 9 Mar 2025 11:52:05 -0700
X-Gm-Features: AQ5f1JrURSpnxKRR4ttTpVJoZfdt94X5FqXT7N9vOmgEqpVIhGKcMYbUZvLcn9Y
Message-ID: <CAGtprH8Rzgg55knK467NEZ3gnhNFhYA8fL3zda188wgcmj1YYA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Add NUMA mempolicy support for KVM guest-memfd
To: Shivank Garg <shivankg@amd.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, pbonzini@redhat.com, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	chao.gao@intel.com, seanjc@google.com, ackerleytng@google.com, 
	david@redhat.com, vbabka@suse.cz, bharata@amd.com, nikunj@amd.com, 
	michael.day@amd.com, Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, 
	michael.roth@amd.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 5:09=E2=80=AFPM Vishal Annapurve <vannapurve@google.=
com> wrote:
>
> On Wed, Feb 26, 2025 at 12:28=E2=80=AFAM Shivank Garg <shivankg@amd.com> =
wrote:
> >
> > In this patch-series:
> > Based on the discussion in the bi-weekly guest_memfd upstream call on
> > 2025-02-20[4], I have dropped the RFC tag, documented the memory alloca=
tion
> > behavior after policy changes and added selftests.
> >
> >
> > KVM's guest-memfd memory backend currently lacks support for NUMA polic=
y
> > enforcement, causing guest memory allocations to be distributed arbitra=
rily
> > across host NUMA nodes regardless of the policy specified by the VMM. T=
his
> > occurs because conventional userspace NUMA control mechanisms like mbin=
d()
> > are ineffective with guest-memfd, as the memory isn't directly mapped t=
o
> > userspace when allocations occur.
> >
> > This patch-series adds NUMA binding capabilities to guest_memfd backend
> > KVM guests. It has evolved through several approaches based on communit=
y
> > feedback:
> >
> > - v1,v2: Extended the KVM_CREATE_GUEST_MEMFD IOCTL to pass mempolicy.
> > - v3: Introduced fbind() syscall for VMM memory-placement configuration=
.
> > - v4-v6: Current approach using shared_policy support and vm_ops (based=
 on
> >       suggestions from David[1] and guest_memfd biweekly upstream call[=
2]).
> >
> > For SEV-SNP guests, which use the guest-memfd memory backend, NUMA-awar=
e
> > memory placement is essential for optimal performance, particularly for
> > memory-intensive workloads.
> >
> > This series implements proper NUMA policy support for guest-memfd by:
> >
> > 1. Adding mempolicy-aware allocation APIs to the filemap layer.
>
> I have been thinking more about this after the last guest_memfd
> upstream call on March 6th.
>
> To allow 1G page support with guest_memfd [1] without encountering
> significant memory overheads, its important to support in-place memory
> conversion with private hugepages getting split/merged upon
> conversion. Private pages can be seamlessly split/merged only if the
> refcounts of complete subpages are frozen, most effective way to
> achieve and enforce this is to just not have struct pages for private
> memory. All the guest_memfd private range users (including IOMMU [2]
> in future) can request pfns for offsets and get notified about
> invalidation when pfns go away.
>
> Not having struct pages for private memory also provide additional benefi=
ts:
> * Significantly lesser memory overhead for handling splitting/merge opera=
tions
>     - With struct pages around, every split of 1G page needs struct
> page allocation for 512 * 512 4K pages in worst case.
> * Enable roadmap for PFN range allocators in the backend and usecases
> like KHO [3] that target use of memory without struct page.
>
> IIRC, filemap was initially used as a matter of convenience for
> initial guest memfd implementation.
>
> As pointed by David in the call, to get rid of struct page for private
> memory ranges, filemap/pagecache needs to be replaced by a lightweight
> mechanism that tracks offsets -> pfns mapping for private memory
> ranges while still keeping filemap/pagecache for shared memory ranges
> (it's still needed to allow GUP usecases). I am starting to think that

Going one step further, If we support folio->mapping and possibly any
other needed bits while still tracking folios corresponding to shared
memory ranges along with private memory pfns in a separate
"gmem_cache" to keep core-mm interaction compatible, can that allow
pursuing the direction of not needing filemap at all?

> the filemap replacement for private memory ranges should be done
> sooner rather than later, otherwise it will become more and more
> difficult with features landing in guest_memfd relying on presence of
> filemap.
>
> This discussion matters more for hugepages and PFN range allocations.
> I would like to ensure that we have consensus on this direction.
>
> [1] https://lpc.events/event/18/contributions/1764/
> [2] https://lore.kernel.org/kvm/CAGtprH8C4MQwVTFPBMbFWyW4BrK8-mDqjJn-UUFb=
Fhw4w23f3A@mail.gmail.com/
> [3] https://lore.kernel.org/linux-mm/20240805093245.889357-1-jgowans@amaz=
on.com/
