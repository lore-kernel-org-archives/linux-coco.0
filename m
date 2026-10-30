Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350420;
	b=L8ncoF8/I7SPP/qB412s7+KVEjeuY3fCRBQwy6ck+JYn9O8us2NhLUrMT2k87LGI9DU/
	 u8G9kRjwnV9i52RgdwspDPQSWX3e0taDYfH6stxurfaLQaNuBK8wEIrwK4CWmwNCKuLV/
	 a1mYY6Bhc/+h9MlpR8TDWT/4RQv0YG2mqzrCdxqSNs5OoMoKIeN+I4fzvyb7ULDcqXMzR
	 RVDQH39PPOlFNOL1KthQjRwSpLNG1fqj9dshoDz7tohLzI+yDpb3n6Sbu5lThzXcrfXRG
	 jc0V0TYgeKjQiINc+sJ5RinZXuWD3m7etAujWLD0IgUlr9nRAOHNfRbuucCT34FU9/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350420;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jHWa1WYOXlIaOcw1Lp9xeyazxvpFG7/2YuPJf/sHw6E=;
	b=E1VvosHb0W81vvaNASuIwjGqsT3tO//CN6JGKGFgntBNHJLFWDQST1OoyvjNnjmBPo3E
	 ksA/3dr7GRq11qJqpfBPFONC+YCU5i1YE7JuxEkcrjFpmCtedklZAeACqCogsyemKnACz
	 JsAZ6yNAhhiOqeQza6qQhKiOtZsa5z/spV5ajWrH05K4Tx2FJIE8IttQuFk/SS75/GgGe
	 4qY4KS5s1APVuA9+WcU/T5XqsS6R12GtEGOlR4OFGqtchLRS8ZSmJgMd5EzU9FCfflOhY
	 scjd3L75J0Q0GRVTyHpZM+WRaxyEpU4jLTuu23OVR6xIVq5NhopFCs5R8+L5E25Z5vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MsNNUa8M;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2028606A325
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 08:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2028606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MsNNUa8M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350418; x=1824886418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7R5Q6OLG0Hv3DZ66D3ka0yTibw0AspYJGmy+QxvysnA=;
  b=MsNNUa8Mh1JCAXWAJQf5feml8G+/Pqr8jsVKbaVGy3nqaK+u05gUD/lT
   FV7AaOqRyY61dF+kZM6I0K6Jjv+NEs1cDJdSNkMM5Yzly+LzoGH0x+Nm0
   wpQotsOWSIG19sqLRQYcS1NllK0k+rc9zoAbOsbeXUH3g1MhVar+34C/v
   8InMJ3/QAKF6ykTanYH8QuUpsy/yBuisS99szKL6XFrqcsJcM0HLiI1TC
   +krbMbkbPC90RR3HMtw/Uk9TwiTVj1UdbN/UR5IP/DAwuX+RGjDgSHAVR
   WZuLN6fwho287//oiEQdoQlIQcVYYUFadFl4aHIYxXWSO5oefY9Idi+KL
   w==;
X-CSE-ConnectionGUID: avBV8EGVRJix/pMOIDIl0A==
X-CSE-MsgGUID: pg/l6gZ6RF2tluwB1SiN6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2122583"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2122583"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:53:37 -0700
X-CSE-ConnectionGUID: p6DUTeyPSJuFejtWv2w6zQ==
X-CSE-MsgGUID: okVd9qIKSFGnMHvJyl/Vhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7199528"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:53:38 -0700
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
Subject: [RFC PATCH v1 3/3] x86/virt/seamldr: Support multiple sigstruct pages
Date: Fri, 30 Oct 2026 01:53:00 -0700
Message-ID: <20261030085304.3886520-4-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261030085304.3886520-1-chao.gao@intel.com>
References: <20261030085304.3886520-1-chao.gao@intel.com>
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

Extend 'struct seamldr_params' to match the new ABI.

Set 'version' to 1 only when the sigstruct spans more than one page. Old
P-SEAMLDRs reject version 1, so this keeps updates with a single-page
sigstruct working on them.

Do not query P-SEAMLDR for version 1 support. Userspace selects the
update image and is responsible for ensuring the module is compatible
with P-SEAMLDR.

AI was used under supervision to review code and workshop logs

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index 09c8f6e30e9f..04681e67072f 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -32,7 +32,15 @@
 #define SEAMLDR_MAX_NR_MODULE_PAGES	(SZ_1G / PAGE_SIZE)
 
 #define SEAMLDR_NR_MODULE_PA_ENTRIES	496
-#define SEAMLDR_MAX_NR_SIG_PAGES	1
+#define SEAMLDR_MAX_NR_SIG_PAGES	4
+
+/*
+ * The seamldr_params "version" field specifies the layout of the
+ * structure. Version 0 supports only 1 sigstruct page while version 1
+ * supports up to 4.
+ */
+#define SEAMLDR_PARAMS_VERSION_0	0
+#define SEAMLDR_PARAMS_VERSION_1	1
 
 /*
  * The seamldr_params "scenario" field specifies the operation mode:
@@ -66,7 +74,7 @@ struct seamldr_params {
 	u32	version;
 	u32	scenario;
 	u64	sigstruct_pages_pa_list[SEAMLDR_MAX_NR_SIG_PAGES];
-	u8	reserved[104];
+	u8	reserved[80];
 	u64	module_nr_pages;
 	u64	module_pages_pa_list[SEAMLDR_NR_MODULE_PA_ENTRIES];
 
@@ -232,7 +240,14 @@ static void populate_seamldr_params(struct seamldr_params *params,
 				    const u8 *sig, u32 sig_nr_pages,
 				    const u8 *mod, u32 mod_nr_pages)
 {
-	params->version		= 0;
+	params->version		= SEAMLDR_PARAMS_VERSION_0;
+	/*
+	 * Use version 1 only for multi-page sigstructs, to stay
+	 * compatible with old P-SEAMLDRs that lack version 1 support.
+	 */
+	if (sig_nr_pages > 1)
+		params->version	= SEAMLDR_PARAMS_VERSION_1;
+
 	params->scenario	= SEAMLDR_SCENARIO_UPDATE;
 	params->module_nr_pages	= mod_nr_pages;
 
-- 
2.52.0

