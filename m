Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284428;
	b=NLqb1bSzcMvMD2DvSDISppQCWVuA+bZexnizdQARYSsWRfqO4SL/+ydAWicvFTWB2AE0
	 gqG6jSC79iPCjfCnZrS5aYVVFEDwESaaAVzzEPGSZEXFGYLjCT5DALBfgbgf4Pa1HhjpP
	 1T1GQCl0t9Iyw7ZBoz6Nt5cGMHW5zcR2CVHMW6U3C4lm1QxXSl+D5z/UDfmDeJyYwvDjF
	 qrDmnc6vgA2MkJmq9OTI52pEZhIXNU+TKkAnmUeJ3TGt9rVv6BCgmNmcPU7Laxi96g1y6
	 3XJymRjUwSwomQr1+oiX0JPTN71DScoBz2+hK3wsBecsnm+8Ro4LQUAd1Istzrmgwxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rX3eOIhdhRHySKS78JmU6O3hNLJaTPPxqUJgDm/7MWc=;
	b=phiR2XAhNH0AAjOBMwQNOwqmkMknSZK7MnF5EEkWVdmZDkbKXNnVQ2fzDYxle+7FKAac
	 ac2mawWvnPG6rC3Xm/hk17SL4wGs5t6lCPoxkkurddKVtWWO/EPTpUzXlrhjnKa9wO8wP
	 Y0Jsnp9tIJrsxCqGq2OjLuKfIiJvOTlsKcUJ/5QOD6sggnkXDi762SJHlEZAlXUFW8nZB
	 EyKLIGXITmTxoZzVq9oYpE96Eu5bjx/BtIHsBVMQKyN+eJEUuo6rEQNtqI3/fTnL8XiXD
	 VBCwV/E23Z0MEZpqO+Y3EpCxntmq79Py6Xlqy4vPNFt+KfpnSzgAEmuE4IRkUnSgb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JP3sKkSs;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609CD606A9E7
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 04:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 609CD606A9E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JP3sKkSs
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so3184616eec.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 20:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284427; x=1794889227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rX3eOIhdhRHySKS78JmU6O3hNLJaTPPxqUJgDm/7MWc=;
        b=JP3sKkSsOiEb45lths8DDFCvyWfJ6YL5XgzfRegK+J52ynCO39jeBJ5zCKJDYqXEqu
         zzbbPHvUO9CW+a8PHFqYdQstvB0iG4fC0qz8aRgnjHVsIaSEHuQMSZD7n+WONLtrQ6rg
         XCMxYOfGOve9G6ysoH9JV8mxRea2iJO/vohFoZOSC57oEMNIoxH5KmV0Hkxcws90nXU8
         +zrq2AqGQrkt1HTFEhvOlgJXE7cQAarapEplCj0amm/bretyOhh4TVpMOYX9o+dM9arG
         nWAYMcJ0TVMzdxpzNq4v9p7zFeAUN4DjiEeMCsFR2IUz/uMUCTUglVEBWuFW4cPDezT5
         zLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284427; x=1794889227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rX3eOIhdhRHySKS78JmU6O3hNLJaTPPxqUJgDm/7MWc=;
        b=goxMcevapPVom6NnL04M6ia4qhQ79RnVxptO+55/PEwdXibOlo/ndijpENup8uXeYw
         tJ27tIntCVgY272J+y8TB/rf0OxrlZJUa4oTcqm/Wy1l/ThZGg7xGnPHoXI/KsNDN7TM
         R/GsVeJUjukMEmqjKj1cIS/ZgYi/uFEDTzJIwfzxGupTIZCm07IDkl6FzVal62WAMZbA
         +qMTS3uFWpaq9vMP9DD3c3zN9KEVEfKue+jOcn6oUThfjj/047DOD6JvQ+83aCRDuVil
         c93l1NxchguimUAsgtBDcOOPeV35lLfUcTYluczAme5Pgn8813V2LFKJod5ZYMnakRkj
         gkRQ==
X-Forwarded-Encrypted: i=1; AL+hErHy43vVmiO9fDgxjGli0Lnr+j95p/JIDx8EoY8SDKFUUVuEv8xDBOefAn12XK3wnzrATIvj2swT60lb@lists.linux.dev
X-Gm-Message-State: APuU4Z9+okYT6hrCDA9dOUeE4GI78Lav2LVE2mFM32Sk9GS2G0aUVN1x
	53kl7SIsjYc5exU0Yi+fDb0Sdi5x+0Fgu8FC4haJQxXqynX2JFYp+90z
X-Gm-Gg: AYBFou0jFIOcdXEp47bm/tmJeR7ATKy7Kacc6Ipsl14RDKJzWol96SPcXX0cOS7nssJ
	wjq0zkD50SJCgKMy5we2RsCafZnkh9Za5X3NG0L/3bVNoaIr99rVpmtYDoeI0UFZ+MoI4Xgb52Q
	XX7wSZECIaJ2IIdqLq32JCwnk2rSh92L3ydkvrKW7KvY0FM7zy2mtpJ1AyneSkfKOPFONzqnakk
	mkh2eNcvADP8w2kZzYKqeyrQfUsK/xTqo755Yxt9RJOVWRjPfoYxi+6Ylr+eErkIQ2YXkGeNgPg
	y7Zr8E+ESYhp/TABLccYt1Sdv1ReZzE4WTPc9GbyxaMdVEJMEnWyOXVg8oKp9TzlSXfFh3dBzQp
	bC/le7j/i0/LC5IB4bZWzcVXzXHcOHi8LWg/zWxGSvREKTWWID268emWKB0PCoe8POm5rtN4ffh
	b4OBTO0EaI2k8IYdUHs5j6jCRHPqC+G1dNFcMsPg7g2TgODamFDChEffQPB4RoU9a5R1vanUJjx
	8jqLPKJrH3u/hJ5KtL4X4LJyoczJQlwRk1zjaA80TqYAixlw0LnwbtvVzzOtXlNx/FVLzYwgZdS
	+YJDL+m1fiowj/Uu0lPwWQgiXd9kzlvh2yek80l3k4tKYec=
X-Received: by 2002:a05:7022:3b84:b0:143:26cf:8615 with SMTP id a92af1059eb24-1b3b604c358mr2166039c88.25.1794284427436;
        Mon, 09 Nov 2026 20:20:27 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:20:26 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v6 12/25] PCI/CMA: Add a PCI TSM CMA driver using SPDM
Date: Tue, 10 Nov 2026 14:18:19 +1000
Message-ID: <20261110041832.1730924-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

Component Measurement and Authentication (CMA, PCIe r6.2 sec 6.31)
allows for measurement and authentication of PCIe devices.  It is
based on the Security Protocol and Data Model specification (SPDM,
https://www.dmtf.org/dsp/DSP0274).

CMA-SPDM in turn forms the basis for Integrity and Data Encryption
(IDE, PCIe r6.2 sec 6.33) because the key material used by IDE is
transmitted over a CMA-SPDM session.

As a first step, add support for authentication via a CMA TSM driver.

This was previously discussed here:
http://lore.kernel.org/69976d7d39c60_2f4a1009@dwillia2-mobl4.notmuch

By utilising a TSM driver we get a lot of the TSM driver probe policies
"for free". Currently there is no mechanism to provide evidence to
userspace, as the TSM system doesn't support that at the moment. That
can be added later when support by TSM.

Credits: Jonathan wrote the original proof-of-concept for a CMA implementation.
Lukas reworked that for upstream. Wilfred contributed fixes for issues
discovered during testing. Alistair reworked it as a TSM driver.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Co-developed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Co-developed-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS             |   1 +
 drivers/pci/Kconfig     |  14 ++++
 drivers/pci/Makefile    |   2 +
 drivers/pci/cma.c       | 150 ++++++++++++++++++++++++++++++++++++++++
 drivers/pci/doe.c       |   3 -
 include/linux/pci-doe.h |   4 ++
 6 files changed, 171 insertions(+), 3 deletions(-)
 create mode 100644 drivers/pci/cma.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7af01251af461..43ac4c0a1ae3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25393,6 +25393,7 @@ L:	linux-cxl@vger.kernel.org
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/devsec/spdm.git
+F:	drivers/pci/cma*
 F:	include/linux/spdm.h
 F:	lib/rspdm/
 
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 0c7408509ba24..0862ef69aa3fd 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -124,6 +124,20 @@ config PCI_ATS
 config PCI_IDE
 	bool
 
+config PCI_CMA
+	bool "Component Measurement and Authentication (CMA-SPDM)"
+	depends on RSPDM
+	select CRYPTO_ECDSA
+	select CRYPTO_RSA
+	select CRYPTO_SHA256
+	select CRYPTO_SHA512
+	select PCI_DOE
+	select PCI_TSM
+	help
+	  Authenticate devices on enumeration per PCIe r6.2 sec 6.31.
+	  A PCI DOE mailbox is used as transport for DMTF SPDM based
+	  authentication, measurement and secure channel establishment.
+
 config PCI_TSM
 	bool "PCI TSM: Device security protocol support"
 	select PCI_IDE
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 41ebc3b9a5182..16abfd0e17e19 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -41,6 +41,8 @@ obj-$(CONFIG_PCI_NPEM)		+= npem.o
 obj-$(CONFIG_PCIE_TPH)		+= tph.o
 obj-$(CONFIG_CARDBUS)		+= setup-cardbus.o
 
+obj-$(CONFIG_PCI_CMA)		+= cma.o
+
 # Endpoint library must be initialized before its users
 obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
 
diff --git a/drivers/pci/cma.c b/drivers/pci/cma.c
new file mode 100644
index 0000000000000..3f0c989b52c5d
--- /dev/null
+++ b/drivers/pci/cma.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Component Measurement and Authentication (CMA-SPDM, PCIe r6.2 sec 6.31)
+ *
+ * Copyright (C) 2021 Huawei
+ *     Jonathan Cameron <Jonathan.Cameron@huawei.com>
+ * Copyright (C) 2022-24 Intel Corporation
+ * Copyright (C) 2026 Western Digital
+ * 	Alistair Francis <alistair.francis@wdc.com>
+ */
+
+#define dev_fmt(fmt) "CMA: " fmt
+
+#include <linux/err.h>
+#include <linux/pci.h>
+#include <linux/pci-doe.h>
+#include <linux/pci-tsm.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/spdm.h>
+#include <linux/tsm.h>
+
+#include "pci.h"
+
+static int pci_doe_transport(void *priv, struct device *dev,
+			     const void *request, size_t request_sz,
+			     void *response, size_t response_sz)
+{
+	struct pci_doe_mb *doe = priv;
+
+	return pci_doe(doe, PCI_VENDOR_ID_PCI_SIG, PCI_DOE_FEATURE_CMA,
+		       request, request_sz, response, response_sz);
+}
+
+struct pci_cma_tsm {
+	struct pci_tsm_host host;
+	struct spdm_state *spdm;
+};
+
+static struct pci_cma_tsm *cma_tsm_from_tsm(struct pci_tsm *tsm)
+{
+	struct pci_tsm_host *host = container_of(tsm, struct pci_tsm_host, base_tsm);
+
+	return container_of(host, struct pci_cma_tsm, host);
+}
+
+static struct pci_tsm *pci_cma_tsm_probe(struct tsm_dev *tsm_dev,
+					 struct pci_dev *pdev)
+{
+	struct pci_cma_tsm *cma;
+	int rc;
+
+	if (!pdev->doe_cma || pdev->is_virtfn)
+		return NULL;
+
+	cma = kzalloc(sizeof(*cma), GFP_KERNEL);
+	if (!cma)
+		return NULL;
+
+	rc = pci_tsm_host_constructor(pdev, &cma->host, tsm_dev);
+	if (rc) {
+		kfree(cma);
+		return NULL;
+	}
+
+	cma->spdm = spdm_create(&pdev->dev, pci_doe_transport, cma->host.doe_mb,
+				PCI_DOE_MAX_PAYLOAD, NULL);
+	if (!cma->spdm) {
+		pci_tsm_host_destructor(&cma->host);
+		kfree(cma);
+		return NULL;
+	}
+
+	return &cma->host.base_tsm;
+}
+
+static void pci_cma_tsm_remove(struct pci_tsm *tsm)
+{
+	struct pci_cma_tsm *cma = cma_tsm_from_tsm(tsm);
+
+	spdm_destroy(cma->spdm);
+	pci_tsm_host_destructor(&cma->host);
+	kfree(cma);
+}
+
+static int pci_cma_tsm_connect(struct pci_dev *pdev)
+{
+	struct pci_cma_tsm *cma = cma_tsm_from_tsm(pdev->tsm);
+
+	/*
+	 * The DOE mailbox lives in the device's config space, so the device
+	 * must be runtime-resumed for the duration of the SPDM exchange.
+	 */
+	PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
+
+	return spdm_authenticate(cma->spdm);
+}
+
+static void pci_cma_tsm_disconnect(struct pci_dev *pdev)
+{
+	/* SPDM state is freed in pci_cma_tsm_remove() */
+}
+
+static struct pci_tdi *pci_cma_tsm_bind(struct pci_dev *pdev,
+					struct kvm *kvm, u32 tdi_id)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static void pci_cma_tsm_unbind(struct pci_tdi *tdi)
+{
+}
+
+static ssize_t pci_cma_tsm_guest_req(struct pci_tdi *tdi,
+				     enum pci_tsm_req_scope scope,
+				     sockptr_t req_in, size_t in_len,
+				     sockptr_t req_out, size_t out_len,
+				     u64 *tsm_code)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct pci_tsm_ops pci_cma_tsm_ops = {
+	.link_ops = {
+		.probe		= pci_cma_tsm_probe,
+		.remove		= pci_cma_tsm_remove,
+		.connect	= pci_cma_tsm_connect,
+		.disconnect	= pci_cma_tsm_disconnect,
+		.bind		= pci_cma_tsm_bind,
+		.unbind		= pci_cma_tsm_unbind,
+		.guest_req	= pci_cma_tsm_guest_req,
+	},
+};
+
+static struct tsm_dev *pci_cma_tsm_dev;
+
+static int __init pci_cma_tsm_init(void)
+{
+	struct tsm_dev *tsm_dev;
+
+	tsm_dev = tsm_register(NULL, &pci_cma_tsm_ops);
+	if (IS_ERR(tsm_dev))
+		return PTR_ERR(tsm_dev);
+
+	pci_cma_tsm_dev = tsm_dev;
+	return 0;
+}
+late_initcall(pci_cma_tsm_init);
diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
index 365634fb0df7a..5f79307e0f087 100644
--- a/drivers/pci/doe.c
+++ b/drivers/pci/doe.c
@@ -31,9 +31,6 @@
 #define PCI_DOE_FLAG_CANCEL	0
 #define PCI_DOE_FLAG_DEAD	1
 
-/* Max data object length is 2^18 dwords */
-#define PCI_DOE_MAX_LENGTH	(1 << 18)
-
 /**
  * struct pci_doe_mb - State for a single DOE mailbox
  *
diff --git a/include/linux/pci-doe.h b/include/linux/pci-doe.h
index bd4346a7c4e75..7540396336def 100644
--- a/include/linux/pci-doe.h
+++ b/include/linux/pci-doe.h
@@ -19,6 +19,10 @@ struct pci_doe_mb;
 #define PCI_DOE_FEATURE_CMA 1
 #define PCI_DOE_FEATURE_SSESSION 2
 
+/* Max data object length is 2^18 dwords (including 2 dwords for header) */
+#define PCI_DOE_MAX_LENGTH	(1 << 18)
+#define PCI_DOE_MAX_PAYLOAD	((PCI_DOE_MAX_LENGTH - 2) * sizeof(u32))
+
 struct pci_doe_mb *pci_find_doe_mailbox(struct pci_dev *pdev, u16 vendor,
 					u8 type);
 
-- 
2.56.0

