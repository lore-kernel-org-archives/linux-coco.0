Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1928323B624
	for <linux-coco@lists.linux.dev>; Thu, 26 Jun 2025 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750923766; cv=none; b=ZybKnU4Xn6rbKZFZGXDDGCOnMLZUpHIdL8GWsDc7d/+maue9BQUIb8tvWN/RwxEvGewh/nFmTkpDRLLq4talpJHKPwJEmwjuEBGlGbntjEtRbU1UFF4UM5OpR9DZMnOn4nWsYjTtSasD5+3qiN4nFjd1puYDXf3KNIvbBk0YTf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750923766; c=relaxed/simple;
	bh=s7YdkI4QlK26d5mLHH6uzqlBsCrWmulEcF2j7Q7vWfA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VFwoG3ITx08H8Spa/NNnoHraQs4aJm9bbeNeZe77hHJUyT92LVFIUon+Y1oa31QIVxr+YMxq9uiBnjM7eXtrkH+m5sDIigOoscM5dCD6oY0oD5vbD3xNh4PXEiSQNwJMW87RKsR1r99c1NaxrvTZQjsUv00lnLmW2gVAIZ22WmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nn8mFeWP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nn8mFeWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750923764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0pmCyCPqlBNto5bm/feF4YES01zWBFEQcdwqWlcvcao=;
	b=Nn8mFeWPaXXo1VqAyHAf+EIkQvtqtDLsMca026vV/+CDWmvO3ZwEGzmET+0iGaIk4QYlsU
	1qx3ohL4IkS99Nx1ABEuhveCVP4yRxaNh+da8DpPaS5ybJNUrqvfIvxLK51JpAKETpSxUa
	iTujtD4OwGfmrpQEDLizaT71f9JsKu0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-30-jfYVBSZWOK-tr1v2h7rMzQ-1; Thu,
 26 Jun 2025 03:42:40 -0400
X-MC-Unique: jfYVBSZWOK-tr1v2h7rMzQ-1
X-Mimecast-MFC-AGG-ID: jfYVBSZWOK-tr1v2h7rMzQ_1750923759
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7325A180028B;
	Thu, 26 Jun 2025 07:42:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.244])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA8DE196BADB;
	Thu, 26 Jun 2025 07:42:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1BB2518000B2; Thu, 26 Jun 2025 09:42:36 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 0/2] x86/sev: improve efi runtime code support.
Date: Thu, 26 Jun 2025 09:42:33 +0200
Message-ID: <20250626074236.307848-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

v3:
 - pick up updates from Borislav
 - add vmpl check to sev_es_efi_map_ghcbs_caas
v2 changes:
 - rebase to latest master.
 - update error message (Dionna).
 - more details in the commit message (Borislav).

Gerd Hoffmann (2):
  x86/sev/vc: fix efi runtime instruction emulation
  x86/sev: Let sev_es_efi_map_ghcbs() map the caa pages too

 arch/x86/include/asm/sev.h     |  4 ++--
 arch/x86/coco/sev/core.c       | 20 ++++++++++++++++++--
 arch/x86/coco/sev/vc-handle.c  |  8 +++++++-
 arch/x86/platform/efi/efi_64.c |  4 ++--
 4 files changed, 29 insertions(+), 7 deletions(-)

-- 
2.50.0

