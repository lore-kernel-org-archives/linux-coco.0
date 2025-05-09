Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701D7153BD9
	for <linux-coco@lists.linux.dev>; Fri,  9 May 2025 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798040; cv=none; b=g7i7R6mHYckUenptZGzppqWrFSgf11KqfxeKTPZQxvmYtCxuR3dm2PMITB8Jt+ElVszWSlYdzJMcHWdg/Iei0s0Zo23uuaKGz1p+apsJ4aUNS9bRyDpikKgrm684ntYR4GAlcemtUfYAUWNPddlXItV41RtqiIeQrnDVL60Dq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798040; c=relaxed/simple;
	bh=6kh1EmvyaIMEv6qY2bKAXfovW6AsqQRIY19O2CY38EA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=ZdnilXHAFXfYlyY3GYBvarM4AYrVYbGwKo+hOT6SNaovVvO3BYxynRSwoXMkZb5st6ObAJMcVQbJlyEWCzBvwZ2DBK2GgccRTj3mJtc1SHDI820IhLSWz6EgnPaYaICEYDTlM0OblnS34tY+vSxOsgSgUGd16Ju8wwkI4iI/7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gT7FWQXo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gT7FWQXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746798037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rbU/Ik2HFCaYPRnGL3BpFYVtUHthaf34xL/8Qjh8JzE=;
	b=gT7FWQXovB456Xb8WfYMuvVAi5qPBnqw2tHUAFqeF8WGcixtSmdGklBa31A5QX8nWFuyvT
	lt1PljvZLZc5MzrTEum0iQlyrSz7WthIFwhv5uK3roU17Fr8AHfhMOcHW/8Fepdqc222Ae
	fqfAD+Q4M54k5/aqlC2oyTov1BmPWyk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-wj3PxzHDPWaoCHx2_8vgrQ-1; Fri, 09 May 2025 09:40:36 -0400
X-MC-Unique: wj3PxzHDPWaoCHx2_8vgrQ-1
X-Mimecast-MFC-AGG-ID: wj3PxzHDPWaoCHx2_8vgrQ_1746798035
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43f405810b4so10797265e9.1
        for <linux-coco@lists.linux.dev>; Fri, 09 May 2025 06:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798035; x=1747402835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbU/Ik2HFCaYPRnGL3BpFYVtUHthaf34xL/8Qjh8JzE=;
        b=kMyt7ycsvJj8EsbAqoQf+LbulJyhlglvvbZVznbfJ/K4LLKRrbrV+X6qcpRv2NxIrb
         exp+XMg1yB/MJ/5hFvJ196vAZ9D5ktdJvsn4pBRdt/8BZ1Kjw/1N3xwMnDlaqiGua9Ux
         7J5f6AGOMC/TW3mOROz7qkmcqlaTHwv6Cy0k4KkK/IUNvOoh9CWsD9oH9Lx6WBRzhA7w
         GURBow4dIFUfibojU6YxIyYKDgs2j/FhaKQBEPh4qd00knodswzcN5Uodhak5whR1AAP
         7iYO9VA+MHD3JwHMNHH3mt+jUIIS4wUPKFtRaiBLD4t0P2aFKiHp12Xc8DfX6Q+yn7On
         W1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCV9n5SglyTB6XqH1Z0FfSf/NLNilTetnA/znlFvsrXK6wfjcS6l1ChXfbspdYg7ayzthTm2mJFBaCtP@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7MGjjK1DleLqqxfasG/5Ef3km86D5qPCwhiHaA1NRgpA316c9
	BfiJbzESf3WEkl/bg9G+RnER9/6DU7WJHdy9OdN0ps6NW1aV9pp22N2edFPZzV1wq+QNUeMtWfM
	pAAtyZFbgnXcRx3ftkcnrm5SdfnbYpTglLv8+itYj3yUTLNiHvk43MWzVXkk=
X-Gm-Gg: ASbGncseHZe25giSBTyq+BhnPxej0HmhJXohI2fTXJm9h1rA2t19/Xo38I2PvmHPq7Z
	w0WzYxcJf8VIvuCanl4pAQI2ocZcFd+YVbED5GP+PR/giTv+CNpLR5nb/SnpVz5sfFuYey/jrg1
	YsououHDuC1xKKZ04Dcqaj6gEjiu+4TSr6cl953ls/gAb274fOIk+tTb/Jy8FDQjK1JOeGZB8XM
	z9UkoE/cwa9yZhSbgQ8oVc28GGxvxFvTRLGwVF3cholYhgjNPHH7RNzLM3O9OANELQ4zztE1Yzd
	8HZPkdMsAO0FqsPhI1i2HYbkBsuqmtIOl5e7O68OOkm3ANom7bLHi/weqQ==
X-Received: by 2002:a05:600c:6819:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442d6d44db5mr30308865e9.13.1746798034806;
        Fri, 09 May 2025 06:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Kxh1nPeuAUwUqlxdH6k97wyjBuBL7pw2aJhhUSJalMBvgbkpXFDayp+M9yqixrKB3tLmdA==
X-Received: by 2002:a05:600c:6819:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442d6d44db5mr30308675e9.13.1746798034415;
        Fri, 09 May 2025 06:40:34 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7dc1sm71403735e9.34.2025.05.09.06.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:40:33 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>,
	linux-coco@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entries in TRUSTED SECURITY MODULE (TSM) INFRASTRUCTURE
Date: Fri,  9 May 2025 15:40:31 +0200
Message-ID: <20250509134031.70559-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XbiHB_u7QQIBeEPiu05ylO526_mVW9q4vVxE_jLAEbc_1746798035
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 7515f45c1652 ("coco/guest: Move shared guest CC infrastructure to
drivers/virt/coco/guest/") moves drivers/virt/coco/tsm.c to
drivers/virt/coco/guest/report.c, and adjusts the file entry in TRUSTED
SECURITY MODULE (TSM) INFRASTRUCTURE.

However, commit b9e22b35d459 ("tsm-mr: Add TVM Measurement Register
support") also touches that section, leading to some unintended state with
the two concurrent changes of these two commits, i.e., entry
drivers/virt/coco/tsm*.c is still in place, where it should have been
deleted. Note that the existing file entry drivers/virt/coco/tsm*.c is not
needed, as the files are after their renaming in drivers/virt/coco/guest/,
and there is already a file entry in this section for that directory.

Rectify this section appropriately.

Further, commit f6953f1f9ec4 ("tsm-mr: Add tsm-mr sample code") adds
example code to samples/tsm-mr/, but in the MAINTAINERS section, it refers
to the non-existing directory samples/tsm/. So, rectify that file entry to
the existing intended location as well.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dbdf02d6b0c..e8a21d6f89f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24991,9 +24991,8 @@ S:	Maintained
 F:	Documentation/ABI/testing/configfs-tsm-report
 F:	Documentation/driver-api/coco/
 F:	drivers/virt/coco/guest/
-F:	drivers/virt/coco/tsm*.c
 F:	include/linux/tsm*.h
-F:	samples/tsm/
+F:	samples/tsm-mr/
 
 TRUSTED SERVICES TEE DRIVER
 M:	Balint Dobszay <balint.dobszay@arm.com>
-- 
2.49.0

