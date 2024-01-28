Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6813C6BA
	for <linux-coco@lists.linux.dev>; Sun, 28 Jan 2024 21:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706477234; cv=none; b=Xqc3xsmes0kKrlF+LF2tA8e+DxwsPWthUvaxoqrv5ujHsgEkwy3WjTAaJBKzfyBOdMcKVdny6urBK9KImXTGC9RntSAxSjr6XckmQCDPN+lZGoQS/v3x+UhEXGnCywReAC6r5KrbotOd57k7nz7kS+A8NnuSsP99GhtvVsQTkso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706477234; c=relaxed/simple;
	bh=X7GxPWHVGWr0pAtWSlpO57lcSUC3wBBKJbyyqChk0Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scoRlcRsPwmZz7p9r9tRUCJU9jnjUCerupuFDmJFMxESr92UkmF7SvFcuEkJNJnVMNiIs9BClFkMz0T/hq2wvrxj9ltzEiBUbJIWXJ3yEO7uRXpsftVG3ai9cmy0mZjLZEDQ+AXAq2yB2aAiaTeTMSVunCn6R52Ob9qr05I1YTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0ckPmrxF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0ckPmrxF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so28975645e9.3
        for <linux-coco@lists.linux.dev>; Sun, 28 Jan 2024 13:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706477229; x=1707082029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7nI+FYl2ATWbeRP7p2e7xChOwqiLITgmr8UQN8vuDU=;
        b=0ckPmrxFw7sk5BYcEvtdvF3Dq2bULGgkvzr9z7y+89sCLaKWTRXsRKOMNlsWcw+iEh
         dlZ96k9VH4HvXEj3YnqP+UAjXIGHdQz9riTVI3o57EskAmBGgrXd1hoczx0VCLK7akaF
         RpJNIZuKsTi+YxvT9r9GP8qTzmRg66ptqEaz+y5zShD16ZTb2ae5M61HG6rqB7MpguaQ
         5HNOqjjqNLJQjRt2MlaFKD2KfKtp87bkqlkuVvtz21MkIr6PUnbnZp5KtHDL4GDlsb4L
         0K9daIBiUYEOYJdr3qz68a54fuKOE5uYfV/TKLnjwU0hzSiuI2cWBGSbqDTG9CpyGQwT
         BAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706477229; x=1707082029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7nI+FYl2ATWbeRP7p2e7xChOwqiLITgmr8UQN8vuDU=;
        b=BcpLzIaDIRoRI3daYBQTOqIV0Uktx8OHb5JC6z+G8HBBwb0fVcIMMFmDzOt5AXvsCK
         ryDnM8viXPpyelvtrP+sypGJlN2JYFycYGXG4IawB8YORgOPxCyHa4RWZXWByMi6qVdY
         1EESr+iZwqR7KRkW7wlBVm13dkeggxITxv43JV6z+4wAJQgF0IKqkiaw+cWoPZGXOGYi
         YyaI6i5e0SXMYwniMJUHtNJwouwWxHfC8vt6tEHKL+Lxx/KM1AN1fWT4FRCIbBrazjgd
         D1YsPQ1XTWn0Hmb/5xJd+mBT504TQQuID/D+4l2yaaIRsdLPEhmRpLbnoz15CULWLrMB
         EbOg==
X-Gm-Message-State: AOJu0YzEkh6rKmio8K4FfdjhZ/tcsi9Dx47Nt49j4aM0kN7q2Hl0+1dS
	9so3Y0fk1OcjKcXazi4RdvoiGKOlo33YegI/sPySq/DzVoKFcLiDU9PPBNhDbsk=
X-Google-Smtp-Source: AGHT+IFu8QXXPo8dGWJsDB1FFkwtblLK2klQlj7lq11rghmXbYS3OjEeGSMPM7tmIom/YJycOxS7Bg==
X-Received: by 2002:a05:600c:19cf:b0:40d:91fd:74e with SMTP id u15-20020a05600c19cf00b0040d91fd074emr3402248wmq.15.1706477228778;
        Sun, 28 Jan 2024 13:27:08 -0800 (PST)
Received: from vermeer.ba.rivosinc.com (lfbn-mon-1-1176-165.w90-113.abo.wanadoo.fr. [90.113.119.165])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c315100b0040d62f89381sm8218208wmo.35.2024.01.28.13.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 13:27:08 -0800 (PST)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Qinkun Bao <qinkun@google.com>,
	"Yao, Jiewen" <jiewen.yao@intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	biao.lu@intel.com,
	linux-coco@lists.linux.dev,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/4] tsm: Runtime measurement registers ABI
Date: Sun, 28 Jan 2024 22:25:19 +0100
Message-ID: <20240128212532.2754325-1-sameo@rivosinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some confidential computing architectures (Intel TDX, ARM CCA, RISC-V
CoVE) provide their guests with a set of measurements registers that can
be extended at runtime, i.e. after the initial, host-initiated
measurements of the TVM are finalized. Those runtime measurement
registers (RTMR) are isolated from the host accessible ones but TSMs
include them in their signed attestation reports.

All architectures supporting RTMRs expose a similar interface to their
TVMs: An extension command/call that takes a measurement value and an
RTMR index to extend it with, and a readback command for reading an RTMR
value back (taking an RTMR index as an argument as well). This patch series
builds an architecture agnostic, configfs-based ABI for userspace to extend
and read RTMR values back. It extends the current TSM ops structure and
each confidential computing architecture can implement this extension to
provide RTMR support.

Changes since v1 [1]:
- Removed the abilty for userspace to configure the TCG PCR mappings. The
  configfs attribute for the TCG PCR mapping is now RO, and the mapping is
  passed from the TSM provider as a static bitmap.
- Document the added tsm-configs attributes.

TODO:

- Event log support.

[1] https://lore.kernel.org/lkml/20240114223532.290550-1-sameo@rivosinc.com/

---

Samuel Ortiz (4):
  tsm: Runtime measurement register support
  tsm: Add RTMRs to the configfs-tsm hierarchy
  tsm: Map RTMRs to TCG TPM PCRs
  tsm: Allow for extending and reading configured RTMRs

 Documentation/ABI/testing/configfs-tsm |  36 +++
 drivers/virt/coco/Kconfig              |   1 +
 drivers/virt/coco/tsm.c                | 376 +++++++++++++++++++++++++
 include/linux/tsm.h                    |  39 ++-
 4 files changed, 451 insertions(+), 1 deletion(-)

-- 
2.42.0

