Received: from mail-qv2-f20.google.com (mail-qv2-f20.google.com [74.125.230.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10951A14D
	for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.148
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750594; cv=pass; b=dOlKJhJChF8Y+35Ge8IJtNJfjVCuyEiDXQciqXK6GFCsWLRXYSDqunHAG5sH710SvCxpfHCDwdQ34aan4WT46MziJtF9Efgkc74ejxAzlHTfY0dpwQGYgTJu9nZC7tB1OATguGoLFgEvcJaGPlYv4jpFs8//1Jws556dS5UAb+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750594; c=relaxed/simple;
	bh=Q77Bix35TqUYi11B20K9mAkgbUq61MX1Rmo97L+4Qmg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmvwLI9foIj0hp7/2L2eRFgxf7RbLUzbEIM4+rD4OSQzMXb4pMv/ekubzotLl0W4Dgmo6urcnBdsXpGltY/zGR51ZDl50uLaS+llapLPdYNudf/RfRKlyvqXUoFXeoRcnDt+sztF7pztobVBmLGzUZbJMJ/BE67+CEcD42RgiPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=snnTuE2g; arc=pass smtp.client-ip=74.125.230.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="snnTuE2g"
Received: by mail-qv2-f20.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so10113556d6.3
        for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 09:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789750591; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcPgiDHrh5t/4lJ1GRY5U0nVT+w8DTHRiZ0kdTrNi95gwkyp4qbSPT2Mzza3OFF3WO
         L2KBWwd3kLKVau9KdnMboelidExfEJGY4HDvvFtSMFnphJWxlw2Il01bH7MFjA47RXfD
         tpWo8w7IjS/kahetHGCodH/UuxSy3fDWEx+nDEteoTxMxiC2Hfb5cISiS2UQQD6MJ2aI
         9X4gkmc7AhDwI7bKi3mg2AHcamyAC7HMwzFPGO5BQbNcoxry4WvT0EAL70+255tuopWK
         prlR/XfCsxuPX1aUpZdLEeCSU9HMF5K1q24oeMShWUAq/Y9908LMqO4hem4KJi4uiGj+
         Cc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=/3hfhz8Hbq1oioh3pabRNXznpcstGu9TRDyQ4WeUxrU=;
        fh=tafHgnVD4ubnx4Xfj88aqGRHoXmUUbAgxiwjRXMymhw=;
        b=DSflkTMyF89NWVAElobJPzs8aaP3INbkIxFdf432Ao9WeCjAGJTgDK9ncr9r70QNjP
         SC3d7EpnGx4gKsZe9t9el46QsogRwFbqvTwQpHVwx7TYGHkF/LGtPTC2c71RptWE6P48
         sXOEOlSj4MQI3gb/TG5tn7IOcpwIEkf12CqhDsDHsBj7paoUGwf4qW9/LAygOSYgUXK3
         s7xPKWgsIJZEvHbklohkgsRqS3sPnRNuPXadthn5uLmiPCQKenUlITKN9RP+bQDcXOjl
         rhXUZkc7wCUe+zeTzNsG+b+l4fe7shYsA56JCp7njitBbDNi6xrVvlxWxamXI/obzvwV
         R39g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789750591; x=1790355391; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3hfhz8Hbq1oioh3pabRNXznpcstGu9TRDyQ4WeUxrU=;
        b=snnTuE2g+isbN8c8PJ3Jn2KvJ1AnuxFbOXPukg+BOAAirRA63n6grECF5wldcqdBwB
         1QrGM7ZT+oA3FWFnj238X/T0miP1iz4UW9WKpTTBU3A5q+C41zJ/yoEt0xJ8GPhyaDGC
         mnDSsFctD35EX+cwbzQb31lH4BVdoUbozsXU3R4zepnWpbb8Ds6w6Vok+rix+BrDBKCj
         JwBiuw2DiO1wejh+aYQC+3DFjvSzupB5t53a/LMqzanrakCmgHs0ybWfVee2GHEWDyzB
         r0g+Tv9lt/HoqUii32c273i1bmzMdIIunlt6GZxWLmzeXd9NqiFLVgMpDxUnC27ZiiWH
         LGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750591; x=1790355391;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3hfhz8Hbq1oioh3pabRNXznpcstGu9TRDyQ4WeUxrU=;
        b=sMzBZxbwrvuw5QHNFibYhz0kj8JcID3eCd6RiWvfPS5Z2XPES+RQICuvNoqxZeFbCO
         VqTG6NgA9t3RKsbfBlSnYQqbqbRcGTvclY4qRVvEmhSaYt/NOYg9ALf66Co67fbwGDP9
         UWtVntme9hDt2fpAkIahXcbjq7JUZQIt0akR3T/5W4dMmk5sYWTr25G5sMLb87GsYZH9
         eFWhwO3E8bA0G5AMtzYJGKhehdZZx0sCjlhVWHjTJtKA+tZKnn6cfYk+2xSXqHH+HnDc
         mIBnARXn927U8TEISxMpYDJr6uKwMMrFTFMZQhaEON4iZT4xO/e2nkPMWDOPtbHLbngB
         KygA==
X-Forwarded-Encrypted: i=1; AKwUvBzBvn9ROvBeImK0NQ9ich+fNgoHG/ufJ1+3zmEVwpv5rBQ094c4p3cohRzFuOXQF/MWv9JDRpSxP7nZ@lists.linux.dev
X-Gm-Message-State: AFuF++kFzQbD3XD/1fI9Ircdgk6h65HrIKmrnKbV6x2Voa3VMO+gHfWp
	4Nv+deW5y3v+qYwpKlersHTL+KB199z0joWwBR137oVMqNLHJi0Ps/Yyx/7QiaYoNhEOSUU1e38
	nBPfHVOwlXBarIcm8Jqzx6MbRjvcZHiK+HrFxOtbp
X-Gm-Gg: AYBFou3Mu7jaQyPrAV1FeFF92tuyI+lDEoZ4+H8KKXWPea+zlOhvO+7FWLTr16igM9F
	pphTFf3vmDKZx44XbtcfIpMYQaKbBi2JIgnYdYtZ3r7ETYN/gfFFQvvoNHJlWgTpRibCBur/xY6
	+wNeaEBKc0j9ZKC22uI9m7L6OVdH47pvztPI0remhuqhYPINN0RjzdIj9lIFWxExYxhaaFhKtjY
	AieSOzddehel2iZbIDzMwgStac1+XMy4tR8la0b89z04fEm0veT3aTRqwObTRoYz3iqkOLpI7YN
	zSjYsX/ZHWUXiY4TN+pY6eTV+OrAiYzUgmwqatpn9uwDaRHHsPyhd19e1KM+fOXvJuQxrGf8I8j
	FzoAb+IF8HqvvgiVwROylozoWOn+uNPL0qiL3DcFpyA==
X-Received: by 2002:a05:6214:83cb:10b0:90e:94e5:79f8 with SMTP id
 6a1803df08f44-91254b3cc0fmr42995266d6.23.1789750590126; Fri, 18 Sep 2026
 09:56:30 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 09:56:29 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 09:56:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aqw_uBIYig_uo5Eq@google.com>
References: <b91dbfae-20f1-4b9f-a25b-4397afae80f9@kernel.org>
 <16ffff40-4ef0-4312-a700-348603f05c0c@kernel.org> <CAEvNRgGW_VHmT82q+bUqHh_5G2Z9sUF1jJOTiVN4Z8_cA9A50g@mail.gmail.com>
 <aqw_uBIYig_uo5Eq@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 09:56:29 -0700
X-Gm-Features: AcwNN1X5D8x79th8tANMR24DjHce_J2gDtrs-KgBIrDOaE8qCS7M_N_lTAQKK6Y
Message-ID: <CAEvNRgGXi0U1gWY_m5aa5fW66fAXnU+3jw2sov3eykDzodvrvQ@mail.gmail.com>
Subject: Re: [Invitation] bi-weekly guest_memfd upstream call on 2026-09-17
To: Sean Christopherson <seanjc@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	KVM <kvm@vger.kernel.org>, amit@infradead.org, aneeshkumar.kizhakeveetil@arm.com, 
	ashish.kalra@amd.com, dwmw2@infradead.org, eberman@quicinc.com, 
	fvdl@google.com, gshan@redhat.com, jackmanb@google.com, jackyli@google.com, 
	jthoughton@google.com, kalyazin@amazon.com, kas@kernel.org, 
	kevinloughlin@google.com, liruxin@google.com, michael.day@amd.com, 
	michael.roth@amd.com, mike.rapoport@gmail.com, mvaralar@redhat.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, patrick.roy@linux.dev, 
	Peter Xu <peterx@redhat.com>, pheragu@quicinc.com, pkondeti@qti.qualcomm.com, 
	prty@google.com, psalian@google.com, qinkun@google.com, shan.gavin@gmail.com, 
	shivankg@amd.com, sidtelang@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tatashin@google.com, vannapurve@google.com, vbabka@suse.com, 
	wyihan@google.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Sep 17, 2026, Ackerley Tng wrote:
>> At the call Sean suggested mirroring the RMM's tracking in KVM, but that
>> sounds quite arch-specific and it's like doing arch-specific validation
>> within KVM.
>
> I suggested "mirroring" the tracking in KVM arm64, not in guest_memfd.
>
> E.g. put a structure in arm64's kvm_vcpu_arch with a list_head object, then insert
> into a per-VM list store in kvm_arch on a conversion request.  But before inserting,
> walk the list to see if there are conflicting requests, and if so, reject the new
> request.
>
> Then on KVM_RUN, if a vCPU has an outstanding request, verify the gmem page exists,
> is in the correct state, and is mapped into the guest (or at least, is known to the
> RMM?).  If any steps fail, exit to userspace with -EFAULT + KVM_EXIT_MEMORY_FAULT.
>
> The downside to such a simplistic implementation is that it'll require a per-VM
> lock to serialize the requests.  If the contention ends up being too painful, e.g.
> because there are usage patterns where guests due batched conversions across many
> vCPUs, then KVM could use a more sophisticated approach as needed.  E.g. shard the
> tracking+locking at 1GiB or something?
>

Perhaps naive question: What if, in the complete_userspace_io handler,
RMI_RTT_SET_RIPAS reads the vcpu_run struct and passes on exactly what
userspace said was handled? (Make the vcpu_run struct for
KVM_EXIT_MEMORY_FAULT bidirectional.)

Is the issue context switches? If the vcpu continuing the vcpu_run is
not the same vcpu that exited?

Perhaps userspace can track conversion requests, like on
KVM_EXIT_MEMORY_FAULT, save the request as <TOKEN>. Then any CPU can
take the token and do the conversion with guest_memfd, associate results
with <TOKEN>. Then on continuing the given vCPU associated with <TOKEN>,
pick up the results for that token and continue.

With that, all races and errors are for the guest/RMM/userspace to
report and handle.


>> p.s. Fuad, for pKVM you also mentioned that you'll need to check if the
>> guest had requested for conversion first? This might be the same/similar
>> problem.
