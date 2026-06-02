Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94683C062C
	for <linux-coco@lists.linux.dev>; Tue,  2 Jun 2026 22:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440084; cv=pass; b=U6z0DONULFcNHZzT/JJ4HIkfBmL7izeCiVfZcKohCxNYc7e0NBek2yymHX1Sy+yTJfjDhvlVOwONemIujc2clA6Ls6Dfab7zFNq0bAhprmJ0lu9vmzE/L/6aqfMlwlyp6N3neHLH7RQ7SUtVZxrwmnY6BeHQ/y0vacVTu3gBZNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440084; c=relaxed/simple;
	bh=JN5w0VLC4CArOs/YqYBchGdpeM2L7REgIk+BeZ3c7Nc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFPAGPk+1ZeKQ5ukR3IDvp2wSynPw1YmpMO5+2ZbZwbtQYin5iKltPC32nc+AuVe+6TmS6tQ2BUJsPWf8sAmLLl/Bg2YrZseFrTtQLsx+3moU9QqYiILNkAKWezlEodGz2a4OfncIIKgcvLUaNyG6xq+MQiUtiSOXlrIqoZ8Ubc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDNCeRQk; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDNCeRQk"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-137ed2e66faso1598026c88.0
        for <linux-coco@lists.linux.dev>; Tue, 02 Jun 2026 15:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780440082; cv=none;
        d=google.com; s=arc-20240605;
        b=MjO0/MavZgQfNda38ZirfqcOuqUIBTuoKBtfulKztd55w9pnzAafMa0R+G6AzUGdcq
         sH8EPXjUfGJl1pH4ITJbvoffyDL5ml4bfU2CUy/U1Vj6HFbS6vNt/M8KR/wtcut6WCsO
         +dBXuR4OSrUZ6RruQ6Z3JjHHEQChR+x0+Dww5/FnNGYX/Bo+VN81hWpuPFtOEgXRo46F
         E9x0Yz6YmCNmqlXvCaBxMX1wsQ0/Idf8lHW1R/gaNN/uU7itkQh1TaRMhBXeqDUdq1w+
         SDfonGTgRkItBo+96xHINcCPwOrJhXiJPvJhjZef2h37IOAlveKLro+SH/3ws0s5tPyH
         fQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        fh=Lw6Cc2mIlsLzDCMjgHKH2+yCMCpxwwU0Z2e3W79c7U0=;
        b=Tn+i5UdVY3c9gmuAVA/jgdqVLQm9rBNaQvWBD17ndfzB6Ju7cNCnfejKxkf9CmIw0D
         gD/u7dXRUZOJqUDcBZZXbt1Nr4S1mJTxWOsg+dvrM6J9VfLQaN7lWPmVWwmL5iz5dFME
         sl3UM2T/AZw10+pcaQ0ax1hjbwPoTZ4ytC15nl3rRHPvchBO0/oRzEePzHTVMWhsSoPS
         pAB0xCUOpQq0BAhZcJTnLHz+fpVgc0/t0dujOhDfTFrpMLkukxjPMJcmH22SFs4QYpKP
         QwaE95hEUDE7gLWLkp8yzIXpCCMj8dv2lTI0lV6vUFPKHpfW6KkkMJSZ4aVjcNrtoQsL
         Fzzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780440082; x=1781044882; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        b=aDNCeRQk0jkoNtnPvB1Ix6wgM1VrH2w0ZdYqozUd/gqmDaf3Xx0V/sRribC+yrhCdm
         SvKLugOzRo0qPVsBtekm8y7dorOfOujo5hinvM+d7w9vToHha/2NQ1wUs+RE7DHxYWLq
         U6HmGAX51Zqs8dmzcC/UtA7XbUEy3wcwZUNhzRIuPHg/GTurGrAJPr/HXIQQECGId1AN
         vwKnCimPtpszDfxQeZNXrN6sJLXIyZqNjXga1vI+UHvvI9/c1cDK9S1z1XJMzUdnOxE3
         wkgvcRS3MSHRc4zry1iiIP60Lfu33dZ9T07YdsQGQ5GhCRrV3NODH1cLDNtOTJWh/ke5
         1E1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440082; x=1781044882;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        b=Yh9gGT4m1MoVOOiXAeasI4gegpw+XxauHW/DAi4iXmiqSQy2uuzBIyXkMupkjqcdIH
         JhGXz1191Y7pxURT5kMWhAqVlcoJIZv/h2NvgLZ1SK3DzHmWI8dKPiBjkFgBUSoVHZTS
         BHiUSDSh1n2bqoZfLsUtXpxuU9Kh5N/4xp72jJlyyeU6RKehapADs8tzUxpMxh1c2UnD
         XCAbS91Qa8EVKATT/wVyhy5D1Js1E7NiLsrbQQTyHaWi0tdbcbacgITfvjXYri4Ur9X2
         r6o2gvx/vTTYYUO1eAhK/mWZWN7pSu6TwzhqZekwLKEmN/QQfbQR5PBoOQHQfkimzDiq
         42AQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xNfTeA+nF5Q17L8rECg0lyRIzfjuvuVHUZmuYnFcxWpvkGIQbfzp/7gAK3CMCSiP0YqMJzn4wSJjq@lists.linux.dev
X-Gm-Message-State: AOJu0YzxtWpXqkoXT67Wb9tbIRHjdlHGyR22DtSsE3jFCQujUteQijER
	nAQc3z0ON8abPHSsmY0HQ6ExqJ85s3ksJtoddD/zs9UkNPM1AyAQ4i52eVHWdfn555Z4oXLNxXJ
	/SIcuZEr41WRkQqxmI6y9kRQvGXZhDxryoZgQyDgL
X-Gm-Gg: Acq92OHHOPl8KGpWsyGOnIhTGGWD2VQQGg6IFlJjQ1ESwdd7+y3OmNMWmL+0JFZkzlp
	9MAtzpAG+/U6D2Zy0QzZZWO/iWl2VB9XrtP0r9CsrvQxDOIl8xLMnKK7B8F17AFjJwcHAQqOidv
	TXrWlJeOcaJIFtytiToidjseUziVxLzd+Lt1r6tIJj4z9W/QHnx2FHdgVOOBUwFR0ONxdNfxyGs
	nV10HpV9oKUyySKvl5flt7KEPjy+7Q9UlkTftaYpD4d4V+8ZClY4gKSNchKRRvYrEzQ5wn3xJs5
	MvIdBRHCaaCwtP5uTM7BdInupmndbDVLySkq99SCOD/SoyfUypc9b1nOB+rcWjgnGdq+sH5yV0f
	iRcyMqx4MurcGPu8=
X-Received: by 2002:a05:7022:6ba8:b0:135:5d4b:2096 with SMTP id
 a92af1059eb24-137f6bd71e0mr275458c88.36.1780440081068; Tue, 02 Jun 2026
 15:41:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 15:41:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 15:41:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <144bbb9f-39a2-4c90-8903-51521e022da0@arm.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com>
 <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com> <144bbb9f-39a2-4c90-8903-51521e022da0@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 2 Jun 2026 15:41:20 -0700
X-Gm-Features: AVHnY4Il1A6xpCFYh9Ccj4ryfsVj2nvlEe4xvqbfHFojqcjHjss1rOCXb44vh2I
Message-ID: <CAEvNRgE1dCVAxJWd_hyFa8N=m9JLfn97ip9tAmvHxspWJ50oGg@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>>> @@ -914,7 +916,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct
>>> kvm_memory_slot *slot,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 folio_mark_uptod=
ate(folio);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio)=
;
>>> +=C2=A0=C2=A0=C2=A0 if (kvm_gmem_is_private_mem(inode, index))
>>
>> Don't we need to make sure the entire folio is private ? Not just the
>> page at the index ?
>>  =C2=A0=C2=A0=C2=A0=C2=A0if (kvm_gmem_range_is_private(, index, folio_nr=
_pages(folio)) ?

I was thinking to fix this when I do huge pages, for now guest_memfd is
always just PAGE_SIZE, so just looking up index is fine.

Is that okay?

>
> Or rather, we should go through the individual pages and apply the
> prepare for ones that are private ?
>
> Suzuki
>

IIRC the plan was to make kvm_gmem_prepare_folio() idempotent, as in, if
a page is already private, just skip. Currently sev_gmem_prepare() does
a pr_debug(), which I guess is technically still idempotent.

I'm thinking that the information tha needs tracking to make
.gmem_prepare() idempotent should be tracked by arch code.

Does this work for ARM CCA?

>>
>> [...snip...]
>>
