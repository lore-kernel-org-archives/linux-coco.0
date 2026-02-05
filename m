Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177F427A1D
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 15:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770306790; cv=none; b=URoU+q07iM/nq6ajx4bNPQn+Dgpwz4RFXENIIHPUkR9cIPHKB6SaGWhqFzOD0OwIyF6iKHCA1YIdp1CToWV1kBGPm8PC3+v5Gi2LqjkZqJu7lj8lem20bL5WgbOllBWoE0u2jpRFOU6mNgtsLtpmAHghacafVYlOIdrqGkRft1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770306790; c=relaxed/simple;
	bh=YqRD+cKBfYWmS+ctu1ucUed79XYvh05hyJ19wxjDW/s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mhShub7VhLrKm6KMlYJDfPUZKgQTN7lkzmGu5JnZ2p2hrxcC5AKVfXL3gHMrR+CM5gFNb4qm1zZ06OvfuNshvuTW+4woLaQeEbZXxf52d/crw2I8+MYRVYeBM09fzNZSK47CeaymAZRGk/CQDuk8cVEe44VrRdM/M4MQlS7JYIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLTZX95K; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLTZX95K"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a943e214daso23723975ad.3
        for <linux-coco@lists.linux.dev>; Thu, 05 Feb 2026 07:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770306790; x=1770911590; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xcx7wlzL60d1Aa7ekaPBgmgQ/lwDEM/p/AnSieBZ0xQ=;
        b=oLTZX95KzC2aoxNQe5Q5m9mFEIAD2+UXNz4YkPJ7XBhfC3t/A6y+/N/vXoDO1oxXyy
         y7Z/9a4Y/Ygze26Kseh38+ez6i2lB1rRSvWSZdk622feO64wky9pgrCYTRpbOSz3a3Bk
         WdbF88xoJxBQpxvY37uMr/8+uvgweUGoSQ3ugArK1RxIOCwVvT38Bc7cKksMFKbKJYKV
         NCSiJB8wYF3YqGmMLakkngEeTvqFxKsW5AAQgXQ4nwj2GhzSbj8AWYdolIxW40scUiId
         ILkPG1Q7rAhJl/9i/OOATx1hj4IXXulrGx9mamrEoomHnoF568IWLN6kbhVVw4sK+TcE
         XmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770306790; x=1770911590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xcx7wlzL60d1Aa7ekaPBgmgQ/lwDEM/p/AnSieBZ0xQ=;
        b=h52ar4i5CpNFsX1kou1X2/IgWUXpTP9mr7yKHwT4V8en2eMVJLVCsyM6D9f0BUfUWf
         NOsyka2HM+/KMw8YFFBbglBsY0PKvBqVpf5tdJFSL3X2GIXzQ5BD3HH3cK07M5dYAA5j
         ElhaMWmAkDG7GPDJu7KfxhYCtzdT7GiuJ0KGcxO5Hj/aPUM/ZhrhWS5nEewSAv3VrtmM
         31CiCjE46IFYZVoVND8+srns2VXYozXSIviao/5uj4G1L1ZtHgTBlT36bO8cWgiV4Jkv
         hmcmR6w+iYkZQ6gDHPje4awEi3xmceGJQbON4iphkJzuSjdLvsJ8141tOLa8oc/+x55W
         FAzA==
X-Forwarded-Encrypted: i=1; AJvYcCU/nnwDyEblnDRmYTb3wjaHY6CY4FCqJjHTJ27yx6o6u2JCWqWuCaWX7Euvnl+yyFDX24+zzpRHwMa2@lists.linux.dev
X-Gm-Message-State: AOJu0YwXMA9F2NuW+IziRbDf0I3Qn6VkhJ327p4ra2OrQxPYz3oHdM8V
	3PP7n2WtslZ5M5MJXzE9FXuIvq06wwqJDJwCQz4M1LtXcREmMkyZfUqvdH0i7A7PQ8T4P46FL6k
	IzgT0Tg==
X-Received: from pgi124.prod.google.com ([2002:a63:882:0:b0:bc0:d9a9:8a8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa8:b0:358:dc7d:a2cc
 with SMTP id adf61e73a8af0-393720d9943mr8123776637.17.1770306790120; Thu, 05
 Feb 2026 07:53:10 -0800 (PST)
Date: Thu, 5 Feb 2026 07:53:08 -0800
In-Reply-To: <e60e0929-f3b0-463d-8c82-dc9170e401eb@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <aXuVR0kq_K1TYwlR@char.us.oracle.com>
 <aYNaA7Td23xKHoHK@google.com> <e60e0929-f3b0-463d-8c82-dc9170e401eb@intel.com>
Message-ID: <aYS85EsXu_xuQXSI@google.com>
Subject: Re: [RFC PATCH v5 00/45] TDX: Dynamic PAMT + S-EPT Hugepage
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Sagi Shahar <sagis@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 04, 2026, Dave Hansen wrote:
> On 2/4/26 06:38, Sean Christopherson wrote:
> ...
> > We can and do have tests and VMM support, but it's all out-of-tree (for now).
> > All I'm saying here is that I'm ok landing the S-EPT hugepage code in advance of
> > guest_memfd hugepage support, e.g. so that we don't end up in a stalemate due to
> > cyclical dependecies, or one big megaseries.
> 
> Does "landing" mean having it sit in some topic branch, or pushing to Linus?

I was thinking pushing to Linus' tree, but a topic branch could likely provide
almost as much value?

> I'm all for getting these hellish dependency chains out of the way, but
> we usually try pretty hard to avoid having dead/unreachable code in
> mainline.
> 
> If it is something you want to do in mainline, we should probably do a
> bit of cross-x86/kvm brainstorming to make sure there's no other option.

I'm a-ok starting with a topic branch.  If maintaining that branch becomes too
costly, then we can always revisit things.  And that would probably be good
motiviation to beat guest_memfd hugepage into shape :-)
