Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC26352C26
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180432; cv=none; b=F1iw0dqn8+MTydKDXcKkArt0ckSwLGcOcGKKppbX+xk+nje2zkcBlL0jmNmTQuJS3BxViV3uuIikYX8JPOp4XsyiCcVyz8J7r5y1HPBZ+e0V1u4W1ypPCbEDLUsfmXnOy0ZHq9+VECkwMXabUFXNdTVGGuPYc9kA7G0boYnjHgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180432; c=relaxed/simple;
	bh=a3gRMZp+tq9HMVyIh/sGo+Ksja88/ptZZkRDwyCC7Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSNpVDnV4achjXUoT5UoFbw0BWo75YkG+vm+ecmTv2I08EhZ1Zp7r3AxZ16J+57qbxkjJ88nVRZAHmYy36BbGKrWRN3+eWg/PUhjdqhD8ORAp+UUvs5dmpNdIbRIQx5a+XPJxwQPoXKear2VJ7q7PoCUhBEtj0L+NQJFZnUjSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XN76qNGO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XN76qNGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769180430; x=1800716430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a3gRMZp+tq9HMVyIh/sGo+Ksja88/ptZZkRDwyCC7Tk=;
  b=XN76qNGOdrWoCZYnpueYB75n+pVdMbBRyUNjxY8kQhzTsNqOtMipRYIs
   V9xuxWKBFi859r2Esc2Ta1umDeaa2QItOM3lxU5qXbEO4sgLy39sgOG3j
   TN1jKVJq3WaZMCFv0xSsr0pYqa0Dmb/ZaR+dejUsC6OU5xApwd0TdpX7w
   FlYrADriRpkS/cvWvLQu6S1QAbMXUKzDoYgXHyBRJGyI0NC78uKecDvDI
   YGOJzq5XdXFzUXx9km8G0IxMKPpNcLDHtecO5Yd4E7OgehFGnokyVPOlB
   RGeEFaUHcT0CFFaAal6by6QGzNvdCiBkX6+WoSPW/loOP7vqdA755ZS7P
   A==;
X-CSE-ConnectionGUID: oT6KkO/KTXaPqNd+11sVXA==
X-CSE-MsgGUID: Jk2OCOlsQ6qTWkh1rpsXCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70334447"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70334447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:16 -0800
X-CSE-ConnectionGUID: kmAe1EgEQ5O/iDp+Qpefww==
X-CSE-MsgGUID: grWDjCIcQ9WFEeV6fbbRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237697156"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:00:16 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	x86@kernel.org
Cc: reinette.chatre@intel.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	dan.j.williams@intel.com,
	yilun.xu@linux.intel.com,
	sagis@google.com,
	vannapurve@google.com,
	paulmck@kernel.org,
	nik.borisov@suse.com,
	zhenzhong.duan@intel.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	vishal.l.verma@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 15/26] x86/virt/seamldr: Abort updates if errors occurred midway
Date: Fri, 23 Jan 2026 06:55:23 -0800
Message-ID: <20260123145645.90444-16-chao.gao@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123145645.90444-1-chao.gao@intel.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TDX Module update process has multiple stages, each of which may
encounter failures.

The current state machine of updates proceeds to the next stage
regardless of errors. But continuing updates when errors occur midway
is pointless.

If a CPU encounters an error, abort the update by setting a flag and
exiting the execution loop. Note that this CPU doesn't acknowledge the
current stage. This will keep all other CPUs in the current stage until
they see the flag and exit the loop as well.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
---
v3:
 - Instead of fast-forward to the final stage, exit the execution loop
   directly.
---
 arch/x86/virt/vmx/tdx/seamldr.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 06080c648b02..a13d526b38a7 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -239,6 +239,7 @@ enum tdp_state {
 static struct {
 	enum tdp_state state;
 	atomic_t thread_ack;
+	atomic_t failed;
 } tdp_data;
 
 static void set_target_state(enum tdp_state state)
@@ -277,12 +278,16 @@ static int do_seamldr_install_module(void *params)
 			default:
 				break;
 			}
-			ack_state();
+
+			if (ret)
+				atomic_inc(&tdp_data.failed);
+			else
+				ack_state();
 		} else {
 			touch_nmi_watchdog();
 			rcu_momentary_eqs();
 		}
-	} while (curstate != TDP_DONE);
+	} while (curstate != TDP_DONE && !atomic_read(&tdp_data.failed));
 
 	return ret;
 }
@@ -323,6 +328,7 @@ int seamldr_install_module(const u8 *data, u32 size)
 		return -EBUSY;
 	}
 
+	atomic_set(&tdp_data.failed, 0);
 	set_target_state(TDP_START + 1);
 	ret = stop_machine_cpuslocked(do_seamldr_install_module, params, cpu_online_mask);
 	if (ret)
-- 
2.47.3

