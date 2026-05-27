Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50B47AF4D
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 18:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905673; cv=none; b=Fomal9FxA7BcxbHVTQZ0XKn4zT8+GQwdbol4GhywnTbY+eFfaYrRKzWxS5GzZdVvqTbv87VZZpXIRcUu4xPIXn0R0YUo09JOiIvHa8FnSNbP5Bh90Hn259kly2LjYEY3CoN5hE2TZmg6ouWLSuMS1wSoO4LuLG8jcm356gf3aU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905673; c=relaxed/simple;
	bh=O9pOk5v+q8VTzg7ynkOmwYh/WXaD4qHadkilsV42SIc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TfC/QpzWMTzD4tGS4X4VOHD2JZ2NeqaGtqcQ3GQV82RSt1aCCDP03FXsOctmmaqxX1iyNM6aEExSSwQ3soJ1nEufaHeqFaL8r1Uh6RtlA+hlEEr8Pv628quAEyLV7EjZOYYH6rkB4kukOqkWmJQTAICSnrwRDn+qWcExN5TAk4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t8m+a+ip; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t8m+a+ip"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b99eb06178so28131575ad.2
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779905671; x=1780510471; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQnId2rHDW8In1E8uy3X9GmOauCk23K9nsxnBe9nCG8=;
        b=t8m+a+ipdRLp7y9i9TQ1jGG7j44S0xwKaiqF+Ls9CVF+rR+ABvyEzRQ7/slp5cOPqz
         Erm0vBYJGVH/O1XOs0SadUm7miYKLtgMwuxAGLMFEe6jhR5P2e+eTn+hI16mdP0U5yNC
         GCPJ90KqeMIHH8tsMqVSJ8VMlKN7xzVTZUk9ucSlv4beqJakajsAKU3wWEpD3fFZVwGz
         DKUH85PVtepJfEUJ4LRaqbiqHddrq1vb7fNeL1TLBG2foxzVqwrz24LCJ7mpn4BYk4vs
         kAuU21in54lB+mauzHbujGH9uF4rHfAekNbY/HARQ1qugbpIF0kxVJ/6W9et+SHHBvMX
         dRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905671; x=1780510471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQnId2rHDW8In1E8uy3X9GmOauCk23K9nsxnBe9nCG8=;
        b=nnWmRkw6uiqX+mqU7NAjtAmW/G088+NEPr4p3+X56yIKpueh59vyft4k+w+M0WUYlq
         llkl7JPAFZAiXTxP0AyXQZb9qlL+9b2FG5NRNEc7KdSADSb2XIkGHUCrmxNd80n2Mb8T
         W1xzgnb02zkrNu++C5LbU0wOuF3o+5rbaL6ENZzD+3tgE1uX+HIUSZ2xh/XwGOLNTmyF
         wiNFgh6A4fadwWCAcN24mmJx2fX2iG5JtlGlkDKs4KuT+JmO3KdCj+sklZ9DFZl8BMnW
         bhyL/j9hqZCYFsAs7OJsyz+ejTMv4AZRo2b9SV4tWiKzNAAR13S71C69wkcZCyBZZQKr
         EEMw==
X-Forwarded-Encrypted: i=1; AFNElJ+h4VoAy4wEi44IE9Tn01uqTE3fHz5I45XF8r7QT75A9vn0M1/o1YBQRcWUJ0hQrBsvRBIcWpg1qHTn@lists.linux.dev
X-Gm-Message-State: AOJu0YxFr0Bz3cM6Urkem7npmuQ8NDuq6jyEa1O4HY+pSr7V3jIpt9T7
	ZfVSUCWIYdzhTY92J50iRCHc3J0vgrj99z97B8lvjGGIryR566b2wwvfQAlyAjGjq7kHSweNHNg
	7CbQVqw==
X-Received: from plop17.prod.google.com ([2002:a17:902:8a91:b0:2bc:9bda:56d0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f64e:b0:2b2:50bd:83b3
 with SMTP id d9443c01a7336-2beb035c826mr257510165ad.10.1779905670713; Wed, 27
 May 2026 11:14:30 -0700 (PDT)
Date: Wed, 27 May 2026 11:10:12 -0700
In-Reply-To: <20260430014852.24183-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260430014852.24183-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <177990514368.4120011.1575758464694752462.b4-ty@google.com>
Subject: Re: [PATCH v2 0/4] struct page to PFN conversion for TDX guest
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, dave.hansen@linux.intel.com, pbonzini@redhat.com, 
	Yan Zhao <yan.y.zhao@intel.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, kas@kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, kai.huang@intel.com, rick.p.edgecombe@intel.com, 
	yilun.xu@linux.intel.com, vannapurve@google.com, ackerleytng@google.com, 
	sagis@google.com, binbin.wu@linux.intel.com, xiaoyao.li@intel.com, 
	isaku.yamahata@intel.com
Content-Type: text/plain; charset="utf-8"

On Thu, 30 Apr 2026 09:48:52 +0800, Yan Zhao wrote:
> This is v2 of the struct page to PFN conversion series, which converts TDX
> guest private memory mapping/unmapping APIs from taking struct page to
> taking PFN as input.
> 
> v2 is based on v7.1.0-rc1 + Sean's 4 cleanup patches (see details in
> section "Base" below). The purpose is to get Dave's Ack, so Sean can take
> it from the KVM x86 tree. The full stack of v2 is available at [14].
> 
> [...]

Applied to kvm-x86 mmu, thanks!

[1/4] x86/tdx: Use PFN directly for mapping guest private memory
      https://github.com/kvm-x86/linux/commit/6ad0badd765c
[2/4] x86/tdx: Use PFN directly for unmapping guest private memory
      https://github.com/kvm-x86/linux/commit/4c7a1247646c
[3/4] x86/tdx: Drop exported function tdx_quirk_reset_page()
      https://github.com/kvm-x86/linux/commit/4a72a6dc447d
[4/4] x86/virt/tdx: Move mk_keyed_paddr() to tdx.c due to no external users
      https://github.com/kvm-x86/linux/commit/3f330fbb918f

--
https://github.com/kvm-x86/linux/tree/next
