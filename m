Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED992DEA87;
	Thu,  4 Dec 2025 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852494; cv=none; b=rnDP6HUQ6dkys44AHfyzUfsci0P0pUFOCDYSTh8ROajAHwBFF+HScB5uMHHYVOJS88zjJ10mr/deG7XRrqbPZgzymJ0DTqMGrbC1d79MBqsQcOJVUyE8Sqbs8JRqwfFK+sJqqI9vC/xPnkIVTWcLK58QKnfxMeB+SbJTU1SX36I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852494; c=relaxed/simple;
	bh=h0mDEHs1mZljtd5ix0ERgyzzSqiPJYv79zx77X7i/cM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=soOox8TgQdwk1b14lP7hwC+6dnojmlND3zAVT/HvukS2HXeLaWhjBgJ9gdKI76XRtGRAV/oggXgEUovgg1lrMmzSNKCHKuY06WGmtLSW5Cb3eBb1OQLXEPQnXa7PExAAoemAEHKncidAaFEEaNk+VW36QRWiIBr8duTWO7TVhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfOAiffO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfOAiffO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD7FC4CEFB;
	Thu,  4 Dec 2025 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764852493;
	bh=h0mDEHs1mZljtd5ix0ERgyzzSqiPJYv79zx77X7i/cM=;
	h=From:To:Cc:Subject:Date:From;
	b=kfOAiffOB1p+4LUNUty5YfREJsoKOvEX7SAkBSfIigOuObZ9quz6G6cqnzrQtgaYz
	 PQYwFnb48clF6glwv0eYs8HZ4RLJrP9O8kj51jOe0G93IatDvtyCoHuN7nF5rLC47r
	 dTjvPqxL47Srkugb8NBBwww185DcH8Z0QVmQFyrAjOG0GRC2brFGLJEGPPTEY7APzi
	 R/hvZ/E9/PrQM7ji9V2Xe/wyWpqbxoYiR3sWjJu8Vqlnv9SecIm/eC0iwgBFVkEhOm
	 prsZuSxpsgi8EHJFO8JfR2uPvGJGGc4ztngAMYqAOUM9Y5D3BsZoTSpJBK9MxlYkNK
	 njcIETniAsvPw==
From: Borislav Petkov <bp@kernel.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: <linux-coco@lists.linux.dev>,
	X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 0/3] x86/sev: Carve out the SVSM support code
Date: Thu,  4 Dec 2025 13:48:05 +0100
Message-ID: <20251204124809.31783-1-bp@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Hi,

I've been meaning to do this for a while now but didn't have a good idea how
to do it nicely. Using the internal header makes it almost trivial.

Thx.

Borislav Petkov (AMD) (3):
  x86/sev: Move the internal header
  x86/sev: Add internal header guards
  x86/sev: Carve out the SVSM code into a separate compilation unit

 arch/x86/boot/startup/sev-startup.c           |   3 +-
 arch/x86/coco/sev/Makefile                    |   2 +-
 arch/x86/coco/sev/core.c                      | 380 +-----------------
 .../sev-internal.h => coco/sev/internal.h}    |  32 ++
 arch/x86/coco/sev/noinstr.c                   |   3 +-
 arch/x86/coco/sev/svsm.c                      | 362 +++++++++++++++++
 arch/x86/coco/sev/vc-handle.c                 |   3 +-
 7 files changed, 403 insertions(+), 382 deletions(-)
 rename arch/x86/{include/asm/sev-internal.h => coco/sev/internal.h} (75%)
 create mode 100644 arch/x86/coco/sev/svsm.c

-- 
2.51.0

