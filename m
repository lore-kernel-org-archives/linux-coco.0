Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783CBDDCD
	for <linux-coco@lists.linux.dev>; Sun,  9 Mar 2025 01:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741482605; cv=none; b=SjwgzYlx2GQSphj0RYoJlh4LxmfiNM1jTHmWnWRZbVEEuzXkREpLWs4ZMl6ARl16X/0pFC2T4Nzeu2TW0THGTA/LJZJukvE+cwWFU8RZHAA4ILoNZ/LOo9Vi2sQA9JwY2JtopzZILL1GG3DH+9mq3h90o+5v7ZaBvVIxTRVMyl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741482605; c=relaxed/simple;
	bh=EMETro1CBymXxo+PkEzv8CVP78iq4oJXIfSe7eI5Prs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EduxaajxgqybLwu5Rctz/pC410EARkNkN1LPoL6JO6N3Rk3eeKPaMcu/TS7BFSBBLaIMKl6q6l2ZI1wjQVrrLoBuIUDg+Lw/7pk0OmryeQ0+KinsnAKs/rsHn1f7oOGkVpG2CrF8efpROpDf1J9atxIn1tp1mi7JBeU0eevcA5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JV4qB2iB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JV4qB2iB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225489a0ae6so93215ad.0
        for <linux-coco@lists.linux.dev>; Sat, 08 Mar 2025 17:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741482602; x=1742087402; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4FPh8cAnZtQW5ZPsNxGskEY/OiXTs4MuYAjZb1WM+U=;
        b=JV4qB2iBLFURy8suvVdLqaJdz4O2XJnzM44ShcthUkJf23ROiXNpSG4aUJ0tWcao7h
         I1uAdunYQrnQCDnP6bqdY4g4mFNv1jv2Q4us+3zzdYTV2YTkZNimHiWogKU7oQYoybMh
         mhN8lfVkNd4CnA0MlWhIAmLqk4sBbO2jOFCuK7/VuURUv0VrRf/lECRzFiXtK9WhkkTb
         xe+XRrLxIbZCK5cPHZKbPolXALuQ7eEo1FX0p6CdYMQwaUuFUj1yfH6P6ArxRVfVAb8r
         UqQU2Nwxt6h9BLHe+RS2ZfTpMjdjMGPMhOCfwj4YtvC30woO9P0yX/yIoD0xhfBasA9o
         yoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741482602; x=1742087402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4FPh8cAnZtQW5ZPsNxGskEY/OiXTs4MuYAjZb1WM+U=;
        b=BpdE/RCRu39VsGe3pwnzUEGTJVy9hjN4zwWgXYf70o04r2uLyuDzDEnk1TiuhD2yGn
         Ss0QSghP0cENII2kjGibMUPvtaTXqMto4IuoaqqOqDwxvP0dAyrhAzfJm6zR56YWeDov
         +WDsjpV8tR+F76bNHtzMaw95Kt55xXp3+t2JNRv+g31aRXAZdkBu07w6byLeG9s/tjHU
         82Sd+rmaN1kZsTg7fip17XAO+HMuLVJnYGBhBjCgp4IeS0hpLuVrjsZUweKH0m7KorhO
         qE2xYw4zw2RWPGpYGw+6fKltES4i7yfKUdnjf8ErKa4XvYxVh5Lgp52vG+83uSuC2MsV
         2y8g==
X-Forwarded-Encrypted: i=1; AJvYcCX37fVDROHETFzcKkxnoWpJGRnL9LqS4C04PaG0xX10l1cvX1tUxy71hAwpo8fRvBC0aQ/wVnZQA8q7@lists.linux.dev
X-Gm-Message-State: AOJu0YxdNLL4GMQdN87TjXsQ8G90wisbIdtwnORUPa2dCboCQ6QhLbcy
	gAInLu1bVlK4zz0p4ZIaKtu1Zdji0nShIJ/GycODLqGdjOhapbirFzhbAI/CwZACbuBHtyfighZ
	rmd9rwz8tF0a4dav0gceKcR47aocb2BOONJyZ
X-Gm-Gg: ASbGncvxzuDn0Siwc1kfEDpKB4YiMxXKgsgi24A+HcY/T19vP4R6TtQIJQu9B5UlIjq
	D8aI6lw7fQuLznZqSaJfxgKg36bWNHIDd+jMXujD9fN3i/POgslF42dYO5j0cD/OtPZHs9rI27p
	+2VZ4Z6fSRbKQGojtEwMgiCLqQTE1cZumJYUx/EGmrYLbT5b4cls88tQd4VQ==
X-Google-Smtp-Source: AGHT+IFSArhJYsv3zVVqv8OWZu8TOBKIMea4fF5APrE5l+oYIst19Piwk29+HWLQWw6zl3b0tZUthbrcWcdq34ooI38=
X-Received: by 2002:a17:903:32c7:b0:21f:56e5:daee with SMTP id
 d9443c01a7336-22540e5a9aemr1979785ad.6.1741482602144; Sat, 08 Mar 2025
 17:10:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250226082549.6034-1-shivankg@amd.com>
In-Reply-To: <20250226082549.6034-1-shivankg@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Sat, 8 Mar 2025 17:09:46 -0800
X-Gm-Features: AQ5f1JpKR8YeZcYjkYLi6Yj3T7-X4RTGFozEjKkiiy8Q2qes9s3EoImSl39wsJs
Message-ID: <CAGtprH8akKUF=8+RkX_QMjp35C0bU1zxGi4v1Zm5AWCw=8V8AQ@mail.gmail.com>
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

On Wed, Feb 26, 2025 at 12:28=E2=80=AFAM Shivank Garg <shivankg@amd.com> wr=
ote:
>
> In this patch-series:
> Based on the discussion in the bi-weekly guest_memfd upstream call on
> 2025-02-20[4], I have dropped the RFC tag, documented the memory allocati=
on
> behavior after policy changes and added selftests.
>
>
> KVM's guest-memfd memory backend currently lacks support for NUMA policy
> enforcement, causing guest memory allocations to be distributed arbitrari=
ly
> across host NUMA nodes regardless of the policy specified by the VMM. Thi=
s
> occurs because conventional userspace NUMA control mechanisms like mbind(=
)
> are ineffective with guest-memfd, as the memory isn't directly mapped to
> userspace when allocations occur.
>
> This patch-series adds NUMA binding capabilities to guest_memfd backend
> KVM guests. It has evolved through several approaches based on community
> feedback:
>
> - v1,v2: Extended the KVM_CREATE_GUEST_MEMFD IOCTL to pass mempolicy.
> - v3: Introduced fbind() syscall for VMM memory-placement configuration.
> - v4-v6: Current approach using shared_policy support and vm_ops (based o=
n
>       suggestions from David[1] and guest_memfd biweekly upstream call[2]=
).
>
> For SEV-SNP guests, which use the guest-memfd memory backend, NUMA-aware
> memory placement is essential for optimal performance, particularly for
> memory-intensive workloads.
>
> This series implements proper NUMA policy support for guest-memfd by:
>
> 1. Adding mempolicy-aware allocation APIs to the filemap layer.

I have been thinking more about this after the last guest_memfd
upstream call on March 6th.

To allow 1G page support with guest_memfd [1] without encountering
significant memory overheads, its important to support in-place memory
conversion with private hugepages getting split/merged upon
conversion. Private pages can be seamlessly split/merged only if the
refcounts of complete subpages are frozen, most effective way to
achieve and enforce this is to just not have struct pages for private
memory. All the guest_memfd private range users (including IOMMU [2]
in future) can request pfns for offsets and get notified about
invalidation when pfns go away.

Not having struct pages for private memory also provide additional benefits=
:
* Significantly lesser memory overhead for handling splitting/merge operati=
ons
    - With struct pages around, every split of 1G page needs struct
page allocation for 512 * 512 4K pages in worst case.
* Enable roadmap for PFN range allocators in the backend and usecases
like KHO [3] that target use of memory without struct page.

IIRC, filemap was initially used as a matter of convenience for
initial guest memfd implementation.

As pointed by David in the call, to get rid of struct page for private
memory ranges, filemap/pagecache needs to be replaced by a lightweight
mechanism that tracks offsets -> pfns mapping for private memory
ranges while still keeping filemap/pagecache for shared memory ranges
(it's still needed to allow GUP usecases). I am starting to think that
the filemap replacement for private memory ranges should be done
sooner rather than later, otherwise it will become more and more
difficult with features landing in guest_memfd relying on presence of
filemap.

This discussion matters more for hugepages and PFN range allocations.
I would like to ensure that we have consensus on this direction.

[1] https://lpc.events/event/18/contributions/1764/
[2] https://lore.kernel.org/kvm/CAGtprH8C4MQwVTFPBMbFWyW4BrK8-mDqjJn-UUFbFh=
w4w23f3A@mail.gmail.com/
[3] https://lore.kernel.org/linux-mm/20240805093245.889357-1-jgowans@amazon=
.com/
