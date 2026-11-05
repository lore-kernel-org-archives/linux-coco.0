Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922458;
	b=c7JdHXdJ+m0QmqYgA61eGpDD/8VQ9i8/VmSTiz2TON0tpzYPmCSMq2YHCOuqVEyo6VL1
	 EzH+b2AyZ39CYg4IR7in8UswI+605NNVkjnFFcRhiuFwYJJerBdaGvxY3qIoZda37I07R
	 qQC6LOxvSjYH81QTVJqP9XCHbA4H8nyGp4zDp1LEuKjFMIgT3XhKsxAwRlzw1QeJH0i/k
	 K59Hp2r64FpnNjBFR2frcAeux9hpJ/2ObLfFpZUmkwDDIRHkgeqBxuGKKcFFJZTo0n02S
	 Za5D7LzKJcY5OF8aU4ObVQRMwpCM+lUXoSmsTcz9PB/RnLCmvREYu2sRMsIfuUdY4CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=vppuJPSFZeGPAma4MS2y5frLVFc2Qg9ddu30RekCHa4=;
	b=AVhRcBKbd50o9GYa3eXO8nX51vj6yVaLhiUz1uqQP82zNGrwZj5ySh+D2d1LK2bH/40c
	 QZLmkhPRq2cUtKG9VGfsxQSzJUDaenoD4xxY9TI/mD+RlaqjCBb5u96k1nwLDrIH7ZFtZ
	 PKYKa7W8/UszRMbiBKKr9WmkRAJjDHrk8L//P4Ks5NcFV3GvuRd5gxyFmvLC1zELN3U1A
	 1+s9MIP+wzCNT05Gwv785OWGZeBC3vnbUkLJHS3O8sezLr0BnO2b6mytHUhDDcUpQrQp+
	 fES0JlpqjZ1/06YelNnLP+CQAG2iyEjiliRme/+i1pdK5jLVe2TXWeY9QUVRMtr23Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k+5zeLPD;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92366606D814
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 23:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92366606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k+5zeLPD
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed05900df7so686435ad.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Nov 2026 15:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922458; x=1794527258; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vppuJPSFZeGPAma4MS2y5frLVFc2Qg9ddu30RekCHa4=;
        b=k+5zeLPDweXPPYgR/CalNGiZCFSJAhbX+OBAVCSmtucrNig3Gy9DDFUEaS4YNTmwro
         HwEhS4SKIDHru4VfLS0uQ2IsHkfZiWwqy6A/4FOXgUhUf5cUIpBTgJ3QQFmqeYCVboeG
         xRdRH143gElUkeAj/dUONkHLdI2JhT9U5sLyqclCEVgn6WawoLXYHMLDT4E0EYgQS3DK
         4Wsp7ORzi7/zyHOr8DII4B+t8NMZ8bQicokoPZuZbhTLLsI5y11mmFOGb3uXnqrcXELM
         LhmURCFFuC9Ok9+jxQqThZuNLRuGGYMpB4TZyS71Vjl3q1GUOWoV4u2k3eztHVtl89Rc
         LZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922458; x=1794527258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vppuJPSFZeGPAma4MS2y5frLVFc2Qg9ddu30RekCHa4=;
        b=zIW8zdVaNnqi8GgPiiKteHd9imOD/AC1kol+qHIB2n2QiJN/dHC2Y6wKQNhkEnCTvt
         fRg7smk88SFnG3l/oqVcrqRg0ZYHiWibLbNwUW9G+WYL3eB8O9p4pXQ1sY8vnju0aIij
         5YfZNCaGa0KZAwa5ad7VwclRYcE3U5PVBI3JjxgNQfFYMUQVkN1zfzyJwBUpqlQHpGrh
         uy+cTDhHdIFETe/Ww2sf20df5ODRXknKov1+6r8iigsTKrbkhDN+v5AUSckBcL+TxXBB
         KfuQVVQ0zInQVBDB86j8LrrNJsBGg2t9o8URvjwHG9L5roh2XNNCqJTnzWLaL/6CygG5
         000A==
X-Forwarded-Encrypted: i=1; AKwUvBwNJy0W4fye+BScp9/AFQ+GCabxUqejI7zeRGlg39qfbUHvPMsZV3N3aipc4oQvKg2J4wEBwcLnVmxg@lists.linux.dev
X-Gm-Message-State: APuU4Z+TqyNMZ30Kdx+FvtNS7P/G4RaWaJV1EUGw0SteAakc6OtTkfmN
	DDJpZsoMi31RHhoO28a8uetWA+vB5C4hdxIDW2/GHFHnuOIS3aY78Yq6biU8OlRoWhiNl1qIE/1
	I9K/Bvg==
X-Received: from plsh11.prod.google.com ([2002:a17:902:b94b:b0:2e2:ec03:928c])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf4b:b0:2df:aed3:2ac0
 with SMTP id d9443c01a7336-2ed416a9ffemr13800745ad.10.1793922457565; Thu, 05
 Nov 2026 15:47:37 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:49 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1655;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=V4TjxTrjbEWZZ89lwzM/hggtPKH7gxroDMryZjL/1oM=; b=e4e3a7HKXJEtxQDmamP9yWNpd6ntThLNO1R8K/2BpnR+Ks4Qi73B8ahTCyxAZj4l+XpTYE3BM
 50G9CQ/t/OSBI0sAAQ0FgZS8Qxl/1ussSPyihInZSFEEl0Dn3GTDpC/
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-5-2024e8fa517a@google.com>
Subject: [PATCH v16 05/20] tools: include: Add kbuild.h for assembly structure offsets
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
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
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
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
2.56.0.455.g6c5a503b38-goog

