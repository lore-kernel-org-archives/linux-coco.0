Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431C3B3C14
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 22:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340311; cv=pass; b=E81kMO8EkdP4UTbFwPI02eVnAt+OL7o06PgC5AVvqZgEAc+Y0nQwxlwPMH5wZe0H/qsS/la52KdHENjVs0ElP5ukQBuePDC1PFP9RTTEQzZLaUNCY0taPnjXaJ3AboKg5lcxCeDtskU0iExewKbgPvgBAK62+YYDRyp5p9R++8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340311; c=relaxed/simple;
	bh=Ac4SnsNXN8rEQTk23iatkBhfXxnOeNd/KNnr5r577/A=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHGIU/eNfPqDLnoRvIzjjrjWg84BLAedr03wdjPBDE39oeCkgYl3JBBsV4gWqULiyUh/bpFby7iizYTMIUL0hXozy+UZZTKFiIhwnc2CnrhqHEiryajBbv8qMZUqebBcARFmw6csD55MBSlQIPMpDFMp/sxlV3jIgyEEZek5QMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mszVyH06; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mszVyH06"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13986d61b4fso2351264c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 15:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782340309; cv=none;
        d=google.com; s=arc-20240605;
        b=YMt08FOwzJw9fa5M3KoFaHz1pdRWpMvqvWWeXV2BxrMXu6L+uFTqQC0IpC21udt2Ca
         KuRayg9zmyGPmBcJXnDDr/fRb/yMMusX1LZ0wRELIjTZIYso4se6k+wspvasFaKScSP6
         jeXdUHtlJKIXUurvTqvhfqMjX5/mgdPMWR2psOMkJoK7h8tmChQNUMuRd9d1TSOfFU59
         Y745uLQfCFhecOLvJ+nEHWuV0M7FBSA7REvmeXPHrx09Wxj/UsMFj/RTSkbiQJ5TCdgF
         JdprjU+P2Y/KFLjXY3V4SABAZNrg5RDZocHbN42n+bvrU/uAJvkOjSjRYjiSjhpwvoyj
         FrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        fh=F2K4M62ykdqCjFbQfPsSam6E7xkB9NvUPVa0uWtz0FI=;
        b=j7DdNjEiywNCgNU1dYCWRyJIc4XSGycvE+u5q2jj1yLPlqHBkbSQ+o1/c8accjkCoQ
         9sQUJd82N+N4D0maAq2uasIHM75JEMTelZCwSw5tU1dvcmsOXOGkMmAwB0eUuB1cExXh
         AF9rhpIlL4RFdNmjvO3iCVBQcZvo7RgEK0Ot0JcZNQSF7PAHl0pvkmmS94Mf2w1hsbcn
         WJrrOs68loVR25mkOne9f3+ImkNiu100NHiwHBrlNF3AQjf9qxbQdYQyidDgT9DCS8c/
         dxyd07jbRTgv+IdU11soXWDB35EknA55uZPpyD9cFzVaI/Aqsh3laEuHigpt1x85DMI2
         LVEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782340309; x=1782945109; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        b=mszVyH06uYcjsyvJSDaYwQhcPFHmOaBjevzBJHf/j86k8HiTSLn99hS8Ybss6DEpGQ
         vFcC6EozHRtn0kVwTrEEjym3dFibuTtACAIjJ3QL7Q2ZdMwxAO8zYneKXKci9V3Hxgt3
         pwpemCQKhDPIxe++HAZdXm0vLcfgudusWVZFruz1tb3OzlEs3WCWE8FltLTFvXbfqCNg
         3BZNacXckAybYkf5DzDdcgBKboKMoYGzNEqmVQ/5aRkM+siBQBwmZD77QsMS3guUq0oG
         pjoPprvVj3gRll8Aat1DbMS/LEP3esWtyce1BCOAFP7YPgZo955SbXouxq5xiZcOm0q8
         Vi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782340309; x=1782945109;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        b=aR7vBZGdVDrN9y3R/nppGyga7cFBLgUqlAs8IC3kWXeXK+8pa1smUaG6ZRg2Db5ZMq
         deBQJXaj0bxS3SQjSmAHxknSSskHnZreqxNVmaVhA6rBQoMVmST5LT+VDH8cM/wGU1vC
         q4K2nPJbxAFbptW0VPcIHhh5f/afpXC5eCq2SKPGxvuk3b4smcQZS+6YAmsRpCBrrfVQ
         2wMWWTAsIHgebJ2H+SBJnaZETLmMUXhPU0eu7ZPy8VDFlCZYpH9orAJ0j+WShuImM7aw
         BScF89OdkDNYeguhjhm7tX/pXPVyDum0RoXqn9W29J5hg3FGnInBMxtSgbQRt6fvmxo4
         DdTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UzALYwrtCHQGo/JjY50ar3+Jc5nvSGxBUnsdfXORglrMSJm07WSd2MvVe2l+2AuxItIT7KCToG8Sb@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5uhfW0UtiwqFDkhoHGD1H3y+1p4xKSrZox1BUjF9/jbe+S7Co
	DNRLpr6AHb0/4+slvlNioF4prEjjec/PdfLw6ufTa8fei0Tq196TNzwO4YxPvgzSi6Ads4KbpAi
	XgLAqOSLStqHbqBT8dnfPXQuKjHgirJzkPcbHCyvl
X-Gm-Gg: AfdE7cmFXbxQQbNyxWG3C0C++ql8eD3zb4AiUChMnRRKEWA8uLv8sQyBeyKzdfqPHHm
	H0mHClj8sNM/ltHUs/5u8MInMjHP8xGDncPoetsR9BtcA+rIvDoRcm0/vI6s1D/0RVrOU1RLaWC
	nfjGUiijOSUGgYjCC+qmiKEh0+zXVaRG7sNYfdzct9qP0gAa3UDWx8XXpYisblM+YinEYnomFwb
	PvrPqB8fj0VdFx3aaBm8aZcDc28vtaFihHG5iUZyG3tQ8wfUR2wJnSNuq9r4kqaphUUqAsXJSoo
	SBab/MFKzXUaCCwL6e3Vy9CVhyuYK0S7nQJFbZBF6Z0xiaLkrQXkWr4jraRO5VHDqGhmPA==
X-Received: by 2002:a05:7022:f687:b0:136:e639:9c05 with SMTP id
 a92af1059eb24-139d0c976b8mr3775881c88.31.1782340307804; Wed, 24 Jun 2026
 15:31:47 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:31:46 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:31:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTz3SW50EzxgXm8VysoaM21RReUVG2px_WUYU7zUwjXnpQ@mail.gmail.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-22-9d2959357853@google.com> <CA+EHjTz3SW50EzxgXm8VysoaM21RReUVG2px_WUYU7zUwjXnpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 15:31:46 -0700
X-Gm-Features: AVVi8CdGjNdamkK1obuu8yqfMxgZ_h-GaO78YorUefDXnXrkakD9WS-D2oU1DQk
Message-ID: <CAEvNRgGnSgYBwsgTh34uTTBvah12SE55LW=7Dm7RQX2U4sA7Jw@mail.gmail.com>
Subject: Re: [PATCH v8 22/46] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
To: Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> index bd04a908a8dbd..29409297f1ef0 100644
>> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> @@ -503,7 +503,8 @@ secrets.
>>
>>  It is required that the GPA ranges initialized by this command have had the
>>  KVM_MEMORY_ATTRIBUTE_PRIVATE attribute set in advance. See the documentation
>> -for KVM_SET_MEMORY_ATTRIBUTES for more details on this aspect.
>> +for KVM_SET_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES2 for more details on
>> +this aspect.
>>
>>  Upon success, this command is not guaranteed to have processed the entire
>>  range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>> @@ -511,9 +512,13 @@ range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>>  remaining range that has yet to be processed. The caller should continue
>>  calling this command until those fields indicate the entire range has been
>>  processed, e.g. ``len`` is 0, ``gfn_start`` is equal to the last GFN in the
>> -range plus 1, and ``uaddr`` is the last byte of the userspace-provided source
>> -buffer address plus 1. In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO,
>> -``uaddr`` will be ignored completely.
>> +range plus 1, and ``uaddr`` (if specified) is the last byte of the
>> +userspace-provided source buffer address plus 1.
>> +
>> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
>> +ignored completely. For all other page types, ``uaddr`` is optional if in-place
>> +conversion is enable, i.e. when the destination can also be the source, and is
>
> Typo: "is enable" -> "is enabled".
>
> "when the destination can also be the source" is hard to parse without
> context. Maybe: "i.e. when the data has been written directly to
> guest_memfd while the range was in the shared state".
>
> Also, how does userspace discover whether in-place conversion is
> enabled? A cross-reference to KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
> would help here.
>

Will fix in the next revision. Thanks!

> Cheers,
> /fuad
>
>>
>> [...snip...]
>>
