Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD4F2C699
	for <linux-coco@lists.linux.dev>; Sun, 14 Jan 2024 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="v43e4HIT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-336755f1688so7177662f8f.0
        for <linux-coco@lists.linux.dev>; Sun, 14 Jan 2024 14:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705271828; x=1705876628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DErvdxXifc4ZYsfHy2kccc+/fn6lt3VcVEp4cbBEhRg=;
        b=v43e4HITzbJrR49OGP1TRqOnxr9oW5vkEUG+fNNScqqdGoPzpWYo/60QEcE9tMZr/c
         ixVuV23cXOSvGu09+veNW8Yk3MJtW3Jx8A7f4O26FJPRHzxDWJudfsqzgI7cWDVuJbSL
         MopoAKO2GpvVZQrHxSBbAO+mV3OHZs6+o7rKMyH0GXRs96JEvKsBRGF2rEJHq7fTTDRO
         zolYjiMakg3td3xNHjdahR5k+KyRhQCwRwG8L0OB+NS2qK+dWDsXfIvP2dHTBUHt7Gtb
         MY23JHoBdFRZe2CRRvlapfZc68AkK9BCKXVSaN2kVn7Xy63UDgtaUzv2nHIK00BzxZMB
         WNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705271828; x=1705876628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DErvdxXifc4ZYsfHy2kccc+/fn6lt3VcVEp4cbBEhRg=;
        b=qlqj4kH9qa30lL9JqF1gyIGI65jbAK6epMb4M/7tmHFO7rqs4c/kWmpNTxRnr5cl2s
         d8p0zyb7HAKclbKsnccQWIW5Znsl9+s+NsXLdH3BbTTAqaMXNXXsPR7x+PXCaBj545RZ
         UMIXfT/M/7k6uwfG4Kiqh5+fY5jEb9NhYoYGL0DXlIfw7sco6PvLnBeVSrHiftyLSWqx
         Vly6a/cJuSaW/hcaraNDvTa1g2h+H+xPxuZb5TWNwnjTOY12Cw/6hggPiItto5F4G5U9
         nmG4/sK6FWJ4Zv16iyBa0KgF48siTfLyN2MGUS8FPLqC8rybIlOIJq9c30rqIyPB0hu2
         f1eQ==
X-Gm-Message-State: AOJu0Yy9PKlOfxvopH4sPhTT3UF+Xtv8ItJr/qmchb4gUgHhpqd/px4Y
	9o82bNp0gTbVkvejFwB8cUvV1kFX1EgECw==
X-Google-Smtp-Source: AGHT+IElqC0u3e6OTECDUSMUE2Ffq3st88V9s140J+yvbO3u3RIM/QG+b9JhU2BlLkP3CRbYGngjxg==
X-Received: by 2002:adf:fe89:0:b0:337:9343:2869 with SMTP id l9-20020adffe89000000b0033793432869mr1912838wrr.59.1705271828657;
        Sun, 14 Jan 2024 14:37:08 -0800 (PST)
Received: from vermeer.ba.rivosinc.com (lfbn-mon-1-1176-165.w90-113.abo.wanadoo.fr. [90.113.119.165])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0033719111458sm10158693wrt.36.2024.01.14.14.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:37:07 -0800 (PST)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 4/4] tsm: Allow for extending and reading configured RTMRs
Date: Sun, 14 Jan 2024 23:35:30 +0100
Message-ID: <20240114223532.290550-5-sameo@rivosinc.com>
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

The whole purpose of TSM supported RTMRs is for userspace to extend them
with runtime measurements and to read them back.

This can be done through a binary configfs attribute for each RTMR:

rtmr0=/sys/kernel/config/tsm/rtmrs/rtmr0
mkdir $rtmr0
echo 0 > $rtmr0/index
dd if=software_layer_digest > $rtmr0/digest
hexdump $rtmr0/digest

An RTMR digest can not be extended or read before the RTMR is configured
by assigning it an index.

Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 drivers/virt/coco/Kconfig |  1 +
 drivers/virt/coco/tsm.c   | 58 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
index 87d142c1f932..5d924bae1ed8 100644
--- a/drivers/virt/coco/Kconfig
+++ b/drivers/virt/coco/Kconfig
@@ -5,6 +5,7 @@
 
 config TSM_REPORTS
 	select CONFIGFS_FS
+	select CRYPTO_HASH_INFO
 	tristate
 
 source "drivers/virt/coco/efi_secret/Kconfig"
diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
index f35f91cb7bd3..16fceed4bdb9 100644
--- a/drivers/virt/coco/tsm.c
+++ b/drivers/virt/coco/tsm.c
@@ -537,6 +537,63 @@ static struct configfs_attribute *tsm_rtmr_attrs[] = {
 	NULL,
 };
 
+static ssize_t tsm_rtmr_digest_read(struct config_item *cfg, void *buf,
+				    size_t count)
+{
+	struct tsm_rtmr_state *rtmr_state = to_tsm_rtmr_state(cfg);
+	int rc, digest_size = hash_digest_size[rtmr_state->alg];
+
+	/* configfs is asking for the digest size */
+	if (!buf)
+		return digest_size;
+
+	if (!is_rtmr_configured(rtmr_state))
+		return -ENXIO;
+
+	if (count > TSM_DIGEST_MAX || count < digest_size)
+		return -EINVAL;
+
+	/* Read from the cached digest */
+	if (rtmr_state->cached_digest) {
+		memcpy(buf, rtmr_state->digest, count);
+		return digest_size;
+	}
+
+	/* Slow path, this RTMR got extended */
+	guard(rwsem_write)(&tsm_rwsem);
+	rc = tsm_rtmr_read(&provider, rtmr_state->index, buf, count);
+	if (rc < 0)
+		return rc;
+
+	/* Update the cached digest */
+	memcpy(rtmr_state->digest, buf, count);
+	rtmr_state->cached_digest = true;
+
+	return rc;
+}
+
+static ssize_t tsm_rtmr_digest_write(struct config_item *cfg,
+				     const void *buf, size_t count)
+{
+	struct tsm_rtmr_state *rtmr_state = to_tsm_rtmr_state(cfg);
+
+	if (!is_rtmr_configured(rtmr_state))
+		return -ENXIO;
+
+	if (count > TSM_DIGEST_MAX || count < hash_digest_size[rtmr_state->alg])
+		return -EINVAL;
+
+	guard(rwsem_write)(&tsm_rwsem);
+	rtmr_state->cached_digest = false;
+	return tsm_rtmr_extend(&provider, rtmr_state->index, buf, count);
+}
+CONFIGFS_BIN_ATTR(tsm_rtmr_, digest, NULL, TSM_DIGEST_MAX);
+
+static struct configfs_bin_attribute *tsm_rtmr_bin_attrs[] = {
+	&tsm_rtmr_attr_digest,
+	NULL,
+};
+
 static void tsm_rtmr_item_release(struct config_item *cfg)
 {
 	struct tsm_rtmr_state *state = to_tsm_rtmr_state(cfg);
@@ -550,6 +607,7 @@ static struct configfs_item_operations tsm_rtmr_item_ops = {
 
 const struct config_item_type tsm_rtmr_type = {
 	.ct_owner = THIS_MODULE,
+	.ct_bin_attrs = tsm_rtmr_bin_attrs,
 	.ct_attrs = tsm_rtmr_attrs,
 	.ct_item_ops = &tsm_rtmr_item_ops,
 };
-- 
2.42.0

