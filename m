Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1738D3E3
	for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 21:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486356; cv=pass; b=mCQ/dvBx2APcZFLKaYWcQ3lLNAphu0zkYC4iZqBZ1SOmciwBTqBNiWe7wFIaj0uwcf3rOk0j37sXKmOZY1p7Lg8UA+sI1KGtrqJE0auC4isxx9OC7T7bdJTPLIB5mxEBadnReTs/yi7tiYq6k7Kn2QPIwBAVxWSge6dm8sKIA/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486356; c=relaxed/simple;
	bh=yeXSyELI1E2yiYIHqqHrMC7NqZzRTFrVfjXKk8f/rzo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdO8jON4ieH9LTi4gofcj5mrWwdZ/HUPfZFKdc+9E/8FsXzdiu6OCQWL7JDJ7RTKm/J5GeUcMOWzNwb3HaRBea/uWyD/ZIBcb5xrUdjHAvtXbxplNaPoX3vNw7iNyP46ckdmHKoAWEmqGAfE2liNuCM9U35i/1mBZ7QjwrvC2tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MFtVofX2; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MFtVofX2"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-632a055fa9fso2915901137.1
        for <linux-coco@lists.linux.dev>; Fri, 22 May 2026 14:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779486354; cv=none;
        d=google.com; s=arc-20240605;
        b=NX5p7ZK8m+Zwo+rrzgBt9qWEtvQ66ZIe8g9NnSv8cXpv7Gsybz0RxRanGO/cpllBo0
         muLAuzHxjJvFfcI0T7nh78xVkLdzbhmbnweu/xSKvaYoo/4QiKUuy3fwwfJ9FgTLZuV9
         zeV6oZQkkZkZJK+PLZGlApP6a3ctxRcBkC5ZG/waPEGgrnrnOp8NuYPis9A1582ns48N
         13AbOgYVQ9kki2S2dKJOCpzEcBv6asNugjBEblu2sc+sYdmUGCHKxczvAWNzD78V1Bhr
         hPrqfDaIzrOTfcQCe33rHrT+LiIN+vwLf5zG0aiCE41XVaLd3Vx3NwysGEqGWgzZy+CJ
         Mwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HF/NjXSXWmsZ2MTdon58/xGzT4WCBzILiqAAQFlOD1k=;
        fh=5O3I0N0zyUSEm07/WR8PYB3Db4DqTEVxjyQyN81BLRc=;
        b=MAWXXijxCfxdLaWTbFZhdJI+yAzeqthqTz68fhCE93FwNx+4Rl8p9bMGJfoHx9xTzX
         Izbgh8BBTUcRpaMCXg1GJ3UyiG/SNjtyocfKRGP0ZzwFCrMsAwVYc01oNEEoeUo52FUS
         aWF38snbZDnFan9IQpCqQMlJt8rlEuMdCOrSaeHF9muHDgtqoH0IVtu39XqvNmPsfz5r
         WuWH8Kme801pMRUJ6P9nimKw75YkwyxccCwI6bVSpYyJExEVLAc/5JK5GoezUMvyVBBi
         t7dmYf+HTYrOcHyu0UdXuQtrJb6HUC0a5Xa3zjGic85ftUg3Nc0YR4zqrd+6mjtk+TXQ
         oAbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779486354; x=1780091154; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HF/NjXSXWmsZ2MTdon58/xGzT4WCBzILiqAAQFlOD1k=;
        b=MFtVofX2APwlmkx3mVHFO7cyFpAmN7rYZNbSjPBHDUCHX0WV5PU+C8zLMUABPgDshU
         qVfIJJOFfYt3h45Uet3b0m8/TGShpJT/Qso5IWQdBnkgpLXboP94Hf2+mIa/CrQhJg+0
         QspK8FJhxMRrZRtPuDtm/rQuoNY1MTADVCwB+Qnaitxl5fEvLz5YFbeuq6yxI/h3CVx5
         T0li2nHpE/+JBo0GASI1ZyimiC8SOi5IdpDUShXPUUZTkxI5/FoEGCDHjZ6lMgDfJXmu
         QoKPrzUOsRi5Xb9KKIopc0sFjUJOofQjXTfwUR3JLEjGPFLjjpTqR/cM578x7E27W00R
         EgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779486354; x=1780091154;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF/NjXSXWmsZ2MTdon58/xGzT4WCBzILiqAAQFlOD1k=;
        b=M1cEPNUw8KU7hZj6nPUvTXW+6qFoZ23iQQfCtbFpCzX6qncJtUq7WeRg7djxCHg4GK
         K1Gp5XfhxGEjjh95dvx20CptfRhti0FvsDT3lgpKAk4bVlhQPOpoeuzhkC4gnmqLrreq
         20v8BwA5HA/kPIuu3Ul14bYG4AmvBtSgSlQ6bdcIhhqkUZYsncuxIHU3IBPNziSascGC
         AEQ4dzMAy65peKgoH6/OpMjO2hQdMIF9tnU7SrcbPJANPi6KFrH5lSX742RZuU5ghKEm
         q4jYEs07K3Z6v2aD0smGkG+DLFoZGVG7CfT+ROwVdxbBHMhReMLesPLm/LFi97nskPQE
         4QeA==
X-Forwarded-Encrypted: i=1; AFNElJ/Y6ol/cvBnbSuSScpjHy9dJY5r168aievdJixwPqm9I1rnwIvJoeT51sL6snfGnrkiCI3dqTngP03e@lists.linux.dev
X-Gm-Message-State: AOJu0YwGhX4jjfNW9qzjS7flYlIHR+9BILBQByiaOhd6VsKbUr+FXyUF
	9ZzQB7AagqFrfHLFPov0Kwo4BOvfSIJirQ9BJaOKo9DgGXicFcVK4j2t94Lk+6b9wK2Lw4heIMl
	xsrnkW6B96fc6+3RyDHdox7DTChdUbIBResJEBldE
X-Gm-Gg: Acq92OGZAYGgF40RV18kKkFnLGp2IRnZh9BEgkIq1MLJlbPyS/kNgduVAECQCY8WGNA
	icgzVEk+O4f1X5AbiiXu2qvfeYacX+g4NRpKZFD5t8Q0uu3mUGJOPGL+KZ5BSiiCEVDgTBadrgB
	gD6EtLZoj9w9L8QIHduWubuq5cr25c4/Jb528mZWcsENOpUrD4YnFhJb7p2Hqdbpv1O87eZc8B1
	P7ppn/Wysjsf0YQlcGQfnixfrHqMrVHdSOH3BgE37K3xqKIifkOShaHbGX1Qk5yEQoTNI3uUE+k
	jCzWJ6asUZWMpWeMD81v6fz7b2qxAj6j+9VrZq0t469qUuSd5Od+mj2qZtFT3EG+baEyZq1gEih
	lOkSS
X-Received: by 2002:a05:6102:3e28:b0:62d:b0b2:88b1 with SMTP id
 ada2fe7eead31-67c7405ef67mr3506832137.4.1779486353069; Fri, 22 May 2026
 14:45:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 14:45:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 14:45:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 22 May 2026 14:45:52 -0700
X-Gm-Features: AVHnY4JHUcmHMeS0I0OECBQE9WDOiwFNaDvy5ucV_o_GqQwFVlnoZJcBRTb3Ibk
Message-ID: <CAEvNRgEjogBVDRNs2KmA--u9vHY1Jex-ERUuvK5idUrfoUBmmQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/43] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
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

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

>
> [...snip...]
>
> +static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
> +{
>
> [...snip...]
>
> +	filemap_invalidate_lock(inode->i_mapping);
> +	r = mas_store_gfp(&mas, xa_mk_value(attrs), GFP_KERNEL);

Sashiko says using GFP_KERNEL with this attributes maple_tree could
allow a process creating a very fragmented maple tree to consume lots of
memory not charged to some memcg and proposed using GFP_KERNEL_ACCOUNT.

The problem with using GFP_KERNEL_ACCOUNT is that the maple tree nodes
are allocated from a shared kmem_cache maple_node_cache. Allocating the
maple tree nodes using GFP_KERNEL_ACCOUNT would mean that the node could
be reused by other maple trees unrelated to this process, and so the
nodes might long outlive the process using this guest_memfd, keeping the
memcg alive far longer than the VM.

For now I think it's okay to stick with GFP_KERNEL? Does anyone else
have suggestions on how to solve this?

> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	return r;
> +}
>
> [...snip...]
>
