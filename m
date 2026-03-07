Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9550129B8D9
	for <linux-coco@lists.linux.dev>; Sat,  7 Mar 2026 01:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845615; cv=none; b=EcDHr+Arl+fuPuCHy6Bn8uwjrLkGX+cI2BJLP0p/f1IHzSyvz42j/ykKrvXWiu+8CWaMfEzvLc090DhsJVALf4iOrkTMfnT+hLdq0cpYFg2WEoETwXrvxGHp8vAC8vEkJZUS6jGGp78VmmhXa3JW4PSt6665XdjFF6vTpgXLwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845615; c=relaxed/simple;
	bh=wocwMBtmqdX0JKhTFqmK3JOtLY3emCOw7nguFyk44ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXuWnMD7DfPjFveSlZ6uytVqvnxROe1TW8r6+UXCwybSBufckFdt0dgaDmcME5P6mIzxcPuB7TlaR7wVhY5HlaC4pmRGHNmu1dgkq+deLWzHhV7DWw/Q7XO4BRvFH2QyU1E1BCUmVHTNk5+feRjFZbIn4mDaJ7WtAA/cvXFg5ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WjfYDInQ; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WjfYDInQ"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-79827d28feaso99970377b3.3
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772845613; x=1773450413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKwzPlEBkrVJivPlO0kAq6WzLFvPFMNSILdYW8SSrFg=;
        b=RY1AMz/FCY43YdcbqyYmj4NGoQKeI6wcx6MYhYfD9e7ILjoYQMomE7LNUocowSCzRC
         sGZySBdvkB8mEl8STuUzzF8vmPrQK3tn0mkl3hheSEgoQho+OvjZQRaZWd+I4UZylPEH
         Uh89lHG95J6uBB6RUtRezgcd4gjhIxIFuRyGNVuqoU9fVpXnXr4ZeVrnRwobcdhna/6n
         V46I/0e/g/eL0tD0+iiaOfyrSVuywo31WW5fCOsu0qy0iu70BzUMjl1dRJ77WtorxnBu
         /xuV13QPiyV5jLWrcsu0l43C91+Sf/RUkOXFZbtkO5hYA/FKzj8mD+6liwkXySUg/1jV
         Baag==
X-Forwarded-Encrypted: i=1; AJvYcCUU0iWPiyviP5aeECJOBTDq/nAtbzt187olbObp00mZOkbpEJOkHvX6zVxLZSOxfzhPep18XYsldfwO@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9G5LdBaKktBCxZS695x7aDqj0ecOJc+V/x+dfff9XWVTh/UUL
	e7mzTrHUmngE5sjgF3cf48yNPEZUjgvkbzihprd2xwgbKCHbzRnEITA1BKek0Mj6n+MmDIu7FFQ
	Xbn+CGOEkzJP+Bb+IYHQATfyEdvRLLMzXCeEnEADLBYY3WCiafVy4KUuqoCzNQlvyH2sFFnS8ik
	1+qrAqESwLHC/5qvtqke+9cEDw3Kq+Ae71RWZ3qZC04ph6tRbVdEwACimDmlkVwaapFXzL/93kQ
	MdI7qLy/qo/wKK60TuE
X-Gm-Gg: ATEYQzwDCAmoOv7t4V5WnfQhZkFuIgu2jH+Cz7oTuzsSzc4c/iALDdA1xl3z9Kvx2UD
	0WtZHJUJ2YB2MKKKp/Zm1YZ6uQMwffNGdtMkLqw68mYIx95s7E0hpHwATp1HZ0cnxab3SozOi6Z
	n3xW346CZ5rSO11Xa5yL02o2b6Zkph6xhlstowevFSLpGesrrjbqy7mXdJzWxrk26+kYE5x6C0f
	p1yHxcS5RM34J1MWh5Jp6+Xt2gw4udLeBeoe6PDb+Y0GTE/SxwZX6DARS0VvHMmsAk+bRYdTjQA
	R3Xq7WafidIN3Upapn0UsU7qGo2BjepC/8s7zelMaIYYmtiXTsjlfs3nSr61blqZM4ql3kwM0/I
	MAQ8rNZG8DgZcYNq5EjLXtUcIdVSLeKsI0vJ967ACAoADl0opKVuqtkH8YEAQv0EkkL6VGqQhoB
	drfynhNfmaJkykXrDA3VDaiQ24c+yEXOrzdGFebj1HtnuFbk8/L9oeiuTkObkpahg=
X-Received: by 2002:a05:690c:498f:b0:798:5fab:8f09 with SMTP id 00721157ae682-798dd7d0303mr37869917b3.59.1772845610630;
        Fri, 06 Mar 2026 17:06:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-798ded7ed06sm2966997b3.25.2026.03.06.17.06.50
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2026 17:06:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so9445473eec.0
        for <linux-coco@lists.linux.dev>; Fri, 06 Mar 2026 17:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772845609; x=1773450409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKwzPlEBkrVJivPlO0kAq6WzLFvPFMNSILdYW8SSrFg=;
        b=WjfYDInQtgXaERMxCk+Bsp+0vRtbDlAHZtdZFFURywO2tFZsx/hD7cdUuCv8U81DdK
         ikkPWa8omUV8gTpTSVNJ67OuycbxvBvyj6IyXxRWzXHC6vSEslvpJ/XnTGxQTH5LGYp6
         B0QwbBrY28L0WdjYt3xNORutgL5erxJaaWshg=
X-Forwarded-Encrypted: i=1; AJvYcCWNpY75L0pOEXE8nMUZlNsoTgAqUFTQHNJ9l3/8D0dgAIcR9KqzxrKfF21NZ1DiFFImZ91akln8QHtR@lists.linux.dev
X-Received: by 2002:a05:693c:3101:b0:2be:aa:9a4a with SMTP id 5a478bee46e88-2be4dd62c65mr1466897eec.0.1772845607420;
        Fri, 06 Mar 2026 17:06:47 -0800 (PST)
X-Received: by 2002:a05:693c:3101:b0:2be:aa:9a4a with SMTP id 5a478bee46e88-2be4dd62c65mr1466860eec.0.1772845605215;
        Fri, 06 Mar 2026 17:06:45 -0800 (PST)
Received: from amakhalov-build-vm.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80cc1dsm2237336eec.3.2026.03.06.17.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 17:06:44 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: x86@kernel.org,
	virtualization@lists.linux.dev,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	mingo@redhat.com,
	tglx@linutronix.de
Cc: ajay.kaher@broadcom.com,
	brennan.lamoreaux@broadcom.com,
	bo.gan@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	linux-coco@lists.linux.dev,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH 0/4] x86/vmware: Hypercall refactoring and improved guest support
Date: Sat,  7 Mar 2026 00:42:34 +0000
Message-ID: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This series improves VMware guest support on x86 by refactoring the
hypercall infrastructure and adding better crash diagnostics, along
with encrypted guest support for the steal time clock.

The first patch introduces a common vmware_hypercall() backend selected
via static calls. It consolidates the existing hypercall mechanisms
(backdoor, VMCALL/VMMCALL, and TDX) behind a single interface and
selects the optimal implementation at boot. This reduces duplication
and simplifies future extensions.

Building on top of the new hypercall infrastructure, the next two
patches improve post-mortem debugging of VMware guests. They export
panic information to the hypervisor by dumping kernel messages to the
VM vmware.log on the host and explicitly reporting guest crash event
to the hypervisor.

The final patch adds support for encrypted guests by ensuring that the
shared memory used for the steal time clock is mapped as decrypted
before being shared with the hypervisor. This enables steal time
accounting to function correctly when guest memory encryption is
enabled.

Patch overview:

1. x86/vmware: Introduce common vmware_hypercall

   * Consolidate hypercall implementations behind a common API
   * Select backend via static_call at boot

2. x86/vmware: Log kmsg dump on panic

   * Register a kmsg dumper
   * Export panic logs to the host

3. x86/vmware: Report guest crash to the hypervisor

   * Register a panic notifier
   * Notify the hypervisor about guest crashes

4. x86/vmware: Support steal time clock for encrypted guests

   * Mark shared steal time memory as decrypted early in boot


Alexey Makhalov (4):
  x86/vmware: Introduce common vmware_hypercall()
  x86/vmware: Log kmsg dump on panic
  x86/vmware: Report guest crash to the hypervisor
  x86/vmware: Support steal time clock for encrypted guests

 arch/x86/include/asm/vmware.h | 276 ++++++++------------
 arch/x86/kernel/cpu/vmware.c  | 470 +++++++++++++++++++++++++---------
 2 files changed, 463 insertions(+), 283 deletions(-)

-- 
2.43.7

