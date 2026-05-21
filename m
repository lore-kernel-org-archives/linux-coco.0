Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E753F20EE
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373783; cv=pass; b=mpbbosx0pzFJgth0MM8wQ9sJIJNNCRta3ArBUOOH58dIHxaUexTq4jLVPuh31gJ4LZQ1McmlZrnvVHeM6lvf150yX7tv/wcAFCgAHFhHgU0Bl4SHrZ+AUtR+s+eBc7vnImkRjvdDVn5be25m3dGFoWn1v5dOh8usHXzDMROe7N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373783; c=relaxed/simple;
	bh=yfN1Pt92cq1NUORJuQ82dwA8T7lKFnYQEXa3cFZE1Ms=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnLGoffrUFYRlYbTqiWvR8gMxXlx8T4yWqWrwXRbildZfNBlqNqVncBZ5E6VwSfsHIiHlKrw7BrliFK2x6nPHCki8cmshRlpX68msflkrT6IQkQketzKIDzLHryMaNHiin/5oR7fjOt4Fvng9P0A467o+0vXFfAfXN7QsJ8vpr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PfgUiLm2; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PfgUiLm2"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-575212eb419so4422098e0c.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 07:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779373781; cv=none;
        d=google.com; s=arc-20240605;
        b=KqvwB30HrKSXwYzuBMfsBrXVmJeWeA4Wo7s60xYEpdl5A1b5YR2vgJbuSm8al/DmBx
         SBDREGHxHSQvIQ4ma2teR5JZmwYGAz+19+jxe2id1rGw/trx5Zprvq0dHjaYOWj2dcIW
         9gWrryypUoZ4QKG3sbn5lYcC0bL8GA55OSj3CGKjUJmzzM5QQzMppU9u/J+3un7pE+Un
         CTNSTlxlvg8tnM1bTFtelTthyrnWWh+xUbIQ8PEIrh3DkBv3BsaSLFuKCIcPUBf2iBFr
         nNkMNLOBkzAf4ryBQz/PFLdqWt+U3qUVltUluAMK5aikkmp2bE3dEdNa5sltbds/KPwi
         3H5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1Wo6mylBSliDlwCJngQfhikHW93XVCjTkYwG+w8Z6n8=;
        fh=GApFuLhEc7h4v3EMgefTDY5JDA+h7rkyL2KnaBQpRu0=;
        b=c4h2DtJghPnUJAEPfb7ZHDIrlFoQvY5mv551BTccvfEyvz7oXE4azHnhncnHWSRRs/
         keeb03ARD6+7kPA+4LuqeVrjVhsTaKLM3r3d6Nivue0vyND+z7OvpeuuFwEBgSvJOmKn
         A8bFaYx5mxmmEedHSmGmDweclQVsm5AfZ96is/cxcalT3d56afrnwZDHkoyIYMbqtzkg
         4UcC/MCzp6832Fs7foRBxWs7r7ujsnp+TGU1BWw0XCFF8kEzCv5mM82IicKJWOD8Qj7D
         rae/ft30Js2XXSSxl2GArdOqzBn7lIsbhk8MOy56vgC1CPO4eC6y/tZ2+m37UxN+zaXc
         4Hsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779373781; x=1779978581; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Wo6mylBSliDlwCJngQfhikHW93XVCjTkYwG+w8Z6n8=;
        b=PfgUiLm26+e29fZl0HI70A8pICV1NQMsPuq39ZQ2YOZ3f0i/tvoKqRPkNw5WcwhaMT
         VEoTXGZTpXTVxgwpfEI56w/MVqa7u1vOR3EVDyJR5VH1dS+XdKLX8on8Hxhr7AMS0Ya8
         6OcnO4QFrTDgL7EnG5vuqejTrSQuES5kiywoocmb1vgR0H9pZPSEtinqMOXBJMtaxjM5
         wanCkrwYOqXnSokVfKSX/lg/1D6KHzQLf5o2UikzdcLxcAsSaRfjgeWk96WyzaGxLjF2
         qG737aMfrUbabSCI5EtDWA62TcmqnS//Sv0Y9PUaiT7r1C73GXPa26Pk2oCNAlk9yKOx
         UhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373781; x=1779978581;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Wo6mylBSliDlwCJngQfhikHW93XVCjTkYwG+w8Z6n8=;
        b=MHAXpjYNdB8uFMF2A/z4nFfMG1yeufDy0F4HkIhCvOP6kE/uzyXWd+43HQPnkoqaRh
         Li3+MpmYEn0Is35FyuNmjvAgJ8vT7X2XIwUZ7f19bkuF8PXNFoBe9pk6f5r7Fws3f1Yp
         rJOCHtdAXDw5sN+DgICmTIsxDlQAr/+oBYpFneektQaVx86l3HmRTTH5Z/voWOSo58x6
         TVKGb5JpzpTLKi6HwHRMYJF6Mf8l+i8F+cXmqESWwl2pAPBknI2vknbubmy6gUKIKIiv
         LGbm8tgLWoOyrJnuZ1j9TPciwDwF6OpsLAe9G1ZXf8f5Tdze//rPCRR8ZcNnuxllBzAq
         X+Qw==
X-Forwarded-Encrypted: i=1; AFNElJ8KtcsM3PTuMM5Gh8IIu4sAv+NwLpmJyQHBl0i+V7Y5S8ZZiAoX1cEUei+pnj5rv4oA25P1sWtEzXpo@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0fvWiPupVl3kyneNVrFIf8VnmJR3uUBPnsq2xENewJklO2Qwd
	jF1ENgiA3v/LuInRgfULLk8d3qChs96Q3r4GGbux7+WjDwcxtdZ+Em01cAiTJBp+MSSzWOSuyij
	J5/8IShm1zLIzbLVJDd5CgyQQPjoXIjSOkpFYToXq
X-Gm-Gg: Acq92OHsQc2fwrScyAkTdxvJL4IheqT1t21B+wP2yJjnIESCSzq3YIFKIre5plDk1Qt
	mVbPzP/NQgpVo3NRm7TzQbiGoBvJY+88yigLWw631sXyelsPFRJtCekcHoUeWk/iXaRjtX/1pKA
	Cq8M6F2xfXg5D+YuHfYesIhe0QgcpCOL/YxcFOKAQdpGwMBBQbu9i1KtKHbOkEFfzoUr7Np8M64
	tOmHbl6jPC4XTLmLl+4AYFoqwCS5tb6ixNPvt0cPaTUw+wWGl4/sQko9Q2zndyIAL0HIZCK/65Y
	itSTO+8bwFO1u5txgjoWqnsdI/LZ0E2towBR9q75sZsXBnEDQw==
X-Received: by 2002:a05:6122:3110:b0:575:9f5:ac57 with SMTP id
 71dfb90a1353d-5841d681791mr1479571e0c.4.1779373780196; Thu, 21 May 2026
 07:29:40 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:29:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:29:39 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag8JIlHjohAOC3-g@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
 <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
 <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
 <CA+EHjTzLCD-dU-euZKgzwyEr2ecPqFDNutcaHm2fCDGA+MHVXA@mail.gmail.com> <ag8JIlHjohAOC3-g@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 21 May 2026 07:29:39 -0700
X-Gm-Features: AVHnY4L1QQsQd0FYhhV2GOCZxkOSXAeihTuLPqsZRThJ8u9A5XK7N3qOGhZF0xk
Message-ID: <CAEvNRgEZ9vCKkoMC11tVrueAonGWH2x6OeaYYxXGEj2gwHUaKw@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, May 21, 2026, Fuad Tabba wrote:
>> On Wed, 20 May 2026 at 22:44, Ackerley Tng <ackerleytng@google.com> wrote:
>> >
>> > Fuad Tabba <tabba@google.com> writes:
>> >
>> > >
>> > > [...snip...]
>> > >
>> > >> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>> > >> +{
>> > >> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>> > >> +       struct inode *inode;
>> > >> +
>> > >> +       /*
>> > >> +        * If this gfn has no associated memslot, there's no chance of the gfn
>> > >> +        * being backed by private memory, since guest_memfd must be used for
>> > >> +        * private memory, and guest_memfd must be associated with some memslot.
>> > >> +        */
>> > >> +       if (!slot)
>> > >> +               return 0;
>> > >> +
>> > >> +       CLASS(gmem_get_file, file)(slot);
>> > >> +       if (!file)
>> > >> +               return 0;
>> > >> +
>> > >> +       inode = file_inode(file);
>> > >> +
>> > >> +       /*
>> > >> +        * Rely on the maple tree's internal RCU lock to ensure a
>> > >> +        * stable result. This result can become stale as soon as the
>> > >> +        * lock is dropped, so the caller _must_ still protect
>> > >> +        * consumption of private vs. shared by checking
>> > >> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
>> > >> +        * against ongoing attribute updates.
>> > >> +        */
>> > >> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
>> > >> +}
>> > >
>> > > Doesn't this imply that all consumers of kvm_mem_is_private() should
>> > > validate the result using mmu_lock and the invalidation sequence?
>> >
>> > Let me know how I can improve the comment.
>>
>> Given Sean's context, the comment is good I think. I would quibble
>> with the the "_must_ still protect" phrasing being a bit too strict.
>>
>> Maybe just soften it slightly to acknowledge the exception? Something like:
>>
>>   * lock is dropped, so callers that require a strict result _must_ protect
>>   * consumption of private vs. shared by checking mmu_invalidate_retry_gfn()
>>   * under mmu_lock to serialize against ongoing attribute updates. Callers
>>   * doing lockless reads must be able to tolerate a stale result.
>>
>> That aligns the comment with how KVM is actually using it today. That
>> said, this is nitpicking. Feel free to use or ignore.
>
> Hmm, I wonder if we can figure out a way to consolidate some documentation,
> because this is _exactly_ the same pattern that x86's host_pfn_mapping_level()
> deals with (see its big comment below).
>

This would be great, are you thinking an actual comment or something in
Documentation/?

Perhaps we could iterate on this a little with me providing the newbie
perspective. Do you want me to take a stab at writing something up?

> There's also the stale comment in kvm_invalidate_memslot(), which, stating the
> obvious, speaks to the memslot+SRCU side of things.
>
> Maybe it makes sense to to find a central location for one giant comment about
> how how MMU notifier events and memslot+SRCU protections work?  And then refer
> to that in paths where some asset needs to be tied into MMU notifiers and/or
> memslots+SRCU?
>
> [*] https://lore.kernel.org/all/agcbWe8s9lmPuJwG@google.com
>
> [...snip...]
>
