Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA253D0B7
	for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075933; cv=none; b=rtiV7Z2hA4LJK1NkBrSDtfXrEwhiguA3NOdd96LyEY2n8D7KDYVhvntfQBei/y1e3AtiCPcmSphJljNHN7PPspKS6iA0OYJekUHxtpDDiD46HbfTa8u5KWA5VQpjwT3woFaDSDH5PwKeTVLi3Ruj/t4zplnVcEazxyYCSPek7H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075933; c=relaxed/simple;
	bh=rNQbhegal9uJ2RV6EvMg4tporEsShlLGYjXsWN4gNxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9V4pN5MW8XoLPH4ItbU55n/rltk43DSWfT+Hx9SXcyYE05cD+dVKHt7V4yuw+kaYvvwpvFCfFBUzhQpO8qnlq+RjeCGKe2OzomkL1GrpDkooFcLl09m/upBiTAwtLtKaT3Ii/MWlnhqFPG7qT94UcRbwkJ7mWa2mwLtnzhfKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=YhZujd3E; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="YhZujd3E"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso817702966b.2
        for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792075927; x=1792680727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMl1mVVq45+OUljVDeNvidHDab+EYetd2tlCIoE187k=;
        b=YhZujd3EAb0cAC2DH8m0+E1BH4+PHl9/JaRwqjKzrQz8XgtdlG10+xMhz35TaX+3oa
         cnW3oi91QCjqyG2TJQaCOd7qQtKJj+l/m9EIX9ImjZaiLs9E5KwT7OSkoHOVIYkOMKE6
         C8fyQsLzlUwxn1Pd7kw14uzZBpZh/7ijZHPc+4+SFpFJE06dOGELC/rHucwJlXenAhBm
         VHtoh7ODegHrW2JygNe4WDha815+XsojMvofR9xhbMTnIC1Ffe+nz1Tfrmca43Dsi82P
         sLbf/eahpBkRShPj9SUoULSc7wyr7HHi0YzG0hnJsD+qj17mIAGgILLfoqCx2e/wmuKP
         EyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075927; x=1792680727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMl1mVVq45+OUljVDeNvidHDab+EYetd2tlCIoE187k=;
        b=L4bt1Nq394Wp+TH1dOV9CGRj0h+1Yofs/E91S1kRRGSaKU72cpt7tkwJxyPclmo8TD
         XjJ2VyUAWs9reZDX6OLsPHlY522H0tGgnFfHLKObl+jmovzSjUmsfPTcBAYMSLce9QZJ
         GiqV354ZjxzDiYWaLiLMhMT24CaSQPQoAQhNLo4zQs6tv0RFyB2133MdVRr/9pyt9TfV
         vRzBQvbRa4X5WyfvpTCD1RGaTNsLzdPV2ReV3Zj216669q6H6xUhpViKeb2yJONDW0Qa
         ACnTBjoToq7R2paNow+bISXGuvW47iS1cSOsuDwmGnzsLSv/JWPXUztaEW1YBQlfeNdI
         N6Vg==
X-Gm-Message-State: AFq9FYLrL3Tc5Ed5SmKo8w+6rzMpxiKAbbI7DSXxCsldD4lDEebGI4RC
	s2qJhGSLvk/m+BC2JOf+xfhbvbpV9coHiIaGghHKzeQl088GaztXfLnW/+IWtLWNjJLRwjd+/Pb
	O51sr
X-Gm-Gg: AYBFou0/3vIaVtjkkLzM27URN6QdAhEswnY8gYVlq84JmM2Kt8treZBKns9cxi5szHB
	22CXcPgu4an6pHTlO0HQ/WSQy/0RJ7XqEb0l8Iw7wDZyLVwSx8WKgKsGx1QAr5TW3er69Bu2pWB
	n5hRzEf/2Rr48fH2O7bTBtVfeTBrLnWKRMCH5cMUKEe+lE/MG3T+6IDZDJcIWnJg1LfiNTO8pSo
	IQUWZ500Ele9va5yETJCZ92De8LB9+ZQWfhfmBjbgM9EPr9b42qcoGrdTLXxmCL86wUntyDKAaR
	uHgmsJD21lZKkG/9BdFrcYeF10PBy1F+CH0GiLXwUrDPqbtlLh0bilmjhmKZhdXjkZFOledPgLJ
	JHuEehJ9GQb6ek8PvsrQpsJQACbfphrubcEB/QOFxZtpkw9dhvbycgYBFYMUfFAaO7PZas8ee5R
	D30pmt4YpDgavm5lPfOgEZpEdKXF2ghaaa6uJVbFOWTkjjDRQRAixLt+hH1xwlbsApNBfwvlvcX
	nZmf3U1xg==
X-Received: by 2002:a17:907:9801:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c31a9fcedffmr1984085566b.13.1792075926438;
        Thu, 15 Oct 2026 07:52:06 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda433582sm137880866b.64.2026.10.15.07.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:52:06 -0700 (PDT)
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
	peter.fang@intel.com
Subject: [PATCH RFC 16/20] attestation: Prepare measurement register journal
Date: Thu, 15 Oct 2026 16:50:49 +0200
Message-ID: <20261015145053.3664509-17-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015145053.3664509-1-jiri@resnulli.us>
References: <20261015145053.3664509-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Add static MR state, append-only INFO and EXTEND records, and journal
notifications.

The journal objects can be compile-checked here. CONFIG_ATTESTATION remains
unwired until the CTLV operation handlers complete the module.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 Documentation/driver-api/attestation.rst |   8 +
 drivers/attestation/Makefile             |   2 +-
 drivers/attestation/core/core.c          |  76 ++++-
 drivers/attestation/core/events.c        |  65 ++++
 drivers/attestation/core/internal.h      |  79 ++++-
 drivers/attestation/core/mr.c            | 376 +++++++++++++++++++++++
 6 files changed, 600 insertions(+), 6 deletions(-)
 create mode 100644 drivers/attestation/core/events.c
 create mode 100644 drivers/attestation/core/mr.c

diff --git a/Documentation/driver-api/attestation.rst b/Documentation/driver-api/attestation.rst
index 6d0cf9095c66..3cddd853aaa0 100644
--- a/Documentation/driver-api/attestation.rst
+++ b/Documentation/driver-api/attestation.rst
@@ -27,6 +27,14 @@ callback, journal commit and event emission with one instance mutex.
 Fixed MRs are listed in the provider descriptor.  Their property storage
 remains valid until ``ctlv_destroy()`` or failed-creation unwind completes.
 
+MR journal
+==========
+
+MR extension is transactional.  The core allocates the complete journal entry
+and event before invoking ``mr_extend``.  A successful callback is followed
+only by infallible publication, so userspace observes the same ordered
+journal.
+
 Teardown
 ========
 
diff --git a/drivers/attestation/Makefile b/drivers/attestation/Makefile
index 8a75558a7013..e7c9cb2dfec0 100644
--- a/drivers/attestation/Makefile
+++ b/drivers/attestation/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ATTESTATION) += attestation.o
 
-attestation-y := core/core.o
+attestation-y := core/core.o core/events.o core/mr.o
diff --git a/drivers/attestation/core/core.c b/drivers/attestation/core/core.c
index e112d3a0ff2b..6db8ed093e93 100644
--- a/drivers/attestation/core/core.c
+++ b/drivers/attestation/core/core.c
@@ -157,6 +157,13 @@ bool attestation_registered(struct attestation *att)
 	return registered;
 }
 
+void attestation_mr_changed(struct attestation *att)
+{
+	lockdep_assert_held(&att->lock);
+	att->log->generation++;
+	att->mr_read_generation++;
+}
+
 void attestation_stop(struct attestation *att)
 {
 	lockdep_assert_held(&att->lock);
@@ -165,6 +172,38 @@ void attestation_stop(struct attestation *att)
 	xa_unlock(&attestation_instances);
 }
 
+static struct attestation_mr *attestation_mr_alloc(struct attestation *att,
+						   const struct attestation_mr_props *props)
+{
+	struct attestation_mr *mr;
+	int ret;
+
+	ret = attestation_mr_props_validate(att->provider, props);
+	if (ret)
+		return ERR_PTR(ret);
+	if (xa_load(&att->mrs, props->id))
+		return ERR_PTR(-EEXIST);
+	mr = kzalloc_obj(*mr, GFP_KERNEL);
+	if (!mr)
+		return ERR_PTR(-ENOMEM);
+	mr->props = props;
+	ret = xa_insert(&att->mrs, props->id, mr, GFP_KERNEL);
+	if (ret) {
+		kfree(mr);
+		return ERR_PTR(ret);
+	}
+	return mr;
+}
+
+struct attestation_mr *attestation_mr_lookup_live(struct attestation *att, unsigned int mr_id)
+{
+	struct attestation_mr *mr;
+
+	lockdep_assert_held(&att->lock);
+	mr = xa_load(&att->mrs, mr_id);
+	return mr ? mr : ERR_PTR(-ENOENT);
+}
+
 void attestation_provide_ops(struct attestation *att)
 {
 	const struct attestation_provider *provider = att->provider;
@@ -174,37 +213,66 @@ void attestation_provide_ops(struct attestation *att)
 		ctlv_attestation_evidence_get_provide(ctlvdev);
 		ctlv_attestation_evidence_get_enable(ctlvdev);
 	}
+	if (provider->mrs_count) {
+		ctlv_attestation_mr_get_provide(ctlvdev);
+		ctlv_attestation_mr_dump_provide(ctlvdev);
+		ctlv_attestation_mr_log_get_provide(ctlvdev);
+		if (provider->mr_read)
+			ctlv_attestation_mr_read_provide(ctlvdev);
+		if (provider->mr_extend)
+			ctlv_attestation_mr_extend_provide(ctlvdev);
+	}
 }
 
 int attestation_core_init(struct attestation *att, struct ctlv_device *ctlvdev,
 			  const struct attestation_provider *provider)
 {
+	size_t index;
 	int ret;
 
 	ret = attestation_provider_validate(provider);
 	if (ret)
 		return ret;
 	mutex_init(&att->lock);
+	xa_init(&att->mrs);
 	att->ctlvdev = ctlvdev;
 	att->provider = provider;
+	for (index = 0; index < provider->mrs_count; index++) {
+		struct attestation_mr *mr;
+
+		mr = attestation_mr_alloc(att, &provider->mrs[index]);
+		if (IS_ERR(mr)) {
+			ret = PTR_ERR(mr);
+			goto err_mrs;
+		}
+	}
 	ret = attestation_registry_insert(att);
 	if (ret)
-		goto err_core;
+		goto err_mrs;
 	attestation_provide_ops(att);
 	att->initialized = true;
 	return 0;
 
-err_core:
+err_mrs:
 	attestation_core_fini(att);
 	return ret;
 }
 
 void attestation_core_fini(struct attestation *att)
 {
+	struct attestation_mr *mr;
+	unsigned long index;
+
 	if (!att->ctlvdev)
 		return;
 	if (att->initialized)
 		attestation_registry_remove(att);
+	xa_for_each(&att->mrs, index, mr) {
+		xa_erase(&att->mrs, index);
+		kfree(mr);
+	}
+	attestation_mr_log_free(att->log);
+	xa_destroy(&att->mrs);
 	mutex_destroy(&att->lock);
 	att->ctlvdev = NULL;
 }
@@ -222,7 +290,11 @@ int ctlv_attestation_init(struct ctlv_device *ctlvdev, const void *init_info, vo
 int ctlv_attestation_post_init(struct ctlv_device *ctlvdev, void *priv)
 {
 	struct attestation *att = priv;
+	int ret;
 
+	ret = attestation_mr_log_init(att);
+	if (ret)
+		return ret;
 	xa_lock(&attestation_instances);
 	__xa_set_mark(&attestation_instances, att->index, ATTESTATION_REGISTERED);
 	xa_unlock(&attestation_instances);
diff --git a/drivers/attestation/core/events.c b/drivers/attestation/core/events.c
new file mode 100644
index 000000000000..2cf8df4b6479
--- /dev/null
+++ b/drivers/attestation/core/events.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/err.h>
+
+#include "internal.h"
+
+int attestation_events_prepare(struct attestation *att, struct attestation_event_batch *events)
+{
+	struct attestation_event *event = &events->mr_log;
+
+	lockdep_assert_held(&att->lock);
+	event->ctx = ctlv_attestation_mr_log_entry_appended_create(att->ctlvdev, &event->reply,
+								   GFP_KERNEL);
+	if (IS_ERR(event->ctx)) {
+		int ret = PTR_ERR(event->ctx);
+
+		event->ctx = NULL;
+		event->reply = NULL;
+		return ret;
+	}
+	return 0;
+}
+
+void attestation_events_abort(struct attestation_event_batch *events)
+{
+	struct attestation_event *event = &events->mr_log;
+
+	if (!event->ctx)
+		return;
+	ctlv_event_abort(event->ctx);
+	event->ctx = NULL;
+	event->reply = NULL;
+}
+
+static void attestation_event_finish(struct attestation_event *event, int ret)
+{
+	if (ret) {
+		pr_err("attestation event encoding failed: %d\n", ret);
+		ctlv_event_abort(event->ctx);
+	} else {
+		ret = ctlv_event_emit(event->ctx);
+		if (ret)
+			pr_err("attestation event emission failed: %d\n", ret);
+	}
+	event->ctx = NULL;
+	event->reply = NULL;
+}
+
+void attestation_mr_log_event_emit(struct attestation_event_batch *events,
+				   const struct attestation_mr_log_entry *entry)
+{
+	struct attestation_event *event = &events->mr_log;
+	struct ctlv_cursor nested;
+	int ret;
+
+	if (!event->ctx)
+		return;
+	if (!ctlv_attestation_notification_entry_start(event->reply, &nested)) {
+		ret = -EMSGSIZE;
+		goto out;
+	}
+	ret = attestation_mr_log_entry_encode(&nested, entry);
+	ctlv_nest_end(&nested);
+out:
+	attestation_event_finish(event, ret);
+}
diff --git a/drivers/attestation/core/internal.h b/drivers/attestation/core/internal.h
index 767c02275d0f..64dca12a3d04 100644
--- a/drivers/attestation/core/internal.h
+++ b/drivers/attestation/core/internal.h
@@ -11,25 +11,98 @@
 
 #define ATTESTATION_REGISTERED XA_MARK_1
 
+enum attestation_mr_log_entry_type {
+	ATTESTATION_MR_LOG_ENTRY_INFO,
+	ATTESTATION_MR_LOG_ENTRY_EXTEND,
+};
+
+struct attestation_mr_log_entry {
+	unsigned int mr_generation;
+	unsigned int mr_id;
+	enum attestation_mr_log_entry_type type;
+};
+
+struct attestation_mr_log_entry_info {
+	struct attestation_mr_log_entry entry;
+	struct attestation_mr_props props;
+};
+
+struct attestation_mr_log_entry_extend {
+	struct attestation_mr_log_entry entry;
+	struct attestation_digest_set values;
+};
+
+struct attestation_mr_log {
+	unsigned int generation;
+	struct xarray entries;
+};
+
 struct attestation {
 	struct ctlv_device *ctlvdev;
 	const struct attestation_provider *provider;
 	unsigned int index;
 
-	/* Mutable instance state. */
+	/* Mutable instance, MR, and journal state. */
 	struct mutex lock;
+	unsigned int mr_read_generation;
 
+	struct xarray mrs;
+	struct attestation_mr_log *log;
 	bool initialized;
 };
 
-int attestation_core_init(struct attestation *att,
-			  struct ctlv_device *ctlvdev,
+struct attestation_mr {
+	const struct attestation_mr_props *props;
+};
+
+struct attestation_event {
+	struct ctlv_op_ctx *ctx;
+	struct ctlv_cursor *reply;
+};
+
+struct attestation_event_batch {
+	struct attestation_event mr_log;
+};
+
+struct attestation_mr_change {
+	struct attestation_mr *mr;
+	struct attestation_mr_log_entry_extend *entry;
+	struct attestation_event_batch events;
+};
+
+int attestation_core_init(struct attestation *att, struct ctlv_device *ctlvdev,
 			  const struct attestation_provider *provider);
 void attestation_core_fini(struct attestation *att);
 bool attestation_registered(struct attestation *att);
 void attestation_stop(struct attestation *att);
+void attestation_mr_changed(struct attestation *att);
 
 int attestation_provider_validate(const struct attestation_provider *provider);
 void attestation_provide_ops(struct attestation *att);
 
+struct attestation_mr *attestation_mr_lookup_live(struct attestation *att, unsigned int mr_id);
+int attestation_mr_values_validate(const struct attestation_mr *mr,
+				   const struct attestation_digest_set *values);
+int attestation_mr_log_init(struct attestation *att);
+struct attestation_mr_log_entry_info *attestation_mr_info_alloc(const struct attestation_mr *mr);
+void attestation_mr_log_entry_free(struct attestation_mr_log_entry *entry);
+void attestation_mr_log_free(struct attestation_mr_log *log);
+void attestation_mr_log_append(struct attestation *att, struct attestation_mr_log_entry *entry);
+struct attestation_mr_change *
+attestation_mr_change_prepare(struct attestation *att, struct attestation_mr *mr,
+			      const struct attestation_digest_set *values);
+const struct attestation_mr_log_entry *
+attestation_mr_extend_locked(struct attestation *att, struct attestation_mr_change *change);
+void attestation_mr_change_free(struct attestation_mr_change *change);
+
+int attestation_events_prepare(struct attestation *att, struct attestation_event_batch *events);
+void attestation_events_abort(struct attestation_event_batch *events);
+void attestation_mr_log_event_emit(struct attestation_event_batch *events,
+				   const struct attestation_mr_log_entry *entry);
+
+int attestation_mr_log_entry_encode(struct ctlv_cursor *reply,
+				    const struct attestation_mr_log_entry *entry);
+int attestation_mr_props_encode(struct ctlv_cursor *reply, const struct attestation_mr *mr,
+				bool include_id);
+
 #endif /* _ATTESTATION_INTERNAL_H */
diff --git a/drivers/attestation/core/mr.c b/drivers/attestation/core/mr.c
new file mode 100644
index 000000000000..db80cbd2b582
--- /dev/null
+++ b/drivers/attestation/core/mr.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <crypto/hash_info.h>
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "internal.h"
+
+int attestation_mr_values_validate(const struct attestation_mr *mr,
+				   const struct attestation_digest_set *values)
+{
+	size_t index;
+
+	if (!values || !values->values || values->values_count != mr->props->algorithms_count)
+		return -EINVAL;
+	for (index = 0; index < values->values_count; index++)
+		if (values->values[index].algorithm != mr->props->algorithms[index])
+			return -EINVAL;
+	return 0;
+}
+
+static int attestation_digest_set_copy(struct attestation_digest_set *dst,
+				       const struct attestation_digest_set *src)
+{
+	size_t index;
+
+	if (!src || !src->values || !src->values_count)
+		return -EINVAL;
+	for (index = 0; index < src->values_count; index++) {
+		enum hash_algo algorithm = src->values[index].algorithm;
+
+		if (algorithm >= HASH_ALGO__LAST || !hash_digest_size[algorithm] ||
+		    (index && src->values[index - 1].algorithm >= algorithm))
+			return -EINVAL;
+	}
+	dst->values =
+		kmemdup_array(src->values, src->values_count, sizeof(*src->values), GFP_KERNEL);
+	if (!dst->values)
+		return -ENOMEM;
+	dst->values_count = src->values_count;
+	return 0;
+}
+
+static void attestation_digest_set_free(struct attestation_digest_set *set)
+{
+	kfree(set->values);
+	set->values = NULL;
+	set->values_count = 0;
+}
+
+struct attestation_mr_log_entry_info *attestation_mr_info_alloc(const struct attestation_mr *mr)
+{
+	struct attestation_mr_log_entry_info *info;
+	enum hash_algo *algorithms;
+	char *name;
+
+	info = kzalloc_obj(*info, GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+	name = kstrdup(mr->props->name, GFP_KERNEL);
+	if (!name)
+		goto err_info;
+	algorithms = kmemdup_array(mr->props->algorithms, mr->props->algorithms_count,
+				   sizeof(*algorithms), GFP_KERNEL);
+	if (!algorithms)
+		goto err_name;
+	info->entry.type = ATTESTATION_MR_LOG_ENTRY_INFO;
+	info->entry.mr_id = mr->props->id;
+	info->props = *mr->props;
+	info->props.name = name;
+	info->props.algorithms = algorithms;
+	return info;
+
+err_name:
+	kfree(name);
+err_info:
+	kfree(info);
+	return ERR_PTR(-ENOMEM);
+}
+
+void attestation_mr_log_entry_free(struct attestation_mr_log_entry *entry)
+{
+	if (!entry)
+		return;
+	switch (entry->type) {
+	case ATTESTATION_MR_LOG_ENTRY_INFO: {
+		struct attestation_mr_log_entry_info *info =
+			container_of(entry, typeof(*info), entry);
+
+		kfree(info->props.algorithms);
+		kfree(info->props.name);
+		kfree(info);
+		break;
+	}
+	case ATTESTATION_MR_LOG_ENTRY_EXTEND: {
+		struct attestation_mr_log_entry_extend *extend =
+			container_of(entry, typeof(*extend), entry);
+
+		attestation_digest_set_free(&extend->values);
+		kfree(extend);
+		break;
+	}
+	}
+}
+
+void attestation_mr_log_free(struct attestation_mr_log *log)
+{
+	struct attestation_mr_log_entry *entry;
+	unsigned long index;
+
+	if (!log)
+		return;
+	xa_for_each(&log->entries, index, entry) {
+		xa_erase(&log->entries, index);
+		attestation_mr_log_entry_free(entry);
+	}
+	xa_destroy(&log->entries);
+	kfree(log);
+}
+
+void attestation_mr_log_append(struct attestation *att, struct attestation_mr_log_entry *entry)
+{
+	struct attestation_mr_log *log = att->log;
+
+	xa_store(&log->entries, entry->mr_generation, entry, GFP_NOWAIT);
+}
+
+int attestation_mr_log_init(struct attestation *att)
+{
+	struct attestation_mr_log_entry_info **infos;
+	struct attestation_mr_log *log;
+	struct attestation_mr *mr;
+	unsigned long mr_id;
+	size_t count = 0;
+	size_t index = 0;
+	int ret = -ENOMEM;
+
+	xa_for_each(&att->mrs, mr_id, mr)
+		count++;
+	log = kzalloc_obj(*log, GFP_KERNEL);
+	if (!log)
+		return -ENOMEM;
+	xa_init(&log->entries);
+	infos = kcalloc(count, sizeof(*infos), GFP_KERNEL);
+	if (count && !infos)
+		goto err_log;
+	xa_for_each(&att->mrs, mr_id, mr) {
+		infos[index] = attestation_mr_info_alloc(mr);
+		if (IS_ERR(infos[index])) {
+			ret = PTR_ERR(infos[index]);
+			infos[index] = NULL;
+			goto err_infos;
+		}
+		index++;
+	}
+
+	att->log = log;
+	index = 0;
+	xa_for_each(&att->mrs, mr_id, mr) {
+		struct attestation_mr_log_entry *entry = &infos[index]->entry;
+
+		if (log->generation == UINT_MAX) {
+			ret = -EOVERFLOW;
+			goto err_attached;
+		}
+		entry->mr_generation = ++log->generation;
+		ret = xa_insert(&log->entries, entry->mr_generation, entry, GFP_KERNEL);
+		if (ret)
+			goto err_attached;
+		infos[index++] = NULL;
+	}
+	kfree(infos);
+	return 0;
+
+err_attached:
+	att->log = NULL;
+	attestation_mr_log_free(log);
+	log = NULL;
+err_infos:
+	for (index = 0; index < count; index++)
+		if (infos[index])
+			attestation_mr_log_entry_free(&infos[index]->entry);
+	kfree(infos);
+err_log:
+	attestation_mr_log_free(log);
+	return ret;
+}
+
+static struct attestation_mr_log_entry_extend *
+attestation_extend_alloc(enum attestation_mr_log_entry_type type, size_t size,
+			 struct attestation_mr *mr, const struct attestation_digest_set *values)
+{
+	struct attestation_mr_log_entry_extend *extend;
+	int ret;
+
+	extend = kzalloc(size, GFP_KERNEL);
+	if (!extend)
+		return ERR_PTR(-ENOMEM);
+	extend->entry.type = type;
+	extend->entry.mr_id = mr->props->id;
+	ret = attestation_digest_set_copy(&extend->values, values);
+	if (ret) {
+		kfree(extend);
+		return ERR_PTR(ret);
+	}
+	return extend;
+}
+
+struct attestation_mr_change *
+attestation_mr_change_prepare(struct attestation *att, struct attestation_mr *mr,
+			      const struct attestation_digest_set *values)
+{
+	struct attestation_mr_change *change;
+	int ret;
+
+	lockdep_assert_held(&att->lock);
+	change = kzalloc_obj(*change, GFP_KERNEL);
+	if (!change)
+		return ERR_PTR(-ENOMEM);
+	change->mr = mr;
+	change->entry = attestation_extend_alloc(ATTESTATION_MR_LOG_ENTRY_EXTEND,
+						 sizeof(*change->entry), mr, values);
+	if (IS_ERR(change->entry)) {
+		ret = PTR_ERR(change->entry);
+		goto err_change;
+	}
+	ret = attestation_events_prepare(att, &change->events);
+	if (ret)
+		goto err_entry;
+	return change;
+
+err_entry:
+	attestation_mr_log_entry_free(&change->entry->entry);
+err_change:
+	kfree(change);
+	return ERR_PTR(ret);
+}
+
+const struct attestation_mr_log_entry *
+attestation_mr_extend_locked(struct attestation *att, struct attestation_mr_change *change)
+{
+	struct attestation_mr_log_entry_extend *extend = change->entry;
+	struct attestation_mr_log_entry *entry = &extend->entry;
+	int ret;
+
+	lockdep_assert_held(&att->lock);
+	if (att->log->generation == UINT_MAX) {
+		attestation_stop(att);
+		return ERR_PTR(-EOVERFLOW);
+	}
+	entry->mr_generation = att->log->generation + 1;
+	ret = xa_reserve(&att->log->entries, entry->mr_generation, GFP_KERNEL);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = att->provider->mr_extend(att, change->mr->props->id, &extend->values);
+	if (ret) {
+		xa_release(&att->log->entries, entry->mr_generation);
+		return ERR_PTR(ret);
+	}
+	attestation_mr_changed(att);
+	attestation_mr_log_append(att, entry);
+	attestation_mr_log_event_emit(&change->events, entry);
+	change->entry = NULL;
+	return entry;
+}
+
+void attestation_mr_change_free(struct attestation_mr_change *change)
+{
+	if (!change)
+		return;
+	attestation_events_abort(&change->events);
+	if (change->entry)
+		attestation_mr_log_entry_free(&change->entry->entry);
+	kfree(change);
+}
+
+int attestation_mr_props_encode(struct ctlv_cursor *reply, const struct attestation_mr *mr,
+				bool include_id)
+{
+	u64 caps = 0;
+	size_t index;
+	bool ok = true;
+
+	if (include_id)
+		ok &= ctlv_attestation_mr_id_put(reply, mr->props->id);
+	ok &= ctlv_attestation_mr_name_put(reply, mr->props->name);
+	for (index = 0; index < mr->props->algorithms_count; index++)
+		ok &= ctlv_attestation_mr_supported_hash_algo_put(reply,
+								  mr->props->algorithms[index]);
+	if (mr->props->has_register_index)
+		ok &= ctlv_attestation_mr_register_index_put(reply, mr->props->register_index);
+	if (mr->props->readable)
+		caps |= CTLV_ATTESTATION_MR_CAPS_READ;
+	if (mr->props->extendable)
+		caps |= CTLV_ATTESTATION_MR_CAPS_EXTEND;
+	ok &= ctlv_attestation_mr_caps_put(reply, caps);
+	return ok ? 0 : -EMSGSIZE;
+}
+
+static int attestation_values_encode(struct ctlv_cursor *reply,
+				     const struct attestation_digest_set *values)
+{
+	struct ctlv_cursor nested;
+	size_t index;
+	bool ok = true;
+
+	for (index = 0; index < values->values_count; index++) {
+		const struct attestation_digest *value = &values->values[index];
+
+		if (!ctlv_attestation_mr_value_start(reply, &nested))
+			return -EMSGSIZE;
+		ok &= ctlv_attestation_mr_hash_algo_put(&nested, value->algorithm);
+		ok &= ctlv_attestation_mr_data_put(&nested, value->data,
+						   hash_digest_size[value->algorithm]);
+		ctlv_nest_end(&nested);
+	}
+	return ok ? 0 : -EMSGSIZE;
+}
+
+static int attestation_mr_info_encode(struct ctlv_cursor *reply,
+				      const struct attestation_mr_props *props)
+{
+	u64 caps = 0;
+	size_t index;
+	bool ok;
+
+	ok = ctlv_attestation_mr_name_put(reply, props->name);
+	for (index = 0; index < props->algorithms_count; index++)
+		ok &= ctlv_attestation_mr_supported_hash_algo_put(reply,
+								  props->algorithms[index]);
+	if (props->has_register_index)
+		ok &= ctlv_attestation_mr_register_index_put(reply, props->register_index);
+	if (props->readable)
+		caps |= CTLV_ATTESTATION_MR_CAPS_READ;
+	if (props->extendable)
+		caps |= CTLV_ATTESTATION_MR_CAPS_EXTEND;
+	ok &= ctlv_attestation_mr_caps_put(reply, caps);
+	return ok ? 0 : -EMSGSIZE;
+}
+
+int attestation_mr_log_entry_encode(struct ctlv_cursor *reply,
+				    const struct attestation_mr_log_entry *entry)
+{
+	struct ctlv_cursor nested;
+	bool ok;
+	int ret;
+
+	ok = ctlv_attestation_mr_generation_put(reply, entry->mr_generation);
+	ok &= ctlv_attestation_mr_id_put(reply, entry->mr_id);
+	ok &= ctlv_attestation_log_event_put(reply, entry->type == ATTESTATION_MR_LOG_ENTRY_INFO ?
+							    CTLV_ATTESTATION_MR_LOG_EVENT_INFO :
+							    CTLV_ATTESTATION_MR_LOG_EVENT_EXTEND);
+	if (!ok)
+		return -EMSGSIZE;
+
+	if (entry->type == ATTESTATION_MR_LOG_ENTRY_INFO) {
+		const struct attestation_mr_log_entry_info *info =
+			container_of(entry, typeof(*info), entry);
+
+		if (!ctlv_attestation_log_mr_start(reply, &nested))
+			return -EMSGSIZE;
+		ret = attestation_mr_info_encode(&nested, &info->props);
+		ctlv_nest_end(&nested);
+		return ret;
+	}
+
+	ret = attestation_values_encode(reply,
+					&container_of(entry,
+						      const struct attestation_mr_log_entry_extend,
+						      entry)
+						 ->values);
+	if (ret)
+		return ret;
+	return 0;
+}
-- 
2.56.0

