Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E435EF2
	for <linux-coco@lists.linux.dev>; Fri,  5 Jan 2024 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzydqmgh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cda24a77e0so1142901a12.2
        for <linux-coco@lists.linux.dev>; Fri, 05 Jan 2024 10:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704479442; x=1705084242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lydFpi0OZX3PRN1Ii8TvNVEIYJGkasxvD7FkCrzWjvc=;
        b=dzydqmgh5gpSAeKbFqVgIlDgDQaMA7ol5BzMyrWdj5zAz1tQiYTLKCCy0UHHUeDMXQ
         ldkMracmo2lGTyJbl/IbCtESvd2ObnvJgmXKetYp2A0YFfNccHV2E7ZJsBosD4aFNKix
         4/Wvb4vMT1DcZHPBMl2Frux9MvSk5m6z1g2NA6Pxi0HU8DsfMcfZYC/r1uToDxdiuXIi
         2lNThgAoPgDBhP4EsuhaAazpiUaUYFCuu9fEZNEX5XAunwqQPXcs9NjLWsYh3vfHGAtt
         5MFa4E1RiyG41UzPseqo85mBnXWxDDVPoN/nakbAMJoXmAuAo6usRv5i9UkEaHMTB+5L
         9TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704479442; x=1705084242;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lydFpi0OZX3PRN1Ii8TvNVEIYJGkasxvD7FkCrzWjvc=;
        b=fSCUJgaH3CgkKDiyQT84//E++t5YKZJQL6NsKyck5nTeAcGKaTuvP5yKDZH4FHGglK
         2e63xHN3kbvkBo8CvbAdWx7Q2zGKfQYdbeHauX+nar1MqucfiWLodrYXzT7NFh2xqHol
         DLXRxVNVIvrgmK1N4y6/u2KQFUZE+MlEgXr2AiLrLgizWxVmWMzO+3POy7hV78qwZWg8
         yRCi07DPISmHI90Qo5PlCzlMxRKLuuAsTTJYqMZjfeCUiue+h9ZFhowDgrBHXYw7syWD
         Mx1zJ3wuPQNknIb73Pg7b9f3swNhGjAihWGW56zwWG39EL60SmtK8oYoC8vBJkKJXSfS
         Gw7Q==
X-Gm-Message-State: AOJu0Yyc0jTp7KAMZTSunUXa3id7hF2zwPMrHMfT9XS4z3NnbH6nDD2Q
	vWIdwO2X7ZLEtQjZXP0Bmes=
X-Google-Smtp-Source: AGHT+IG19yTmGDm43gGH0Te1ADwX3xmhZ2HI5+b+LjzFdjx7tfO595u+C0rtiQTuBnjZcxP5J7fOYQ==
X-Received: by 2002:a17:90b:24b:b0:28b:c9fb:e328 with SMTP id fz11-20020a17090b024b00b0028bc9fbe328mr2079013pjb.51.1704479442131;
        Fri, 05 Jan 2024 10:30:42 -0800 (PST)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a195700b002868abc0e6dsm1687293pjh.11.2024.01.05.10.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 10:30:41 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kirill.shutemov@linux.intel.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	luto@kernel.org,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	urezki@gmail.com,
	hch@infradead.org,
	lstoakes@gmail.com,
	thomas.lendacky@amd.com,
	ardb@kernel.org,
	jroedel@suse.de,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 2/3] x86/mm: Regularize set_memory_p() parameters and make non-static
Date: Fri,  5 Jan 2024 10:30:24 -0800
Message-Id: <20240105183025.225972-3-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105183025.225972-1-mhklinux@outlook.com>
References: <20240105183025.225972-1-mhklinux@outlook.com>
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Kelley <mhklinux@outlook.com>

set_memory_p() is currently static.  It has parameters that don't
match set_memory_p() under arch/powerpc and that aren't congruent
with the other set_memory_* functions. There's no good reason for
the difference.

Fix this by making the parameters consistent, and update the one
existing call site.  Make the function non-static and add it to
include/asm/set_memory.h so that it is completely parallel to
set_memory_np() and is usable in other modules.

No functional change.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/x86/include/asm/set_memory.h |  1 +
 arch/x86/mm/pat/set_memory.c      | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index a5e89641bd2d..9aee31862b4a 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -47,6 +47,7 @@ int set_memory_uc(unsigned long addr, int numpages);
 int set_memory_wc(unsigned long addr, int numpages);
 int set_memory_wb(unsigned long addr, int numpages);
 int set_memory_np(unsigned long addr, int numpages);
+int set_memory_p(unsigned long addr, int numpages);
 int set_memory_4k(unsigned long addr, int numpages);
 int set_memory_encrypted(unsigned long addr, int numpages);
 int set_memory_decrypted(unsigned long addr, int numpages);
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8e19796e7ce5..05d42395a462 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2046,17 +2046,12 @@ int set_mce_nospec(unsigned long pfn)
 	return rc;
 }
 
-static int set_memory_p(unsigned long *addr, int numpages)
-{
-	return change_page_attr_set(addr, numpages, __pgprot(_PAGE_PRESENT), 0);
-}
-
 /* Restore full speculative operation to the pfn. */
 int clear_mce_nospec(unsigned long pfn)
 {
 	unsigned long addr = (unsigned long) pfn_to_kaddr(pfn);
 
-	return set_memory_p(&addr, 1);
+	return set_memory_p(addr, 1);
 }
 EXPORT_SYMBOL_GPL(clear_mce_nospec);
 #endif /* CONFIG_X86_64 */
@@ -2109,6 +2104,11 @@ int set_memory_np_noalias(unsigned long addr, int numpages)
 					CPA_NO_CHECK_ALIAS, NULL);
 }
 
+int set_memory_p(unsigned long addr, int numpages)
+{
+	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_PRESENT), 0);
+}
+
 int set_memory_4k(unsigned long addr, int numpages)
 {
 	return change_page_attr_set_clr(&addr, numpages, __pgprot(0),
-- 
2.25.1

