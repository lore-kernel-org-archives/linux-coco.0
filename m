Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EC538F648
	for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 23:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419212; cv=none; b=BYEON4vHRWRoR5omwl1mqIRD5QqTEOuUCxAMPmpm3quNVrccDhtnRFSLUUS1kFO955mwrNdSuMyevwah1zN1atgIeivGuopSm2Onse8rOxt3MBybVUDfono9ey6tFUQs+33nFR+MmNUzdO4wf6uPO682/kvEvQNR6t8xpSrC0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419212; c=relaxed/simple;
	bh=u5jNgX3aBCZeke7gIDGCVPb6JkDwECjFRBtYrME8E6o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YrI5V+uroFY+y0pD7y+8hciFShaOgoqI1C/1erIWxdk7IwQsOVp91KfihuUsMD19VVACL1flFHeV3n/R+7oVzOz4Vg7cu6Kr+ntU3ygioUf0bi6XWfUAgBzlNrEkXITnW7qn73zkDpxVtaQBfPyYEO6LB1PIfUOhjYS36p4RBgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i171scjr; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i171scjr"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b249541063so106780645ad.3
        for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 16:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777419210; x=1778024010; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JywkponAAlLbpKs0ZR4pdZDQ9JhpG3xml6Pp+KH2bc4=;
        b=i171scjr5ICGpYKnB/hfjhjBN6+5EY6pXNG0uxNkxs+meoddvvt1EAJm2R3F32kL7C
         Rv434mHdVKhAswjy7sDGEx+OeSQDivWrP0pHG1HHMIolIsO5KCtWhUK6jeHbAwEUeCAf
         Yyp22HduRfvXbjcWpJrnfS8w0R0Z8U+FGuHX1SUEprxPSVzh8BTggMQ644P1G0FL22Ow
         hr/Gad0Tp+ryIvs+tsRkVEBJq3xsploQJG43N/ZeLFiSWvwBQfWHMmAGn03YlM4o8KUD
         PAoDKRAlAP0fJvV3M9dJTi4ysIxP8KC1OVRcGtAaZGGkI3H26Y1NdNzT2rkOaRWzoMLF
         S8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419210; x=1778024010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JywkponAAlLbpKs0ZR4pdZDQ9JhpG3xml6Pp+KH2bc4=;
        b=FMek2oa+s5t+160bIaBJJWywlwhQvGc3AshS0BndfOIb+UL28C0RI2eXPNbpn4W/ZY
         zqPBg95ODA03olCf+fMeVIhotht62m9R3xv8I/1Quz14EfXczAa0pAazKCy7VIdUEXOK
         RTjt+A1kX2nierlmH4fPohsjV1hNuZtPtTy8KEhmKOhgafVufRfBiy454D1Vc9J/te4+
         UilsBr5HtaoUsM06w73HuAoiYExoXG0Ax7CRsPTNqdxDLALGc0cHpSWXLIyBmK/mIrra
         YouoUSg7AeUIVZGepibRBdrrF5LPu9Wy9FmPcAIzpPXQD5iUQMxlGGQkwFKo+Vgm3ORo
         ZOPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4rr5/XBM4InBXsjNwAbFjEStqAE9aywxcOO+8fPqE8d1hLjKXiapSulH+jsLNoZPQ5oXnya8FBHvG@lists.linux.dev
X-Gm-Message-State: AOJu0YzAnGEIwDSOxLtWevFpq40F6ItMbsVSm2IbBTutu1mlF2EvXzkv
	e6gzmyiJu/Mvmq57E1PjBx9ZrZKsKO99KG0gLPmqWysO93qjsUTi06Ux5sSN3AAjLVd6y7ooEMP
	aGyeDsQ782C37VJ9UuXKdatgWAw==
X-Received: from pgbcr2.prod.google.com ([2002:a05:6a02:4102:b0:c76:1d9:8c20])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6a20:b0:398:8546:c3fc with SMTP id adf61e73a8af0-3a39bffeb82mr6084413637.7.1777419209934;
 Tue, 28 Apr 2026 16:33:29 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:20 -0700
In-Reply-To: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <cover.1777418884.git.ackerleytng@google.com>
Subject: [POC PATCH 0/6] guest_memfd in-place conversion selftests for SNP
From: Ackerley Tng <ackerleytng@google.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com, aik@amd.com, akpm@linux-foundation.org, 
	andrew.jones@linux.dev, aneesh.kumar@kernel.org, axelrasmussen@google.com, 
	baohua@kernel.org, bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, chrisl@kernel.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	forkloop@google.com, hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, 
	jmattson@google.com, jthoughton@google.com, kas@kernel.org, 
	kasong@tencent.com, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, pratyush@kernel.org, qi.zheng@linux.dev, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, shivankg@amd.com, shuah@kernel.org, 
	skhan@linuxfoundation.org, steven.price@arm.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vannapurve@google.com, vbabka@kernel.org, 
	weixugc@google.com, willy@infradead.org, wyihan@google.com, x86@kernel.org, 
	yan.y.zhao@intel.com, youngjun.park@lge.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

With these POC patches, I was able to test the set memory
attributes/conversion ioctls with SNP.

The content policies work, and PRESERVE can be used before the SNP VM
is finalized. SNP_LAUNCH_UPDATE can accept 0 for source address and
the SNP VM runs fine. :)

Ackerley Tng (6):
  KVM: selftests: Initialize guest_memfd with INIT_SHARED
  KVM: selftests: Use guest_memfd memory contents in-place for SNP
    launch update
  KVM: selftests: Make guest_code_xsave more friendly
  KVM: selftests: Allow specifying CoCo-privateness while mapping a page
  KVM: selftests: Test conversions for SNP
  KVM: selftests: Test content modes ZERO and PRESERVE for SNP

 .../selftests/kvm/include/x86/processor.h     |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  12 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  13 +-
 tools/testing/selftests/kvm/lib/x86/sev.c     |   9 +-
 .../selftests/kvm/x86/sev_smoke_test.c        | 255 +++++++++++++++++-
 5 files changed, 271 insertions(+), 20 deletions(-)

--
2.54.0.545.g6539524ca2-goog
