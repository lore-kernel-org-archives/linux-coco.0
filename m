Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825CA4CDEC
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173792; cv=none; b=V4y6XTdUKfxhBb7TnOgCDmfrh+Hx9yjFT7LWyabdjw5zSP+umW6A+Y+oisdbXhNalsAzEjPX8VITHfKWUgNqVZkeDmopMFlVHUXY5bA3JokqlZyS7IsyL3+/RsP8DbHv0Pd4h007ggX7lu6dJR9N1ftVhUCwl5jNGVzCQCbdN6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173792; c=relaxed/simple;
	bh=NygHFgsfK9/f07Xn51o7Jdn2t0u6vgatLn5MNtO4zD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPky9wFWTPMyZJBSmu+vNeyf+Jd1tN1+uZvXj/uwn9xANNek9aXkGytLIjNDm8+iTuYUMau129JHSvDfnm8tnIkSYh2Eicb/5GbkpD6XEQqx/qF1/jJTM2dgg2+GJoSQxOFftN0yJ/HorlFBfhn0lsJzSkFENr8L1lfFW9F4G8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buSSKcsd; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buSSKcsd"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6277f72d8so3006804b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173790; x=1710778590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wigfq/6aRq72xOj/aIlxvJ6fFfc6HnyBCglftePM4e4=;
        b=buSSKcsdXAeICE/omslF95XlCTurpXgvI4ox0kJwEPWIvTWeD6yF5qm2oMcXGPLSlV
         QWg3VvAEdE19N7aMi5z5D8h1pJRjE/5XV4muEKspWTl1N6FE/Zyv7MwZJwNxSYhgVupa
         UYTVoRksL0z4SjeLideRtrO5XaRdcWoiBbm9rZCI1ClcflDmr6dRLMsC8/6NDzkRM6Wl
         RWGa0uALS9wHdUnTs86lzlMwfgFSpgUrxOvsZQ0vlCO6UKRraysPvLEHmEH6//KeKCON
         EP3HkqMJ8jEVgTzN0imKZp1J8uM41kzVuR1h8ej4ODhhVHlzhZGn6vnTFJ1EYTtfv5hX
         io0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173790; x=1710778590;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wigfq/6aRq72xOj/aIlxvJ6fFfc6HnyBCglftePM4e4=;
        b=euHM0HCxwSUw/zZCVgAXD4dKYYDKV6ZsvZJ9QC9y0e5WXPgAgPhERk7ZCksvV3jq5y
         HpiiWBcvFVp3LNeekJIhrMqfXWooNbKL+lZI6ZOEhjuk6bDiWcA+7s27tiH9Dzeh3vHt
         tyZ2AysK/PmYr+TEqDCMQkI673YkWZRY1VaqkaaX8ducuPDBc7lzD8uOqcku0rQCDqco
         xVkOsW9QhHdAXoebLm/xrePXtPTB3J4OwAsUbCQmeaPiq0G418MxIR5UzzKD1qZNQHa6
         flx2rtkZm1IhsOnObY5+IFDJiuNjbjp3ZRZDGxTyyuDVT1VLkrK+IcuJ3rwg7lFZM482
         5FAg==
X-Forwarded-Encrypted: i=1; AJvYcCXrn8GD5IJt6/EoEWiY4bgIx5EtDVfyd/q2r3unShWAIwTGpcdfxQ87UWAy+fBQMnXsfy/QjyhISYXv285npQkdBx+adfE2//plFA==
X-Gm-Message-State: AOJu0Yw5TYa4QYjfWXkTTi3B6VOkdpvWCcNJ0venA+V0sBA4xuDeaFCj
	stMMi5hwF+jquH2mpA/NarQ+4wP7FaPhqmzDQ1ER50/xmxso07o+
X-Google-Smtp-Source: AGHT+IGYeEcPUzCbQFJrHGPuOeb50x9Z9GqcTz5epYFi2KgNUbGR2sGlA+8oJcaOvFdPFMhABQHcYQ==
X-Received: by 2002:a05:6a20:3d87:b0:1a1:4848:98af with SMTP id s7-20020a056a203d8700b001a1484898afmr5407838pzi.1.1710173789816;
        Mon, 11 Mar 2024 09:16:29 -0700 (PDT)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net. [73.254.87.52])
        by smtp.gmail.com with ESMTPSA id m22-20020a056a00081600b006e52ce4ee2fsm4576325pfk.20.2024.03.11.09.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:16:29 -0700 (PDT)
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
Subject: [PATCH v2 5/5] Drivers: hv: vmbus: Don't free ring buffers that couldn't be re-encrypted
Date: Mon, 11 Mar 2024 09:15:58 -0700
Message-Id: <20240311161558.1310-6-mhklinux@outlook.com>
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

From: Michael Kelley <mhklinux@outlook.com>

In CoCo VMs it is possible for the untrusted host to cause
set_memory_encrypted() or set_memory_decrypted() to fail such that an
error is returned and the resulting memory is shared. Callers need to
take care to handle these errors to avoid returning decrypted (shared)
memory to the page allocator, which could lead to functional or security
issues.

The VMBus ring buffer code could free decrypted/shared pages if
set_memory_decrypted() fails. Check the decrypted field in the struct
vmbus_gpadl for the ring buffers to decide whether to free the memory.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/channel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index bb5abdcda18f..47e1bd8de9fc 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -153,7 +153,9 @@ void vmbus_free_ring(struct vmbus_channel *channel)
 	hv_ringbuffer_cleanup(&channel->inbound);
 
 	if (channel->ringbuffer_page) {
-		__free_pages(channel->ringbuffer_page,
+		/* In a CoCo VM leak the memory if it didn't get re-encrypted */
+		if (!channel->ringbuffer_gpadlhandle.decrypted)
+			__free_pages(channel->ringbuffer_page,
 			     get_order(channel->ringbuffer_pagecount
 				       << PAGE_SHIFT));
 		channel->ringbuffer_page = NULL;
-- 
2.25.1

