Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBA316193
	for <linux-coco@lists.linux.dev>; Tue,  3 Feb 2026 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149193; cv=none; b=CPQxnEb+99sDwjlPg0kIkyByxIh1uMPP923csEqG+8yfxEAY+l56ZJLBptVycsXswBGpOo/9JHKuXyrtm93WjbrVHkdtcWxpyWsq1Ght1NtXKdHRgxR83Tmd1KtT4S4PNBOLFiuFrt7afQsfmcnfrDMvTc4qx6sO1QLzesnU0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149193; c=relaxed/simple;
	bh=1Ib3pwxKHmKqNzWuh8gauUn0Z+GM1AdBwnBeI2qs2L0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YGYRhLVS8W+8otIHJDa5hEQXmE+EKsb5EA3jwqy+qp4lP3H1NjMZn/LXemgcWkmE6yt0HiJgXbmy1rTtkBNRgXBG2/ijf+qEzZDmkNPMBuYnIMXADyCKOQIzrMSstxqYtdWWOnpbHLorbqJGMuBWmr3hhqJ3zEwaT7QpygihvJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3VgIBkaU; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3VgIBkaU"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a08cbeb87eso64577335ad.3
        for <linux-coco@lists.linux.dev>; Tue, 03 Feb 2026 12:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770149191; x=1770753991; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RxuGQhnhiUSSgKfkg98kr3VXsZ5hp0LNlVLYQ5k5le4=;
        b=3VgIBkaU8QOVKSfbvybIzh2kq9l1AYhsyfrqDYGr0ELklcJs0rKZkqOwJyXUGP0E3r
         2S+eoNsxfdanzGt1gGPfVW+O0tlNLlgObEZ+KmGInt4tybXDrLdIHDwPwKhuvAl9yLmR
         STaTwDHHTJze40VUH4c108H3W3R3/oaFxwiX2gobX9bX1QLOsLr0s+3chSJlaOczHAem
         h3zVHJ4OMuX0DXweiIyRzGZXT5A+nyLGW4Xk19aMkG/dqN2RO3p9SrO+MmZtH8qpu+yj
         NVLEGz/Pri4oPIhuukqMjaJs5ZHohpB8rp0GxEHb0qpOIs/sbIQw16CX0S3nJ36JRHKf
         Lz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770149191; x=1770753991;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxuGQhnhiUSSgKfkg98kr3VXsZ5hp0LNlVLYQ5k5le4=;
        b=SBypW8A5KF/aA7w+NzHiSgvpOaigzevCFZWf/whWcKB6cfQSWKQQQdKKT+N9n2gTVR
         IessRIB7z1mGmrqpLJih0e+GYeaNKmG9k5aPhGVIWKlVvqRvJOtUOb8yTXQzPQK51rqq
         v5nhRtAri4NU9+jlVBPPlblDXstPxR7Q7xCDJ3xR4bCT86mEz5o1TDavNf+7KhEDVpEL
         UUyMUL0xA4zev1zmqZyXzIat72i7BSkMM0bvGgkbSzLyJz5bYxSj9BFFGV6kwpGEURj6
         R8hSS8Fb6LP3/ZQAh9GhOszsYo+Wh/DCVExc3tZ2dK4toTuwR1+CpzRHn2IbJJrUqnK/
         gRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaKUEA0ex7T6Atsdy0gTvqY//x2ZZ6j1SSHwxPZwiyg7qKuT0DNgq+GCOgMnC16wXVT3XdVdT8+Vqd@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj9y/zX9EBVuyaeKeK4Ps4BbbdRui+uQ3uhuqYIiJx+LNlH8zu
	Pzlji4RVT1nQNKE+ql9rWITjaJ+/WpTmx3TNMGcRph3q/UrWTf5mmSxQQ8L6SlkSEn+eP43CdrF
	6cCcVBg==
X-Received: from plhn5.prod.google.com ([2002:a17:903:1105:b0:2a7:62c7:4431])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:983:b0:2a7:d7b8:7661
 with SMTP id d9443c01a7336-2a933ce935emr4755565ad.4.1770149191214; Tue, 03
 Feb 2026 12:06:31 -0800 (PST)
Date: Tue, 3 Feb 2026 12:06:29 -0800
In-Reply-To: <1c4bdb3613ebaf65b5dcf9a2268b06fa0c5a6ef3.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-3-seanjc@google.com>
 <1c4bdb3613ebaf65b5dcf9a2268b06fa0c5a6ef3.camel@intel.com>
Message-ID: <aYJVRQMW8yeTkRxR@google.com>
Subject: Re: [RFC PATCH v5 02/45] KVM: x86/mmu: Update iter->old_spte if
 cmpxchg64 on mirror SPTE "fails"
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"bp@alien8.de" <bp@alien8.de>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "sagis@google.com" <sagis@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 03, 2026, Kai Huang wrote:
> On Wed, 2026-01-28 at 17:14 -0800, Sean Christopherson wrote:
> > Pass a pointer to iter->old_spte, not simply its value, when setting an
> > external SPTE in __tdp_mmu_set_spte_atomic(), so that the iterator's value
> > will be updated if the cmpxchg64 to freeze the mirror SPTE fails.  The bug
> > is currently benign as TDX is mutualy exclusive with all paths that do
> > "local" retry", e.g. clear_dirty_gfn_range() and wrprot_gfn_range().
> > 
> > Fixes: 77ac7079e66d ("KVM: x86/tdp_mmu: Propagate building mirror page tables")
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> 
> Btw, do we need to cc stable?

Probably not?  The bug is benign until dirty logging comes along, and if someone
backports that support (if it ever manifests) to an older kernel, it's firmly
that person's responsibility to pick up dependencies like this.
