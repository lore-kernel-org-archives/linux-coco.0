Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C582AE68
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851734; cv=none; b=CjlL80LTfQniwRW2d8D0cTuvvJF95cCaARZ3Lkz8/Mjcj/cH8XY5KqsXCikaDMc8fcTUcA/ZkumzADPWaOdUo0YEQcDWZRgQESOwEH4Sc8ViMsqsxVtRBI5MBCvLW4KJToV+qYoP/61r8s9M22cgae7h0Sp03EsN9LoCUnF7DG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851734; c=relaxed/simple;
	bh=lWzlB0iKIoWvR0KWONloUbPP7jxIV0kTEpcbpDhzXe8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VZ8SxCClKV51MOpTD/zYPbfMeA+lZO/APB0io7eiAvgIovqyzCyRYSh4zlFpWv5YnU/V6asj0DT7xyl1G5maEt9WbPQwcU8d9rHirnc0IZCDblY/0piEawanPGwl3rXTOWFuFc35wJPgY8ntDtwG3tlDWcR2Z8mXk6pFc9M9sfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U5EYEjeI; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U5EYEjeI"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2698b5fbe5bso19393705ad.0
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761851732; x=1762456532; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuU0G1rKKzQ0bN8b2xmtCp6y8rTt4E6EmC8pujr8+1c=;
        b=U5EYEjeIFs3KJ0Buar/kH2NJt2aDUmoD6PEbR/JKZSmT+wltEZjQLwctbp2a4xSXne
         Dr0nGe1QrmpYg1v9kR84UTJAVxkm/O1zVN7JtjJcGpWMiKxdu7fMGUDQ06qkLKzBZO3v
         e3Cetv0BXu3rdipSJ/jpnxK1PM1YqT8dV1JsYSey+N9ZnYdP4IgWij+ffwRIVbYx0Zlk
         DllXbYcnKNvwqWAg58ZAkU3jIHcMFfzXmlCuLpxp6WR2/iR9EfmSyrbCUcqV4zYtdJql
         gL79GL7wVl71k9nl/BYqjrA5eupwgVyB8h/lUCw/OeyOuXr4NRnED/mU+pm6NmMB8y7M
         3AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761851732; x=1762456532;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cuU0G1rKKzQ0bN8b2xmtCp6y8rTt4E6EmC8pujr8+1c=;
        b=JPCFx19TYGzGryl1TFA6mswi+37JOlFblurtwNCzB/3/ywxUsXmMNMhVmZ+EmuMbDW
         VUK81wUvRbFnOadTSz3eKD8f9pQTsa+qs9veQB8nLVjPUufctVEssNaU7WA561XscLgq
         yF6RozdwLnkk0c28bVEx0MueT6Zv+jfRXsWh3U7RZAai74etyqmz1v5P3eic4RAl6cx3
         v6iGxdatrNVfESlXf8gXKuzwvGaC/VhLbZa7HATXZuB8NWWYHFXbBPwS0ApkDlif61/P
         iz5vNWtYMo54DZZ5W2a2owEMD3RfK953tT5t15UYkw5zlp9x9TuIipQ24+en2dLkKKKV
         eZKA==
X-Forwarded-Encrypted: i=1; AJvYcCWK4y+GmlAEDWQdx4xuYW7VP/w9SYKH+pujSIUSGeYYzKzWmIHHKwONMlnA0Tz5zwCKS3Cw30qcBC83@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv+rJMTyT7IJoF6C2nwPBt62dP3c3KPIsjaa4oNJmCnSmcmzQi
	7R5JYDmQAPMRxqpxUI4X7YX+bDjjauDuuPk/CNU4sr3NiJuphbO7v39wE4ShxfH79xo6Xrpu88R
	wMp6ZAA==
X-Google-Smtp-Source: AGHT+IHh8pk9JaiOfs+9/GV0orbjyBBA2NWN7A++gjRGRE1BeSyhooYBSK8ujIaLO6y5tDeY0PhwGLCZviM=
X-Received: from pjbbf22.prod.google.com ([2002:a17:90b:b16:b0:330:a006:a384])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e892:b0:25e:37ed:d15d
 with SMTP id d9443c01a7336-2951997e352mr11605825ad.0.1761851732223; Thu, 30
 Oct 2025 12:15:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 12:15:24 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030191528.3380553-1-seanjc@google.com>
Subject: [PATCH v5 0/4] KVM: x86: User-return MSR fix+cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"

Fix a bug in TDX where KVM will incorrectly update the current user-return
MSR values when the TDX-Module doesn't actually clobber the relevant MSRs,
and then cleanup and harden the user-return MSR code, e.g. against forced
reboots.

v5:
 - Set TDX MSRs to their expected post-run value during
   tdx_prepare_switch_to_guest() instead of trying to predict what value
   is in hardware after the SEAMCALL. [Yan]
 - Free user_return_msrs at kvm_x86_vendor_exit(), not kvm_x86_exit(). [Chao]

v4:
 - https://lore.kernel.org/all/20251016222816.141523-1-seanjc@google.com
 - Tweak changelog regarding the "cache" rename to try and better capture
   the details of how .curr is used. [Yan]
 - Synchronize the cache immediately after TD-Exit to minimize the window
   where the cache is stale (even with the reboot change, it's still nice to
   minimize the window). [Yan]
 - Leave the user-return notifier registered on reboot/shutdown so that the
   common code doesn't have to be paranoid about being interrupted.

v3: https://lore.kernel.org/all/15fa59ba7f6f849082fb36735e784071539d5ad2.1758002303.git.houwenlong.hwl@antgroup.com

v1 (cache): https://lore.kernel.org/all/20250919214259.1584273-1-seanjc@google.com

Hou Wenlong (1):
  KVM: x86: Don't disable IRQs when unregistering user-return notifier

Sean Christopherson (3):
  KVM: TDX: Explicitly set user-return MSRs that *may* be clobbered by
    the TDX-Module
  KVM: x86: WARN if user-return MSR notifier is registered on exit
  KVM: x86: Leave user-return notifier registered on reboot/shutdown

 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/vmx/tdx.c          | 52 +++++++++++-------------
 arch/x86/kvm/vmx/tdx.h          |  1 -
 arch/x86/kvm/x86.c              | 72 ++++++++++++++++++++-------------
 4 files changed, 66 insertions(+), 60 deletions(-)


base-commit: 4cc167c50eb19d44ac7e204938724e685e3d8057
-- 
2.51.1.930.gacf6e81ea2-goog

