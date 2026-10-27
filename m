Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069820;
	b=akI4g3PeoP5IWxYy7wSvCA37zeLq2TVgiXwrsnTz3gtos8W0acZuE4YWvFZOWS9xcfaI
	 56QeQoSOPmNDqbauzO87XhPyocV2wYaqqpCHVQnTK+Hf0AMoVRT7InTppfRIcU37qMjTn
	 q6Eq/Znebs+qqh9GTPFI/m/CuiwgUzxiDIFejXypzKS3b6sbqrnCSbSe12TR1supxsAzV
	 17WLNKTIw3tdXyqa1+4Cy5O2vnqkQserrazuE/3jzQn0lDHbHs7DUWmub9uvDwbyqA2Cc
	 0CWiIKkMwUiWRmv5Elc5D/yaNCsDiM3BhUi3RGgvtoz2d48+ObQGWHYb5tFrO3d2Z9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=j+w6uCJntt3i4Wr5zbmAS2QfetxR0x7f970do0XgFlo=;
	b=iV6+E9UDFR8uGB4vBPs/CoEYCb61QNE1GQpNFL8OYd89nSGQ98Th5p7Cln2jZacA2i7M
	 Xzgq1nPExvNsgkbJdBZypcAk0Smz3igJhc8XSnaCxk8elCqijMZ5B32Wiiv5cU5pva6w9
	 4fZRwQBKmQRFywBM6VAm7kxhivjE8B5Znl/JFwnTIOWZ8IQDdpIsSMpPVvQNur9vnIufS
	 VRiNQHt4upcRBL/eVi9OY5T90ZIl6KODh1aWrjXrzapFewiO207260KQmQI0tJ1ekSEMu
	 Z6L+BsCXORa79ivNFYCMDYEpPtK/vx4RfE+8Hks04HjwR6nUGSGeU7tUpK+/QyXl/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pmF+WlNF;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A336F60A3807
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 02:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A336F60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pmF+WlNF
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc89e86e9eso5333793b6e.3
        for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 19:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069819; x=1793674619; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+w6uCJntt3i4Wr5zbmAS2QfetxR0x7f970do0XgFlo=;
        b=pmF+WlNFWTR8E0DOnIlPkyPyPS7oMB74lkO5LMECdxdeQnyjHf3n8pRbAQKWBrBD6k
         vK4raj7cGCwKuGlKaoOpbNmqTJ0MJ4txfyfa7zKA57vH1kRQJHppWA2o5OkL3z4BoL9f
         cufUUlq1VU4ib1C4fegiv6Oyl6kWQoxLWkDQsjmptq2o3+NEX/Ncvo9LYu++g6IJED3B
         ZY3EtvvagGqJmHwQ8W29wuRHVjg749O38QJFFheHGkBzIs6+251rdTraEpqg2yfZKNyb
         PNd+mIJxVdMQBe6ipeszh1A29PW2pHV/L6hMIel4PVb1QJFjxspXxGVcmIaXgQIOpomi
         rkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069819; x=1793674619;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+w6uCJntt3i4Wr5zbmAS2QfetxR0x7f970do0XgFlo=;
        b=0PKXITu/8ZCSCmjaTGva0w2yoG0pWFWmQzo3be9V9QlSX39Yhtx8KiUksXgyrZFhjH
         08YAl++VPM6XR2ghXpIxC87tSsq5zQAqDvsArlFSRHE6Zhcn3z/0X1j6U0/k4VQUdpxL
         YtKYzqeEXK2WfudbAoNBx+rhIh5qtWCkO1JMzD0DWAfP2En2fuJgHVt0F75ElM8SGjqN
         QLCUOZYALNtQMZvjwhG+5Us8sSADL3T+aZaG5frkrATt71BJHzBCjOMdgUjAmhCZ0o2Y
         3PT8YuSDiDwlPU5Zgnvq0B6xsMDxy+o2NDdTF1BwKh/GnUss3m+QZyDJ5NzJfyeVqNRo
         As/w==
X-Forwarded-Encrypted: i=1; AKwUvBxet0YGipQA/OyYTHAPWlI4MGrppsOIrblJOfyWe1Z6nuuc3zLVC9yLIz6AmPpWIhDfnFIjhvw9rMdV@lists.linux.dev
X-Gm-Message-State: AFq9FYLBZlxJRZoIWUf47qXJBz8ZHTqkU8WDYnAJaObrtiu4bW4eq7Kl
	NGCe8MigEXFJc+mMQSwJf8BKbJoypJiIugYHcaU/nHlHUeMP18FdYlkjfsXjfZt/RgRqT10NDfx
	vsMNhGmTS7bbOwW8N+XXtIYvjyy2jIc9lxw==
X-Received: from ioo6-n2.prod.google.com ([2002:a05:6602:8646:20b0:9c7:5a22:a4be])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1b2b:b0:4f4:73a9:f853 with SMTP id 5614622812f47-55bfff91bbdmr5294378b6e.1.1793069818445;
 Mon, 26 Oct 2026 19:56:58 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:56:14 +0000
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
Message-ID: <20261027025616.1632690-12-kevinloughlin@google.com>
Subject: [PATCH 11/13] virtio_balloon: unaccept free reporting ranges
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

In confidential computing guests with dynamic unaccepted memory
transitions, configure the free page reporting order to
unaccepted_memory_order(). Invoke mark_memory_unaccepted() on each
scatterlist range in virtballoon_free_page_report() before adding the
scatterlist to reporting_vq and kicking the host.

Unaccepting the pages prior to virtqueue_add_inbuf() and virtqueue_kick()
guarantees that the guest finishes PVALIDATE(validate=false) before the
host VMM can observe the reporting request in the virtqueue ring and
punch a hole in guest_memfd, eliminating any race where the guest
re-allocates and re-accepts a page before a deferred host hole-punch
executes.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 drivers/virtio/virtio_balloon.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index d162c162b496..e10bd792ef7c 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -213,7 +213,26 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
 	struct virtio_balloon *vb =
 		container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
 	struct virtqueue *vq = vb->reporting_vq;
-	unsigned int unused, err;
+	unsigned int unused;
+	int err;
+
+	if (virtballoon_cc_needs_state_transition()) {
+		unsigned long unit_size = PAGE_SIZE << unaccepted_memory_order();
+		struct scatterlist *sgl;
+		unsigned int i;
+
+		for_each_sg(sg, sgl, nents, i) {
+			if (WARN_ON_ONCE(!IS_ALIGNED(sg_phys(sgl), unit_size) ||
+					 !IS_ALIGNED(sgl->length, unit_size)))
+				return -EINVAL;
+		}
+		for_each_sg(sg, sgl, nents, i) {
+			err = mark_memory_unaccepted(sg_phys(sgl), sgl->length);
+			if (err)
+				return err;
+			cond_resched();
+		}
+	}
 
 	/* We should always be able to add these buffers to an empty queue. */
 	err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT);
@@ -1142,8 +1161,11 @@ static int virtballoon_probe(struct virtio_device *vdev)
 		 * host's base page size. However, it needs more work to report
 		 * that value. The hard-coded order would be fine currently.
 		 */
+		if (virtballoon_cc_needs_state_transition())
+			vb->pr_dev_info.order = unaccepted_memory_order();
 #if defined(CONFIG_ARM64) && defined(CONFIG_ARM64_64K_PAGES)
-		vb->pr_dev_info.order = 5;
+		else
+			vb->pr_dev_info.order = 5;
 #endif
 
 		vb->pr_dev_info.capacity = capacity;
-- 
2.56.0.307.g5fe7bd680c-goog

