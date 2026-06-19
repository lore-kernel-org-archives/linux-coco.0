Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B98F5B1EB
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 00:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781828240; cv=pass; b=MKP+VeLE8cHjgBS8Qd4ajhfdPunEVJAkxxVzv4TP+TyA1Khp5JY7glMzBgbLoM4OuXABJBv4fbd5w/7h+Psl3S4czlMQYySSt/4P40JaN0k8AidooKh3gD5/fuWTbEGUVKlsWSHL9O5Ip0NeXo5+kLB/AwYS+LaVAT2UJuWqgQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781828240; c=relaxed/simple;
	bh=xbpfyvqJcFkrtmEYwnR99Bs4srke7ZgaUq2BE34tWXg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itoeHy3I4wVhwT63CULD2pz4pTN6jK22GJtxGZ5RBm8MFmVcu6PcWXE0Zzo473Xvh+Jlsw0Bk9ZVRhdg7KONmAmoiCT4GNIWa6alLpTKGBpPcKMfJNqKkUnf8bz0zvkUpBiwQEJrwwm00kLlJgcYfAqjLxHLfbLI50CVrbVRhcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ggy9nlUL; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ggy9nlUL"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1390f75d8bbso824857c88.0
        for <linux-coco@lists.linux.dev>; Thu, 18 Jun 2026 17:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781828238; cv=none;
        d=google.com; s=arc-20240605;
        b=ccCShNBrBixzSBJ/sfhYekkwME48XemLbra0U4qY4BjA68KUOe2rRw9sAwBfAO8hYl
         vmLvvxobZTRhMqbBdvB82Lo1g9UxsyHTfLNGRHnVNiwEs69C7qFSyl1XUgGuilGyC/ZC
         VRBIvhffHBHPnBB4atBDPS3VXKxJjENRaTa58iC+08UsKXSNmUY+G5zUJy8Hdr1y4IDp
         rpToXlgDkBOHmrONXNq3bG3km2NtbdiF+PfhO+BmEdIwKU+oky1a6+VbxlnweEXYlemC
         DuBz7ZAiuSwZgVoRURCdSqeiGRFRubZd5ul53HD7uGhY7U0Lvp7LGx6hNGtYTOi7EkTN
         qzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xbpfyvqJcFkrtmEYwnR99Bs4srke7ZgaUq2BE34tWXg=;
        fh=tjlE0DI+exmIUksclICnMR/UJfHdyolJBArEBtjHu6U=;
        b=My9Y0Y/qiKE974XHU6UUlClfWRagUIV6dGcoWScNCKTQvLijL8qcYaoIHbcKy4KyWr
         2h6f4ofwrv/YEa6Wo1zRL/Fsmsg0vBbqi3PI3Wq7V5ozCz8o+zVkYDhl4m1ulirTpkMk
         Ea1Mq0G2ZNgnGPHxW3EqomyQ2pntDwSxaMDZaIin+PPYqNQLEWHqZ1+EJaV506p9882f
         sHJugaBPYq5xQww3S6DVL1sIj2QaZyKfIZn9qHPk7qQI7LVkje3otPD5Xtx2dQ/P8WWF
         hwRzXzPuK7KB6N7jNkSlfyiGvzTcwLcp/6b7Itjsj3C/byN+7fS35UUZ9pURpbNvJsky
         Dxiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781828238; x=1782433038; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xbpfyvqJcFkrtmEYwnR99Bs4srke7ZgaUq2BE34tWXg=;
        b=ggy9nlULRZYnBRUjnU0Z95KNDct+qyJog79PB4DhoLVcFzRR7SvSxObJpK4tbU8ptY
         NVE0wk2DB2WAU0LhPiamfbM3HI8Bp1b8tPhS3MQ1oeklYHDJKnyP2BKtYQZzPBLEaZeW
         1HAGgKadLsKYsM1vPORksZUWtX1O6bjxAIxrcmvBhwqc2V2HwHf4swEsf0Dps230IYc5
         eNjr5mJnXV+7oG9xvTSuCi52PY6mo+jheitDzr6y6kEu7a4imSWxhy6kK2pWMeLNMFkG
         Wl/D+YaTA0mpPCmbmuqg7SvdmePEA1xLMT9bz5VMM5RJC+4T5YUEOMglcqKwI2FrnX3n
         oerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781828238; x=1782433038;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbpfyvqJcFkrtmEYwnR99Bs4srke7ZgaUq2BE34tWXg=;
        b=lJJdcBlgFVWmTwIWyRHBibVMs+IbGere5vZvh57wO/NY/TDBWzxxi1/d8HprCMdibA
         GhaCJXXsx6tIJyJE3HQCczElsRxlH5ciiQKtR6i2/00b1UsXnfObN8gJGRy6voppGJMQ
         6PnSFRbbpUNPkl1U9V2ErkEJfvmEetEN2+yDKIWWPWKNwic1520Zre3VAoVEFlPeIgCK
         9igd48ZNEv93p6hCOe5oE+2Q2u9nPq0yfn1D06ZTd2Kn3OuztJrkMfZ9B6JxejoQFXL/
         89e/9PLOOShep9Z+Rw2qdxvsT2wpC0BF7GZg5ieZ3X056/7849g85DTbrXNekZRq/zfU
         iJIg==
X-Forwarded-Encrypted: i=1; AFNElJ+XBbYEXO/zMb3THDRSAqXS06x6zBOm8j3Kps3dg1xwi1zrh4f8uZqeUetVWpupiqsyP7KyDZKqIi7H@lists.linux.dev
X-Gm-Message-State: AOJu0YxNdNUxibFWutp7CQ3OxiCsNYTdnxyYFAAZVtmriYR5QRJBTukY
	iFkx7iP2TMGvp6zGTkPYXxgVr4pFZzS9sk7juP0bRCkkGaXunPwUEaNWD3HJZKyJOuRYMPK2N5Y
	P9RF11e46T7gPIyIOzMjNs4kBRvrVqpbRU+683Iwf
X-Gm-Gg: AfdE7cnjUN6ROY7kyYIDJ1mgi2ATKqPofxpokfROhnYYo48zog8svF0dFNQPxb6r/WV
	GA5EpFBpEDnmEHl49VCpQN/v0+D8kjeBL9eP1GR1qMTRVqDCaeKa8AlywJPk98afJQ5+OPp/x52
	Rq9r1gyyYDtTM1abBS9JL7SJ81a2OZIkq7YCUsvY6sGrb2zI5BZf+NMyD3oWFn5CCaIA0Q7cSvb
	g6zYFAZFjbh3TY5s85j7iUXsS8Bu4f+SYWW1ulHLO6H68V04KrTKup6dETS+FBPd1PY2CvJzV+U
	dosVq/fGp2YbLE4BOSg75zXqXrah719sNiKMbRwb8qlRXmZQtNCjBhQdWxk=
X-Received: by 2002:a05:7023:a53:b0:137:eac4:82b3 with SMTP id
 a92af1059eb24-139a5030901mr102913c88.17.1781828235521; Thu, 18 Jun 2026
 17:17:15 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Jun 2026 17:17:14 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Jun 2026 17:17:14 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <509f9a66-5ae9-4c05-bef1-ced89fd29bf0@kernel.org>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-10-2f0fae496530@google.com> <509f9a66-5ae9-4c05-bef1-ced89fd29bf0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 18 Jun 2026 17:17:14 -0700
X-Gm-Features: AVVi8CewB9OSB5ydvz-H83kPwJbWVO-CyG6kASZWbX7de4UUA5H3gpKgSOQyYIY
Message-ID: <CAEvNRgHM4a66Jx9++6iioQLpFY-KgPvjY5+bg_X97DfSjpXzRQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/42] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Vlastimil Babka (SUSE)" <vbabka@kernel.org> writes:

> On 5/23/26 02:17, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> When converting memory to private in guest_memfd, it is necessary to ensure
>> that the pages are not currently being accessed by any other part of the
>> kernel or userspace to avoid any current user writing to guest private
>> memory.
>>
>> guest_memfd checks for unexpected refcounts to determine whether a page is
>> still in use. The only expected refcounts after unmapping the range
>> requested for conversion are those that are held by guest_memfd itself.
>
> Is it sufficient to only check, and not also freeze the refcount? (i.e.
> using folio_ref_freeze()), because without freezing, anything (e.g.
> compaction's pfn-based scanner) could do a speculative folio_try_get() and
> the checked refcount becomes stale.
>

I believe there's no issue here, since the main thing here is to check
for long-term pins on the folio. Perhaps David can help me verify. :)

> Might be ok if we know that no such speculative increment can result in
> actually touching the page contents, and the extra refcount and something
> inspecting the struct folio won't interfere with anything else. Then it
> could be just a comment mentioning why it's safe.
>

In this series guest_memfd doesn't change anything in folio metadata,
guest_memfd only updates the attributes tracked in the guest_memfd
inode, and updates the RMP table for SNP.

With the upcoming huge page support, guest_memfd needs to split/merge
the folio, which means updates to folio metadata. That will need a
closer look.

I haven't added the comment, mostly because it's a long weekend here and
I'd like to get Sashiko to run on it over the weekend. We should
definitely continue this discussion on v8!

> IIRC the compaction's scanning can result in a migration here so it's
> probably ok?
>

Migration isn't supported for guest_memfd yet, so I think that's ok.

>> Update the kvm_memory_attributes2 structure to include an error_offset
>> field. This allows KVM to report the exact offset where a conversion
>> failed to userspace. If the safety check fails, return -EAGAIN and copy
>> the error_offset back to userspace so that it can potentially retry the
>> operation or handle the failure gracefully.
>>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
>> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>>
>> [...snip...]
>>
