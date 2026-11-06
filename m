Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971311;
	b=L3JVkFxr4K3/BU+lqB/QVLRvau4KK4MeD4asxOI5Jth6l9zJ4CpfpfteyIP259HbS6Wg
	 DdccVPYJm7P7XoNnk5aNMibPLNlIxKbUc68tYjgb8AvZyfbupYuWi8Evs1CBsQRktG9Cd
	 6nTjAb8kYWHpZv5G0Nmr1ADv2NIhJb3rYxFOFxmpkZNDLP6qSxg4o4jZZtGdFFNLfpYgb
	 +xTN3Gn5EdQV/TMCEszg08HEyx4tUWGbucS0aygZEismypU8z9CztY/3H8/rmegUnHezI
	 nFgs3oEJMdCmETKMgx8fIJP5Ed629CluoI5LKTfrKSbMhVmBlHd1C6+3QUcnBnePPhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971311;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DRGUowhFqVlQEc8mCF0Quf48QQilintdaUx75V1QpwM=;
	b=oQcbzzyz0YIRSxJQRONGrwurM3w1uy1OxEy17Pd4NuRYy6CComnDt5dQTS3fJY6E3usN
	 j/RfXhh7o+5GKrr3/OU6vVnWWRmyIKZKkf/6uV7Q9a0d8atOs8t0gvm1umi8pDewQmKGJ
	 lmKj1kMIgpaEQSa/MoDE3gneBdxbGwrB3DwNWJv8ST4VGh5cJpj4kQ+ZZEMaOWf28mJtj
	 shIgWEP50Edy+kkIPetvsb6TWCg+xZIaXZm05ZrQHQw3uN+S4cQZnZl9Y1zC6r8RxPti8
	 8K6w4kGmey4iazfYZC9VQBoTiXeiUFWX6bXKBb9nI24Tz35aUo6YJ8q9mXOVwndQXhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=INg6F1WC;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2F606A333
	for <linux-coco@lists.linux.dev>; Fri,  6 Nov 2026 13:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D2F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=INg6F1WC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793971310; x=1825507310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cPoDJJurJ3JFCVkslxCJnfPoFcsZBtUovXSys0F7q7A=;
  b=INg6F1WCpAfpIyE83JlCJ0e2MeJ3N7V327lfC5ShieemmZOL4WzG1rKY
   6n618IFFmDqxlhiKO0aJsXIIIX1SbOhIlOQwwH5lb2usQp4Pfp4cbbiqq
   RyWaMCugVui7tCn5yUNYMetCXUSfkUlVT7G3N+cl8OLqPDie//H/X25Nw
   lVY9b6WyL/u8HaObE+jNILWH9MdtfuqrPDAHJG62c0zLdgiD3x8smfnfK
   wNTCv508f6UZkyjBqQF2fqjiGoN4dTNatFQEf9IwMx+8cdkA4JfE/i2vD
   M/fjt3d8piy8dGmG+x21FYDY1NMmFV/d64W4IOJkdhGDDtVTH/aYbn8xs
   g==;
X-CSE-ConnectionGUID: 8PewxKKUTJmC+QnKXPrjIQ==
X-CSE-MsgGUID: Ggitcx36Tl6oKDfVZ7b5KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2786778"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2786778"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 05:21:50 -0800
X-CSE-ConnectionGUID: 8WywxznZSS6Ok8WS9EUFdg==
X-CSE-MsgGUID: lngGdN+ASem/cvk8RYqPig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7397277"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 05:21:50 -0800
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: yilun.xu@intel.com,
	arjan.van.de.ven@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [RFC PATCH v2 2/2] x86/virt/seamldr: Support multiple sigstruct pages
Date: Fri,  6 Nov 2026 05:21:56 -0800
Message-ID: <20261106132159.1551365-3-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261106132159.1551365-1-chao.gao@intel.com>
References: <20261106132159.1551365-1-chao.gao@intel.com>
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

Each TDX module update image carries a sigstruct, which is passed along
with the module binary to P-SEAMLDR. 'struct seamldr_params' has a single
physical address slot for it, so a sigstruct can be at most one 4KB page.

TDX modules are moving to a post-quantum signature algorithm. Its
signatures are far larger than the ones in use today, so the sigstruct
no longer fits in 4KB.

The P-SEAMLDR ABI was extended for this. It now has four sigstruct
address slots instead of one, for sigstructs of up to 16KB. A new
'version' value of 1 tells P-SEAMLDR that this layout is in use.

Extend 'struct seamldr_params' to match the new ABI. The sigstruct
address list is already populated in a loop over all sigstruct pages, so
raising SEAMLDR_MAX_NR_SIG_PAGES is enough to fill the new slots

Set 'version' to 1 only when the sigstruct spans more than one page. Old
P-SEAMLDRs reject version 1, so this keeps updates with a single-page
sigstruct working on them.

Do not query P-SEAMLDR for version 1 support. Userspace selects the
update image and is responsible for ensuring the module is compatible
with P-SEAMLDR.

AI was used under supervision to review code and workshop logs

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
v2:
 - drop macros for versions to keep the diff minimal
 - explain why the sigstruct filling code needs no change
---
 arch/x86/virt/vmx/tdx/seamldr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 087bdf10a9a7..9cef6fff2a6c 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -36,7 +36,7 @@
 #define SEAMLDR_PARAMS_NR_PAGES		16
 #define SEAMLDR_NR_MODULE_PA_ENTRIES	(496 + 512 * (SEAMLDR_PARAMS_NR_PAGES - 1))
 #define SEAMLDR_MAX_NR_MODULE_PAGES	(SEAMLDR_NR_MODULE_PA_ENTRIES - SEAMLDR_PARAMS_NR_PAGES)
-#define SEAMLDR_MAX_NR_SIG_PAGES	1
+#define SEAMLDR_MAX_NR_SIG_PAGES	4
 
 /*
  * The seamldr_params "scenario" field specifies the operation mode:
@@ -57,7 +57,7 @@ struct seamldr_params {
 	u32	version;
 	u32	scenario;
 	u64	sigstruct_pages_pa_list[SEAMLDR_MAX_NR_SIG_PAGES];
-	u8	reserved[104];
+	u8	reserved[80];
 	u64	module_nr_pages;
 	u64	module_pages_pa_list[SEAMLDR_NR_MODULE_PA_ENTRIES];
 } __packed;
@@ -166,6 +166,13 @@ static void populate_seamldr_params(struct seamldr_params *params,
 				    const u8 *mod, u32 mod_nr_pages)
 {
 	params->version		= 0;
+	/*
+	 * Use version 1 only for multi-page sigstructs, to stay
+	 * compatible with old P-SEAMLDRs that lack version 1 support.
+	 */
+	if (sig_nr_pages > 1)
+		params->version	= 1;
+
 	params->scenario	= SEAMLDR_SCENARIO_UPDATE;
 	params->module_nr_pages	= mod_nr_pages;
 
-- 
2.52.0

