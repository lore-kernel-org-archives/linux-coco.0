Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815667;
	b=vGs8jsmIDegBTqDvV0hI+5I02B9zfvqmbdWb6HIH2+u4BEXprSo6JrMboVhkX46shQEk
	 SpBTAAMnMkrAPTxsBX/LnbvZ+Slh1BOYfr4L0ORPEgVhQ6tMc6982IItoGpfPrhWRwZNO
	 /6nFdcdJhc5D7D6KhzvUGsFOTVWJjtomlkjGe8f6EqvPJClWua+8Vdt00xmpLvxKY8lSp
	 1dYGiYEgIpwtwaIhXQ6snIqAG9SmXisY4qKnp9zpWU3sqkVi/dj1NbTRvI1rAxWrglnUJ
	 2GFfI1PREL0+gTMG83/gMLOkCfKOjU6m/DXf5ImrUelIQS+4dG2bcq0BgL8fyUhobjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815667;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LywBLxtl1giqNyr+dSyOcTUXHKAQEtA/lEr7V3fev2s=;
	b=0Jt5Y9Jgu8mcJFc06tNR7Y0FDFvUWLZZZKyM7lzcf7eiwO7NLVCIxyZo9qf32QfwJwEO
	 Xf/irVQWt8CjIhgHk84sUKpmXF48UEv2opX2pTVzI9bx7rFKOlBoPqGkS6XlwJ3SQMiN4
	 hnfyc44+MVvWng/q56iklVbpfTuESHyE8cswhj/K0PhO3Cfr9qpO9Gn5VbiEeL2MuccbV
	 uv60NCmh7Hl588bTLkCaI4BUx7qGyNuCNQnII4v7Yp0uJOMZDDQsGjwo9gxXjMFdB/6T1
	 iEnJsZSpz05io5PS5t8hwM4Nyk3W+lOnHm8hXNGPjTizftL7n/ciyuSNa+qXFEK/aAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LESOh5dw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183A2606A323
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LESOh5dw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B931F000C4;
	Mon, 16 Nov 2026 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794815666;
	bh=LywBLxtl1giqNyr+dSyOcTUXHKAQEtA/lEr7V3fev2s=;
	h=From:To:Cc:Subject:Date;
	b=LESOh5dw8JAJ7Usmx3772jeRfXVYHCLzgMVdgmqxuhQv6QwXQLTySdlWazBKyUPMf
	 NqS1Xe7k176XXClejNLWxD7G3bnSVee5R8i06M/dS/moj4ikkzvjHlyFyDGE9iKoa1
	 icrGS2/DNd1+r8AmBBo3GeM8T7SEYnzeAwof3Rlk2E9XUs+2HLDXik8ssLGu92dxYW
	 It5iEyUKN87xrIPkf8MJlB90PjKV2fCW29uXw3Z/CfTPm6bWwbUe0p5Q7SJUFF7TRn
	 ciPwZrENEIRJZPWeEDFswtrwnmyLb+x63+72CoCOv+q89NQV5mIanC5ulAXVrcIjeS
	 dgW7Eb0ZkeZWg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/2] MAINTAINERS: Update TSM file coverage and repository
Date: Mon, 16 Nov 2026 13:24:19 +0530
Message-ID: <20261116075420.76205-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
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

Add drivers/virt/coco/tsm-core.c and git repository to the TSM entry.

Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: linux-coco@lists.linux.dev
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..720fe907885b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28545,11 +28545,13 @@ M:	Jason Gunthorpe <jgg@nvidia.com>
 R:	Lukas Wunner <lukas@wunner.de>
 L:	linux-coco@lists.linux.dev
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git
 F:	Documentation/ABI/testing/configfs-tsm-report
 F:	Documentation/driver-api/coco/
 F:	Documentation/driver-api/pci/tsm.rst
 F:	drivers/pci/tsm.c
 F:	drivers/virt/coco/guest/
+F:	drivers/virt/coco/tsm-core.c
 F:	include/linux/*tsm*.h
 F:	samples/tsm-mr/
 

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

