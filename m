Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69B803
	for <linux-coco@lists.linux.dev>; Fri,  4 Nov 2022 20:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667594586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QLfNlA1GCQXJ7R842kayw5n0l6+Ih1F81EObg8YgABk=;
	b=COL6YFt/X6csDd1wEc2nEHpPyvCGS/msPxEjtVk6vShlN9tz1cygf40x8infO3I53F+0vF
	2rVOlNYzA1/pg0YsxcuBrFEBULFf53RhW+Q2MK68GLeF8kUYhpqPEVmw2goCj/vy4KFddJ
	BIpaiz7OMY4IzzxRkJuLBXo0MJ5PCLU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-FrGLllYoPnO_hKdqC4zyTw-1; Fri, 04 Nov 2022 16:43:02 -0400
X-MC-Unique: FrGLllYoPnO_hKdqC4zyTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADAFC29AB41F;
	Fri,  4 Nov 2022 20:43:01 +0000 (UTC)
Received: from worklaptop.redhat.com (unknown [10.22.10.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6605D492B0D;
	Fri,  4 Nov 2022 20:43:01 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	bp@suse.de,
	Cole Robinson <crobinso@redhat.com>
Subject: [PATCH] virt: sev-guest: Add MODULE_ALIAS
Date: Fri,  4 Nov 2022 16:42:45 -0400
Message-Id: <ff480c5e688eb0a72a4db0a29c7b1bb54c45bfd4.1667594253.git.crobinso@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

This fixes driver autoloading

Fixes: fce96cf04430 ("virt: Add SEV-SNP guest driver")
Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 drivers/virt/coco/sev-guest/sev-guest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index f422f9c58ba7..4c426dbcd166 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -744,3 +744,4 @@ MODULE_AUTHOR("Brijesh Singh <brijesh.singh@amd.com>");
 MODULE_LICENSE("GPL");
 MODULE_VERSION("1.0.0");
 MODULE_DESCRIPTION("AMD SEV Guest Driver");
+MODULE_ALIAS("platform:sev-guest");
-- 
2.37.3

