Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559F482E5
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173790; cv=none; b=Ho5r9RV/TjrHYmVOMHBXS8miXF6kKyB4eI/5uWfEv4Asze+KxlkCkbRyZmiH4NEUZ8fDkb+etAVQEaZhuTYSWCkkR8rwafRLOvAl1QcOzqQ3vTMOjQPSnegeyo2O6DKrxrHHGo05Aw9X43jbYr8LMSMCg6fwakaQHzEUdeRgaDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173790; c=relaxed/simple;
	bh=+2KIvQZzubEuGFm8VhvXKT8vwofQa29dh7mcoeFR1GM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DDXIzi9wnvpQq4U+VNKtBFthDWmQ2VXuCpP27+1HPm6Y0LegoJiczs3MT3KN84a1nh6yryoC58q/Iuft3uwsMT4NngkkyBTsuXht5V1cXUqjWlh1gq5N/xpld6earjaKyyHZ/EnFKs2FttAU4y+cUwGiehnS6bHyMwGAmvPTRfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIlJ7p6I; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIlJ7p6I"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e64647af39so4310612b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173788; x=1710778588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kId0KpnR3Bb1OkqKYK5w5Z53gK8zkbuePvbtyjE183w=;
        b=RIlJ7p6ICMQm5xfZ/kwHXw40q2QieXpi8U4nahyyX2pY+I0RU9Tk2ARNqYPeukidFn
         pilb/q/s7KvYtO1Or9NrMBZcbOKpR+RTbatEtQH1/e7Uz8DozN0jCAn06YA+sk33AW8o
         vlMNjD8VtY26WfzQ4jLB3Omub6OWzMldKtukdWQxZNl5GwOHt0Ze9aaWg2aSrjDWgf41
         19FzmY+4OsSiZTLOQe5uQGTlMBEVcZ05CQkKcKZPALUDrmTQWm0uuRwIDKpmWBzPn10r
         JNY5zQVYyLj0REmMXT2HF6aj+d+ebOItfGsLsZOmcdmNXSFY6WhhY/lNnFPoLDlzNsLT
         46xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173788; x=1710778588;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kId0KpnR3Bb1OkqKYK5w5Z53gK8zkbuePvbtyjE183w=;
        b=O2HnG+rzMDVXy0WXujBPD6J3MMJee8Tniho/+fpeuoI/JIP+AED/VGaSy1SLnB+Io+
         0EcFsvJHBgJMlMgNHNZZmIb2hrlqlBWTbaThyCaAvSzEh3fM2NZS7FfkC2Uu2C+fj89P
         oItVP180NFFJyqS+Sjt1h++lG09tPBOkVhRqDsV4Dy6C4/qgx4+AOHDwqXuT81CYxzdP
         mZ9kH6iifwuWJOSHPigKGbwXYF3Y/o6ezTN4glzNvBuRrGgHKJKA2ZjQ9hb9JHZMSAFT
         6gjaJdVkjXoJK6MImQBcey7qpGGIZi3QXOPnojUi5A//I8kdx/d8j7Rx3SKL5JwHdpyz
         fteQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrwWiS/Urg8HZ6jk63jqzhjad69OR8uVvt7G91ciqwDvg6v3yKLe1yHLQHcdp7Sa2kW6KQNn/vk5bRDZSf/Q174+Pqj7luvEq7KQ==
X-Gm-Message-State: AOJu0YwJnSfzKrurfXrzUFKum+xbxCp/Hf2FwkZi+pz+NHqHfpDox0fb
	/xSwhOW+QLYuFmb13KJxfrNqpgA0g6qgRNj+tK0xz67v7cyKPRUI
X-Google-Smtp-Source: AGHT+IFXwmvMu8mIEtQPLNF4LE9yE+Q2fMuFXOwJM8gp5UVU39VY1u8SaVJxQRqEQgy8EyINe4adPw==
X-Received: by 2002:a05:6a20:3d01:b0:1a3:1129:9b2 with SMTP id y1-20020a056a203d0100b001a3112909b2mr6139316pzi.46.1710173788046;
        Mon, 11 Mar 2024 09:16:28 -0700 (PDT)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id m22-20020a056a00081600b006e52ce4ee2fsm4576325pfk.20.2024.03.11.09.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:16:27 -0700 (PDT)
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
Subject: [PATCH v2 3/5] hv_netvsc: Don't free decrypted memory
Date: Mon, 11 Mar 2024 09:15:56 -0700
Message-Id: <20240311161558.1310-4-mhklinux@outlook.com>
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

The netvsc driver could free decrypted/shared pages if
set_memory_decrypted() fails. Check the decrypted field in the gpadl
to decide whether to free the memory.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/net/hyperv/netvsc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index 82e9796c8f5e..70b7f91fb96b 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -154,8 +154,11 @@ static void free_netvsc_device(struct rcu_head *head)
 	int i;
 
 	kfree(nvdev->extension);
-	vfree(nvdev->recv_buf);
-	vfree(nvdev->send_buf);
+
+	if (!nvdev->recv_buf_gpadl_handle.decrypted)
+		vfree(nvdev->recv_buf);
+	if (!nvdev->send_buf_gpadl_handle.decrypted)
+		vfree(nvdev->send_buf);
 	bitmap_free(nvdev->send_section_map);
 
 	for (i = 0; i < VRSS_CHANNEL_MAX; i++) {
-- 
2.25.1

