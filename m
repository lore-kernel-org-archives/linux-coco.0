Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B23168EF
	for <linux-coco@lists.linux.dev>; Sat,  5 Sep 2026 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600590; cv=none; b=IlEqgp3BKzAtKyJC4kBmI/XqeOCU1GeUzvixbtoV40yzRKbKTypKOXqXJMcaf0fV6QnZekqPfc6kSqdZd1animbKO9Kad0yaYODS4gIXPa0gy2j0bDPjHGIh7nTF6Gq63ZmC+TrbqHxwBOJGu+kSSot03Ou2ZAlh8F5qkLASMO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600590; c=relaxed/simple;
	bh=88pQhMM6i98/F6e6rKnGntWh1ykdqLFjTXT+4nkQNyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qmN+dLy3sCMVItbS3zrhvY2g4zET+YiDhIgHOkvpTg9WK/Nxz3EZKxzEpmlTRiVyYJUqIYXO68LaXRNl12Fsq4E54KiTRxvh8rsg+xsJG9Fm+2R1NEaL7Ky3OGMdbQXOKVNmf1OCrr3tCPxkM8F+vA2CfQXsKwEfxQbg8w9yPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2AJxme4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2AJxme4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e257a23aso1278870f8f.0
        for <linux-coco@lists.linux.dev>; Sat, 05 Sep 2026 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788600586; x=1789205386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIISoak4xvpvOrDQr99dp5Bs6ZVGQZh7PBWMviZBV80=;
        b=W2AJxme4doxlrYtbIOGEmVLQ/gS1RdiooToezRnxQLIs325bPhMrilNxuiXZ36Y9jv
         t/HQQeYnwjLY85Rcikrn3waGaFQD9J8n5wg5U+mDfmAV8qr68IEbsitxEeutunk+wqpV
         Hq9bDDG+JMcIPPPLHzQAVk2XDuyDCKzWKXkMwmfqZcLz6cpFFH6x/bNJ4pVO4DRmXJmQ
         BLB6kNZzQn/Tzd6D9zX/mlm9cRGluM1NB2JQD/2r6FROiISNMn2+JWVcyuI15+NTc5Pi
         luraTNMDyOeWhTXhHaHhABSYws71D3gx6kA0Zj6MRKJuNAZ2CGO+Wxmb44jQl2hYQaUI
         VQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788600586; x=1789205386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIISoak4xvpvOrDQr99dp5Bs6ZVGQZh7PBWMviZBV80=;
        b=A/vDfyXofAizzQaoQF9Mmldhi4YIQ2y7pBYOtM4712gAIzW8J6bE2Kyeb5FDOTtzg1
         AgOmKTnInm6EhRuUg/2Vx5FYcxWdOMwOTkAh0RWu7y9UNREpuhmPdRZudQQD6AXmsouw
         xOdvoffdWqaTHVfuCQNNTns5Cpct7Idh3vRY8qyoF1Pz0rUN+7xQFze4z3fLNNhKQ041
         5EtT65XMLdrlUN8x3LEJI4MM3qv/4fRU/hHDH2KcPitz9UzIbWp/8tueebMi5Hu/ONsS
         BhyE3/Yj6iuhqaWzoK6+2heg+aDP50jpJ9IkCurw/A32NDYQSE7W8Pb7HNK2G0Gm4nYL
         Skgg==
X-Forwarded-Encrypted: i=1; AKwUvBy/wYeVs1TK7q8J3QEPPK3j4/b6gIKHtMoGsj/0Sdk5v1m5+vOiGV6iYTnApTov1Ah42QoPGP1v8m0w@lists.linux.dev
X-Gm-Message-State: AFuF++mZMo/X+Cq4rzG95fGa/mtCN4y3xjTKPMgf7XHnXnE7KeYZ3uG5
	bcptmvkgCtXI1M0ZCRYzNezFBm8+7mNW8q0LVgA/duZGhD8sP5BlXavj
X-Gm-Gg: AYBFou3Kt6p8kT9tKaFvqi3TR0gctJ0gsem48qkiDNuLa6hyLeEl9aNvjZ5DHG0asU+
	/Ng5SQ/aURnza8nRpDCqwjtluyb4Ps+vGU3Trsqd3jraBvf9JOf9925D/jEg9gBmBWhHU2oEQXY
	RJktACoDlJ+yL1ADUCITiNe56npZmvMk4PTN7qczuh3Kco7oOBQfTtL7GgGZlfcjwYEyi6Rz8+U
	CZbpdqu9nzOOd1Ltd8OEya5PCYRSRAsCY8EKzY4PyrK59W8DTdI68+ndIXojhEmZ7P170p5Taol
	aXdJXRyyU5GWg5nCKE84zP3H6qf37evhMbBz/51fAiJGLQyXvka9J3vRbbcYMYLxKLOQFJBBbuC
	GEHLGCnso0QDvSl+dA7jo2ElGf5Ruc792W9UGji6uIvP+gHDEABiTBE4iTCc//866WHXOdUgUSg
	Sjv+C345vgK7YCsQm47QFtxxecPnKoDW9wYznHsyoXGdjYWLq4PxEi/yn1QSu/DD0jJVwybJZ78
	cKSHcNYZxdAGA7zCfZW3kp0hzhHiLuIbeRNl1JoFU8T2FRlJJLnegOrmCA+oKrmgtnkSZTPQ5n5
	/nCOFBjVRIv2OQtChAbq9mHA7fyzj3YbYR5tbCzxsh/ox4w78KhN+AHfZpTLYLcuLoE=
X-Received: by 2002:a05:6000:2512:b0:484:4153:11df with SMTP id ffacd0b85a97d-48587287d5bmr13746106f8f.11.1788600586098;
        Sat, 05 Sep 2026 02:29:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm13091255f8f.35.2026.09.05.02.29.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:29:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	linux-coco@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brijesh Singh <brijesh.singh@amd.com>
Subject: [PATCH] Documentation: virt: Fix the struct snp_guest_request_ioctl name in sev-guest.rst
Date: Sat,  5 Sep 2026 11:29:42 +0200
Message-Id: <20260905092942.41558-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct snp_user_guest_request does not exist; the name is struct
snp_guest_request_ioctl.

Use the real name.

Fixes: fce96cf04430 ("virt: Add SEV-SNP guest driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/virt/coco/sev-guest.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/coco/sev-guest.rst b/Documentation/virt/coco/sev-guest.rst
index 93debceb6eb0..3371ebc29e8b 100644
--- a/Documentation/virt/coco/sev-guest.rst
+++ b/Documentation/virt/coco/sev-guest.rst
@@ -38,7 +38,7 @@ along with a description:
       are not detailed, but errors with specific meanings are.
 
 The guest ioctl should be issued on a file descriptor of the /dev/sev-guest
-device.  The ioctl accepts struct snp_user_guest_request. The input and
+device.  The ioctl accepts struct snp_guest_request_ioctl. The input and
 output structure is specified through the req_data and resp_data field
 respectively. If the ioctl fails to execute due to a firmware error, then
 the fw_error code will be set, otherwise fw_error will be set to -1.
-- 
2.53.0

