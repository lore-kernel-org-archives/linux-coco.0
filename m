Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203593CB57D
	for <linux-coco@lists.linux.dev>; Tue,  4 Aug 2026 23:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785885354; cv=none; b=XePXi2ShtrZRQcBp1EdTVHWAJhfFPpUdrcaoGBBoQEpjRKIFax+6rRRrF+8rjy3qCzKj9DLs7QL/ug1oO3AdJiD3PQieQwPIGfB8u7Fa1Sb82W6If/MK7vmVvIb/pd3xQ15ab8kc8AZa/6lxtaw5iHdLX0o0F0FxC3bT3riycJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785885354; c=relaxed/simple;
	bh=CQxbt8HUW9NzD6kY4dP+QdWUZhtRuWP0yx/1re3yKbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s4O1q30iXUI4qEqYBjlQUPUBlp8KKCTAvC89Som1G7QIKfm+MeEiQlqYRuX3sMMlI9nOe4TmqEmW5z1rRmvlEEiliPjyRegy9CSWW+RIbqsh3yaQTlZ6ubmd1m7cXovf4cBMYxALSV1UfOh9D+9XZv3ie7jQ/wuS1cvdA/mvAPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oAjLEYFR; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oAjLEYFR"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84865f326efso395800b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 04 Aug 2026 16:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785885350; x=1786490150; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lz3QUw22bh8QYe/ZiAsreDFp91isZAPnzZuU7CX+ujA=;
        b=oAjLEYFR86dNqLPaIognK9DKfIT+EqiqsbXI8i09pxh/1f0d9wvQARV/rLGCHlbTlO
         Ys5G4whMXBc4sVLQLtmwG4tuhCRGuTRos5f77Nsq80FBV4Etv6RLc03n1be25C10M9rv
         GScMZs4WiP+vP95ABNyBdMXVj3HYmpCCO4InNvIQPLUNE6tM6CQz7w/9ynJyY/z5VozM
         Wo333ZdYgnREsrUYYpsO7jAytIFqJxRVxK8t7Q11PH+5YeqvOfV9VD6kvWpSbhe2HTu6
         z4Zi62LpDI4AvkAT2wJRU1dTsaqnDB/eshRTH2ZSw/XUBpQ8avjIsTioM5aICEepEgPZ
         +P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785885350; x=1786490150;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lz3QUw22bh8QYe/ZiAsreDFp91isZAPnzZuU7CX+ujA=;
        b=pvzt6zxL/7Xw3dAAgbP6M8mn4ZQU6aFDzVfaKPjbLPMbtjO7pdTzBEv4ac55PIQl+F
         CCZ0ECwMZydvMRmBGFFuBbjF7MXE0mFpIpZ5E08uh14HXKUFVtc5Z1IM18ZfDWJN9VQc
         tQgBLIkdxWqxKAluZlBtzsNt+K4TN4zm1TmdfNyiHRkQLBqbOkdK6UcB5edPcbECAwQm
         +h8Kd5JUTvs54FpJrHHsYHCF8h4gJ2SfT8ID52NSN+Lm0LyAOLgbIqG+3zgtku9Q0vij
         eIYDrzKcNB3sbMRfZJLwIKV0Kps2RiWqzSr67cXHPFKbLzeQcAYI5KG77BqGnVsFcozl
         5/Hg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4aIQDWmMTFeo6N8aSZ2ntFK/8BzoQ09M6TDTrHBaNOVC8POnaFdjOjccAfYEVGmZgvwxZJrNLbi5l@lists.linux.dev
X-Gm-Message-State: AOJu0YyPl+f3gUANRMi8emtfzK0nWkho1ko4y5fpVN+Q2vz28gdpBhb1
	2Dcccpzxdatp/D6LXslUElsuH1hMI/NM3jobBYHSx9eH1MmM7SIRlTg9CarOD85Yr1f/y6rrbTp
	KKfxJyw==
X-Received: from pfbbq18.prod.google.com ([2002:a05:6a00:e12:b0:848:5740:db83])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9517:b0:84e:e809:dd49
 with SMTP id d2e1a72fcca58-84f2e12d02bmr2017520b3a.36.1785885348892; Tue, 04
 Aug 2026 16:15:48 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:15:48 -0700
In-Reply-To: <CAEvNRgEOE5oeFVRYYucsCGJaFAQYS1oNRXAwGKzRAyqmoHT9OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <edc3566b-370c-41a0-a71d-2e4a0e1a94f7@kernel.org>
 <CAEvNRgEas_9BEV-cNxXu4_wQx8sR2M4_OaW6DEd4=fszALMV0w@mail.gmail.com>
 <60552bee-3326-4917-b00f-5fb7ba3b8adb@kernel.org> <be77c2cb-6e41-4382-9d2f-cd299f634196@kernel.org>
 <anCtzQrUkFSSq8De@google.com> <99037993-ee13-4160-8c87-b6642faea554@kernel.org>
 <CAEvNRgHYhKACDfx9ZZy4a-TTS4yWzEJt=Jc92=eXxS15LPnTYg@mail.gmail.com>
 <anJbMf5GBe0Pxh_x@google.com> <de780cc3-8c43-46f8-b8e6-3ddfe93d753d@arm.com> <CAEvNRgEOE5oeFVRYYucsCGJaFAQYS1oNRXAwGKzRAyqmoHT9OQ@mail.gmail.com>
Message-ID: <anJypPblO8ww0IHY@google.com>
Subject: Re: [PATCH v9 14/41] mm: swap: Introduce lru_add_drain_progressive()
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "hughd@google.com" <hughd@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 04, 2026, Ackerley Tng wrote:
> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> Sean, for the two attachments you left, did you intend 0001 to be the
> first patch in the conversions series, or separately handled? 

Please include it in this series.  FWIW, it doesn't have to be the very first
patch, though that probably does make the most sense.

> and 0002 will replace these 2 patches (in-place, in terms of order), right?

Yep, thanks!
