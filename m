Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3653E7167
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 02:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094850; cv=none; b=atID54ATTAhFCph9T26hX4GegdeaJh8Rd+LbTBRkA4jNyvifSblxqoaskhd5G3mBWP5lJK6lgMxxhHDECGJalR0ppDDguIt25SD1JZLR/0LB0dn9eLc0qY6YyCAR2mc78T10ceARkkUawKqFQtEwTtKOTnVM8DeJFjqlGzpYDdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094850; c=relaxed/simple;
	bh=Q+vE+X+sG/ZYk8rkcS5IYVR/ggcGiu0wbko6eWTdm1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDqLsZy73cv1WrsSgnpQS+JNWKYFu/5ngtkdl8rROLepRaRODpeFxbv/Sct/+8EKr+w7jda/TOqmmYs0clJH1cYfaS+bqK8MXiogr0m/Kj/H68O3df0yCzbOULd8XTNbRrm4RH973cejL4/57pRw+eB1o5vzPxrpnJgS7/vLsQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQFKe8uM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQFKe8uM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso4189315ad.3
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 19:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789094848; x=1789699648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VRnd7b8ZPPVwC55w7njfDr576OvKBxuHB8QDsx2Fm4=;
        b=lQFKe8uMBINxpLxBV7SImKRvEEe2OPu1OfyYhxHs2locv4BxpVhV3R0OMuOzJFVl02
         AiWs5xJ9jthpG7/q1j3V3kVu4y1Kk72J7bpDzgZpJTYJK6h45GICzfqfU642C82+iPeC
         MbFlstkpho7wn0Ph4JXHAifOi1NuZmEvxaL4UrSOFn0ZMWb6+eyNlgpWpmIIg6mc5tKo
         9EUyqNe795bAGkOREeP4tG1WbVSLpB2hmkCF7VZj2dZesdk6bwQhE1PJuNgoOT8u3EiF
         3B8Q1OWM7RZgJqAdCDwdPDsWbekHqyyBeaJs1VYIBZTvsv/yTXXqCFMwKkiJlZyBOJf2
         9Wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094848; x=1789699648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VRnd7b8ZPPVwC55w7njfDr576OvKBxuHB8QDsx2Fm4=;
        b=kRnkGXIlMkGAOq5KTn7+iw0iNrxnqXYBp6Dhf4/wDhFzORtOkiuP2pRrk8B8hmGR/L
         ojJAY+9VTtDIGlv/0E0pb+AebvDcCHLqQ6LlQpz4uj5XJ5wUzEZlqLdayk2Oqh2XOLO0
         IMB0PEwvVR3OTgp+86m3zUAqrssVimfs9z3QCgSBx8wi034AiLlgzNfdUS0QEU9PwADN
         wBHemveyWex/0tATnKEUNjN6pfsPz8f5pqfdRbA8qSIab1PRhqBZkmc+gOD8A02o9g+G
         Cf8onA9q+pFvytNZndcn+GSlQCygK4jx8vru6tEm0oFwFyTqE+G1fc6VrxBwr94ImSDI
         giuQ==
X-Forwarded-Encrypted: i=1; AKwUvByxAStPEGgl5cL2T1QQZVqPkbPwvQBBgIujkqbSlwVclMwF4MDAKcVfC9f08WwCL0TYC7TAeZ2oE9S3@lists.linux.dev
X-Gm-Message-State: AFuF++ljFdMH5W0AjcudT+vzspodyLM/BEPBfdPiPuKphKFh3LSPkrrz
	HXrMjBpGyGZNbOWd8tiHjzsjS5aPKrWTIPQhSfWXQlirkb1oniH9T7Nt
X-Gm-Gg: AYBFou3m7HLcZSXIFcYMdfCynTNGLmn8BY7gS0yDrYWI7nZw15vnJ/hQlByOPGf9jt9
	7WQuFTeP7GIvpgk+w/9J+nNsgV+gQhbMYXGuxLWBZYbS9ziv2Ca8FgUm6Q3uGV9HRB0MGikYT0E
	isJzIuer97XwNCWTFy//UqUjVYyG7g/0uqZaVSoCTGu1GmUPxAzRq0/3BiXjpCoAM9alkRt0wGh
	Q2QurhHodsvFFTuagnsVOQb6eHq4od1++i8Sm5998fNeRtdODR1WsRf82cwpiG5XmTnCT9LxXNg
	QQ0njbuzgXOmA9Q3uQmCogEx8caO5IkWc71iia/NvTEQ7jDYY7AptoODVgcURhkIxyNW6Y40cnm
	kNjmB3y4khaynwXdLybM+zS5CW5swTrqeHXgx4QeVQTwtMYfR7aAEo+6lB72ret8L5l+sm2b/KW
	nuWJcwU2YXj9HXO6luSgdOvniOtYPrpr4JLuFQC5AKRz1sTzqFmK0LYzuPFZkhlXVUU91Z2zlgI
	j+RTy7+F4iE9P60Nw==
X-Received: by 2002:a17:902:dac2:b0:2d8:f965:7e48 with SMTP id d9443c01a7336-2dd2a1bfaadmr39930245ad.1.1789094848007;
        Thu, 10 Sep 2026 19:47:28 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca26c2sm4129225ad.10.2026.09.10.19.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:47:27 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: ashish.kalra@amd.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] virt: coco: change tsm_register() to use a const struct
Date: Fri, 11 Sep 2026 12:47:07 +1000
Message-ID: <20260911024707.3485954-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

The tsm_register() function takes a struct pci_tsm_ops *ops argument.
This eventually is stored in struct tsm_dev as a const, so we should
just change the tsm_register() register function argument to be a const.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/crypto/ccp/sev-dev-tsm.c | 2 +-
 drivers/virt/coco/tsm-core.c     | 4 ++--
 include/linux/tsm.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index 46f2539d2d5a..48df8c579c74 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -339,7 +339,7 @@ static void dsm_disconnect(struct pci_dev *pdev)
 	streams_teardown(dev_data->ide);
 }
 
-static struct pci_tsm_ops sev_tsm_ops = {
+static const struct pci_tsm_ops sev_tsm_ops = {
 	.probe = dsm_probe,
 	.remove = dsm_remove,
 	.connect = dsm_connect,
diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8..6b735ac2a814 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -57,7 +57,7 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
 }
 
 static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
-						 struct pci_tsm_ops *pci_ops)
+						 const struct pci_tsm_ops *pci_ops)
 {
 	int rc;
 
@@ -78,7 +78,7 @@ static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
 	return tsm_dev;
 }
 
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *pci_ops)
 {
 	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
 	struct device *dev;
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 381c53244c83..6ac12de8c4d3 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -120,7 +120,7 @@ DEFINE_FREE(put_tsm_dev, struct tsm_dev *,
 
 int tsm_report_register(const struct tsm_report_ops *ops, void *priv);
 int tsm_report_unregister(const struct tsm_report_ops *ops);
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *ops);
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *ops);
 void tsm_unregister(struct tsm_dev *tsm_dev);
 struct tsm_dev *find_tsm_dev(int id);
 #endif /* __TSM_H */
-- 
2.55.0

