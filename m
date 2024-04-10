Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C3184110
	for <linux-coco@lists.linux.dev>; Wed, 10 Apr 2024 21:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712784879; cv=none; b=HObYS/tubFSLv2CA/gwgGDDbUH3mzb7bywi6qjBYJ0Rw9ArUmBaRZ7XENJpFn+S2l2NdUl+lj0l9z8Tro1QA2nqDMLmw33nuSqQ2RmuRnGDjGgXLg1lMGZ6LBkhbaQmNlSt5oPegyo6HPkpQDkUoCXVFqC8Vz9N3mQ9rlQhd3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712784879; c=relaxed/simple;
	bh=VBmhZuhy9OiQHnd1DGErAQ0jyjLmeXi8kVR0g4eoQ4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpSy8ZeuCwLHxwaKVaQOhy3RZrUe9+YPQbkIZ5D9ZfTNtDflH5rlL7xaj2hP0HJqisZ4weOE7AfpVhmw+QsU8unUVrwmk2T1x9dgpN0Gr8RUZnDjDGTjfZTocGB7xuUfUWo0BY3ZObrScyAlRrslUPwGTgsZ62OU39OmAkzVbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-36af9aa5936so2244895ab.2
        for <linux-coco@lists.linux.dev>; Wed, 10 Apr 2024 14:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712784877; x=1713389677;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bG7sCu17jkSV6yBnpltEJ7rJachKjyYSICFCQUTjj7o=;
        b=vwqirOW6lgC73UrlqDEDEf/2QNyhMSnuyZOo7808ry72xhaeAFkYO1Bt4j4LLiC5zN
         GsfHX6xDVZ/s28ZEtBBKSM12ncjORqa1a9xjwr2/l59jYBiwsNslBTycLZ2eieZpbDrk
         jzHfhcCrlb0IaYxWrTLZ31ovqpuXsnUCUqCE6EuOslBmro22AuQTvzm3OWZ4FoMS2cHR
         r+U279ZmFBQC9TygVt4Oh940qJYc20FJY4FyRSQwgsK6yhwpGACiROozJg8QbFw/KPYW
         4+J9dhHzDTOhhoKsvIAtFuKzk80dKARmvNSanLl+k5uU0/yOvWMhO+UBl9SYuI1kcySt
         eFrg==
X-Forwarded-Encrypted: i=1; AJvYcCVoUW4iARcnG/Vhf7dDsdQP5e1wpKxikox+qlg9S6pMhfbTXcO2Cbq1TLRiOahr8nCQK4elw/jeo+KuV4lGyHhlKuRzxln49ItWWA==
X-Gm-Message-State: AOJu0YzO4cJsOgN/rujmmxuexjBqdHcRbf0Djwz1O1bfHeoKNZ0vZEDN
	SLd/NCjcmPJkHMIMGdbt0hUhDoUG9Ik81y+6OrasxbUlnvLffPQmR4S8EQ==
X-Google-Smtp-Source: AGHT+IGygycenL7WG6EoKl2az0kNMkHo2YmNsYnvLqzVt/ufhtiQR7jXbASbhbWPWL0cnqC+N+eTDw==
X-Received: by 2002:a05:6e02:1aa8:b0:36a:e011:15ba with SMTP id l8-20020a056e021aa800b0036ae01115bamr1460926ilv.9.1712784876707;
        Wed, 10 Apr 2024 14:34:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
        by smtp.gmail.com with ESMTPSA id e14-20020a65648e000000b005dc98d9114bsm5526pgv.43.2024.04.10.14.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:34:36 -0700 (PDT)
Date: Wed, 10 Apr 2024 21:34:27 +0000
From: Wei Liu <wei.liu@kernel.org>
To: mhklinux@outlook.com
Cc: rick.p.edgecombe@intel.com, kys@microsoft.com, haiyangz@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, gregkh@linuxfoundation.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
	linux-coco@lists.linux.dev,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	elena.reshetova@intel.com
Subject: Re: [PATCH 0/5] Handle set_memory_XXcrypted() errors in Hyper-V
Message-ID: <ZhcF44AEkKy0Z0HR@liuwe-devbox-debian-v2>
References: <20240311161558.1310-1-mhklinux@outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311161558.1310-1-mhklinux@outlook.com>

On Mon, Mar 11, 2024 at 09:15:53AM -0700, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> Shared (decrypted) pages should never be returned to the page allocator,
> lest future usage of the pages store data that should not be exposed to
> the host. They may also cause the guest to crash if the page is used in
> a way disallowed by HW (i.e. for executable code or as a page table).
> 
> Normally set_memory() call failures are rare. But in CoCo VMs
> set_memory_XXcrypted() may involve calls to the untrusted host, and an
> attacker could fail these calls such that:
>  1. set_memory_encrypted() returns an error and leaves the pages fully
>     shared.
>  2. set_memory_decrypted() returns an error, but the pages are actually
>     full converted to shared.
> 
> This means that patterns like the below can cause problems:
> void *addr = alloc();
> int fail = set_memory_decrypted(addr, 1);
> if (fail)
> 	free_pages(addr, 0);
> 
> And:
> void *addr = alloc();
> int fail = set_memory_decrypted(addr, 1);
> if (fail) {
> 	set_memory_encrypted(addr, 1);
> 	free_pages(addr, 0);
> }
> 
> Unfortunately these patterns appear in the kernel. And what the
> set_memory() callers should do in this situation is not clear either. They
> shouldn’t use them as shared because something clearly went wrong, but
> they also need to fully reset the pages to private to free them. But, the
> kernel needs the host's help to do this and the host is already being
> uncooperative around the needed operations. So this isn't guaranteed to
> succeed and the caller is kind of stuck with unusable pages.
> 
> The only choice is to panic or leak the pages. The kernel tries not to
> panic if at all possible, so just leak the pages at the call sites.
> Separately there is a patch[1] to warn if the guest detects strange host
> behavior around this. It is stalled, so in the mean time I’m proceeding
> with fixing the callers to leak the pages. No additional warnings are
> added, because the plan is to warn in a single place in x86 set_memory()
> code.
> 
> This series fixes the cases in the Hyper-V code.
> 
> This is the non-RFC/RFT version of Rick Edgecombe's previous series.[2]
> Rick asked me to do this version based on my comments and the testing
> I did. I've tested most of the error paths by hacking
> set_memory_encrypted() to fail, and observing /proc/vmallocinfo and
> /proc/buddyinfo to confirm that the memory is leaked as expected
> instead of freed.
> 
> Changes in this version:
> * Expanded commit message references to "TDX" to be "CoCo VMs" since
>   set_memory_encrypted() could fail in other configurations, such as
>   Hyper-V CoCo guests running with a paravisor on SEV-SNP processors.
> * Changed "Subject:" prefixes to match historical practice in Hyper-V
>   related source files
> * Patch 1: Added handling of set_memory_decrypted() failure
> * Patch 2: Changed where the "decrypted" flag is set so that
>   error cases not related to set_memory_encrypted() are handled
>   correctly
> * Patch 2: Fixed the polarity of the test for set_memory_encrypted()
>   failing
> * Added Patch 5 to the series to properly handle free'ing of
>   ring buffer memory
> * Fixed a few typos throughout
> 
> [1] https://lore.kernel.org/lkml/20240122184003.129104-1-rick.p.edgecombe@intel.com/
> [2] https://lore.kernel.org/linux-hyperv/20240222021006.2279329-1-rick.p.edgecombe@intel.com/
> 
> Michael Kelley (1):
>   Drivers: hv: vmbus: Don't free ring buffers that couldn't be
>     re-encrypted
> 
> Rick Edgecombe (4):
>   Drivers: hv: vmbus: Leak pages if set_memory_encrypted() fails
>   Drivers: hv: vmbus: Track decrypted status in vmbus_gpadl
>   hv_netvsc: Don't free decrypted memory
>   uio_hv_generic: Don't free decrypted memory

Applied to hyperv-fixes. Thanks.
