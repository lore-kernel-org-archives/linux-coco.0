Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6AA3955FD
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727229; cv=pass; b=tc5CqRVNwDcsspcX7PUgWnzAbH/pSbLcsgSkUIfcqiwaB42y+S6plMYIFdGwAlO5n2bv3UGuJPX9Xj9mS7yTsRZf50XA7Pp5+7HKMmzTWhv2f0fRGPvkqXGt2pX9y0oMjY6NS+XfGhcD5RSLHikN/GAlX0WLRInomlIIlS183v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727229; c=relaxed/simple;
	bh=/vyKACkfCL7rXCyIYMwbLdrFfGENnqR/w0Bj9SikPUU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrksbB4o84PM/v+gYf0fypwKS50oZl/nTO3z9tVad6i1LWIxIpFRZGOEQdg7gNvD3TIcSxwCqAgROwpQsIsZKsWC7P0W1+CgFT7TZyM0R+QENkvy0OmxqvXSXC9PeAuFGOtHAK7HWLmg0T0ZZ1/HtlOD3ukk9CIhXKBYz2yFqYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fFb/I3uP; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fFb/I3uP"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52d5bfa4bafso7175181cf.3
        for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 23:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787727225; cv=none;
        d=google.com; s=arc-20260327;
        b=XV8JlODLtVS4VZyzaMTv0LklTGJpVZQAPZBLWxEx/AQLwyBMeGbKCZItzRe2uJVqLx
         9V31r+dlrR4SKrhPfuiDhMoX3zv4oF3VH/952Jz+4bB2oAlE6P4l3V2N5Kji6VgrXu7h
         mDRsrmBgjZ7fafjU/fA1OghDNof3SfjnuDa0NT9TsLQFWvNlu6A/V7dz85x6ECd9iFt3
         AYA+DWMHiIfThDAPKCLULSh6beSA1TmlFswunKRn7X7A2Hc2OWoEuYED2GpZgjmtfP7T
         kDJ992Wzb9Z27i0VaG11nMBpFW9bmdiVjZIm4pf7QIHWVvr/ipZidiEd0UqhmW8nJmIO
         3owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gunoR0/5m2ShIW1cBAYYWni95R3wXjfnlI5bo7Tk+30=;
        fh=hvO1Bw/b0fzilM8OgBCqojZvD3kiKBZUU5FVhUBB1Gc=;
        b=heW9Y5c7gpS6yq2LRz9JOKfQ39rJ+vHPAt3lBNyOWJ4jc4is8GOyEjYn33v8eCYu3+
         I182GWjJSGv1XhvOWi4d2QauKS/go0/eycBbw3VH9A5DQOKyS8/2rKiM8we/QyCHcUXB
         48A1igbL+mgQx/lolEbPWdMJOTnOf8ibgS7zLLSyvxewwx7Uqw4QS94yXhXSKroakZMJ
         pnL53T37quK29gp2n+2PVILCvFYV0eYILlZIQHHJ5kZw9vApD/NIK7kSOVXgEUebyEBi
         arXY3azpKAGKajuqnTjoNvjogALFODZ0pTR3lDdo5M5z6l3jpKoO2bJjcdA9pxLCqOLF
         H1sA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787727225; x=1788332025; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gunoR0/5m2ShIW1cBAYYWni95R3wXjfnlI5bo7Tk+30=;
        b=fFb/I3uPpXR5VE5Jx7EPKo86ATw/lJ8X+MZPhrNBTAWcoSAqpBn41r1i915I9sQrYz
         1rwCcfPtV/QnIkZSEX5L0N1fao1J2pSnCiz2qdT2Y6+kdmBIxzoemgazdy86SRU6+kcx
         2Ki7H/GesQA/jfd3GspVWx+4rCYYrjOoSf1j13OzkdM9FYCYeT/dzlygBSomSYB+jf8D
         851CY/oSIcK5wbrzRE1CvhOeFZ+Q9nQtli3dcyfvKHHxk/FZ35gQQBp+XQrL7EwNEMDy
         kM7Z/rD453W+EtOvnWr2NCbJMTu9Y6Hwr2KSd4l18aHXutt+clxHPKFfkiGqu3lasaN4
         ju3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727225; x=1788332025;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gunoR0/5m2ShIW1cBAYYWni95R3wXjfnlI5bo7Tk+30=;
        b=nmlkXtHBNUfyfq0c+MVdClqVrDgHZZF0y3Z534a8Thlwd6NAPg59veJxe57LUyy26C
         zZv6IiYaX7XLwEur3pHz6qj1stLDF3H5neiMW6d1fKQFR4V1j4R25wt/zHB2n42dWKHC
         h+dOVimuedt6bquB6wzqb+OL2PvzllR4PUE+T6orTzGmdG2UwO8oQ9bGMSS7rL4Kvkfh
         gTHJIz84kRTzPKqX3wmo0moLgynXMtJAS5tO5rLRtOFt/JI8nXlEgAwpTZjoJyF4i3mW
         LArQtu1UNmAtvMmkT2Ao4Upi8fjc5Pt2MNOBXY1WLWaObxcM0uhDO/dppoMZY6HAr1OW
         i6Jg==
X-Forwarded-Encrypted: i=1; AHgh+RojmdGgyyMibcXi9s0uDwF1d+eJrAZCcykC2Cagnfv05DpMw/T2UjYSgtDHWcpPwaIzcJ9svTVUwOYD@lists.linux.dev
X-Gm-Message-State: AFuF++mcMbo4/jmjtGbfChFFQCcszofTdWFy8sw8QWbNky0vDghLVGLG
	w3xIfOBRL7mnuEvZvJjcQVI8gsDtbVp0pN3Jc96fYQhT+WplGsCQ7b/8QjUG/ZrNphG7We3jU7w
	KMYjeE8A+BIWM1TShulcGsYCmM8duSOVhl6uku2gR
X-Gm-Gg: AR+sD11k7SNH8ZZMLSsdoUa6kW+9v+0c3A+c6oktaS350iakL0B2/uFFXQQajmLjgoF
	16BEMd3mxfIqB1b0ihyYtCZiUlYyguayPZNIJG/ERgJfZBa/7WClNISPqDgveXccpLhLjVZddpd
	DiPBc5Cw0evEwxRHITDlevidEyoimCkBp6vdpRR0KayVJbSGZafODIIGbbXpbPiJh6y//XMHuv1
	nrdfXEtuz5vJ+zVCsi/R0brnIaCkiWKRS68DG37XoKztpo0Ovk0J23ig8la1hg0c0soHrPNTOlh
	yMJASqcXNg7CbsDJPdmPRsy8EW7ISBpM4A/klgan1r5CbgVhiuZE/mJ2ml8VMA8gH8hFW2yD8Nh
	pP/K2KuGR3e7Vtr1+LrS531x7ijLiGg==
X-Received: by 2002:a05:622a:1b86:b0:51c:fc4:a144 with SMTP id
 d75a77b69052e-52e4228ddf0mr40451941cf.4.1787727224807; Tue, 25 Aug 2026
 23:53:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 23:53:43 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 23:53:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ao4Gmn5tSZMhl_nX@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com> <CAEvNRgGvxMus6pp=xuDYOumH3Ge4oi0=YKjTaFykFHwXuzRDwg@mail.gmail.com>
 <54d1bd0e-c27a-4033-ab97-02cd9579a620@intel.com> <CAEvNRgFhjbgC9Ng1qviPx4oE=qihUwiBcsYOgJG3yOU-nLG1hQ@mail.gmail.com>
 <ao4Gmn5tSZMhl_nX@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 23:53:43 -0700
X-Gm-Features: AcwNN1W7XYwPjQi0IwDu9VBVz85rJlKXjtpX9LauU0RxJJUn8oPq1JlhbiQWidY
Message-ID: <CAEvNRgEHZZLXyhQ5HiHcTbCk65Y2Lb-fYu0fZ+LRMm1_eWgeSg@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> >
>> > I'm looking at the doc of KVM_SET_USER_MEMORY_REGION2, which reads
>> >
>> > # When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
>> > # userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
>> > # state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
>> > # is '0' for all gfns.  Userspace can control whether memory is shared/private by
>> > # toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
>>
>> I'm not sure how this snippet from the documentation connects with what
>> you'd like changed.
>
> It's flat out wrong once in-place conversion lands, because it assumes PRIVATE
> is tracked per-VM.  Something like this?
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 4eb7e75a7473..c9769e5e7329 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6383,9 +6383,12 @@ on-demand.
>
>  When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
>  userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
> -state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
> -is '0' for all gfns.  Userspace can control whether memory is shared/private by
> +state.  If in-place conversion is disabled, i.e. PRIVATE is tracked per-VM,
> +then at VM creation time, all memory is shared, i.e. the PRIVATE attribute is
> +'0' for all gfns.  Userspace can control whether memory is shared/private by
>  toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
> +If in-place conversion is enabled, then the starting PRIVATE vs. SHARED state
> +of a gfn is determined by the relevant guest_memfd instance.
>
>  S390:
>  ^^^^^

Will apply this, thanks!
