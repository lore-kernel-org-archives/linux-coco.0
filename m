Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A2D43F09E
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389120; cv=pass; b=u4Q57KLY3pgTA2ld5AUTeZmPa5bk2sc6SlaEGKlbEg+ZaUomTAGJDbeE0akiXvTPUZb9j+oK3AolGPI1elx8UF/sHeGABNurypFH8uojm8VmFTirxGU3jlPkM99qNXOW6Sde4eAB/Qck5iqrU+WjgtgOxnOK3xIjIHq4DfaBUr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389120; c=relaxed/simple;
	bh=qAsxrt4aKm/2jD+D94DvWn6jQ/0j2S49WH6opo5RYcg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsoEmv+P5y960yCOaWFN98d+17mNGwrg3z/dGMV4lcKgyzeI4Zi5CzAnykSUx2n8okrmj262IzTnSKgBPd4pUFiK+xsy2hSJPahJtmu0vyu+NO7iFP0VOPpo7Rgjk6OtZUhkM5iTmKjt+6NLfLFLi0Z0+Rc2jSQ4yQQlxSiYsBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DHvmy+XJ; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DHvmy+XJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so194263a12.0
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 12:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786389111; cv=none;
        d=google.com; s=arc-20260327;
        b=mOYZ1qtD9RIZJkxTlSxPTdTB2RPWVCFncXyaGiCuWIDXvhPuskvCQB6yQWlH6cO051
         Y4pd3BlcAg/3sE1LBevZNBNBKEV9DeRqTagdnMwReKKczdXy4x+6MjdzBsIuApSlHTSE
         mVJ3GWrw80sSEEjsmBZVCsK+i7EGbcjOaHP4kcbjsBF4oNtvRetPwErSB6h3AtOx61av
         6HunheilEkhjY8NU5xshvK+LWMzD7ILXngJhd2o5N3jseHAgr0xFgwJrcmmGhFcyjqW5
         wwbnp9m9eC4i+k1g/zQe80+SH5Z+K5wFV9ylWdaOmiEI3MjVU7XB3VClvMeHwePgqrLk
         ghqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lTbNU28ri9zZ2toTUiO4PyOFIf9m/AozcuO/ntOhi+U=;
        fh=AapFMuAOUDS2ypQgl2fTTIsHwXkuSNrrp1YQGjiGHO4=;
        b=aEUkJ9Kl0GDJdtjYU8HqJS+VvwI5ugmd5ZfeDeE3wsTa3j/Zp3h7lnvgRMbTLh2Wew
         FuJ4yJPuMDbVzAcvm0qQF0/inkqdEolcyOjMzqOg5Xqltxb0LTCpNFhLfDBIZQsn094N
         hofh4Y/liyQTWC0CBX7yp5jHkrHhuR0VMXRQDLEvtz7h8V0pm06O6VEZytHIq9XcLG//
         o2+XNuo7sFwHc/9OGWAvsJkDAc/6Y+LAuKXZ5r7h44Biiyqv5yLoYoOZHPPrI6Is7vT5
         JXLAKJ926wCi0nK5+9I4bGbgdrdQMVMdLWEjSU7gGnGO4ExVuIui6AH+12XQgLDQkACI
         c1cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786389111; x=1786993911; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTbNU28ri9zZ2toTUiO4PyOFIf9m/AozcuO/ntOhi+U=;
        b=DHvmy+XJ6kI3fhgUFD6gUVNIKIIrF98tYupgwhTJ/l06uylyV90RgWfzoRaXT/VFEP
         HsRqinjKbU66gjM/yOpzbrp+f9IRC+dcmZ3K0VqbDV5YMOIa595CHc/lfcPs2umylJXj
         vO4pljQ45Uo5GK7VctebhWxLSO6xw+fapz2ib/TDLHwAQM7eLgoniHxaxwRGDU7WeU/v
         DgPJVh9pFa7SMN6kVBr2od1M2mvaDt1DEoyZ54fiuhJEy3qNgVKmIyC0NgT8HWpPB5NE
         9ObikAU5en1Ygmd8yPrWalnqUllXjcM7Tm+6F5rWnUlXAwCoW4TxwfLGakSO0FBHifEa
         3yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389111; x=1786993911;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTbNU28ri9zZ2toTUiO4PyOFIf9m/AozcuO/ntOhi+U=;
        b=h+YByslElLctXvtN1e0TCSqNigkWZPw8uWaHAFK91HZQgN2fJksNf+omj/s3kVLp4n
         mpuErKYMWVUtcmqq0Ik8eqg9jSz/Ld7SNyp08rC8YSbQlNIHi+9ZGGuH9LK4im1gIpcl
         Xa0EJnfEkab3+dZ4WhE+sHeo88PpoCs+77QlLi8MF4zQ8VjlJ+SSCH4tcfk7Ee0tlBHC
         TojiaHCur7W9OfK6Gh7zMYQ3bZUpS593b2nbF553gLnqgzdQJKrFevOwkP9pL3KOX4NL
         IxlcNb1xnzslY/ZkhsnEmVF1FHbODCy/FRsp4aPM/x6abDKqKlJCynRW9xXHP7u/jTug
         aMWw==
X-Forwarded-Encrypted: i=1; AHgh+RoOabbc4BeWGrg911tZrcTwgrJ/XYj+IVGjMDQGuycnac3nG3HmjZVDny21eQmYJZ42a1zGotQbfTuQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwnL4UgB9cVL+Sa6JNsexeoChwFAfPm6RpJ7b/lm8TdK1lX0cPu
	iVU3mKPd1Ol4gB5MqpU4kfyRp59EIAaJexDEPLNBWJrmwO2h8m+qnKd5gY+J6gHVU7d7oYXwjh2
	3N+9yqqAp+aQAcLKK05BPed7TncXrlIMNDknv1KoE
X-Gm-Gg: AR+sD12FPhdHkQUK+pwMOiKR8sIYqLCiajCPeg4nQFgeuqy5rxEI6TXIbu2asboL/Bq
	nljsFi17LQb4EF8q5eZnMhX5sw0fMaM9Bw/BIj43bieMW8pm0wp4BUnJScMC0VVTtK74x69dQ8a
	h/gF62t9BSJKAlFh/5VFES3Pihp2andPWYCgvfqGcCiQ0nlZ5yV98v3wA6GYRSNVjwh4eWsUCW6
	8ROGUVxVyJw7oHvzEZ5rSWN6USkp46oLSE4LKpCUdJ2oo7590J29DeFVpjKVr1k89BSHs1G96xA
	C0IK7yDZ3xNw6fTLMaVbdxjWbbeWvA/FyJFJiaZkpsODka1aM7WixgEsrNJXfD5E6b+GULMyBxw
	dFIRE0L9hXxj8NNPXJP5hw14TbC1EtbI2xIY=
X-Received: by 2002:a17:907:1ca7:b0:c1c:4adc:31a9 with SMTP id
 a640c23a62f3a-c2039e3fe56mr2131203166b.28.1786389110165; Mon, 10 Aug 2026
 12:11:50 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 12:11:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 12:11:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <cbf5f7ca-a960-4fb8-a760-2d2794eb6864@arm.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
 <13ca60c6-e154-4397-8092-09f861e90fe0@kernel.org> <cbf5f7ca-a960-4fb8-a760-2d2794eb6864@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 12:11:46 -0700
X-Gm-Features: AUfX_myM87U3S8SmK_og8xg6GGyI1_yRBB52uSNeH53JSCFRKhcscCat1IpW7LQ
Message-ID: <CAEvNRgGOyQHnF_b8dk8E0d7_=CcwXtYUdU3ko7Qbep+_O7UC0Q@mail.gmail.com>
Subject: Re: [PATCH v10 09/41] KVM: guest_memfd: Filter both shared and
 private when invalidating
To: Suzuki K Poulose <suzuki.poulose@arm.com>, "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 10/08/2026 10:06, David Hildenbrand (Arm) wrote:
>> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>>> From: Ackerley Tng <ackerleytng@google.com>
>>>
>>> Before conversion, a guest_memfd could be either all shared, or all
>>
>> You mean "in-place conversion support" ?
>
> Not necessarily. This is supposed to be :
>
> "At creation, ...
>

I've been thinking of this series as the conversions series hence this
description, David is right about being more specific with "in-place
conversion support".

I didn't notice that it could also be understood as "at creation" vs
later on in the guest_memfd lifecycle. I did intend it to be about
in-place conversion support, since I was trying to justify why we need
to zap both shared and private pages instead of zapping based on the
INIT_SHARED flag.

>>
>>> private, configured at creation time using the INIT_SHARED flag. Hence,
>>> when zapping pages from stage 2 page tables, guest_memfd can filter which
>>> to zap based on the initial shared/private state.
>>>
>>> With conversion, guest_memfd tracks shared/private state on a per-page
>>
>> Same here.
>>
>>> level, so a range can contain both private and shared pages. Zap both
>>> private and shared pages for simplicity.
>>>
>>> An alternative would be to iterate guest_memfd attributes and only zap both
>>> if shared and private pages exist within the range. Setting both the shared
>>> and private filters lets the zapping logic do that iteration instead.
>>
>> I mean, we just want to zap anything that belongs to guest_memfd, independent of
>> shared vs. private, really?
>>
>> IOW, it's not about shared vs. private, but really about zapping anything that
>> belongs to guest_memfd.
>
> Correct. But we want to control what we "zap" (invalidate range) when we
> do the "conversion". e.g., if some ranges are already private, we don't
> want to zap those pages, as they might have some data "populated" by the
> VMM. For more context:
>
> https://lore.kernel.org/all/114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com
>
> Suzuki
>
>

Looking again, there are actually 2 changes in this patch,

1. Zap both shared and private memory.
2. Allow zap requester to request what to zap by providing a filter.

(2) is preparation for in-place conversions, where Suzuki pointed out
that in the conversion process introduced with in-place conversions,
guest_memfd should only request to zap memory that is not aligned with
the requested outcome of the conversion in terms of shared/private
state, to avoid over-zapping.

e.g. for shared to private conversions, only zap shared memory, zapping
private might destroy data.


How about this, I can split this patch as follows:

1. Update this patch to just do (2)

Commit subject: Allow zapping requester to provide range filter

In the conversion process introduced with in-place conversions,
guest_memfd should only request to zap memory that is not aligned with
the requested outcome of the conversion in terms of shared/private
state, to avoid over-zapping.

Prepare for that by allowing zapping requester to provide range filter
so the requester can zap private, shared or both types of pages.

2. In the next patch "Add base support for KVM_SET_MEMORY_ATTRIBUTES2",
   call kvm_gmem_invalidate_start() for conversions providing just
   KVM_FILTER_PRIVATE or KVM_FILTER_SHARED - no change to the next
   patch, mostly.

3. Add a simplification patch to always zap both PRIVATE and SHARED for
   the truncation, inode release and memory failure calls to
   kvm_gmem_invalidate_start()

With guest_memfd in-place conversions, guest_memfd can iterate the maple
tree to look up whether to zap PRIVATE, SHARED, or both based on the
range being zapped, but I think that's doing extra work if the goal is
to zap everything from guest_memfd.

Before gmem it was an easy lookup to check the guest_memfd init time
flag, but with conversions it requires iteration, and
truncation/release/memory failure aren't particularly time sensitive.

Sean, do you know if looking up attributes in gmem to feed the KVM MMU
the smallest set of pages to zap will improve performance significantly?
Or if there's any other reason to do this lookup (more complexity in
gmem)?

>>
>> So, couldn't there just be a KVM_FILTER_GMEM thingy instead?
>>
>> But I didn't quite digest how these filters are used.
>>
>> I can see that kvm_gfn_range_filter_to_root_types() does some magic to them, but
>> I am not a KVM MMU expert to know what KVM_MIRROR_ROOTS would mean.
>>
