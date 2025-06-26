Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269DE275858
	for <linux-coco@lists.linux.dev>; Thu, 26 Jun 2025 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938024; cv=none; b=ryv2fDuuqqVbdmPyek24REPKEScY6yQ/UVCR4xHpRYIOg/pHIVz2UD9mK2yN2BaBZFbxbuFV7JCv7iz/S0N5gKR6QlZyd1z0e0hzNt+0kMiLSdPsqeBIgsiOi59uGwhyu1DNFMaNMjCF0HV33nAv2LgMf1quIkfTwZ7gj8Ci33A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938024; c=relaxed/simple;
	bh=Qps63n6VHr2TF1qg8J/azImN8v1tL5pWN4otFfabiQM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Nj5U/Xh2fyC3Mx115GMtq49pG/vDVV2NCGLBAdEh/X77bq70OgFtnUeQedE4zET3ERj48rc927Mp6SSYtzCWGcrnxo6vlHr8kq6rt0ppkiMJ4GhujX4Agi1pW0xgFO1+S2T+SfvfbeF34ExSLwwk7n3QHmpUpAVPg8h1VRCUiuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ioJFjrnh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ioJFjrnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750938022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WGqGruK/Ok5w+j/7/kAjgBoq8Snbao57IS1pyLM1g9c=;
	b=ioJFjrnhcWhX4D8RAK8U/LtHVeopZCCI15GsYkHukv8FxMD24WWZy1ukEnfvXV39DL4Liz
	SYjihskqfZjZiH5jovw7f2LnvdoJuemDIwIo6bjP0lzVWsGIJV4KWC5iqt8cM85MHIF/4q
	T+amBYaGTJlnDPsCFCBY7tp+uDNFcCY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-b9q10bRkOAyYQPXmpWejYQ-1; Thu,
 26 Jun 2025 07:40:18 -0400
X-MC-Unique: b9q10bRkOAyYQPXmpWejYQ-1
X-Mimecast-MFC-AGG-ID: b9q10bRkOAyYQPXmpWejYQ_1750938018
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF416180028C;
	Thu, 26 Jun 2025 11:40:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.244])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B7BC19AC0F7;
	Thu, 26 Jun 2025 11:40:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E152818000B2; Thu, 26 Jun 2025 13:40:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 0/3] x86/sev: improve efi runtime code support.
Date: Thu, 26 Jun 2025 13:40:10 +0200
Message-ID: <20250626114014.373748-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

v4:
 - address review comments from Ingo.
v3:
 - pick up updates from Borislav
 - add vmpl check to sev_es_efi_map_ghcbs_caas
v2 changes:
 - rebase to latest master.
 - update error message (Dionna).
 - more details in the commit message (Borislav).

Gerd Hoffmann (3):
  x86/sev/vc: fix efi runtime instruction emulation
  x86/sev: fix error handling in sev_es_efi_map_ghcbs_caas()
  x86/sev: Let sev_es_efi_map_ghcbs() map the caa pages too

 arch/x86/include/asm/sev.h     |  4 ++--
 arch/x86/coco/sev/core.c       | 23 +++++++++++++++++++----
 arch/x86/coco/sev/vc-handle.c  |  9 ++++++++-
 arch/x86/platform/efi/efi_64.c |  4 ++--
 4 files changed, 31 insertions(+), 9 deletions(-)

-- 
2.50.0

