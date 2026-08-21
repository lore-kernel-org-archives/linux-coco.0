Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3B4052DF
	for <linux-coco@lists.linux.dev>; Fri, 21 Aug 2026 05:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290461; cv=none; b=qym1bF7pcV71ngJOs9xyrlEi6kGYEXzhpm8koR4iwmpB1dVEIRhao+xgzkifE121Oma4gCLZez42Xj6bcY4Eeabfk325nNf8e5AGONLRxLvxfnqJfnFCjUJJ6pJfckC9LLt1UKVY3eeTahZSTeEB0JBSAcZeiPMkGn/sG8YcnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290461; c=relaxed/simple;
	bh=J4/+EwMqudsyf0DDkT/pWlItb/9zqya89c+8c0bvln8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GkiLeyOgmtfnUH7xYCJl8ly9wQsbyxJL3jTe/81+utFC9m1Qur5EPxxk7bJEPrf/yHBO0b4uH3dHjEE1NVXp/gZl7x9Je6RAwbhCzgKhrfxgE0VYCxZZ1/tpr9eVY+geoj/wZeoe9HBUsE+LMQGBeFR6ZULhAMy3F3k8jy6wQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGYT5nt4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGYT5nt4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so7710835ad.2
        for <linux-coco@lists.linux.dev>; Thu, 20 Aug 2026 22:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787290460; x=1787895260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBx1RTNHaDs7onbvGTuP0aMAgK/JJJX4amMTE7ze3X0=;
        b=NGYT5nt4Yci3gvC4dUODoDlP5OGOScBAHiEUmSlZ63LlaUvXxuNTwe8uO4cN/oVGwn
         e7HD1UeUKfshTX/9a5iDB/DfbIqx3ECj/Y/paa1vbLzpYKeetTvHxBEZM88EW7zxHH0L
         +U1rXr3OxYOsD7cRcolVR0uhxntfFKJDOsAw0eQCHHQutxxgaT9X4eOQIJIxJOr+VRo5
         RqpCDlaKlcyAsWNukWBFKfd8GD7pkMqvDlLSjcj/FrEANYvG+/RJfVQB2+kNGCOT9GgV
         0pvgj7WWgL3EoHzbBzEHmqV6Bc8ZM5iGBmzSjcfe+mqRkkjl76l9rkFpqEL5/XYVfF2g
         EWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787290460; x=1787895260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBx1RTNHaDs7onbvGTuP0aMAgK/JJJX4amMTE7ze3X0=;
        b=MqKWZdwHn5hbj6qmkxLdvDkM7FmRK0ksGjVe256asqYX6kJFtnPOStFaQBvfEw1Jb4
         CleiAWfNPueYcJL33x5EZXe4G1LKNRyiAOdDak6b3FVWnfaZ0W7pj5Odtw3iLhtaZQMF
         ZyA7fh2/SG9FCp+ZdcX7ZU4RVmMmIb3fq0o7y465utvzSqB1Kh2KBNztHtWAUE6Hhxin
         3NfKUGAXOyWk782nOwdjRpohBOJuf9+SxaqXenq2d7fLGpwu7PIgDhRfBFTEAChkH6k6
         9Sdd89+T4ejkTQ5DKviw2g8sbuMwza1s5LIqKXmJmlJXGrG4txd3TLCosjfklEyCsvQk
         7T4A==
X-Forwarded-Encrypted: i=1; AHgh+RrHEkSUgaEI+ChrGKJvzMHu9mNfWxdqyvM2dFS1JIugPU9jTcLWkWOw1zPL3EKOSHR5d3gRrHwk3C8e@lists.linux.dev
X-Gm-Message-State: AOJu0YwzauVGGE7r9qlhFhsNee4vIi/bOUtv4FMmKLIgmMQRn3fltYfj
	8Cft6Lsp/i+t84NvAzXs0zpA6QV/aKk24fkKDvU2iZXeZjPxUu77AkKL
X-Gm-Gg: AR+sD12fVokbpRtE0wqb/4roGGbLGqBBjw+2OMcw78YbETyfccD39dmResj03s0ilDm
	TDC9DscJM5JS95ZKMzPjrQpdOqQXJt9EU8mDSbMo/PZxDSOMax+TjwOaR3IxSlgo1eKLt7Xid95
	zSPq1rlBX0uKQeI6uJdK2Z3K4PYCbYZP3FdeCW+lbjoGdVzHDPGuWeeh/gvh9crgl9gfGzFz8oU
	1y3nZIa6CnP6Vt+k6GzajQUdft3CYUMmzUXhhTIBzyFZ3qT5sAFmBJ9cguQS+nPgvab0JmXqsvp
	wmZsaYyn1P2wvPYFa4M1MGgzTapGe1Kfh3ciQIKwv3B4bVW8Oz7REtBds8moHpX2wGE1sSmdnhO
	uT++rbAE+J0XxH2KbEJd8BaTlKHcDPYIYZaDjS9WAkau9/XnhbPAAOHL2bXmYJKi++XsZsUiqmG
	QUl5oZQi5/sNxEi1v+cRMDSzGqLE3UOaJbXC/pn3+cA7N7vVayo3jFpGSBVPKYA15UK/cYfiVsj
	Q==
X-Received: by 2002:a17:903:b07:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d64ade4afdmr74069425ad.3.1787290459610;
        Thu, 20 Aug 2026 22:34:19 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10ca5csm22721939eec.17.2026.08.20.22.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:34:19 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/sev: Do not fail SNP platform init if the vTPM cannot be registered
Date: Fri, 21 Aug 2026 11:04:11 +0530
Message-ID: <20260821053411.1215497-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SVSM vTPM is optional: snp_svsm_vtpm_probe() returns false when no
SVSM is present or when it does not implement TPM_SEND_COMMAND, and
snp_init_platform_device() happily returns success in that case.

When the vTPM *is* available but registering its platform device fails,
the same function instead returns -ENODEV, after sev_guest_device has
already been registered.  That is worse than the absent-vTPM case in two
ways: the sev-guest device is left registered while the initcall reports
failure, and the error tells nobody anything, because the return value of
a device_initcall is only ever traced, never acted upon.

Log the failure and carry on, so an optional device that could not be
registered no longer determines the fate of an unrelated one.  The vTPM
is simply absent, which is a state the guest already has to cope with.

Fixes: e396dd85172c ("x86/sev: Register tpm-svsm platform device")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
Compile-tested only.  Reaching the failure path needs an SNP guest under an
SVSM whose vTPM platform device fails to register, which in practice means
-ENOMEM during initcalls; I have no way to reproduce that.  Built at W=1 with
CONFIG_AMD_MEM_ENCRYPT=y, and confirmed the file is not built with it =n.

 arch/x86/coco/sev/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ecd77d3217f3..6501b6f7469a 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1401,7 +1401,7 @@ static int __init snp_init_platform_device(void)
 
 	if (snp_svsm_vtpm_probe() &&
 	    platform_device_register(&tpm_svsm_device))
-		return -ENODEV;
+		pr_err("Failed to register the SVSM vTPM device\n");
 
 	pr_info("SNP guest platform devices initialized.\n");
 	return 0;
-- 
2.54.0


