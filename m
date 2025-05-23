Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F9F23535E
	for <linux-coco@lists.linux.dev>; Fri, 23 May 2025 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994032; cv=none; b=Ai5Sw18yfzNLent5m3MhQsze2YyJTgkQjmKO6kJrgaFonfyJ6u2NsjMb87HkalE10pHnpL0fpqUsJulJuoLMHPHAgZMezhSZxeEbC0zv20/wVaLMB8IYzbpQBbdMDplWA7GKgvYSa+vBShMrJxellVpqFMOInWuDAaGWTeO3SgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994032; c=relaxed/simple;
	bh=TsI9HxQ2Gz6GuimkwqYvAK3v4dW3I+m/53VcN46/PpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbWxoPWPQ6mUweMD297T+rfHxw6go2n7g31ZdN9B2PcrZ9UqG3xg+JLAzBBO7gFZgbxYyksAMK7Nb6tptyX1fxZe8Btz03n2GgdcFcCD8io/GwmEZQ7LTo5FU21Mv/aq7l4foYLrBc6J25jNZAYn8Qlf3/ZSNVwwFI4CVAq/PXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djNTgCJj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djNTgCJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747994031; x=1779530031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TsI9HxQ2Gz6GuimkwqYvAK3v4dW3I+m/53VcN46/PpA=;
  b=djNTgCJjkc5yEE0yIoQ4FcV2NpPkpbBt1ET4sb9Zeupk2dUCEcx1rGnA
   xLnQf5xfV7fd98VcVaoTegOEy6NRfWcbhPQsO097kDvOHGIve+VSaZk2N
   CCFBhPleAz0OO9FWprjKyBtixj13z3+XdQ9k5dqN6bXTlMpIg86wr+ydx
   7d8EHXyMbSNFOBsSpMZvG80kc/2pTZZWHZwMbUOIypUKUXXGQGOn1iTFk
   kI3xG/RM2godztFj9dhATxwnIkhTPP7Js4WRM7LjgN2oyTzsFylZuQTFo
   4KgYwLUKWZ2ZaCilvsQrd67LGtQEf6E4MWPD8Liv9P0cvR2MDp9WT5cO2
   Q==;
X-CSE-ConnectionGUID: 5U+xdv92RFSXj4eH9Wq3/g==
X-CSE-MsgGUID: EyZyxrDQSqCtX78P3eaaWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75444190"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="75444190"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:51 -0700
X-CSE-ConnectionGUID: 4G5ctHf6RjuhrRGHbSR6Nw==
X-CSE-MsgGUID: NBdC9/7BTGS+2BkR2PyaCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="164315072"
Received: from 984fee019967.jf.intel.com ([10.165.54.94])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:53:50 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	x86@kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	pbonzini@redhat.com,
	eddie.dong@intel.com,
	kirill.shutemov@intel.com,
	dave.hansen@intel.com,
	dan.j.williams@intel.com,
	kai.huang@intel.com,
	isaku.yamahata@intel.com,
	elena.reshetova@intel.com,
	rick.p.edgecombe@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 11/20] x86/virt/seamldr: Abort updates if errors occurred midway
Date: Fri, 23 May 2025 02:52:34 -0700
Message-ID: <20250523095322.88774-12-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250523095322.88774-1-chao.gao@intel.com>
References: <20250523095322.88774-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The update process is divided into multiple stages, each of which may
encounter failures. However, the current state machine for updates proceeds
to the next stage regardless of errors.

Continuing updates when errors occur midway is pointless.

Implement a mechanism that transitions directly to the final stage,
effectively aborting the update and skipping all remaining stages when an
error is detected.

This is in preparation for adding the first stage that may fail.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 01dc2b0bc4a5..9d0d37a92bfd 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -247,6 +247,7 @@ enum tdp_state {
 static struct {
 	enum tdp_state state;
 	atomic_t thread_ack;
+	atomic_t failed;
 } tdp_data;
 
 static void set_state(enum tdp_state state)
@@ -261,8 +262,16 @@ static void set_state(enum tdp_state state)
 /* Last one to ack a state moves to the next state. */
 static void ack_state(void)
 {
-	if (atomic_dec_and_test(&tdp_data.thread_ack))
-		set_state(tdp_data.state + 1);
+	if (atomic_dec_and_test(&tdp_data.thread_ack)) {
+		/*
+		 * If an error occurred, abort the update by skipping to
+		 * the final state
+		 */
+		if (atomic_read(&tdp_data.failed))
+			set_state(TDP_DONE);
+		else
+			set_state(tdp_data.state + 1);
+	}
 }
 
 /*
@@ -285,6 +294,9 @@ static int do_seamldr_install_module(void *params)
 			default:
 				break;
 			}
+
+			if (ret)
+				atomic_inc(&tdp_data.failed);
 			ack_state();
 		} else {
 			touch_nmi_watchdog();
@@ -314,6 +326,7 @@ static int seamldr_install_module(const u8 *data, u32 size)
 	if (IS_ERR(params))
 		return PTR_ERR(params);
 
+	atomic_set(&tdp_data.failed, 0);
 	set_state(TDP_START + 1);
 	return stop_machine(do_seamldr_install_module, params, cpu_online_mask);
 }
-- 
2.47.1

