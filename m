Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586136;
	b=0QzkH5dsjp5GskbVPnBRzfz9tyTNlnIjXhn1RTRHP2QAf+uC1K5UxDSrMPfCsH0dZnjs
	 xkgXQX8tO0mJXEnhTwMdSHuXp02uu9MgmHZAxftNhQqEEMHCTdDbhJwYOu8Xq30x5xgGy
	 XDug79K7ok/r+myjSZM879Nti8U+hRCxVt0OyAykNqyBp2JEKRlL5feya9RRmbc3ZYBS7
	 fWXp1TCkt6PBqNFN4A/srYqPgtzEcXBFzR9Z8kp7BBruFVezDjwGzuKGYYnJoLSonJrq3
	 VxR/OQvohW1mhV8xM83MsGR1o3MwanJxL7W33LOuQ+hiN2LqRaFyu9HEqySJilSBzRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CHva8CWvP7gwkMlzfMecnIUN3qeNv3ZRxSwpEsl3J0M=;
	b=gvqckt/W6g4uloophiJK7Rec4RrgR9SwfKIQ0horHIap8+fMrWE/ee6E5rqirh04E+ZF
	 JvCWca793Tzu8QvatyAu3FK/mIey0UvgG0nk7hhWKaGMNmYFHKdZYLEfMn1DPsGmpMRwI
	 n3lI4D58TLqFxNb1DLfGwch6LFfoWZEIOpFqlSxGUE0GCunCoiuLu3AneYzj67Ii09UgO
	 7PVgSOz25hg15SLmxa58pq8GJk32ljSw6MCT8mHqKQ6nLJx/pZZfOVQjO7gW+Lt053Xvc
	 PvsOxh3Y+cSrSak8OZJ6UOs8rgo71vWViM4BoAbUERP+loyC6BLjSqp4tOemN9RnO1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=GRFAYTFG;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9DE606AE2F
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 16:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9DE606AE2F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=GRFAYTFG
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso292593366b.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794586133; x=1795190933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHva8CWvP7gwkMlzfMecnIUN3qeNv3ZRxSwpEsl3J0M=;
        b=GRFAYTFGDxBCLqbtL4KUCSsoKptcfTpI/+d7gSTpdQTZS1QGAQPDGNVQAnEEyUC6Ap
         Q3PtqmkaUBtOnJLtNoNmxoD48hucm89Uhp/EXw2mGpUZT5aqkYZKmSQKhNmLgqWzS9Eo
         l2hOqdf73DugDUepTZrnmnWJJWBOnyOo4d+Tsh6/EOrOiZ6nLwQqKWrgSY7UIviJenBM
         egXsIa2QnkAuSMyweQua40v115IXk31aSZdHuoa3unDjVDi9MsvqAfZuKzRZXlPD9hef
         IZRrXX2LmOPxRNgulh3el6gqibiJAEoSJtGVSkk7TiCzFCDwABLh07veQ72XZNYwGc5J
         A9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586133; x=1795190933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHva8CWvP7gwkMlzfMecnIUN3qeNv3ZRxSwpEsl3J0M=;
        b=iBgRyY5EcH6nBXJWU/mHoyyWQv+Yy3vElTXdDfXTvPSqiVbBfrRtFdVBFNY+YRFB5d
         YBN94UAX7t+DCvpL5IsYa2V3CukT4yfCmMTSvnTjErGdi3lBzzovjE3klH/OfA4Bw3Un
         udKNwKVXGj1csJJ3wu80FZ0DzST4iBpkXXceRjvxKU2kIzYhP3lKeA54iVM+ebdb/XFh
         0Y85oIWnsW+83pBQWdm9+JyBlLMCgQXLuyeYYbgzeUkbnJzYhesozS0Ciy+5JqkHU6mB
         ZSjxrnC2qa/V+j3TEhCGE0meGWHI2Vz0tD968vOakoDItN5BnKE+JvdziyS6CphZou4s
         uXGg==
X-Gm-Message-State: APuU4Z8csqbQp5dVmp65oKbZ8YvzKBOZQXc94+eyxmRnu9rHs0H1zWWc
	Pp7zwl0jS+xDpzjfUaMBvSSMyB4VMkPWa/IAAyIzYK4fYqUvwmAwq/YvUxxUF8JQbDeElKKFmPR
	fspnM
X-Gm-Gg: AYBFou3BT6uPbIol4pLr7X/k6W3sjiqY2fIfi27Ky7tQqKbs6ovYaETMVwTUi7mtNWM
	8UCsSgtO9/kYHglPRHqhjuoyegPP/dTqCL52lLZi+mmDm4wkvM5QkZoiS/Z4dkqWomAZeXRSZWn
	mfh/bl7Q9Y/z4kRuRTtXDhZaocZjCZq3onMETu1wi/zUL7YfIihaLQ9Bksxig+f1vYXUa4L1L28
	2XnurRhRC5xE+gFRGuVu18SjWc4NgSOMatrTHvjwVVXK/XlPL5mkwY43jhRxl+iwkyUNIRji+KD
	hLmkmH7f3us6ksTW/NjV6RCA2NPNAni0JK2ap7BH/FoBiec6B/VuIhah7ZiutKUOpWe33X5aEUt
	2q20vamKxX36wmAB/u15MtuP1RhOq54VYplt2JGSrTnSb7OIvNLhkpVQaLrz0azPOGwBCeaAWUg
	1EPlfJbNG0kv9RLqtjWjTXg88FtdjqQCcijM2rpK98BHNckVgU1njA/Pgx5vie3VJpRAdokEM90
	xZ/Y5s60KcT3CHZfvkuu+aUQtSEFriX0eGDY1sW+6V7+9/k0fx7v0WoBpAsU8elzoHscn+s0vz4
	rNtL9VpahpOAyzQn0V9k722UE834XJYm5Sk5J6dw
X-Received: by 2002:a17:906:f591:b0:c50:5e10:71ae with SMTP id a640c23a62f3a-c50963075f7mr289725966b.17.1794586133342;
        Fri, 13 Nov 2026 08:08:53 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ee47dsm5608032f8f.38.2026.11.13.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:08:52 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	yeoreum.yun@arm.com,
	aneesh.kumar@kernel.org,
	dave.jiang@intel.com,
	nik.borisov@suse.com,
	sergii.dmytruk@3mdeb.com
Subject: [PATCH RFC v2 3/9] attestation: Prepare provider and instance core
Date: Fri, 13 Nov 2026 17:08:32 +0100
Message-ID: <20261113160838.2512652-4-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113160838.2512652-1-jiri@resnulli.us>
References: <20261113160838.2512652-1-jiri@resnulli.us>
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

From: Jiri Pirko <jiri@nvidia.com>

Add provider validation, instance registration and lifecycle management
for the attestation family. Each instance is a device of the attestation
class, with a node under /dev/attestation/, and embeds its CTLV
instance and node.

The provider descriptor is one immutable evidence and MR contract; MR
state follows in the next patch. The core object can be compile-checked
here. CONFIG_ATTESTATION remains unwired until the CTLV handlers land.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- gave attestation its own device, class and /dev/attestation/ nodes,
  each a struct ctlv_device
- dropped the goto from attestation_registry_insert()
- noted that instance indexes are never reused
- selected CRYPTO_HASH_INFO
- selected CTLV instead of depending on it
- kept each guard() on one line
- dropped the journal from the Kconfig help
- dropped read(), poll() and the event teardown
- refused hash algorithms the hash-algo enum does not list
- gave each evidence object a class and the formats it may have
- dropped max_total_output_length
- took each signed object's challenge lengths as a list, ascending
  and disjoint
- left the object count and challenge length limits to CTLV
- added attestation_evidence_write(), for blobs of any length
- let a request omit the challenge
- separated the steps of the longer functions
- took an MR's algorithms in any order, each once
- let mr_extend get the digests of some of an MR's banks
- required mr_read of a provider with MRs, as every MR can be read
- said that an MR's extend cap is fixed
- took the UAPI headers from include/uapi/ctlv/
- named evidence objects by ID, and had the provider give each
  result's format
---
 MAINTAINERS                         |   1 +
 drivers/attestation/Kconfig         |  12 +
 drivers/attestation/Makefile        |   4 +
 drivers/attestation/core/core.c     | 429 ++++++++++++++++++++++++++++
 drivers/attestation/core/internal.h |  21 ++
 include/linux/attestation.h         | 240 ++++++++++++++++
 6 files changed, 707 insertions(+)
 create mode 100644 drivers/attestation/Kconfig
 create mode 100644 drivers/attestation/Makefile
 create mode 100644 drivers/attestation/core/core.c
 create mode 100644 drivers/attestation/core/internal.h
 create mode 100644 include/linux/attestation.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1778e676ed..e57fc8bb9c1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4441,6 +4441,7 @@ F:	Documentation/ctlv/abi/ctlv-attestation*
 F:	Documentation/ctlv/specs/ctlv-attestation*
 F:	Documentation/userspace-api/attestation*.rst
 F:	drivers/attestation/
+F:	include/linux/attestation*
 F:	include/uapi/ctlv/ctlv_attestation*
 
 ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER
diff --git a/drivers/attestation/Kconfig b/drivers/attestation/Kconfig
new file mode 100644
index 000000000000..a6bfb17dd480
--- /dev/null
+++ b/drivers/attestation/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menuconfig ATTESTATION
+	tristate "Attestation"
+	select CRYPTO_HASH_INFO
+	select CTLV
+	help
+	  Provides a CTLV family for evidence and measurement registers.
+
+	  Providers register one instance for a physical or logical device and
+	  translate the common operations to their native service.
+
+	  If you are unsure, say N.
diff --git a/drivers/attestation/Makefile b/drivers/attestation/Makefile
new file mode 100644
index 000000000000..8a75558a7013
--- /dev/null
+++ b/drivers/attestation/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_ATTESTATION) += attestation.o
+
+attestation-y := core/core.o
diff --git a/drivers/attestation/core/core.c b/drivers/attestation/core/core.c
new file mode 100644
index 000000000000..587a0a9616b6
--- /dev/null
+++ b/drivers/attestation/core/core.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <crypto/hash_info.h>
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/ctlv.h>
+#include <linux/ctlv_device.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "internal.h"
+
+#define ATTESTATION_MAX_DEVICES 4096
+
+static DEFINE_XARRAY(attestation_instances);
+
+static DEFINE_MUTEX(attestation_registry_lock);
+/* Never reused, so a stale index cannot name a newer instance. */
+static unsigned long attestation_next_index;
+
+/* A reply carries only what hash-algo in ctlv-attestation.yaml lists. */
+static bool attestation_algorithm_valid(enum hash_algo algorithm)
+{
+	return algorithm >= 0 && algorithm <= HASH_ALGO_SHA3_512 && hash_digest_size[algorithm] &&
+	       hash_digest_size[algorithm] <= HASH_MAX_DIGESTSIZE;
+}
+
+static int attestation_mr_props_validate(const struct attestation_provider *provider,
+					 const struct attestation_mr_props *props)
+{
+	DECLARE_BITMAP(seen, HASH_ALGO__LAST) = {};
+	size_t index;
+
+	if (!props || !props->name || !*props->name || strlen(props->name) > 128 ||
+	    !props->algorithms || !props->algorithms_count || props->algorithms_count > 23)
+		return -EINVAL;
+	for (index = 0; index < props->algorithms_count; index++) {
+		enum hash_algo algorithm = props->algorithms[index];
+
+		if (!attestation_algorithm_valid(algorithm) ||
+		    __test_and_set_bit(algorithm, seen))
+			return -EINVAL;
+	}
+	if (props->extendable && !provider->mr_extend)
+		return -EINVAL;
+	return 0;
+}
+
+/* What device-get and evidence-get carry, as ctlv-attestation.yaml bounds it. */
+#define ATTESTATION_EVIDENCE_OBJECTS_MAX 16
+#define ATTESTATION_EVIDENCE_FORMATS_MAX 4
+#define ATTESTATION_CHALLENGE_LENGTHS_MAX 8
+#define ATTESTATION_CHALLENGE_MAX 4096
+/* Moves with each value appended to evidence-format. */
+#define ATTESTATION_EVIDENCE_FORMAT_LAST CTLV_ATTESTATION_EVIDENCE_FORMAT_CCEL
+
+static bool
+attestation_challenge_lengths_valid(const struct attestation_evidence_supported_object *object)
+{
+	size_t index;
+
+	if (object->evidence_class != ATTESTATION_EVIDENCE_SIGNED)
+		return !object->challenge_lengths_count;
+	if (!object->challenge_lengths || !object->challenge_lengths_count ||
+	    object->challenge_lengths_count > ATTESTATION_CHALLENGE_LENGTHS_MAX)
+		return false;
+	for (index = 0; index < object->challenge_lengths_count; index++) {
+		const struct attestation_evidence_challenge_length *length =
+			&object->challenge_lengths[index];
+
+		if (!length->min || length->min > length->max ||
+		    length->max > ATTESTATION_CHALLENGE_MAX ||
+		    (index && object->challenge_lengths[index - 1].max >= length->min))
+			return false;
+	}
+	return true;
+}
+
+static bool
+attestation_formats_valid(const struct attestation_evidence_supported_object *object,
+			  u32 vendor_max)
+{
+	size_t counts[2] = {}, index, prior;
+
+	if (!object->formats || !object->formats_count)
+		return false;
+	for (index = 0; index < object->formats_count; index++) {
+		const struct attestation_evidence_format *format = &object->formats[index];
+		u32 max = format->vendor ? vendor_max : ATTESTATION_EVIDENCE_FORMAT_LAST;
+
+		if (!format->value || format->value > max ||
+		    ++counts[format->vendor] > ATTESTATION_EVIDENCE_FORMATS_MAX)
+			return false;
+		for (prior = 0; prior < index; prior++)
+			if (object->formats[prior].vendor == format->vendor &&
+			    object->formats[prior].value == format->value)
+				return false;
+	}
+	return true;
+}
+
+static int attestation_evidence_caps_validate(const struct attestation_provider *provider,
+					      const struct ctlv_family *family)
+{
+	const struct attestation_evidence_caps *caps = provider->evidence_caps;
+	size_t index;
+	u32 vendor_max;
+
+	if (!caps)
+		return provider->evidence_get ? -EINVAL : 0;
+	if (!provider->evidence_get || !caps->objects || !caps->objects_count ||
+	    caps->objects_count > ATTESTATION_EVIDENCE_OBJECTS_MAX)
+		return -EINVAL;
+
+	vendor_max = ctlv_enum_ext_max(family, CTLV_FAMILY_ATTESTATION,
+				       CTLV_ATTESTATION_ENUM_EXT_EVIDENCE_VENDOR_FORMAT);
+	for (index = 0; index < caps->objects_count; index++) {
+		const struct attestation_evidence_supported_object *object = &caps->objects[index];
+
+		if (object->evidence_class < ATTESTATION_EVIDENCE_SIGNED ||
+		    object->evidence_class > ATTESTATION_EVIDENCE_EVENT_LOG ||
+		    !attestation_formats_valid(object, vendor_max) ||
+		    !attestation_challenge_lengths_valid(object) ||
+		    !object->max_length || object->max_length > UINT_MAX)
+			return -EINVAL;
+	}
+	return 0;
+}
+
+int attestation_provider_validate(const struct attestation_provider *provider,
+				  const struct ctlv_family *family)
+{
+	size_t index;
+	int ret;
+
+	if (!provider)
+		return -EINVAL;
+	ret = attestation_evidence_caps_validate(provider, family);
+	if (ret)
+		return ret;
+	if (!!provider->mrs != !!provider->mrs_count)
+		return -EINVAL;
+	if (provider->mrs_count && !provider->mr_read)
+		return -EINVAL;
+	if ((provider->mr_read || provider->mr_extend) && !provider->mrs_count)
+		return -EINVAL;
+	for (index = 0; index < provider->mrs_count; index++) {
+		ret = attestation_mr_props_validate(provider, &provider->mrs[index]);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static bool attestation_parent_exists(struct device *parent)
+{
+	struct attestation_dev *att;
+	unsigned long index;
+
+	xa_for_each(&attestation_instances, index, att)
+		if (att->node.dev.parent == parent)
+			return true;
+	return false;
+}
+
+static int attestation_registry_insert(struct attestation_dev *att)
+{
+	unsigned long index;
+	void *old;
+	int ret;
+
+	guard(mutex)(&attestation_registry_lock);
+	if (attestation_next_index > UINT_MAX)
+		return -ENOSPC;
+	index = attestation_next_index;
+	ret = xa_reserve(&attestation_instances, index, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	xa_lock(&attestation_instances);
+	if (attestation_parent_exists(att->node.dev.parent)) {
+		__xa_erase(&attestation_instances, index);
+		ret = -EEXIST;
+	} else {
+		old = __xa_store(&attestation_instances, index, att, GFP_NOWAIT);
+		ret = xa_err(old);
+	}
+	if (!ret) {
+		att->index = index;
+		attestation_next_index++;
+	}
+	xa_unlock(&attestation_instances);
+	return ret;
+}
+
+static void attestation_registry_remove(struct attestation_dev *att)
+{
+	xa_erase(&attestation_instances, att->index);
+}
+
+bool attestation_registered(struct attestation_dev *att)
+{
+	bool registered;
+
+	lockdep_assert_held(&att->lock);
+	xa_lock(&attestation_instances);
+	registered = xa_get_mark(&attestation_instances, att->index, ATTESTATION_REGISTERED);
+	xa_unlock(&attestation_instances);
+	return registered;
+}
+
+void attestation_stop(struct attestation_dev *att)
+{
+	lockdep_assert_held(&att->lock);
+	xa_lock(&attestation_instances);
+	__xa_clear_mark(&attestation_instances, att->index, ATTESTATION_REGISTERED);
+	xa_unlock(&attestation_instances);
+}
+
+/**
+ * attestation_evidence_write - Write an evidence object to its blob.
+ * @object: the requested object
+ * @data: the object's bytes
+ * @length: their length, at most the object's max_length
+ *
+ * A blob too short for the object fails the operation, and the caller is told
+ * how long it has to be.
+ *
+ * Return: 0, -EMSGSIZE where the blob is too short, or another negative error.
+ */
+int attestation_evidence_write(const struct attestation_evidence_object_request *object,
+			       const void *data, size_t length)
+{
+	if (length > object->supported_object->max_length)
+		return -E2BIG;
+	if (length > ctlv_blob_len(object->output))
+		return ctlv_blob_too_short(object->output, length);
+	return ctlv_blob_write(object->output, 0, data, length);
+}
+EXPORT_SYMBOL_NS_GPL(attestation_evidence_write, "ATTESTATION");
+
+void attestation_provide_ops(struct attestation_dev *att)
+{
+	const struct attestation_provider *provider = att->provider;
+	struct ctlv *ctlv = &att->ctlv;
+
+	if (provider->evidence_caps) {
+		ctlv_attestation_evidence_get_provide(ctlv);
+		ctlv_attestation_evidence_get_enable(ctlv);
+	}
+}
+
+/* Runs from the release, so it must not reach the provider's module. */
+static void attestation_state_free(struct attestation_dev *att)
+{
+	mutex_destroy(&att->lock);
+}
+
+static int attestation_op_pre(struct ctlv *ctlv, struct ctlv_op_ctx *ctx)
+{
+	struct attestation_dev *att = attestation_from_ctlv(ctlv);
+
+	mutex_lock(&att->lock);
+	if (!attestation_registered(att)) {
+		mutex_unlock(&att->lock);
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static void attestation_op_post(struct ctlv *ctlv, struct ctlv_op_ctx *ctx)
+{
+	mutex_unlock(&attestation_from_ctlv(ctlv)->lock);
+}
+
+static const struct ctlv_hooks attestation_ctlv_hooks = {
+	.pre = attestation_op_pre,
+	.post = attestation_op_post,
+};
+
+/* Kernel callers find a device by its mark, and are drained once it is gone. */
+static void attestation_withdraw(struct attestation_dev *att)
+{
+	xa_lock(&attestation_instances);
+	__xa_clear_mark(&attestation_instances, att->index, ATTESTATION_REGISTERED);
+	xa_unlock(&attestation_instances);
+}
+
+static char *attestation_devnode(const struct device *dev, umode_t *mode)
+{
+	return kasprintf(GFP_KERNEL, "attestation/%s", dev_name(dev));
+}
+
+static void attestation_dev_release(struct device *dev)
+{
+	struct attestation_dev *att = container_of(dev, struct attestation_dev, node.dev);
+
+	attestation_state_free(att);
+	ctlv_fini(&att->ctlv);
+	ctlv_device_fini(&att->node);
+	kfree(att);
+}
+
+/*
+ * The core registers the class, so an open holds the core module and not the
+ * provider's, which may unload while readers remain.
+ */
+static struct ctlv_device_class attestation_class = {
+	.class = {
+		.name = "attestation",
+		.dev_release = attestation_dev_release,
+		.devnode = attestation_devnode,
+	},
+	.max_devices = ATTESTATION_MAX_DEVICES,
+};
+
+struct attestation_dev *_attestation_alloc(struct device *parent,
+					   const struct attestation_provider *provider,
+					   const struct ctlv_family *family, size_t size,
+					   size_t offset)
+{
+	struct attestation_dev *att;
+	int ret;
+
+	if (!parent || WARN_ON_ONCE(offset || size < sizeof(*att)) ||
+	    !ctlv_family_inherits(family, &ctlv_attestation_family))
+		return ERR_PTR(-EINVAL);
+	ret = attestation_provider_validate(provider, family);
+	if (ret)
+		return ERR_PTR(ret);
+
+	att = kzalloc(size, GFP_KERNEL);
+	if (!att)
+		return ERR_PTR(-ENOMEM);
+	att->provider = provider;
+	mutex_init(&att->lock);
+
+	/* From here on, the release frees whatever was set up. */
+	ret = ctlv_device_init(&att->node, &attestation_class, parent, &att->ctlv);
+	if (!ret)
+		ret = ctlv_init(&att->ctlv, &att->node.dev, family, &attestation_ctlv_hooks);
+	if (ret) {
+		put_device(&att->node.dev);
+		return ERR_PTR(ret);
+	}
+	attestation_provide_ops(att);
+	return att;
+}
+EXPORT_SYMBOL_NS_GPL(_attestation_alloc, "ATTESTATION");
+
+/**
+ * attestation_register - Make an allocated device reachable.
+ * @att: device from attestation_alloc()
+ *
+ * Return: 0, or a negative errno with @att still to be put.
+ */
+int attestation_register(struct attestation_dev *att)
+{
+	int ret;
+
+	ret = attestation_registry_insert(att);
+	if (ret)
+		return ret;
+	ctlv_publish(&att->ctlv);
+	xa_lock(&attestation_instances);
+	__xa_set_mark(&attestation_instances, att->index, ATTESTATION_REGISTERED);
+	xa_unlock(&attestation_instances);
+
+	ret = ctlv_device_add(&att->node);
+	if (ret)
+		goto err_withdraw;
+	return 0;
+
+err_withdraw:
+	attestation_withdraw(att);
+	ctlv_unpublish(&att->ctlv);
+	attestation_registry_remove(att);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(attestation_register, "ATTESTATION");
+
+/**
+ * attestation_unregister - Cut a registered device off from every caller.
+ * @att: registered device
+ *
+ * No provider callback runs once this returns, though open files may still
+ * hold @att.
+ */
+void attestation_unregister(struct attestation_dev *att)
+{
+	/* No new opens, and no node to open. */
+	ctlv_device_del(&att->node);
+	attestation_withdraw(att);
+	ctlv_unpublish(&att->ctlv);
+	attestation_registry_remove(att);
+}
+EXPORT_SYMBOL_NS_GPL(attestation_unregister, "ATTESTATION");
+
+/**
+ * attestation_put - Drop the reference attestation_alloc() returned.
+ * @att: device
+ */
+void attestation_put(struct attestation_dev *att)
+{
+	put_device(&att->node.dev);
+}
+EXPORT_SYMBOL_NS_GPL(attestation_put, "ATTESTATION");
+
+static int __init attestation_module_init(void)
+{
+	return ctlv_device_class_register(&attestation_class);
+}
+
+static void __exit attestation_module_exit(void)
+{
+	WARN_ON_ONCE(!xa_empty(&attestation_instances));
+	xa_destroy(&attestation_instances);
+	ctlv_device_class_unregister(&attestation_class);
+}
+
+module_init(attestation_module_init);
+module_exit(attestation_module_exit);
+MODULE_DESCRIPTION("Attestation core");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CTLV");
diff --git a/drivers/attestation/core/internal.h b/drivers/attestation/core/internal.h
new file mode 100644
index 000000000000..f42bc3cd9a35
--- /dev/null
+++ b/drivers/attestation/core/internal.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ATTESTATION_INTERNAL_H
+#define _ATTESTATION_INTERNAL_H
+
+#include <linux/attestation.h>
+#include <linux/ctlv.h>
+#include <linux/mutex.h>
+#include <linux/xarray.h>
+
+#include "../generated/ctlv_attestation_gen.h"
+
+#define ATTESTATION_REGISTERED XA_MARK_1
+
+bool attestation_registered(struct attestation_dev *att);
+void attestation_stop(struct attestation_dev *att);
+
+int attestation_provider_validate(const struct attestation_provider *provider,
+				  const struct ctlv_family *family);
+void attestation_provide_ops(struct attestation_dev *att);
+
+#endif /* _ATTESTATION_INTERNAL_H */
diff --git a/include/linux/attestation.h b/include/linux/attestation.h
new file mode 100644
index 000000000000..29bb776bfb41
--- /dev/null
+++ b/include/linux/attestation.h
@@ -0,0 +1,240 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _LINUX_ATTESTATION_H
+#define _LINUX_ATTESTATION_H
+
+#include <crypto/hash.h>
+#include <linux/build_bug.h>
+#include <linux/ctlv.h>
+#include <linux/ctlv_device.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#include <uapi/ctlv/ctlv_attestation_gen.h>
+#include <uapi/linux/hash_info.h>
+
+struct attestation_dev;
+struct ctlv_blob;
+struct ctlv_family;
+
+enum attestation_evidence_class {
+	ATTESTATION_EVIDENCE_SIGNED = CTLV_ATTESTATION_EVIDENCE_CLASS_SIGNED,
+	ATTESTATION_EVIDENCE_EVENT_LOG = CTLV_ATTESTATION_EVIDENCE_CLASS_EVENT_LOG,
+};
+
+/**
+ * struct attestation_digest - One MR digest.
+ * @algorithm: hash algorithm
+ * @data: digest bytes
+ */
+struct attestation_digest {
+	enum hash_algo algorithm;
+	u8 data[HASH_MAX_DIGESTSIZE];
+};
+
+/**
+ * struct attestation_digest_set - Digests for an MR's banks, in the MR's order.
+ * @values_count: number of digests
+ * @values: digest array
+ */
+struct attestation_digest_set {
+	size_t values_count;
+	struct attestation_digest *values;
+};
+
+/**
+ * struct attestation_mr_props - Immutable MR properties.
+ * @id: provider-unique MR ID
+ * @name: MR name
+ * @algorithms: bank hash algorithms, each once, in the order replies list them
+ * @algorithms_count: number of algorithms
+ * @has_register_index: whether @register_index is valid
+ * @register_index: native register index
+ * @extendable: MR may be extended. Fixed: the provider instead refuses an
+ *	extend the platform forbids at the time, e.g. -EPERM for a TPM locality.
+ */
+struct attestation_mr_props {
+	unsigned int id;
+	const char *name;
+	const enum hash_algo *algorithms;
+	size_t algorithms_count;
+	bool has_register_index;
+	unsigned int register_index;
+	bool extendable;
+};
+
+/**
+ * struct attestation_evidence_format - The layout of an evidence object.
+ * @vendor: @value is an evidence-vendor-format value the device's family
+ *	gives, not an evidence-format one
+ * @value: the value, such as CTLV_ATTESTATION_EVIDENCE_FORMAT_CCEL
+ */
+struct attestation_evidence_format {
+	bool vendor;
+	u32 value;
+};
+
+/**
+ * struct attestation_evidence_challenge_length - Challenge lengths taken.
+ * @min: shortest challenge bytes, at least 1
+ * @max: longest challenge bytes, @min for one exact length, at most 4096
+ */
+struct attestation_evidence_challenge_length {
+	size_t min;
+	size_t max;
+};
+
+/**
+ * struct attestation_evidence_supported_object - One evidence object.
+ * @evidence_class: what the object is
+ * @formats: the layouts it may have, at most four of each kind
+ * @formats_count: number of formats
+ * @challenge_lengths: a signed object's challenge lengths, ascending and
+ *	disjoint; none for any other object
+ * @challenge_lengths_count: number of challenge lengths, at most 8
+ * @max_length: longest the object gets, in bytes
+ * @binds_mrs: the object covers MR values, as they are or by a digest, so
+ *	the reply carries mr-generation
+ *
+ * The object's index in the provider's objects is its ID.
+ */
+struct attestation_evidence_supported_object {
+	enum attestation_evidence_class evidence_class;
+	const struct attestation_evidence_format *formats;
+	size_t formats_count;
+	const struct attestation_evidence_challenge_length *challenge_lengths;
+	size_t challenge_lengths_count;
+	size_t max_length;
+	bool binds_mrs;
+};
+
+/**
+ * struct attestation_evidence_caps - Immutable evidence capabilities.
+ * @objects: supported evidence objects, at most 16
+ * @objects_count: number of objects
+ */
+struct attestation_evidence_caps {
+	const struct attestation_evidence_supported_object *objects;
+	size_t objects_count;
+};
+
+/**
+ * struct attestation_evidence_object_request - One resolved output object.
+ * @supported_object: the object requested
+ * @output: resolved output blob
+ */
+struct attestation_evidence_object_request {
+	const struct attestation_evidence_supported_object *supported_object;
+	struct ctlv_blob *output;
+};
+
+/**
+ * struct attestation_evidence_request - Validated evidence request.
+ * @challenge: challenge bytes, of a length every signed object requested
+ *	takes, or NULL where the request names no signed object
+ * @challenge_length: challenge length, 0 without a challenge
+ * @objects: requested output objects
+ * @objects_count: number of objects
+ */
+struct attestation_evidence_request {
+	const u8 *challenge;
+	size_t challenge_length;
+	const struct attestation_evidence_object_request *objects;
+	size_t objects_count;
+};
+
+/**
+ * struct attestation_evidence_object_result - What a provider made of one object.
+ * @format: the layout it came in, one of the object's formats
+ * @length: bytes written
+ */
+struct attestation_evidence_object_result {
+	struct attestation_evidence_format format;
+	size_t length;
+};
+
+/**
+ * struct attestation_evidence_result - Provider evidence result.
+ * @objects: one for every requested object, in request order
+ */
+struct attestation_evidence_result {
+	struct attestation_evidence_object_result *objects;
+};
+
+/**
+ * struct attestation_provider - Immutable provider operations and properties.
+ * @evidence_get: produce requested evidence, each object written with
+ *	attestation_evidence_write() and its result filled in
+ * @mr_read: read one MR; every MR can be read, so required with @mrs
+ * @mr_extend: extend the banks of one MR it gets digests for, leaving the
+ *	others, or fail with -EOPNOTSUPP before changing any if it cannot
+ * @evidence_caps: evidence capabilities, or NULL
+ * @mrs: fixed MR properties
+ * @mrs_count: number of fixed MRs
+ */
+struct attestation_provider {
+	int (*evidence_get)(struct attestation_dev *att,
+			    const struct attestation_evidence_request *request,
+			    struct attestation_evidence_result *result);
+	int (*mr_read)(struct attestation_dev *att, unsigned int mr_id,
+		       struct attestation_digest_set *values);
+	int (*mr_extend)(struct attestation_dev *att, unsigned int mr_id,
+			 const struct attestation_digest_set *values);
+	const struct attestation_evidence_caps *evidence_caps;
+	const struct attestation_mr_props *mrs;
+	size_t mrs_count;
+};
+
+/**
+ * struct attestation_dev - One attestation device.
+ * @node: the device's node, whose release frees the driver's struct embedding
+ *	this
+ *
+ * A driver embeds this first in its own struct, allocated by
+ * attestation_alloc(), and reaches that struct with container_of().
+ */
+struct attestation_dev {
+	struct ctlv_device node;
+	/* private: */
+	struct ctlv ctlv;
+	const struct attestation_provider *provider;
+	unsigned int index;
+
+	/* Mutable instance state. */
+	struct mutex lock;
+
+};
+
+/* What a CTLV callback of a family inheriting ctlv-attestation was handed. */
+static inline struct attestation_dev *attestation_from_ctlv(struct ctlv *ctlv)
+{
+	return container_of(ctlv, struct attestation_dev, ctlv);
+}
+
+struct attestation_dev *_attestation_alloc(struct device *parent,
+					   const struct attestation_provider *provider,
+					   const struct ctlv_family *family, size_t size,
+					   size_t offset);
+
+/**
+ * attestation_alloc - Allocate a driver struct embedding an attestation device.
+ * @parent: the device attested
+ * @provider: provider operations and properties, which must outlive the device
+ * @family: the driver's CTLV family, which inherits ctlv-attestation
+ * @type: the driver's struct
+ * @member: its struct attestation_dev, the first member
+ *
+ * Return: the driver's struct, released by attestation_put(), or an error
+ * pointer.
+ */
+#define attestation_alloc(parent, provider, family, type, member)		\
+	((type *)_attestation_alloc(parent, provider, family, sizeof(type),	\
+				    offsetof(type, member)))
+
+int attestation_register(struct attestation_dev *att);
+void attestation_unregister(struct attestation_dev *att);
+void attestation_put(struct attestation_dev *att);
+
+int attestation_evidence_write(const struct attestation_evidence_object_request *object,
+			       const void *data, size_t length);
+#endif /* _LINUX_ATTESTATION_H */
-- 
2.56.0

