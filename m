Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF82385D94
	for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 05:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535154; cv=none; b=oAxMGYc4LIhaSxlNTQxIIXtQSp98Mv4NU8XlFlTyOjeFIhrdpSsVQYqS5xlCFFnqHWUTRvBvlH0VI+DYTPBoBW+kapFdtTfAgUD6IqxYJB+GUemIHVDfwtcyQVJz43YFJjApovjRldVIg+Fe7YrSoBcTzMQKQahvvMSy2tB70lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535154; c=relaxed/simple;
	bh=jUsdJh8Hh+QQW+V8f3/afoIgbxaF+ULvWELh063IS2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RmoNuYSm1TpuPSV6DCflUgBEKhw7Ib3hCy6P8r0Gd9zJZAnpb68C/6b2iUh/ugR6n8ShHIK8MppYWCjzCif1tHeAeaZSWxIHT9p65kuklpD+WmJ/0znSrZ0FOk8YT9ngPXcenXCtx4UOv0qbGtVOmZMKx1qpA+pnFooUcDQpPDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=P9VJKulJ; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="P9VJKulJ"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so1501165a91.0
        for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 22:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535152; x=1790139952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+i3/9cwENYafIlAkV2jcoorZwd9xMxSWurzxiZS8EDE=;
        b=daLM7ScyB/FNNIZCKoUp/KZKFDWefukOD0duS4OOpsmo6/CTUhG9JRVAjQuWD8dy+Z
         /kbWrzKPGGVOEphxqhSx9IUSroNKAYhP80jgMgrSh4C7nrvBX6NCsFfqVM5m3D3GWfIk
         5KGmbbIAslB6nJx5cieklvjudHSCuolXp94bQOSdv6ZZzDDkVvb7+Od2mhecpJymaQOy
         Zl6PpDVTIVmaG4kDkkRgXO9ewNciDamQG8Ne581NTjLhVBNV233enfS2D/tZaJZWLuoe
         Oz/CKqzQGfGBr3IyKVzOVdYqIpaJOmKyawnQUmqIxxT2HvBqqyq9S1ZitzUUL8TF8pss
         uluQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiwJcy5GnSG15G4eazAZST7K0Q+0PVPiozsAB7G8vO9FF3RhPWhGg+hb4wtkCjc+d5w7iWCnfytKDN@lists.linux.dev
X-Gm-Message-State: AFuF++ln2XkQS76B0kc9tvlEV10nD13geoejIqEr53Lg62QfE3BuPBLQ
	zwPjydLuvpMGQp9qUnQpCsSWB/tneFUT43wC9n5QPt9DaAF3PSQqqIaF1FuLZdbkRpvMLtx98qn
	n9Y/epfAMt3MM7N23PTeO8HiS5x/nTscKu4DYeE5AHl+ouECkX5zjq3hD4b0pgVzTwoSzJjcXuR
	KjxhawtWxuyiYqPlWyzZBdM8CKmo+jCcJ8pIlYIJ3+1/5KTDsIpK1J7FNYvGxxkHTQkgMyq9NGk
	y+TgdwEYl78TA==
X-Gm-Gg: AYBFou0THPufETt0B0H/e8ej0qBv8lA1reVL7CpDTH0iH/Jma1G1UBrarBWFpGA5IfC
	ysRfkVk6S3JrZp5Fzn8xtiHirN7JzKyYrgKDIuPkYF0EJ4JioI/JMQjDKrwgwFmrGPb/+hN6lpA
	BuAqxE03l0FPbvPSD2XpXq963zURRF9DsiN+lC+GGC+S83AF7mRqCpTKv7Ld194sJNJ8Non6HHf
	XJDwnoOz+kLYPZAQBRzMScoZOKubWDKNaxXEFzLiUHfdFdbQtzDTzv1RM1JVAcemc9712zmz5M/
	OdyRvi/lW8uZdNJnFWH1gM8J5oSQdyj1HV2wuXq92SKKEPDQZ/wTipnryjx0+z3/qYlgnx1bVzi
	J2BbN6K4MGdwPvUV5eKRsH+CGimvH9YeOiM23Mv3XMdJ2BgD2ZEfqHxF+sbtOCQRmgiO5WwUOUA
	y0r4TF+FVsRIL5Y2Uv+J1Yhw0Dxs+hpm3Qo8o=
X-Received: by 2002:a17:90b:4a4b:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39dfe189a4bmr10024211a91.15.1789535152436;
        Tue, 15 Sep 2026 22:05:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e1b6e332fsm805841a91.4.2026.09.15.22.05.51
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:05:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so3058863a91.0
        for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789535150; x=1790139950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+i3/9cwENYafIlAkV2jcoorZwd9xMxSWurzxiZS8EDE=;
        b=P9VJKulJniKA8ujO0uaek7hFObY3Agf52QmV7LCJsa/30BjY50Ad67hf0XTvFriZTE
         9O0k94C7hQ8JwkQNuqqHNUXAh14HH8wyx9Ny0hmPoyb9c/RIAAEFKuo2ze8QWnloW+hB
         0kU87fhFzklme8/PSyeWj2rwIQacAOa0oh+Qg=
X-Forwarded-Encrypted: i=1; AKwUvBwbtnQ1afQcsyRasmw0O1XYqKLhl1aongvWd2nC30z8TkUW9WY9f6ZgcyZB2nzxFckfRbCqiVWOblwN@lists.linux.dev
X-Received: by 2002:a17:90b:39a6:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39dfe1c9d0emr9817217a91.23.1789535150526;
        Tue, 15 Sep 2026 22:05:50 -0700 (PDT)
X-Received: by 2002:a17:90b:39a6:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39dfe1c9d0emr9817170a91.23.1789535150025;
        Tue, 15 Sep 2026 22:05:50 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3951386eec.15.2026.09.15.22.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:05:49 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 0/2] x86/vmware: Share steal-time storage in encrypted guests
Date: Wed, 16 Sep 2026 01:05:38 -0400
Message-ID: <cover.1789488039.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

VMware registers each per-CPU steal-time GPA with the host. An encrypted
guest must first convert that storage to shared memory, but the existing
setup publishes the address without conversion.

Patch 1 makes the decrypted per-CPU section available with
CONFIG_X86_MEM_ENCRYPT, including TDX-only configurations. Patch 2 defers
encrypted-guest setup until allocator-backed page-table splitting is
available, converts every possible CPU's storage before publishing any
GPA, and attempts to roll back all conversions on failure.

TDX's conversion callback uses __pa(), so patch 2 preflights every possible
CPU and leaves steal time disabled if a TDX guest uses vmalloc-backed
per-CPU storage. This covers percpu_alloc=page and automatic allocator
fallback. AMD encrypted guests support those mappings and are not rejected.
Supporting them in TDX would require a separate conversion-API change.

Conversion need not preserve zeroes, and the host initializes only the
8-byte counter. Patch 2 therefore clears each 64-byte object after
conversion and before registration, without disturbing other decrypted
objects that can share its page.

The intended merge path is tip's x86/vmware branch, following
commit ac26963a1175 ("percpu: Introduce DEFINE_PER_CPU_DECRYPTED").
Per-CPU and asm-generic maintainer Acks are requested for patch 1.

This replaces patch 4 of Alexey's v2 posting:
https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/

Zack Rusin (2):
  percpu: Use X86_MEM_ENCRYPT for decrypted per-CPU data
  x86/vmware: Decrypt steal-time storage before sharing it

 arch/x86/kernel/cpu/vmware.c      | 96 ++++++++++++++++++++++++++++++-
 include/asm-generic/vmlinux.lds.h |  2 +-
 include/linux/percpu-defs.h       |  2 +-
 3 files changed, 97 insertions(+), 3 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.53.0
