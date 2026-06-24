Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013FA3E5A0E
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335440; cv=pass; b=cMZ+UpjP1okKw6IvocssOH9vs+qi7qwlUBNPDQT85dsa1UwScQSeRWYDeJkwa1yFE9D6xHKlFXiiHuvQdaurnOlcsjmSgS+pNfX87OQXt/V3UmdGNKDexwz5V0aBPR2W3uMybhy4xR6u9JAcdO5J2n/dWwIieB02buddWCBt4Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335440; c=relaxed/simple;
	bh=/fqLeUK+2mBqGvKbYmtjhS3yw4ZIMajZ90sW7dKC8MY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bj6n9jPLKGYRc70E9yqHZIsNJnsvTxggjEjoQaApPEOihUOxznNO1Kqp6KABB8UrQIYWmTqAUeH9aMmp1sWcNZGRdbr8s+osQrnxaFLkkCXft2ocyi+XXBXsX4Xs8s6G2brAmm4ar9sozDuuZF5GVs/1HYKBP7FIMPZWg8lVjw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grpLdiNI; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grpLdiNI"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1363fe80fe8so3042002c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 14:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782335438; cv=none;
        d=google.com; s=arc-20240605;
        b=SauYk7snbf1dcV0Zkf+Y28wDksgxxHiZhGTRMg8KVoYnlo9mKIjYF2qio+GS/w4ZdG
         grh/QjtxpqeNHTuUoJM4FFlDLsg5MWN3BVdzUqfoWwXaeBJD+qTHvCKWwh07UGx6m1qB
         +n/DhJiKq0S+WGGJ2t5/Ee9TWTH5UALbhF3ykcfSN+HklyJipMjPIZNZsK9MTjUQDygi
         SFUpy5LhgR6HQuoCOfo347GWuWeT7U6dTaWKmoIN5iyBI4teaCRl/8CdIu4cAODFIMTE
         rB7pGwxbhpX70FWXvhD5VR/yfcaeOnLa8bon4SbQaKA1kBBZU261fEtpIzHxRyX3uPMl
         2zIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1qhY5YTt9otpZBdjhswjpjNDeK/pN32eIQWKDjhQOPw=;
        fh=JjleNjnnzgTEtsBM3bniufKpil6Wyb5fJEQIuvl8sbg=;
        b=aH3VKBbfl6D7cP2RQAze9qyuCthI6MoQewekUpIfy88VRGJYx+8EzjVx6XXQD7uqTP
         dimsUCf56oi1iPGTLAGK95GdORIMTDdBBifl5kJfThew4HRrEnCybyDSZQM7kSa3P5dt
         BVqmr06eCWW0cfrqM/47JNgK+GesC9mY8d/jau1JW5erdyE9XRvCIzK0UnHS0oX4Z1x7
         BbQgFoqOntkn8JM+mTYXx9srrXqvc+6/fKqSKKxgN9bGUxDVJAdFRShAmE4Mropfe+xI
         7X+cn8IoU70m3B7IemiXcJnLgF2TrilchRviffs2Q8DhdFXvdiIFAy4yoq6/Tq+Yr6RE
         L1Vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782335438; x=1782940238; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qhY5YTt9otpZBdjhswjpjNDeK/pN32eIQWKDjhQOPw=;
        b=grpLdiNIvnvZxyhQvKUA4eC+/dBWf69/NqUASJyQKXX6uKfxHdGDqTcGl9s/Ar4/kJ
         e7DPVKEwjshTXTtMS6auBMj+zCGy2AftwrtMlNcjYDkWHgHVt84Q2ZA6nCF8Ttoaz8uN
         VS4VhI5tt68Z10FsOY/HC5nxknU0CWuv8nneW+G+CSWghl4HRZBcRD1GGP4yTwgbNFVT
         qvJ81xn9Zl2xVDBlPWi5zPmye25tmLh/BVIM9ROEV8VzXw2m+61k1oB0LI/KCLws2z80
         ar7e+hl31hMbFmExo0aBlSLZNXky1uNc43OMMRO+vpPq5rBb1vb/YN4vN0fjb3o1/PS0
         65SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335438; x=1782940238;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qhY5YTt9otpZBdjhswjpjNDeK/pN32eIQWKDjhQOPw=;
        b=Lnh4Jsdy0c0owbE/vHk2VoPSSUrXESTPGsFljziE5v93iQ0K9z+AMcSwJ9tnDEWq8R
         GXMcSucUBJ62gEnCPxYmZxP5vOhD9UZM1+UYEcjema+L1yvMHUQjmoja7IQUZefqnITe
         vB5qTsM0B3TQp3inz2xxB72X9zrhBpDlFmrXLSDC+oglVhEoJIn3SeoZKhqxeaCac0R7
         zWjYGrShhgRUqBKu2aLBn2Pady1PcSqVQPcX6BdSaPA7H2Ii5h/uN7huFvU5cpi7cJfM
         2g1WIef2TCob5wlDWDT6eNPnsxvDG3rGiwghssp5zVTCdL0LTRJOI/1M/zxq9CavLbzJ
         KiMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GFT5BwcixrUqhvs0X0YkBynAO97qHyVXGVVJDm4cUGWOCAtjaIklVdojkRgFQcoCb9i1R+1Fmyr8R@lists.linux.dev
X-Gm-Message-State: AOJu0YxGhJvhGZEClBuFXbbweS1y67n60C1jshRbJMt2OtmFHk5S88qT
	CWOlQt5EEvnpjnoMfpSgxXpz9RFE+UDiaBi/g3FJogsxza7tVwKmNh/QpIa8Z72JI0NpvRm61lW
	uq5VaCMHKdvfSMAK0HUYLDVG+9/uK4HDPMq/6FAzq
X-Gm-Gg: AfdE7cmx1G4uEzQgdLhBMR8kfpzuocvUHqEffdXZlt0sLceQZYIrmQwR31seuPbk2rS
	DrgdWD5kFG48bbJm/OUeJV7nrZfNWOydN601mhhQ8M1daCzjxIFXL96cf3lF7lkDHseQiKTdRSj
	Brmvw6a134xLaiDVmw+8/CLn5jP0iGlmGahzDEnoIyNsffs2rLn01uOQQEw+GmuMo33ofLljz/+
	MLep9MHYGFT8p7P3UeVRdGo5BYAZpGNpF4fnQieXJRDwwwVV8vDQj6hNYGLMScN5gElHTlFcD+w
	LuVun3wZ9DTr5LWujE8AW48RzHyMwCvE1Lv/3PrQ9vBhDckIRFFqOx3d9So=
X-Received: by 2002:a05:7022:ec4:b0:138:4e1:4701 with SMTP id
 a92af1059eb24-139d0bfe4c6mr3377918c88.7.1782335437124; Wed, 24 Jun 2026
 14:10:37 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 14:10:36 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 14:10:36 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ede86ac4-d560-49a6-82d6-b33ac5fc9355@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com> <ede86ac4-d560-49a6-82d6-b33ac5fc9355@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 14:10:36 -0700
X-Gm-Features: AVVi8CebnA3rqvCzlkQD0wA3EY7nvdb5mQUucCUu-AjWUK6m396TQ3uUDm-u_rc
Message-ID: <CAEvNRgGWwfWZbvXxBAKHxc3DYVGzDo8TYtii+8fVnJNtBwvCqg@mail.gmail.com>
Subject: Re: [PATCH v8 13/46] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Introduce base support for KVM_SET_MEMORY_ATTRIBUTES2 in guest_memfd, which
>> just updates attributes tracked by guest_memfd.
>>
>> Validate input fields in general. Guard usage of KVM_SET_MEMORY_ATTRIBUTES2
>> by making sure requested attributes are supported for this instance of kvm.
>>
>> A new KVM_SET_MEMORY_ATTRIBUTES2 is defined to support writes (unlike
>> KVM_SET_MEMORY_ATTRIBUTES) in addition to reads so it can provide error
>> details to userspace. This will be used in a later patch.
>>
>> The two ioctls use their corresponding structs with no overlap, but
>> backward compatibility is baked in for future support of
>> KVM_SET_MEMORY_ATTRIBUTES2 and struct kvm_memory_attributes2 in the VM
>> ioctl.
>>
>> The process of setting memory attributes is set up such that the later half
>> will not fail due to allocation. Any necessary checks are performed before
>> the point of no return.
>>
>> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
>> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
>> Co-developed-by: Sean Christoperson <seanjc@google.com>
>> Signed-off-by: Sean Christoperson <seanjc@google.com>
>
> s/Christoperson /Christopherson
>

Thanks!

>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  include/uapi/linux/kvm.h |  13 ++++++
>>  virt/kvm/Kconfig         |   1 +
>>  virt/kvm/guest_memfd.c   | 116 +++++++++++++++++++++++++++++++++++++++++++++++
>>  virt/kvm/kvm_main.c      |  12 +++++
>>  4 files changed, 142 insertions(+)
>>
>>
>
> [...]
>
>> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
>> index 297e4399fbd49..cfa2c78ba5fb9 100644
>> --- a/virt/kvm/Kconfig
>> +++ b/virt/kvm/Kconfig
>> @@ -102,6 +102,7 @@ config KVM_MMU_LOCKLESS_AGING
>>
>>  config KVM_GUEST_MEMFD
>>         select XARRAY_MULTI
>> +       select KVM_MEMORY_ATTRIBUTES
>
> What's this?
> This config is gone.
>

I'm surprised this compiles... I'll fix it, thanks!

>>         bool
>>
