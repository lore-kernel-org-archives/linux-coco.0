Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF3C3DAABB
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 04:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654588; cv=none; b=Y6HUev72LOnZCuPLbcG2k0pDuYz7uq0mCIhves5wY81NneyFQJZWOF8kgPzBMlJPitmjJ6V4EDpzC6VF+J7opnmPV2tphwZfGQiPuJ+PUMkTAsBwDqgDmV/dtKMomSAMYnsZtmJt+SFFqcTblcwaDpY6Ow0nrJxcQB0Gp/h7eew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654588; c=relaxed/simple;
	bh=ofjMK+frBLaew2v4NwVs3dlVJMs1NzYJl7FaeQqAgHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ua15FIw7eLHfJPncrOVLCb2B4AeasYeT6Tx+U5ojhlWDu0eOqEFxQuDXB/JfjeJnjk6FftVENdCJPKwhNnPoRJ4dIKxg7MvHOldz6ugHbpJPtLxLqwDokOKx2eiWdZ2oRWWnD+su6GVcbT8mAp3xhcf/66U9mfbe1oEs/rbLUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CP/Ja7yq; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CP/Ja7yq"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc1c9879395so278250a12.1
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 21:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654586; x=1791259386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYFksTwPL6Xygy3lz6bjz5WbJ+cVLM8U0ms6Q5xLHTI=;
        b=oQrYdaQ5kn9xniYDxTt8c6CgRsIjj6l9SenyYwIKxOjut6FhLR8s/BWlVEj9jf45Jh
         jNE60P16bkZCbgLIFH/UMwuBimtRDu0zpAkdrTz3ovYD3E/yA8YWhhW7CjeSViIYmAu4
         mFc6uGF9dG+EtNtnFezIGBe/RdY5JC6VtxatYGgd8+hfrU2UdgO17EmAyreIXehRoFnM
         kPkRmHBS5BRz769N/0MLWO3+J1pf07zzI2AeC5NDaOzvQ4zcK7GBFRZ2mWbUvKjl70nM
         +jr4CRE8EKCqciXxgNstqhrvVmUo5LecaiYgznbZnNko5ZlQbSwuUj2wGT0mxIRR2Kw8
         AjqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzw9qHd0tr81/+khx58J1MVlcZ/71dX+TgfRC1wVMpNlFI85kZiBSkweL2fYwNnRnzetNrXzK5WAoSG@lists.linux.dev
X-Gm-Message-State: AFuF++khNbS+s1e7WkNWPRBb7Iqz2FTPhzfW8JVyixktq8XFvS6hQ+sq
	oqau1dugc5i9ipVGDWK07I09V4o5HBB5IfnN9psgIh8vNp98F1o6j3YJHV2X7GMMg07iQ0pVU9f
	QmvEVaDFWXazLpkZCBcJYieSceWnp/j2/kvaOw+TZ1D04k+ST96hq2lr7ay26lvP1Q7k5boKRzL
	8oHOOXlK8BCs2NdYGBF9m3I7d5YtjEUOYmxks1jgtmUW9sNdOPzkGEQNIalxpRvfKHWDv4GXmlj
	LeNsBFhMndQ+w==
X-Gm-Gg: AYBFou1bi4rSyYjKQBTPtgx91iqGEg1ez+RInG00FNhIUi6D7s3qJQEc6pqtneH8B4q
	hidiBy2jXe+skrBcgbY/OJBT41QEgpRMH1wubf8FN3P4skVW/4Atths+6iG3ha9YRRggHI82XG8
	J1JoXVK8DBW7Q/m2wQF31mCB6WIfOQiC/G7Z3AhQMd79+dgpH/1V+J6OV2x7MJaD/lsL8kYsQzJ
	o3EhP1ZNimLLLzHIeVRRdkTTNBqkWx9nDlopL/WzKeXHPVP7Z9Kqt4y9jlePwtciPGP9X/7Wnwz
	qinpBcNzn6qt8KxBKcLgJ/lwbLwcbtSTavhgJcOlRNAf4DI+haAfyDLMkFTtU1gjZEGB43sakob
	ziEzuKCG3gulQrB3+FdQFof5VGjtiUT4PUkFqde8WtJLilU3z7DblJyIbBzozj6Pskh+aHguFqg
	r77HDgG3cCwNt6fe7KKgyXs8PO4QeaWldf
X-Received: by 2002:a05:6a00:4109:b0:882:5471:2bd2 with SMTP id d2e1a72fcca58-882547130e0mr6187195b3a.45.1790654586107;
        Mon, 28 Sep 2026 21:03:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-885e1c1bae5sm78331b3a.5.2026.09.28.21.03.05
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34344599f01so1673337eec.0
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 21:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654584; x=1791259384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYFksTwPL6Xygy3lz6bjz5WbJ+cVLM8U0ms6Q5xLHTI=;
        b=CP/Ja7yqLetK/PeEORwtyFK7bgkPz130C4KoFSXcfAwCvg1ijLoM6GPl+Yeupx0o5c
         XVwBhHJI6p0azrDxA8x9AbmXWBmydA5Kb10IddScMvkZs4MltyijvYM2WQ1X1rh5CIUo
         hVMGSRKHU27gdNUnbRLzsL8AhYMH9CqIlwKvQ=
X-Forwarded-Encrypted: i=1; AKwUvBwKvqVy7wzaqmzUHeI5VZ+t7s6iodYQq11eg8sJomYIdxcyPkOP8C8bICa10LqgBzj8/mUZjfP0Cq2u@lists.linux.dev
X-Received: by 2002:a05:7301:3ab0:b0:33b:e264:474a with SMTP id 5a478bee46e88-34272c5c9c8mr10268578eec.31.1790654583926;
        Mon, 28 Sep 2026 21:03:03 -0700 (PDT)
X-Received: by 2002:a05:7301:3ab0:b0:33b:e264:474a with SMTP id 5a478bee46e88-34272c5c9c8mr10268522eec.31.1790654583107;
        Mon, 28 Sep 2026 21:03:03 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:02 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>
Subject: [PATCH v2 0/6] x86/percpu: Share decrypted storage before guest setup
Date: Tue, 29 Sep 2026 00:02:49 -0400
Message-ID: <20260929040256.543767-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

VMware publishes its per-CPU steal-time GPA without first sharing the
storage in encrypted guests. Following Kiryl's review, this series moves
sharing into early per-CPU initialization for both KVM and VMware.
This replaces the VMware fix from Bo Gan and Alexey Makhalov:
https://lore.kernel.org/r/20260309235250.2611115-5-alexey.makhalov@broadcom.com

The common helper uses boot-time page-table allocation and preserves
initial contents on AMD and TDX. Conversion precedes buffer registration
on SMP and UP; failures stop boot. Encrypted guests use the embedded
allocator, warn on percpu_alloc=page, and never fall back to page mode.
There is no driver conversion loop or readiness flag. .bss..decrypted
remains outside this series.

I interpreted the allocator requirement as guest-specific, so both it
and per-CPU conversion use CC_ATTR_GUEST_MEM_ENCRYPT and leave bare-metal
SME behavior unchanged.

Two corrections to v1: its isolation claim missed UP, where ordinary data
could share the decrypted objects' page; patch 1 fixes that separately.
TDX's vmalloc constraint concerns private aliases and adjacent accesses
through load_unaligned_zeropad(), not just GPA lookup. This series removes
the unused declaration macro and adds explicit SMP/UP section boundaries.
I have not carried the v1 Ack onto the revised patches; renewed review
would be appreciated.

Tested on VMware ESXi with SEV-SNP and TDX guests, and on KVM with
SEV and SEV-SNP guests, using SMP and UP kernels.

v1: https://lore.kernel.org/r/cover.1789488039.git.zack.rusin@broadcom.com

Zack Rusin (6):
  percpu: Page-align decrypted data in UP kernels
  percpu: Bound decrypted storage for all x86 encrypted guests
  x86/percpu: Require embedded allocation in encrypted guests
  x86/mm: Provide common early memory decryption
  x86/tdx: Support early sharing of kernel data
  x86/percpu: Share decrypted storage before guest CPU setup

 .../admin-guide/kernel-parameters.txt         |   3 +
 arch/x86/coco/sev/core.c                      |  16 ++
 arch/x86/coco/tdx/tdx.c                       |  32 ++++
 arch/x86/hyperv/ivm.c                         |   4 +
 arch/x86/include/asm/mem_encrypt.h            |   9 +-
 arch/x86/include/asm/x86_init.h               |   4 +
 arch/x86/kernel/cpu/vmware.c                  |   2 +-
 arch/x86/kernel/kvm.c                         |  35 -----
 arch/x86/kernel/setup.c                       |   2 +
 arch/x86/kernel/setup_percpu.c                |  14 +-
 arch/x86/mm/mem_encrypt.c                     | 139 ++++++++++++++++++
 arch/x86/mm/mem_encrypt_amd.c                 |  12 +-
 include/asm-generic/vmlinux.lds.h             |  19 ++-
 include/linux/percpu-defs.h                   |   7 +-
 14 files changed, 247 insertions(+), 51 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

