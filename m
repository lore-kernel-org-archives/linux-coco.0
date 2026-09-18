Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD197513567
	for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748507; cv=pass; b=DhJNqoVkEPAM4cUR+KhW7Y3TqB3Y0hJ4Irv7E70RNb+MoHzI/p/R/g+ySUGF5RXAvtdMn4d4yGrMg9wPieswvPCYv6nITM5gnAlS5B6OiJM9y7oQ2PtPNMxDFuzDog1Y8a4ETKdWqchna+paM8N1a/YCRjYmMu6t45ocUpjGVDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748507; c=relaxed/simple;
	bh=92e2B6l5UHLzgZdhht9iA2YtEd1cLvpyijzpt6AhHc8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8BcZCLuLR9aWLXaYK4mHswEyEbKuA6aQ5IcUCZObH299SzHgP8RQ2JtrN4B2AeTMcu9nhQBAohC9Rv9dCjNUd1141NlBCyOPz9MvvKhZ792K/HU8jxjy0yKysvIW2OOadR6w9n7MWU6xf2MvtIiMBZFVGvPCSnWd45/bGglaC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OIbBsOjw; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OIbBsOjw"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90ce6d5271dso5064016d6.1
        for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 09:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789748501; cv=none;
        d=google.com; s=arc-20260327;
        b=bz5OBlQPwzGA5QcqyFrV+TwB2ywoPN9VoQfWFRx3+Zl0egdl4KhKrrsxSLqEOjs6qb
         KT8PBZ5BtxshheHRV9PCcnbo/B+8sAkNFqBLOGBO8gxITNwzsVOdRsDYEOPvvK7m2ZVg
         uVF/+ZS1s2nqJGBPC2d23p5ClCGvY163dHDlvlDEfYXMe58k3h2+16vEq5yjN9tqr23P
         qr3IQrIdgJo8+1+wEeHxEsHMqV3R2FWVMdmmkdYD+X/O4ma44WlQNC5x4vQHM6L1k1uk
         Jk6ve0JkMHTgjODlhhCbofKRDFdilbeyeF2Y7fA3s9l/wgfbmzMtAnnk2ik7DokmuS/y
         7MhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=k0idDGjqorNV8cxfogOvoluFO0wsP95B4F+1LnnDxZI=;
        fh=paZyp14UjDYW9hJYigCLLi8uhVyDiuyBLJXWVHRicD4=;
        b=GABdy6AA4+3wVvvHphsS2cWsQyaMPuovEJjqODdFVmUe5INqiSEHHr6Nosh6+i67SQ
         Yo1ekCMAh1oPmHPb07bVWGQbdiTVD3bAvMDkwLVWoYTcGEOjND6Z5MGuIBaQrybEcOGK
         NYysiEApiWGkno2HqQTHXWwxOygVUat+kqPzat5yP0IFbEj1zL4W/F2milDseIOZcDJR
         ih6WGmo/IUDWjqFBCcKV3R2gmIKRnO7iPMsuZGBDDpNRWBwnFcqOJA9Ql79RqcuxUvln
         1POeize+KJmZy4W0Ryd+qJ971Dlt8fsFbeBtQUrcFGAJ0lECG1AhK66du5z2+GaoR+a6
         Z0+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789748501; x=1790353301; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0idDGjqorNV8cxfogOvoluFO0wsP95B4F+1LnnDxZI=;
        b=OIbBsOjw9FriOo/PBdDG/a4YeuwkTC731/lmXytBufg+3SPEFYZaTHEB0dvBA2d/3h
         3v0W4AFOXl+WCPdQL+WJneKvFR70Po8U38T6NIWLRy70FzmH7ilQiaK+fk/CqfslqSOL
         PNZopNdfBZ1sMPb1gUMNGxBNvFJMFVdkEK7qGWwFzBFo+2zeCeguVvYI41MZfDi1ArbF
         awhHtJqBU02dhkZ8U52BufiD3tSHbZ8leT5X08MK83Elmv2X/4x7A6ZOGVSohpqhPkan
         olpXy5Eu7BA1v0/OkoyyBAyWWd+ukWjWRgOeWtkHUPAF0PG5Z5xv1yBZQUhtrjOnSw2c
         0AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748501; x=1790353301;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0idDGjqorNV8cxfogOvoluFO0wsP95B4F+1LnnDxZI=;
        b=iDxvGt+n9Kjl9x+5G1qw/XuyGgENiW0Qg/a0bHKs7808iBedl9hwXnkhcaRamD/kKi
         C5stX3/PK/GYiOgXEaDQYRv6fZ+5AvyWV6BbbZfx9kyuIKM8iQmRr5/ocQnA7JEr8cpV
         DhIp8fbXhR7rmZBbl757o92IgGbXNbNChd/VikocjmC1gnNoRFcBgJg/JTEiy7fMV8cr
         xP/r5dCZUEhCfSvidQ0zCjDctFN8sQByOfho77Sjv1pgsajoaMWcmiJhsHA/Aj0iqXvd
         ydfnfUaLLtqdGnUSPLVUDd1GF8SP6LO7sWwx66FBH8BgrtrQ8ALSq/zjII3/Lb30pNLB
         cuyg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ3hyJEV+ozuF4t3EFBgrplFOVc/1k4CjuXJxlywdQMAF7AZypemJvv63KZOL4UGjSYezSQtIbf4g9@lists.linux.dev
X-Gm-Message-State: AFuF++kbS+uKVo13vPJlJJaPwzz1XWh19sW7jcmZfNwTN06BAM7ypZQf
	Sf0X9Yvu4dRQgXvonbMRYZNZU8IB254DGS7LYD16Bt4wgQ3NH+NVDBz69LX69Xb6JNxQilglrva
	P4tQAFmBc5QjKcccZmqhdMzFK5i6Gxz/kOHIxczQv
X-Gm-Gg: AYBFou1n8lgo7aRGeY9CwrAbeTJqAbNd8slAoZZ8KqrCtzcE6DGDgSTxoU0ymwyy2+F
	V6PHq5eJmMroLeEFAfVhiPWvE+BNFEpHkdE6wPCCsQzxdu7ojkf9gJ6s1RVUUyWz0KL/Zj4ZQUP
	2gAQIZqxAI10aJgNCpBTk7wXT24BQWkJAw7GxO1nuDZT7sR/sLnrKZ3qDPgUA6YeaK4RiM9PU1X
	c4I05ouQs9Lkp0Q5VUtbf0gsKRTb+h/JD4SfyWkS8s5v0CTwtwaG2lnpDEDjqF0VlvfBRu3z1Fl
	ojtM8ZtkTUKNaNkYPt51acGlK/ZC3owDtYl9c9HZLBFH7BLccJINKuecxqNinXANxGSrN0eTS9d
	wgUkVHWwZll3XRXwJeSJ8HY3KSSClVt9yGze2bEQDNSY=
X-Received: by 2002:ad4:5421:0:b0:912:3b29:6580 with SMTP id
 6a1803df08f44-91254e64effmr32593386d6.7.1789748498548; Fri, 18 Sep 2026
 09:21:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 09:21:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 09:21:37 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <e4bcc676-34d3-45ed-9eda-51c9a60e977f@arm.com>
References: <b91dbfae-20f1-4b9f-a25b-4397afae80f9@kernel.org>
 <16ffff40-4ef0-4312-a700-348603f05c0c@kernel.org> <CAEvNRgGW_VHmT82q+bUqHh_5G2Z9sUF1jJOTiVN4Z8_cA9A50g@mail.gmail.com>
 <e4bcc676-34d3-45ed-9eda-51c9a60e977f@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 09:21:37 -0700
X-Gm-Features: AcwNN1VzIl6ghPHchCrZF-oxqNdlGOgQjEVdlVOzWvyHTDDXwsaSi3qVUbQZQCE
Message-ID: <CAEvNRgFAL6qtSiJpQuga_TxWBr2pK=9LoiON+ZARMp0xFA8rPA@mail.gmail.com>
Subject: Re: [Invitation] bi-weekly guest_memfd upstream call on 2026-09-17
To: Suzuki K Poulose <suzuki.poulose@arm.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	KVM <kvm@vger.kernel.org>
Cc: amit@infradead.org, aneeshkumar.kizhakeveetil@arm.com, 
	ashish.kalra@amd.com, dwmw2@infradead.org, eberman@quicinc.com, 
	fvdl@google.com, gshan@redhat.com, jackmanb@google.com, jackyli@google.com, 
	jthoughton@google.com, kalyazin@amazon.com, kas@kernel.org, 
	kevinloughlin@google.com, liruxin@google.com, michael.day@amd.com, 
	michael.roth@amd.com, mike.rapoport@gmail.com, mvaralar@redhat.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, patrick.roy@linux.dev, 
	Peter Xu <peterx@redhat.com>, pheragu@quicinc.com, pkondeti@qti.qualcomm.com, 
	prty@google.com, psalian@google.com, qinkun@google.com, seanjc@google.com, 
	shan.gavin@gmail.com, shivankg@amd.com, sidtelang@google.com, 
	tabba@google.com, tatashin@google.com, vannapurve@google.com, vbabka@suse.com, 
	wyihan@google.com
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>>
>> RMI_RTT_SET_RIPAS() is actually saying "host permits the conversion from
>> base to top", it's not telling the RMM what to set it to, this is also
>> different from SNP.
>
> As mentioned above, host knows the requested "RIPAS" from VCPU exit.
> RMM knows the "RIPAS" from the VCPU object.
>
> Now: Privates vs Shared is translated to RIPAS_RAM vs RIPAS_EMPTY
> in the CCA (well, roughly)
>
> RIPAS_RAM implies, the GPA can be mapped into the private address
> space of the Realm and it is integrity protected. Host cannot
> replace the GPA with another content (it can unmap and DESTROY
> the GPA mapping. But unless the Realm consents to replace the
> GPA, again via SET_RIPAS request).
>
>
>>
>> Interestingly RMI_RTT_SET_RIPAS() also errors out if the current
>> shared/private state is different from the one tracked in the vCPU
>> object in the RMM? Did I get that right? I'm looking at the base_align
>
> Correct.
>
>> Failure condition, where it says ripas_pre != rec.ripas_value.
>
> Please note that, in such cases, RMM needs a deeper page table level
> and the error is RMI_ERROR_RTT, indicating to the host that:
> Look I need a deeper level table to satisfy the request.
>
> e.g., base = 4K, but walk.level = 2, and ripas_pre="private"
>
> i.e. the requested base is mapped at L2 as block with "private" ripas.
> If you want to convert the "base" to shared, it needs L3 table. The host
> would follow up with RMI_RTT_CREATE and then retry the request.
>
>
>> If two vCPUs race to convert the same range to shared, both vCPUs would
>> have rec.ripas_value = private. The first conversion would be fine, but
>
> nit: rec.ripas_value = empty (shared)
>

Sorry that was a bad mixture of pseudocode and constants on my part.

>> the second one woul see ripas_pre = shared but rec.ripas_value = private
>> and would definitely get an error?
>
> rec.ripas_value == empty (shared) as per the guest request. And the RMM
> will find the state is already "shared" and would confirm the success
> back to host.
>

Oh yes, my bad.

base_align says (rephrased)

  if (!AddrIsRttLevelAligned(base, walk.level) &&
      ripas_pre != rec.ripas_value)
          return RMI_ERROR_RTT

Is the alignment check to do with another vCPU splitting the record in
the table?

Why compare ripas_pre and rec.ripas_value when the level is not aligned?

>
>>
>> And there's no "accept" step in the guest after conversions, which makes
>> it different from TDX and SNP.
>
> Correct, the guest "permitted" the GPA to be made private with unknown
> contents anyway. RMM guarantees that the "data" is scrubbed when the
> GPA is made valid. The advantage with this approach is, once the
> Guest sets the RIPAS_RAM, the host can lazily donate pages at
> fault time
>
>>
>> Difficulty in using current gmem hooks that SNP uses:
>>
>> * .gmem_make_shared() called from conversions doesn't have the vCPU
>>    context, finding the right vCPU context is expensive.
>>      * Sean, don't we already iterate vCPUs to find VMSA pages to kick
>>        the right vCPUs?
>
> We could keep a list of VCPUs with pending set-ripas request for e.g.
> Or before the vCPU enter, we check the state of the region and
> do the sync with RMM.
>
>> * .gmem_make_private at fault time is too late
>>      * At the next vCPU enter, the RMM would already read it's state to
>>        report success/failure, and there's no fault in-between for the
>>        .gmem_make_private to happen.
>>
>> At the call Sean suggested mirroring the RMM's tracking in KVM, but that
>> sounds quite arch-specific and it's like doing arch-specific validation
>> within KVM.
>
> Suzuki
>
>
>>
>> p.s. Fuad, for pKVM you also mentioned that you'll need to check if the
>> guest had requested for conversion first? This might be the same/similar
>> problem.
