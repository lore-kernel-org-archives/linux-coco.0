Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFB64AEC9
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173791; cv=none; b=qUY4BOTZOqkfB2FDBtG1+lmFy9RCCPzMtO8r4n6+BFHT5qPI9DBHiY+3EzfS8JWAz7s7ztHkLeqs/0dLCIuXC2HNLMhZsfjMyEnzc5RYx2wpQTEEdAhmV5TCdrgGmaaUyYmUaQY3vqElFCny0eRcZHVLUsNNAjBOy6nmJ3gZgMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173791; c=relaxed/simple;
	bh=stJGWSegiQhc7Ody3a64Zh+xIaryAD6Z92WIxHEheKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U9Lax0k0qE0422BA0Z9iME4mRszAYDG4Om78YFsXjEzR2Uh970zA18W0YTSErx/t0m3JSo65kQY8t02Ereo2OGUrhvVPdG6JSudlYgQDUuRs+3xqjPrNAhGQajt6uaYcZ88nsLPRCDer/Z+5Y9avdFjPJTRR8PEacB2Q2bisVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ca59Qi6Z; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ca59Qi6Z"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6381df003so3973585b3a.0
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173789; x=1710778589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NIwRgw8kRdMYFrUfI8kD4ryRzVUpHboxNK6cHHvDbvA=;
        b=ca59Qi6ZvUH9CTPiyKCeRYrX4f0mOVl6XSNc9Xyp2AmQtIaWGbKXlDtXQywguSFG1T
         plPOrL46aS0JPJC/Ux9KwEo79qxSrR2iqqnSnDQv24Uycih2+MZxgSV4Mq7rtsY+GzFc
         PCmECncULV9RWAUtbRTfgJxpoNq5EsiS+frYYUNbujhwPnuF7lYBBKDzaIrz9/PmZgCX
         UXMIw6w1Y/yF9zwR9ASK0lhUayZ+oZVMPHpK3PnDxUDXg2rUU6ASdRQAyQjd0IMiOqyZ
         xz4nWHPyzJML1mT8gBqgE/utvtyJOVjM0j8Mqh7FGMW6ygDKmnzhvGsQwXqyWiQQwNS6
         1gNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173789; x=1710778589;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NIwRgw8kRdMYFrUfI8kD4ryRzVUpHboxNK6cHHvDbvA=;
        b=eV973B3zmXPduPDBP14Lh+znsgzfi58PuIdx+r2/vnOlzVrHFnxOKrCbXaBq6CPA0W
         IKZShWUNEUauCz4D1JVl7bZi5Tw8cfN43bx4aw3tIt4xyQKYNcYyKJn1c7kqDgiSyZtl
         r7Dxlf+erXfHxrPDkLPD4ywFscKGdScIF92NbKa+sWfQSZ/D7U2na06u4WrHhoD318OS
         4+g/+PsCDZhKYl/AOcHrIdfAoCAukoYHnZe6MH8MSjB6bL9VAoAe/9erIiGF1Jg2dMJ6
         4zmlsLYxp1HWJ4L8QliA3/DXE2zlctVanDrGeO9V9OdjAuForglz88uG468YguKxSHIB
         Ac4A==
X-Forwarded-Encrypted: i=1; AJvYcCVzThTLEEZ+LqbxnfhYzBkBH5sROaGmyO0ayWeujMQuBMX7DA91TnuPeK/ECN+azgHNf1rEifMHSKtO1RAn7NL3ysFVbDdOdEEARg==
X-Gm-Message-State: AOJu0YyfRIQNMd2gtlm5CqLVas/LxPve/l/bm0QvLv6hXEvP1WCyxFYV
	KMbeQaZSG5D29G7+z3NFZuPlT9mSHlQKClwEwWZ6GM+55WQCtSDp
X-Google-Smtp-Source: AGHT+IHJXkyc8/rW8os/YonzW2lIIoxEg+dw8CwCQc3gKfPn2zBsjIBZ5quHxjxhCcbXMpD+u4DtBg==
X-Received: by 2002:a05:6a21:6da2:b0:1a1:4fce:8ee1 with SMTP id wl34-20020a056a216da200b001a14fce8ee1mr8357364pzb.8.1710173788984;
        Mon, 11 Mar 2024 09:16:28 -0700 (PDT)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id m22-20020a056a00081600b006e52ce4ee2fsm4576325pfk.20.2024.03.11.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:16:28 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: rick.p.edgecombe@intel.com,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: sathyanarayanan.kuppuswamy@linux.intel.com,
	elena.reshetova@intel.com
Subject: [PATCH v2 4/5] uio_hv_generic: Don't free decrypted memory
Date: Mon, 11 Mar 2024 09:15:57 -0700
Message-Id: <20240311161558.1310-5-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311161558.1310-1-mhklinux@outlook.com>
References: <20240311161558.1310-1-mhklinux@outlook.com>
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rick Edgecombe <rick.p.edgecombe@intel.com>

In CoCo VMs it is possible for the untrusted host to cause
set_memory_encrypted() or set_memory_decrypted() to fail such that an
error is returned and the resulting memory is shared. Callers need to
take care to handle these errors to avoid returning decrypted (shared)
memory to the page allocator, which could lead to functional or security
issues.

The VMBus device UIO driver could free decrypted/shared pages if
set_memory_decrypted() fails. Check the decrypted field in the gpadl
to decide whether to free the memory.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/uio/uio_hv_generic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
index 20d9762331bd..6be3462b109f 100644
--- a/drivers/uio/uio_hv_generic.c
+++ b/drivers/uio/uio_hv_generic.c
@@ -181,12 +181,14 @@ hv_uio_cleanup(struct hv_device *dev, struct hv_uio_private_data *pdata)
 {
 	if (pdata->send_gpadl.gpadl_handle) {
 		vmbus_teardown_gpadl(dev->channel, &pdata->send_gpadl);
-		vfree(pdata->send_buf);
+		if (!pdata->send_gpadl.decrypted)
+			vfree(pdata->send_buf);
 	}
 
 	if (pdata->recv_gpadl.gpadl_handle) {
 		vmbus_teardown_gpadl(dev->channel, &pdata->recv_gpadl);
-		vfree(pdata->recv_buf);
+		if (!pdata->recv_gpadl.decrypted)
+			vfree(pdata->recv_buf);
 	}
 }
 
@@ -295,7 +297,8 @@ hv_uio_probe(struct hv_device *dev,
 	ret = vmbus_establish_gpadl(channel, pdata->recv_buf,
 				    RECV_BUFFER_SIZE, &pdata->recv_gpadl);
 	if (ret) {
-		vfree(pdata->recv_buf);
+		if (!pdata->recv_gpadl.decrypted)
+			vfree(pdata->recv_buf);
 		goto fail_close;
 	}
 
@@ -317,7 +320,8 @@ hv_uio_probe(struct hv_device *dev,
 	ret = vmbus_establish_gpadl(channel, pdata->send_buf,
 				    SEND_BUFFER_SIZE, &pdata->send_gpadl);
 	if (ret) {
-		vfree(pdata->send_buf);
+		if (!pdata->send_gpadl.decrypted)
+			vfree(pdata->send_buf);
 		goto fail_close;
 	}
 
-- 
2.25.1

