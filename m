Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC41F19B
	for <linux-coco@lists.linux.dev>; Sun, 14 Jan 2024 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OU8wTQOX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e775695c6so4009055e9.3
        for <linux-coco@lists.linux.dev>; Sun, 14 Jan 2024 14:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705271827; x=1705876627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlF8fFJ5lqdqj/4fKpFf4I4E1M06YT+qzoTwfOt/slo=;
        b=OU8wTQOXliooGNy5He7n113LqQlCauOKZByU0hE0b9smkhBBoiB0X2Kd73Kbcc0o7P
         wXa8ysEtLdbnSIl3LQc9GsJN5H/Cp5+z0lpUE1ROWrnxO4foGuvmX1mqgvBaBNUQbonV
         6SvL7vX00ODSskDbIQUMGPNRQ4fdzzwJ2b7VJ4QKYwrhtLlLYcfFl+MjpEUHKHu3BerN
         eXs1fAgRreAhmu1Uqo5I9wKuq8Jyrf0j1vLBNTGchxzUbem8PJZcVaOZaJMXgNMEEOcn
         UYvD4pechqF78fOZzNaIAsUP0b6TM0PONFG+AgwPWV37/kUjiJqbrer+5EnLJICaCIBY
         7nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705271827; x=1705876627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlF8fFJ5lqdqj/4fKpFf4I4E1M06YT+qzoTwfOt/slo=;
        b=qrXGfY2q2JDH2H6x1ZFR1X/oia/6UnHQnnW9KFl2/tU9AK3m8btQSOEoummKxYYziu
         VPd0RCkOnzeD93cKzIqlVAvwagkdm62STCVRI2hW5LqCP+JW8+ig7q/+W0fJ44mGaOez
         EbZRKMpns7dXb5L3qfSNG4NraoImSJ8Q0go5DysGVDXBZCbYfQVs3a01FOe8OoDl+9h+
         66ea+L8oNhqt/kvXoJj7IMigqNEnurpYWuDIc23Aj6LgOtT8xnVusz1oWv4wW2yOe3Ns
         qYT2iUKhh2AlODeuiKuv0BDRGR+Hnx2jo1fEoXbI6UUltxeoFF5GNj5/O4cAt1LKslIV
         7rZw==
X-Gm-Message-State: AOJu0Yz6bIREkyzsjPNBYG+8iomQHZ/A95H5779EP+tziNSgiwDsprLL
	KWB5BZH5G1X2gMLjSru3j3Z3YsIFyuyMvaN/6gPjiplT2cM=
X-Google-Smtp-Source: AGHT+IG6q/j3g70xPA0ltpPIjT37LiZgSoTOxgq1MM+6wUv4JccEORQFTrOruEYEtorh5HqtpwVbbw==
X-Received: by 2002:adf:a18b:0:b0:337:5588:801f with SMTP id u11-20020adfa18b000000b003375588801fmr2716111wru.57.1705271827555;
        Sun, 14 Jan 2024 14:37:07 -0800 (PST)
Received: from vermeer.ba.rivosinc.com (lfbn-mon-1-1176-165.w90-113.abo.wanadoo.fr. [90.113.119.165])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0033719111458sm10158693wrt.36.2024.01.14.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:37:06 -0800 (PST)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 3/4] tsm: Allow for mapping RTMRs to TCG TPM PCRs
Date: Sun, 14 Jan 2024 23:35:29 +0100
Message-ID: <20240114223532.290550-4-sameo@rivosinc.com>
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

Many user space and internal kernel subsystems (e.g. the Linux IMA)
expect a Root of Trust for Storage (RTS) that allows for extending
and reading measurement registers that are compatible with the TCG TPM
PCRs layout, e.g. a TPM. In order to allow those components to
alternatively use a platform TSM as their RTS, a TVM could map the
available RTMRs to one or more TCG TPM PCRs. Once configured, those PCR
to RTMR mappings give the kernel TSM layer all the necessary information
to be a RTS for e.g. the Linux IMA or any other components that expects
a TCG compliant TPM PCRs layout.

TPM PCR mappings are configured through configfs:

// Create and configure 2 RTMRs
mkdir /sys/kernel/config/tsm/rtmrs/rtmr0
mkdir /sys/kernel/config/tsm/rtmrs/rtmr1
echo 0 > /sys/kernel/config/tsm/rtmrs/rtmr0/index
echo 1 > /sys/kernel/config/tsm/rtmrs/rtmr1/index

// Map RTMR 0 to PCRs 4, 5, 6, 7 and 8
echo 4-8 > /sys/kernel/config/tsm/rtmrs/rtmr0/tcg_map

// Map RTMR 1 to PCRs 16, 17 and 18
echo 16-18 > /sys/kernel/config/tsm/rtmrs/rtmr1/tcg_map

Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 drivers/virt/coco/tsm.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
index 15b67d99fd54..f35f91cb7bd3 100644
--- a/drivers/virt/coco/tsm.c
+++ b/drivers/virt/coco/tsm.c
@@ -472,8 +472,68 @@ static ssize_t tsm_rtmr_index_show(struct config_item *cfg,
 }
 CONFIGFS_ATTR(tsm_rtmr_, index);
 
+static ssize_t tsm_rtmr_tcg_map_store(struct config_item *cfg,
+				      const char *buf, size_t len)
+{
+	struct tsm_rtmr_state *rtmr_state = to_tsm_rtmr_state(cfg);
+	int i, pcrs[TPM2_PLATFORM_PCR + 1];
+
+	get_options(buf, ARRAY_SIZE(pcrs), pcrs);
+
+	if (pcrs[0] > TPM2_PLATFORM_PCR - 1)
+		return -EINVAL;
+
+	guard(rwsem_write)(&tsm_rwsem);
+	/* Check that the PCR list is valid  */
+	for (i = 0; i < pcrs[0]; i++) {
+		/* It must be a valid TPM2 PCR number */
+		if (pcrs[i] > TPM2_PLATFORM_PCR - 1)
+			return -EINVAL;
+
+		/* If another RTMR maps to this PCR, the list is discarded */
+		if (tsm_rtmrs->tcg_map[pcrs[i + 1]] &&
+		    tsm_rtmrs->tcg_map[pcrs[i + 1]] != rtmr_state)
+			return -EBUSY;
+	}
+
+	for (i = 0; i < pcrs[0]; i++)
+		tsm_rtmrs->tcg_map[pcrs[i + 1]] = rtmr_state;
+
+	return len;
+}
+
+static ssize_t tsm_rtmr_tcg_map_show(struct config_item *cfg,
+				     char *buf)
+{
+	struct tsm_rtmr_state *rtmr_state = to_tsm_rtmr_state(cfg);
+	unsigned int nr_pcrs = ARRAY_SIZE(tsm_rtmrs->tcg_map), i;
+	unsigned long *pcr_mask;
+	ssize_t len;
+
+	/* Build a bitmap mask of all PCRs that this RTMR covers */
+	pcr_mask = bitmap_zalloc(nr_pcrs, GFP_KERNEL);
+	if (!pcr_mask)
+		return -ENOMEM;
+
+	guard(rwsem_read)(&tsm_rwsem);
+	for (i = 0; i < nr_pcrs; i++) {
+		if (tsm_rtmrs->tcg_map[i] != rtmr_state)
+			continue;
+
+		__set_bit(i, pcr_mask);
+	}
+
+	len = bitmap_print_list_to_buf(buf, pcr_mask, nr_pcrs, 0,
+				       nr_pcrs * 3 /* 2 ASCII digits and one comma */);
+	bitmap_free(pcr_mask);
+
+	return len;
+}
+CONFIGFS_ATTR(tsm_rtmr_, tcg_map);
+
 static struct configfs_attribute *tsm_rtmr_attrs[] = {
 	&tsm_rtmr_attr_index,
+	&tsm_rtmr_attr_tcg_map,
 	NULL,
 };
 
-- 
2.42.0

