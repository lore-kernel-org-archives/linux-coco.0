Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971310;
	b=cCsmKLguFsB0WaAr7I0dDqISa4OPabC1sBfj35OTwkBjNjKyLcLaB0yszF/jXsOeu91C
	 u1M7sUqwrTkz+ofH1F0VXHFk8/DgPZHzlKF01pQZ+KYzRB8P+W6JgQUIQxJZrm9SsQMEx
	 MBuuyHKOvygabA72YJdMqQboGstU4YG32IOoKgMQBTxxUs0KSGI/WVDSicb357zR5qCwE
	 +2GQTJOSPWr5Pj0Fc6bJNpabsx8Qs9RKbmZS6dlpUuNZ6EhM/LjygusIiqMwMR/DvVl6M
	 XghDJGQEqxEjMBaGxWbILVW3Sc9yfqaAMwp3/ao/bpPvjAdklVeYGWXfH0CxFPHnBog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971310;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=im8cFQ5bpIMfGLqL2H29H66J9u5HMmBSQRVvIGP1wcA=;
	b=iMHt73+BglPU8GgZ40PWpnxzoEmhJCPYb9dSNCWGf8nfBg24NVFDjdQSlwLg/g7A8lXg
	 n0FH4k7RKHQbncbSNFvfnU/Q/sBlKxPvSLaRHENOJy2PbvE9wUdfqzakH0PND1BptgHmL
	 DvbN1jNxvuPOTQJaGQX+2WOPE95LOPV1WNKs6ELP4+3UM37l2BUwbWqsy3TPndeeyh4rq
	 VuPw/5LKUk6QOAGvI4UkTvvIAjkKzkwufr0Bmg+020o/VBtqlGPbvNDJP43UtI79VYjYE
	 ndb4UmEfKrUo+Q+nOBjKRCZEvCMEWbyPbz2o2q95HVpIDGjv/xOfA0Um5ppstVDwbDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FSMg94+r;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C450606A326
	for <linux-coco@lists.linux.dev>; Fri,  6 Nov 2026 13:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C450606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FSMg94+r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793971309; x=1825507309;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FHnB8hEBQdqMjNCdmgX3qlWiT3Uxn6+/tTiwV9C9JJQ=;
  b=FSMg94+rJUjtrUgdlByFDmsnBRPlS49R42XAUIuwLrSTNkgFIOgPh7cH
   4g2H6kSj3mblsONSD0QQ8hQQiZRVvMtAXWZhM69SZYNJXcQxQ6vRTehtp
   W1ENjnEvfWk1qoLS9Y2/RuSpDKz7Nh4PkFiATQjdYcNVgqh14UjS1DMxi
   nOQvb0uMJc94gJF1295P4xTFRPu4XB4Kos5g+xKO8WB/qG3Dj0xHhDkhR
   6LPuBzOH3MPA0kHD5pKaXS60fx/IR/+f1h/kp832dat4onkU0DPBYtZES
   Ljglbxc6IjTfmASFzhTOaxX4b4fB3Gyhk/3lmCYHAh/wDYhLnb7ICJ5+9
   g==;
X-CSE-ConnectionGUID: 7YAvjnGvQVakmqBwYTsQkw==
X-CSE-MsgGUID: +Q8quNpXRPyiQ2wTbP0RXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2786762"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2786762"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 05:21:48 -0800
X-CSE-ConnectionGUID: Kd81QBrYQ8a3j0TQr6UV6g==
X-CSE-MsgGUID: tJeLR2utSdC16qt6o9ZE/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7397263"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 05:21:48 -0800
From: Chao Gao <chao.gao@intel.com>
To: x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yilun.xu@intel.com,
	arjan.van.de.ven@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [RFC PATCH v2 0/2] TDX: P-SEAMLDR: Support large TDX modules and sigstructs 
Date: Fri,  6 Nov 2026 05:21:54 -0800
Message-ID: <20261106132159.1551365-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
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

This series lets TDX module updates handle large TDX modules and
sigstructs. It is an RFC for early review.

Dave, feel free to ignore this RFC for now. TDX developers, please take
a look.

Patch 1 raises the module size limit from about 2MB to about 32MB,
instead of supporting every module size the P-SEAMLDR ABI allows.
Current modules are roughly 2MB and are unlikely to approach 32MB for
years. If they do, raising SEAMLDR_PARAMS_NR_PAGES is enough. In return
the code stays much simpler, so I think this is the right direction.
Does that trade-off look right?

== Changes ==

Changes since RFC v1:

Patch 1 is reworked to be much smaller. In the last version, we tried to
size the chained pages to each module, which needed a prep patch so that
the allocation happens only after the image header is validated. now, we
make 'struct seamldr_params' a fixed 16 pages. This way, the allocation
no longer depends on the header, so the prep patch is dropped.

Other changes:
- Find each link entry by its position at the end of a page instead of
  by checking for a non-zero entry. [Rick]
- Write the link entries in populate_pa_list() while filling in the page
  addresses, instead of in a separate loop and helper.
- Drop the version macros in patch 2 to keep the diff minimal.
- Explain in patch 2 why the sigstruct filling code needs no change.

v1: https://lore.kernel.org/kvm/20261030085304.3886520-1-chao.gao@intel.com/

===

This series is a follow-up to the TDX module update series. As thanks
for merging that series, we agreed to take on the TDX metadata cleanup [1].
With the cleanup converging, we are starting on this work and expect it
to be merged after the cleanup.

Today a TDX module binary can be at most 496 pages and its sigstruct at
most one page. Both limits come from the P-SEAMLDR ABI.

TDX modules are outgrowing them. A post-quantum signature algorithm
pushes the sigstruct past 4KB, and new module features push the binary
past 496 pages. The P-SEAMLDR ABI was extended for both.

The kernel rejects any image over these limits. TDX modules for Diamond
Rapids exceed them, so without this series, TDX module updates fail on
Diamond Rapids. This series is all that is needed to make them work.

The image format that userspace uploads ('struct tdx_image') is generic
enough and needs no change.

== AI Usage ==

AI was used under supervision to review code and workshop logs.

== Testing ==

Tested on a Diamond Rapids system. Updates with a module larger than 2MB
and an 8KB sigstruct work, which exercises both the chained page list
and version 1 of 'struct seamldr_params'. TDs keep running across
updates.

[1]: https://lore.kernel.org/kvm/20261012094754.27702-1-chao.gao@intel.com/


Chao Gao (2):
  x86/virt/seamldr: Support large TDX module binaries
  x86/virt/seamldr: Support multiple sigstruct pages

 arch/x86/virt/vmx/tdx/seamldr.c | 43 ++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 9 deletions(-)

-- 
2.52.0

