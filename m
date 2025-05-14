Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF6B286D71
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248109; cv=none; b=c7rENJDGUrB4fhHvsoeqZ7vuJTzPqGW8n4tG2w7x+g5FTJMjuDVOsZk4K5wqL6CYY3JyqPIcf6Pa9UfkbKlZSmgxO0vaAx6W/CIZ/00s2uY1G2tV8izH7ubM4oVZb8NdEGD2DK+vg0G+7wbFETK9zBiRar+/aAkOJMXory/9ryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248109; c=relaxed/simple;
	bh=HFT9t8JByq0U3q9Zpp+GwOy9wwqsW3GjaGcLtLKWE5A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fpb0IzM3YE279ZMBDebO9150L+KdM3ZXPgcXgGYM+x9LEGtM2eulK/zn09x7XHgjivhcB7D+WwdLgnLYvdx5ANt21jMvyWXHXcT4CPLcvar3wGox0hdrM/w+69Ave4voagzjnsQVkxCVMkPZYo5Tb67GI7ondyVW1MPhMscs5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2KLWxL/8; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2KLWxL/8"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74292762324so130990b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 11:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747248107; x=1747852907; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PexG5nTtuDn9NAs1fVDQQDTrpsd+5gOlT1TA8zdSE6s=;
        b=2KLWxL/8Dj20+strz8zJZcImdxRO6ZWsnim12/XtPUHbLnm1aCFOzEbCqq1w8Vy0m4
         wi26LgnSlhglziuijC2DhCBKwTvq3+NoVUQTNA460YAt/NIW11Knw0sQYucwKwuydeUQ
         8Fjm99DuWVNGLiWG2UPltY1dlL5Hj2JelrRd4AKtJs9BSyMvwvHAYdoc3zTYbZgnlngq
         40tSEThCODWBF12pmfluvlEDAaVEsNRmMx8v1KUyLpFDPmiZGU1IahtWAoNYXfDtvHTW
         x4loOOMSJmSjlKnk044iY179HCeRWjZ7duRFMXIJYEgfzhCprWZeADnZigks0pMdHVM5
         +Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248107; x=1747852907;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PexG5nTtuDn9NAs1fVDQQDTrpsd+5gOlT1TA8zdSE6s=;
        b=m0U3M8DROv1CJWG09+edbmhOojxPfHoQluolbtIMAKagMqwS6KDgn5xdbs5Wae/ryX
         qWsVuu2FuCZrI+Ie8ox7KnrGi2pIQlvFpzy8dCDljDwYkl0pObtI4+xiIzIGqhmvVojX
         fYpBw78VSiuwchNPsuyD5VRnEDa+11JgyZEhB0svdWjclF2YrF7brgahPcNvxuzt93rs
         kKXsqh00thWTx4aa/Ut9AZQvZ8aK7He8STbE34KCUzuVlupCVrqjtY0l3Cya7lPZWC6D
         VF1Yw/CVryerHKa91fH8X2/xcXP1PwyZTn6E3+rqN90Pk8jZXUjDsqAI3eEzSmVtK2hw
         M/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUp6QJLA48bEiK5e4Cybt3pnaULRBrEdW/95ECIzX8mXLTsmGqBo1ZiOsgN1PVACGFoRckZbji6ap0v@lists.linux.dev
X-Gm-Message-State: AOJu0YzMfYwyTtxAzUpr8Dh175FjkHOKs7pAC8sEf1Ok4ubIdBe1Wq7z
	6Bx2G8sk3+1uB6du7WN1AA8o+tOcqto9jAQevOpOaJsdIUZAvCBuCjYkmvMHIBvZZSc4dCDqsoQ
	yY3reCrrnkwsKV25pOiJmuw==
X-Google-Smtp-Source: AGHT+IFjxKk2uE6KQVjUIQ4RckpNwknNnOs9R/b6M+Y2jgf5/98sJYyk3yBx0NXwdkePosSEiDmwLxsHZaC5a889hw==
X-Received: from pfbbj12.prod.google.com ([2002:a05:6a00:318c:b0:730:76c4:7144])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2ea7:b0:73e:30af:f479 with SMTP id d2e1a72fcca58-742893490a6mr6147889b3a.19.1747248106843;
 Wed, 14 May 2025 11:41:46 -0700 (PDT)
Date: Wed, 14 May 2025 18:41:33 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250514184136.238446-1-dionnaglaze@google.com>
Subject: [PATCH v4 0/2] kvm: sev: Add SNP guest request throttling
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>
Content-Type: text/plain; charset="UTF-8"

The GHCB specification recommends that SNP guest requests should be
rate limited. Add a command to permit the VMM to set the rate limit
on a per-VM scale.

The AMD-SP is a global resource that must be shared across VMs, so
its time should be multiplexed across VMs fairly. It is the
responsibility of the VMM to ensure all SEV-SNP VMs have a rate limit
set such that the collective set of VMs on the machine have a rate of
access that does not exceed the device's capacity.

The sev-guest device already respects the SNP_GUEST_VMM_ERR_BUSY
result code, so utilize that result to cause the guest to retry after
waiting momentarily.

Changes since v3:
  * Rebased on master, changed module parameter to mem_enc_ioctl
    command. Changed commit descriptions. Much time has passed.
Changes since v2:
  * Rebased on v7, changed "we" wording to passive voice.
Changes since v1:
  * Added missing Ccs to patches.

Dionna Glaze (2):
  kvm: sev: Add SEV-SNP guest request throttling
  kvm: sev: If ccp is busy, report busy to guest

 .../virt/kvm/x86/amd-memory-encryption.rst    | 23 ++++++++++++
 arch/x86/include/uapi/asm/kvm.h               |  7 ++++
 arch/x86/kvm/svm/sev.c                        | 36 +++++++++++++++++++
 arch/x86/kvm/svm/svm.h                        |  2 ++
 4 files changed, 68 insertions(+)

-- 
2.49.0.1045.g170613ef41-goog

