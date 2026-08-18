Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914B1420483
	for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041375; cv=pass; b=iDnBrf/AfQnf3o5mIsl7/cXY0P0POL/lRyUVkvLYe4aDQTGJQs4fGk9uBCJt2RyP14FHOEhNdUnzfzky55Y1YW1tjQPtdLjevHefX6WaFJBw3iHBvsdh6F7vHjIKF3PqBIGk0u5fOkz+EixVLt9JUwdL48Lqv9dBbpOex4xaZMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041375; c=relaxed/simple;
	bh=5J3xUB3/7aisz9iRktEt7o1yC5SHtH7S+wRq998947s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr4RJMUfQmAki0SeQispaiG4cpZB/XBTEpCFe5JIE7LG7tePYUxAUkC+i30JzU+M53qpkpk7SbRjwVyPMN83Gm0LG10ql1rWlUAkNkgqEVQeMZ8/RZxjRqrQ0oCGg7SudNhMHcBHd4AD4L4yNzKJUHdvDF8/4KTiuanGV65PWgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iz5mpmiW; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iz5mpmiW"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dcbade417so4346176a91.1
        for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 01:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787041373; cv=none;
        d=google.com; s=arc-20260327;
        b=Vqtm77W1CVmfrEX5UD1myICexJko1rJqO8y9QcavH9dgzys2a4HdSussFh6tV4tlaI
         euwjDjnLtalQVPdt1M8vt98YQZa/M3FbX0/JlUs41RNZSLMYENAIPDW6DSXNBBBQHDIa
         AxcEDxjKzr7TWymuBzIG869OqDaVNBpUEg3AQAr0XLo2eLiufsadwuEEt1ZT3gNaYiAC
         lFsIdGrPBZB/0HrA/6VHyzagIUvvKvto18bISNqwJtSqnrs2jTz2WhMjXBWwI3c+Wd7L
         HAPpPhHHufpyTCzWxjcnw4yMYigrlx+5dXX1h7y9atfxxvsl4KkfD3jq30jcZc6e2ttt
         KltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        fh=dTKLuMa+3Z+J6IA2Kdu9bKzVoh1rGRQQI/K65dV6qpM=;
        b=llNXxle7F2amgmkoGRvTfRSDPSXU03EjSO022B/LcTVUfgMFMkULeyr07WNbZq2Jo3
         JSN2J5CrtB9zIJXMyARp2EA/pTBhyN+3MrYfxGqcWnNwKUGpRQJF4cBlNejbx32Lz3SB
         6pLaCGBlhNPfu7t/KKJE0wSIK+iWEYX4no04HOjmCsXh2VPgF5fzc9sKgB7I8SsgCnKY
         aB5+ZrmahVkpDayPuR97r4cu+yrYS7IE4hV3tBffLS1I1ygwyznx7K1iCZoEBQyWGeAP
         1EPY2rO8ZXm7qa6YSOj0qCz31g+ltGFLPkBfIqtXAJfLs3+SF+cGjfHnc3sdohAdCYuU
         ILlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787041373; x=1787646173; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        b=Iz5mpmiWU61uaqVqfzB1fhLb7b9ETooll/vMEX8cpGZ8a0xjU4krIMn54M96KbS9oG
         3UUiduZxhcslXOMcN2qc/o3uUv3M7Zy8/Vm0GUe39G3XiX5LUpXspRiRdsA9a0kCdf/E
         2gz9nFlQWVU+e486Ohl9Fpuzm1JSMqJdjFKdFvA6AalZ7iOmwuopt944OP+xOLKFlYSk
         CzTQAWPRCl45EH+/zJq7PJemzMjv+OWFCads5eW5URgps/uTNXXJtqRp3J0weOMrkTVC
         oPAI2W5vrUEXMnijGCLzK9WGHhPqvlHMqbir1hL4vzShBFTVh2uMsFmDPAqwV3IY/CIY
         GUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041373; x=1787646173;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        b=L2KsykKGSLnl2jQysMuYgTTAsiNCksZbNH/Vlqfsbp4IwOTJD3mpzvweq6mp/SeyJO
         /XjrL75uhw+/YX02ETBuQnjb9W/oUwy/4+lLTh5MH5cz7FHCXmf2zWexKfk4MpC+7rsH
         1+aEr5Jc9GnfWXiL9HQINyWjT/h+L9cR+TLQJiN8poV3A2cMbu10vKBX89FEAF4CfLxq
         hKgSyP/6wMR/gjzFkqZvgVOt8RN/l0bYYkDKQ1rhOk72ym9NeaD/yPXPh0vodCzFSahb
         zRkX+FKKBIFCFtnPgLTplFLbm9yvlbMisoPa1u/PMke3Jl6o8rJFl5p7SGdefMIqOp93
         yrnA==
X-Forwarded-Encrypted: i=1; AHgh+RprzH5bPMcTys2QGqKXCp75v0Zhn2kcnGKEzLv1eFiIeNVg77rn/8KlZD5kb6kDCJM0d/Wz6GDuAGVX@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4C77LOAp8rjf0ardEyJiE67um6Bjix8DtoItqGkGdMrn6BCzK
	S3gSQtp8k9wQBufM+YO/c/UCvDJjvNe4PR2exBvqHOquDVtDol2ACLGf3eNvBDP/X5rQRRKUDlV
	W0cfJuB76AbrhA7im3yRl1aewiBEYNlIQZZBaxIET
X-Gm-Gg: AR+sD119n0RQmBIMlHkRFZvBRCahBYgauHJhe2gN536qNcTV6nxMfAurjAyKXeGWd9b
	5ihIBMgrpDjaYw+5em126lr7tjG6gcjunKl3idA44yPIf3IikWwe384GZx1fdiwsYs9GJVVR3uL
	PRwTRXxFOVTXFiOjKA29asr7yCUWDGu2xqoPsdqT1nM89FFjhodODcY+w7syhyCnDCtctfXGSLm
	bNrpXarB/ylXfMGbP+em9canuwMB5cVOJCNE40MPBWGRPiSV6VcNeeGOav4EEZkvMTrXQoiBZpH
	u+I7O1WA3YCNB7cgRukn1nRLAsmraIEaQOd3DUOPsKa1gPQe/xHNw4ornrTw2ALLkbHXcEPL2m5
	gH1mpKeSAYg==
X-Received: by 2002:a17:90b:314a:b0:395:5404:95 with SMTP id
 98e67ed59e1d1-3955a79c987mr7608716a91.12.1787041372060; Tue, 18 Aug 2026
 01:22:52 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 01:22:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 01:22:49 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aoOJRk5SXBzzT24K@google.com>
References: <CAEvNRgFWcndQKJE_q+ZATFZEMYd=6uRLygozLvg7L77bPX0cEQ@mail.gmail.com>
 <anqqKH6kuwpvuwp9@yzhao56-desk.sh.intel.com> <CAEvNRgGWDY_fxbyBM-5sMdYMevMe0HzVP9kbC1cCGLE_dV=_Gw@mail.gmail.com>
 <a71d4fccdffd1f6a12332ddd18fa812542ea2118.camel@intel.com>
 <CAEvNRgHxda6XK_XqWaqqVnA7oW=Fhp_C5gF4vNcL+-HfwfXMqQ@mail.gmail.com>
 <0c80b9b0e13e3ab2cbe4f9eaf4a02ebba25a7001.camel@intel.com>
 <an5RJYTwlYeym--O@google.com> <aoKnmW9St5zCoTD3@yzhao56-desk.sh.intel.com>
 <aoNrFX9yLfsM7KQI@google.com> <CAEvNRgH_=8YqKHb_OJfT583ZJ346cceRimd9YJ762Vv08uJGHQ@mail.gmail.com>
 <aoOJRk5SXBzzT24K@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 18 Aug 2026 01:22:49 -0700
X-Gm-Features: AcwNN1UwBN-I8e5ZL1Wm4VeVuI85_vvgyrgG68xpeG1bFCBW0uOQsMiH1U5tIzU
Message-ID: <CAEvNRgHXXXBgO2Pw9PcaiaTLXBrm-F++nJKSeHn6m0rnZiT7RQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Sean Christopherson <seanjc@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"steven.price@arm.com" <steven.price@arm.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"forkloop@google.com" <forkloop@google.com>, "tabba@google.com" <tabba@google.com>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, "willy@infradead.org" <willy@infradead.org>, 
	"tglx@kernel.org" <tglx@kernel.org>, "wyihan@google.com" <wyihan@google.com>, 
	"pratyush@kernel.org" <pratyush@kernel.org>, "aik@amd.com" <aik@amd.com>, 
	"jmattson@google.com" <jmattson@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "rientjes@google.com" <rientjes@google.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "chrisl@kernel.org" <chrisl@kernel.org>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"mhiramat@kernel.org" <mhiramat@kernel.org>, "baohua@kernel.org" <baohua@kernel.org>, 
	"tarunsahu@google.com" <tarunsahu@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"jgg@ziepe.ca" <jgg@ziepe.ca>, "jthoughton@google.com" <jthoughton@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"shikemeng@huaweicloud.com" <shikemeng@huaweicloud.com>, "nphamcs@gmail.com" <nphamcs@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shivankg@amd.com" <shivankg@amd.com>, 
	"shuah@kernel.org" <shuah@kernel.org>, "youngjun.park@lge.com" <youngjun.park@lge.com>, 
	"kasong@tencent.com" <kasong@tencent.com>, "pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"vbabka@kernel.org" <vbabka@kernel.org>, "weixugc@google.com" <weixugc@google.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "qperret@google.com" <qperret@google.com>, 
	"brauner@kernel.org" <brauner@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	"baoquan.he@linux.dev" <baoquan.he@linux.dev>, "corbet@lwn.net" <corbet@lwn.net>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "liam@infradead.org" <liam@infradead.org>, 
	"axelrasmussen@google.com" <axelrasmussen@google.com>, "kas@kernel.org" <kas@kernel.org>, 
	"qi.zheng@linux.dev" <qi.zheng@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> > The only question is if we want to commit to
>> > guaranteeing that conversion will succeed in this scenario, or if we want to take
>> > the easy way out and formally document that conversion can fail with EAGAIN at any
>> > time, even if userspace has never mmap()'d the memory in question.
>>
>> I don't really think there's a need to commit to this, IIUC in principle,
>> ignoring that on many paths of those guest_memfd may be excluded, refcounts
>> can be taken even if there are no host userspace mappings. For one, memory
>> failure handling doesn't care if there are mappings, the refcount will be
>> taken for a short while and could cause this conversion failure.
>>
>> Here's the relevant part of the documentation added for conversions:
>>
>>   If this ioctl returns -EAGAIN, the offset of the page with unexpected
>>   refcounts will be returned in `error_offset`. This can occur if there
>>   are transient refcounts on the pages, taken by other parts of the
>>   kernel.
>>
>>   Userspace is expected to figure out how to remove all known refcounts
>>   on the shared pages, such as refcounts taken by get_user_pages(), and
>>   try the ioctl again. A possible source of these long term refcounts is
>>   if the guest_memfd memory was pinned in IOMMU page tables.
>>
>> > I'm leaning pretty strongly towards guaranteeing conversion will succeed.  We'll
>> > still need to document the EAGAIN behavior, but IMO there's a massive difference
>> > between conversion failing if there's a lingering reference acquired via a VMA,
>> > conversion failing because a vCPU page fault raced with conversion.  E.g. being
>> > able to assert success in a very curated test, as the stress test presumably does,
>> > would be extremely valuable for helping detect/prevent edge case bugs.
>> >
>> > The argument against guaranteeing success is that we might make our future lives
>> > harder, e.g. if it turns out there are legitimate, hard-to-solve edge cases.  But
>> > I'm ok with that risk, as it seems highly unlikely to be problematic in practice,
>> > and there is real benefit to guaranteeing success.
>> >
>>
>> Is there really a need to commit to anything? This is already documented
>> as "can fail", and it's orthogonal to whether the memory was mapped.
>
> Yes, but the above docs also say "it's userspace's problem".  Which I generally
> agree with, but that's not a very good story when it comes to KVM itself taking
> transient references, because then the answer becomes "Stop running all vCPUs",
> which I don't like.  E.g. in a very pathological scenario, it's theoretically
> possible that conversion may never succeed.  That's what gives me pause.
>
>> The transient nature of refcounts on pages in general makes it hard to
>> guarantee, and this stretches outside of KVM. I mean, anything could take a
>> refcount on a page in future and we can't be auditing the entire kernel for
>> no refcounts on guest_memfd pages ever.
>
> True, but at the same time, if there were never any VMAs then I would expect there
> to never be transient refcounts, modulo memory failure.  And it'd be easy enough
> to document the memory failure angle.
>

I think even modulo memory failure the contract in mm for pages is that
transient refcounts are allowed to be taken.

>> >> > As for in-place conversion, this is not a blocker.
>> >> Sorry. I didn't intend to block in-place conversion.
>> >
>> > LOL, what we intend and what happens aren't always the same. :-)
>>
>> I don't think we're ready to guarantee conversion success when guest_memfd
>> pages are not mapped to userspace
>
> Yeah, that was too strong of wording on my part.  The needle I was trying to
> thread was "conversion for this specific scenario, in a controlled environment,
> is guaranteed to succeed".
>

So I think we can only specifically fix this case Yan reported.

>> without dragging this out way further.
>>
>> I'm all for KVM not taking any references on guest_memfd, but I think
>> eliminating KVM itself as a source of transient refcounts can be a
>> series in itself.
>
> Yes, it would definitely be a separate mini-series.
>
>> KVM not taking any references on guest_memfd memory is definitely welcome,
>> it'll pave the way to using non-struct-page memory in guest_memfd.
>>
>> It'll come, can we not block on this please?
>
> FWIW, it doesn't have to block initial merge, just the final release.  E.g. even
> if we decide that this is a blocking issue, we can still land the in-place
> conversion series, so long as it's not exposed to userspace in the final release
> of 7.4 (or whatever kernel) without fixing the transient refcount issue.
>
>> If we find a way to strengthen the guarantee, wouldn't that be an iterative
>> improvement?
>
> Yes, but we do need to draw a line in the sand.  E.g. if conversion failed 99%
> of the time because KVM was taking spurious references, I think we'd all agree
> that needs to be fixed before the code is released.
>
> I'm still leaning towards saying this one has to be fixed, because it would give
> us a solid baseline from which to start, and a way to enforce it going forward
> (Yan's stress test).  I could certinaly be convinced otherwise, though dropping
> the transiest reference seems straightforward enough that hopefully it's a moot
> point, i.e. we land both in 7.4 and don't actually have to make a decision.

Sean seems confident enough that it's a small change to drop the
transient reference so I went ahead to put together the series [1] so we
can kick off the reviews.

I'll follow up soon with some testing and report on the other series
[1]. Yan, if you could provide a Tested-by on either series it'd be
great :)

Please send your reviews on [1] so we can make it for 7.4! ~7 weeks to
the soft-close of 7.3-rc5!

[1] https://lore.kernel.org/all/20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com/
