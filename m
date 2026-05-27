Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0EC387574
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913057; cv=pass; b=c6DKamIoPsWaz0ovvfkG+Oc8khuzdvmoLiJKuRHEEj2OIEdIWUnKDcDXlZOHTausw1IwL3PiPLoU2koMSPBvp6CXc7fZhgPRBYiE7xSS2wkP5m2pGRVucALHvJRBUNvv838yN9+eRFvph/YSejR0IItYn89OIe9HkBF58xy5Zb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913057; c=relaxed/simple;
	bh=D97WCjEUn3j/vQRA7CTe83R6yLyzMyBDDHUoRbcz52Q=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxpvzMGcI8x6uLrjjgNagR5E9NygrF7J7ve7rR4Li4m0ZTjwShM2W0sDT16HR1m9xCSEL26vPQsh5RkH6LLyVQ0flqLbw+H1Uj5SCRciapt16G+kqYPFKOwCVLukfEDn/AoZWfUJq5NESomyS22Hq1J4Q1JuwhTFgm6pHYRYVHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rgmD8zpI; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rgmD8zpI"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-134ac81c445so21044737c88.1
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 13:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779913056; cv=none;
        d=google.com; s=arc-20240605;
        b=N8Mybw6JNPjosAxLXPi5UmxBEyU5coM2FDHIAvDGA8f7sXW72BnLYaorvwI3t66xtC
         CdBpwHJB9ixBk+FodQ4m4rJWpajcjjlkudtjieSt5N5f4sPUXzfEMBrZK119yz49+612
         tYDUUUQ5g1O9TtRs+R+5AyATTSwyeyTUzIK/XETsN6Gjl281C5LpiDx3+wrdAQpYoWvO
         Z9t0WiuMeCW780w7bcfQUlHYOM1vcYpTvXa8Mub8PMUx8nHkM88zwG6sQ2i78AlZUhPD
         ZzwnH5EGMQjFQWE/yVlZSPFyt6mbUi6yXkdz1aQmcLf3RV6kgnD7X9XWCxsuwmVdvZ+w
         TldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=8vW9yiVSKiux9kpNjpgYi3apIQhlbRURD4raj5ZwDmk=;
        fh=NtRPzkBvfu591LrnvVW4ulJDcZ5X0uPqH+aBFnQm9u0=;
        b=CJURdREnWOdmvMsT4qk4rgycSNV9GOiVCEW4Y12fozeAX3WHU40llxg63dW7BGVnnw
         JrDoHVFPA3ZovcDHAgVQrpb/cH7NjUl1JBOYam2KsukOGuf6DTF2RCiezZNHJQAhxptN
         Y+S5Gt5tHuyGvYPWBzq0k3qufxw+3FH7cNmxSnifOzkalIx0nITcqShGVhVP+nuElmek
         9IC11DFXseiBqkyASrS9zW7SFs8+fGNkERdNJErvflSwcfeuP5NN9hiwoMhkw645nVh+
         7mOpidvOYj/WPpvjmYGfIycKUOBbE9r/hCYjpBnrgUrpAsyguokMcdXF62lF3qm72B4e
         Q+5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779913056; x=1780517856; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vW9yiVSKiux9kpNjpgYi3apIQhlbRURD4raj5ZwDmk=;
        b=rgmD8zpI/yAuKYuUgNqfoAZCQvcQ30oTvQc7WXy958oZyvsky0rX2CRe0sKCG7VNIh
         xDBQhYoVUl/lX5MTyNLCP31lQXdnnLD1+jvqi86s0zuw5AbN12+Q+ZsyDBzxBwY9gqi2
         yPLPmeHZTeh0Gs4bKur7TzEY/lpqg7ConouTYVBMIDf0X6kIhJUk9HOfxsUNBVpW0y9v
         TDxYBTUCSkYRSyyREsr76684js77ED2ThFTGmiOUhCMZ2vdMIjtzkznJsjN8PRJ1hpJ4
         U10IZdgrTJH2v4Mrlg3aVcIe7GdULkZ3mfeeDv4XZqcpmqriCalY+WfYrTtD4LC0VP78
         6LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913056; x=1780517856;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vW9yiVSKiux9kpNjpgYi3apIQhlbRURD4raj5ZwDmk=;
        b=EV7LrU310i1r6ck7M3qqKoGbeFx+nUJJaagPsys384LD7sBh+uV7Im23DbKjFA5mbd
         IlkUxF/R+aQt9WlljXroX7NBNCdyNVQJzSkAlt7TrVkS10XH4fuQMRHWEkDinrP7klqL
         lLCDYwlcHCzPRWI1C5qqlXASQm3Pd7hTOpVZ0P7USOF8H0Wp8bZoBUpeYHXj818HUXJV
         Y5ubv4/C9SiKP3bu8fqBKHdgzaDkgGw0ySRSjaUGA5XpQYT6K5S+wuRr99JiAucUBB4l
         O8wl1JUL0XOnkMF9CK1845CLDAMSapR422roPD0JrsqpsDwiJ78F8D1+WuFvKUohEFIV
         DsFw==
X-Forwarded-Encrypted: i=1; AFNElJ/ynQSHqhwcOpF1dfQzzxwzOtNgn3DIBWO/8j6iOurscESoPN/HfHav3QxTQ1Tqu+JccXMtMmi+tXGT@lists.linux.dev
X-Gm-Message-State: AOJu0Yxiralb+T0L2WOwf3+CJxLjSnlibg/wc8h1hu8Wk/CyeZPdTytO
	IAvmw1vMKlFvVe2Z/HQ2xQoj+onjZn3aomNPueCw2hWe4Nq1yaSrfN4ARLmmjq8fqOBNOaMJEMD
	pU2aMIDJ1eMHbM8wOGyb1b+qksFlG3tLRc4oxPL78
X-Gm-Gg: Acq92OEAgzDzE2CzDY+UJptIEiCjgE00xTeS5uuFh35dzNF6UuXS9Mn3N5xc3yWSxPU
	9GvP9QLkRhXEt82sAhWWVcxPDk4cQrRwflHBwUELKnliauW0E3TRMUqSxDp/H3Cj8zNH+Jg/S/k
	t3JkPFrjmyqNateotsJdknj+DQ1BYOwhWX0Pk7yX5Vb8cbPgFEsXDVWb/yqL6/DCPLz42miq5oW
	E32qzIkxBce/W+hm1KjDO/uibYQPXUMHU2HI9yfajXAMInMmjUejrYED59f4aOUc1yHgxsV7lvb
	pb8E6pVd4iSrO2gBqOZSrWl6PjFaqGQZ42rNNenD6Jx7w4oAdbICHWgoq756wm1PgP6h0b1xbGG
	s3Xo=
X-Received: by 2002:a05:7022:f313:b0:12d:b7e5:a67b with SMTP id
 a92af1059eb24-1365f81e628mr4828248c88.14.1779913054985; Wed, 27 May 2026
 13:17:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 13:17:34 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 13:17:34 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ahdFSxXnWhhsjhKe@google.com>
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
 <20260522-fix-sev-gmem-post-populate-v2-2-3f196bfad5a1@google.com>
 <ahXB_tBWakUUjt6q@google.com> <CAEvNRgEN6syKVLjvFX-s=xU=r3CBZ3KtmeKvVYOC09uvFGXSFg@mail.gmail.com>
 <ahdFSxXnWhhsjhKe@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 13:17:34 -0700
X-Gm-Features: AVHnY4LTkCqwZJgAdbJtHYJu60g77wWFGV10HPdHsIfRUwfgRQ4VgItFe8O8W08
Message-ID: <CAEvNRgEW8nph=Hz-3pcQD7ZxRuAOcjcOfj8afgJMsRgESD-Wbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] KVM: guest_memfd: Fix possible signed integer overflow
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Zongyao Chen <ZongYao.Chen@linux.alibaba.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> >> [Use size_t for size instead of u64]
>> >
>> > Why?  Oh, right, because kvm_memory_slot.npages is an "unsigned long".  The
>> > discrepancy between a u64 for the offset and a size_t for the size is confusing,
>> > as they are both conceptually in the same "domain".
>> >
>> > Rather than u64 and size_t, we should use pgoff_t, which is what KVM already uses
>> > as the storage for kvm_memory_slot.gmem.pgoff.
>> >
>>
>> I picked size_t more because I thought it was semantically correct to
>> use the size type for a size. size_t may have different sizes (64 vs
>> 32), but in the comparison offset + size > i_size_read(inode), size is
>> promoted to 64 bits, and signed inode size is cast to unsigned for
>> comparison, so I think that works.
>>
>> pgoff_t is also unsigned, but I think that should be reserved for page
>> offsets/indices?
>
> Just to avoid confusion over the definition of an offset/idnex:
>
>   * The type of an index into the pagecache.
>
> I.e. it's not the 12-bit offset into a 4KiB page.  Which I'm pretty sure you were
> saying as well, just want to ensure we're on the same page.
>

Wait yes I meant index as in the key if you think of the xarray of the
page cache as a key-value store.

> I like pgoff_t more than size_t because, for KVM, it's really all about addressing
> memory, thanks to the offset into guest_memfd being associated 1:1 with a GPA.

The offset into guest_memfd is associated 1:1 with a GPA, and this
offset is

    offset = index << PAGE_SHIFT

> It's not perfect, because GPAs are tracked as 64-bit values, whereas the kernel
> restricts itself to "unsigned long".  But that's a non-issue in practice since
> guest_memfd is 64-bit only.
>
> But conceptually, I like tracking the gmem offset as a pgoff_t to tie it back
> to using GPAs to offset/index into gmem.  And for all intents and purposes, gmem
> is nothing more than a glorified pagecache :-)

So we actually want to use u64s for gmem offsets (where offset = index
<< PAGE_SHIFT), and pgoff_t for indices, since indices (aka page
offsets) are semantically the offset, counted in units of pages?

I pulled this conclusion together from filemap-related code like
filemap_add_folio() takes a pgoff_t index, so I thought gmem should
follow that and stick with pgoff_t for index/indices.
