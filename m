Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852241A9F97
	for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 00:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779752; cv=none; b=ChbIveRwn0ORl8a1zDEpklKEIPJ1wSG2ihdxn6KWspMzDn+M5gx9RIQP4XjlhaA762UoNYVvDI98WBrojrVp2zjWnflTT3Ghd1LdEJbFEDh0Fzs5gxk6Jo3roAPpnua75xa6rDWSz74ShxyYVSJjexFN7ukEY8FytyBDOCaMXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779752; c=relaxed/simple;
	bh=7M+rMoTWxaTD/6h79/TOwhCZDLAteUyb3KP56APKsSs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HHGdU/KnLf624MXOoxQvSUGoD5aWxxGg7649NmsDrjw077dHzo/JB8QLoeIjFO1dcfqGHAZN42voW1GTbZ6dcPcu6jTqR6dDYq4xX6BmEHfRuKLzeoo2BPnfgqJ0ig/6cbFfojBuitnkBBloHzVz+Omr91w2LgLE64SITbmwzS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uxz2Coin; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uxz2Coin"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8479b7c3adbso553019b3a.3
        for <linux-coco@lists.linux.dev>; Mon, 29 Jun 2026 17:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782779751; x=1783384551; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mG7UMEOa4l/HjKEvkoTYx4SxOpxm9xemhK9kHyjngUI=;
        b=uxz2CoinkmXdVC+TDMW5P3Vfr79Kzm4Ji9s/UitFjmo0+YnfU9+JqXB8QT4VBsd7DP
         SdoH5SpmaOWKN/DxhlDZe6RCAleUyj+ZcMoOkaDINBg8wkgIKfqRElByW4KEQQlQ+/kN
         xdvwW5nuUSkhp7tjrCAXC1nlZYVpFCk+/k16fMUOAdQUTobWOh3534XLUe0RoKTBqKvy
         IhRR2ahSBpYZero13he1Z+pn39DJrYkQ/b5SjfbhFjxhTOjK81KuRJC/umeS8gpOr7lN
         3jmqq+PZf0aAIgj5T+gvikPOtbG17XgyMYJM4iea8UoLGLuP2aiWJhFY9gAfpkaYxnlD
         p+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779751; x=1783384551;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mG7UMEOa4l/HjKEvkoTYx4SxOpxm9xemhK9kHyjngUI=;
        b=soryRQ3PFkq724+By3PeKAv9Z/uZUosPEExU6c7mvZfpyTjeWPxbRIaQGfiEdSKjLQ
         l4nrPbAJvv+/5Y9KwoOMvCM2jckzos3ruAq9Z55cK0Mrp+aK2mSr/lyeYIlvPDC8sXWj
         xRTBitpVOd9OfN457ZPRzZdkzYRr6bJ5M8DsPHOXIObWDa3Y3cuAJ5BoR0xgfkvlScU7
         sFgrvfQlQ6bP/xrM8QdToxu5uWhwGBCeWVT/IyUqjHMIASiKQZ1nMxoiqj4CtEDtLUHE
         R/2JmZ1MaxU3oGH/0U3y00X6FD8fruXOPEIOZDApSuK8+gywBTNsInVZ29ZREcwcoq9W
         w60w==
X-Forwarded-Encrypted: i=1; AFNElJ8SBU35r9SiTBycUyznr477KE+8g7tcSY2LOA2sv0dbxwWubmz9fj1ZjyJgTkrMKSUmyPfThnJJDzRL@lists.linux.dev
X-Gm-Message-State: AOJu0YyzlKiY6Kk/kK2a6HMkZuoqtcjrrRX5P6pnEWDppHwtbHktl27t
	EHrHjr+wuf3/whiITJHkKlTOIPpdUTiVupjEnpg9Z2/8uzUYNJnI9OCUln/ui8cT5lEIe1aVVYI
	wJA5A2w==
X-Received: from pgvq1.prod.google.com ([2002:a65:6241:0:b0:c89:2504:2df5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6713:b0:3bf:b3d5:ce2d
 with SMTP id adf61e73a8af0-3bfc50b8944mr1254419637.7.1782779750525; Mon, 29
 Jun 2026 17:35:50 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:35:49 -0700
In-Reply-To: <akI9m02jgKAdi4gX@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ajnf5Z9nWZxoLS4x@google.com> <ajoWngKaZ+wfIyR+@yzhao56-desk.sh.intel.com>
 <ajpGxu2uQys+S2F8@yzhao56-desk.sh.intel.com> <ajxasFBzp_9KnQLq@google.com>
 <CAEvNRgG1nHipzw4=eBgwhvyXi8xYo7FQD_sy9Ax6FDf7YDu3Og@mail.gmail.com>
 <ajyRg3BwGu5dCfOn@yzhao56-desk.sh.intel.com> <CAEvNRgH5KOHoemnC9QOn_oK97=KeAH1XuX3ps36-pJ0Fn0aBHQ@mail.gmail.com>
 <aj3TGLGWT1kMFIVH@yzhao56-desk.sh.intel.com> <CAEvNRgHb6WmOha6Pct_Tn8Ucuov95L=fj5=2R9gcHfx=b2V_+A@mail.gmail.com>
 <akI9m02jgKAdi4gX@yzhao56-desk.sh.intel.com>
Message-ID: <akMPZePBdwQlD74H@google.com>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
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
Content-Type: text/plain; charset="us-ascii"

Gah, I thought I had sent this out this morning, long before Ackerley's response.
But I got distracted by a meeting and forgot to get back to this... *sigh*

Sending what I already wrote, even though there's a lot of overlap with Ackerley's
mail.

On Mon, Jun 29, 2026, Yan Zhao wrote:
> On Fri, Jun 26, 2026 at 08:28:32AM -0700, Ackerley Tng wrote:
> > Yan Zhao <yan.y.zhao@intel.com> writes:
> > > But if a user configures 0 uaddr as valid, writes to it, and then passes 0 as
> > > source_addr(not from gmem), I'm not sure if it's good for the kernel to silently
> > > treat 0 uaddr as an identifier for in-place copy from the private PFN in gmem.
> > >
> > 
> > I'd say the original uAPI perhaps just didn't document 0 as an
> > unsupported uaddr. Given that commit 2a62345b3052 already merged, uAPI
> > was perhaps accidentally changed and no customer complained, I think we
> > can move forward with 0 as an invalid src_address? I wouldn't think
> > anyone relies on 0 intentionally being a valid address.
> > 
> > I could document that, if it helps?
> What about just documenting that 0 is an unsupported uaddr which will be
> re-purposed as an indicator to use the target pfn as the source, regardless of
> whether gmem_in_place_conversion is true? i.e.,
> 
> if (!src_page) 
> 	src_page = pfn_to_page(pfn);

Because KVM can't generally use the target page as the source without in-place
conversion, it's not supported today, and out-of-place conversion is being
deprecated.

> I don't get why the two scenarios should be treated differently:
> 1. gmem_in_place_conversion==true, shared memory is not from gmem 
> 2. gmem_in_place_conversion==false, shared memory is not from gmem
> 
> In both case, a 0 uaddr could be mapped to a valid page not from gmem.

That's immaterial.  KVM's ABI (that we're solidifying) is that an address of '0'
for the source means NULL.  The fact that userspace could have a valid mapping
at virtual address '0' is irrelevant.

Again, just because something is technically possible doesn't mean it needs to
be supported by every piece of KVM's uAPI.

> So why not update the uAPI to handle both cases consistently? :)

Because retroactively adding support for out-of-place conversion is pointless
(requires a userspace update for a feature that's being deprecated), KVM can't
generally support using the source for out-of-place conversion (it's effectively
an obscure zero-page optimization), and IMO rejecting the out-of-place conversion
scenario is valuable for KVM developers, e.g. to help newcomers understand what
exactly is and isn't possible.

Side topic, isn't TDX broken if target page has already been added to the TD?
IIUC, kvm_tdp_mmu_map_private_pfn() will be a glorified nop due to the page
already having a valid S-EPT mapping, and so KVM will incorrectly allow a double
add.  Ahhh, no, because KVM will return RET_PF_SPURIOUS and
kvm_tdp_mmu_map_private_pfn() will then return -EIO.
