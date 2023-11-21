Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D35584C1
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 21:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI6QYyOB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ce3084c2d1so50993175ad.3
        for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 13:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700601642; x=1701206442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKZ1/19bZDjXmVD1CEbmEpv81ZSrP5Qqz0tPf+dknk4=;
        b=nI6QYyOBAPTWF/xs4bLtjcEBJQ/aGCy46SX5uveprz+x+x6IJzx59ep2DV2rJLVey6
         jpw8TuNz9QaALwj2N4rHXrYmhONDkLQGCjmltFeTIL8qZNvFz1rMOdFGPGg+4vJOuesP
         RlqFFWaKGJkxu8rVqbFjX41YLNbZxod6HinuDSoBlFQA4pvP4l7/EY6ND/WErMiY29yO
         7rG/EnJB442X0Q69MnkDgoSZ219GnatHJnHErrbOkPlDVAKtOgqaozsDZ+ZkAIj0rZ+H
         NZTvM+L/sc/UkmMXwmrEiimJhf7pZ3hOeKH/AUI96zWaPJiIg2enI1xzE4rQgsZwMF0J
         O+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601642; x=1701206442;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SKZ1/19bZDjXmVD1CEbmEpv81ZSrP5Qqz0tPf+dknk4=;
        b=P9h8GzohFlqtyST4rclTImMdU5dlFbFzS69sE6qMuSXXIcreWNjC5NslpSevsc+39u
         udD9cnM6F81+jU+3Gfpjc0nTgRk0hMZZbVz9g9kbrCef0dxePoKZXdGgRashULqPIevu
         Hxd/bCesoTU8r+R89qT2jKTXbIGSucuLZnY14agKzxbhfnHuTx1xXnR1q7l6cg/WEQ6R
         5iPG6UZZ69sD5Gowy3t9s/BMQ87TWsjh6zllHsaKrBqWgWB0vHrZSVNYfPPwGZHgL23u
         Yi/lqyXr2V9+Xvzi9AjSZpIhh7605/dIGDvUrT8h0OKpEoyq1Ztjjzmku0EvvYqaD9u3
         3ovg==
X-Gm-Message-State: AOJu0YxKH55Ubl9ECMWG4ulB1MVSA+OxxIezBLkJrN4UMxxVUWtHpLnK
	9pgBEZkVsRPrTW56fYmZpD4=
X-Google-Smtp-Source: AGHT+IGz0GBc2L6fKdHOp277El3AvOBOL/M7tgvndLmzeYqXyjHTZ5visODxoyvzOD8ddZlnIN7psg==
X-Received: by 2002:a17:903:2281:b0:1cf:6315:8698 with SMTP id b1-20020a170903228100b001cf63158698mr401033plh.42.1700601641967;
        Tue, 21 Nov 2023 13:20:41 -0800 (PST)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b001bf52834696sm8281924pll.207.2023.11.21.13.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 13:20:41 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kirill.shutemov@linux.intel.com,
	kys@microsoft.com,
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
Subject: [PATCH v2 7/8] x86/mm: Remove unnecessary call layer for __set_memory_enc_pgtable()
Date: Tue, 21 Nov 2023 13:20:15 -0800
Message-Id: <20231121212016.1154303-8-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121212016.1154303-1-mhklinux@outlook.com>
References: <20231121212016.1154303-1-mhklinux@outlook.com>
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Kelley <mhklinux@outlook.com>

__set_memory_enc_pgtable() is only called from __set_memory_enc_dec()
after doing a simple validation check. Prior to commit 812b0597fb40,
__set_memory_enc_dec() did more complex checking, but now the code
can be simplified by collapsing the two functions.

No functional change.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/x86/mm/pat/set_memory.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index c13178f37b13..7365c86a7ff0 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2131,15 +2131,18 @@ int set_memory_global(unsigned long addr, int numpages)
 }
 
 /*
- * __set_memory_enc_pgtable() is used for the hypervisors that get
+ * __set_memory_enc_dec() is used for the hypervisors that get
  * informed about "encryption" status via page tables.
  */
-static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
+static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
 {
 	pgprot_t empty = __pgprot(0);
 	struct cpa_data cpa;
 	int ret;
 
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return 0;
+
 	/* Should not be working on unaligned addresses */
 	if (WARN_ONCE(addr & ~PAGE_MASK, "misaligned address: %#lx\n", addr))
 		addr &= PAGE_MASK;
@@ -2200,14 +2203,6 @@ static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
 	return set_memory_p(&addr, numpages);
 }
 
-static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
-{
-	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
-		return __set_memory_enc_pgtable(addr, numpages, enc);
-
-	return 0;
-}
-
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
 	return __set_memory_enc_dec(addr, numpages, true);
-- 
2.25.1

