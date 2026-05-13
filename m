Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB84DB564
	for <linux-coco@lists.linux.dev>; Wed, 13 May 2026 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685123; cv=none; b=UYGiUJPIM4883maJXrWlFHmLp8dS0u/ki/mgJ79Lc67Hl/2E0ooepdHg9i9+B3upsWqCRTFD/6HHutxmKE+qL4oI+NJS4gQjcDUNCnvKPn1RqDuFqO53bCnIOse6lZUR2Irri7WZcFxjoLRyvoO5lK0Jwz8lqG2JY4FtJcJqLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685123; c=relaxed/simple;
	bh=NQ4lEceBbiRV2FzlBRrERpkQeA5r2KNYHsPAFpy9GUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knZx5jtpW1d+z6u2455p4Gp/MDbRe0duxrgFTwESLwXysL4WYIKxLDXf9FiuZNd81sSWLSIz1HNN+sNkQjO+F+gI9cdLHI2Pcyw/qCYRfV5eLNgwCxsXRIlIHOlp2j/LsdoLkuNKiREHv3XoFc8jFYR6vZc4F1SuXUnfDFEXGek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgLKNgZa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgLKNgZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778685122; x=1810221122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NQ4lEceBbiRV2FzlBRrERpkQeA5r2KNYHsPAFpy9GUE=;
  b=GgLKNgZal4JKOM/HBXVRYnGrYRXTLbIrjomCV6n1hAwObFy9D+3IypjF
   veh9oeLu06V0ov88J7gOvULWoxVf8l3l1S/l0vV6QrzXuPr0JUKtRzV0Z
   rl0+iBKF1g+sKahaEvX8AY/sL9AjCeiK0H8cMi6yJaDtXLJa21eX8/jAX
   n8BUxTwzBhg1R57vaYri17UfsqQecxgVpWih8x2BawUhknADgcJ4C5AjA
   ImmF4EEktVqojJsQs+gmgPq6tSV8fMp8hvGZ8irBzw0El8oq89PEO0w4Q
   +RTZQDOItqTgWTcnz5QMbPAd2lztx060rWsjpsDzxKdkGPjtjHfAVxSmq
   g==;
X-CSE-ConnectionGUID: hN2HuXkTSUqAnSPNq8ZwyA==
X-CSE-MsgGUID: 66HNQiu3T328NsI5jmEiLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="89921812"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="89921812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 08:12:00 -0700
X-CSE-ConnectionGUID: h9+/am/jT/Sxq/mdceleFQ==
X-CSE-MsgGUID: poH7E0tORwSMvvqKCXvL7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231716922"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 08:12:00 -0700
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: binbin.wu@linux.intel.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
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
	xiaoyao.li@intel.com,
	yan.y.zhao@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v9 21/23] x86/virt/tdx: Enable TDX module runtime updates
Date: Wed, 13 May 2026 08:10:04 -0700
Message-ID: <20260513151045.1420990-22-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260513151045.1420990-1-chao.gao@intel.com>
References: <20260513151045.1420990-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All pieces of TDX module runtime updates are in place. Enable it if it
is supported.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 arch/x86/include/asm/tdx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 1e1bdc4ec9c8..ac042b369843 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -34,6 +34,7 @@
 #define TDX_UPDATE_COMPAT_SENSITIVE	0x8000051200000000ULL
 
 /* Bit definitions of TDX_FEATURES0 metadata field */
+#define TDX_FEATURES0_TD_PRESERVING	BIT_ULL(1)
 #define TDX_FEATURES0_NO_RBP_MOD	BIT_ULL(18)
 #define TDX_FEATURES0_UPDATE_COMPAT	BIT_ULL(47)
 
@@ -115,8 +116,7 @@ const struct tdx_sys_info *tdx_get_sysinfo(void);
 
 static inline bool tdx_supports_runtime_update(const struct tdx_sys_info *sysinfo)
 {
-	/* To be enabled when kernel is ready. */
-	return false;
+	return sysinfo->features.tdx_features0 & TDX_FEATURES0_TD_PRESERVING;
 }
 
 int tdx_guest_keyid_alloc(void);
-- 
2.52.0

