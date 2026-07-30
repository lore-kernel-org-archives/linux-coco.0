Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A933D5259
	for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 22:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450671; cv=pass; b=tXqbzlkz/Vor14X7mlzZeRHcgWRys33B6ovwWxjx+4Ys3m9s32ttCegbD+25ZgqUV2lZvn/FXPY8/y6MEvbEMbLmfVSPefr8PO3q2VdVRiYdyIo3mrWRkfuFnyd9YaI5Nvabh7Sh1vQ2ixQmsam0eKpKLFkdOz9drvjdrs7RPC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450671; c=relaxed/simple;
	bh=RFb9jxFt+SB050uUN4iOEqSU+hhGaZfWAlwTqxcdY2s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdiuhupdRhAmxVjcQy39wuXTJzrQ5h88m0HZcRbMjqFUdVgQBIEUOZs4mq3+VccwelIKNftz3BfPeVXEBaY+SO+/cVx1eWOhD4sGeHghEaaFhG+ywmrSXRfKgMSmBmirMKtVJFdCv9M3zISOl6a2e3LX1OVhfABEW/KEgLPQ/S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mZVt5jlq; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mZVt5jlq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e88b60121so302501a91.3
        for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 15:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785450669; cv=none;
        d=google.com; s=arc-20260327;
        b=Ed6DhmifTQ1USM900wHkn0dHh1EybjiYLG1ynbd/oNndcUkYCqXRzHXYJuCfB0LvdN
         ZcZoZARvTmcRJVKt7s1BSJHn2GVtlNZh5gOfwj4D172xjbKTQvqRZowYlG9LkmpLIhMN
         1rfMeSITwFYhPne3j4zxiIXI9r9R4OZAUgmU5ciT+aCLx9DhpP2bxZxtzvvIfn2L466f
         R+rJ6e2lC34JjSD1hXWfD3ScEQM1f5izHU1YO2Y5ZfJfuGxOy0L1me5E4PqHgCE9Y90e
         35SRyErBGTOORLlYTEIteBasH0Hu1vlM4GFP+pjUMkK1eKN6Su4EBW+rKDrGQfWkWfsZ
         csJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=NT7QpFfx9ePxD+EfhDliJc1nWKGrZODd+FSZ20/4RHU=;
        fh=NCQdKyPpJIRvITVzSRP6hVnyylVLJjX4MYxadujayYc=;
        b=BxpvNSS8QkbvzKR8egBdc6XtET/WXWKuruSg/WdiDPTOEfH9FNzSZjA4sJ4ce/R9L8
         98lVRkAZakVhvVCYuwoC55G+OVLoqg8mFQH9MFnqWMfKxPM0LHGYSJ4VSnjg233fqt8U
         VcNTseZ5U3S5B6pAbQtlFStGh6H7ZEQF876xV7snaY9BUUeqXzCt6zTa/ww0fRp/pra3
         ltmwij5EbO3nPfTw7dySFCuXJLi1yIQ+Er360UB7Xk5lKoGAhfzFUsp8mWc4Yn5OmxMr
         xub8u2H0G0iPS9Pdxiu+R7egcK1EUU39bKhhq6NgxBBZ2Fdl9J/9QL0RtSN0yOtQ4ZC/
         Dp5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785450669; x=1786055469; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NT7QpFfx9ePxD+EfhDliJc1nWKGrZODd+FSZ20/4RHU=;
        b=mZVt5jlqI3PEYcBL2MG/Nflv2SDCTBhk7X4FE+vPJHT6ZzisEbCTSVjZJ3XVt8i55Q
         7Ykno2jTskUv/f8Gs7AIqf5KI5GAUWPY8xY4TnLn/igmBFCluGxWAyjFYBhe+m9qtkNT
         9qlcZJR52PZmwCrxssh8zUYQJ6ChNcl+c7XhAfJx2+sJJbRCNJbRx8t9ve2SGtJqtjbp
         Pl9XdpZ41jnvpZ7UopHgOsT/11WHUv/dalB+m9uRmoz2ofQ0zSxWrdOOHFfi6GDjAD+t
         gf5BRnVGGOIAXbSfPGH3xs6n6Dk4EG10vmRYQzFqRUY6+7+1xpPHz/FtfiM2dAx+Uqwz
         Wh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450669; x=1786055469;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NT7QpFfx9ePxD+EfhDliJc1nWKGrZODd+FSZ20/4RHU=;
        b=JZ937YztH4eR2jqwenX0qNXpTtRpuCXvdQBHpLWx1eI4A0jCtV3UlU/fBEKNorHN8t
         8j4Xq4VrLvJyqGpa8iX2ME8yNL277qBIkBOuv+MCJUiwBviINAaD20ue0f/jc4V1Jsf+
         cLDLNrhzuE/e9X1LfiibxOe/dT722YPL7RCb9uK8q/r9YnWKvVJAKkBxW2etYZ14zMZh
         P2eRlI7zx11Vak1lqFELXlsMaGdPUSa1tGQdil5Q8bLk3ukeeiyEbyzr1wjknzadMYCK
         MeLVyJwMHFFoWZ4Cf4MYkm/sEa3ytbPO/5MPYrV2+aKtrwuJlF8eAIP2Qxq1GbfqpaRV
         sNTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbroFgRkNhsKhGuSYPTfnKJ95J9EE1QIUIJuCtWJgna3OKP29Rr0jgiubfTB8SgLWa98Sb+G6GVrOH@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6LyBV5jQDORbipkqW9cwMmFc9I3UYoa1cjWQfBfue+ieBd7VX
	3sK9GFoNGNs1Ls8SQg2lpLO6ItXD1HwS7DcCuOkYcuZCyC5/dvtdux2Oly7Tf8t45jMVoS7VyLZ
	uN89ESA5BGaiGA0cjHJcXOyjP7neSk9I3BeebUSM/
X-Gm-Gg: AR+sD10Z3XpIIk57w/MLQ8acggBs3ufFGxhNUjZUcDeUJdc/e6M0WzYmt3c/AkgCpPJ
	MMv45BTki6cpEjQKiptcgWRvwnwlHK32y7n60xhgWk1ptF4P9OVn/EuVT9CqHQtJLweVBvN61EI
	BqXq03Kr/GkL7m+I+bQJ7eV16NLEi6itx/C15RKgqvIWX0MBr3GkcRtcuRwpwlTWnpz4suThUeh
	/hNPl0LEVZ0vXoe77XJanDO4DJAvGDuTmaK7zqRqje3Mw61pSb+sofZOOuLJ/9heFiwVZ0QebAF
	w2d403imCRSiRGmXb6dkPEr+0vAny1X8R1Nzm23Mjv6TE8lE+3s12B2IHxwD9E7dp9+M3jjeIXm
	b2zBF3AdZWyZ+jz/cPRNcvMHrxz5kF3n1T1qROt2e1R79YYs=
X-Received: by 2002:a17:90b:3c88:b0:38e:3fdc:62e5 with SMTP id
 98e67ed59e1d1-38f9bdb3885mr3385917a91.19.1785450668084; Thu, 30 Jul 2026
 15:31:08 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:31:07 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:31:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728-gmem-inplace-conversion-v9-13-35f9aec2aed2@google.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com> <20260728-gmem-inplace-conversion-v9-13-35f9aec2aed2@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 15:31:06 -0700
X-Gm-Features: AUfX_mwSrnPTxdnd5yQR4dz6uVJVHdsuk5_VpYazXm1_NpOUC6lIlEZN5j_ISHs
Message-ID: <CAEvNRgEscmPoW2f4UWHnPub_ycDg_QHRR-cCU5yL9HXu=G-OFQ@mail.gmail.com>
Subject: Re: [PATCH v9 13/41] KVM: guest_memfd: Return early if range already
 has requested attributes
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Ackerley Tng <ackerleytng@google.com>
>
> Extract a helper out of kvm_gmem_range_is_private() that checks that a
> range has given attributes.
>

This should have been

  Extract out a helper that checks that a range has given attributes.

kvm_gmem_range_is_private() was renamed to kvm_range_is_private() in
some earlier patch. Thanks Fuad!

> Optimize setting memory attributes by returning early if all pages in the
> requested range already has the requested attributes.
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Shivank Garg <shivankg@amd.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
> [...snip...]
>
