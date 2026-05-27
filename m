Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9EE3016E7
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906416; cv=pass; b=lLSy96kN728uOpHY3lWt90exozBznW2MENjGjKPSWw27yHdSYej/lQzXViYvTnye/KDy/jwstu4WOVkVGmstYkAdynhqC+hV8wG0VRuGBbDzAKx7V9EX29ocWQnLdy4vNhgyiU2qbLl2zi6X+qeU+5w86A7zVucA+niof0HBx5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906416; c=relaxed/simple;
	bh=tPsrfPW5bZefyiKbaf6LHkY8HvaXssuCnsvnGM6KYho=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/d70vq5IeNDmwhIBWLqIn+lTk4W1dOw2VxVgsuzwsoRHuRJD/tvaaNKceXhbQILKOoQN8465om8f3PUuaorRLf2Ui9HdfH0kxOKFDaiDwIKC/lY3FMkSY+jg48Ojk6otOdFebWMOWQNcLQWa6ZJeWvyiERhZoriuWJQJC3JAy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E9JH2DTB; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E9JH2DTB"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1353c2f35cfso2395728c88.1
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 11:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779906414; cv=none;
        d=google.com; s=arc-20240605;
        b=hAChRyAHdXE68zDkSk58clgbrf3eTXIa1O8/eAqQX82FEVqxxMGOmL2oz7/wDb7MN6
         MUfti2tns/GqlLJaIituhq6W6/14IKgG3PjcvcsBSGtT7k4JnZeh3FmdC/Cs0fcmlwT7
         M06P6u5svkZbUAD1zVFa2nWMbiLw8P25Qa1OivIMTR3aQVRHFi/cOjz83ZipYAAd9aKH
         iEOxWwd6WnJrYi7Q34/sAoy8YtqjS6hlKhybyWj9ome4UU4+c2sUFcWRsKxBLa31jC8g
         gG49z9SCxCxdOtG1ISnylRSw6y2earhY2mZY7UCLd5euWNaXA+tCAI41cxG3cDd+DknG
         Hmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1M8LOk215LWTMh/84HS+iqt1k1lVeoWrd0lr6YJMoS0=;
        fh=znBQqTW6esY5sKMq7wMGmQf5gexTuLFu8sL9T7b7zCM=;
        b=PqHdnsvKl7eurzCY4Kf3AkO5yKq54gogZtQhRGOasBZSgKsUUyoaU+6f4z9BRP0xAU
         AYq7MIziikH8HO/g9vCGbUZ0pBRPBmESf+XYcwDJ/V+44pW/mHV3ggJXdaahr0P+VRyS
         x8CaENXafQ9wKpx2kPmLc8j0AXINPL2Oj26u52FqRdWfT8UiUiRKTfRkKpn01qMg9Aeu
         B+1XisQqIOsZDX0OSMSgLk8y+EjbnqnwuCK6rFlXPY0Z2KlpocPnlUDyBo/Ox5cM5sv8
         I4t8GLlbZUgqnco2WiGw1DNEMEe+05l7pOZUCm6Tpv8B3uJYx2O1UQTUK2lidqnAQO+U
         g+LA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779906414; x=1780511214; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1M8LOk215LWTMh/84HS+iqt1k1lVeoWrd0lr6YJMoS0=;
        b=E9JH2DTBO4NTYZzt9x3EIlh7KeVnU3iJ4EdjlkRyVnW4viIADQjtj/zvb+wtHz8zNN
         i6JgcGyXvba6La2MTOuo3YG/NtEUpKts0xID7NjBJGYsD8uE2DJ/CYJxV3jfq6Wvhx3Z
         d6kBMEpmlzw7AjUw6b7eZnfQ57x5hpqkTXbtvJc2FNHQXX34Zs9O6Klkj82Z3+24kJUa
         BxUinFVPnVMdqtrjUUg+5MnFFOm7oPhdjC70CfhoXEBDy47AQ9znYyOMBw63GLKZYHyJ
         NdXp0rRF8cHnkNeiLu0inrZbyYefuFv4LCoRjpaxVc1f2zwI4EryXRt5W1jQInI9UXb9
         sTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779906414; x=1780511214;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M8LOk215LWTMh/84HS+iqt1k1lVeoWrd0lr6YJMoS0=;
        b=hlZA5WI54S1rMxF1VLsQ9ic/jBJW9CqctV+8EmEQcp/FHclOjPt2GEOjKmj0mz/Ffw
         WByLSpnBcYFvYhNRJUy3iPh7ey//AXDYXirRWgCJ2zPImY+Df5DdVXNUwosAZzK0bqja
         NuWeje7WQtA4V22pVRBo2cl8TRJ1qGsZxO4lebNpEV1wjvw9H4ntbR0mRvdGR9UE8r7g
         PEuciEKh79mC//fMWwf81DfPq2lq1RF41JXCCeNFKy/KYFIoh9btYBZxBkFLr07JMK9a
         l4aLCJpwqK/8AHSOvMCTRyEwbpi9VLnWehyVWHkVKzJF1x40kUmShM/TZGPU0Pf/m9gk
         +9tA==
X-Forwarded-Encrypted: i=1; AFNElJ8+kFui0IItGYocjDRfMVnotq2i5whESu8bx2QLhoImkRuQVjnOb87bGYPTwu4zXiwWtRiHj9ML8bMA@lists.linux.dev
X-Gm-Message-State: AOJu0YxqeL6j25iWbnMFwP+PdQnGR/jBF2+osDcm01ar56K+3sQxHKq9
	rO8D02jYkYxX4QxPetPsdBmvm2CGaARzU2PeZ8spt4MbFyEAJDbxKDjrkVrfFu0qFtRnz4GLyvI
	wo/WuEUEe8IgVu2it5mDR9rXNeX7xkf7SNNiTaKXb
X-Gm-Gg: Acq92OH2lFt8WVw28hU2fsWRzUj1ythFw8mlwym152Znsvxp6adoo7CvUHTvBQSBcEe
	SOzZqAmUSLGRvcl5pBamweVTZZX1xvdAfbzB5d6+GDZBdOk8H8QUH6Vws1uzaUcXfgNwx8zbmJm
	Fiz04rDC6J3dcBNRe7am66TjW2b08qa8iT8SXzUUsbaEOUSt5B8i3UrmR57P/Tf1SZyUoIGUU8y
	9vL7/+N9aCN2ak4a56hNNrPO+rmpOPe49ZDvLSf/liJkJIIVn0jweJYrlkGlCTZijEp1QSmu0LJ
	/k5AOgQjumnJ1sZKIK4SdG08a/lSmAONUNQkZ+Ba+MddC5VWecGPYfon8qQOt+Is6Y4i8s/FY8s
	POvYe
X-Received: by 2002:a05:701b:2213:b0:136:6d82:18ce with SMTP id
 a92af1059eb24-1366d821b5dmr5566033c88.23.1779906413085; Wed, 27 May 2026
 11:26:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 11:26:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 11:26:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ahXB_tBWakUUjt6q@google.com>
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
 <20260522-fix-sev-gmem-post-populate-v2-2-3f196bfad5a1@google.com> <ahXB_tBWakUUjt6q@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 11:26:52 -0700
X-Gm-Features: AVHnY4Ls2kneN5XVP2dglAqAa4pgbDzMnuIqiys0DrGdKxZiolxkE6U_yQMFg7A
Message-ID: <CAEvNRgEN6syKVLjvFX-s=xU=r3CBZ3KtmeKvVYOC09uvFGXSFg@mail.gmail.com>
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

> For shortlogs (and changeloges), when possible, describe the _change_ itself, not
> its impact is.	Sometimes "Fix xyz" is the best shortlog, e.g. when fixing build
> failures, but here, I would go with:
>
>   KVM: guest_memfd: Treat memslot binding offset+size as unsigned values
>
> for two reasons.  First, it provides a lot more context for future readers, versus
> "Fix possible signed integer overflow" which doesn't even capture what flow is
> affected, how the overflow is being fixed, etc.  Second, if the fix is wrong,
> incomplete, etc., we don't end up with a follow-up patch that start with "Really
> fix ...".
>

Thanks for explaining!

> Oh, actually, three reasons.  This doesn't only affect the overflow check.  The
> check on a negative offset is flawed, as it means KVM would incorrectly reject
> bindings with (comically) large offsets.
>

Makes sense.

> LOL, four.  There is no bug.  The size of the memslot is ((1UL << 31) - 1)
> pages, i.e. 0x7FF_FFFFF000:
>
> 	if (id < KVM_USER_MEM_SLOTS &&
> 	    (mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
> 		return -EINVAL;
>
> and so "loff_t size" can never be negative.
>

I think the bug was that the sum of offset + size in kvm_gmem_bind()
when interpreted as signed integers could be smaller than
i_size_read(inode) and allow binding.

So IIUC even if size is small (and not negative), nothing catches a
large enough offset where offset + size (interpreted as unsigned
integers) doesn't overflow, but offset + size (interpreted as signed
integers) overflows.

> As for the offset, the negative check is intentional, because KVM_CREATE_GUEST_MEMFD
> takes loff_t for the size, and so an offset that is negative would also be larger
> than the size of the file.
>
> I still think it's worth taking unsigned values, because teasing out all of that
> information wasn't exactly easy.
>

Yup it's still easier this way, and your proposed shortlog is good.

> On Fri, May 22, 2026, Ackerley Tng wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> The caller, kvm_set_memory_region(), checks for an overflow in an unsigned
>> u64 guest_memfd_offset. When guest_memfd_offset is passed to kvm_gmem_bind,
>> it is cast into a signed 64-bit integer.
>>
>> Hence, a large 64-bit offset could result in a negative loff_t, which could
>> result in the overflow checks failing.
>>
>> Make kvm_gmem_bind() take u64 instead of loff_t to consistently deal with
>> unsigned values to avoid this issue.
>>
>> Fixes: a7800aa80ea4d ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> [Use size_t for size instead of u64]
>
> Why?  Oh, right, because kvm_memory_slot.npages is an "unsigned long".  The
> discrepancy between a u64 for the offset and a size_t for the size is confusing,
> as they are both conceptually in the same "domain".
>
> Rather than u64 and size_t, we should use pgoff_t, which is what KVM already uses
> as the storage for kvm_memory_slot.gmem.pgoff.
>

I picked size_t more because I thought it was semantically correct to
use the size type for a size. size_t may have different sizes (64 vs
32), but in the comparison offset + size > i_size_read(inode), size is
promoted to 64 bits, and signed inode size is cast to unsigned for
comparison, so I think that works.

pgoff_t is also unsigned, but I think that should be reserved for page
offsets/indices? Is that the way to think when choosing types? What does
"domain" mean above?

> I'll send a new version as a standalone patch.
