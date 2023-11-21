Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F509584CB
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmAGOFDY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cf69f1163aso16219305ad.3
        for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 13:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700601636; x=1701206436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDCKZynU08jauQ6ld+7iiO8G5I0+Mgx4PpyHnd5gkcg=;
        b=JmAGOFDYBU5SXNumjkWMu5cn/xwMGUNpsOwGQjoOhE4zJsDLv6b8Mqlx3fOEYxFE4Z
         /CX/Ahf1XJZIzN+pBK5z50FPW6qTkGyqwEKqkSk7RxTRUYZy8O6QyfTO3Jq5dfkAk2b3
         9FfKn+ucse/fiZCBWRBIcO4/6t62/uJns84radcnzKghnQ6Z5xLUWsJjGC+yzm34j4qN
         bynhBEe6+Qf1ZMU0WIfKSvItPa7v0Wm2V7Epp5OuKXFtaj400BzCOHJpS6Jpiw6cbbVS
         L0GgAFB5bKgueOengG81e/HFoV4ilZp3k7546fQ9EjCkE1FzBGKW76ncG+sDZi0Bi7gU
         fKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601636; x=1701206436;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDCKZynU08jauQ6ld+7iiO8G5I0+Mgx4PpyHnd5gkcg=;
        b=Q1bJTRlxu4FcdpUB74gDaXx5W+uFjnsxzKaFeun4Ipg2R2kyBtvjb4cAslITQKO/AC
         15cay3JiOlQucEWkFBKohtEyCKbom+KJ+TQtYac6weOjhsNAVrN/OozeIVOXLyPvFbb+
         lnzylyzivNfvmLmEn1lm56/TisN0690XEObEbvHXviTGKIiLpdopE3ndab9eBZFeyUip
         J3pZHdTaeMw15o0d2jUT3txWa5NaMsTxNJEFKHTHdWrEwq0vYLLbaIv9tLTivJB0krWt
         YPZ3hk9/tE4ylhOxi3R1U1zrv7bDfxulC4jFKNvuFf9eAWvAw4xXxcF+rSWNKkK/PQnR
         fTVg==
X-Gm-Message-State: AOJu0YzyyrgLIXDVTsajYQX2NLECML5AS14n6u2tzNROaVr+u9pcdGK5
	zpBFkLFyST8kbsxRT4Yv1NGBYKBT06Q=
X-Google-Smtp-Source: AGHT+IHGih5jJrhH0e5Fitw1xqGZ2tbx4HII00I2SufuwbFYeK8kmL25D5zlL+pZpN85Iq/vTDPqHw==
X-Received: by 2002:a17:902:ec84:b0:1c9:faef:5765 with SMTP id x4-20020a170902ec8400b001c9faef5765mr603101plg.5.1700601636565;
        Tue, 21 Nov 2023 13:20:36 -0800 (PST)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b001bf52834696sm8281924pll.207.2023.11.21.13.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 13:20:36 -0800 (PST)
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
Subject: [PATCH v2 3/8] x86/mm: Remove "static" from vmap_pages_range()
Date: Tue, 21 Nov 2023 13:20:11 -0800
Message-Id: <20231121212016.1154303-4-mhklinux@outlook.com>
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

The mm subsystem currently provides no mechanism to map memory pages
to a specified virtual address range.  A virtual address range can be
allocated using get_vm_area(), but the only function available for
mapping memory pages to a caller-specified address in that range is
ioremap_page_range(), which is inappropriate for system memory.

Fix this by allowing vmap_pages_range() to be used by callers outside
of vmalloc.c.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 include/linux/vmalloc.h | 2 ++
 mm/vmalloc.c            | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index c720be70c8dd..ee12f5226a45 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -233,6 +233,8 @@ static inline bool is_vm_area_hugepages(const void *addr)
 
 #ifdef CONFIG_MMU
 void vunmap_range(unsigned long addr, unsigned long end);
+int vmap_pages_range(unsigned long addr, unsigned long end, pgprot_t prot,
+			struct page **pages, unsigned int page_shift);
 static inline void set_vm_flush_reset_perms(void *addr)
 {
 	struct vm_struct *vm = find_vm_area(addr);
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d12a17fc0c17..b2a72bd317c6 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -625,7 +625,7 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
  * RETURNS:
  * 0 on success, -errno on failure.
  */
-static int vmap_pages_range(unsigned long addr, unsigned long end,
+int vmap_pages_range(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	int err;
-- 
2.25.1

