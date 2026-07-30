Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117103DA5C3
	for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 22:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450397; cv=pass; b=TKpTlfB8Dm1+V4jewv7cGF2py+OnumUaVUXPZnLtlF3qgIn0XG9J4JSXUvGGgv5AFpziCgOpHR73yANFT6XpBDPmWVH0Ocd8nk98xf0jUAC4wUdH7PnxECy/fKJhElNMkshDEp4VPzxnhktPfEDija2/zFaIsh2+w1Q+qXxMHsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450397; c=relaxed/simple;
	bh=pGAe7A065N0DCyNKa4jnFCoxW2vRFq0rZ9EKmD0iYuI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMAYmFk5QPzht0+2c/EtAmSkX2C3fXytU8i5mJeKEwKTvvOMoboiZePkuPdI50Y2QabsU5/1UApI+bznGDIQnODTomUjUUeh6lmCkGdzLe9Jiq9102hKAqUzL6SX6FZ75QgSfwN5Z+pB0ylVhDRgGrDeFpFgm8mvyiy1in69Gyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LvqekUMX; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LvqekUMX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacf197759so4093705ad.2
        for <linux-coco@lists.linux.dev>; Thu, 30 Jul 2026 15:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785450394; cv=none;
        d=google.com; s=arc-20260327;
        b=oqlJObA6QmGYbNVKiBa9YhRtVZURqX53EgGneRMaI+I6oElXHEB5eolOrZJQPx/ERw
         aENgXLdYyZRv8ltrIXY0ajo1TJYatfmjyidklPmw2kO/Y2kwFTKvykt8PzMSDY3UDaWK
         l7l/nuLZk6jC2HcluTQRO/vYf2l7U8ORYt3kMhoTmiJWZYAbejqZxDXCL2prr73GWz3J
         1Vl8Yfi/oSHluCUnLaH0TuvBbXoDJVIDQhybPxH8kAvdkAyh6oV8DqJqetsczibp0YFG
         UAKNxTrlxkUqMhBMtsB2SWf33FTuWdBgYyunM15bK1x9pSL0QfdpIq2UfjRJh3RJYuf+
         vu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ArtSog1FoVnhFcfpT6OFcOCesxyMDJkDrg6P703rT7g=;
        fh=FA32/+VIbj/K07BZANeAbdfYNXcvpDJt6A4AAxfPwsw=;
        b=LtVLHj6XDS6FCj2RxwMtZ3hNaTEC7feD3SfI97lqqeV7+UKWi74dkhM9bX0ZIkWMZV
         P1EbB0XAtyB9ijc874NfgNEqIo/suBHA23Hjyu1HT6AHBU5TwH4KJkAsvru+PSHlDVdB
         zxIpzexMxMWGHYfpl8bwLK39Nw7Sr5rkanmEASxMkdJKH+ysW7CMsNbSRqP5X+f7hkdL
         Wd4STJ52TcHyWUKasCqyTNNXD8RqX1PZh+Ew/Re/0Fk28VP1HsspjgSolE56ozCUnlJR
         FPqIwBo27gBOss2gMz9+UWOjro1eq/JuD7ZC+uZqzPiaCSKyzOjYE2eIZYlSmk4vz18Q
         Vh4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785450394; x=1786055194; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArtSog1FoVnhFcfpT6OFcOCesxyMDJkDrg6P703rT7g=;
        b=LvqekUMXcoi6UsHg+VJjlBxrC+Eo1R3qs9YPpuNPS9WHr/KuFaDWw6MAq7n1XKbgLv
         fLd8c1NiXDpM196Fg2KDc3GUqZmyehdtNp2fLw2RntDPVqwasJFOdBOslPDQ2EDbhKjO
         I1iWYOwVxYBdV0J2u8d/GKd4j0RqwTmk15stEQApPQ7n6nkvDgTjUOryPlPWT6rpd2pt
         BNf2AcFnZvTZsRkmBPJZfHqRgZLi2HduMmMQ2vNGyxj/PL60xnHIFp2Z6W68qWRB3qCJ
         FlpHruxNMwayGQUTch61dn1tma9/c2s/jvnxjaHMrS/YomRqVv4WKBa54PFWZqa1DvqS
         rp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450394; x=1786055194;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArtSog1FoVnhFcfpT6OFcOCesxyMDJkDrg6P703rT7g=;
        b=EY+qbAnejcg99xYo5OcD2SDlrOPiFoM+q7ket8/wT9G1SS+6GnstvQiMh6bKzXFMRO
         rWve+O7/r8E4vDOQhxry9OLlyXz+VJUl/Dk4si3d7YKNgJT5uxwZO6BSu/fOKsTSTw1w
         2f5Qn4vN+gWMcqF2NhZiAuzXB/kKq1F3Jxm/CXcLDrc93hgjHrCyxe9PdpO2HGRwwRKb
         KmH2Bc4bHYT7UOMcyhl90xT04VBNTcQY1qWUIhqhud9V3HXpdqfSKrF0mirChPPixsIm
         Sl2ow4U2wGgPgesE9cR/Kxq4Hry48TCR45DMbuVQu0xh8itl6sd0tcOq580EUEw0NTOp
         23LQ==
X-Forwarded-Encrypted: i=1; AHgh+RprpnmK1pRQBRBdngwJVdzZ4OkMK26SV5e/OSdg/+7oeFb9nEUQdEyuhKO6cUo26JM/BDgXtsd2tn60@lists.linux.dev
X-Gm-Message-State: AOJu0YwmEh5mTy1CF5vFyzpqjlSNktfH8X5AfjAqXtK6wWb54i55/DxR
	Uf8vQjtl1idPHXtWQ49BSHepsSkespsOm1O0HJvioyysDW0nSog73At030cfbZTkOHIPkL52tyB
	UOZ2Q2eEyjs8wmSJcjKalXLPjw1pyllFeRp7a/WvL
X-Gm-Gg: AR+sD12Th73nLAJETyobQVsx3osDVdUnKHtL6yhvInfLtn6DNfRAm1y/Prg3haa7BPg
	6tNOZHH0zPKbnCTTQhLtSHuNhftgioFbpz/SlITEGCazAJOqcWKdEEsefk4sW+BFgZw/sdGn/GM
	5NrOqjP23+xO/gREnp2d72OjgU+dfrR/FRQPbHiqoox7in9kIhBjX1dj3dTs92eudoiW4nx+Ypi
	QxjZNaoUPLlqKyUwJdzLjEMd+Vkwb9bKhRPJKQAUep6ynklHtpN5rkO/6/MPE0E4iQRrGn18JDl
	8ydX4jvWLS9CP162u/PZmnYg2ji4zpVImdTpH7P/C27wb2ZurtPwZc0+usOuibz+vOQCqWl8vRB
	19pHjR2hMk7OYYB2Qw10Fv1yMjuNaNYjga3SppFa4W+lgTw==
X-Received: by 2002:a05:6a21:3390:b0:3c3:7bb9:c93 with SMTP id
 adf61e73a8af0-3c9006b6c93mr3958275637.53.1785450393499; Thu, 30 Jul 2026
 15:26:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:26:32 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 15:26:32 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728-gmem-inplace-conversion-v9-10-35f9aec2aed2@google.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com> <20260728-gmem-inplace-conversion-v9-10-35f9aec2aed2@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 15:26:32 -0700
X-Gm-Features: AUfX_mzO4np18y-var3XtfpQ4yIIWVbEpBnhPk-BB6NlVysHL79jcDWiNU37Sj8
Message-ID: <CAEvNRgF3HQfivC2CRp_61Fa-YsSGPpdHa1A77t88japfW015XA@mail.gmail.com>
Subject: Re: [PATCH v9 10/41] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
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
> Add a new ioctl (and matching struct), KVM_SET_MEMORY_ATTRIBUTES2, using
> the same base ioctl number (0xd2), but with R/W semantics for the kernel
> instead of just read semantics.  "Officially" documenting that KVM writes
> to the payload will allow KVM to support partial/incremental conversions,
> instead of all-or-nothing updates (which requires complex unwinding), by
> recording the failing offset if an error occurs.
>
> Opportunistically add a new struct as well, even though KVM could squeeze
> the error offset into "struct kvm_memory_attributes", as there's no cost to
> doing so in practice.  Pad the struct with a pile of extra space to try and
> avoid ending up with "struct kvm_memory_attributes3" in the future.  Use
> the same layout for the fields that common to version 1 of the struct,
> e.g. to ease upgrading userspace, and to provide flexibility if KVM ever
> adds support for KVM_SET_MEMORY_ATTRIBUTES2 at VM scope.
>
> Introduce KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES to advertise the
> availability of the KVM_SET_MEMORY_ATTRIBUTES2 ioctl.
>
> Update the KVM API documentation to define the new ioctl and its behavior,
> and add the necessary UAPI definitions and capability checks.
>
> The process of setting memory attributes has a clear point of no return
> because, for CoCo VMs, zapping stage 2 page tables is a destructive
> operation. Unlike regular VMs, where re-faulting pages into the stage 2
> page tables merely incurs a performance penalty, CoCo guests must
> (re-):accept pages after every fault. To preserve CoCo security guarantees,
> guests will not accept pages they did not explicitly request faults
> for. Consequently, during memory conversions, any operation that could
> cause the process to abort must be completed before the stage 2 page tables
> are zapped.
>
> Zap only the ranges that are not already in the requested state to avoid
> inadvertently destroying (CoCo) data. ARM CCA guests will try to mark the
> entire DRAM as private at boot. If there are no shared pages at all, the
> to-private conversion can be skipped, but the existence of a single shared
> page would require the conversion process to proceed, and if it proceeds,
> zapping both shared and private pages would destroy data and break the
> guest.
>
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Suggested-by: Michael Roth <michael.roth@amd.com>
> Tested-by: Shivank Garg <shivankg@amd.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
>
> [...snip...]
>
> +	filter = to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;

I left out a

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>

for the suggestion. Sorry! Will add it.

And thank you Fuad for letting me know!

> +	kvm_gmem_invalidate_start(inode, start, end, filter);
> +	mas_store_prealloc(&mas, xa_mk_value(attrs));
> +	kvm_gmem_invalidate_end(inode, start, end);
> +out:
> +	filemap_invalidate_unlock(mapping);
> +	return r;
> +}
> +
>
> [...snip...]
>
