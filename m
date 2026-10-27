Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069823;
	b=VR1eZZyyhXJD3N2cUVvIBP3KztM6udxiXmNg7KIoIAz4dQVhJK023n1+8FZVp/zAv8II
	 1i53VpQRlRztQ2PVY/wNFSxMx9YabBIKK8SHjKGkS8JNeen0+BUnatnNoI2DGIpmLG3LO
	 NUKjeYJCvaqDGF91PGqq1iXcfKdt46EUtw8OHQ4xBLmUKFMMNeTWjg+BMVm+Jr9gW1yTh
	 2JPToYnSbfPC4+iYALOJf+QAApzf/BDeF4uOc1E1LUhlxFEb58pu36R4of72pjVRRkiNK
	 KXKmmj0YQS39EgachDdFcspy1+BtGYYksojvle+brmQhvLQYmVH++aihpedZ/h+13dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0dhD+kOKqUQOH4NXaqpvq7snu+OHZ+U62/aV76eABXw=;
	b=1dSf5xNadE5Tj1iYasv8PoAJf8vxXlW3NbNkNfle94FbvBW4V9iiHtCbWxX+TTpG6ufA
	 Ad7Hc0xHBRgzCWUJw7+BCQlK/D/bZl7CVB65r6keUMMwZSJ9oG/TfC4Zw6U0bQ97iecL/
	 g+Dm9crJrduX4UQkpnLViaHoHXAHHzzmuECIAGl+SpBqAgHzMSr/blmUOyTYpS5JEGLSA
	 ThFnyMAOc5DUmrpX8VE7KOS3+kDxHBq9jP4qBUTpjYgCEvDmM+RiTT/XQLg92VQ6w7Pl2
	 CVEOV3+NzVcPv2LMXssjmaTGf+fY6MPP98EKr/eOTQfUBAjCssYG3DWOheof802J8tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JymU9vxZ;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187FE60A381F
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 02:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187FE60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JymU9vxZ
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-540537f959fso5873817b6e.0
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 19:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069822; x=1793674622; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dhD+kOKqUQOH4NXaqpvq7snu+OHZ+U62/aV76eABXw=;
        b=JymU9vxZ5d2BzUGP9POXyuRxZGRn3DxifwQvlKwxe4+IPRa/LKgy1ec/JsdJR2TbPM
         VCexoGlBKd/YD9yOsFlbZvAKmKr+VUczGwswa/7aFot7SRIMbOzNtuLGoVPdQYIukioC
         mDPyN8ya2YQSp4YBbIX+wPu2zc8vgERstJ6+Q40yxmFMpPSMxqNZ7v/HYpOExM/5adXz
         a6kEqV5zRzRDX46T9hwDDUangIvYQVeb8csjO+a1M4u2Zaj/vFziTyTu1xxx5PopgtZI
         cmzqBPAjETvBqVRKjHWrjh9RPVVjN1daOkyQ4he2h+JZbL1RrrhQWnrdTbR6uPAsnBBs
         05jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069822; x=1793674622;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dhD+kOKqUQOH4NXaqpvq7snu+OHZ+U62/aV76eABXw=;
        b=Gvd9LxieU9H3seuww7CyrctaxbBPjCSL1c/FYLA0UWfead9hrC2kJzxQ5W2rXLQvdE
         beAQAhTvEjcls8bbeXGx9x+xq5LmPqyn91ow8x8AXyoCeCI9c/8eQfxQNxr09niPNGWA
         pLoHRCxrvw+sKc84StsYqhrItrJRnBtEGU90wEgmPDhRSpWthpk0CnyY1Agt+pf71Lci
         eNqJRcU1mmUaRg+aFu5ADZPqBvHbUniriIrMEfF2ATyFHORQ50IHz+lP8aP4D9iDq6AF
         cnAa2ReGRnIxLuyNOOWAZwbv/8LD9NhBCJcGQnkl4XAjxCvkQrPQxtIcfr5UQDX0E3+I
         2JLg==
X-Forwarded-Encrypted: i=1; AKwUvBwEhEpUrpu8sSLuhGJuU4J7n0XGX9SP/POZurs64Z8qQnf/ZV5Ls1iGcQ38+hJwNWMw1PICZPwLEoex@lists.linux.dev
X-Gm-Message-State: AFq9FYLIZqWtRIwhRD0ZK8d0pecS4QPoGVfXtL7AQjFJ+AtbeYDzUr/8
	0g+Ocl8GCwrV78cw3RwKu9y7xNuJPwpbZuZ/Y30sAZTAkDc5lW/LL5KV6MDgBUVcOjbGeuemt3G
	w/ki3kwSi+QfVUJXp1fPoe8NsobFcYg+kGQ==
X-Received: from jacnq31-n1.prod.google.com ([2002:a05:6638:e21f:10b0:61c:8e68:e95d])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c1c4:b0:4c7:7ce5:a32a with SMTP id 5614622812f47-55bfff7e470mr5562520b6e.4.1793069821819;
 Mon, 26 Oct 2026 19:57:01 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:56:16 +0000
In-Reply-To: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027025616.1632690-14-kevinloughlin@google.com>
Subject: [PATCH 13/13] virtio_balloon: enforce ACCESS_PLATFORM in CoCo
From: Kevin Loughlin <kevinloughlin@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>
Cc: virtualization@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sidharth Telang <sidtelang@google.com>, Punit Salian <psalian@google.com>, 
	Peter Gonda <pgonda@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Jacky Li <jackyli@google.com>, Steve Rutherford <srutherford@google.com>, 
	David Skidmore <davidskidmore@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

In confidential computing environments (CC_ATTR_GUEST_MEM_ENCRYPT),
virtio devices require VIRTIO_F_ACCESS_PLATFORM to negotiate restricted
memory access and DMA bounce buffering for virtqueue rings and
metadata buffers.

Currently, virtballoon_validate() unconditionally clears
VIRTIO_F_ACCESS_PLATFORM, causing virtio_features_ok() to reject probing
the balloon device (-ENODEV) when restricted memory access is active.

Preserve VIRTIO_F_ACCESS_PLATFORM in virtballoon_validate() when
CC_ATTR_GUEST_MEM_ENCRYPT is active, clear VIRTIO_BALLOON_F_FREE_PAGE_HINT
in CoCo since free_page_vq maps MAX_PAGE_ORDER blocks through standard DMA
ops without unaccepting them. Reject probing (-ENODEV) on CoCo
platforms where balloon page state transitions are unsupported.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 drivers/virtio/virtio_balloon.c | 36 ++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 217431e75751..ae011636c07f 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -1311,6 +1311,14 @@ static int virtballoon_restore(struct virtio_device *vdev)
 }
 #endif
 
+static bool virtballoon_cc_supported(void)
+{
+	if (cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+		return has_unaccepted_memory();
+
+	return cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT);
+}
+
 static int virtballoon_validate(struct virtio_device *vdev)
 {
 	/*
@@ -1318,7 +1326,17 @@ static int virtballoon_validate(struct virtio_device *vdev)
 	 * initialized. If we cannot do that then we should disable
 	 * page reporting as it could potentially change the contents
 	 * of our free pages.
+	 *
+	 * In encrypted guests without unaccepted memory (e.g. SEV-ES), the
+	 * hypervisor cannot populate discarded pages with guest-encrypted
+	 * poison/zero values and the guest does not re-initialize reported
+	 * pages on return. Clear VIRTIO_BALLOON_F_PAGE_POISON so reporting
+	 * is disabled when init_on_free or page_poison is active.
 	 */
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
+	    !has_unaccepted_memory())
+		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
+
 	if (!want_init_on_free() && !page_poisoning_enabled_static())
 		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
 	else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
@@ -1329,7 +1347,23 @@ static int virtballoon_validate(struct virtio_device *vdev)
 	 * virtqueue_add during page reporting.
 	 */
 	__virtio_clear_bit(vdev, VIRTIO_RING_F_INDIRECT_DESC);
-	__virtio_clear_bit(vdev, VIRTIO_F_ACCESS_PLATFORM);
+
+	/*
+	 * The balloon bypasses the DMA API for page addresses and cannot
+	 * support a physical or virtual IOMMU on non-CoCo guests. In CoCo
+	 * guests, VIRTIO_F_ACCESS_PLATFORM is required for bounce-buffering
+	 * virtqueue rings and metadata. Disable free page hinting in CoCo
+	 * guests as free_page_vq maps MAX_PAGE_ORDER blocks through standard
+	 * DMA ops, and reject probing on CoCo platforms where balloon page
+	 * state transitions are not supported.
+	 */
+	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
+		__virtio_clear_bit(vdev, VIRTIO_F_ACCESS_PLATFORM);
+	} else {
+		if (!virtballoon_cc_supported())
+			return -ENODEV;
+		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT);
+	}
 	return 0;
 }
 
-- 
2.56.0.307.g5fe7bd680c-goog

