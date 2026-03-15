Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678F36607A
	for <linux-coco@lists.linux.dev>; Sun, 15 Mar 2026 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773583186; cv=none; b=fpHmMrtpJruvXxy79BDEM3p3qX0+ZsGUExSb5rXF18g6+oo0bwQZAk9YK936rb0h1hsstIFhNjJp5mRvHoOS+j7aW9xQj5k9i0NtnVYg4jNG0QxeVbn71sC8Zw2nGApaAOEFlV8cgub7hcFNJLuetzaOeZMfmTDXayRQuw9IDDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773583186; c=relaxed/simple;
	bh=s6uY08ifCWK6lc4XDMMSYPQnJ0X4Kox0YD+uZNjfBn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhp9BF5ABZj+zGcElXdsqwc08IozGqokYyBEFIBZfs0tAZpVOltBj0j3fgixy0sHDi3SAMbp8iZ9NxgqqWr3yiobpx52TzIlXnhPz6sF8V4GoAtwnUIo6u3/seR0s4+35/zZ+btc2i823dmCCtnlNpVSsOFJofUvDg5i1ttwxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/3+aShP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/3+aShP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773583184; x=1805119184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s6uY08ifCWK6lc4XDMMSYPQnJ0X4Kox0YD+uZNjfBn0=;
  b=g/3+aShP5Qo8Qd3Q6qgUXa3+kZ14r1fqz/veSpXyho8RpNw+Lm+R3wyB
   XjbEFwJbkl1bBuip7vPqUrE57+7vMliz3Qh5FVeRQ8vhN9g9X1mbqCixQ
   V6Ex2uZsYhY+ToGiAT6V9h/WDo30fIji1Up7u7Zdo6VR/P3734SumD1fe
   br5g7MRd3dOOvrr/nQrUgSpevAcocd+UywVUXyfaI4JdZ6R2CJkLx3PRD
   n+jQmzdcAE8PvfJlU5gG3nkyQ7PxFkMu663puUC40HmJdDpmg3ZzK152U
   q4z2QVB8wLhxJACJwHb72QUdcS90Iu5VprxGkssVrQmmMOWuziChv7X9T
   g==;
X-CSE-ConnectionGUID: wnWV806ISAKWNoZedlD7vQ==
X-CSE-MsgGUID: 4ZoM8kPMRneM0sSVQ0s4+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74732487"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="74732487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:40 -0700
X-CSE-ConnectionGUID: hBegiaZuSky4v86/IdrKrw==
X-CSE-MsgGUID: nGKnVgqGSL+HPXzudkXa6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="226123046"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:59:40 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: binbin.wu@linux.intel.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	nik.borisov@suse.com,
	paulmck@kernel.org,
	pbonzini@redhat.com,
	reinette.chatre@intel.com,
	rick.p.edgecombe@intel.com,
	sagis@google.com,
	seanjc@google.com,
	tony.lindgren@linux.intel.com,
	vannapurve@google.com,
	vishal.l.verma@intel.com,
	yilun.xu@linux.intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5 10/22] x86/virt/seamldr: Abort updates if errors occurred midway
Date: Sun, 15 Mar 2026 06:58:30 -0700
Message-ID: <20260315135920.354657-11-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315135920.354657-1-chao.gao@intel.com>
References: <20260315135920.354657-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TDX module update process has multiple steps, each of which may
encounter failures.

The current state machine of updates proceeds to the next step regardless
of errors. But continuing updates when errors occur midway is pointless.

Abort the update by setting a flag to indicate that a CPU has encountered
an error, forcing all CPUs to exit the execution loop. Note that failing
CPUs do not acknowledge the current step. This keeps all other CPUs waiting
in the current step (since advancing to the next step requires all CPUs to
acknowledge the current step) until they detect the fault flag and exit the
loop.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
v5:
 - Replace failed count from atomic_t to int since it's now protected by
   a lock.

v3:
 - Instead of fast-forward to the final stage, exit the execution loop
   directly.
---
 arch/x86/virt/vmx/tdx/seamldr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 978fcca92128..e195703398e7 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -190,6 +190,7 @@ enum module_update_state {
 static struct {
 	enum module_update_state state;
 	int thread_ack;
+	int failed;
 	/*
 	 * Protect update_data. Raw spinlock as it will be acquired from
 	 * interrupt-disabled contexts.
@@ -237,12 +238,17 @@ static int do_seamldr_install_module(void *seamldr_params)
 				break;
 			}
 
-			ack_state();
+			if (ret) {
+				scoped_guard(raw_spinlock, &update_data.lock)
+					update_data.failed++;
+			} else {
+				ack_state();
+			}
 		} else {
 			touch_nmi_watchdog();
 			rcu_momentary_eqs();
 		}
-	} while (curstate != MODULE_UPDATE_DONE);
+	} while (curstate != MODULE_UPDATE_DONE && !READ_ONCE(update_data.failed));
 
 	return ret;
 }
@@ -264,6 +270,7 @@ int seamldr_install_module(const u8 *data, u32 size)
 	if (IS_ERR(params))
 		return PTR_ERR(params);
 
+	update_data.failed = 0;
 	set_target_state(MODULE_UPDATE_START + 1);
 	return stop_machine(do_seamldr_install_module, params, cpu_online_mask);
 }
-- 
2.47.3

