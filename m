Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED3E481A2
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173789; cv=none; b=roxCcn3p6/iCy3yC1DcjgvhohONYds9BEeMRVoXjWk9hRrnwGpMEOUIgn3LDlMI4dDv6EhuyqQQYNhfokhjnte5RFMTxsA09nGzmsKm9qY0WUqr5zmXXYYRLNHcrDInsbEOQLyNeOcjOP/Qj2XOZObs1NXPVCnfD9Y3tsTtx4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173789; c=relaxed/simple;
	bh=KPYk9JxotgHUynNFnqxGdycQ5ugdp7osOeSdIU/c5rk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KXVCtImhD/1Y73UID6gjTjICbiW85IOyTC+Cm4BRWsKtGPYJzbmEOpYBCbcmQOUpiS1UaJdU/utWF9kEtgG1bCwlJJd2MrGkUIcgp9W13A5t1b9Ee31yu11/FgF7zKyjwsMtI05CGfJYnEQp39jUVWWAcRNc7S0c5NYtSJrZQio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVb1fhXW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVb1fhXW"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e5a50d91b4so3056393b3a.2
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173787; x=1710778587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4lQ8bQAzdsnyz/nAyILsXiibH//empkPkLI+o99v2ns=;
        b=eVb1fhXWxm2LhBhoHpuHFY3PBDfDUW0ha994BNhKEcxhYKgeQq/t/d8+o00+4GW4Hp
         kfGJk0jsKSGYUX0q3cznitmjZlujRMT9o+YV0quOO9aPvevF/J1GM22NRHcp618zi3eo
         0UsBb3J/8dkSobFAwRTMCggje+48BmUQrYM5meAViXsWjdE549T4jF8sPAvKD29suIh5
         UcSucSyPTB5hmFkK6OAW+UQDM6PK7ydGBY4WySJR5Lomyg/8kcHhh1VgScRfqfHKRd4R
         6ZZp1WNcWpPkDoo3FuD68uXhrKRDasmcqymIBlagwBvMSKIQbktljLH6E69WskN5bRX/
         QiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173787; x=1710778587;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4lQ8bQAzdsnyz/nAyILsXiibH//empkPkLI+o99v2ns=;
        b=XonfsIQ8IqrEYSBqF2vhqHFnkptNGqN+crGhtnyGTYcYQhakQJ8UZVTQMqQPaiLAY0
         QqSNSgCXlrkxC1IkGpS8Zz226Q5YEY0qWaUBHnxl32Owc5lhdFN/HI02FHN11BTxwYO2
         1MRg2FQsiXmr6WYQD0BdWxMSsZfsMzJFPmvUh5F+UjmdbzHjbcHCgkuztUDONAcMyjMv
         aPyM4GHLLoWyVphsI5LB6qtE80Pi0psF1I1EyZKdzgw3g8ViaqnylZ3kDzeFzS4nsdPA
         nHwl4jW5O8irWTxsxYirtL6sNnJ7Q6tZNZUeMQiHOXSA9aIpK5i8o6l5jE1/bMHeANIW
         36jw==
X-Forwarded-Encrypted: i=1; AJvYcCX/l2roNzvJOtnTarVzomqB7ILMdwWjSJRnDf3fiWmo6xYOYjreZsqhsLQYVJ7imVeyqlI0TEqSF/ike2I6PmAO16ORwu3zPwMAdA==
X-Gm-Message-State: AOJu0YwibGrJqTN0UBeo9rfhbg3nvQPb2fPzQrTkd2Z9G1OCqnvqWrXN
	xMkeFr91n1AH1FksmFGRGA9WXbTctb4vxfEfH/ZOcUA0vx0e4JAg
X-Google-Smtp-Source: AGHT+IGjodke58rrus9B6GEFDDUSlZJWk9z76M96k2TqGgCOmRDPjs6BiylAzmS3N6VxdyT69FyDew==
X-Received: by 2002:a05:6a20:d38c:b0:1a1:57f1:1a01 with SMTP id iq12-20020a056a20d38c00b001a157f11a01mr9184678pzb.42.1710173786938;
        Mon, 11 Mar 2024 09:16:26 -0700 (PDT)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id m22-20020a056a00081600b006e52ce4ee2fsm4576325pfk.20.2024.03.11.09.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:16:26 -0700 (PDT)
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
Subject: [PATCH v2 2/5] Drivers: hv: vmbus: Track decrypted status in vmbus_gpadl
Date: Mon, 11 Mar 2024 09:15:55 -0700
Message-Id: <20240311161558.1310-3-mhklinux@outlook.com>
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

In order to make sure callers of vmbus_establish_gpadl() and
vmbus_teardown_gpadl() don't return decrypted/shared pages to
allocators, add a field in struct vmbus_gpadl to keep track of the
decryption status of the buffers. This will allow the callers to
know if they should free or leak the pages.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/channel.c   | 25 +++++++++++++++++++++----
 include/linux/hyperv.h |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index 56f7e06c673e..bb5abdcda18f 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -472,9 +472,18 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 		(atomic_inc_return(&vmbus_connection.next_gpadl_handle) - 1);
 
 	ret = create_gpadl_header(type, kbuffer, size, send_offset, &msginfo);
-	if (ret)
+	if (ret) {
+		gpadl->decrypted = false;
 		return ret;
+	}
 
+	/*
+	 * Set the "decrypted" flag to true for the set_memory_decrypted()
+	 * success case. In the failure case, the encryption state of the
+	 * memory is unknown. Leave "decrypted" as true to ensure the
+	 * memory will be leaked instead of going back on the free list.
+	 */
+	gpadl->decrypted = true;
 	ret = set_memory_decrypted((unsigned long)kbuffer,
 				   PFN_UP(size));
 	if (ret) {
@@ -563,9 +572,15 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 
 	kfree(msginfo);
 
-	if (ret)
-		set_memory_encrypted((unsigned long)kbuffer,
-				     PFN_UP(size));
+	if (ret) {
+		/*
+		 * If set_memory_encrypted() fails, the decrypted flag is
+		 * left as true so the memory is leaked instead of being
+		 * put back on the free list.
+		 */
+		if (!set_memory_encrypted((unsigned long)kbuffer, PFN_UP(size)))
+			gpadl->decrypted = false;
+	}
 
 	return ret;
 }
@@ -886,6 +901,8 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, struct vmbus_gpadl *gpad
 	if (ret)
 		pr_warn("Fail to set mem host visibility in GPADL teardown %d.\n", ret);
 
+	gpadl->decrypted = ret;
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vmbus_teardown_gpadl);
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 2b00faf98017..5bac136c268c 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -812,6 +812,7 @@ struct vmbus_gpadl {
 	u32 gpadl_handle;
 	u32 size;
 	void *buffer;
+	bool decrypted;
 };
 
 struct vmbus_channel {
-- 
2.25.1

