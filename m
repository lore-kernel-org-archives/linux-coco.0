Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470506;
	b=ZVEbJXUMMziAMLLXuq8JGV1aG0a75eROuBojaNnUIbfahK7WnLWDjTGpnswOBUb6e6h+
	 0NlS/DxVQ8veo4dMCUiD7rv3gjrYqg2khNJ/f0ciCCEY0E7VKfZALX3BDO5wxLN+rH361
	 T1U85dZIX/pAq2VvnyyrtCZC97izAb1Xdk9l8cO/QzT2/Kr0J4reu7VhEi5y9V2nUTfkA
	 FGZA0dGJqDvNZKEW70ucNuliNdaqkp0fPyfdcwNteffGawtpCuKs2rDH0Up92TUSLakc3
	 db82vufTwhhgmaIQjaPVeXY5aJGf2hTMUtggQJ+witA3Ipxga2SUBI7W7ZdXgDKHnQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470506;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=WjKO0NSg8lPOk5mK3slLkPv+yGSOHVDOie0hk9bAwXk=;
	b=fz2BVLrUhDZFka+mfEj3z2v+uxnSrQbpPS6YUJqhsZTI+FXArpmE0KHzMm8HSZ7w77UF
	 V2hgKvSe0/+KEgHhTKg7U1GZatdZqrhgJQSdj2O/e78mROQI5H1Z0GtgJqZ2itPyPT+2S
	 e99lKL0czQmTg6YRvzgYkUsOj0UxqjWVaTFGhsOB0cybPd1PqG4fyrA/FRBLnLSHiZHGr
	 YjZ/LtUVB4Fp9MIayfgRAAaupDtUSoAVKBV/DXSyceea4edoYSfqMWYaoTiOxZhSbEAYg
	 467QgBa/zT0duGXLSBs8cBDg/mKOIMDnJQzWpAXbjFxRlADtxZG4utj8BnPQX2S5S1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=MlW8fBiq;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF75A606A321
	for <linux-coco@lists.linux.dev>; Thu, 12 Nov 2026 08:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF75A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=MlW8fBiq
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jQCX35103zKnm3;
	Thu, 12 Nov 2026 09:01:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794470499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WjKO0NSg8lPOk5mK3slLkPv+yGSOHVDOie0hk9bAwXk=;
	b=MlW8fBiq3WE3Ghcf5Br1fxuxBbOzaTSe7hAgdjhKDsPaMMsg/8Cc7dtxsHGhncE/woOMIa
	6xe+ZY0J9egGhM70fhIF31eIfrz+cJfa8MPdn7ghKyR2Mt4Hc1NQkkE0JndUMsv+AekhWy
	srUPYZ6itRYyTrrz3Is7i1Dz3zkFGqcx55DysLVyaPr29NdUUIGakcmqgp05DIjl//qZuH
	UvBhW9QBZG3tzjnZkr/DehKmRhfNmvbLU3m9G02Pzxx5fdjZgjKMzv6wONgSFVl5HL9tMp
	ixn79j3qNRyWBozdBY5gKbyUivyx+cGXEcqRVOH+oaCdFZdTZgRUKII4MSv3Jw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/virt/tdx: remove kernel-doc syntax from comment
Date: Wed, 11 Nov 2026 22:45:40 +0100
Message-ID: <20261111214540.681690-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: js4ooj96n6zf4zrf87697jkz5j5f76n4
X-MBO-RS-ID: 03bd02e19382c9c5b13

Remove kernel-doc syntax form multiline comment, fixing:
  $ ./scripts/kernel-doc --none arch/x86/virt/vmx/tdx/tdx.c
  Warning: arch/x86/virt/vmx/tdx/tdx.c:123 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   * Enable VMXON and then do one-time TDX module per-cpu initialization SEAMCALL

Fixes: 165e77353831 ("KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init")
Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 arch/x86/virt/vmx/tdx/tdx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 680e5178a8..4ebbd7d059 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -120,7 +120,7 @@ static int try_init_module_global(void)
 	return ret;
 }
 
-/**
+/*
  * Enable VMXON and then do one-time TDX module per-cpu initialization SEAMCALL
  * (and TDX module global initialization SEAMCALL if not done) on local cpu to
  * make this cpu be ready to run any other SEAMCALLs.
-- 
2.56.0

