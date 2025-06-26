Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD35927586C
	for <linux-coco@lists.linux.dev>; Thu, 26 Jun 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938029; cv=none; b=g/omibC7DFKkvi7KMEyx9nYYpoYapTtDKJYqXHeMOwjlJ01TV9cddnXw11FO4NiuMrlBktka6pTCb97R7PoObOMJyqC1twDYWvv24+iLQ3ERbs9OAoGZkDRGFbvq4IB+Kz8AD2Kty/CoPSZeEKCm2CLnFHYnsvCFfSPI1+kaOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938029; c=relaxed/simple;
	bh=tk5jvXgkGUQmLq3N1J+1o3Y+WenHHrJn+2FmTp/OOIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgh+K5PpT7abUZJdh++Rt3EY/3w75hEFuQy5iZ03HCtE8sUh94vJcyP4zC0zBzAGM/BxUTg+oQ0MBisVubKElXPpYU0nO5GwAmWLBL+Ywxb8tZWD/X7RJ9oAO17p7GyrVNO6TGMM4La8Ywdn/qp//WXIcm2Bl+cVpsW6qxs33Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBYfnNJs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBYfnNJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750938026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0A7ZioTln4LPh22RUCIFeccixapHl/G2T0iIAftPGS0=;
	b=NBYfnNJsIzu9sKR4fkREV5NuUc97sQ0OgS16dE7ANicWgmsEcZkeO2cgsrVEGaF4y+BrVA
	95nDoMBDtBZB0IEboAOgyxgBUVzjcLjM1nWRIR/ZBJU/ATCXb/eGg1FYfwzlv67+Qjxr0X
	bxdowBu+Lw7o+Nqk8aJjqNF5CFHDW34=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-157-xS1XLl4ONjCv1ZRol4yNmQ-1; Thu,
 26 Jun 2025 07:40:22 -0400
X-MC-Unique: xS1XLl4ONjCv1ZRol4yNmQ-1
X-Mimecast-MFC-AGG-ID: xS1XLl4ONjCv1ZRol4yNmQ_1750938021
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 19A8C1800290;
	Thu, 26 Jun 2025 11:40:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.244])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E1A230002C0;
	Thu, 26 Jun 2025 11:40:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5099B180078E; Thu, 26 Jun 2025 13:40:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH v4 2/3] x86/sev: fix error handling in sev_es_efi_map_ghcbs_caas()
Date: Thu, 26 Jun 2025 13:40:12 +0200
Message-ID: <20250626114014.373748-3-kraxel@redhat.com>
In-Reply-To: <20250626114014.373748-1-kraxel@redhat.com>
References: <20250626114014.373748-1-kraxel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Pass up error codes from kernel_map_pages_in_pgd() instead of
returning '1' on failure.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 arch/x86/coco/sev/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b6db4e0b936b..3de8c3d2b55d 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1050,6 +1050,7 @@ int __init sev_es_efi_map_ghcbs(pgd_t *pgd)
 {
 	struct sev_es_runtime_data *data;
 	unsigned long address, pflags;
+	int retval;
 	int cpu;
 	u64 pfn;
 
@@ -1064,8 +1065,9 @@ int __init sev_es_efi_map_ghcbs(pgd_t *pgd)
 		address = __pa(&data->ghcb_page);
 		pfn = address >> PAGE_SHIFT;
 
-		if (kernel_map_pages_in_pgd(pgd, pfn, address, 1, pflags))
-			return 1;
+		retval = kernel_map_pages_in_pgd(pgd, pfn, address, 1, pflags);
+		if (retval != 0)
+			return retval;
 	}
 
 	return 0;
-- 
2.50.0

