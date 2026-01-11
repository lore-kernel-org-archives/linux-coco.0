Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com [136.143.188.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E030AACD
	for <linux-coco@lists.linux.dev>; Sun, 11 Jan 2026 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768118840; cv=pass; b=Fz6RXyjMsHjmsMyXYstdloJXM9hBSHAHbBLsxTivvYD2y0cVsGW5g2C3XiWNvpfEmCjxxt1lb/I0Wga9MqyhMRHdo+p0hSyHm+2PbXCYwX3RZqfyxVgk2yhl971q8AMCKIAPNFpuHkv+Sjr1xsFIoSujbr9t3iyQTU+fyVq1cbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768118840; c=relaxed/simple;
	bh=2m1xKvGvnkr787OxH/73OG/B/kR3BOrrl8Obx2OlRKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lWTSFT3vAQY5EAyqnIjokC+PRM7xiXhbQXlJ7OK84MCal9CegZ1rKR+jIVcghKnjJkez2kaj174KoQE/ZWSWcRvyBYvbGcUGknWgR1KwMrHSQALtCJsEzark10qPbOE1DBZyy+YIj7j09aVpWIZCPUXcKf2Yf0XrNQq9SewTiBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b=Gv4OnBaX; arc=pass smtp.client-ip=136.143.188.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b="Gv4OnBaX"
ARC-Seal: i=1; a=rsa-sha256; t=1768118837; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m982K58XhxL8/JDiNx2XdWhzqRR4cCR8WzeIMflNg6qTCuBMh9pn19O1kRL69MeXB+btYZ3V8qtJkZxa3o1m3ihXJnO3fX2GiAemHu/O7lYf5IVhL3FvDbi5jNbwkxL2SLsodynd1hzm6EB0h6ysJrwGAhycJzVto2nLhuNwewQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768118837; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AhXRgb6SBeNXL+K6/f8ppZuQNNLD9KnvuKFxLKnj5Rw=; 
	b=oLVelxMNNwpJwcaJM7/Er0CD6b2dIVC8bnTU4nfgHpMMSMouocXlFu3rOlJ9WaeFapT0Akld0IRHc/8oSii+sJgbyhSBeA0aqFCslrKFk++s8Y3U5mF+1AGIZML0gsnKBftobnMbcM5oZIf1TJ8Pn0m9TW/8TdcaD8pGRk6WOtM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=ming.li@zohomail.com;
	dmarc=pass header.from=<ming.li@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768118837;
	s=zm2022; d=zohomail.com; i=ming.li@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
	bh=AhXRgb6SBeNXL+K6/f8ppZuQNNLD9KnvuKFxLKnj5Rw=;
	b=Gv4OnBaX0Kw1Rj5iQmKuT0GaYRBOF52H0J+Rf/6He48u7l2lJb9T9+6B9ZUjG3Ys
	aHEChc31r4gseXJsoUYl+xBobGzFs1HeQt0IWy0TnHpESTccgKR618E+GH/3AbxKVhl
	SSOsxPtT7DhlfW3SDP73i7hsN5rHIQA8HMuY7eDE=
Received: by mx.zohomail.com with SMTPS id 1768118834795881.4056456748672;
	Sun, 11 Jan 2026 00:07:14 -0800 (PST)
From: Li Ming <ming.li@zohomail.com>
To: dan.j.williams@intel.com
Cc: linux-pci@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Li Ming <ming.li@zohomail.com>
Subject: [PATCH 1/1] PCI/IDE: Fix using wrong VF ID for RID range calculation
Date: Sun, 11 Jan 2026 16:06:31 +0800
Message-Id: <20260111080631.506487-1-ming.li@zohomail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112276a6de86c53343c88ba28bfb80000d2a041fc2cd5e7c1284e1a4eb0842d8a656c488e8b5e7baea8:zu08011227a46711a3e3dc0b0eebf68b9f0000688efb6d724a0eb0e1b38199ff2400d162c8361e4c43f44671:rf08011232eed5501723d7abbd35169f420000f21a98e211a40aafa6cda30b6efff7c07521edf30f3a45bdd919609a4dd05dab61b93c7f:ZohoMail
X-ZohoMailClient: External

When allocate a new IDE stream for a pci device in SR-IOV case, the RID
range of the new IDE stream should cover all VFs of the device. VF id
range of a pci device is [0 - (num_VFs - 1)], so should use (num_VFs - )
as the last VF's ID.

Fixes: 1e4d2ff3ae45 ("PCI/IDE: Add IDE establishment helpers")
Signed-off-by: Li Ming <ming.li@zohomail.com>
---
 drivers/pci/ide.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/ide.c b/drivers/pci/ide.c
index 26f7cc94ec31..9629f3ceb213 100644
--- a/drivers/pci/ide.c
+++ b/drivers/pci/ide.c
@@ -283,8 +283,8 @@ struct pci_ide *pci_ide_stream_alloc(struct pci_dev *pdev)
 	/* for SR-IOV case, cover all VFs */
 	num_vf = pci_num_vf(pdev);
 	if (num_vf)
-		rid_end = PCI_DEVID(pci_iov_virtfn_bus(pdev, num_vf),
-				    pci_iov_virtfn_devfn(pdev, num_vf));
+		rid_end = PCI_DEVID(pci_iov_virtfn_bus(pdev, num_vf - 1),
+				    pci_iov_virtfn_devfn(pdev, num_vf - 1));
 	else
 		rid_end = pci_dev_id(pdev);
 
-- 
2.34.1

