Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0042E3399
	for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742894183; cv=none; b=Aj+qgxFm57cO6BMSZVusQ2/Y6K74EoIjnu5LQO9E0GHcb+p04q19vXbnBF0VhU9GnGNG1E5nBAlr0N9qMCY5GzqXEgymDq41Z9IAyVKQznhDeuUJ9f6BTogLxFTs5VNpb8fzE/fcZp3DvbUFWGvoOps7/JK0EMSCjTRnBaVzqT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742894183; c=relaxed/simple;
	bh=ek4ovIye96+8XTAu5CwMIOlsZQ5eMdqX+mKTFqbt3WU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QJyCz593H6fYMdxfLRwS0VJaUpZxz6MsYOLYaU1CNZTDMIHQu7IKOliaBEd50ZhwoN0psgHfeGhG2533bTTKnSncWTJVyTkZmlL3YavNbssLhKeTcjLhhJcWjeo8xMHYmV2DRum97HhLWFnTD9OCx3qFtKbqNVHDOgbCH4eyiOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IYPguKu0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IYPguKu0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so26846865e9.3
        for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742894179; x=1743498979; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5E07m/Jva03uFHXfamqgR/Yccgbktzh+JjZw8SY61/U=;
        b=IYPguKu0l/niZXmR31fWE1e/TCefdWjXBylxCZuu3nNoDW/KA/hx8pmSJ4hloixjWC
         eMHeWqaWfD6w3CXXpIpjOqmyMuioPCXLmn0IBhCkTs4wHCOySoy8Ib8HPPWGYa75cIzL
         oGLd2pJfTcBy4F4kGgM6GnxF/QmJfmS48pSB+7JuWOD3Nti1+73SQF/riKsfyl76usDL
         FP2/N1p2dE+CroD0UHtzIxpk33zDgMRlE7LBc5i3dM1kXwW4E3GouDs5iUpx5ek0tf7T
         Tcx6L169/3jE+ErREXIBlRc7oMQLTVc1h+HUTv7JotBTAAaAnXMeEphA2JmhegoiBFc4
         5k8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742894179; x=1743498979;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5E07m/Jva03uFHXfamqgR/Yccgbktzh+JjZw8SY61/U=;
        b=lFfXvZd+4i6lp+rA7D/YebNS4m1F/v5MJ271RGCwIvbrOKCS1tj7RxWbD/Kpj5hZS3
         DwAZ9bthRJ90Aa5fhe5nbPKcKemo4A1u8NDAqlXNXZKME7JxnWpvQqndRPeE3WKfhMj9
         Q52a5RF9xjzJdjcdYcWiyv1UKwlXEQjK/bkWgb1pv/QVbJkvpdaDg59ioZONX0SHOk0J
         QMFc9HQjB9wDh44h29wMQbSNiTLkZDfzQnHPrBnTQtIg7jmxiYru1ilFwT+EiUUs6cqJ
         09YHauCVIsB+lGjPJAy1hTk7r8mqCRbRIB9xHM/Yrnbh8qWIhjQFLjAgymCfKG8bHd5B
         09VA==
X-Gm-Message-State: AOJu0YxBRbHLsR60h9u2hTbVA19rRVoLbPQz5bnDU+a2AU+2UZlj0838
	Vj5koxT0X3xgpWgpDThD5Gx6CBAnXliVPYnSXbnoquXnreg9wxZ7jeBOII78etlOBtJBPA==
X-Google-Smtp-Source: AGHT+IEuIxq07LFotZWzKxBHbLPA2nAlzEHe5Q6wotVFExEFee6t7vH7UALTB5edczb+i90kXNFoGt/r
X-Received: from wmbz12.prod.google.com ([2002:a05:600c:c08c:b0:43d:56fa:9b95])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d4:b0:43c:e8ca:5140
 with SMTP id 5b1f17b1804b1-43d50a3189fmr151264805e9.23.1742894179559; Tue, 25
 Mar 2025 02:16:19 -0700 (PDT)
Date: Tue, 25 Mar 2025 10:16:15 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5240; i=ardb@kernel.org;
 h=from:subject; bh=pznmp7CUr+aXXkMuVpoylycZESSo0CispcErImT3wO0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf1RSbyugZB9dMuflZHhXC8D/lVdkGrNkxFy4Pab/m9T+
 L/5h8Q7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESktjEyNEalHJOyrH2SPztO
 KK7pScraZz8Db/xWspbOtZpcvbNkNSNDk+H2HbPf/A747JCXsNrgoMvtmfOdzro61vbZ/F383yq CEwA=
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250325091614.1203411-2-ardb+git@google.com>
Subject: [PATCH] efi/libstub: Do not accept parts of memory before ExitBootServices()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-coco@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Currently, setup_e820() in the x86 EFI stub records unaccepted memory in
the associated bitmap, which has a 2 MiB granularity. To avoid
ambiguities, any unaccepted region that is not aligned to 2 MiB will be
partially accepted upfront, so that all regions recorded into the bitmap
are aligned to the bitmap's granularity.

On SEV-SNP, this results in calls into the SEV support code before it is
initialized, and crucially, before ExitBootServices() is called, which
means that the firmware is still in charge at that point, and
initializing the SEV support code is not even permitted.

So instead, round the unaccepted regions outwards, so that all
unaccepted memory is recorded as such in the bitmap, along with possibly
some pages that have already been accepted. This is less efficient in
theory, but should rarely occur -and therefore not matter- in practice.

Cc: Tom Lendacky <thomas.lendacky@amd.com>,
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>,
Cc: Kevin Loughlin <kevinloughlin@google.com>
Fixes: 745e3ed85f71 ("efi/libstub: Implement support for unaccepted memory")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/unaccepted_memory.c | 75 ++++----------------
 1 file changed, 14 insertions(+), 61 deletions(-)

diff --git a/drivers/firmware/efi/libstub/unaccepted_memory.c b/drivers/firmware/efi/libstub/unaccepted_memory.c
index 757dbe734a47..8d783fda5ce3 100644
--- a/drivers/firmware/efi/libstub/unaccepted_memory.c
+++ b/drivers/firmware/efi/libstub/unaccepted_memory.c
@@ -88,86 +88,39 @@ efi_status_t allocate_unaccepted_bitmap(__u32 nr_desc,
 
 /*
  * The accepted memory bitmap only works at unit_size granularity.  Take
- * unaligned start/end addresses and either:
- *  1. Accepts the memory immediately and in its entirety
- *  2. Accepts unaligned parts, and marks *some* aligned part unaccepted
+ * unaligned start/end addresses and round them outwards, so that unaccepted
+ * memory is never misidentified as already accepted.
  *
  * The function will never reach the bitmap_set() with zero bits to set.
  */
 void process_unaccepted_memory(u64 start, u64 end)
 {
 	u64 unit_size = unaccepted_table->unit_size;
-	u64 unit_mask = unaccepted_table->unit_size - 1;
 	u64 bitmap_size = unaccepted_table->size;
 
-	/*
-	 * Ensure that at least one bit will be set in the bitmap by
-	 * immediately accepting all regions under 2*unit_size.  This is
-	 * imprecise and may immediately accept some areas that could
-	 * have been represented in the bitmap.  But, results in simpler
-	 * code below
-	 *
-	 * Consider case like this (assuming unit_size == 2MB):
-	 *
-	 * | 4k | 2044k |    2048k   |
-	 * ^ 0x0        ^ 2MB        ^ 4MB
-	 *
-	 * Only the first 4k has been accepted. The 0MB->2MB region can not be
-	 * represented in the bitmap. The 2MB->4MB region can be represented in
-	 * the bitmap. But, the 0MB->4MB region is <2*unit_size and will be
-	 * immediately accepted in its entirety.
-	 */
-	if (end - start < 2 * unit_size) {
-		arch_accept_memory(start, end);
-		return;
-	}
-
-	/*
-	 * No matter how the start and end are aligned, at least one unaccepted
-	 * unit_size area will remain to be marked in the bitmap.
-	 */
-
-	/* Immediately accept a <unit_size piece at the start: */
-	if (start & unit_mask) {
-		arch_accept_memory(start, round_up(start, unit_size));
-		start = round_up(start, unit_size);
-	}
-
-	/* Immediately accept a <unit_size piece at the end: */
-	if (end & unit_mask) {
-		arch_accept_memory(round_down(end, unit_size), end);
-		end = round_down(end, unit_size);
-	}
+	start = round_down(start, unit_size);
+	end   = round_up(end, unit_size);
 
 	/*
-	 * Accept part of the range that before phys_base and cannot be recorded
+	 * Ignore the range before phys_base that cannot be recorded
 	 * into the bitmap.
 	 */
-	if (start < unaccepted_table->phys_base) {
-		arch_accept_memory(start,
-				   min(unaccepted_table->phys_base, end));
+	if (start < unaccepted_table->phys_base)
 		start = unaccepted_table->phys_base;
-	}
-
-	/* Nothing to record */
-	if (end < unaccepted_table->phys_base)
-		return;
 
 	/* Translate to offsets from the beginning of the bitmap */
 	start -= unaccepted_table->phys_base;
 	end -= unaccepted_table->phys_base;
 
-	/* Accept memory that doesn't fit into bitmap */
-	if (end > bitmap_size * unit_size * BITS_PER_BYTE) {
-		unsigned long phys_start, phys_end;
-
-		phys_start = bitmap_size * unit_size * BITS_PER_BYTE +
-			     unaccepted_table->phys_base;
-		phys_end = end + unaccepted_table->phys_base;
+	/*
+	 * Disregard unaccepted memory that did not exist yet when the bitmap
+	 * was dimensioned and allocated. This shouldn't happen in practice.
+	 */
+	end = min(end, bitmap_size * unit_size * BITS_PER_BYTE);
 
-		arch_accept_memory(phys_start, phys_end);
-		end = bitmap_size * unit_size * BITS_PER_BYTE;
-	}
+	/* Nothing to record */
+	if (end <= start)
+		return;
 
 	/*
 	 * 'start' and 'end' are now both unit_size-aligned.
-- 
2.49.0.395.g12beb8f557-goog

