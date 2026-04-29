Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E7F32ED3A
	for <linux-coco@lists.linux.dev>; Wed, 29 Apr 2026 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475193; cv=none; b=W3Xxb3fQIel774CxzreDvrTcwpfRs6Vk4kwREnrfC9JakLRCg/OoFVWw8y2A4uq1BLGy0lrQdGmqhfaTXUetXJfWggDF1acf1RwOB56xh6owRwDmMkr8quZEgzSSmCSCxbP18dx38ZWXroF7wLE1E+BfclGFQt5m4lYPZV9HuqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475193; c=relaxed/simple;
	bh=GFPg5URtggyFPwX/baYrE/ie3WRq/hgfVjdW68qBQaY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mIRcs3a2CwO7EW56DdapvL2erbiP0ZnMG6Qv293YiQMTxFyUP5oGgTJ+eA7QEkFt9MJO14HVZmLN6JeU6uxO3bMzQGYvCemogYJWS/SkUf8hYwawA1tUYW0PaKcTDMVbLLNWtiZ1RkjaaArbg07mH2j8EZ0MFQ7UlIR2osd5NMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EshX5HNm; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EshX5HNm"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b241be0126so244255665ad.3
        for <linux-coco@lists.linux.dev>; Wed, 29 Apr 2026 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777475192; x=1778079992; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xWWhH3tU6Hs8N8nztl0MRExY7a1xORY3xqlQgty50GI=;
        b=EshX5HNmXI5jXWsJACy6RhaEcMiib8Er4V+PcHbFYF/VnIo7eOXijTKZrEgr5kMQrK
         fuyE91v/MxEXt1y8ORlgoHjMQbwtnewpwytESC8ICkyZa+4+nmK62ub6iJNcw5fxixXo
         pVO9QWo62xTRjZzfN4WyN1FeIDqzZTDMyfpNBM7jdn/O4N11iH9xagUmrOrnv8srLF/3
         hXZ+eplyx7Alwxir97sBBZ7s5va4ZpX5CNvnpHp4eOj0G+O04vJRrKpTccDf3DW57iOX
         9rri3hJz/MsZwf5tDpduwfXYyVZNuC0/FZ+SSyNqCiwg22gPMFhcXkklbkvoLGnPcWND
         Dt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475192; x=1778079992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWWhH3tU6Hs8N8nztl0MRExY7a1xORY3xqlQgty50GI=;
        b=MuI/EfB7JNSR26Sv5APXRLyFOFOeEo536ZvRcHwXA9hM789y5+dQGNtwp1Op6k4S0G
         UbkMko5wtZGMURpvvJd2aQ3C8el1A/HiY9wh+I0FiNbO9yoJE0aV5S3ClHTT1GGgLKLz
         Rpad69k9SX0VkYVE+W9aXRGI0UZU7d4699xmRMhzVfkvgPVmrHUtvzDBeNqwRSR6DBon
         H6LkM1gx5XQ3c4EQku7WKe+YmBlG1UuLlYfbJlOYCLGODj4kOISNdkBokniMOmrqZd/1
         v3eMO4KXCGY++08JwhlnP2T1beh9+MjE7iYiAPZIxZ1qIXdHcj07xV0W9m7cQh4Wv8hO
         AluA==
X-Forwarded-Encrypted: i=1; AFNElJ+fdXdVUFq87I9+apENo6PMtxH6TH0JXz6ab1rZA4kOU5Zptbn3kreusCMY0XAv5OMrGrF16wRe6h0Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzT779dylYD2eJADsO7Kl2E1eNqOIbdKfLEJyU+hIhPTOZDhOru
	GuzU847OPKE/1dl9H/noKjMoeUyVHeaVGfZjQ+bgRyv7q+tEJKHOjU+lfFeZyiZ0o+bwkN/yEqh
	cleRnpA==
X-Received: from pgac22.prod.google.com ([2002:a05:6a02:2956:b0:c74:42:899a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e081:b0:39b:862e:634d
 with SMTP id adf61e73a8af0-3a3af6802cfmr4445875637.39.1777475191266; Wed, 29
 Apr 2026 08:06:31 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:06:30 -0700
In-Reply-To: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
Message-ID: <afIedjYxPBrit2dX@google.com>
Subject: Re: [PATCH RFC v5 00/53] guest_memfd: In-place conversion support
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 28, 2026, Ackerley Tng wrote:
> This is RFC v5 of guest_memfd in-place conversion support.

...

> TODOs
> 
> + Perhaps further clarify PRESERVE flag: [8]
> + Resolve issue where guest_memfd_conversions_test, which uses the
>   kselftest framework, doesn't perform teardown on assertion
>   failure. Please see proposal at [9]
> + Test with TDX selftests. We're in the process of rebasing TDX selftests
>   on this series and will post updates when that's tested.

Why exactly is this still RFC?  The TODOs here don't strike me as things that
would make this RFC.  Blockers for merge, yes/maybe/probably, but at a glance,
it feels like we've moved beyond RFC for the code itself.
