Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1615F45D5C6
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762064; cv=none; b=PMx6hFVa5+kMfuoKfL+gmZiN0BQYGmTrmTb4m4C9DgDmVpGUoIEVO9IHRM0qrSH8Wz0MNRtBoI7kRkFOCFdd8TXv3JbXRwxSsjFxXJnEjdvDFC/RNn37A1BE8fZVyTHZpai2upbp+gz6ixaCwqR6Hxn1JbitCBggdmLVSc54xqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762064; c=relaxed/simple;
	bh=MN5wgOlznVkl+BjeEs809JtcBQkMpu0tStRwIcnoZBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M9MPM/9KRC7XwHWo7owiGrj+fnatjxiGDMuewZs9A+Ehvs8WB0u7UwF+C6uurljOA34gyMwWc/QWDJesI4a7VKc3OKrELUlbqHA1N5HPOGkxZfkp3Dh7nLinF036h0Fm6yZAxjYrlqPs2HRDK0QigsqNa6dZoGkLpAs1tWOBATw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ICS8ZPrW; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ICS8ZPrW"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so91971a12.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762062; x=1785366862; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNI6BG2rRalx1BcQoBnUKDa+4TlUreIqsReX1yE6FOI=;
        b=ICS8ZPrWreD3RNuhhFI8jlqGVon3OC5qAO/nBvB1//f/UB0iVoJYUyWZmoSsSmOK7C
         +pqQ0tBWxCLfsiDt7Z90y9KWU6NUYlICKqSWc1oNAP42V0kKLPvKIDpJAGNJ/nSOy9BE
         NtuP3OK6tW5V9YmllRAp0I/89JK8d0crxRNMOXcjIc2VBTsZUet5/oi10sdokyLEh8DP
         UH8BaC0hu7A90odY8J+ZUb2+ABuLc099Fe3kxGNAewhyINdoYpOw1gR04lEXxXJZuh28
         FA9uDiWC1AGL8Ru3lkQEF+ix7ayD4EVftLfD+IEHnqowoFGwwF6vobj8LTs03/UspXVh
         TJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762062; x=1785366862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNI6BG2rRalx1BcQoBnUKDa+4TlUreIqsReX1yE6FOI=;
        b=I2RclP2QB/T1gygr7vCNz2obYM4xGhX/5ZVLeDfzzVi5Kx9vZeE0oYeBNJNkwvY7XG
         TVeWpfcPcO8zECJIYl0hLZvxD6PaXqESGrIF0k+xz1zhlx2EMNE1GPO2UE7anIon1TBr
         kJGRTsH7ndlz62VfQB+TtJufRUgs3V0qR2yzj9St3VCyGWHot3U4Y7JAJG80Ryi7/bZd
         6l/MWJynfWmgXS1wuIcYmtwDG+yMBidooPlbaAVrcxdPOD/3yr14H/LImOP8tyX7fZ/d
         m08jbBGSi698KMMDd1edaMum5S18gPrt7LKyIMtmp0/pB5OeDujPaqpaHmo59omcHruq
         IBDw==
X-Forwarded-Encrypted: i=1; AHgh+RoxEJBOEayO2l0l7AbxIwZU5A7HzhOhP+PW5fuAo0IUZfR0TiF5jFmHbpAUJNadf+mXcIPch5Zq9m8X@lists.linux.dev
X-Gm-Message-State: AOJu0Ywat7xdtEZlg6NU4roC63ytfHmmfopYZ8UJccDoO6X8NERQ1eSz
	Ac1HZbAtbXDvg5+6uMETQptlsbtPMXLhTKYQ5VBdwNyjVS3ZWlx/pnZ+fu5+DnbYgn/9HALSTxh
	EmIK+UA==
X-Received: from pgwa20.prod.google.com ([2002:a65:6554:0:b0:cbb:8579:3a63])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a126:b0:3b4:6a23:6ba
 with SMTP id adf61e73a8af0-3c44b006725mr571413637.26.1784762062177; Wed, 22
 Jul 2026 16:14:22 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:11 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=1555;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=wrBgxcBhN/sZNPJ4zdjh5E9TZDvM2h5ZX0OmgmcUlbY=; b=pXNTGhmG23eBH63uL+CND3RgVZfyXWaFctbAQm1rlxi8q9M8bq0fBhJEGtUE8Z5gi0YpU6n+x
 X3QsHJ5xnycBbH61MAUbN2eDF74a28NFjTpw/W/gm1ZCAXb5BZVZ3dR
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-6-15ad654a50db@google.com>
Subject: [PATCH v14 06/22] tools: include: Add kbuild.h for assembly structure offsets
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Add the Kbuild macros needed to enable the filechk_offsets mechanism to
generate C header files containing structure member offset information.

Tools depending on assembly code that operate on structures have to
hardcode the offsets of structure members. The Kbuild infrastructure
can instead generate C header files with these offsets automatically,
allowing them to be included in assembly code as symbolic constants.

For example, the TDX guest boot code requires access to parameters
passed in the C structure (struct td_boot_parameters). This header
provides the macros needed to extract these offsets from C code and
expose them to assembly, ensuring the two remain synchronized.

Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/include/linux/kbuild.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/include/linux/kbuild.h b/tools/include/linux/kbuild.h
new file mode 100644
index 000000000000..957fd55cd159
--- /dev/null
+++ b/tools/include/linux/kbuild.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __TOOLS_LINUX_KBUILD_H
+#define __TOOLS_LINUX_KBUILD_H
+
+#define DEFINE(sym, val) \
+	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
+
+#define OFFSET(sym, str, mem) \
+	DEFINE(sym, __builtin_offsetof(struct str, mem))
+
+#endif /* __TOOLS_LINUX_KBUILD_H */

-- 
2.55.0.229.g6434b31f56-goog

