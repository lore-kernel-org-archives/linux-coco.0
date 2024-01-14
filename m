Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353FC1F18D
	for <linux-coco@lists.linux.dev>; Sun, 14 Jan 2024 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="D5TK0FRA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336897b6bd6so7973082f8f.2
        for <linux-coco@lists.linux.dev>; Sun, 14 Jan 2024 14:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705271824; x=1705876624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6s2rXWc/tMH4uago23e498UJr39tRJPeqGDGZSoMKEY=;
        b=D5TK0FRA2bSYSq+YnigTzEvrlnToSr+xsB3MenPj7h3urbLY3pX484BUXhv+TkBbCW
         MVKxxYbyikJXQncA8WzWybElWyCHdm9CCXZCW6eUZC9gIaG+I51BnnbUnCflVa68NxS4
         OCQ8shHtepHvv3Rc3LkpS0nYylw7VpcESGm+mL7dFCgiEcOnqnoquJmJ/fecggGeCSh3
         fuM+j948LTxqPFGFi0RySXSiWJ0tytPBby1scMeJunOGDmR7/YCZV84bU1fKVYKTD2LJ
         n21fDto+2nst4UtgVr+6IG3IZ7wqOuU/o8mwTyvzeWfhoZLT3ExgWPzwZA4tZQBdC/kx
         KMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705271824; x=1705876624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6s2rXWc/tMH4uago23e498UJr39tRJPeqGDGZSoMKEY=;
        b=oKi8ixXM4jU7hNmN+p9UM/0S0VT39CNTtu5E0T6JfvJtQXS8JXN2by3Cet3TjRZBuS
         qoCG9H/0U93lMwQ6SMBiGe9GluB04AiRZjLGjZNtWg06JuV3/zIHFZSKj972lZSFOYgO
         DBYsv3nNhBiUIdC1IoQsVpycQiG3cqkSgpc99zurXKTaEIIXENishrhrKdnmVV831gwI
         PKXYaiRntpqw5FRGjgbG5X32DSyloeOzxR7FdbEyM//Pw6zRrScfKAhVcQENq8ZFw66n
         2U/jX1Fhkdfsa1opTB5f8eV3x+3mJuKQIoGBvy7GVVRvatZ/U70YtBDDbUm24+IttTld
         hiZA==
X-Gm-Message-State: AOJu0Yw4+cbX+TxQ9DTG3fi8GpGsm9JVCYhbACUEUchPfk/Tk4/EPMOK
	jRmsJh6JmGS4z5LEeGku3AICaHOXDFsm0WujFvxZZBvcP1I=
X-Google-Smtp-Source: AGHT+IE/oNt1I05yQ0MgN0/ZAU8lJPlEIlxDBObZH0WRwddH9azig9/gV4iLyh69uziPn6VmpPiBOg==
X-Received: by 2002:a05:6000:11cc:b0:337:6e32:1812 with SMTP id i12-20020a05600011cc00b003376e321812mr2196492wrx.35.1705271824318;
        Sun, 14 Jan 2024 14:37:04 -0800 (PST)
Received: from vermeer.ba.rivosinc.com (lfbn-mon-1-1176-165.w90-113.abo.wanadoo.fr. [90.113.119.165])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0033719111458sm10158693wrt.36.2024.01.14.14.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:37:03 -0800 (PST)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/4] tsm: Runtime measurement registers ABI
Date: Sun, 14 Jan 2024 23:35:26 +0100
Message-ID: <20240114223532.290550-1-sameo@rivosinc.com>
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

---
Samuel Ortiz (4):
  tsm: Runtime measurement register support
  tsm: Add RTMRs to the configfs-tsm hierarchy
  tsm: Allow for mapping RTMRs to TCG TPM PCRs
  tsm: Allow for extending and reading configured RTMRs

 drivers/virt/coco/Kconfig |   1 +
 drivers/virt/coco/tsm.c   | 362 ++++++++++++++++++++++++++++++++++++++
 include/linux/tsm.h       |  28 ++-
 3 files changed, 390 insertions(+), 1 deletion(-)

-- 
2.42.0

