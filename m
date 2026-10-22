Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702900;
	b=hGuemY6CGo88hVM2R8gnFieNJSiJ85Z7u9VunR2hxnDE8SSj3ofvaO4nLi+7wjUixzHL
	 9WrJ91TeVDR2nneg7REqDrXh4L5QOIH7yR/+Aaot8djmrBPAtCI7MYJ8TKeMTKpUvIpyB
	 RLEsmw7Gb4nIJ5oPDx5ZWWdIm4WGE6gSspL7K8hXQo7cr3LPCqd8GvTJEzAPTXF1F/rNm
	 x6nPsw5uWvxYeLjMu2znFNDaMoFW/mYzo1tfYsUub0Pv/imJiUlhgAd13h9K90AKb69Xp
	 C7XeRgwB/RdcKEccdchO7Y2ALijtpvZigI9fwnvE7cNyvrj+H+eFxsNvjakaSHw9b8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OCOTNO/IXud/wgdz3r5yHSjAgnmq1BH8vHgLtdaK+l4=;
	b=PbFml8aWIOk25Ib2FJWiucZC2z9Iv3iTYZyXU779IxmqtDZdyhbM41z6Irt+wlyV/M0i
	 kcB6E0P/qGKLSAv6ATQfi+Joc1+V4+L60cWn7tB9QL178SmQdoAylE/W8MlLVIph7f2kv
	 zaoYNS2NKw1N8pg5cFMc3xZcD33WHGq66J85z7WfjGhLLQxOA5BdACFm7ZsoW7ldtiOql
	 UTvrbFy0lOmnNJ7PCQM83uL8gL+/4txanLQNkUUuL+KReyNbx43Yj/CAa8KUr0V8onrMx
	 s2ra2umEIrPrDODuG4bHtSjxooOlJXm0l/6hO4bpM7KY+eiGuOv0i6Br0KCN3EqdiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uAz2mCgh;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37057606A31B
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 21:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37057606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uAz2mCgh
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so135192a12.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792702899; x=1793307699; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCOTNO/IXud/wgdz3r5yHSjAgnmq1BH8vHgLtdaK+l4=;
        b=uAz2mCghJizlLHkj/PIgj4YrBNKRyP2WW5ALXTsG//SGEGJqiBW5OAAdFeO692phfn
         7eSkQ3dfCpUEBj7gE4dGpMS/G3BBaxPmqMPpjyeOsRYTjDLYgL9zjYHqWzZabxb/T/zZ
         xVFTNA+3SwxhoD5yyWqFW7lMc/Ew6ap7aiMsmOKqd5GDrrolzhBt3wKltXh1GnXElaef
         yXx5Tzd4raqyHt0kSv2ZGSErmiImHaQHtBKaIXpyGWGn/ofWW2UicWRQNN51D8RgENgo
         w/1vJnWS/wNltMoCuh9bVPWx+gZ+6Ir9wfPwMbsQPC7Fc4shrGeKeNxrho/RdgHwhqdp
         xS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702899; x=1793307699;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OCOTNO/IXud/wgdz3r5yHSjAgnmq1BH8vHgLtdaK+l4=;
        b=v9nwtxHh68wgHkN3HPspVp9fXh07wTQoA6NseutkKyzsohxUr7TOicoulYZrkUTbYJ
         lZ6lr5tr7oRdKU/HhCvgXJtmkY/xwOjbXQ8FGWVTREwGU9hYPKqtIzHgboYvqEw0iTbn
         XKk5qpX4aFqC2I5nKvo/e8hZJN7KVSXLZLKQgHQGpi7lpTjQTf3Dk4pT4xbA9LfX4if4
         Cfvh7BkAr6ic4FQmH1b/O3HgxntoHnwt9IIB1wGcDAUeDwI2p5kqSEVdg3Zjcs830+gQ
         0sMDlkJRT5R52NEWCuhybecOUwoNaXRfiB4GZadKbtv2/Cg3B8cdFpzl0r4QyrbJELWk
         QGhg==
X-Forwarded-Encrypted: i=1; AKwUvBzNXSG5teDMpQeHa32nLtVGrb8YOSsP+2v7Ij3oV8el5cXS4o0gCFQY4i6ODtXr00SUK1pQ6FqeypjN@lists.linux.dev
X-Gm-Message-State: AFq9FYJgt0d3K3OxqWrShQf3Jw8206I8X1ihsMHnGKinifV5MjiLaN2W
	OgKo2mqfajfPWHRzu5F1GhNyzbKU66WnInYqle2GbVxST4xbbtgEZlsJ0oS/Ez0rJW2nMUgy+UG
	m5WbePA==
X-Received: from pga23.prod.google.com ([2002:a05:6a02:4f97:b0:cd8:b4c4:efd9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3e01:b0:3e2:2c81:bc6a
 with SMTP id adf61e73a8af0-3e376674955mr107626637.47.1792702899271; Thu, 22
 Oct 2026 14:01:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:01:31 -0700
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022210134.612848-1-seanjc@google.com>
Subject: [PATCH v2 0/3] x86/cpuid: KVM: TDX CPUID fixes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Boris or Dave, can you grab patch 1 for 7.4, ideally sooner than later?  That
would avoid having to carry a stable topic branch for a trivial change.

Annotate CPUID entries that have a significant index when reporting TDX
capabilities to userspace, and enforce that userspace honors significant
indices to avoid creating a misconfiguring between KVM and the TDX Module,
which in the worst case scenario could lead to host state getting clobbered.

Patch 1 is a fix to mark function 0x23 as being indexed.  That change is
needed to avoid tripping a WARN sanity check that KVM and the TDX Module
agree on which functions are indexed.

I'd like to take this through the KVM tree as it seems extremely unlikely
the cpuid_function_is_indexed() will conflict or grow other dependencies,
i.e. creating a shared topic branch for this seems rather silly.  Actually,
a better alternative would be to rush patch 1 into 7.4 so that I can use
7.4-rc2 as a base (even rc3 or rc4 would be a-ok).  /me adds an intro

Note, SIGNIFCANT_INDEX isn't a typo, KVM's uAPI macro is misspelled...

v2:
 - Add CPUID.0x23 to the indexed set. [Rick, Binbin]
 - Document that zeroing the index when it's supposed to be ignored is KVM
   ABI that at least QEMU relies on. [Binbin]
 - Zero out all of flags to ensure garbage isn't reported to userspace.

v1: https://lore.kernel.org/all/20260223214336.722463-1-changyuanl@google.com

Changyuan Lyu (1):
  KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate when filling CPUID
    entries

Sean Christopherson (2):
  x86/cpuid: Mark CPUID function 0x23 as being indexed
  KVM: TDX: Reject KVM_TDX_INIT_VM if indexed CPUID functions don't
    match

 arch/x86/include/asm/cpuid/api.h |  1 +
 arch/x86/kvm/vmx/tdx.c           | 22 +++++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 814607cd40df80d5727957adaa857e0feca43497
-- 
2.56.0.257.gf7497c7d27-goog

