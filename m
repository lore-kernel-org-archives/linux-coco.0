Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071511A3164
	for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 00:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101832; cv=none; b=IzdZjWPXsH4xRpsVS0JFh8TC0O7VlohJjucfuL7mn81sxA1zaYFS0PixxuXLyFXP8sZ4m/Mzk3Udo0imMi5+RgTNoyPuYSg78AmprrBQYoyzVwP6ltG69TW0tkwkNmLugsIEP5UtHOREUZzfA8zehF/FLVA7ldrTsXyRaRPCRxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101832; c=relaxed/simple;
	bh=svdA7A+dthIfmJn6H+/CYxQwZVSDdE6m1ViEhOWnzN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+y4Y8ti7Yfyk4ylfcjC4PLZye1nBP2x+0uMb5e+nrBX3iCLiDAqabN8j/cNDi1CwtEznqg3hMkgrMUIUluSegTpGrcYd+TKUEl5fGiQWOMgMsRzgCTYHsNhfi0VtMH5fXobHZ+svHH/FyggHPduq8hU7oqoOWYlWYZWHkeSVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=c4rzaiLX; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="c4rzaiLX"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-c73967cf77aso1565640a12.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 17:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101830; x=1773706630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhB5D335RnTvmhxu2qGnXeGw/Xudg4Jft8uixUbp1M4=;
        b=dYE5aY3bDdnppufaPmWBgP7aIucGcMOrwLiifZqHo+5fCYoD4Usr5YGGf7YowmOmDQ
         iSZx8bHv4I83aryeB46MLCT9RB43QGNNSKj7ljdMzvScuAVpxJlxKVP50VsOw53FY2Vx
         RmAqnfb2pCeHaHseV1eM6MHSa/zHDDT1Ri0z3e8FNQKD4QBmBJD3lbx/DzT1881xNvGc
         ZJF7Wu2AeKAQuYqt/O9SBoHy8h6TTc/qrt7I3WSWeFkSmS0KpgTxqvUzq3SI8K4qSPMm
         hbVi9P+eQUe25XPoGCBWKnB8ny4313BMnlc/fnuw+NnHJDqTLYLar4XUet/lks+Qyskr
         VMJA==
X-Forwarded-Encrypted: i=1; AJvYcCVjYpPpfLT9GWBEyfvCmMVJCWc7h7x3newJb+zKG9Z+mn5krddPyzm2R9YGBeya/0ZWg77NU8PeubNF@lists.linux.dev
X-Gm-Message-State: AOJu0YzwvmnN3DGJl6iHrSZBTP0BsfLZbJ+Jwm3jmpgtLYj/Mkt/8ZJV
	yMC40xOgwF4aslZjVlRW1WvbZk417yDcvz+EfwBEI7Y8Ul3V5K60avAd5EHPmJpCINL/WyCcMZ5
	tTOVQF3dV5F3Gp+X86aW6W7oxmJlq2Sw4Y7z0KwgFeU5g4rN78mepCWxck8e/FDHa6A0jkEXoQ4
	lmPn+iL6fI2r8h7KbZ1+w9Kyd75GqHUdJHWd/r0jOq1ICP2x2pAt54ppKB8yvkuMjZldeKRAuKT
	OfjfwdHFKfrXfmvcYvI
X-Gm-Gg: ATEYQzxB+N6ePB5Y/8I/eFXwZOU4pJXoW7L/NxEYC4uHu4/b4WEYhb72cfFkAYiAu88
	hn9zxqNX08GBqvV6hnsUxeL34QMZIKnXsysPGxDgdbcTBsSfXaoajx6yfGpCUuAQqwJyT4nqCkK
	LDEZokLEdhpxflhV1nLofij6KktdsCWhel1n6tF7BbSX7phg8PfYwURMvyf0jipb6v2ZUIIU426
	T/h6iXLu66kEgJVuZD1QQiOaTpAFwEYwQLjmjV4XiFLKDebCHiYoJvqi6PVjPOK268gTGyV1new
	WcpsKOqEQArn/jYJHX7CUZfGbZ8GJSke23s+y9PwHm7Mu0yWTDCdvKPq0XCkl/g6cD4FRrHoB9k
	dB20u4PUvy2RvtLevgwQCYDWuNPtQWcoYTxRofkUrXNJTvrhvHi35/+CkK3JGW+mPNbv0rtg8uP
	p6DbldOM3iuUkjuV/JNd1DfFExwFLxI9b8XxC2AnPn8emEn5HvMJ+wGwoZ4Y9M
X-Received: by 2002:a17:902:c401:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2ae82455273mr133315825ad.22.1773101830185;
        Mon, 09 Mar 2026 17:17:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ae83e9c69asm16830475ad.22.2026.03.09.17.17.09
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:17:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2be21146933so10831073eec.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 17:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773101829; x=1773706629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhB5D335RnTvmhxu2qGnXeGw/Xudg4Jft8uixUbp1M4=;
        b=c4rzaiLXExn5ez5oJNwbW5gwLfdbKY8cXolAvGiybDspKguV2oGsNf/gbclyMG7Fhx
         dwBKacWDxdE7fQ81+ypQ1mVAlUuUe9P0gJaAaoSFg31yUtQZXUEzoemtIZJYS5cfOn7v
         XabKozt2LZZ6MuTAoRG1C1dkCJqOusyLbO0Cg=
X-Forwarded-Encrypted: i=1; AJvYcCWSa4jUQDbLIUw5hm4/4YA3oG0PF4gIABsCkDexwz059pJqhS4ksTcTPIV4RTf262YXHUAaQoHrNW98@lists.linux.dev
X-Received: by 2002:a05:7301:418b:b0:2bd:b102:a022 with SMTP id 5a478bee46e88-2be4e08842cmr4290764eec.27.1773101828591;
        Mon, 09 Mar 2026 17:17:08 -0700 (PDT)
X-Received: by 2002:a05:7301:418b:b0:2bd:b102:a022 with SMTP id 5a478bee46e88-2be4e08842cmr4290754eec.27.1773101827964;
        Mon, 09 Mar 2026 17:17:07 -0700 (PDT)
Received: from amakhalov-build-vm.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm12678991eec.17.2026.03.09.17.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:17:07 -0700 (PDT)
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
Subject: [PATCH v2 0/4] x86/vmware: Hypercall refactoring and improved guest support
Date: Mon,  9 Mar 2026 23:52:46 +0000
Message-ID: <20260309235250.2611115-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
References: <20260307004238.1181299-1-alexey.makhalov@broadcom.com>
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


Changelog:

V1 -> V2
   * Fix compilation warnings in patch 2 "x86/vmware: Log kmsg dump on panic"
     reported by kernel test robot <lkp@intel.com>


Alexey Makhalov (4):
  x86/vmware: Introduce common vmware_hypercall()
  x86/vmware: Log kmsg dump on panic
  x86/vmware: Report guest crash to the hypervisor
  x86/vmware: Support steal time clock for encrypted guests

 arch/x86/include/asm/vmware.h | 276 ++++++++------------
 arch/x86/kernel/cpu/vmware.c  | 470 +++++++++++++++++++++++++---------
 2 files changed, 463 insertions(+), 283 deletions(-)


base-commit: 7d08a6ad25f85c9bb7d0382142838cb54713f1a3
-- 
2.43.7

