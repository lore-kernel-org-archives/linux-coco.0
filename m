Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21044353EEB
	for <linux-coco@lists.linux.dev>; Thu,  4 Jun 2026 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599943; cv=pass; b=PEls1bSVKMIdJbEoXeRElbEwR5skLAJsJ9pcpvjHB5g4lc4ZB0GcYFZQa0Hw/eDca5w8wHHO3Jv9Ma11lzfndLQUmcDT54EiK+MaJH+49pa9ArI2rpsKOyYEE5ZwQIDAI7ySoBHl6Xtcoatz/K6k0LgoQYRwGYz+A2avCXW8UfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599943; c=relaxed/simple;
	bh=fPhPRTQvhTqz157LTAZ7B67TGOApX5jgr9r/KxX7Klk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQMdSAuAJKcSZxmHMgY2w9RoVsq4iuaKYck/7kFOfAY5A8d47vB3Md45k/+dW8hERwhriAF4VIur6cJw9OiKVA8jCZD/3/Qs66r80PrT257g33gBMvF2cUbWGovSRg2C8yLtAIxzORAr+ReIoDpDCVma2yiOPQk7jT9gubGujtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CvEw9EOl; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CvEw9EOl"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137f18f45dbso954027c88.1
        for <linux-coco@lists.linux.dev>; Thu, 04 Jun 2026 12:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780599941; cv=none;
        d=google.com; s=arc-20240605;
        b=QWQ2lVjNJIzXgCyqTGCAzNvH5/eywV2m3ylHKb37xipqddKNTOw4jDRAAZs01dGDtU
         sILBEb2Ih70aGKQ4hc5PahnH9FUDmq9T6Igp0HqQZE7EwKXutofdOmoA23pIjs8ehbkz
         /mbr0tMC5aSn8xP1t6psSZml/wt55a5syOmnS4wf+vMUzyHoaug+lAvta0H0F6Mwlspp
         rZsnLt3AHE3EQMxN1/13W/XDJCI1ryjFL2FnWAz+TjtIyqYnUPU5+oacF2bt428IMLS9
         lgV5v3ApIdo+Cn0vC29XkThjgJFO8E8FIQgKxDMa7fHRDSno1IArH0QCDs6ucT0V2ga6
         gWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fPhPRTQvhTqz157LTAZ7B67TGOApX5jgr9r/KxX7Klk=;
        fh=3rpgLp8UMUnJ+kXVEkU4weAI7KOQS54mC0C73bO7NoA=;
        b=OfBT3NKob9ZnDiQHYM3sp4rWQR9Q/C3cCs5Bij4JQb0GVvVdUU7+1Ff+1uutDSO1vO
         bUpMdEJH5myrIs/QtDomnVzFd/F6GhEU7M9mKEvnMzVtyGZZCWntJ2qmLB3er27xJvLP
         JGFQn1CTWidSLcHpqZGdXDDPRkI12sb0QMIb13e0W3tERiMQiCoo506i0BD5QtLKM3bT
         zn0NTD9BQnJ0IzWaYyUX15VuU51Jq3hSPLWcsp5rtmEoygnKIL3fVth/fQbFEPiDVX/X
         eRuRUfTkQgyUR5EWvLSPFDgWS/CAu4DMjjHFm54/Ir3U+b+1r4nyeBcFIl933d7V/w6a
         5E6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780599941; x=1781204741; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPhPRTQvhTqz157LTAZ7B67TGOApX5jgr9r/KxX7Klk=;
        b=CvEw9EOlQCL6jVeJRYyHaRgZEQlb3cbz72p3KrPOr4HmiMsK41IL6J5+3IP6v5eKqE
         wIQavyOaFeKOmDmqt7BijpGFnfyYSq02XUnRG8iAwWvwbCiXn1KHCDNWkECX/H1+ak7J
         gdNtasROYzDcg4uoGSs9c3NxkbrStZkQde8hrq0NpK2PwvpDd3TDVSP5+S1ZK0rMlzsQ
         svCVxr4lI1xiXP8glLn/YnwlrwftlxPM90OlMbeVO8ZB7tR6t8F6uhHNqCKtXcji6mQP
         NvA1gNrk9N87XIcYMEvlO6CSBYSwZ9WPGfycRS1xEZYpEEbxO/uL9QWXeyy96m4sIBjV
         A5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780599941; x=1781204741;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPhPRTQvhTqz157LTAZ7B67TGOApX5jgr9r/KxX7Klk=;
        b=VEs1Om0AE17btxNtBboaZQgNcHRBKf0x1v8+OIYht6Rr/c2DPnlJPdW8YPbCb8qs4w
         niSBuv0FxKUv5a8BWKn0p5g48RNJJSqsdW1K9oC/1C+RrbCNo586yVNwKwl4BHGq0mWe
         kPaMoI1q18tIsiJhWJ5aqO8ipwnh+hiLAkxdlyCJZRZzqaeHl4q05Oejs7iql7NGemWA
         w1nfeCAfLpOtcs/ipzMpwtpvxRT/G/mQD+xOmreVzSxs9yb2w4y+tAiCju1i3/TRASs+
         XcLVLACLGRfYbjkRaTfyUjRcu1a5mDi+l+5GaQSzqqTl8Vjl+2lK96Ng9lj3jTM043pO
         WLNA==
X-Forwarded-Encrypted: i=1; AFNElJ8oO9BkZYRe05Smz8uTBLs269TkgQb2pgYcFmPkXj7OdUID6A4DuenAK2kKvv9EP7jXQHBOXXtDTb4j@lists.linux.dev
X-Gm-Message-State: AOJu0YwRZM93ufd17kTWGWMQ+XmCBf0XEITNsObAaCg6J0oBbJd3vxzP
	NwXVpssgulzic4ZGxnvWV/JzquhZ6jomNve+GkoIIwrxCnFe+yDkBjOrkVPpH6gMBM5UOamKdw7
	4Gi/EF5ytRZxFvdMfjxMjYdhCAJg1AIjkK6nez6pB
X-Gm-Gg: Acq92OEr7Tovz3I7qfCf0iubS8YWJt0yYkaZWs1SmmJgSmjj2DVtJFhl2lFDGIEQQTe
	NEpLo3zMLXU8YiKGphRJLMUlWoIwrBJfdrfsjyLUxwSKl9qD+DipTZOYuvSTKWOa8n4/LkaGjqj
	O2BZW2yVtwx36lKHTBhI4/qF6WGaQohX1ps+Wwu8EchQ4sDLXXyC8E0jds0/HFRc6ZtO8MjDUOl
	0j2y1vSb0rTbrlxrS447fsW2Q6Q3pQHKiV5XNCKwJC9id5qbYHZYRNSFjBSwoqRhhAnh58uvYqr
	hOXDqxso8/3WNAQ8J43VGcAovd4hvIvS9Pxa5ZtpustDKYC0n3J4h9fCtPK+WdHGsijITWtBavr
	+QvD7IbUJXgj7bA==
X-Received: by 2002:a05:7022:fd05:b0:137:64ad:a625 with SMTP id
 a92af1059eb24-1380676002emr151447c88.39.1780599940562; Thu, 04 Jun 2026
 12:05:40 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 12:05:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 12:05:39 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <9d15479e-e36b-4865-804c-7d93eb339e4e@arm.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-20-2f0fae496530@google.com> <9d15479e-e36b-4865-804c-7d93eb339e4e@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 4 Jun 2026 12:05:39 -0700
X-Gm-Features: AVHnY4IdCk0L71RC2xDPMs_Z7be_JnLSsAktCF5S5h3trmfsblKVtct2b38am_0
Message-ID: <CAEvNRgF43RBv77RgM67kXRRHDnQw4L5uwQTuvkJHzkHJWB1mag@mail.gmail.com>
Subject: Re: [PATCH v7 20/42] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
>> +ignored completely. Otherwise, ``uaddr`` is required if
>> +kvm.vm_memory_attributes=1 and optional if kvm.vm_memory_attributes=0, since
>> +in the latter case guest memory can be initialized directly from userspace
>> +prior to converting it to private and passing the GPA range on to this
>> +interface.
>
> Just to confirm, so the sev_gmem_prepare doesn't destroy the contents in
> the process of making it "private" ? i.e., the contents of a SNP shared
> page are preserved while transitioning to "SNP Private" (via RMP
> update).
>
> Suzuki
>

The following is the guest_memfd perspective, I didn't look at the SNP
spec:

Do you mean specifically for KVM_SEV_SNP_PAGE_TYPE_ZERO, or for any
type?

guest_memfd has no plans to do any special zeroing based on type.

guest_memfd decoupled zeroing from preparation a while ago (Michael had
some patches), so zeroing is supposed to be once during folio ownership
by guest_memfd, tracked by the uptodate flag, and preparation is tracked
outside of guest_memfd. So far only SNP does preparation.

>
>
>>
>> [...snip...]
>>
