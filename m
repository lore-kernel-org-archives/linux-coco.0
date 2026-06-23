Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C324363C46
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206166; cv=none; b=Xt8549j+eLqVFflZvs+7FehZliQQvQAjTrZcsQ+WVt7dOT0P1AtrKkVSynzEzjEvlw1TzhZVd8zv8XWspdlQKHloP3bGp5MlSKNnbmMqOcGC1QS5V/bihybhQUtZD2Q2VG1JVnI+bYyAdiE+eEwpWCYCxLfwIR2m0+cLFR7pZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206166; c=relaxed/simple;
	bh=xpsrDYFTmiRF4oI632s75CvkbiV8Eses+SRTA5q3r5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNtmGhugGUYrh0btZFeHGDJFcuk8Hr1j31Nk+LRO0UJasjsw5meseYv2ZrQEJmNk7NTRCNhegFtUrljtJrtc4+ppt9aDYl992ltFqCizTJD7qhNuwxhfQgrAGD6rTMWvDNbhl22tGx6VtaFlOcrwNqr9qvPe0GZvk/kuVE/mbo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af4fc500cc95bb0c16cd4e45.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:cc95:bb0c:16cd:4e45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2799F203D40;
	Tue, 23 Jun 2026 11:16:03 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: x86@kernel.org,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 2/4] kvm: sev: Unmap pages in correct order in sev_gmem_post_populate()
Date: Tue, 23 Jun 2026 11:15:54 +0200
Message-ID: <20260623091556.1500930-3-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623091556.1500930-1-joro@8bytes.org>
References: <20260623091556.1500930-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

The kmap_local() interface requires unmapping of pages in reverse
order of mapping.

Fixes: 2a62345b3052 ("KVM: guest_memfd: GUP source pages prior to populating guest memory")
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/sev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 41dcba5180ca..f09d15f68964 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2360,8 +2360,8 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 
 		memcpy(dst_vaddr, src_vaddr, PAGE_SIZE);
 
-		kunmap_local(src_vaddr);
 		kunmap_local(dst_vaddr);
+		kunmap_local(src_vaddr);
 	}
 
 	ret = rmp_make_private(pfn, gfn << PAGE_SHIFT, PG_LEVEL_4K,
-- 
2.53.0

