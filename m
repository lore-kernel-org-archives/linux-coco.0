Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB75248CFC
	for <linux-coco@lists.linux.dev>; Fri, 26 Jun 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782432450; cv=pass; b=JbMnfpjWUNPnV/vTcGNMNJ6d+MRDjkJvuBsRK3KNYOXFslUOhN3ItAqh196s69kBfB8P7H72YPwvXE5W8IbSAHkWcjPorUlc5LWoDUPfoqvbfu5UDJC5IT/GSLCOwsPLljLSyYl9Lzkzhas2r6hPl0OO1mKf8y9GMOiabQhkgIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782432450; c=relaxed/simple;
	bh=rLK+LmNxOJTRUAAZGq1OR3eo1LZknLxQo62bHG3MWVs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtO7USSHvcLpQxI++99/5i0pBFNKFyPA3i3oozUI3LcL70HfLLqYX1NWzPWgM/70SNNAsORN1TFTnEVTj1rb1ZeJ8jyTnWV6ei5su2TvkgUxqQsIaeYRuBxv1/NtdEKaDvk6mxgCS+nSl8FhWsRSKhESgXeRiCk4Ri2rGnCUhso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aTZJSsQP; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aTZJSsQP"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1390f75d8bbso319416c88.0
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 17:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782432447; cv=none;
        d=google.com; s=arc-20260327;
        b=iSLPliqpqfTmtKzgimyGBywQMgRBPQuUXXWduzrY7VE7XafPLjpkx0/TkPfT2ZfPRw
         G62o7p0xJ6s1mkZKIJ+IcWQKFoJD7XMUk8k9Ddb/4OdlFdUrVRQqMuJPFzdW2cyNu03P
         zfi4cl5viqNVbHQV67/El9InBoUtm5ATt5Qvnr1Unp7JeweUGFRghE3a3NTYzaxI9c7L
         AYKIz8h9tJ4rk+NfPAuKVdrZDd3AhrQTFP1ZLRSRytXONzaF0hUOjt1V/eZ8D+676vxL
         wOY5rgu0Rxi607B00Wm3eLGRym6PhoN3HaJFdgMwBRQwyVgioG2vKbo+oj2Dy4d0yes+
         HZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=NNd8RQ2oAjOine6lO9TBbPn3RS+xKH28gpFKike5xvo=;
        fh=aGBgWWbaFMY/LvH7EhX+5Rfykaq7IMAIK6tCWhT3raI=;
        b=UNXj6kKK1WdrybaWPcf5JUtea/E8Hd7hmRUwkPZCeQppuUvOx1BD1MBFL7kt+EzkoD
         9NszPXxHDNpix1Q+qvngIESO8v0mYJdkVqzcKvyYbZjygxkBVHcNwU5X6SNjlvRJDDgW
         A0k+M0VUSLzX+f65t8j21cyFrsPYewS8+LWgsk8P9k3XueTcqptmmLzeD9bpMwB528KN
         RsGZYDHCwOzen4PbTGQrteizGlLRDObUhJ5zc4iTueCUYoffopn4ViIQcYoq11EZotNQ
         QL0UxXeEZ0yih8Iy28n+d0LIQLFM0wQbBEnFu2zwQld46txu2+dL8E6I2dMnZSOQt03m
         QKbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782432447; x=1783037247; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNd8RQ2oAjOine6lO9TBbPn3RS+xKH28gpFKike5xvo=;
        b=aTZJSsQPTj/HREZ45hPvWrm/zCT3nwMoYvDaxaTi3ehbAx+Nz/pNSoKRuCykDL/Kee
         ED6uMndIwQDU1D7eWxzZ2XS5JFOP+mcv8yl/3V0wJUHl7Qgb3nGjhFmaqeJcEQUdbh2v
         NE+z5jnsQXb2f/Y93wusfz4My3PouaP6ZoCym1L+dFy63fb4v33GIUNC2bDF7C15naUg
         hR29f2Ng9Xu9QTHvcCA36azvLwbYx9hDkzm7Ty8PX1uj2gQ3S2RVKoWsT9oE0A71GOK8
         /gpPq+RLtdtGs7cwIlx7Ko482wLKhgYE0ItltRKeDwSKImaSIkKCs1CNibRSDILBwwah
         weVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782432447; x=1783037247;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNd8RQ2oAjOine6lO9TBbPn3RS+xKH28gpFKike5xvo=;
        b=hS5v4hjv9CBOxxdi0g/FLC7QHyuIjvslK1R0YmL0PfbYTNwjPItIg0/6Rb2jFwsVIY
         U2OzyJe4VPExpJVC5zEQylR6bLsmfAy+ReZUVMzUMcGlxWBhiuV6kS+VqziWhs64qbpI
         2EFH2fpOYDzqN+7Q1Q14kjRSoI8dWfUplOqao/4d4SjZBc968j4EYnu0TgbOlB7rtCQx
         iWt5RTiOTHmwzy4c4K9tA62R6Efpoidak2zCgbg2Rw2W5/R6S9i33o8lWyB2dYxIaWeS
         wSu3tCSkyfVc/hX4GVu+4Xkt+4sCtXbEsnRLvBWzNZUoGDJhIgQEEH+grP7pkd23LBGR
         kkWA==
X-Forwarded-Encrypted: i=1; AFNElJ+nVRSQsLoqxB3qeCDXSMI76KkGnPtkSFxd72j0l0QObcC3JHtkoTKgdrFcMF/HNXgaSKpm8pLxHvWo@lists.linux.dev
X-Gm-Message-State: AOJu0YyphPI9SE+fzOIh1Qtr2YQxN+vv2jQi7fneRRx/id/9J2nLZB8r
	c1lrDt6YsEJa7LeIVnhThvOOzNPR7vl9M/xl2JnyoNEAXev9WAtfMnBqUaoBL7cTi5y4lb8KVYs
	NJ1VhjkTYDCf+NagC7RnEG/P1T4RXViAKCjBwqm1I
X-Gm-Gg: AfdE7clW4LbveLQKE3b8JerOQaOkeeuYw/KSCx12VPHkJFV+fZ/cL6ALCPydXuWPKiP
	PZQ1oREV8OupCG88JhG7+VxxwrE8bZcAkBvAuKjZKf+BaRPApMnrUqgaCAkg8xxTn8ovrQbpDhW
	uV/DkiMNZUCU5zPx6+jFBpxlzzSVtP+fpMIjk1BzcQlugJrzKNnutJNoh29MVf2D6mhj1UeGTII
	qWRB8lb9bvNRxXEVv9INclV1d0ETuW4yY/SH0N5uoYx6pQIEHaf3d8A0PAw+kpCnTxZeVR+I1cU
	0F0FCqaP/pPEa0yYQUOeWOcCL0DXiZVCmGLJMlT/BdWgKCIanqqunTR4AJM=
X-Received: by 2002:a05:7022:43a4:b0:137:f49d:3388 with SMTP id
 a92af1059eb24-139dbb5b144mr4108872c88.21.1782432444996; Thu, 25 Jun 2026
 17:07:24 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jun 2026 17:07:23 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jun 2026 17:07:23 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajyRg3BwGu5dCfOn@yzhao56-desk.sh.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
 <ajjc0hw8PjGw69e9@yzhao56-desk.sh.intel.com> <ajnf5Z9nWZxoLS4x@google.com>
 <ajoWngKaZ+wfIyR+@yzhao56-desk.sh.intel.com> <ajpGxu2uQys+S2F8@yzhao56-desk.sh.intel.com>
 <ajxasFBzp_9KnQLq@google.com> <CAEvNRgG1nHipzw4=eBgwhvyXi8xYo7FQD_sy9Ax6FDf7YDu3Og@mail.gmail.com>
 <ajyRg3BwGu5dCfOn@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 25 Jun 2026 17:07:23 -0700
X-Gm-Features: AVVi8CeCYnzA1y3pJSgcOnrMDG9x7K-8H5mOt6-X5dtowJ5-kK2ahwrJyY06kZw
Message-ID: <CAEvNRgH5KOHoemnC9QOn_oK97=KeAH1XuX3ps36-pJ0Fn0aBHQ@mail.gmail.com>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Wed, Jun 24, 2026 at 04:00:32PM -0700, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>> > On Tue, Jun 23, 2026, Yan Zhao wrote:
>> >> On Tue, Jun 23, 2026 at 01:16:14PM +0800, Yan Zhao wrote:
>> >> > On Mon, Jun 22, 2026 at 06:22:45PM -0700, Sean Christopherson wrote:
>> >> > > On Mon, Jun 22, 2026, Yan Zhao wrote:
>> >> > > > On Thu, Jun 18, 2026 at 05:32:00PM -0700, Ackerley Tng via B4 Relay wrote:
>> >> > > > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
>> >> > > > > index ffe9d0db58c59..56d10333c61a7 100644
>> >> > > > > --- a/arch/x86/kvm/vmx/tdx.c
>> >> > > > > +++ b/arch/x86/kvm/vmx/tdx.c
>> >> > > > > @@ -3198,8 +3198,12 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>> >> > > > >  	if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
>> >> > > > >  		return -EIO;
>> >> > > > >
>> >> > > > > -	if (!src_page)
>> >> > > > > -		return -EOPNOTSUPP;
>> >> > > > > +	if (!src_page) {
>> >> > > > > +		if (!gmem_in_place_conversion)
>> >> > > > When userspace turns on gmem_in_place_conversion while creating guest_memfd
>> >> > > > without the MMAP flag, the absence of src_page should still be treated as an
>> >> > > > error.
>> >> > >
>> >> > > Why MMAP?
>> >> > Hmm, I was showing a scenario that in-place conversion couldn't occur.
>> >> > I didn't mean that with the MMAP flag, mmap() and user write must occur.
>> >> >
>> >> > > Shouldn't this be a general "if (!src_page && !up-to-date)"?  Just
>> >> > > because userspace _can_ mmap() the memory doesn't mean userspace _has_ mmap()'d
>> >> > > and written memory.  And when write() lands, MMAP wouldn't be necessary to
>> >> > > initialize the memory.
>> >> > Do you mean using up-to-date flag as below?
>> >
>> > Yes?  I didn't actually look at the implementation details.
>> >
>> >> > if (!src_page) {
>> >> > 	src_page = pfn_to_page(pfn);
>> >> > 	if (!folio_test_uptodate(page_folio(src_page)))
>> >> > 		return -EOPNOTSUPP;
>> >> > }
>>
>> Yan is right that with the earlier patch "Zero page while getting pfn",
>> folio_test_uptodate() here will always return true.
>>
>> Actually, this is an alternative fix for the issue Sashiko pointed out
>> on v7 where userspace can do a populate() (either TDX or SNP) without
>> first allocating the page, with src_address == NULL, and leak
>> uninitialized memory into the guest.
>>
>> Advantage of using the uptodate check in populate: if the host never
>> allocates the page, populate doesn't incur zeroing before writing the
>> page anyway in populate().
>>
>> Disadvantage: Both TDX and SNP will have to implement this uptodate
>> check. guest_memfd can't check centrally because for SNP, for a
>> PAGE_TYPE_ZERO, !src_page should be allowed with a !uptodate page since
>> firmware will zero and there's no leakage of uninitialized host memory?
> Another disadvantage: the uptodate flag is per-folio. What if the folio
> is only partially initialized by the userspace especially after huge page is
> supported?
>

Good point on huge pages!

The uptodate flag on the folio in guest_memfd means "this folio has been
written to". As of now (before patch at [1]), this happens when

+ folio is zeroed on first use by userspace
+ folio is zeroed on first use of the guest
+ folio is populated

When huge pages are supported, the folio can't partially be initialized?

On allocation, if any part is shared, we split the page. The parts are
separate folios that have their own uptodate flags.

On splitting, if the huge page is uptodate, the split pages will also be
uptodate. If the huge page is not uptodate, the split pages won't be
uptodate, but that's ok since they will be marked uptodate on first use.

On merging, the non-uptodate parts have to be zeroed and then marked
uptodate. Any parts that are in use would have been marked uptodate
already, so there's no overwriting data that is in use. I'll need to
think more about when it's safe to zero.

I'm still on the fence between the two options

1. Using uptodate check in populate to reject src_pages that have never
   been written to or
2. Always zero before populate

but whether the uptodate flag is per-folio or not doesn't affect these
two options in terms of fixing the leak of uninitialized host memory,
right?

>
>> >> Another concern with this fix is that:
>> >> commit "KVM: guest_memfd: Zero page while getting pfn" [1] always marks the
>> >> folio uptodate before reaching post_populate().
>> >>
>> >> [1] https://lore.kernel.org/all/20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com/
>> >>
>> >> > One concern is that TDX now does not much care about the up-to-date flag since
>> >> > TDX doesn't rely on the flag to clear pages on conversions.
>> >> > I'm not sure if the flag can be reliably checked in this case. e.g.,
>> >> > now the whole folio is marked up-to-date even if only part of it is faulted by
>> >> > user access.
>> >> > Ensuring that the up-to-date flag works correctly with huge page support seems
>> >> > to have more effort than introducing a dedicated flag for TDX.
>> >> >
>> >> > > > Additionally, to properly enable in-place copying for the TDX initial memory
>> >> > > > region, userspace must not only specify source_addr to NULL, but also follow
>> >> > > > a specific sequence (where steps 1/2/3/7 are required only for in-place copy):
>> >> > > > 1. create guest_memfd with MMAP flag
>> >> > > > 2. mmap the guest_memfd.
>> >> > > > 3. convert the initial memory range to shared.
>> >> > > > 4. copy initial content to the source page.
>> >> > > > 5. convert the initial memory range to private
>> >> > > > 6. invoke ioctl KVM_TDX_INIT_MEM_REGION.
>> >> > > > 7. do not unmap the source backend.
>> >> > > >
>> >> > > > So, would it be reasonable to introduce a dedicated flag that allows userspace
>> >> > > > to explicitly opt into the in-place copy functionality? e.g.,
>> >> > >
>> >> > > Why?  It's userspace's responsibility to get the above right.  If userspace fails
>> >> > > to provide a src_page when it doesn't want in-place copy, that's a userspace bug.
>>
>> Yan, is your concern that userspace forgot to update the code and
>> forgets to provide a src_page, and if we keep the "Zero page while
> Yes. Previously, it would be rejected after GUP fails.
>

I see, didn't realize previously it would be rejected because GUP
fails. GUP failed because it wasn't faulted into the host?

That's kind of orthogonal, I don't think GUP fail leading to rejecting
populate was meant to help userspace catch these issues. GUP would also
fail if the user did mmap(), write to it, unmap using
madvise(MADV_DONTNEED), then forget and pass 0 as src_address.

>> getting pfn" patch, ends up with the guest silently having a zero page?
>> I think that would be found quite early in userspace VMM testing...
> I actually encountered this during testing this patch.
> I update most code path to follow this sequence. However, still some corner ones
> for TDVF HOB, which are less obvious and harder to update.
> The TD just booted up and hang silently.
>

I think this is just the life of a close-to-hardware software engineer
:P no errors, got stuck somewhere, root cause is some unitialized
thing.

>> >> > I mean if userspace specifies a NULL source_addr by mistake, it's better for
>> >> > kernel to detect this mistake, similar to how it validates whether source_addr
>> >> > is PAGE_ALIGNED.
>> >
>> > The alignment case is different.  If userspace provides an unaligned value, KVM
>> > *can't* do what userspace is asking because hardware and thus KVM only supports
>> > converting on page boundaries.
>> >
>> > For a NULL source, KVM can still do what userspace is asking.  Rejecting userspace's
>> > request would then be making assumptions about what userspace wants.
>> >
>>
>> Also, +1 on this, what if userspace, knowing that pages are zeroed on
>> allocation, actually wants to rely on that to get a zero page in the guest?
> What if 0 uaddr is a valid address? :)
>
>> >> > Since userspace already needs to perform additional steps to enable in-place
>> >> > copy, specifying a dedicated flag to indicate that the NULL source_addr is
>> >> > intentional seems like a reasonable burden.
>> >
>> > I don't see how it adds any value.  I wouldn't be at all surprised if most VMMs
>> > just wen up with code that does:
>> >
>> > 	if (in-place) {
>> > 		src = NULL;
>> > 		flags |= KVM_TDX_IN_PLACE_COPY_INITIAL_MEMORY_REGION;
>> > 	}
>>
