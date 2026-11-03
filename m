Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690444;
	b=TiRV2szfwCL3w4AlKVY/m7Lsfnv+LniGvQoIROXetTa4NKWyXSD5WRBI8EaroPJMDa6q
	 gGfxmJGdgTU117KLrjeVpP9yrqQtCgR4empjXXZw42fQjzQGW6aSueFlzRhUUgRRWlCuU
	 p0JVVSPzvDs7ekKiswrKfZ78CC0PKKZRS2B1aVfjPE9ANDQc4ZYhJb0iKgt4kbnu3myA+
	 n6dBzQVjpfFFoc8hzmARqdCt5IiCr2G0jsl4Mgr2rXbuY0qVz5BWntwV4xosJRf9b/FHf
	 JcYMCxQ/1ur3/FPQ+GI6GLOauhHPvYqTxwJMrNg8kEpmWsRFbN1fRzVgBI7qLpyngSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=nQGxanT95z7gj11pozst1Dv+dzrh+mNFxgMJ/FgtyKo=;
	b=ULw7nhOqPds2Q0a53ngCOLt/r68mNBYWojlJro75w300zNcHbqQY6TqxPpHXkLVe/zre
	 SIE2VndXiAhlAMfprOw74gtNRTrUdDjsJYqYmV6aM0PN9RyCBlmFgZJUjB/xuKtoqgPLD
	 yLNawI1471WbWTq2/qlyPYa7RfghC27Rn2Mx9oa9Vbetsvd3kzxgIF2RxgAVtJmOo6xTT
	 Xgtn0vsi86pwu7xUZCEiegYpvsRw4JpQAgBzJKXNSvHZdaWMICvOZ+b3Fw8ZNWO2SqZ8t
	 eYjNDJ/wHWDDmvMXUdpnZTiqwSG0QJ4oNrv+Q3msMSoImV8nZ0xcSbQhTJa+BdZcJQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R1wkrrFV;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8B606A32D
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 07:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B8B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R1wkrrFV
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4179962a91.2
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690443; x=1794295243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nQGxanT95z7gj11pozst1Dv+dzrh+mNFxgMJ/FgtyKo=;
        b=pxmf2ZBDIUqNtL/SCROgv1tjBoXsvNoieSPJS3vNrbHE0wPt3e34NYq14RLkHa8O+s
         85r0Rwy2uRls6pzfP5xmiTMAXcGTiJVw3H897BgEDQ2j2A19BtpxWRPN6mvRMQVqRHsS
         tPwR34j5gO6r/FKqpr4FjMDgofXP5Oyr/3UgksjuWloJknMe/b8t5SJFsxLe4+yLqthP
         b4irF6dEi9Ewkupi7a5klQIiGQY+Qklam+g77q2OG5vnxT1ER5zwRyGNX+ZiX+jf+uUC
         rpgC6SREcDM1EniMVGVjnlzNV33v2JW8q3bZ9bX2Az0bYi+PHgJH6zWJRrYSJtxKwcu2
         3awQ==
X-Forwarded-Encrypted: i=1; AKwUvByuYXY+fFQbKR/ZTOwOwuvTWNyrhZV7GSbHozeK3jcnO82lTx2KPrwX7ZjL95bv8QfikIhHipK9M6d+@lists.linux.dev
X-Gm-Message-State: APuU4Z8d8R9XIfPX7pI0L7qWWR5cg1ib8Z9wA2Mg7NBrxJxtOReob3vO
	y3nW2l3qfiH1VybIVZpG6pVB7SKyPMzxusKn/0QJm/HUtfZj4VwgV84RjIOTsTmLaE2BZz/Q+eB
	azkFD4grZTZ62fzhszYvL0hyjdP76clNMTs31ITTJryfRcRq9+jQRb/opJVV0wpi3FtFahtJ+OA
	UMaoRMl+LfxLJrg17mXRatV5SqnsjpWmm/kz+eYJiYPwskF5oZx08ZbHcBoFFQuQZxLt4XdMZKt
	MsvgH3AtFxaJw==
X-Gm-Gg: AYBFou0aTZY6p93WVM8Mbr/imDBvfGD3mmYOBe7D5momfhEQ7UXdAT/tHG6v017Xx9k
	14lGjXXvNde07K40EclRwvtOZkgrp0hkA6DsdiaKtz5xGqatwWlhESfaUcN5xM/Kyt5gH/loJyy
	AkFwYYX0TT7HaECITRGmeYfmMWVZaXlkqJtxPeADa3IdqyPpcqdYNhdHOI40ayIxS1H5qqnMVkQ
	GAucgCTm7nHPRypoQY7BSv7nhxK9rpgRI6CbyarC0NZnRnK1EegDqCOmSeIePtjOgsgCRu997mQ
	HKR1xWom+NnL3J/66zJGl7IO8vcBlpl8w0wssyRPHMCEkut7efW9gt398gbtrJVfm9Y18W0x9yN
	gEbb5D7qNPZbfoDCfZmXb1yG+Jpr5JqGobOE2EQEkfVcyozOVWSHZT3Y69b+NliTthiqaCFRdrx
	b0wfnqgw5aZZCuk59B5fUyyhcVkPNI6csU
X-Received: by 2002:a17:90b:53c7:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3ae897c7747mr9960826a91.15.1793690443305;
        Mon, 02 Nov 2026 23:20:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c9d77b9sm1279669a91.4.2026.11.02.23.20.42
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:20:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-542fc619afaso43787721cf.2
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690442; x=1794295242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQGxanT95z7gj11pozst1Dv+dzrh+mNFxgMJ/FgtyKo=;
        b=R1wkrrFVEidRGzr0n+7hgFrvB0JxmXrcwMkILF9EkcflxhfqxnaflZMnZyW1qLsruc
         zcrv9dsyeuc/ZMIXBYyMzmCyuNhpB3Yu9h39epIbDA229bY/LYervTeiiMwsk9cuZ+2I
         KhQLj2f67Od7QpoBizG5QX4doGZgmxzpHTdJo=
X-Forwarded-Encrypted: i=1; AKwUvBzLU3hZsYIptO2dhZifDTLfTHSVafRjqHvHrWDeF4hxfGGlmDKi8MoKWoeXII1J54sfRXQ3O7wfj/qm@lists.linux.dev
X-Received: by 2002:ac8:5a86:0:b0:535:a5fa:edff with SMTP id d75a77b69052e-542b7c08be6mr197741011cf.63.1793690442082;
        Mon, 02 Nov 2026 23:20:42 -0800 (PST)
X-Received: by 2002:ac8:5a86:0:b0:535:a5fa:edff with SMTP id d75a77b69052e-542b7c08be6mr197740811cf.63.1793690441651;
        Mon, 02 Nov 2026 23:20:41 -0800 (PST)
Received: from vertex.localdomain ([192.19.218.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498c379989sm18885491cf.19.2026.11.02.23.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:20:40 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Bo Gan <bo.gan@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	virtualization@lists.linux.dev,
	linux-coco@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] x86/vmware: Share steal-time counters in encrypted guests
Date: Tue,  3 Nov 2026 02:20:33 -0500
Message-ID: <cover.1792471114.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Steal time is the time a virtual CPU was ready to run but waited for the
host to schedule it. For example, in a 100 ms interval a vCPU might run
for 70 ms and wait 30 ms for a physical CPU. Reporting those 30 ms lets
Linux:
- account CPU usage accurately, without charging applications for time
  their vCPU wasn't running;
- base scheduling decisions on the CPU time tasks actually received;
- show host contention in the "st" column of top and vmstat and in
  /proc/stat.

VMware writes a running total into a small per-CPU buffer in guest
memory, and Linux reads it. In a confidential guest (AMD SEV-SNP, Intel
TDX) memory is private by default and the host cannot write it, so the
guest has to share the buffer first. Linux currently registers the
buffer without sharing it, and ESXi then powers off the VM. This only
affects VMs with the steal clock enabled, which ESXi enables by default
only for Photon guests.

Following the v2 discussion, this version uses one packed allocation for
all possible CPUs' counters and shares it before registering any address.
Setup moves to an early initcall so it can use the normal memory-conversion
API. This avoids converting a page in every CPU's per-CPU area and
concentrates sharing in one allocation.

Changes since v2:
- Replace the six infrastructure patches with one VMware-only fix.
- Leave the per-CPU allocator, linker, KVM and early conversion code alone.
- Move ordinary-guest setup to the same initcall.
- Rebase onto v7.3.

Tested on ordinary VMware x86-64 SMP/UP guests, ESXi SEV-SNP and TDX
guests (SMP, UP, 66 vCPUs and percpu_alloc=page), and QEMU/KVM x86-64
guests.

v2: https://lore.kernel.org/r/20260929040256.543767-1-zack.rusin@broadcom.com

Zack Rusin (1):
  x86/vmware: Allocate shared storage for steal-time counters

 arch/x86/kernel/cpu/vmware.c | 130 +++++++++++++++++++++++------------
 1 file changed, 86 insertions(+), 44 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
