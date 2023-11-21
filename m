Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18452584C7
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 21:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPIfIzeP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ce3084c2d1so50992155ad.3
        for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 13:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700601635; x=1701206435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huLzv0PM0TYdV6aZ2lF/u0VoqugwXORYCB79pbYxdec=;
        b=nPIfIzePFz+aez/pRSosITdyBUCxl1U/ljLEL1v3i2oUdieOLVxLyrTsKiP3+2CjoY
         yTixyoah//IAB+sw7b+6JVcmrB4zJ9GQyVmB5xozuY5fP0UMlPmilCp/YrJXBA6BuURj
         /vwaEjaPpyj0qqLCu1gFLU+AYgxICv+9MIXBSLnJpClaHhUp52f0f2TgS0uIb1bMybd0
         MakF5oYxTNklgvC0dwiD6jtOQbsAUrQ5eXRIL09Bc6Fk1zxjKE/46YqxnkageJD2QgHt
         0XlgCVj0+tXV+T4Zbn87cocZqfpJyX+P6Hpt5e43UJvHrEDSqNxaRErXcII6WWvl81h4
         HyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601635; x=1701206435;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=huLzv0PM0TYdV6aZ2lF/u0VoqugwXORYCB79pbYxdec=;
        b=lBHfjZ5BmObNbj+Ap/O5Z1WcM5XbUaLV7zupnpPf6NsQLXMZg69je4es2RDj7VXLCR
         HPNuBNp1oqrbNFa66rSVgRe1/rAEwavJPABZdygouaxN6Gwqiji4JkvbW/m7NNUF1j5o
         SQ1XPpbDPCe1MEHIkSP/s+3oMjrDMhKwPrHMZl6MKXG/jJ2ZpPAN0LPi4OgwMn7dyFjz
         CTYKFrJNPihyYA+XPDUq+H5vgq1+sYm+4x8F3id4qt0AUlMM5Fn7TuwEc5APOqCZbY+Y
         8eiQbbUBi5eDJr5NMlraPicxfBIwm3KDpy/2xRmo89JhXVfFLafQyttjZwGfpSgRd5DX
         EHeA==
X-Gm-Message-State: AOJu0YyeE6FyHQT/lIGHQYxkTNJCQPoFma8hT5eb2+UwHbeVDwpWGBND
	F2t7BN+5ucAZwrsWTbUXuj4=
X-Google-Smtp-Source: AGHT+IGu3jcvDWzMmd2brW4AbNgRjSnITFzU3bEr293ek/NBxeKno17B5zHl10Y2Oi8nNIq+gnZz2g==
X-Received: by 2002:a17:902:b687:b0:1cf:6d46:9f2f with SMTP id c7-20020a170902b68700b001cf6d469f2fmr351299pls.48.1700601635304;
        Tue, 21 Nov 2023 13:20:35 -0800 (PST)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b001bf52834696sm8281924pll.207.2023.11.21.13.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 13:20:35 -0800 (PST)
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
Subject: [PATCH v2 2/8] x86/mm: Don't do a TLB flush if changing a PTE that isn't marked present
Date: Tue, 21 Nov 2023 13:20:10 -0800
Message-Id: <20231121212016.1154303-3-mhklinux@outlook.com>
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

The core function __change_page_attr() currently sets up a TLB flush if
a PTE is changed. But if the old value of the PTE doesn't include the
PRESENT flag, the PTE won't be in the TLB, so a flush isn't needed.

Avoid an unnecessary TLB flush by conditioning the flush on the old
PTE value including PRESENT.  This change improves the performance of
functions like set_memory_p() by avoiding the flush if the memory range
was previously all not present.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/x86/mm/pat/set_memory.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8e19796e7ce5..d7ef8d312a47 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1636,7 +1636,10 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
 		 */
 		if (pte_val(old_pte) != pte_val(new_pte)) {
 			set_pte_atomic(kpte, new_pte);
-			cpa->flags |= CPA_FLUSHTLB;
+
+			/* If old_pte isn't present, it's not in the TLB */
+			if (pte_present(old_pte))
+				cpa->flags |= CPA_FLUSHTLB;
 		}
 		cpa->numpages = 1;
 		return 0;
-- 
2.25.1

