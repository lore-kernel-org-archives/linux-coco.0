Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179CD3E40E9
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654594; cv=none; b=HIHxCNvly/LYdgfujY+Pr8SsMcTIdH1Sq+ubTsNJXjoIURveKl8PzTuF2yhz/z34ubnh0tsJToKHShCOShsNyhKjtP/pocvP1y0XIIChFBf9wTOrloftAZSQ0etHjtoxYQmylzbxWOXZDnbBukCZkzyXc4dPQL8CaeCeEOSVYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654594; c=relaxed/simple;
	bh=wfxZIiWhDP3+oFPqhctMkZvaOYbsAemH2FvdQjYIm9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ycd3YDnVxHGcGhO9DEGm0ZCHZ3FsZMgv+aXcKQVpCfu7YmGyI22qg2nhre4Qq2HlbzkOnohdiQp9PpXhHbRpWBjTTOq53cBPwfA9Ym1zFsqimtxgtrrZtqnwQ957OvOjHGHhyvuAiAleTc/L+vcjUw4UZyIbh1282PUM+AWQuD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ePXsX/MG; arc=none smtp.client-ip=74.125.224.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ePXsX/MG"
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-672b164bdaeso357600d50.1
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 21:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654591; x=1791259391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1QC7xolz0zAjMGBpXSuPAgwwtLmlzIMyVrA3dvqh9k=;
        b=056cqGIgRa8bdRd9S8S85oNxLavowOm1/1P/wI5tg/uTNIBzWJnxQm3X2Z0lUWsK7U
         sEps9qp3OrFscStfP3J1vPJBeYkCNK1h+F/SLPuPzS8aJfSKBy08f5ygCdqZ5b0iYjEi
         lhgmUnyj3TiEcChr35vXuzXtj8RjOdRpDbOTxZ4tSZfCyy9Px8nesHVm7HGrsi03MuGr
         IEJhLVzULwwMsJqtGtwY147zJecBtO5gJO5ns24GrxKIqkPY42LoDXtnZj9sgvgpBKJH
         t3Qcfu+oN7S8vq/PtGgIPqRkaXQ7DoGl6Pp7KTDzpd/hCCM1Fs0MtBk51uivA2minq0o
         sDsg==
X-Forwarded-Encrypted: i=1; AKwUvBzqWjPc/j+UqMWPR3zj6/eVTPo/OcVDMvFKGzI/rnfDlhs7VWMZfI9rWprmsKsA/eSiWPGFTSYB/UrR@lists.linux.dev
X-Gm-Message-State: AFq9FYKhVEB+SrvNXdI/TudsDq9VGlKg0Lx8bsO+xfU3qpVYfaQjnNnE
	6IHJOCNYxGrV7LUcdoVrF3WiPkPZTxXFrsYIjcDs3YQp59BTQ7GpaoCv8FB1a6tYwzlk59uHxQN
	iQ0nQ3ZOkrgpPpMlMqvXwMQNmnYv4zvz18G5wss3To1SzPHG8bNyYuLW7Ub3tVdiHPxlDURV8p8
	iHJzdkCvoVRhiUcKHyOYbfE9unc70SbC4aQhboCVUk8SBaY0FYkpT1yLudxGEoWNf15HsRdqaKl
	i5TPW24wAe3wg==
X-Gm-Gg: AYBFou0Rj2KDvR+LWsK7R9RNM5ZgljWHhGPPYAWZEpmkK2L7WJYWWHNW0qEeCm1f54m
	ohhTY0/bdMc1pjrbVFtPFK9sYKBWulBq7I50KuQRfAPycpWoG2eoehzOEaaxIOiIMakKIY1bbm8
	U2OlfyxKB8X5eZOSgZFv4YnKIU+bcznlxStAhmkFhyjaYbqLTm6cuoLrxCKGWlwrnvwPCfWmIEh
	gifvIdsLjXA6jI1Mc/qXjP8keUDUG7053OiDNliSXstB6wh0Pn0zvYclCIAQD02lE1/mXK4GdCa
	vPsDBTiD8SF6YP6NIlyGAOZo9V7lHH3vvwoI4bc2HmIeM31tqZ0RmDPtz9isGHa1OGdNcTV3ZKy
	1wqvjUTNCqNIPy3PXo7vLmTkTRKCZPRzcqklABTgG2RxqX3GfIfqyf0BAkGAlOl06GntxfC/qd2
	DAZxBlEPK6xkAbzuoYLJiWODlxCxsETr8x
X-Received: by 2002:a05:690e:440b:b0:671:70ea:46d3 with SMTP id 956f58d0204a3-672ed9da9b1mr4113608d50.106.1790654590925;
        Mon, 28 Sep 2026 21:03:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6740eef1c31sm1836424d50.10.2026.09.28.21.03.10
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342217d8d53so12162271eec.0
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654590; x=1791259390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1QC7xolz0zAjMGBpXSuPAgwwtLmlzIMyVrA3dvqh9k=;
        b=ePXsX/MGPztuO/POlhG3Nf6HZXmqPvMH6dFLOETOOepWuENl0jOO5ko9iiA/GMLIsm
         S77W4GVQP8KJc5g/G2DtXVsISlne8op86cN6Xxbd8njpOENDj8qHzmPfjN05I0nGjQkF
         NNUijL7HD6enfV5xtyUEBuig2DbKthPf44zAw=
X-Forwarded-Encrypted: i=1; AKwUvBz7mlrJnwMKvIXsR1pehtSld/0xFTARIDYfZQpGw/6z6y3HWA3/zsxg2PJARf9P1paDnitYpwc5RNVd@lists.linux.dev
X-Received: by 2002:a05:693c:88d7:20b0:344:c0fe:19ee with SMTP id 5a478bee46e88-344c0fe1acdmr7715264eec.14.1790654589508;
        Mon, 28 Sep 2026 21:03:09 -0700 (PDT)
X-Received: by 2002:a05:693c:88d7:20b0:344:c0fe:19ee with SMTP id 5a478bee46e88-344c0fe1acdmr7715216eec.14.1790654588762;
        Mon, 28 Sep 2026 21:03:08 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:06 -0700 (PDT)
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
Subject: [PATCH v2 1/6] percpu: Page-align decrypted data in UP kernels
Date: Tue, 29 Sep 2026 00:02:50 -0400
Message-ID: <20260929040256.543767-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929040256.543767-1-zack.rusin@broadcom.com>
References: <20260929040256.543767-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Without SMP, DEFINE_PER_CPU_DECRYPTED() places variables in
.data..decrypted. Align both ends of that section so that changing a
variable's encryption attribute cannot expose unrelated kernel data.
Keep the section in permanent data, where UP variables are instantiated.

Fixes: 000f8870a47b ("vmlinux.lds.h: Fix placement of '.data..decrypted' section")
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 include/asm-generic/vmlinux.lds.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2988aa12f66..64bc2bfdd2ec 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -368,10 +368,19 @@
 /*
  * .data section
  */
+#if defined(CONFIG_AMD_MEM_ENCRYPT) && !defined(CONFIG_SMP)
+#define DATA_DECRYPTED							\
+	. = ALIGN(PAGE_SIZE);						\
+	*(.data..decrypted)						\
+	. = ALIGN(PAGE_SIZE);
+#else
+#define DATA_DECRYPTED	*(.data..decrypted)
+#endif
+
 #define DATA_DATA							\
 	*(.xiptext)							\
 	*(DATA_MAIN)							\
-	*(.data..decrypted)						\
+	DATA_DECRYPTED							\
 	*(.ref.data)							\
 	*(.data..shared_aligned) /* percpu related */			\
 	*(.data..unlikely)						\
-- 
2.53.0

