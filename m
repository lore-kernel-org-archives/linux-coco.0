Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474C32C1B0
	for <linux-coco@lists.linux.dev>; Sun, 14 Jan 2024 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="snu48XNA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3368b9bbeb4so7523972f8f.2
        for <linux-coco@lists.linux.dev>; Sun, 14 Jan 2024 14:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705271826; x=1705876626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ygW96R3bKlZNzEyZDoQ1g52ofKNAtoK5Eb0X+uvffE=;
        b=snu48XNAbN0JPUx9NcvDbPi2sM/yePP9OopcfrttRV1Jo5enB7CoY6DD5UJajSN5bc
         KTpM0X5LYPsuSAsbcaTafDrDFQ8B5PD1MRrqq2H92ZrMYtVMQfcgJhqDp0bH2qHNXLzt
         WO6bOFTbJMGrg5uVh5fxxvwERTZXMBxJaZTJaW50vWExLfOQ6F6NWnh7myTOi+W1EuzD
         Yp5p2UjDcdiGjpCOz6PaMgD7Uaoh69tpsJbdBther8WYb1VXr4xB8jfBbrByCNAtI68m
         aIocO9ghjkzp4ANfwEN+rjqhpVvCPc5nGRsomcRw9jDm3BWpodwWUWaOb0SqMxEI2er6
         XUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705271826; x=1705876626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ygW96R3bKlZNzEyZDoQ1g52ofKNAtoK5Eb0X+uvffE=;
        b=Taerb3E+O+a5y6VlnaZITrR74P3rEQ8Jpj0/MiRIEqL8v5ikBmnZ1ZKq1HQz1bV8C/
         yh+8FHV6JbShgLEhHczGJY4ej6gy1xSXzMAM3YBAaTKwuWcUFA3VbEKiEyIPw37ij25l
         tFHDsQPhEviOFZUee3Q8EtSVMMFu0LIxc/kHMZjLVmbjDI9Y9FJa8dMxrUQNbgWLzQPu
         Jgr+fraZkC1bnv0P3JT2y78cQPqeP4e22cQI/yZrFhhjze4ABlMuopWsJFCAM9xMXoRw
         Af0tc5yy2q/jFN27IKxYBATo2nFPTEI7D0TxNmFcvYMZNEwPc9tao9+h2zfwC16l9LUZ
         /TQQ==
X-Gm-Message-State: AOJu0Yw/HlTYhucmRN4yaxVBmYAR/EhUAUE5g+S9un9DBx4Crum6f0hy
	VhBTfJeqp7GUrKWNkIxM75eoKoXDdZz1fA==
X-Google-Smtp-Source: AGHT+IE0oyL57ccbGPEhVs5ZshLtT+WGinpXpMefY5nz2k2cFzEj90TP49y5wTJWdT274NqByTgTjg==
X-Received: by 2002:adf:e712:0:b0:337:eec:62e3 with SMTP id c18-20020adfe712000000b003370eec62e3mr1281529wrm.17.1705271826443;
        Sun, 14 Jan 2024 14:37:06 -0800 (PST)
Received: from vermeer.ba.rivosinc.com (lfbn-mon-1-1176-165.w90-113.abo.wanadoo.fr. [90.113.119.165])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0033719111458sm10158693wrt.36.2024.01.14.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:37:05 -0800 (PST)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 2/4] tsm: Add RTMRs to the configfs-tsm hierarchy
Date: Sun, 14 Jan 2024 23:35:28 +0100
Message-ID: <20240114223532.290550-3-sameo@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240114223532.290550-1-sameo@rivosinc.com>
References: <20240114223532.290550-1-sameo@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTMRs are defined and managed by their corresponding TSM provider. As
such, they can be configured through the TSM configfs root.

An additional `rtmrs` directory is added by default under the `tsm` one,
where each supported RTMR can be configured:

mkdir /sys/kernel/config/tsm/rtmrs/rtmr0
echo 0 > /sys/kernel/config/tsm/rtmrs/rtmr0/index

An RTMR can not be extended nor read before its configured by assigning
it an index. It is the TSM backend responsibility and choice to map that
index to a hardware RTMR.

Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 drivers/virt/coco/tsm.c | 164 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
index 6b71650271fe..15b67d99fd54 100644
--- a/drivers/virt/coco/tsm.c
+++ b/drivers/virt/coco/tsm.c
@@ -419,6 +419,108 @@ static const struct config_item_type tsm_reports_type = {
 	.ct_group_ops = &tsm_report_group_ops,
 };
 
+static ssize_t tsm_rtmr_index_store(struct config_item *cfg,
+				    const char *buf, size_t len)
+{
+	struct tsm_rtmr_state *rtmr_state = to_tsm_rtmr_state(cfg);
+	const struct tsm_ops *ops;
+	unsigned int val;
+	int rc;
+
+	rc = kstrtouint(buf, 0, &val);
+	if (rc)
+		return rc;
+
+	guard(rwsem_write)(&tsm_rwsem);
+
+	/* Index can only be configured once */
+	if (is_rtmr_configured(rtmr_state))
+		return -EBUSY;
+
+	/* Check that index stays within the TSM provided capabilities */
+	ops = provider.ops;
+	if (!ops)
+		return -ENOTTY;
+
+	if (val > ops->capabilities.num_rtmrs - 1)
+		return -EINVAL;
+
+	/* Check that this index is available */
+	if (tsm_rtmrs->rtmrs[val])
+		return -EINVAL;
+
+	rtmr_state->index = val;
+	rtmr_state->alg = ops->capabilities.rtmr_hash_alg;
+
+	tsm_rtmrs->rtmrs[val] = rtmr_state;
+
+	return len;
+}
+
+static ssize_t tsm_rtmr_index_show(struct config_item *cfg,
+				   char *buf)
+{
+	struct tsm_rtmr_state *rtmr_state = to_tsm_rtmr_state(cfg);
+
+	guard(rwsem_read)(&tsm_rwsem);
+
+	/* An RTMR is not available if it has not been configured */
+	if (!is_rtmr_configured(rtmr_state))
+		return -ENXIO;
+
+	return sysfs_emit(buf, "%u\n", rtmr_state->index);
+}
+CONFIGFS_ATTR(tsm_rtmr_, index);
+
+static struct configfs_attribute *tsm_rtmr_attrs[] = {
+	&tsm_rtmr_attr_index,
+	NULL,
+};
+
+static void tsm_rtmr_item_release(struct config_item *cfg)
+{
+	struct tsm_rtmr_state *state = to_tsm_rtmr_state(cfg);
+
+	kfree(state);
+}
+
+static struct configfs_item_operations tsm_rtmr_item_ops = {
+	.release = tsm_rtmr_item_release,
+};
+
+const struct config_item_type tsm_rtmr_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_attrs = tsm_rtmr_attrs,
+	.ct_item_ops = &tsm_rtmr_item_ops,
+};
+
+static struct config_item *tsm_rtmrs_make_item(struct config_group *group,
+					       const char *name)
+{
+	struct tsm_rtmr_state *state;
+
+	guard(rwsem_read)(&tsm_rwsem);
+	if (!(provider.ops && (provider.ops->capabilities.num_rtmrs > 0)))
+		return ERR_PTR(-ENXIO);
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+	state->index = U32_MAX;
+
+	config_item_init_type_name(&state->cfg, name, &tsm_rtmr_type);
+	return &state->cfg;
+}
+
+static struct configfs_group_operations tsm_rtmrs_group_ops = {
+	.make_item = tsm_rtmrs_make_item,
+};
+
+static const struct config_item_type tsm_rtmrs_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_group_ops = &tsm_rtmrs_group_ops,
+};
+
 static const struct config_item_type tsm_root_group_type = {
 	.ct_owner = THIS_MODULE,
 };
@@ -433,10 +535,48 @@ static struct configfs_subsystem tsm_configfs = {
 	.su_mutex = __MUTEX_INITIALIZER(tsm_configfs.su_mutex),
 };
 
+static int tsm_rtmr_register(const struct tsm_ops *ops)
+{
+	struct config_group *rtmrs_group;
+
+	lockdep_assert_held_write(&tsm_rwsem);
+
+	if (!ops || !ops->capabilities.num_rtmrs)
+		return 0;
+
+	if (ops->capabilities.num_rtmrs > TSM_MAX_RTMR)
+		return -EINVAL;
+
+	tsm_rtmrs = kzalloc(sizeof(struct tsm_rtmrs_state), GFP_KERNEL);
+	if (!tsm_rtmrs)
+		return -ENOMEM;
+
+	tsm_rtmrs->rtmrs = kcalloc(ops->capabilities.num_rtmrs,
+				   sizeof(struct tsm_rtmr_state *),
+				   GFP_KERNEL);
+	if (!tsm_rtmrs->rtmrs) {
+		kfree(tsm_rtmrs);
+		return -ENOMEM;
+	}
+
+	rtmrs_group = configfs_register_default_group(&tsm_configfs.su_group, "rtmrs",
+						      &tsm_rtmrs_type);
+	if (IS_ERR(rtmrs_group)) {
+		kfree(tsm_rtmrs->rtmrs);
+		kfree(tsm_rtmrs);
+		return PTR_ERR(rtmrs_group);
+	}
+
+	tsm_rtmrs->group = rtmrs_group;
+
+	return 0;
+}
+
 int tsm_register(const struct tsm_ops *ops, void *priv,
 		 const struct config_item_type *type)
 {
 	const struct tsm_ops *conflict;
+	int rc;
 
 	if (!type)
 		type = &tsm_report_default_type;
@@ -450,6 +590,10 @@ int tsm_register(const struct tsm_ops *ops, void *priv,
 		return -EBUSY;
 	}
 
+	rc = tsm_rtmr_register(ops);
+	if (rc < 0)
+		return rc;
+
 	provider.ops = ops;
 	provider.data = priv;
 	provider.type = type;
@@ -457,11 +601,31 @@ int tsm_register(const struct tsm_ops *ops, void *priv,
 }
 EXPORT_SYMBOL_GPL(tsm_register);
 
+static int tsm_rtmr_unregister(const struct tsm_ops *ops)
+{
+	lockdep_assert_held_write(&tsm_rwsem);
+
+	if ((ops) && (ops->capabilities.num_rtmrs > 0)) {
+		configfs_unregister_default_group(tsm_rtmrs->group);
+		kfree(tsm_rtmrs->rtmrs);
+		kfree(tsm_rtmrs);
+	}
+
+	return 0;
+}
+
 int tsm_unregister(const struct tsm_ops *ops)
 {
+	int rc;
+
 	guard(rwsem_write)(&tsm_rwsem);
 	if (ops != provider.ops)
 		return -EBUSY;
+
+	rc = tsm_rtmr_unregister(ops);
+	if (rc < 0)
+		return rc;
+
 	provider.ops = NULL;
 	provider.data = NULL;
 	provider.type = NULL;
-- 
2.42.0

