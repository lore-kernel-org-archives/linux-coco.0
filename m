Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EFE39022A
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132859; cv=none; b=HDnYah11XDSaoeV7AZiwd3EosNSzv2r+RsmpSKWHp5JNPNTJQoq1/ZHwvJMx7V2xp80t2dz/6W7xAN5M5BE2QF+95Uv5XzdTVN1ZYpRim5NzJrWTgLf0UYjScTLeiqfjBfywcgCDpAb5P+5Ohtl+wr7C6ZGu2nkTO+9G3IfQxEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132859; c=relaxed/simple;
	bh=EolGcyXZdQB+WJQ/fbAT/ovCeKnyMlJRoovdxLhAScI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A1lgiVPDU719eYnqSMBSRQn9tXmIDRYoE6Aa6LZS4n3dcyty0y0gzctyv+MpRmkbVRNg8qN1MHLh/Lq9JZs2PZnjwWhlwa6UKeaIqb5BERdsdSbONRrj5gCuIDGKmYff+xyeGOFZvGAMZMXjSMIzLPikyonOSIaPI8EosiE8oLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQqBdiTA; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQqBdiTA"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8538a72b430so961778b3a.2
        for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789132857; x=1789737657; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6E03lEoHjRnSy/KkF9YUurNW1tkrhzCisRbnf6MQso=;
        b=cQqBdiTAN8v9QlsNr1F/4HrNX2gjdR1ePd0xDeHMFoMD+OqjWMvojcZjBqDPKhCruW
         ONBUCtvcpMQi+VT2Mh/gfG7NfUAOS6knf80fO3Ezz6LF5jM4SKnh5p6DPT/pkz8jzH/E
         Qj1Z0IL7nv1NmWHDscFDWBEpVsn1cyc23zDSw6YXJTr4MvKX/CMfWqBjxeBBAzRgJP5k
         nOopvZgACYeFlYUrd2oNOjXGwJ7xdKTgycaHSejVAgM3esyr0zM3mPBn1NFqo4MvDFKo
         WVta2q8J7rIYyIV34g6NozIDhLyhxoFYT0z8JoXjnB0cklQRs1LvBq9Yty7ltqBSIIGP
         qXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132857; x=1789737657;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6E03lEoHjRnSy/KkF9YUurNW1tkrhzCisRbnf6MQso=;
        b=DMsdDmUmTabYfRei8gXAjgJHMF+uxYxG21wIz2ln+CU0FCuJlWi4tYiZDOywBOlCa2
         2q4OsxAL+m4/3Mmqy1HuVgctkLpTZ9suEIYD7iFHPjmiADGuyMf2ljoCSQekRI/iNXd5
         OH2/1SAdZMp/dLhYNDxVb2ifD2RxW6FKJrtx31GsiibGxPcsHXObING6DPLDCbkj+Sed
         UcE6Fr9P/n/gta77M9Sc/emgJr3Pdk1DGjBCmHvocAxcnpeJumfFJ8F3bfz+FCMkD3eS
         f9qXRzLtEyjXcaBHClHshKTabmuKRi/nE0weQXZjlnqCCClFpf5r7ngYYijPODQsXS++
         qtAw==
X-Forwarded-Encrypted: i=1; AKwUvBz8iGuiFSMhqWc9CPp3W9vwIF/WP1TC7Nn+Zvm30HWP5kT0ehub9UyeP44y4DI8iSYmhI2LdkRoyA3P@lists.linux.dev
X-Gm-Message-State: AFuF++lj6LmQpCS6aghKGUgEs114Q0ljQyWWpNG8UmFjqAfVgdQkX/Sg
	BlC2qqf3fKRawrPycOzDkYZ8yaPAd49tvQLGz5grwJO7xdDCc+u5tTMe/Ld8zT7VkkmYprVHXKi
	EEvUF8A==
X-Received: from pgfd7-n1.prod.google.com ([2002:a05:6a02:6547:10b0:cc4:56ea:7ae7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a26:b0:3da:5eda:d167
 with SMTP id adf61e73a8af0-3daed1515e3mr7900074637.5.1789132857186; Fri, 11
 Sep 2026 06:20:57 -0700 (PDT)
Date: Fri, 11 Sep 2026 06:20:55 -0700
In-Reply-To: <20260911074530.3140830-14-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260911074530.3140830-1-jgross@suse.com> <20260911074530.3140830-14-jgross@suse.com>
Message-ID: <aqQAN6JbTe0fveKs@google.com>
Subject: Re: [PATCH v3 13/13] x86/msr: Simplify some rdmsrq() use cases
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Michael Kelley <mhklinux@outlook.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 11, 2026, Juergen Gross wrote:
> After the conversion of rdmsrq() to an inline function some use cases
> can be simplified by dropping an intermediate variable or by
> eliminating the inline function completely.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com> # Hyper-V
> ---
> V3:
> - eliminate KVM's read_msr() (Sean Christopherson)

Thank you!

Acked-by: Sean Christopherson <seanjc@google.com>
