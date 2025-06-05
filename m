Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9862145355
	for <linux-coco@lists.linux.dev>; Thu,  5 Jun 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135776; cv=none; b=Yo2F+N1R4y088fTqZ3eYKMQqG/LXdUJyb26JAK9MSp+5XOrTo06Ny46gEfJYgozHaszsyxRlvdc0aJ8tZuu7mWT6Boh3KTakicR2YpukStY/Rm7VbHZm1HRkufgON8xd0W3epH2KgyKT/7ZLTjASYeuCeAc+QDXsS8aPFeBu64M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135776; c=relaxed/simple;
	bh=/9oGjbRjnfueRQJIZGhA2Un3eglBFE6JP5x5vleF0JM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jKj7NARPc/E0L7JbrubWxGVQ3p/vmVmVmUZN7nT5Hqse2O0CpUTRN6FNko0CmjftNM4zjIAogQ3jluGT+SP9Mk97iJ0cvCMi+3DipoyXjvOWocGd2R/WhUTrAa7FdpWvWHAVt7JqWQUc8FQhSQP4FSTrYGNee2rPPckAAFVcfWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Be7vQKwj; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Be7vQKwj"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso635661a12.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Jun 2025 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749135774; x=1749740574; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7VKfd8Mda9jsQ2KQuKEzreTAair58/eAqehxmumcIZc=;
        b=Be7vQKwjXRhhm/xVz8oaW1eWEAePWkmOLVRAAsb6r9/UDVj0l+nxfHZ28Wpi0GXP4I
         JeIChDj4XGtfWjBjrje/CZJRaXassnff2Yll7e7g28C1Zpjxjilgmn217aZoB2JZm0Yc
         7cpp9ZqkXQBOtItV0eztr8nuLxUCs9qBtcYdSy8ALFeoavrL9b9ttXM0Zgb1GVdogZiB
         PllowGDlHbwDahZrLRnGvXd8c0FCq4qcCzRe5dRKwbZ58heyb71z3at3Mj30rw7Mlvbb
         mzRX8CZWC2cDO3CzujNJKbCtaMJtHBuhVD2T5gHFD2D9k0CV0uB9F+blRRaDjKv9NJGC
         y4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135774; x=1749740574;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VKfd8Mda9jsQ2KQuKEzreTAair58/eAqehxmumcIZc=;
        b=xOi4ujd3wbk4aLfBW9fbOer60RLOSIpM7tUPByLTsho+LH3reDvqSp4r8qonitEYnu
         JoZEsWS7MdYyLDsv6/qq0BYb2alYMxuQqrDOi52c77Dhopdr+H9OXu3j9txINTP7bV+v
         ZoAlF66Y5Dt0kjIU7xdsekhoExaAzNsabxiwYW0ufwrgy6gHyD0q/oUmREJpJFUlTazW
         FOOdRgnXt9UZddVrj7WoC5yQ4MzTNY8NZX9e+teYKCk14+jBUmtsb9RreSGxJ/dSjl0V
         KtREEoJrJr0UBK/PyTMfzjUY6gmJJhRqXw+oW3l7Pd9zJvRNvKPyiZbKhvb8RGvN9e78
         NaOw==
X-Gm-Message-State: AOJu0YzSeiuiVEKcfKP6yLo+rJQ3awXHiwPgNwyzNqri5oY7j+4NvcGx
	1pmnaEZT4ZTRA0UPiaZOMcdE4TGKUwRWTlrt2j6SscfyzQ+YDB+00iYOnNO9NsJzH+fbj9XWfMn
	YrZiEalFhNkon1uHVckO+Ja/wAA==
X-Google-Smtp-Source: AGHT+IFnu6A91F8hyb9IYuCWMuLpnU44IExyUHuWukUU1F2elsZVdXzAgW0uaSCuWvSNDeFg1ZN4aJuYGs9ROhHb/Q==
X-Received: from pgbdh4.prod.google.com ([2002:a05:6a02:b84:b0:b2e:ce0c:b3fb])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:734e:b0:201:85f4:ad07 with SMTP id adf61e73a8af0-21d22b98d7bmr10729217637.33.1749135774020;
 Thu, 05 Jun 2025 08:02:54 -0700 (PDT)
Date: Thu,  5 Jun 2025 15:02:34 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250605150236.3775954-1-dionnaglaze@google.com>
Subject: [PATCH v6 0/2] kvm: sev: Add SNP guest request throttling
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>
Content-Type: text/plain; charset="UTF-8"

The GHCB specification recommends that SNP guest requests should be
rate limited. Add a kernel module parameter to ensure a system-wide
lower bound rate limit on a per-VM scale for all new VMs. Note that
this does not preclude the addition of a new KVM exit type for SEV-SNP
guest requests for userspace to impose any additional throttling logic.

The AMD-SP is a global resource that must be shared across VMs, so
its time should be multiplexed across VMs fairly. It is the
responsibility of the VMM to ensure all SEV-SNP VMs have a rate limit
set such that the collective set of VMs on the machine have a rate of
access that does not exceed the device's capacity.

The sev-guest device already respects the SNP_GUEST_VMM_ERR_BUSY
result code, so utilize that result to cause the guest to retry after
waiting momentarily.

Changes since v5:
  * Reverted the KVM command for setting the rate limit in favor of
    the module parameter solution. The default is no rate-limiting
    to maintain existing behavior.
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

 arch/x86/kvm/svm/sev.c | 22 ++++++++++++++++++++++
 arch/x86/kvm/svm/svm.h |  3 +++
 2 files changed, 25 insertions(+)

-- 
2.50.0.rc0.642.g800a2b2222-goog

