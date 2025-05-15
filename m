Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E32289364
	for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346658; cv=none; b=g7Ga9RflnZ5DGEogfUhwyKeFOsgES0SZfMrLIXZZrSOKX/bZE5MaLMyLIEjlKjyowup/8EPtbuFT4iSYnR34QaXz9jhAfXhSaryolO0v0nSPk/EE4w6fNAn7YdaPPyLNzNQK3C2NWY3CP3KNiJ6sb+oKVqbd0UF847luSOr5+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346658; c=relaxed/simple;
	bh=fwldXoroq5XBUEJ0quH7C1UmH9HOLo1mqXHCCdRb9cc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AD89DkmrSPrk8yCmX87hIfleHGDW6N8ZbpKRz4qn6FxMybLWrOktbFSzn9rbSRH2DuoVFHCpl/qQe7eaka/Dckm/A+UrEZAxX9SljdedTiN0YDdLCmgqeKJG5Vxe1lcqlVyJlLrCmUtbJ0ULxwqfITenN3ODAvR7S/ROgLF3qDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lOOsLpfQ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lOOsLpfQ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22fd4e7ea48so13446835ad.3
        for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 15:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747346655; x=1747951455; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NL+bcQz8U5Llwby9qZ/g3HOxD9xJ00J+/SoiAzJaZ80=;
        b=lOOsLpfQlN74X8mcqPSyWB212vr8kxZk0jcR5u2OpBgj4IfjmaAxSjmpRnOXvpRnSM
         JHwYCYgtxyuR2TmAsMlNZZ2UIhf+bdx/fEYw+puamrIvbMGBKHyErf1sdR9uHgWlwRaP
         L7K+ENarumRKENceq+p+Dk7IdrFe86Pb2mlyM2UxM9SEkZ7abchH/1dlkURxrL5RWDOu
         WhxGMBdvIzBbhvLEfqC5N9p0OYD2aXG6J5n+XBEqQKmofCNKS1bHf7UjDW8mboDNL8bD
         NtbQAGqO0ivEweHftxbEDHf6flFNVZcU665ONqmLyXbhZsENIDo54TIfBa2U0O8Mtaov
         yPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346655; x=1747951455;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NL+bcQz8U5Llwby9qZ/g3HOxD9xJ00J+/SoiAzJaZ80=;
        b=R5LMbTvkeUvf61XNKwHUWmL8XRDZL9TES1eIsktAik3zgB81eMnUdsLMvs2oy02+vg
         P4Yfre+kB8rgG4FW3QFfNY4kFYKRCDC1seGO5XrSo0sRmTrqOwwNqg9sKlE1BD2mDYtR
         soawvtwkEkLvsO+amIwGKq5pHkS8U09SCvOqqyfSuO9zOaQm0eBQodcx4ddRBfNLRvgd
         cD2wYPU7YPwyO7IDZeTXU37PXNQ4sMhX3W/xvHyprVKia4B8Vjy9ALONzKOWJpe7TDLn
         YMylMdIgT4LyYsBgH7cPQmGUCEsXE4QapdTv9naUF4wiUZThOTgKGGbUPH59G5VApp8a
         xlcw==
X-Forwarded-Encrypted: i=1; AJvYcCVQoSi9C27P7K7v8dI/HNnjNYbfC+wLYbhVdxtaKpB2ZAWQ4R8DpW9vzQYSRSvDc4MYoWSKDV0VTLH9@lists.linux.dev
X-Gm-Message-State: AOJu0YxBT90oTYpuTEb4lYR12N3paqSpHEjvc8oMUNYBt89HfNLd7Rw1
	r5U5YJ7UcFDGkuf8sLODlgmBloXKXe6anF/CNTY6X79qhcYgQhFtkH4E6c26pZI4xUW2af4/uL7
	qSxQ1tPO74v0y8GtF49CednzlkA==
X-Google-Smtp-Source: AGHT+IG/Mw7qmj3Mxbl76BVdTruv+BrUfU87J4WKFPJAAHk/FfhcnDpLwk4Q9Zzdf5/4KmQMj3JGw2Mx0UiqJxmNNg==
X-Received: from plgi15.prod.google.com ([2002:a17:902:cf0f:b0:223:294f:455a])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5ca:b0:223:f9a4:3f9c with SMTP id d9443c01a7336-231d43d5526mr11709575ad.9.1747346655484;
 Thu, 15 May 2025 15:04:15 -0700 (PDT)
Date: Thu, 15 May 2025 22:03:58 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250515220400.1096945-1-dionnaglaze@google.com>
Subject: [PATCH v5 0/2] kvm: sev: Add SNP guest request throttling
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

Changes since v4:
  * Fixed build failure caused by rebase.
  * Added ratelimit.h include.
  * Added rate bounds checking to stay within ratelimit types.
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

 .../virt/kvm/x86/amd-memory-encryption.rst    | 23 +++++++++++
 arch/x86/include/uapi/asm/kvm.h               |  7 ++++
 arch/x86/kvm/svm/sev.c                        | 38 +++++++++++++++++++
 arch/x86/kvm/svm/svm.h                        |  3 ++
 4 files changed, 71 insertions(+)

-- 
2.49.0.1101.gccaa498523-goog

